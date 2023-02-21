Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688F69E8EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 21:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLr8x6WQzz3c6s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 07:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QAPvDqbG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QAPvDqbG;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLr7z1ChBz309V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 07:13:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 809CEB80EAC;
	Tue, 21 Feb 2023 20:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15980C433D2;
	Tue, 21 Feb 2023 20:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677010394;
	bh=3A/FrMu2xlKPF+Jo4dq/4j5fAjmi9WU1uUR06tHLn3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAPvDqbGa75qtb2GNz5rFfRHhACXB6+yYOUMOWM6jlTLyN/4/VDflad5a7bNtUwqI
	 yaifhluUTSuviTrndwTB3KTuBMi62sBR+0qDthFZitT2SPWyJnPQdGGO3MJj0gOXDU
	 qDrbdPS5cc4m3N2VPhL8nIV71sqBHlorZKjPNNHpoWDcthhmNjIewMMHSJ0uhQkJXF
	 W5/szkmgkxHU9tz4gsegKet3eRVRoj0IGUIHnbMcPHt4B2+BWOBof2U8Mi28vWpa6L
	 tU75fSyqFWgkU0U8IOppY48kfpRaW35Q789z0kC2IdxU+vTkxmlTHzo94+ArvvB4rR
	 7K8/BOzaOQETA==
Received: by pali.im (Postfix)
	id 36222708; Tue, 21 Feb 2023 21:13:11 +0100 (CET)
Date: Tue, 21 Feb 2023 21:13:11 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Message-ID: <20230221201311.sadp3sq7xr25hcuu@pali>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221194637.28436-1-paul.gortmaker@windriver.com>
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello! I would like to let you know that I have there patch series which
creates one generic machine descriptor for all P2 boards:
https://lore.kernel.org/linuxppc-dev/20230218111405.27688-1-pali@kernel.org/

Basically it allows any P2 board to boot one universal kernel binary
just with correct DTS file. After P2 is merged I was thinking about
looking at P1 boards too.

So I would suggest to do some "big" removal of older code after this is
merged, so I do not have to rebase again my patch series which is
basically cleanup and make maintenance easier.

I understand that removing old machine descriptions with board code for
old boards which nobody use and nobody wants to maintain is logical
step.

But if something like generic machine descriptor for P1 happens too
(like I did for P2 in above patch series), it would mean that the only
board specific information would be stored in DTS files.
And does it make sense to remove just old DTS files? Are there any
maintenance with them? (Do not take it wrong, just I'm asking)
