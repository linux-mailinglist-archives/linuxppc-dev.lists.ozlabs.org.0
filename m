Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 146DB31247A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 14:04:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYTrG27JQzDwgD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 00:04:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LiCvSFik; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYTjR5mh6zDvXH
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 23:58:19 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d26so6713731pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 04:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=HRil25UDzKb8yPl0jadwKZl9XNibg+TF1qy+wgizfPA=;
 b=LiCvSFikSJam6dEvCB/xwzNAhj6Xv9B1Wh6n63vtRF9cXaOmdScndiy3N0pj5wc0vn
 v/XFat3KtVxc+b/ye+Y7M0a/9N7rLH3MEoRlOCyoRVYSTZH1qbMMD0E5Jc0zz0pGJWGJ
 axjyyNgdirvgkeKXZgJig1BKOmc++SPpRC8Tbb8t589VwhAC2zX+lZ/dZWApKJpNZZc0
 t+LlyUeLxqqw4ovr6XhECFhPkDia2sv2jBsDeIE9s3FlmB+wgicces+6aPVPCSClRkHD
 7ktwIMt/FNHaj5eYO3/mZtTCCU/qkYkIXrlJM/GnqOhg5kLki+z9LJSEbMnaO0qK8Ygz
 awLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=HRil25UDzKb8yPl0jadwKZl9XNibg+TF1qy+wgizfPA=;
 b=MIWJPKvVEZXEVBSrBa3DFOw7UC3sgWt79cdX8Q8YCOijxn3REz0pdyuiOZprrjZIQJ
 jCKMeu2Lmzbn5spkcnecGEac2o9f6GAxnVrX2B5s643GJO6odjbPj0AEwB8dDc/xhpma
 m5lWZrNWVwxAyECboMthwmBEKgsSm6B07BzblMdwQ/5qy4a7BY7U3LPsg2T0i1M9R7ay
 dXxBObsKYutKDPgKzzC2H+vE/qwwKGr7KbovFlYXhv33GStHP1M5ur5j2Au3YEGJpEqk
 ueFIIIg3Qm7A7FdtetbHm6zgkySU0Hp+JTDxSrcKo2COagDcMcN2/zgnCxjdF4JtBQOq
 R77w==
X-Gm-Message-State: AOAM531dSyVq0C5dmz9b7n5uzKZX68gUsFkFSRJkfM1icl1ZAUUDIJyE
 LGquDSfT/mp8VZva2LrreLxmhtNEbOk=
X-Google-Smtp-Source: ABdhPJyHl5Sb6OeK9Jv3hhyKwvMqFBIfkpt9btCxsfmxeEm+P/7N1rvpcbjHQg4/5TDG+pTwH8P+/Q==
X-Received: by 2002:a62:fc83:0:b029:1d6:1767:dd1c with SMTP id
 e125-20020a62fc830000b02901d61767dd1cmr13199440pfh.70.1612702696408; 
 Sun, 07 Feb 2021 04:58:16 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id c188sm216726pfa.98.2021.02.07.04.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 04:58:15 -0800 (PST)
Date: Sun, 07 Feb 2021 22:58:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 42/42] powerpc/64s: power4 nap fixup in C
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-43-npiggin@gmail.com>
 <878s86dals.fsf@mpe.ellerman.id.au>
In-Reply-To: <878s86dals.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612702622.n8vaboy2dx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of February 2, 2021 8:31 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> There is no need for this to be in asm, use the new intrrupt entry wrapp=
er.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/interrupt.h   | 15 +++++++++
>>  arch/powerpc/include/asm/processor.h   |  1 +
>>  arch/powerpc/include/asm/thread_info.h |  6 ++++
>>  arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>>  arch/powerpc/kernel/idle_book3s.S      |  4 +++
>>  5 files changed, 26 insertions(+), 45 deletions(-)
>=20
> Something in here is making my G5 not boot.
>=20
> I don't know what the problem is because that machine is in the office,
> and I am not, and it has no serial console.
>=20
> I tried turning on pstore but it doesn't record anything :/

Here is an incremental patch (hopefully) should fix it. Should be
folded with this one.

Thanks,
Nick
---
powerpc/64s: nap_adjust_return fix

This is a fix for patch "powerpc/64s: power4 nap fixup in C".

Non-maskable interrupts should not create any exit work, so there
should be no reason to come out of idle. So take the nap fixup out
of NMIs.

The problem with having them here is that an interrupt can come in
and then get interrupted by an NMI, the NMI will then set its return
to the idle wakeup and never complete the regular interrupt handling.

Before the "powerpc/64s: power4 nap fixup in C" patch, this wouldn't
occur because the true NMIs didn't call FIXUP_NAP, and the other
interrupts would call it before running their handler, so they would
not have a chance to call may_hard_irq_enable and allow soft-NMIs
(watchdog, perf) to come through.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/as=
m/interrupt.h
index 25f2420b1965..afdf4aba2e6b 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -12,6 +12,7 @@ static inline void nap_adjust_return(struct pt_regs *regs=
)
 {
 #ifdef CONFIG_PPC_970_NAP
 	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
+		/* Can avoid a test-and-clear because NMIs do not call this */
 		clear_thread_local_flags(_TLF_NAPPING);
 		regs->nip =3D (unsigned long)power4_idle_nap_return;
 	}
@@ -164,7 +165,10 @@ static inline void interrupt_nmi_exit_prepare(struct p=
t_regs *regs, struct inter
 			radix_enabled() || (mfmsr() & MSR_DR))
 		nmi_exit();
=20
-	nap_adjust_return(regs);
+	/*
+	 * nmi does not call nap_adjust_return because nmi should not create
+	 * new work to do (must use irq_work for that).
+	 */
=20
 #ifdef CONFIG_PPC64
 	if (TRAP(regs) !=3D 0x900 && TRAP(regs) !=3D 0xf00 && TRAP(regs) !=3D 0x2=
60)
--=20
2.23.0

