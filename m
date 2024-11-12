Return-Path: <linuxppc-dev+bounces-3116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27D9C56EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 12:49:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xnl7d1JBwz2yVV;
	Tue, 12 Nov 2024 22:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731412157;
	cv=none; b=QZcJOCiVD8d2MJUYWJt7ZZojdpXDPzp1b37WYL2nrURN65YY46phctUfPLbY1CeDXRr6zG5NhVadoA35K/2GUOvW5BAqeYbXChBe2Mo3mznG6q5uAEnAkueb0I1SG6F3wBP3ef6zuoMyx9coee057bhuJTkGDwmRMor1M2a4XOTkOnS3bkYbxk66PaGRCFDiAXfP9JpiGjmi+OBkY27nwLLXQ3ao+lBpuYfspW5BVFyp3zXdpeK81NGNqqF9R8AGxytYgLsvQQUcBOza1nKmqKMA0ZuMpjMT0t3mlAOhyLMaEw1IN5ZJUfrt/FP7654n3eH5w1fBoKDSCtMGAU/Hqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731412157; c=relaxed/relaxed;
	bh=Fix5eAZzzqmwgIBslL0y/VU/1cuP6BbwpROFD3fvLL8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=X4rjR4zVW0oSLL7MG1Awob5v/QdaSuM8DUR2hgVc4tuEoM3rjOxmMqfi50SJzKTaah5i0D/FyU4KYgJs22DGxkABuBjKETg3vXLuZ8B6az9Uc0Qjz4jEvDw6E/hk6ng8nuVoHw/R2BDOJo5XJNIWFWLuVtF21qD73YPcIANKNp7cWYNqgf9vAHdTDEPYxintXuH2Of8l0SYwTT5Uf7IT+LC+D5s0FF+duTfxto2oAnBJKMTFKhMYbpfN8hyH29XyrVv4zDU7dokfd21mdZnrc9N8Aex/DPvhAy599ceYrKh4CnXaM3DPT0b1RSzO8Hx8xdVLnI218c4daMmK1PhmtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GCo8gMoZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GCo8gMoZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnl7b6Vycz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 22:49:15 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20e6981ca77so63217465ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 03:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731412151; x=1732016951; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fix5eAZzzqmwgIBslL0y/VU/1cuP6BbwpROFD3fvLL8=;
        b=GCo8gMoZRSYe7DVJumDmuZej0/czFZSiCq+uaAeqxCOyAMz+9f6Cg6LskVwvd2edJw
         GhrpZfG03FFB9IYvcpE7X7u3eEucRAvjAPxEmmM3K8W3xwpPZx0Nlf8xE6MB0EYuqEvm
         +NJwbOfg9B5pr2V6yCns0Y4UgE+6GcgXpT6z0JWeFkKnD9ROEsyuH3+EHqIKKRgCWg1d
         LA3QvBesMwp4v/hUjIuTwLFbxm8aumgnwMZy+S1GFJxuwb2rZzXCBvw7sy5PgEzvuTL9
         jiZ5BX3UYwXSaiBKNNjwwHYeC2FJdHFTKu1kCpUrUYpNkyhUDBDETTlRuqwetWqtTCdj
         Cllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731412151; x=1732016951;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fix5eAZzzqmwgIBslL0y/VU/1cuP6BbwpROFD3fvLL8=;
        b=KKAyWkJFrxYT93ilhhVoKXi50HnSYffZ7AGBuxz/T5jpj0AkFaniyuxeMvovmHmX/p
         RkbcbIkdrDIeWBbzCZ5ugPb7bA/CInTBGiTYl19d1liTgzzw1bSZRUCXzbxQQtXvNxYe
         zJfY2HZH8QDHOvvToLtlp0gxWor6kxlphtes04wasXB8AY7X9q/SGIv34WgudNOwqP5l
         YI46HiwOVE3PqzdpHTKW3FbDLCkZDniMP80E9h9eifhFCkdj9h6TOKKt6Fdex/6chfRz
         an9j4j4yIf1d06YOZylFLz+6Y+nu3hy6CMjqhimQW5T5UBno1uUT8zZbabWhENZfayae
         0wiw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ax6hJ9fHDVY4kOlEK9sR+5KSneBaQh0qxqXY9pnASsZ44qfEwVUL791ZChyshGxLv03VxC8keyKF9iM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6IqdwKIieHDxMpcMlFGlPJqDG5QIF+RF1zma7yFlbPSwtZsiQ
	AM1Q/SIfKgG4TBcPVGCbMYklOiEtq49nO07nyCC5wkMZx2ZJhfnY3muBtA==
X-Google-Smtp-Source: AGHT+IEUV1vwdR8h9jGBdqu3j1HL2QsX1vd8cZlpoNHr11ITOyRrFB245FlOBNuscybLUNqvREUy6g==
X-Received: by 2002:a17:902:ccce:b0:211:414:f2fa with SMTP id d9443c01a7336-211835ead2amr250688365ad.53.1731412150720;
        Tue, 12 Nov 2024 03:49:10 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e87537sm91015405ad.270.2024.11.12.03.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:49:09 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
In-Reply-To: <b2047c3b-ec84-456f-8f95-734bcb9a0cd1@linux.ibm.com>
Date: Tue, 12 Nov 2024 17:06:28 +0530
Message-ID: <87ttccn0oz.fsf@gmail.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com> <20241107055817.489795-2-sourabhjain@linux.ibm.com> <87zfm5m0p5.fsf@gmail.com> <b2047c3b-ec84-456f-8f95-734bcb9a0cd1@linux.ibm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Hello Ritesh,
>
>
> On 12/11/24 11:51, Ritesh Harjani (IBM) wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>> The param area is a memory region where the kernel places additional
>>> command-line arguments for fadump kernel. Currently, the param memory
>>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>>> it should be reserved if it is below boot_mem_top because the fadump
>>> kernel already reserves memory from boot_mem_top to the end of DRAM.
>> did you mean s/reserves/preserves ?
>
> Yeah, preserves is better.
>
>>
>>> Currently, there is no impact from not reserving param memory if it is
>>> below boot_mem_top, as it is not used after the early boot phase of the
>>> fadump kernel. However, if this changes in the future, it could lead to
>>> issues in the fadump kernel.
>> This will only affect Hash and not radix correct? Because for radix your
>> param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
>> which is anyway above boot_mem_top so it is anyway preserved as is...
>
> Yes.
>
>>
>> ... On second thoughts since param_area during normal kernel boot anyway
>> comes from memblock now. And irrespective of where it falls (above or below
>> boot_mem_top), we anyway append the bootargs to that. So we don't really
>> preserve the original contents :) right?
>
> Sorry I didn't get it. We append strings from param_area to 
> boot_command_line
> not the other way.
>
>

Right. My bad. 

>> So why not just always call for
>> memblock_reserve() on param_area during capture kernel run?
>>
>> Thoughts?
>
> Yes, there is no harm in calling memblock_reserve regardless of whether 
> param_area
> is below or above boot_mem_top. However, calling it when param_area is 
> higher than
> boot_mem_top is redundant, as we know fadump preserves memory from 
> boot_mem_top
> to the end of DRAM during early boot.

So if we don't reserve the param_area then the kernel may use it for
some other purposes once memory is released to buddy, right. But I guess,
given we anyway copied the param_area in fadump_append_bootargs() during
early boot to cmdline (before parse_early_param()), we anyway don't need
it for later, right?

In that case we don't need for Hash too (i.e when param_area falls under
boot_mem_top), right? Since we anyway copied the param_area before
parse_early_param() in fadump_append_bootargs. So what is the point in
calling memblock_reserve() on that? Maybe I am missing something, can
you please help explain.

-ritesh

>
> According to the memblock documentation, when reserving memory regions, 
> the new
> regions can overlap with existing ones, but I don't see any advantage in 
> calling memblock_reserve
> for param_area if it falls above boot_mem_top.
>
> Regardless, I don’t have a strong opinion. If you think we should call 
> memblock_reserve regardless
> of where param_area is placed, I can do that. Please let me know your 
> opinion.
>
> Sourabh Jain
>
>
>
>>
>>> Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>>>    - Include Fixes and Acked-by tag in the commit message
>>>    - No functional changes
>>>
>>> ---
>>>   arch/powerpc/kernel/fadump.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>> index 3a2863307863..3f3674060164 100644
>>> --- a/arch/powerpc/kernel/fadump.c
>>> +++ b/arch/powerpc/kernel/fadump.c
>>> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>>>   	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
>>>   		return;
>>>   
>>> -	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
>>> +	if (fw_dump.param_area < fw_dump.boot_mem_top) {
>>>   		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>>>   			pr_warn("WARNING: Can't use additional parameters area!\n");
>>>   			fw_dump.param_area = 0;
>>> -- 
>>> 2.46.2

