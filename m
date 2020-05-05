Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D31C4BDC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 04:20:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GNjp5z7lzDqXb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 12:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GNhB0Lz1zDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 12:19:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GNh91dPKz9sSx;
 Tue,  5 May 2020 12:19:05 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 19/28] powerpc/xmon: Move insertion of breakpoint for
 xol'ing
Date: Tue, 05 May 2020 12:19:04 +1000
Message-ID: <2015143.6yaIr3PIRM@townsend>
In-Reply-To: <20200501034220.8982-20-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-20-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I can't see any side-effects from patching both instructions at the same time.

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:11 PM AEST Jordan Niethe wrote:
> When a new breakpoint is created, the second instruction of that
> breakpoint is patched with a trap instruction. This assumes the length
> of the instruction is always the same. In preparation for prefixed
> instructions, remove this assumption. Insert the trap instruction at the
> same time the first instruction is inserted.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/xmon/xmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 1947821e425d..fb2563079046 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -878,7 +878,6 @@ static struct bpt *new_breakpoint(unsigned long a)
>  		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
>  			bp->address = a;
>  			bp->instr = (void *)(bpt_table + ((bp - bpts) * BPT_WORDS));
> -			patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
>  			return bp;
>  		}
>  	}
> @@ -910,6 +909,7 @@ static void insert_bpts(void)
>  			continue;
>  		}
>  		patch_instruction(bp->instr, instr);
> +		patch_instruction((void *)bp->instr + ppc_inst_len(instr),
> ppc_inst(bpinstr)); if (bp->enabled & BP_CIABR)
>  			continue;
>  		if (patch_instruction((struct ppc_inst *)bp->address,




