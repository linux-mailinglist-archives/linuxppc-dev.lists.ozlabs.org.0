Return-Path: <linuxppc-dev+bounces-11762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCBB44DA5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 07:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ4zJ4Lf9z30Vj;
	Fri,  5 Sep 2025 15:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757051052;
	cv=none; b=P+xtcKyGlD5phJbcqC50IoywPbSFE09PmCFI6iYpfUZx/jREE/ii/wv5fZr9XxfJIbry/275Tj1u0Hk6FXXTygYuG5c8y5mApBXluwvGAfh6c+d2gTh4ztLo8Y/2mfcQG901Ilhg9B0Ji0wrJsZkCf1XBFssXPS6zHS0JOsWsuuxIrsPxXcQrdw+n9+V5MIvV/TElHKwf4DLRKQ3FG/JwnNJOogFnQRk1ECPl6MTkZkvAcBdmiSfEyP0m4kK1HTyTRw14WRF/iKqvSJ4zW8PLj5hzDxR/AhR4TL4XmRTk8DCtst8USthDXoqrgvwo6rskhUicEyRJ8rxugPgMJPP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757051052; c=relaxed/relaxed;
	bh=79phlt9YKWJP1LdbQMpCO0EI87IvQ11v1Ke3cLVyv0I=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References:
	 MIME-version:Content-type; b=ddwrMBAXlSuuv/QkG0/d6Uk+W0UfN71s0VhnMQWDq9isxuRk+4AXkNh+CZWqWnqp463bLC1fU/F+QNGZBhoeqvAROsGcJE8G1bmcYYWzssIDdHtXoc+J60kOnL7WtWlKb/1lz8hnyWaRCbV0tbfQ6SHJ1rn2KuTzIpxFJEW9Q2HfZ1fjdDCKKIuI34C+IPdq1ETTGr9Q/gYLIRxc/Yx45K4DBaaL0nmX0slfTrwpNyHtcYAH43+5Zsf2g4ZaRsIFECij3GGYTWhoMo5ofdBldKpH22m1t+GVt3VuW0C748EyJg7FqO2ADghTmOF+vxngWOWKqorvLlcQIALb4cKE3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bi6zpy8K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bi6zpy8K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ4zH47M7z2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 15:44:10 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32326e09f58so1974237a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 22:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757051048; x=1757655848; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:date:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79phlt9YKWJP1LdbQMpCO0EI87IvQ11v1Ke3cLVyv0I=;
        b=bi6zpy8KyCz9fULrRbY3T1RNc7EiYn32nPNJNzEWXBhKuenh7UPuI3rryabBPJjdq3
         Fflb+Zg8/b2DzftUpdP7TW+wWPvFX68iIqImSL1TTfRVseVuQHcaNBManqYc019NkvXS
         LRwsr50vPGhfw0LKUtttnoS5tEagEmC11ODYxoZE3I9eZf0LCmdj9ABmLeznOovrAMFy
         8eVUNXslXDFwJNaTu/UZ0lpBKqf8quCjqibKJzGsxD32VjVOJnGiobuwFQJBzJp6GJZF
         Hn9fJJ96KgNaTdCsJ8Jnt9ECC59IQW7f4T/bXyXep1W/7toCXpBJlwesi99mKo56UqfI
         cymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757051048; x=1757655848;
        h=content-transfer-encoding:mime-version:references:date:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=79phlt9YKWJP1LdbQMpCO0EI87IvQ11v1Ke3cLVyv0I=;
        b=Xg7SuWf1D3fgep/maGIvm7luwh+i6iVhbFEb+a5AYXLw8UmsRkSJ66JL3oR/gH3uiu
         XVXfy2ajLYOP5K05tKEsm/qkOyF/TkNGNRQCJIL0Xrv8Uiboae8ivG/Ee4kgG6GD4Vtj
         6bOoD2Ko5B9a3oRw7ZNeZuSZJiG77wOBiR6N/XbrcoIgSQlVTRwalJSVtLBoMsw+84Dj
         7hGLpmGPMIuUHNYjutxUJhuh2gBX2wt5gYmoOS35DiFvB+Nfg6pUqcEAzkW+1XSdLnya
         c25Z5BL3GAB+kXhdDek2XCv2NAicD4DaxOJEojCWY4hLM3IYiTVwnwa3nlc1ORe1Jx/U
         J8ww==
X-Forwarded-Encrypted: i=1; AJvYcCVXAKP31rvfdaFxx8F1LyKHEPEL6tSGgrAWfwpsnd1YStgajAPmTJgK7q3ZHCyZdKKDmx6mliSn62So1nk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCh+lY7Jr7JW9R5Id3ZRmdksNhIP9jFvwJlvN0Ncwk3DxaPPHm
	3ukU2P4mGA+2G9dtt7sbSlNnl9Z8rRtC/XJ3KmYKqjFY0b7+SDAy//pX
X-Gm-Gg: ASbGncuId0VGfVYmQl0xE9vkTAtpRvBqiyDznd9tzCwnvW4DndKnqw5Ay94GzeY0AMU
	/4ZQ7Pck0suYP1TJykdA2KdVPNGlBEv0XobYwa1A16n6u6VnyAh5p88ZVU0VBnDya2/SQH5zrZi
	TKjESz0bvV6aX3m/18M8pRpKm1WnvCp2rsoW36cs3uhp+iVUUyO5OyLwIT1FMHxQ/KQASDzB+Qd
	8j2J/DPkc9pi+KJuulX/He95Jl6FUj76zOYz1IN0sa2NJ4qWqh7udYyCCQwVD9XKMlr/QadlSU7
	PvZ2YnDq9OhHDm9KQ30Y82xt9bGEDY+9czRWnTm1M/2nSo4UOp857eEvH9gCXaM/0CVPTygdRVh
	UZX6cwjyx8Dsc4D/zMDHhY1qd5A==
X-Google-Smtp-Source: AGHT+IH9lLLY8qCmwDEbPCg1+l9Lsg2X6aU3JD9OZkfGn6D2tlodVc/S78BdhkhXeCIn3LZCid9ILg==
X-Received: by 2002:a17:90b:2751:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-32815412c9emr27732394a91.3.1757051047830;
        Thu, 04 Sep 2025 22:44:07 -0700 (PDT)
Received: from dw-tp ([171.76.86.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm14774607b3a.40.2025.09.04.22.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 22:44:07 -0700 (PDT)
Message-ID: <68ba78a7.a70a0220.2f582b.f2d1@mx.google.com>
X-Google-Original-Message-ID: <87seh1iibr.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Donnellan <ajd@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
In-Reply-To: <7b3c83c1-bdf1-4778-948f-223ef0bce2a0@csgroup.eu>
Date: Fri, 05 Sep 2025 10:53:04 +0530
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org> <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu> <68ba6bee.170a0220.3b821b.ca9d@mx.google.com> <7b3c83c1-bdf1-4778-948f-223ef0bce2a0@csgroup.eu>
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
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 05/09/2025 à 05:55, Ritesh Harjani a écrit :
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> 
>>> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
>>> kernel text has to be mapped read-only or read-write based on build
>>> time options.
>>>
>>> But nowadays, with functionnalities like jump_labels, static links,
>>> etc ... more only less all kernels need to be read-write at some
>>> point, and some combinations of configs failed to work due to
>>> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
>>> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
>>> access to kernel modifications.
>>>
>>> Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
>>> possible options that may imply kernel text modification, always
>>> set kernel text read-write at startup and rely on
>>> CONFIG_STRICT_KERNEL_RWX to provide accurate protection.
>>>
>>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>>> Closes: https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org/
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/pgtable.h | 12 ------------
>>>   arch/powerpc/mm/book3s32/mmu.c     |  4 ++--
>>>   arch/powerpc/mm/pgtable_32.c       |  2 +-
>>>   3 files changed, 3 insertions(+), 15 deletions(-)
>>>
>> 
>> AFAIU - mmu_mark_initmem_nx gets called during kernel_init() which is
>> way after static call initialization correct? i.e.
>> 
>> start_kernel
>>    ...
>>    jump_label_init()
>>    static_call_init()
>>    ...
>>    ...
>>    rest_init()      /* Do the rest non-__init'ed, we're now alive */
>>      kernel_init()
>>        free_initmem() -> mark_initmem_nx() -> __mark_initmem_nx -> mmu_mark_initmem_nx()
>>        mark_readonly()
>>          if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled) {
>>             jump_label_init_ro()
>>             mark_rodata_ro() -> ....
>>             ...
>>          ...
>> 
>> Then I guess we mainly only need __mapin_ram_chunk() to be PAGE_KERNEL_X (RWX)
>> instead of PAGE_KERNEL_TEXT (ROX), isn't it?
>> 
>> Let me quickly validate it...
>> ...Ok, so I was able to get just this diff to be working.
>> 
>> Thoughts?
>
> setibat() doesn't take into account whether it is RO or RW. Only X or NX 
> is taken into account, so it doesn't matter whether it is X or ROX.
>
> Then allthough you are right in principle, once the PAGE_KERNEL_TEXT is 
> removed from __mapin_ram_chunk() it becomes completely useless, so 
> better get rid of PAGE_KERNEL_TEXT completely.
>

Aah yes, I checked the function setibat() and as you mentioned, it
doesn't honour RW permission anyways. Can we please update the same in
the commit message too? That makes it more clear then. 

-ritesh


