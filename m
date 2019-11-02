Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B26ECE20
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 11:47:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474wjz01WmzF5Lc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 21:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474wgh74JLzF71n
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 21:45:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="jU8HtMgP"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 474wgf5b5jz9sP3;
 Sat,  2 Nov 2019 21:45:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572691520;
 bh=Jtyqd/wuFAS1+Aoh4ImFCwFhrDrs+nQrk2XwCSuohFM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jU8HtMgPJ5LVOjaQcPJMyylrWpWUU1hddriM0diG7HPFhaqMSKxA47FydNm0U3BE2
 7BOLrxB9DPxAEzRxBiGhApn4cLGOF/Ml2YMDs3ua2+fUlqmnefxqyeYqeF1EcbgLxi
 XsnnFrXMxEUbIAzBD1enonawlvRDZ18ZvtL1TZ8Re1el5XkHNn1U9se5Ch4VpbBgYb
 6GxBJmnV9ADH6BfdClBQsuQb31o/6yB2HYM1hiLRyoxOf5mB9rMv5GzWdHyA+vvWwP
 lzzN+hrl024/OdwXL1S/yRGgKO2IlYjC/ba/kMkd/qEstWj8PfWUg+bm58oc10thsw
 wrAXoNSVTSfGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] powerpc/kprobes: Mark newly allocated probes as RO
In-Reply-To: <20191030073111.140493-3-ruscur@russell.cc>
References: <20191030073111.140493-1-ruscur@russell.cc>
 <20191030073111.140493-3-ruscur@russell.cc>
Date: Sat, 02 Nov 2019 21:45:18 +1100
Message-ID: <8736f636bl.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:
> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
> kernel log during boot.
>
> powerpc doesn't implement its own alloc() for kprobes like other
> architectures do, but we couldn't immediately mark RO anyway since we do
> a memcpy to the page we allocate later.  After that, nothing should be
> allowed to modify the page, and write permissions are removed well
> before the kprobe is armed.
>
> Thus mark newly allocated probes as read-only once it's safe to do so.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/kernel/kprobes.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..2610496de7c7 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -24,6 +24,7 @@
>  #include <asm/sstep.h>
>  #include <asm/sections.h>
>  #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
>  
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -131,6 +132,8 @@ int arch_prepare_kprobe(struct kprobe *p)
>  			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
>  	}
>  
> +	set_memory_ro((unsigned long)p->ainsn.insn, 1);
> +

That comes from:
	p->ainsn.insn = get_insn_slot();


Which ends up in __get_insn_slot() I think. And that looks very much
like it's going to hand out multiple slots per page, which isn't going
to work because you've just marked the whole page RO.

So I would expect this to crash on the 2nd kprobe that's installed. Have
you tested it somehow?

I think this code should just use patch_instruction() rather than
memcpy().

cheers
