Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E804B3786
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 11:51:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X1hz3FWrzF4Rw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 19:51:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X1ff2166zF3yr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 19:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="oGRkaMBD"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46X1fc4hJ7z9sN1;
 Mon, 16 Sep 2019 19:49:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568627352;
 bh=jsKmdD25O7E7b6MGCfKrIW2+0mm8jyNIg2YUIThNMJA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oGRkaMBD72FH7Cn8BXHVlyi/oQ+HpD0kkFBDnkP5XIIZiu1N9KVyioRwdc+NKUDDX
 6i+svqkVcZ5fpGih0vUqDZazxbl/DC6l8jPSU6ZjfIi9dxZ7cfxcE59fR8/qPSvasr
 PvVGAlp4KhpjzehlRzRvH9jtomjw17fL/jEz/wFmPs+VXQW8AXOwpR6lfhA+l4dDtP
 GekrBf7jE4tvS3fjuY76DlGmr/0pkAFetaKwNFNMBpL+WzndVoUWfzM+mvbHFoLmVV
 LBJeQXcQ86PDgTc/bpfjTl52OQUZQ4DBpMHIqrY6Oa+lNcNMEVz/gvIvwgZEKwJpry
 vJR3Y23FnI1wQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] PPC: Set reserved PCR bits
In-Reply-To: <20190910060102.21597-1-alistair@popple.id.au>
References: <20190910060102.21597-1-alistair@popple.id.au>
Date: Mon, 16 Sep 2019 19:49:26 +1000
Message-ID: <877e68tvtl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alistair Popple <alistair@popple.id.au>, Joel Stanley <joel@jms.id.au>,
 Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <alistair@popple.id.au> writes:
> Currently the reserved bits of the Processor Compatibility Register
> (PCR) are cleared as per the Programming Note in Section 1.3.3 of
> version 3.0B of the Power ISA. This causes all new architecture
> features to be made available when running on newer processors with
> new architecture features added to the PCR as bits must be set to
> disable a given feature.
>
> For example to disable new features added as part of Version 2.07 of
> the ISA the corresponding bit in the PCR needs to be set.
>
> As new processor features generally require explicit kernel support
> they should be disabled until such support is implemented. Therefore
> kernels should set all unknown/reserved bits in the PCR such that any
> new architecture features which the kernel does not currently know
> about get disabled.
>
> An update is planned to the ISA to clarify that the PCR is an
> exception to the Programming Note on reserved bits in Section 1.3.3.
>
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> Tested-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Added some clarifications to the commit message
> ---
>  arch/powerpc/include/asm/reg.h          |  3 +++
>  arch/powerpc/kernel/cpu_setup_power.S   |  6 ++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c       |  3 ++-
>  arch/powerpc/kvm/book3s_hv.c            | 11 +++++++----
>  arch/powerpc/kvm/book3s_hv_nested.c     |  6 +++---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 10 ++++++----
>  6 files changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 10caa145f98b..258435c75c43 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -475,6 +475,7 @@
>  #define   PCR_VEC_DIS	(1ul << (63-0))	/* Vec. disable (bit NA since POWER8) */
>  #define   PCR_VSX_DIS	(1ul << (63-1))	/* VSX disable (bit NA since POWER8) */
>  #define   PCR_TM_DIS	(1ul << (63-2))	/* Trans. memory disable (POWER8) */
> +#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)

This doesn't build with old binutils that don't support 'ul', eg:

  arch/powerpc/kvm/book3s_hv_rmhandlers.S:647: Error: junk at end of line, first unrecognized character is `u'
  arch/powerpc/kvm/book3s_hv_rmhandlers.S:647: Error: missing ')'
  arch/powerpc/kvm/book3s_hv_rmhandlers.S:647: Error: junk at end of line: `ul<<(63-0))|(1ul<<(63-1))|(1ul<<(63-2)))|(0x8|0x4|0x2)))>>32)@h'
  arch/powerpc/kernel/cpu_setup_power.S:131: Error: syntax error; found `u', expected `,'
  arch/powerpc/kernel/cpu_setup_power.S:131: Error: junk at end of line: `ul<<(63-0))|(1ul<<(63-1))|(1ul<<(63-2)))|(0x8|0x4|0x2)))@l'

etc. http://kisskb.ellerman.id.au/kisskb/buildresult/13957233/ 

There's a gcc-4.6 with an old binutils on the ka's.

cheers
