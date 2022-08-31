Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E095A7799
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 09:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHbbt4cnGz3c96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 17:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XNLGfVMe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XNLGfVMe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHbb30Z8Rz3c1N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 17:36:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAB09618D1;
	Wed, 31 Aug 2022 07:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3DDC433D7;
	Wed, 31 Aug 2022 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661931386;
	bh=PX8yHkSXE5BpbH8BEhvTKLqiAUGh7txekQ/EyKnH4NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNLGfVMeHc6+owM+kwZbEmwwTPhTUuG3byEEMSNqekF/heVsxs8ZNrv6HzIcqos9C
	 TnaTErhphNAHn5LxHKg9+Q0bC0UOPCLtHpeYB35/8gACT3gEB7il+/F8K6bRH5+Bct
	 t/Hund6Nrx9CRx7SCxgS/Wps/0GBMYP/Ip7pvE3j3SbV6qEyq1dSGuXn6bk8qVfDMv
	 yMZcAkH53B+em349skOP1K7zUM5/F9iLaExTUiOPgRKoBdrLFwvcdsbyJ78cwzymvw
	 1fmPLy+FydaCg4THlVwDviNyK10rvof1mPnxwtnH6imJLeY/iQ1HjUwOftlu7GHusi
	 PI4loU1gCX0Ow==
Received: by pali.im (Postfix)
	id F3DA6855; Wed, 31 Aug 2022 09:36:22 +0200 (CEST)
Date: Wed, 31 Aug 2022 09:36:22 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Message-ID: <20220831073622.5bp3ftf3fkea5rdk@pali>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220830230012.9429-1-pali@kernel.org>
 <373fdedb-447e-b552-df83-737267068296@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <373fdedb-447e-b552-df83-737267068296@linaro.org>
User-Agent: NeoMutt/20180716
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 31 August 2022 10:31:22 Krzysztof Kozlowski wrote:
> On 31/08/2022 02:00, Pali Rohár wrote:
> > This new optional priority property allows to specify custom priority level
> > of reset device. Default level was always 192.
> 
> You still did not explain why do we need this. You only explained what
> you did here, which is obvious and visible from the diff. What you
> should explain is why you are doing it, what problem you are solving.
> 
> Best regards,
> Krzysztof

Look at patch 3/3, thanks.
