Return-Path: <linuxppc-dev+bounces-2071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FE9990CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:40:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdq115HGz3bnB;
	Fri, 11 Oct 2024 05:40:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728585613;
	cv=none; b=gYb2w1EIFcRIzOeC74XXFCwvCQAfHRsO4OFGiaECJsji1wu/OOrXLcL5/H4uCn5bwyRy/I26V116xsMWK+J+IA5aMBgQQyUoHJWC4FfmNJTDnyhirB7elxtxZQAG1HQmPD03BN2lmC4XDkXn9ikpoOcOKBHbTJpeUl8fbL0z5lydRj08ZM7deil3Mcyb4nRNC9InKOYtaba8AkEOAMPcw7ReO0rFqh9ZSeMlh+ZIpym3c0pC8efgntuW7mwQig1Td2aVadJO+IstvCekkh8qRBaCGg0UjNAs5oJ1cZOfimapY8lOBX5dU23BH+pCgbz8XZLLVYfUE0ZZSDFuHvAhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728585613; c=relaxed/relaxed;
	bh=JkZIzm6yM9oBODaH+nVS1uOBNTNX7S0/en++n2JI7wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8JiAydqiZ08CCZbROaR5jYXCmTZg0h4fcU6Zkto3AZPBP9U2WLmuMOiLyxRQZ5DcKLVR01YCLf+L0O7ssCNoV9MjeSOISnfLcMMzoBQN7FzwOpuynbN7CGv1JdcHHTzGx/MbAZqgoatbaSMCwoQ/635KBYQGaLGuZ+AwXogMTEGd8TrpC2kAOdhBi2I1yoTBlNbVBB9cXpAKccY2lZdlI5sHulgjSnjJ2gUeAIdr7uq2FRZuy73lObBoWhoyUTEucpMF8bc+lwmYXhUBa7yazjpc6W0ObD9jCYaXIYmDA1roexC0D5rIdT7/Z+ZrhjZKkBnW5Nb0fIgvlbachR+IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdpz224jz307y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:40:09 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49AIah2T000379;
	Thu, 10 Oct 2024 13:36:43 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 49AIahkn000376;
	Thu, 10 Oct 2024 13:36:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 10 Oct 2024 13:36:42 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: Flag VDSO64 entry points as functions
Message-ID: <20241010183642.GF29862@gate.crashing.org>
References: <b6ad2f1ee9887af3ca5ecade2a56f4acda517a85.1728512263.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6ad2f1ee9887af3ca5ecade2a56f4acda517a85.1728512263.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 12:17:57AM +0200, Christophe Leroy wrote:
> On powerpc64 as shown below by readelf, vDSO functions symbols have
> type NOTYPE.

> To overcome that, commit ba83b3239e65 ("selftests: vDSO: fix vDSO
> symbols lookup for powerpc64") was applied to have selftests also
> look for NOTYPE symbols, but the correct fix should be to flag VDSO
> entry points as functions.

> For ABI v2, there is no function descriptors and VDSO functions can
> safely have function type.
> 
> So lets flag VDSO entry points as functions and revert the
> selftest change.

> diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
> index 7650b6ce14c8..8d972bc98b55 100644
> --- a/arch/powerpc/include/asm/vdso.h
> +++ b/arch/powerpc/include/asm/vdso.h
> @@ -25,6 +25,7 @@ int vdso_getcpu_init(void);
>  #ifdef __VDSO64__
>  #define V_FUNCTION_BEGIN(name)		\
>  	.globl name;			\
> +	.type name,@function; 		\
>  	name:				\
>  
>  #define V_FUNCTION_END(name)		\

Ha cool!  Excellent.  Thank you :-)

Reviewed-By: Segher Boessenkool <segher@kernel.crashing.org>


Segher

