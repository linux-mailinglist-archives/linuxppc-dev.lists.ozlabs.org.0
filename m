Return-Path: <linuxppc-dev+bounces-15090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77690CE70FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 15:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfzHy4Crfz2xpg;
	Tue, 30 Dec 2025 01:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767018862;
	cv=none; b=b7vDYEXmqO6/4nmmG2xHgrMv7YiSNMq3uaNzzL31wwjLk23fiHBX97bRqaGLVHdwt48jl24Hl4rz94dTLOG0la8+Zi5IwhE90m4boie/wkEUdLc6WwKUwY5Qcg7pyjrfMEnEnrNbcQjP2dNWWtCPVbet+BVLwoaeFtLQ087czbF9kqSQtjWrfShlSt2kez97rjD5iQ7WpQHIdFkK/AAl/G1l/crupWaJyc1uMbLmdm+AKPAF1lHuVZckaKc/kUyy30lGi0roej5S9QxKF3WMVOzwsasIstVmJOEcVYwtTzml+UozvlpGVHGOxsKhi9lFtJsKbDnVVlTasvCXn5nl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767018862; c=relaxed/relaxed;
	bh=VSHKgqobROpoF/3iLsp6Y7ek9yEeFOEONKlgI9POyCo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mDppnZw7VpDB9SPOgKSGadD8UeJGG+FInUvpAOfGmIcnE0Q5pjDxFwGY7HLpbijaskQZjE+jAF5ng87wX8VWWyg2YtZm7UMajnszSpspKQvZ+u6i8tpMAHMR+sfSJKz6eiZBuNvb9ao4OXgVLqhpt6q0sTyNykD9tbAQA1KCU5DeiI7t9br6J1miwiEnG8n4dJpBkC9bEIo7MRzWIOxCgDLgEFSGxrkKtN9lPHqz2/c9lrwqa6wojpNquaG3JZLByMvQ8n0MyaEihp6HC9JydIsCbEIuLsnWSa3YQi8oPsn4UdjWe+uqI6e+PHt6phOcJ8D/qw9ovYDVNG6uX8JMxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=AKyJx/pR; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=AKyJx/pR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 324 seconds by postgrey-1.37 at boromir; Tue, 30 Dec 2025 01:34:18 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfzHt6RHGz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Dec 2025 01:34:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767018853; x=1767623653; i=markus.elfring@web.de;
	bh=VSHKgqobROpoF/3iLsp6Y7ek9yEeFOEONKlgI9POyCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AKyJx/pRBA13IJafKdGQHaIeIBDEJYJFH9GCXCPZWCXytXLZ8uzJZwy151Mi0osP
	 pZF9sf60iPOgvY9t4k/RRbJhWiUQ+U7Qe5e2t9i2hRpPoIVidu8sZK8YV6XRzt1Zb
	 LB7hB1ZezUIMJSzwMnuHilRxlJCRRI2VAJ03dl3S7vGOjdc4Mio3UwmackSJgEUtp
	 VyXtmZw1ZAameOD1101WVDT02U88EHFphZyKlEQYVaujnJ1CnShaSjcFCf4GmSbFE
	 ASupLrvtZVYIa3bFsAofqtWCM5caoHuC4eQ/fl3yt+jOmOtQAoPRbrBghNAUQ2y2x
	 swaF8w6MCPlVleQu7w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.231]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6091-1vXkSj3MOB-008Qml; Mon, 29
 Dec 2025 15:28:30 +0100
Message-ID: <231f6f66-6a3d-4166-9e1a-ae0d5bd7583d@web.de>
Date: Mon, 29 Dec 2025 15:28:27 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, Su Hui <suhui@nfschina.com>,
 linuxppc-dev@lists.ozlabs.org, Christophe Leroy <chleroy@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251224104433.1585576-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2] bus: fsl-mc: fix an error handling in
 fsl_mc_device_add()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251224104433.1585576-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZPCZNywyUWYoGUyLH+tdxaseQOGqT8/KnfouOXI6m3nMmA/gtV3
 qs0W0mUT1WOPuzKwd9ktep87yagWFkLuDCL8/Tco8dj9pH/tBULR4EM4MWxEbnseIYSzPdg
 YXOudrGjyUd9hkmWCgRaMtLgL4TLn/H6EVsPkiOqCxMAbnsvqlVosUta8kY9sYnCjwPWUBK
 v8EWxIf9GHhCRwIPWKvdw==
UI-OutboundReport: notjunk:1;M01:P0:5UOf5DwPfBs=;6t0DyzVopUS86PDQaRymOR2wiqv
 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
 LK1ZYaNigEdSKcP1w=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> If device_add() fails, call put_device() to drop the device
> reference.

Can the word wrapping become nicer?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc3#n659


>            And put_device() triggers fsl_mc_device_release()
> which does the free. Thus just return after call put_device().

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc3#n145

Regards,
Markus

