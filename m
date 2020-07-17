Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F406223109
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 04:10:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7F2v0tqLzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 12:10:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Egxk7JOl; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7F0x5qWDzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 12:09:05 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id k5so4754060plk.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 19:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mQWYymg3Pd104pis2IhNsO9+PGw6QeS8PPO1z8GPhKU=;
 b=Egxk7JOl9gTuD/ij8L5Z+QdUNjD6rS5I4dbUaFxT9YB/DO6NtUZ4GrFIvtDcgb/UiE
 1g24XG/sAho5PkdtN6RIHDgPYGqpEQYDKgWhFClzNOrThg1Z680paSueuL1u3kARBAu2
 fFfhEapKANjqVgXwmBpESUkBuKVEj8U3HabNAyl9ru+Jz6tTiJwAGKbIcmaa/6glLhjW
 dYOzUVXh/k4GKD8jcN7qGadaW7PkTPBZKMgK0k0Vv4kZbkdGLKUZcUJVlTHVcrbah4Za
 sXM8RIiEqsYMphf/2hu5z5oKSDn2+cDiA7h/233tUmB47TDl1780Kby+e/NDMRY5Enk9
 P8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mQWYymg3Pd104pis2IhNsO9+PGw6QeS8PPO1z8GPhKU=;
 b=nSxrQYfw3tk4qZcWmdtx7s8SM4+BndYO7WxB4vS0607dMnRTBwD1UyylJ7dbUjflQd
 XDLlJrYWsEv2HICro2jFmAUhaAstWTPb5FHx4F/ZVw10sMHl/7/viINfNRRikx4hkGzR
 0qWULGjQuUnxN3FWdPQg7kxr7Mh233yQ2pNcMZVdxDzITOYZmGZeWUIBCPzp9cEldeaI
 6kfvULsnTzGulpUTO/H1WfnyhKaeGRdtGjyN3C23VDZVKbV3z3HA+YwNvYesEQxoao92
 he4YAUq+G193zXgP0AE7bbaLYna1lsuljxtxrJxdi99bx0x4vRf4wTwYhbgbQ9EgLFHW
 P3SQ==
X-Gm-Message-State: AOAM532Lo0U3kP6JBQ9Cj/tX2lSapKNMsoAeLVDvQ0nbIU0WxM0L1oh5
 H4qAuhVrQY27mUmOtVLzFJs=
X-Google-Smtp-Source: ABdhPJzP0xNtaCRHw3hyyHrEYTdSzBXrrQeWoDh62VLKiCP3NT+QW5A1sY59sdtOJ7DJOkumHrhkag==
X-Received: by 2002:a17:902:c697:: with SMTP id
 r23mr6151150plx.35.1594951742115; 
 Thu, 16 Jul 2020 19:09:02 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id j17sm5888154pgn.87.2020.07.16.19.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 19:09:01 -0700 (PDT)
Date: Fri, 17 Jul 2020 12:08:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
To: Bharata B Rao <bharata@linux.ibm.com>, Qian Cai <cai@lca.pw>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
 <20200716172713.GA4565@lca.pw>
In-Reply-To: <20200716172713.GA4565@lca.pw>
MIME-Version: 1.0
Message-Id: <1594950229.jn9ipe6td1.astroid@bobo.none>
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
Cc: sfr@canb.auug.org.au, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Qian Cai's message of July 17, 2020 3:27 am:
> On Fri, Jul 03, 2020 at 11:06:05AM +0530, Bharata B Rao wrote:
>> Hypervisor may choose not to enable Guest Translation Shootdown Enable
>> (GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
>> permitted to use instructions like tblie and tlbsync directly, but is
>> expected to make hypervisor calls to get the TLB flushed.
>>=20
>> This series enables the TLB flush routines in the radix code to
>> off-load TLB flushing to hypervisor via the newly proposed hcall
>> H_RPT_INVALIDATE.=20
>>=20
>> To easily check the availability of GTSE, it is made an MMU feature.
>> The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
>> handle GTSE as an optionally available feature and to not assume GTSE
>> when radix support is available.
>>=20
>> The actual hcall implementation for KVM isn't included in this
>> patchset and will be posted separately.
>>=20
>> Changes in v3
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - Fixed a bug in the hcall wrapper code where we were missing setting
>>   H_RPTI_TYPE_NESTED while retrying the failed flush request with
>>   a full flush for the nested case.
>> - s/psize_to_h_rpti/psize_to_rpti_pgsize
>>=20
>> v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@l=
inux.ibm.com/T/#t
>>=20
>> Bharata B Rao (2):
>>   powerpc/mm: Enable radix GTSE only if supported.
>>   powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
>>     enabled
>>=20
>> Nicholas Piggin (1):
>>   powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
>>     !GTSE
>=20
> Reverting the whole series fixed random memory corruptions during boot on
> POWER9 PowerNV systems below.

If I s/mmu_has_feature(MMU_FTR_GTSE)/(1)/g in radix_tlb.c, then the .o
disasm is the same as reverting my patch.

Feature bits not being set right? PowerNV should be pretty simple, seems
to do the same as FTR_TYPE_RADIX.

So... test being done before static keys are set up? Shouldn't be. Must
be something obvious I just can't see it.

Thanks,
Nick

