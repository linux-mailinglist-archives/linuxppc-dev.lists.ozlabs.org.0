Return-Path: <linuxppc-dev+bounces-4717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DCA02850
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 15:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRcQk4kYmz2yjb;
	Tue,  7 Jan 2025 01:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736174686;
	cv=none; b=MQfws1fZw6qBFWsFd2rFAJNfAUvCVsoySZb2GmzPGA2RYlAZSOdAfz86B7tsIsuffHxD9SW7Y+p/Wm0Vygj+U4B4fTuegq63H1tqalNXXNs0tqpvIJ/MvLoEmOWZUuBwCcou16ZHpjjuQlooUoUFu2hgrMP1AMi9K4QMz5G2nLhkpgqE4ZwlwVuNSmvti3QT0zmRxLsOwecI3D1wGsP1PAMtKtgoQ3eDZWTuUXEMG9nhzuTu5mhzNXTl8zlRZoyCJEC8WjNl55luUyCACux67vsyBog7g76aGSOjIm7SsAECYMJMJPlmZCwMDZAOim5PicEN+7qwLhYmC8yXmth3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736174686; c=relaxed/relaxed;
	bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awkBv9JiluG2s2p22mhIU1abRAZa6cECTwrFA2oU7jPExlyJfKW9u3V3DD/NCjh0fI6cPEHc6engRmGRxcWooPpwCTWUncBLKC3hCHQ6GNo3hmvlQE0ODvgKPPdkV2iRuDmX4FmqT2myTQYP2q4Df8Dk2NaldBs9dJWhsMNzC/EdVL62YEQTMO89YLEI7lotbYhnBXMkD0wOM1Jzn5pzS8o0p3SrGKWQ5Lf0r2TSHB7egRnytO5SkZIouArRNLA+e/dVIa3B78SNRH+79MJXMEa4u6UJzmnsxz5EbIV9AIILy9pOw0aY3ZtaQj1XRbIyUwqXwu4kT6bn4qKasOOJ1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H6cbFm05; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H6cbFm05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRcQh6QyPz2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 01:44:42 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216401de828so196142745ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 06:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736174674; x=1736779474; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=H6cbFm05cs2MaY4RvRANPyCzjv5DyWBdtRWccGBhMu5JcFfcqNSf77y8ZL0cfW2ohe
         O9AGtKCZHFoLAiglTIiE+8o9JKRMwlDYn4PWl/D7LXjyKBZo2eMlqGCYzm8RFAe7t2bS
         G/1OIV5giZaC2nKvwT5G7hWef4aMVxvHposn5y98vvo+yGIPj5+UQB2sKsY+iOrxyRzB
         7G1Oqs1W8K81UtKDEv7OIwi4HeKo7YBhbtSXgfmtODHH/lwk3uGlBxrGphMtX7O32q5n
         htcU3D0wlKUowIIVwpJYyR024sczsoNQGCXLhvou3uQUKauUIRY/lV0rfGwZlL/hmgzJ
         eQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174674; x=1736779474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=qCRfL1bDY2u1cfaeYtfMR/Dsi22/NkooILxPlB8aPuWWVDErjBHW3nIJoCJwuqLA9h
         q2NM2RORRz6JjFLTnTlyLw4wPK+h27Go6qM0OnAJzyLn/ji6Qz/xdam7u/FdJKwPC3f1
         5iVtsCSnOmLOAhhDm/2IynecRnrdEhoy+Z1zIkUwlpLexIRTvaqQ4hS5AUy4w5FqZFYz
         3UjfyvgzuuYnWnbbaR4hNeOrPlgTCPGqQ4BaSeskoI1DIFz8W5FcAMx41gfsKblNU//k
         kR2e8dzkvXtObxNqkFjyfOOC/kGELrzYNm5VsvUO1RwP+mdte0GRlYUIElFk1Fblunk9
         +w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6kjJf35UI8v6FVwbQdLmBv2QdCcaMTcDWgwjkPPqDDxdKsh3GwT1ycCc1CxXsp6rOaefBTJuYKRSVpUE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyH19a5ulYycNbVqOmWwksCyzV/p7XeiUUoH51P9BjXlsXj9URb
	FDG7vzsr5dj1Js1pgrIKkI+QVjlliEwywN9ykHOB5v0oRAYLwfx1I1r8cotno2U=
X-Gm-Gg: ASbGncsqy7PsDRdA5Irl1UB6m7Qi3+KoQgWb12js0PrDMpNIVk16vDYMeUnDo3jbCnP
	+0ELlu/39h0GSz5pbOufmWzEPzZ/Sckf36+ZW1GuSqOB+gvEPyQTPPZhndw4kr9q/2jS0dNPcPA
	nFPl/0JZ1+wVZx6kZnvWqqZHXKqiZGh/4PCj6jp2l1llSk+r9RmOA5FrpO9qn4MVr7M5HnlLgjb
	fANoUeTUkXMQwZHe+xgxk37XLBAmdn4oUVy6VdcTmwSQF7NZFG31DCcpQF4KOGwkGMKTQNi6OzB
	TpTzCIoR6EsxB+Z9nEnzScPPUeo0ughvd/boQp54cDLpiMnk0yfn
X-Google-Smtp-Source: AGHT+IHfRKlSBRBXUw7mHIW0SQFNESOEWbBrtQcBXd7/ffhetsdlBCZHRjeTrMJdIBfoDiMG7l+wRg==
X-Received: by 2002:a05:6a00:ac3:b0:726:f7c9:7b1e with SMTP id d2e1a72fcca58-72abddcadd6mr82367083b3a.13.1736174674262;
        Mon, 06 Jan 2025 06:44:34 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815804sm31532588b3a.32.2025.01.06.06.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:44:33 -0800 (PST)
Message-ID: <dbcbf4c3-f86a-4414-be52-8ac02dae5b6b@bytedance.com>
Date: Mon, 6 Jan 2025 22:44:21 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
 <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/6 22:35, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 09:34:55PM +0800, Qi Zheng wrote:
>> OK, will change the subject and description to:
>>
>> s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()
>>
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to pagetable_dtor_free().
>>
>> But pagetable_dtor_free() is newly introduced in this patch, should it
>> be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
>> strange. :(
> 
> s390: pgtable: consolidate PxD and PTE TLB free paths
> 
> Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
> freed - same as it is done for PTE tables. That allows consolidating
> TLB free paths for all table types.
> 
> Makes sense?

Ah, make sense. Many thanks to you!

Will do it in v5.

> 
>> Thanks!
> 
> Thank you!

