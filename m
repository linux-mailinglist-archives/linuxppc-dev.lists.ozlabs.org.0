Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B262D9239
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 05:16:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvSl872m7zDqSf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 15:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sKJgfr14; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvSjK26pTzDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 15:15:13 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id t22so1854321pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 20:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IzItAb+/ARuy43MHZHytVoSiTjlxsOWc+L7HYoQ10Rk=;
 b=sKJgfr148BjRYzX/HwC2xkFZ/0a4TrXgBfen9ZN7lMaB7SW+itnsNCLU5d5WxIzZKl
 kwewH+B/EglrOnw8364mXmCmlESywVsBZn47nEoggNeEIwqyeoIQRpvlItqsgt5BDygy
 /dXfwAKnD3GaI+f9n+q+YAwYnJJDiXtatldgOufQJnvB8u1gDNb3Gtnav0ozT96zps19
 Q4mpXyjS94Mkjp7DcfEUhjkvGqmfg5SdCEpblMmXy+XbEYFPUSbJGuYPI5htzzEK3tS5
 1KCdV3Vt7wXNb2B5be0n6lSrozvn+VwrxAqGKSt9wLA+Gfm+fH9Dmb2cDf+Mxzy9CTv4
 vbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IzItAb+/ARuy43MHZHytVoSiTjlxsOWc+L7HYoQ10Rk=;
 b=E6VxBQPxp0CSPW1us6qntW9+iYJxax0m0xDNYsavM42ZAVSh3UvIsKo4isUdL3CMwW
 ba9VM9rPB+FBWM7rKzlPtCGZ8u20wJO4HoiRhtSxQZsnMQNx11MKE3NfL+xtSm2UP91k
 D5VvS+w6QkopRhxPKw8QkoPq7oqMvQyx9MVd6f1YO/YevH2NEZMDQdOh/HcldZeTj3O1
 IqSLPEV/KsbREXfwefKc93YiiYsHoX3XpS1gKJZ2CByV30DV4RmAVTkZKEz3RGViHdIV
 GTNqyHSNGmZzp6QNxJanW9SFjhiguHDEBKgi5tb/1k86GKpmqC/LbdMOBXMntxrwGV9c
 s5WQ==
X-Gm-Message-State: AOAM5326h+QjhE0y9WtPBhuqtlvBlUKY+suVAmrQEm4iCz/De+Q1zyB0
 EKBMw1zDPVj2duuwKiAsNck=
X-Google-Smtp-Source: ABdhPJwLQFbwEuJx28XaT9yTVmY+be361/iJueWiQXXjL88/5Em8DZdjWZlNmRscq1PPBt2c5dGrKg==
X-Received: by 2002:a63:5d5f:: with SMTP id o31mr19870693pgm.295.1607919310176; 
 Sun, 13 Dec 2020 20:15:10 -0800 (PST)
Received: from localhost ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id ft19sm7668399pjb.44.2020.12.13.20.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 20:15:09 -0800 (PST)
Date: Mon, 14 Dec 2020 14:15:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64s: Trim offlined CPUs from mm_cpumasks
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20201120025757.325930-1-npiggin@gmail.com>
 <20201120025757.325930-3-npiggin@gmail.com>
 <CAMuHMdUdorW03=mipgm92SXNPBZO5owW1Wp6_SacRDZ7fOe9gw@mail.gmail.com>
In-Reply-To: <CAMuHMdUdorW03=mipgm92SXNPBZO5owW1Wp6_SacRDZ7fOe9gw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1607919238.kj439g85v5.astroid@bobo.none>
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
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anton Vorontsov <anton.vorontsov@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Geert Uytterhoeven's message of December 10, 2020 7:06 pm:
> Hi Nicholas,
>=20
> On Fri, Nov 20, 2020 at 4:01 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> When offlining a CPU, powerpc/64s does not flush TLBs, rather it just
>> leaves the CPU set in mm_cpumasks, so it continues to receive TLBIEs
>> to manage its TLBs.
>>
>> However the exit_flush_lazy_tlbs() function expects that after
>> returning, all CPUs (except self) have flushed TLBs for that mm, in
>> which case TLBIEL can be used for this flush. This breaks for offline
>> CPUs because they don't get the IPI to flush their TLB. This can lead
>> to stale translations.
>>
>> Fix this by clearing the CPU from mm_cpumasks, then flushing all TLBs
>> before going offline.
>>
>> These offlined CPU bits stuck in the cpumask also prevents the cpumask
>> from being trimmed back to local mode, which means continual broadcast
>> IPIs or TLBIEs are needed for TLB flushing. This patch prevents that
>> situation too.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Thanks for your patch!
>=20
>> --- a/arch/powerpc/platforms/powermac/smp.c
>> +++ b/arch/powerpc/platforms/powermac/smp.c
>> @@ -911,6 +911,8 @@ static int smp_core99_cpu_disable(void)
>>
>>         mpic_cpu_set_priority(0xf);
>>
>> +       cleanup_cpu_mmu_context();
>> +
>=20
> I guess this change broke pmac32_defconfig+SMP in v5.10-rc7?
>=20
> arch/powerpc/platforms/powermac/smp.c: error: implicit
> declaration of function 'cleanup_cpu_mmu_context'
> [-Werror=3Dimplicit-function-declaration]:  =3D> 914:2
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/14423174/

Hey, yeah it does thanks for catching it. This patch fixes it for me

---
From a9b5ec92ffac975e81c6d7db6ff2b1486b2723f7 Mon Sep 17 00:00:00 2001
From: Nicholas Piggin <npiggin@gmail.com>
Date: Mon, 14 Dec 2020 13:52:39 +1000
Subject: [PATCH] powerpc/32s: Fix cleanup_cpu_mmu_context() compile bug

32s has no tlbiel_all() defined, so just disable the cleanup with a
comment.

Fixes: 01b0f0eae081 ("powerpc/64s: Trim offlined CPUs from mm_cpumasks")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powermac/smp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms=
/powermac/smp.c
index adae2a6712e1..66ef5f8f4445 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -911,7 +911,16 @@ static int smp_core99_cpu_disable(void)
=20
 	mpic_cpu_set_priority(0xf);
=20
+	/*
+	 * Would be nice for consistency if all platforms clear mm_cpumask and
+	 * flush TLBs on unplug, but the TLB invalidation bug described in
+	 * commit 01b0f0eae081 ("powerpc/64s: Trim offlined CPUs from
+	 * mm_cpumasks") only applies to 64s and for now we only have the TLB
+	 * flush code for that platform.
+	 */
+#ifdef CONFIG_PPC64
 	cleanup_cpu_mmu_context();
+#endif
=20
 	return 0;
 }
--=20
2.23.0

