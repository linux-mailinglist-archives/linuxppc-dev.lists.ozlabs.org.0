Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CCE1A526F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 16:01:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zxPX466czDqfs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 00:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DMp+YOud; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zxKN11LGzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 23:57:41 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o1so975658pjs.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=CA2EXUjq+Smems++Ma6jf28vZQyf783AuJ5tepKvzfA=;
 b=DMp+YOudHyMCAXvEqVuaa7+96e2O9c2iSlraMUG5+nS0bzsiqt1LHYUO008HNzla+0
 aeYOaDj25zqXFdSnSa4F4BkJnuMbRC+SwNhRwjkCjIgAbLL8Zxl1ozzB9/sQd/JbliHF
 RK0FFcoBrnHA/dwgb2Nl95LobnwMnsnZJpu3+XD4l4N5PUL7p6mBnlG4T/z4BiQb+crv
 nWgzTlGEWo9shdYkxql16SVt208OFvM5O4Q4LVL+1H5PIDxoENgev8tFyY7Xu+DurRd4
 CjgOUyG0q+bum4jmYFS+jutZoukYDzQ8XUkBaLPIsdwN3tR4UI6d2pD4P4qYikuyJxo5
 h5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=CA2EXUjq+Smems++Ma6jf28vZQyf783AuJ5tepKvzfA=;
 b=Hlx8Fwh30FOJwIO69+2jc1OE3Roj4j0sGVExojAsUz6269CbIZT1BzUcFMVdOZ7Gew
 wajOYl76nlkx4+5psDog+kzoEUzi/yHsE58YefqSclfnvMLus4F3wcvNr1OlLwdLyvRt
 uRWz3D6kJctHr4Jd+Odz2ttYAiukjUGdJbJZ4SWpRHv7PInIRSFrvxVa3Fe/ILJyg4ni
 h6wvLiHjKdeNa+o7SrIOytlxKFHxUI/8kHUu4F8S7ewdzqUDbwIGMF4YqVrlm6Y7lT9S
 Feacv0rj0IJ5HXpMWa/BEM9kPLEaPx8NAKuIObqZY5ankWTfxdXJkEjHSdfpRRzK2t3F
 B7+Q==
X-Gm-Message-State: AGi0PuZfjgHCAvbum/Kc0ZzJrQyOnhUZNUEnYfLchwtd/91FEcRZPiYi
 koUhafbW+A58lxib/uD0x0c=
X-Google-Smtp-Source: APiQypKJZjPQepDzedFgjgZHVNHo13y3VmhECU+Qh9O1RVtKp3jSMqIMYo0qxruFCc1cg2vyLVnXxg==
X-Received: by 2002:a17:90b:1985:: with SMTP id
 mv5mr11349089pjb.69.1586613458322; 
 Sat, 11 Apr 2020 06:57:38 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id u18sm4380454pfl.40.2020.04.11.06.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 06:57:37 -0700 (PDT)
Date: Sat, 11 Apr 2020 23:57:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
 <1586597161.xyshvdbjo6.astroid@bobo.none>
In-Reply-To: <1586597161.xyshvdbjo6.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586612535.6kk4az03np.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on April 11, 2020 7:32 pm:
> Nathan Chancellor's on April 11, 2020 10:53 am:
>> The tt.config values are needed to reproduce but I did not verify that
>> ONLY tt.config was needed. Other than that, no, we are just building
>> either pseries_defconfig or powernv_defconfig with those configs and
>> letting it boot up with a simple initramfs, which prints the version
>> string then shuts the machine down.
>>=20
>> Let me know if you need any more information, cheers!
>=20
> Okay I can reproduce it. Sometimes it eventually recovers after a long
> pause, and some keyboard input often helps it along. So that seems like=20
> it might be a lost interrupt.
>=20
> POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
> sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
> needed your other config with various other debug options.
>=20
> Thanks for the very good report. I'll let you know what I find.

It looks like a qemu bug. Booting with '-d int' shows the decrementer=20
simply stops firing at the point of the hang, even though MSR[EE]=3D1 and=20
the DEC register is wrapping. Linux appears to be doing the right thing=20
as far as I can tell (not losing interrupts).

This qemu patch fixes the boot hang for me. I don't know that qemu=20
really has the right idea of "context synchronizing" as defined in the
powerpc architecture -- mtmsrd L=3D1 is not context synchronizing but that
does not mean it can avoid looking at exceptions until the next such
event. It looks like the decrementer exception goes high but the
execution of mtmsrd L=3D1 is ignoring it.

Prior to the Linux patch 3282a3da25b you bisected to, interrupt replay
code would return with an 'rfi' instruction as part of interrupt return,
which probably helped to get things moving along a bit. However it would
not be foolproof, and Cedric did say he encountered some mysterious
lockups under load with qemu powernv before that patch was merged, so
maybe it's the same issue?

Thanks,
Nick

The patch is a bit of a hack, but if you can run it and verify it fixes
your boot hang would be good.
---

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b207fb5386..1d997f5c32 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4364,12 +4364,21 @@ static void gen_mtmsrd(DisasContext *ctx)
     if (ctx->opcode & 0x00010000) {
         /* Special form that does not need any synchronisation */
         TCGv t0 =3D tcg_temp_new();
+        TCGv t1 =3D tcg_temp_new();
         tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
                         (1 << MSR_RI) | (1 << MSR_EE));
-        tcg_gen_andi_tl(cpu_msr, cpu_msr,
+        tcg_gen_andi_tl(t1, cpu_msr,
                         ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
-        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
+        tcg_gen_or_tl(t1, t1, t0);
+
+        gen_update_nip(ctx, ctx->base.pc_next);
+        gen_helper_store_msr(cpu_env, t1);
         tcg_temp_free(t0);
+        tcg_temp_free(t1);
+        /* Must stop the translation as machine state (may have) changed *=
/
+        /* Note that mtmsr is not always defined as context-synchronizing =
*/
+        gen_stop_exception(ctx);
+
     } else {
         /*
          * XXX: we need to update nip before the store if we enter
=
