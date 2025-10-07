Return-Path: <linuxppc-dev+bounces-12689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15670BC0E25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 11:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgrnq46mjz3000;
	Tue,  7 Oct 2025 20:44:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759830271;
	cv=none; b=RWzzMqaVx7/4ga69DaJc6ZfksNokB5BMP0fslxia2/BAJrf5wLtiNH+iAyAVe1cLiQSsDrwPSu8NqJLdIsMuw+lrZBKcVOqT3isf381IYgLg8erULXdEB91mV2kuzY7wagGYHUiaXydtTP8+3hkklFfkYbrLARZdr+2fs2BaZR0d9ufcA7O/t9dd8KS4C2xdOd+VmTibGzO5XjRJOS5NWa6SXsjnMnBlK9dgvULgT5LJ/bS3hsO5fs1yH2rzmgt3TOHlPloI61Ey19FpmJXrnxGLEYWGHKbFbzZysHK0b/zNAUtymAIQkMb6uco7Bjly1X58OAytqeSnSKvKWDYcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759830271; c=relaxed/relaxed;
	bh=3A/VwiK3ST2alzhsK6RwftUDnD/x55X00olSZzcEoRA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References; b=GI6/xr0/EVkGpXeULE65OoVkzT8K28UC48qb0vjqhyVIYFevb3clCDQsL7oqyKRN5TlFp00m8bbamcbkHLy+Sv2myPltO4kCjPN908OwuN+Q0yt4XDoBSJdjzrrQNTtY4ey8UKS7zZMCUyDpyWIf7HKt3Eu3hy8wqjPpAfiJNTBfEMmp5xMb8smfdoZOJ/X10rAqFQJfUyZRVrF9Pff0DP89xxMyamYv6rkYcYl+UgHJUEnN8RSmpJhLkv9+WuRsV/MMQb23DfTnOuOAY3E9lDaDEjuiia5hA6uB7IWZF9J9bYOCf/bdDHdl/4xLov0npDVUgi97kVEFxUaoYTjeCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DWTNKEen; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DWTNKEen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgrnp1DTyz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 20:44:28 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-781010ff051so4223940b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759830265; x=1760435065; darn=lists.ozlabs.org;
        h=references:date:in-reply-to:subject:cc:to:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3A/VwiK3ST2alzhsK6RwftUDnD/x55X00olSZzcEoRA=;
        b=DWTNKEenaFPgT3d5o/idxzx/c0yZ3O+vcyi3iQVvbmZfXaCZdFi+qOPGYh74sqNuCo
         FNtsrmAPzX7kVx12BGbXlR9ZdXFUS+3k65iOtHEMhcagg8+uWgJeclV6UKrnn6XwMCQB
         ZDkiA4TnyBHcKi94XRSeL6tzQw+7Imo+cpSrzzRWAhEhmMQpobF/lltVAfwmYbXjYEyY
         x9nqQUD9apxMxxdzMXA+Vg5UaRY+GYpmkty4MAfVEq1mEaRc0m6KVHYhGN8lNdKz74XI
         uKXOQPEQHLkwbnh8sDw2/CPANTe8VMqH6f1Y/LarPTexe/AczZi89gPF7Q6/cwB7mNmh
         9wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759830265; x=1760435065;
        h=references:date:in-reply-to:subject:cc:to:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3A/VwiK3ST2alzhsK6RwftUDnD/x55X00olSZzcEoRA=;
        b=adAOObipGTJJhtf3okIW45la2pxKnxDfcXqsMzBHqYzcbANRdc2d6G9czbLw9PfIin
         3ZbVO5vPuDsKXsJvChUKVcskb3kJmz2mdZRtQn6quckmtE/BYbnd9hsMY0SbawU+5PEW
         gjK0XzMowy0LFcdjiEOWse0bakb8gosNqEafu844Imb0lprQS2AgJOa74aPk2WpJwikJ
         oR1v4wmpdcelxA6O2CSrR3peBLk1qm/LE2rtG7pG9X15nOxg5POeZSJn0LzglS0XbeQ7
         mHmzZn+30gdTxS5RLgDdU+0j34aRAQMT7Fk4/7n8ajiiEQE5jMPx4j0gOCI1NG4MztI0
         XruQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyolIghFbAX1PN0nkp419RU8+7UYkpKC4A5y3+cknxwYWu0JcAIm9JFXEJzXWLL0oHvIUlpPSy6DBczxo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYcJcqGUGkjKFdRsHP4berHCzL3CQhNuErjIV4DnLUtPZe1Xxx
	6KFJpIQ182eFt2pEyGtFKIASTCEkKA00p90UpX7J0VX/i/a6mk0pbxl4hD+1S5C9
X-Gm-Gg: ASbGncvkFn+vsrBA1x/ucxpT22sfjAHdU0oXX7+WEisPTJ7E6SsSOuCQWaQHsB2wCut
	3NuIO0FXXfqfH4qSZtrZN7AqcXMOIAxqXzgUZj+91wmzxn4GK13vfFcoJG5Tf86hhvDfPaSXXJQ
	oHMjJcRhheIMXpzWVp/IZWIZZKMtc+7YhXSSSodIeM8NmbKEtb287RQnhu6mB6lrhrvyskP2xaA
	uh4pssFK62zXs0Bod+G10pTNJAUcz5mlNxyg8HhkFjeZboShEpGaq0NKHyoo2F1Bmk8NCW9NC0c
	1xu80pGaGq5v5icB/ptKKR+0HYI586YrUOMCfna2duAFQnCQinabDW8KHXI3aovhfJuFV/e5brU
	E5u0xcYsy9r2ysMXO9kw9pksE2hMWK14gnxl3QCk=
X-Google-Smtp-Source: AGHT+IHdDZ+BrmiDr3sqlM3LMsfxZrmam6lJT+2X4FkGsIUdH2hXqWPLsvn9F/0fIGhZvm1Em/I4JA==
X-Received: by 2002:a05:6a20:9187:b0:2fd:5bf0:706c with SMTP id adf61e73a8af0-32b62118956mr23209672637.58.1759830265355;
        Tue, 07 Oct 2025 02:44:25 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62e5549737sm10368308a12.7.2025.10.07.02.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:44:24 -0700 (PDT)
Message-ID: <68e4e0f8.050a0220.1e89ea.1c6f@mx.google.com>
X-Google-Original-Message-ID: <874isbgid9.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/64s: Do not re-activate batched TLB flush
In-Reply-To: <ef5d851b-0f67-410e-9479-0f6d344fa17b@arm.com>
Date: Tue, 07 Oct 2025 15:10:18 +0530
References: <cover.1749747752.git.agordeev@linux.ibm.com> <8625a1d97dcf4ae499b4bb341e27346f768a7248.1749747752.git.agordeev@linux.ibm.com> <aFGFl9Dvb9zdC3JS@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com> <ef5d851b-0f67-410e-9479-0f6d344fa17b@arm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> On 17/06/2025 17:11, Alexander Gordeev wrote:
>> On Thu, Jun 12, 2025 at 07:36:13PM +0200, Alexander Gordeev wrote:
>>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>>> Therefore, the batch re-activation code is never called, so remove it.
>>>
>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>> ---
>>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>>  2 files changed, 27 deletions(-)
>> Hi All,
>>
>> (I trimmed non-ppc mailing lists/people).
>>
>> The whole series does not seem to make it, but this patch alone is still
>> applicable and makes sence, if I am not mistaken.
>
> Yes, I agree. I arrived at the same conclusion working on the next
> version of the nested lazy_mmu series [1].
> [1]
> https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com/

Yes, we disable preemption while in lazy mmu mode for Hash, so I agree that
we won't call into __switch_to() in between preempt_disable()/_enable().
So it does look like that we don't need that code. 


> May I include this patch in v3?
>

That should be ok. 

> - Kevin

Thanks!

-ritesh


