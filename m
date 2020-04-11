Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A01A5B99
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 01:54:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490BYR5QBSzDqDD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 09:54:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=auj0hqYc; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490B8b4CvqzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Apr 2020 09:35:57 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id s202so1364168oih.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 16:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FOIrhfa5I+n7DVdFa8ydZMzj2s25vzXCYLjLMUsM8Y4=;
 b=auj0hqYczFVPzuyzWNDkZFK7lITUYTbX8Wn9sipVdURP2z3YEAX91KmHvPL07FXSWQ
 xik0o8D5cHLTcFfGB4j7xHMSNOXgi0Zp/pr9d6MPC+qYQvgpn4TCq7LV4hLhLr0qBI1v
 wqdyYV1DqS052H6WpIB1x+wqnuDITgkb8XcgaxuSGsVmbykYJk8Owk6jarkpFEL6bPNq
 mboa0aKpvLlgi52Hgo3uZgqvCB3Zbie5nBjUqrib+vNmUtzpQUcBuLSf5nbXcggX+SHW
 0XYoxifAHAaBJH3AbI7rmFTvdcPqVAYqvBbRIcwqcoZ63/m5ISMJsONzGyRMMhjgAUgH
 gx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FOIrhfa5I+n7DVdFa8ydZMzj2s25vzXCYLjLMUsM8Y4=;
 b=ACNdXfQw+4vsaIXIt4CUEw9BzKMfR3TbJiripKXORxvbrYAwBCTXVICoajbR00rgkz
 iNR0jhJ+cij+XfawFwrPcIIW4uxuwEbcZdHeNSQ39zm4IrNByJul02N+/lOH82PXijcy
 53oiPdE9iTHPfKLV+soL1x3QuQX5LekuxRsfuL4xRjzgfPZgi04K0Ss98hiQKIQcS/BO
 ZqDCmaEZHVV8EY6iOWZb5NBlRd0V4I7KsaHjg3g+Zh02vzOFh9r0faTJtetIwjehx4Bt
 TaDLS1wV63JVuNYtrGx+QfuRnion8owZVKi+/stsXoOrkDXwtpyJvOzwx05GgyeFSgMi
 bL+A==
X-Gm-Message-State: AGi0Puav321RjUXu9l4fi7p4yVF+2yVTFc/6lSFYSvkNd4vD1wv2ZZtf
 d36Om6i0HKUpVSp3nxkphLU=
X-Google-Smtp-Source: APiQypKkfyJ5NFiSf6+E4JFzIzGRYPoWc6gdg8pREBBsEFuDxCZRnacAfldjAvLBtCRUEikv/MWAHQ==
X-Received: by 2002:aca:2806:: with SMTP id 6mr7800691oix.135.1586648153184;
 Sat, 11 Apr 2020 16:35:53 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id n38sm3487564otn.26.2020.04.11.16.35.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 11 Apr 2020 16:35:52 -0700 (PDT)
Date: Sat, 11 Apr 2020 16:35:51 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
Message-ID: <20200411233551.GA34862@ubuntu-s3-xlarge-x86>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
 <1586597161.xyshvdbjo6.astroid@bobo.none>
 <1586612535.6kk4az03np.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586612535.6kk4az03np.astroid@bobo.none>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: qemu-devel@nongnu.org, clang-built-linux@googlegroups.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 11, 2020 at 11:57:23PM +1000, Nicholas Piggin wrote:
> Nicholas Piggin's on April 11, 2020 7:32 pm:
> > Nathan Chancellor's on April 11, 2020 10:53 am:
> >> The tt.config values are needed to reproduce but I did not verify that
> >> ONLY tt.config was needed. Other than that, no, we are just building
> >> either pseries_defconfig or powernv_defconfig with those configs and
> >> letting it boot up with a simple initramfs, which prints the version
> >> string then shuts the machine down.
> >> 
> >> Let me know if you need any more information, cheers!
> > 
> > Okay I can reproduce it. Sometimes it eventually recovers after a long
> > pause, and some keyboard input often helps it along. So that seems like 
> > it might be a lost interrupt.
> > 
> > POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
> > sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
> > needed your other config with various other debug options.
> > 
> > Thanks for the very good report. I'll let you know what I find.
> 
> It looks like a qemu bug. Booting with '-d int' shows the decrementer 
> simply stops firing at the point of the hang, even though MSR[EE]=1 and 
> the DEC register is wrapping. Linux appears to be doing the right thing 
> as far as I can tell (not losing interrupts).
> 
> This qemu patch fixes the boot hang for me. I don't know that qemu 
> really has the right idea of "context synchronizing" as defined in the
> powerpc architecture -- mtmsrd L=1 is not context synchronizing but that
> does not mean it can avoid looking at exceptions until the next such
> event. It looks like the decrementer exception goes high but the
> execution of mtmsrd L=1 is ignoring it.
> 
> Prior to the Linux patch 3282a3da25b you bisected to, interrupt replay
> code would return with an 'rfi' instruction as part of interrupt return,
> which probably helped to get things moving along a bit. However it would
> not be foolproof, and Cedric did say he encountered some mysterious
> lockups under load with qemu powernv before that patch was merged, so
> maybe it's the same issue?
> 
> Thanks,
> Nick
> 
> The patch is a bit of a hack, but if you can run it and verify it fixes
> your boot hang would be good.

Yes, with this patch applied on top of 5.0.0-rc2 and using the
pseries-3.1 and powernv8 machines, I do not see any hangs with a clang
built kernel at b032227c62939b5481bcd45442b36dfa263f4a7c across 100
boots.

If you happen to send it upstream:

Tested-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for looking into it!

> ---
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b207fb5386..1d997f5c32 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4364,12 +4364,21 @@ static void gen_mtmsrd(DisasContext *ctx)
>      if (ctx->opcode & 0x00010000) {
>          /* Special form that does not need any synchronisation */
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
> +        gen_update_nip(ctx, ctx->base.pc_next);
> +        gen_helper_store_msr(cpu_env, t1);
>          tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +        /* Must stop the translation as machine state (may have) changed */
> +        /* Note that mtmsr is not always defined as context-synchronizing */
> +        gen_stop_exception(ctx);
> +
>      } else {
>          /*
>           * XXX: we need to update nip before the store if we enter

Cheers,
Nathan
