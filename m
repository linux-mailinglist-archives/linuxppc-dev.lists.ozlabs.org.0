Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEB10553
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 07:50:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v6vL2M2JzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 15:50:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v6t2303JzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 15:49:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44v6t10X4Rz9s9T;
 Wed,  1 May 2019 15:49:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: vakul.garg@nxp.com
Subject: Re: [PATCH] crypto: caam/jr - Remove extra memory barrier during job
 ring dequeue
In-Reply-To: 20190409063505.16664-1-vakul.garg@nxp.com
Date: Wed, 01 May 2019 15:49:44 +1000
Message-ID: <87pnp2aflz.fsf@concordia.ellerman.id.au>
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
Cc: aymen.sghaier@nxp.com, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vakul Garg wrote:
> In function caam_jr_dequeue(), a full memory barrier is used before
> writing response job ring's register to signal removal of the completed
> job. Therefore for writing the register, we do not need another write
> memory barrier. Hence it is removed by replacing the call to wr_reg32()
> with a newly defined function wr_reg32_relaxed().
> 
> Signed-off-by: Vakul Garg <vakul.garg@nxp.com>
> ---
>  drivers/crypto/caam/jr.c   | 2 +-
>  drivers/crypto/caam/regs.h | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c
> index 4e9b3fca5627..2ce6d7d2ad72 100644
> --- a/drivers/crypto/caam/jr.c
> +++ b/drivers/crypto/caam/jr.c
> @@ -266,7 +266,7 @@ static void caam_jr_dequeue(unsigned long devarg)
>  		mb();
>  
>  		/* set done */
> -		wr_reg32(&jrp->rregs->outring_rmvd, 1);
> +		wr_reg32_relaxed(&jrp->rregs->outring_rmvd, 1);
>  
>  		jrp->out_ring_read_index = (jrp->out_ring_read_index + 1) &
>  					   (JOBR_DEPTH - 1);
> diff --git a/drivers/crypto/caam/regs.h b/drivers/crypto/caam/regs.h
> index 3cd0822ea819..9e912c722e33 100644
> --- a/drivers/crypto/caam/regs.h
> +++ b/drivers/crypto/caam/regs.h
> @@ -96,6 +96,14 @@ cpu_to_caam(16)
>  cpu_to_caam(32)
>  cpu_to_caam(64)
>  
> +static inline void wr_reg32_relaxed(void __iomem *reg, u32 data)
> +{
> +	if (caam_little_end)
> +		writel_relaxed(data, reg);
> +	else
> +		writel_relaxed(cpu_to_be32(data), reg);
> +}
> +
>  static inline void wr_reg32(void __iomem *reg, u32 data)
>  {
>  	if (caam_little_end)

This crashes on my p5020ds. Did you test on powerpc?

# first bad commit: [bbfcac5ff5f26aafa51935a62eb86b6eacfe8a49] crypto: caam/jr - Remove extra memory barrier during job ring dequeue

Log:

  ------------[ cut here ]------------
  kernel BUG at drivers/crypto/caam/jr.c:191!
  Oops: Exception in kernel mode, sig: 5 [#1]
  BE PAGE_SIZE=4K SMP NR_CPUS=24 CoreNet Generic
  Modules linked in:
  CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.1.0-rc1-gcc-8.2.0-00060-gbbfcac5ff5f2 #31
  NIP:  c00000000079d704 LR: c00000000079d498 CTR: c000000000086914
  REGS: c0000000fffc7970 TRAP: 0700   Not tainted  (5.1.0-rc1-gcc-8.2.0-00060-gbbfcac5ff5f2)
  MSR:  0000000080029000 <CE,EE,ME>  CR: 28008484  XER: 00000000
  IRQMASK: 0
  GPR00: c00000000079d6b0 c0000000fffc7c00 c000000000fbc800 0000000000000001
  GPR04: 000000007e080080 000000000000ffc0 0000000000000001 00000000000067d7
  GPR08: 00000000880401a9 0000000000000000 0000000000000001 00000000fa83b2da
  GPR12: 0000000028008224 c00000003ffff800 c000000000fc20b0 0000000000000100
  GPR16: 8920f09520bea117 c000000000def480 0000000000000000 0000000000000001
  GPR20: c000000000fc3940 c0000000f3537e18 0000000000000001 c000000001026cc5
  GPR24: 0000000000000001 c0000000f3328000 0000000000000001 c0000000f3451010
  GPR28: 0000000000000000 0000000000000001 0000000000000000 0000000000000000
  NIP [c00000000079d704] .caam_jr_dequeue+0x2f0/0x410
  LR [c00000000079d498] .caam_jr_dequeue+0x84/0x410
  Call Trace:
  [c0000000fffc7c00] [c00000000079d6b0] .caam_jr_dequeue+0x29c/0x410 (unreliable)
  [c0000000fffc7cd0] [c00000000004fef0] .tasklet_action_common.isra.3+0xac/0x180
  [c0000000fffc7d80] [c000000000a2f99c] .__do_softirq+0x174/0x3f8
  [c0000000fffc7e90] [c00000000004fb94] .irq_exit+0xc4/0xdc
  [c0000000fffc7f00] [c000000000007348] .__do_irq+0x8c/0x1b0
  [c0000000fffc7f90] [c0000000000150c4] .call_do_irq+0x14/0x24
  [c0000000f3137930] [c0000000000074e4] .do_IRQ+0x78/0xd4
  [c0000000f31379c0] [c000000000019998] exc_0x500_common+0xfc/0x100
  --- interrupt: 501 at .book3e_idle+0x24/0x5c
      LR = .book3e_idle+0x24/0x5c
  [c0000000f3137cc0] [c00000000000a6a4] .arch_cpu_idle+0x34/0xa0 (unreliable)
  [c0000000f3137d30] [c000000000a2f2e8] .default_idle_call+0x5c/0x70
  [c0000000f3137da0] [c000000000084210] .do_idle+0x1b0/0x1f4
  [c0000000f3137e40] [c000000000084434] .cpu_startup_entry+0x28/0x30
  [c0000000f3137eb0] [c000000000021538] .start_secondary+0x59c/0x5b0
  [c0000000f3137f90] [c00000000000045c] start_secondary_prolog+0x10/0x14
  Instruction dump:
  7d284a14 e9290018 2fa90000 40de001c 3bbd0001 57bd05fe 7d3db050 712901ff
  7fbd07b4 40e2ffcc 93b500dc 4bffff94 <0fe00000> 78890022 79270020 41d600ec
  ---[ end trace 7bedbdf37a95ab35 ]---

That's hitting:

		/* we should never fail to find a matching descriptor */
		BUG_ON(CIRC_CNT(head, tail + i, JOBR_DEPTH) <= 0);

cheers
