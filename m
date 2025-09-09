Return-Path: <linuxppc-dev+bounces-11899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C043B4A0B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 06:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLW7Z3F19z3050;
	Tue,  9 Sep 2025 14:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757392186;
	cv=none; b=Z/1xerAIKIKXuGkL3543Bwv3TEWfrMYkgkLSHw44uH48hIC7akHGUFOhYxETZWvYfs/ZiBBAiHdMiaLJis2Zo7d+Ri8u4G8rPODTWqW0mgutN+xDPExl1+9ZsHay1titT2Mw+Up+Z6+vgvkGkw//H6kUT/Jeth8o6XGLEn7mQLVDEKz40jhJZ/+LWzXogUfuZ8FX6i0hZri0mLTaJo3ntao74lHljjG379M62HX7jSYOVCNpLUoLLuH6JJck3ptMrKCDQLgUlpejO16CO4AdTwQGVY+wHN2AqMPjN28sndRf6XCSEgwmjmivX7MEIMJJKK93g3XqHMZWiQGk8JSepA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757392186; c=relaxed/relaxed;
	bh=7D2bi71vwp5Z+uAz0dSLBbl6cdWmIMR937pxBRWdSck=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References:
	 MIME-version:Content-type; b=DklJcSaYMB4lZgHuzYiMC2FDfAGDbpkWuJcxuh0rSX6EOmlYwS3HDRwoeYuyS5ptxPD88NloZKhARwj/bPPAGwKuS8YGZjwiSBs/j7Lplk8utDcCITfj8pbA2C7E0yfeoKjHzi47GsfSeOGr1B79r84lyODCPKuDuhNMrijEvdNvSiKkRPBht3+2nKeOZaN6eLxIjhQo3dMogzAB2vE4fygA3f8YQu63Ug3OqyT2uoF3rXSPG/+3vbV6kWnx3IgcaEQb8C4XybUZ6nV0AysK6EIc8H+0CVWT4B8jL1bHqYUXStjAPhvnz0+VA5yltgrcdaML1hZ12nc6JLK2Wy0qwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V6tBaZyu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V6tBaZyu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLW7Y21l8z2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 14:29:44 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32d6c194134so3024343a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Sep 2025 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757392181; x=1757996981; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:date:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D2bi71vwp5Z+uAz0dSLBbl6cdWmIMR937pxBRWdSck=;
        b=V6tBaZyuZR330Zn7IZY/4glrQmeq2IY062WWxPItIdTL0GSpAGBRanFhmEW+ZzJZJJ
         eT0VhECYlwifGJGIKQL7T49sgUVstBDuDCWtE6sX6kYMmWpMpJ9uJx5p56qTgoGnefGo
         wGQ1OpsOJz86Pz3YUBBfzhqMWSYKF9PCPcOFFbIXz6aW50W1rbUlFo6jJsVAkFkVHj87
         ESM5hM7JE2Hm81QCUUNUAesvA8Va2bgc3JYg0l0H+7YF7rFWDvptWdTtoPXvhKrew5Dy
         nrVHYCJmH2BxufHQlOLXbDfBZ/z90VW5C5A5u3/tiCW2O1euRDco5xDkZzg9tqVJd8jp
         W0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757392181; x=1757996981;
        h=content-transfer-encoding:mime-version:references:date:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7D2bi71vwp5Z+uAz0dSLBbl6cdWmIMR937pxBRWdSck=;
        b=MBhTi9rf87in5ZUhyx848874ri9F72tMai4pCCWLiIclXdQSy/EVnxcgA9RyhPPKob
         +Do/aNPvstUiLb7SSjJfgOZPs/WsDbNUVt7bKUvmNmmpfIjdu8FFc+iYD+pMwo3Cds4R
         NN/je6mybj3yvnkxEIhpIO55KuV+1hPkvxvz9ramf+nzs4o+/lI72xzr96QlzWdxVb4B
         KEa3goSBQCVlpEbw+LkhHBCL8cgEy1eEAwMH855QlmV6gHR2cdwdLeOY8Nj5QQfbfnHr
         iP1/CTdihM4JCUHkX/pKILIS0MeAiAfgOqCxxL5Pt5EMzSBneRFfBZEuzcqqAn/thBcT
         p+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW8139bthjJveNmshYGM4ye52A4uReCJWwuPmeQAYvK8mU8RZGphONOxAwke+S7CeMtdC1TOCjmHHNNzUo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz8B7dk64HbLSbNykkLh5JIRcvfBAUbHgc9UlnB9MyEPfMNnqZ
	GjKpvdK4nT5N9ZXJQivtsgsEUNsqMkYxPE+xzOvz9VFZqLfyaouy+2NC
X-Gm-Gg: ASbGncum6kQsTSJUWdimdbPp5cJ5xVJKeXVSErIoi92gug6b5DXxVKQERKA+BRfYgNT
	VoLdU4fYoRrOqAeKNoNvzitKM6KJpMWJqeHnMmFXtZqzE1xbjljZRpaFE9oic/0jZvCDkWl97ED
	Rhp2bwYu5dUppTYDGHGJX13TtHQCZCzBYkqdsWP9+pexQTnA9bXmrYVFRrVL0cFBvFDJRnYEtT1
	JGEH0qch9WFWNgDTznEH3iBOoYqu8dk+eRN4PhwYpKJLXJVjIPYollgEpPuqzqjQEVTJP5ttSXD
	llSXcuSGSoekq9oD19whT7XeK9c3pZfWsCyb6BRoHjCEV1+ROQn/G9nuHSkdQLti3YJVJk9Hr/B
	XweFDNNx1kzmmcZDxL38HwNc=
X-Google-Smtp-Source: AGHT+IFdK6fLaLgogFPfbeB2d8GqAvdbQiFLhXyzpb13yaxe1K8FG8K0ORFErBwLC+GrYHsNikFjaw==
X-Received: by 2002:a17:90a:c110:b0:32d:3e1a:79e1 with SMTP id 98e67ed59e1d1-32d43f05670mr12836787a91.8.1757392180794;
        Mon, 08 Sep 2025 21:29:40 -0700 (PDT)
Received: from dw-tp ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77466290ac3sm584666b3a.59.2025.09.08.21.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 21:29:40 -0700 (PDT)
Message-ID: <68bfad34.050a0220.11f3f7.19c5@mx.google.com>
X-Google-Original-Message-ID: <87o6rke2ja.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com
Cc: npiggin@gmail.com, rostedt@goodmis.org, ardb@kernel.org, Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH RFC] powerpc: Panic on jump label code patching failure
In-Reply-To: <1b4cc6d5-5f5b-4b39-8fdf-ac02c94cd5e2@csgroup.eu>
Date: Tue, 09 Sep 2025 08:49:05 +0530
References: <20250905061135.1451362-1-ajd@linux.ibm.com> <87qzwki6fv.fsf@ritesh.list@gmail.com> <1b4cc6d5-5f5b-4b39-8fdf-ac02c94cd5e2@csgroup.eu>
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

> Le 06/09/2025 à 05:52, Ritesh Harjani a écrit :
>> [Vous ne recevez pas souvent de courriers de riteshh@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>> 
>> Andrew Donnellan <ajd@linux.ibm.com> writes:
>> 
>>> If patch_branch() or patch_instruction() fails while updating a jump
>>> label, we presently fail silently, leading to unpredictable behaviour
>>> later on.
>>>
>>> Change arch_jump_label_transform() to panic on a code patching failure,
>>> matching the existing behaviour of arch_static_call_transform().
>>>
>>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>>>
>>> ---
>>>
>>> Ran into this while debugging an issue that Erhard reported to me about my
>>> PAGE_TABLE_CHECK series on a G4, where updating a static key failed
>>> silently, but only for one call site, leading to an incorrect reference
>>> count later on. This looks to be due to the issue fixed in [0]. A loud
>>> failure would have saved us all considerable debugging time.
>>>
>>> Should I change the return type of arch_jump_label_transform() and handle
>>> this in an arch-independent way? Are there other users of code patching
>>> in powerpc that ought to be hardened?
>>>
>>> Or is this excessive?
>>>
>>> [0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu/
>>> ---
>>>   arch/powerpc/kernel/jump_label.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
>>> index 2659e1ac8604..80d41ed7ac50 100644
>>> --- a/arch/powerpc/kernel/jump_label.c
>>> +++ b/arch/powerpc/kernel/jump_label.c
>>> @@ -12,9 +12,14 @@ void arch_jump_label_transform(struct jump_entry *entry,
>>>                               enum jump_label_type type)
>>>   {
>>>        u32 *addr = (u32 *)jump_entry_code(entry);
>>> +     int err;
>>>
>>>        if (type == JUMP_LABEL_JMP)
>>> -             patch_branch(addr, jump_entry_target(entry), 0);
>>> +             err = patch_branch(addr, jump_entry_target(entry), 0);
>>>        else
>>> -             patch_instruction(addr, ppc_inst(PPC_RAW_NOP()));
>>> +             err = patch_instruction(addr, ppc_inst(PPC_RAW_NOP()));
>>> +
>>> +     if (err)
>>> +             panic("%s: patching failed, err %d, type %d, addr %pS, target %pS\n",
>>> +                   __func__, err, type, addr, (void *)jump_entry_target(entry));
>>>   }
>> 
>> arch_jump_label_transform() is mainly getting called from
>> __jump_level_update() and it's used for enabling or updating static keys / branch.
>> 
>> But static keys can also be used by drivers / module subsystem whose
>> initialization happens late. Although I understand that if the above
>> fails, it might fail much before, from the arch setup code itself, but
>> panic() still feels like a big hammer.
>
> But not being able to patch the kernel as required means that you get a 
> kernel behaving differently from what is expected.
>
> Imagine a kernel running on a board that is controlling a saw. There is 
> a patch_instruction() to activate the safety feature which detects when 
> your hands are too close to the blade. Do you want the kernel to 
> continue running seamlessly when that patch_instruction() fails ? I'm 
> sure you don't !
>

;) Sure. Not a fan of playing with blades or saws. :) 

>> 
>> Would pr_err() print with WARN_ON_ONCE(1) would suffice in case of an
>> err?
>
> No, that's not enough, you can't rely on a kernel that will no behave as 
> expected.
>

Sure, Christophe. Thanks for the clarification.

My main concern was that during module load time we should not bring the
system down. But as I see the behavior in arch_static_call_transform()
is also the same.
And as you said, maybe it's good to panic if an important functionality
like patch_instruction() itself fails which means the kernel may not be
doing what we are expecting it to.


>> 
>> Also you said you ran into a problem at just one call site where above
>> was silently failing. With the above change are you able to hit the
>> panic() now? Because from what I see in patch_instruction(), it mainly
>> will boil down to calling __patch_mem() which always returns 0.
>
> As far as I can see, __patch_mem() returns -EPERM when 
> __put_kernel_nofault() fails:
>
> static int __patch_mem(void *exec_addr, unsigned long val, void 
> *patch_addr, bool is_dword)
> {
> 	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
> 		/* For big endian correctness: plain address would use the wrong half */
> 		u32 val32 = val;
>
> 		__put_kernel_nofault(patch_addr, &val32, u32, failed);
> 	} else {
> 		__put_kernel_nofault(patch_addr, &val, u64, failed);
> 	}
>
> 	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
> 							    "r" (exec_addr));
>
> 	return 0;
>
> failed:
> 	mb();  /* sync */
> 	return -EPERM;
> }
>

Right, I somehow missed that "_nofault" part.

>
>> Although there are other places where there can be an error returned,
>> so I was wondering if that is what you were hitting or something else?
>
> Andrew was hitting the -EPERM because the memory area was read-only.

yes, that make sense.


>
> Christophe

Thanks for the comments!

-ritesh

