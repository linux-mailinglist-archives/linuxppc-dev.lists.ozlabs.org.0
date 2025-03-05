Return-Path: <linuxppc-dev+bounces-6725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDAFA4FB9B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 11:18:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z77mv2nskz3bqD;
	Wed,  5 Mar 2025 21:18:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741169919;
	cv=none; b=WSEhuuHO4ULjWQOtI3/IlQN7VgvA9AioLp0kHMRnQnqyXXBSGX1gWcnmQu+XOOafOFJXKyOwtDmNf7DmGZgzonM839Xv/zgkMBTRdkRVYE3a10Jp5a88ERrltrbn6U2fFmPF/CJKlwj1Br33TRRBtMbOECQOawFJzYf+knr4mB6AK7d0Z5KXRXDOnR4wAPvfD5pqDWeYO9m+w73/ptdN+B/J4y/1mLWcyeEl+baYzBsfzIlBH0pF9K/srh5pXTldhkgGmvmovDe+Zcw9gK0nxfo440QnrPpAR2C/J+BlAvMEcxSCFJsgdXb2nMZnVnqIwTAS/9duE0cIFLwUZmb9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741169919; c=relaxed/relaxed;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkZUj7cTBmGMzVXIh4z52KWEudssqfVg0CEvqMOUkuYtJfuHMvz3A8ude/G1uIWXRmI2TEKHaw+OBAxMi+RzmxbwMSgSPk1QJQcBGee1twVuSYlrbuSgPw4litqr8g2S39qHVnm/vMdJ2Kv5UGiG0wLzIkP/FKCDXXFGAPi1eADFmoCwHxkhwBewE+4hpMo+zbnVP32W4QtrxjbqUmPf3GvtaA0ZhZqkeMmz8ZBdTYeM10IPp9Adpk3tls+H4Q06bHs5qd7VAlsD4KvWyOvQrTTmo5NOhYsyoHd7YOPnFVlEEpptlQ8uYuziZI/q7SXnMT2VU4HzBib7iVVQSU8pYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVElypjc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kabel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVElypjc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kabel@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z77mt3pnBz3bnr;
	Wed,  5 Mar 2025 21:18:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 956E0A40EFC;
	Wed,  5 Mar 2025 10:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4705FC4CEE2;
	Wed,  5 Mar 2025 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741169915;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVElypjcaIYX5rKtiv06hcSXy4HstFjKOeRhShpFjk2Jel2eSkA/O0uK8Wninv5/a
	 hI5Ui+51QY9Sc5wOaelsMqqEki8iPKL/7clrg37rGARtPtuO5FAtalmSz/cR624zt9
	 twTkQB6/0FugO2QSLBDkRJ1MULKIVW+tzVSg6Ccu0iGgHjhAUJfebciXlktocUXdn0
	 bbIXddxhOqHs7IDCCnaG84EzsvIT+/+FsZux9DQ1iCMoMbwVVWuwRuT4u+s9e3MuJC
	 lkrQutRMyjpWtEs6QOIxSX4h5Qvjsi5oAAXmBv854hriyofgHQ/0kVmCe+F7yX5KZc
	 9wpnC/K5XUGSQ==
Date: Wed, 5 Mar 2025 11:18:23 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, krzk@kernel.org, mazziesaccount@gmail.com, 
	thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org, 
	support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andy@kernel.org, paul@crapouillou.net, 
	alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi George,

why is armada_37xx_wdt also here?
The stop function in that driver may not sleep.

Marek

