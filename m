Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA62D96F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 12:06:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvdqd34ptzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 22:06:21 +1100 (AEDT)
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
 header.s=20161025 header.b=Lq669Sqv; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvdnH58gCzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 22:04:17 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id t8so11861836pfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 03:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=giOKidC9koKbUCA23vFcqUz66kzKhj7G43+rbP55W1Q=;
 b=Lq669SqvkvMuTktRXXiRsU5TldllIx3Uqe67TuFsslWmurjDTftGmgIFTCv3LM+ytt
 Oun1j+y3J28/kG6u0nO80ix5eqMOB0CFE9d0I6RTnQSaxaQAtGwYOUtnaT4Hn0sBaElp
 8c/lJFLeHxsEfkoI3cAUuCqpcIvnOK+wkxodEOJOsyWSis4S/8C/IHIwrkXX+UXnPioW
 4ROutlW/IaLa4jkMEC7+dxgomMqA8mZEc4Ws/MVupQBrKyJ8eZxPwO+Y8L9Ljo3dtxmI
 FkwreZImnjfRhzJUxonQCgqq5rsyfE2k6gT71v2/JZwuAf2alfqOiS+JHpKQ/Blhq3ch
 jtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=giOKidC9koKbUCA23vFcqUz66kzKhj7G43+rbP55W1Q=;
 b=tNRpUclkUo85yiCTbPZVuQqX6cchjLrEo9KDMle57sIaIaSTWklsroLdcopL62PR5k
 aNFFJVyhJGy8yKZ3zhDG3V9IQJQyAFvkgCIM06/ffHFE30FTPETDlxFQsZsoBiqZ3ckp
 QLzJEkHAlFdU55XyeIQ91HwySkb95SEKfXXQ74C6c+2ujmMO9Xrv9cO1GFV7W/3Ilv9q
 u01oMOWKSH8rOBhBDxy7bumP7lczEW6oaWWtQbTeM+w3vRVKEqh38lcvKS52GvGjs6kL
 f2nccvQ7bFCBlHEg0nP1KnELe3c3evC6/BYQuaQ6EVq2haHaRVoSNcwZV3Y1XEHHoOKH
 MBEQ==
X-Gm-Message-State: AOAM531AlYBCVZFNBDrk02Ae31KUEBIj/tmmmcLdc6fwLuJmcUwIeCmn
 q0QBfdKzurZhgqymekai2UE=
X-Google-Smtp-Source: ABdhPJwumjWaIWUY8c2o3q91Ja5o96+pEAQQlVCvtSje50/bfmNrhO7ELnmk5cBKo4zsRbRfgCmGKg==
X-Received: by 2002:aa7:959a:0:b029:1a1:ffc5:531d with SMTP id
 z26-20020aa7959a0000b02901a1ffc5531dmr13277998pfj.27.1607943854398; 
 Mon, 14 Dec 2020 03:04:14 -0800 (PST)
Received: from localhost ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id k21sm18458132pfu.7.2020.12.14.03.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 03:04:13 -0800 (PST)
Date: Mon, 14 Dec 2020 21:04:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64s: Trim offlined CPUs from mm_cpumasks
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20201120025757.325930-1-npiggin@gmail.com>
 <20201120025757.325930-3-npiggin@gmail.com>
 <CAMuHMdUdorW03=mipgm92SXNPBZO5owW1Wp6_SacRDZ7fOe9gw@mail.gmail.com>
 <1607919238.kj439g85v5.astroid@bobo.none>
 <87h7oozn06.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7oozn06.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1607943765.29hccd2b8p.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of December 14, 2020 8:43 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Geert Uytterhoeven's message of December 10, 2020 7:06 pm:
>>> Hi Nicholas,
>>>=20
>>> On Fri, Nov 20, 2020 at 4:01 AM Nicholas Piggin <npiggin@gmail.com> wro=
te:
>>>>
>>>> When offlining a CPU, powerpc/64s does not flush TLBs, rather it just
>>>> leaves the CPU set in mm_cpumasks, so it continues to receive TLBIEs
>>>> to manage its TLBs.
>>>>
>>>> However the exit_flush_lazy_tlbs() function expects that after
>>>> returning, all CPUs (except self) have flushed TLBs for that mm, in
>>>> which case TLBIEL can be used for this flush. This breaks for offline
>>>> CPUs because they don't get the IPI to flush their TLB. This can lead
>>>> to stale translations.
>>>>
>>>> Fix this by clearing the CPU from mm_cpumasks, then flushing all TLBs
>>>> before going offline.
>>>>
>>>> These offlined CPU bits stuck in the cpumask also prevents the cpumask
>>>> from being trimmed back to local mode, which means continual broadcast
>>>> IPIs or TLBIEs are needed for TLB flushing. This patch prevents that
>>>> situation too.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>=20
>>> Thanks for your patch!
>>>=20
>>>> --- a/arch/powerpc/platforms/powermac/smp.c
>>>> +++ b/arch/powerpc/platforms/powermac/smp.c
>>>> @@ -911,6 +911,8 @@ static int smp_core99_cpu_disable(void)
>>>>
>>>>         mpic_cpu_set_priority(0xf);
>>>>
>>>> +       cleanup_cpu_mmu_context();
>>>> +
>>>=20
>>> I guess this change broke pmac32_defconfig+SMP in v5.10-rc7?
>>>=20
>>> arch/powerpc/platforms/powermac/smp.c: error: implicit
>>> declaration of function 'cleanup_cpu_mmu_context'
>>> [-Werror=3Dimplicit-function-declaration]:  =3D> 914:2
>>>=20
>>> http://kisskb.ellerman.id.au/kisskb/buildresult/14423174/
>>
>> Hey, yeah it does thanks for catching it. This patch fixes it for me
>>
>> ---
>> From a9b5ec92ffac975e81c6d7db6ff2b1486b2723f7 Mon Sep 17 00:00:00 2001
>> From: Nicholas Piggin <npiggin@gmail.com>
>> Date: Mon, 14 Dec 2020 13:52:39 +1000
>> Subject: [PATCH] powerpc/32s: Fix cleanup_cpu_mmu_context() compile bug
>>
>> 32s has no tlbiel_all() defined, so just disable the cleanup with a
>> comment.
>=20
> Or what about just:

That works, I kind of wanted it in there explicit that we don't
clean up on 32s. I don't mind if you prefer this though.

Thanks,
Nick

>=20
> diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc=
/include/asm/book3s/32/mmu-hash.h
> index 331187661236..685c589e723f 100644
> --- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
> @@ -94,6 +94,7 @@ typedef struct {
>  } mm_context_t;
>=20
>  void update_bats(void);
> +static inline void cleanup_cpu_mmu_context(void) { };
>=20
>  /* patch sites */
>  extern s32 patch__hash_page_A0, patch__hash_page_A1, patch__hash_page_A2=
;
>=20
>=20
> cheers
>=20
>=20
