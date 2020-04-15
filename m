Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB21A944C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 09:32:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492DZS3YTnzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 17:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.150.175; helo=13.mo7.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2356 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Apr 2020 17:29:35 AEST
Received: from 13.mo7.mail-out.ovh.net (13.mo7.mail-out.ovh.net
 [87.98.150.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492DWg4qhXzDr0t
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 17:29:31 +1000 (AEST)
Received: from player797.ha.ovh.net (unknown [10.110.208.160])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 25D8415C196
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 08:50:11 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id 98C70D5CDE8E;
 Wed, 15 Apr 2020 06:49:58 +0000 (UTC)
Subject: Re: [EXTERNAL] [PATCH] target/ppc: Fix mtmsr(d) L=1 variant that
 loses interrupts
To: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
References: <20200414111131.465560-1-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <74e47708-fcc0-d3db-5f6b-2a513722fef9@kaod.org>
Date: Wed, 15 Apr 2020 08:49:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414111131.465560-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12583901784752425818
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrfedvgdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinhepphhrohhofhhpohhinhhtrdgtohhmpdhmshhgtddtkedviedrhhhtmhhlpddvtdekfedtuddrhhhtmhhlpdhhrghnugihrdhtrghrghgvthenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: qemu-stable@nongnu.org, qemu-ppc@nongnu.org,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/14/20 1:11 PM, Nicholas Piggin wrote:
> If mtmsr L=1 sets MSR[EE] while there is a maskable exception pending,
> it does not cause an interrupt. This causes the test case to hang:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Dppc_2019-2D10_msg00826.html&d=DwIDAg&c=jf_iaSHvJObTbx-siA1ZOg&r=XHJsZhhuWSw9713Fp0ciew&m=TQfi_v-8XYgz7MiMDAZ_CjkyalSh9-EXhQ3oDesUm74&s=pFoesXbioVBh5wCuzEnzwgfze6X7e-a9unkfUgsRwiw&e= 
> 
> More recently, Linux reduced the occurance of operations (e.g., rfi)
> which stop translation and allow pending interrupts to be processed.
> This started causing hangs in Linux boot in long-running kernel tests,
> running with '-d int' shows the decrementer stops firing despite DEC
> wrapping and MSR[EE]=1.
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.ozlabs.org_pipermail_linuxppc-2Ddev_2020-2DApril_208301.html&d=DwIDAg&c=jf_iaSHvJObTbx-siA1ZOg&r=XHJsZhhuWSw9713Fp0ciew&m=TQfi_v-8XYgz7MiMDAZ_CjkyalSh9-EXhQ3oDesUm74&s=EhkRfxvQMomvneYweWDEIUktCkKykgIqEmdhA0PtiwU&e= 
> 
> The cause is the broken mtmsr L=1 behaviour, which is contrary to the
> architecture. From Power ISA v3.0B, p.977, Move To Machine State Register,
> Programming Note states:
> 
>     If MSR[EE]=0 and an External, Decrementer, or Performance Monitor
>     exception is pending, executing an mtmsrd instruction that sets
>     MSR[EE] to 1 will cause the interrupt to occur before the next
>     instruction is executed, if no higher priority exception exists
> 
> Fix this by handling L=1 exactly the same way as L=0, modulo the MSR
> bits altered.
> 
> The confusion arises from L=0 being "context synchronizing" whereas L=1
> is "execution synchronizing", which is a weaker semantic. However this
> is not a relaxation of the requirement that these exceptions cause
> interrupts when MSR[EE]=1 (e.g., when mtmsr executes to completion as
> TCG is doing here), rather it specifies how a pipelined processor can
> have multiple instructions in flight where one may influence how another
> behaves.

I was expecting more changes but this looks fine. 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> Cc: qemu-stable@nongnu.org
> Reported-by: Anton Blanchard <anton@ozlabs.org>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

I gave it a try on PowerNV, pseries and mac99. All good.

Tested-by: Cédric Le Goater <clg@kaod.org>

I don't know how we could include tests in QEMU such as the one Anton 
sent. These are good exercisers for our exception model.

Thanks,

C. 

> ---
> Thanks very much to Nathan for reporting and testing it, I added his
> Tested-by tag despite a more polished patch, as the the basics are 
> still the same (and still fixes his test case here).
> 
> This bug possibly goes back to early v2.04 / mtmsrd L=1 support around
> 2007, and the code has been changed several times since then so may
> require some backporting.
> 
> 32-bit / mtmsr untested at the moment, I don't have an environment
> handy.
>
> 
>  target/ppc/translate.c | 46 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b207fb5386..9959259dba 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4361,30 +4361,34 @@ static void gen_mtmsrd(DisasContext *ctx)
>      CHK_SV;
>  
>  #if !defined(CONFIG_USER_ONLY)
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
>      if (ctx->opcode & 0x00010000) {
> -        /* Special form that does not need any synchronisation */
> +        /* L=1 form only updates EE and RI */
>          TCGv t0 = tcg_temp_new();
> +        TCGv t1 = tcg_temp_new();
>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>                          (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> +        tcg_gen_andi_tl(t1, cpu_msr,
>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> +        tcg_gen_or_tl(t1, t1, t0);
> +
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +
>      } else {
>          /*
>           * XXX: we need to update nip before the store if we enter
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
>          gen_update_nip(ctx, ctx->base.pc_next);
>          gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
> -        /* Must stop the translation as machine state (may have) changed */
> -        /* Note that mtmsr is not always defined as context-synchronizing */
> -        gen_stop_exception(ctx);
>      }
> +    /* Must stop the translation as machine state (may have) changed */
> +    gen_stop_exception(ctx);
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  }
>  #endif /* defined(TARGET_PPC64) */
> @@ -4394,15 +4398,23 @@ static void gen_mtmsr(DisasContext *ctx)
>      CHK_SV;
>  
>  #if !defined(CONFIG_USER_ONLY)
> -   if (ctx->opcode & 0x00010000) {
> -        /* Special form that does not need any synchronisation */
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    if (ctx->opcode & 0x00010000) {
> +        /* L=1 form only updates EE and RI */
>          TCGv t0 = tcg_temp_new();
> +        TCGv t1 = tcg_temp_new();
>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>                          (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> +        tcg_gen_andi_tl(t1, cpu_msr,
>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> +        tcg_gen_or_tl(t1, t1, t0);
> +
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +
>      } else {
>          TCGv msr = tcg_temp_new();
>  
> @@ -4411,9 +4423,6 @@ static void gen_mtmsr(DisasContext *ctx)
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
>          gen_update_nip(ctx, ctx->base.pc_next);
>  #if defined(TARGET_PPC64)
>          tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 32);
> @@ -4422,10 +4431,9 @@ static void gen_mtmsr(DisasContext *ctx)
>  #endif
>          gen_helper_store_msr(cpu_env, msr);
>          tcg_temp_free(msr);
> -        /* Must stop the translation as machine state (may have) changed */
> -        /* Note that mtmsr is not always defined as context-synchronizing */
> -        gen_stop_exception(ctx);
>      }
> +    /* Must stop the translation as machine state (may have) changed */
> +    gen_stop_exception(ctx);
>  #endif
>  }
>  
> 

