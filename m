Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFD5865EB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 09:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lx9S81tCyz3bc3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 17:56:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XHyqkREM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XHyqkREM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lx9RV14mwz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 17:56:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 029EE60EDF;
	Mon,  1 Aug 2022 07:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339F0C433C1;
	Mon,  1 Aug 2022 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659340562;
	bh=x3Fg/Rbx8Ng7EwGIUGb7gYjJKq38W2VLLAiBUTzBwUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHyqkREMjXZIALfQgy1Cu/GsXenY3wYf/Xd1OB/ULWO1vihVUAOjYJFOaB/WF1FgR
	 RRwKpChPwxguNRW8WaqI3SZt1oIfWI11BOkBb//PHn30D3i81qpyB9fjst8p42BNcG
	 cHSZ3bKZ/+QmRE3ZeXIZqkGPZAnAcb7zSRJIeFCVou519sO+IVI6xxk78aBLErFUba
	 8rmz4SG8igePx24OQgcQe7YSXMF9PDZUg+q5MhuMkIRqIZh/fVSGbR393/shz85pTM
	 2d/rtw7iXNLlA09em4VH46l2yWlPxXmjRDwcx30bldkSm7A2D8NzZ7HYf+PPPv/NQm
	 In9HFGRtVt2RQ==
Received: by pali.im (Postfix)
	id 14C3D75F; Mon,  1 Aug 2022 09:55:59 +0200 (CEST)
Date: Mon, 1 Aug 2022 09:55:58 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT
 nodes
Message-ID: <20220801075558.jdkaegjjzexhe7kl@pali>
References: <20220504180822.29782-1-pali@kernel.org>
 <165909977761.253830.2305727219055135050.b4-ty@ellerman.id.au>
 <CAL_JsqJZ6s4qU+Yt4CCj3q-Fk_MKEddx5aLKu15NLnTbgMyRGA@mail.gmail.com>
 <87k07sbpl3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k07sbpl3.fsf@mpe.ellerman.id.au>
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
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 01 August 2022 13:38:32 Michael Ellerman wrote:
> Rob Herring <robh+dt@kernel.org> writes:
> > On Fri, Jul 29, 2022 at 7:17 AM Michael Ellerman
> > <patch-notifications@ellerman.id.au> wrote:
> >>
> >> On Wed, 4 May 2022 20:08:22 +0200, Pali Rohár wrote:
> >> > DT law_trgt_if property defines Local Access Window Target Interface.
> >> >
> >> > Local Access Window Target Interface is used for identifying individual
> >> > peripheral and mapping its memory to CPU. Interface id is defined by
> >> > hardware itself.
> >> >
> >> > U-Boot uses law_trgt_if DT property in PCIe nodes for configuring memory
> >> > mapping of individual PCIe controllers.
> >> >
> >> > [...]
> >>
> >> Applied to powerpc/next.
> >>
> >> [1/1] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT nodes
> >>       https://git.kernel.org/powerpc/c/1f00b5ab992c122c51bc37662b3b4df5963462f3
> >
> > Why? Minimally, it needs a vendor prefix and s/_/-/ as I commented.
> 
> OK. I misread your "maybe that's fine" as approval.
> 
> Pali can you send a fixup patch please?
> 
> cheers

No I cannot. This is how this property is used by bootloaders for at
least 10 years. There are underlines (not hyphens) and there is no
vendor prefix.
