Return-Path: <linuxppc-dev+bounces-13729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02203C3096B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 11:49:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14wC5TZCz3bfM;
	Tue,  4 Nov 2025 21:49:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762253387;
	cv=none; b=I7eu8ochJG+7TM0UBBZTgM3TJ7xsd10//yXSkXXslmIRPVFVVtb9SKMCp/FEwJ6XGDfMvIvkUzcsNMNVtM4Hdc3KzWKpJiBJ3LeohmYBn6WfMBPa9oibe2ZMiKF3fK/zh4EXrupovz6T5/XDRN6TVqDNZpgjq3QdEBF+w6QDefgXXI57Kufu0WcH3kBUVJyMQs4A9ogfgkr1BOc53xmGqNC6cAeZxb4dLEixoYbEs6Lk0SNry3fiCEZrx7hwYj90AmxvQ/7LO7cefya6Z/Ai96FbG3t6W5LDdSoPBhdR7hfp3+xbXVUKSRbGua2MlVY6CuuhwnOt1OyWsWk5PxHtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762253387; c=relaxed/relaxed;
	bh=/V8SB8wmxGRLK9NXekCk5M/b8yuKeNKq7vKtXV2cr44=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=VvQkt+aj4QHw1hI3xOB6x6ftPVOGcOw/8ml3JZXX5PTZiwk8fJvv7ijjC9du9mhOoC6whEHNpY1HX27+Z2k8InTUnurYd/821YLm9hLM3CslRutJnseAMswYZjWA2SfwQ7XAHjbw0m17mAqMoa075FKCNyOM/qO1drtjMjjmsc7NAELy7Ue0xr5iR7UrbzYqiYv38+5LqO8wVJ1jRHB9EwAH4ASEdvYMCecP89gW3SGks1viFSA6TM4/qeyvefwfi2Wawe6ziBcgrOdjZsPyUNj9VmiO4lb3Wb/LjTB5xSg+YrUeeyeg1s6Jw88YGurudCM1AAs63f+ejSof7pb6iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=azbv334T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=azbv334T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d14wB6KR9z304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 21:49:45 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4755442a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 02:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762253384; x=1762858184; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V8SB8wmxGRLK9NXekCk5M/b8yuKeNKq7vKtXV2cr44=;
        b=azbv334T1ZidYzviuVYZnlpfTBNbojyu7JbBD011ECQwilWnvFdtZQbPEvQ7IZ/bTU
         SiTbbxcSw9IJYDh+18QJL/tOZsgHCPGbPjhQo2anHY3eVqLhK5yGlyk4QGhm/QfiXuPk
         eJrs8PxjWQtkHz96y1UuEPY15hiDR/hnKBFytJWC3cLfMumK4Mhar6NC9eKQjDAsDnXH
         MfQ6ct2smiBz/PbsDiIcpx/HrSoCp1Lrn9WlAQDDsu/iR8H/2QplIvBCTU6bDp6Z80H1
         2GgwG6Str1CzpsWoc77FcHODVjQCoE0bLCnK9RHmOOMn3PvCuaXuKCc5NHF+Win85VG+
         VU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253384; x=1762858184;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V8SB8wmxGRLK9NXekCk5M/b8yuKeNKq7vKtXV2cr44=;
        b=roqjBgTlZTpeOS1b5a/uXZKEpXlvzNIXRF0mJRkJ3dCrWj9r+HUSqBfHBQSluqgKTL
         EYKSn7is5zIat9nDKEI/2NZprNEiwAjdl1GKnsDG2930AnFzWKQn30DRvfAZaLAFRvAB
         TBhmEM3GSvQnX8wHcs5o0XuHMWoVQrTpiNFgirG0hcB6Wj90oYiUZuzCIurIvjvnp9tw
         lg6o/YcAiYoO8ti2tjsI5F54Qrv8LSzANggca2DpLTpyGaNpSoKaWz/z0litlOWMFiSm
         rditjWhvLe8Ml8fxGbiN+zgSkl/n05nYg4P8gigzsnRkVdLHxaEe8D8EuXOoKAKXN/B/
         xOqg==
X-Forwarded-Encrypted: i=1; AJvYcCVpJNEgrcao7P8VM23ogX3AAKLn7tnp9zC46DyoT54SjRMFIFcULoADypokrxpG3+Zj4bBPPEnOq21G52I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6SbKSkjFuuMXqROk5YR8CWf2F4rmXFmzRfjjkheywJy7jYeVG
	LGpp/Sm3jdFLiQxmvKFU9Mi1jzfE1aAm1apgR3fb7AtJJ4GwMEFOElrT
X-Gm-Gg: ASbGncuXmSCzC8kAYz30WO43/sCgSgnLj2L33kn2sz3eMiwdP6LgIRA0YmWX/SE7GJQ
	f6RTg+MaFjl4uPG4ecjgb+3fgRymMHnLRW16hvvjPGoaYipqVqgYD7Ge70//nRJDtE4pnJHAYOY
	b6owjmMZCQB+5nRbS2Rq3UtqidVAfXMOqtk/3f9UL7AJ0PaY2aBsHbB2J9ueq+E6HW6dGD9UGXT
	Jjrie69MFSG9yQwKQA67wynZbUaLdDsZYOAipJuGsS238aOI85vD8oTFCpjt0MDgKVuyy8PUV+P
	J+mQVuiuP0B1le+zi6+hXlnhWul7SoFm/I2E1wG0D6KrXxMOzaEuQyX9XlLJPzj2BoxtpKbSJCs
	AJ6VPn14f78s+YfKPPxzphlZE38yh80+qgn2JPny0JtP4SrLygcWP78NCeb2+0+uuUaw6kQ==
X-Google-Smtp-Source: AGHT+IEagjfzqDQ2E+D55TWI8za2FrJkZx2pQcUSw191Qy4tAKklb54PYaJ30Q+8E39qVOw+FKMedw==
X-Received: by 2002:a05:6a20:9389:b0:334:9b5d:388e with SMTP id adf61e73a8af0-348cac871bemr23688992637.26.1762253383649;
        Tue, 04 Nov 2025 02:49:43 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1e7983986sm2078634a12.0.2025.11.04.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:49:42 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <ea44849c-9d0f-43cc-9476-42bc619728f6@linux.ibm.com>
Date: Tue, 04 Nov 2025 15:54:44 +0530
Message-ID: <87v7jq3xjn.ritesh.list@gmail.com>
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com> <87y0on4ebh.ritesh.list@gmail.com> <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com> <ea44849c-9d0f-43cc-9476-42bc619728f6@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> On 04/11/25 10:48, Sourabh Jain wrote:
>>
>>
>> On 03/11/25 15:40, Ritesh Harjani (IBM) wrote:
>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>
>>>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>>>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>>>> implement reserve_crashkernel_cma") added CMA support for kdump
>>>> crashkernel reservation.
>>>>
>>>> Extend crashkernel CMA reservation support to powerpc.
>>>>
>>>> The following changes are made to enable CMA reservation on powerpc:
>>>>
>>>> - Parse and obtain the CMA reservation size along with other 
>>>> crashkernel
>>>>    parameters
>>>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
>>>> - Include the CMA-reserved ranges in the usable memory ranges for the
>>>>    kdump kernel to use.
>>>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>>>    prevent them from being exported through /proc/vmcore.
>>>>
>>>> With the introduction of the CMA crashkernel regions,
>>>> crash_exclude_mem_range() needs to be called multiple times to exclude
>>>> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
>>>> avoid repetitive logic for validating mem_ranges size and handling
>>>> reallocation when required, this functionality is moved to a new 
>>>> wrapper
>>>> function crash_exclude_mem_range_guarded().
>>>>
>>>> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
>>>> after pageblock_order is initialized.
>>>>
>>>> Update kernel-parameters.txt to document CMA support for crashkernel on
>>>> powerpc architecture.
>>>>
>>>> Cc: Baoquan he <bhe@redhat.com>
>>>> Cc: Jiri Bohac <jbohac@suse.cz>
>>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>>>> Cc: kexec@lists.infradead.org
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>> Changlog:
>>>>
>>>> v3 -> v4
>>>>   - Removed repeated initialization to tmem in
>>>>     crash_exclude_mem_range_guarded()
>>>>   - Call crash_exclude_mem_range() with right crashk ranges
>>>>
>>>> v4 -> v5:
>>>>   - Document CMA-based crashkernel support for ppc64 in 
>>>> kernel-parameters.txt
>>>> ---
>>>>   .../admin-guide/kernel-parameters.txt         |  2 +-
>>>>   arch/powerpc/include/asm/kexec.h              |  2 +
>>>>   arch/powerpc/kernel/setup-common.c            |  4 +-
>>>>   arch/powerpc/kexec/core.c                     | 10 ++++-
>>>>   arch/powerpc/kexec/ranges.c                   | 43 
>>>> ++++++++++++++-----
>>>>   5 files changed, 47 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt 
>>>> b/Documentation/admin-guide/kernel-parameters.txt
>>>> index 6c42061ca20e..0f386b546cec 100644
>>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>>> @@ -1013,7 +1013,7 @@
>>>>               It will be ignored when crashkernel=X,high is not used
>>>>               or memory reserved is below 4G.
>>>>       crashkernel=size[KMG],cma
>>>> -            [KNL, X86] Reserve additional crash kernel memory from
>>>> +            [KNL, X86, ppc64] Reserve additional crash kernel 
>>>> memory from
>>> Shouldn't this be PPC and not ppc64?
>>>
>>> If I see the crash_dump support...
>>>
>>> config ARCH_SUPPORTS_CRASH_DUMP
>>>     def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>>>
>>> The changes below aren't specific to ppc64 correct?
>>
>> The thing is this feature is only supported with KEXEC_FILE and which 
>> only supported on PPC64:
>>
>> config ARCH_SUPPORTS_KEXEC_FILE
>>     def_bool PPC64
>>
>> Hence I kept it as ppc64.
>>

I am not much familiar with the kexec_load v/s kexec_file_load
internals. Maybe because of that I am unable to clearly understand your
above points.

But let me try and explain what I think you meant :)

We first call "get_usable_memory_ranges(&umem)" which updates the usable
memory ranges in "umem". We then call "update_usable_mem_fdt(fdt, umem)"
which updates the FDT for the kdump kernel's fdt to inform about these
usable memory ranges to the kdump kernel.

Now since your patch only does that in get_usable_memory_range(), this
extra CMA reservation is mainly only useful when the kdump load happens
via kexec_file_load(), (because get_usable_memory_range() only gets
called from kexec_file_load() path)

Is this what you meant here?


>> I think I should update that in the commit message.
>>
>> Also do you think is it good to restrict this feature to KEXEC_FILE?
>
> Putting this under KEXEC_FILE may not help much because KEXEC_FILE is 
> enabled
> by default in most configurations. Once it is enabled, the CMA 
> reservation will
> happen regardless of which system call is used to load the kdump kernel
> (kexec_load or kexec_file_load).
>

What I understood from the feature was that, on the normal production
kernel this feature crashkernel=xM,cma allows to reserve an extra xMB of
memory as a CMA region for kdump kernel's memory allocations. But this
CMA reservation would happen in the normal kernel itself during
setup_arch() -> kdump_cma_reserve().. 

And this CMA reservation happens irrespective of whether the kdump
kernel will get loaded via whichever system call.

> However, not restricting this feature to KEXEC_FILE will allow the kexec 
> tool to
> independently add support for this feature in the future for the kexec_load
> system call.

Sure.

>
> With that logic, I think if we do not restrict this feature to 
> KEXEC_FILE, the support
> will be available for ppc and not limited to ppc64.
>

Yes, that make sense.

If one doesn't want to make the CMA reservation, then we need not pass
the extra cmdline argument and no reservation will be made. So, no need
to restrict this to PPC64 by making it available only for KEXEC_FILE.


-ritesh

