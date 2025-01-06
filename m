Return-Path: <linuxppc-dev+bounces-4709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F0A026B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 14:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRZxZ6nGJz30TS;
	Tue,  7 Jan 2025 00:37:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736170674;
	cv=none; b=LJxP8TyTkbt+7aPFvSrFZYAIKJnXT5ORvlBelnHAnJtgChQb8cBavsSBjDGxqN9U6OsK6blGKxQfWcYhpOMymYnLWtiwmHHm68LHrvLsFUrE9rPmBkH2pbgT/bAa70A5fRWTK6D4+PvVuwuKs6d9VwQ9qFRc39FjlIjZTAa+DgELfTfIxLVdaUJ/9WSi5XU2oUoNZxdh2YJi42VcUBI6Sz9NCFBK2Mj58RAAhE7gWIb8sG9JXSkBPgpOx5uzFchjQ4CWEpV9KaZKg5cNHK3vPp2j6ednU/A+YyuyV/+apCXOCTk3UZ4/Lu23cQqFY1d7/ALZO0RdgizcQnQnbDfzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736170674; c=relaxed/relaxed;
	bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiRFdlSLhFyzuoN8EuEy5DMa7ZS/SCkGjE/SCe7r+Lro86ddgNLrfuhPNbfT2AFsRWx9mJOnP3tuCvIjWUKi/tZVuU6GGgqIvo2qzzZTXnZO3Am09IIMd22YoDKOdQ3G7olhT7uQxTqj6B94BoY3SUEDHyTVthJSAPdzZ3k7ZHedot+Q3T+xq5W3C3gCb0AjU+madJm9/SfYwbt3USYf1FYqMVyMlOH2r5dCD9H+vQFQnEvcmoMIA5O8c5tLW66fvoqUdhi6bkc4hq/PfP8mqovHI3ay2EZltvVi9GSREv4nCxSppPqAUK6DRPElVQwndJnDobfWLN469pRvinjNhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=eSwvvmVv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=eSwvvmVv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRZxZ0PNwz30Nc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 00:37:53 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21636268e43so22678865ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170670; x=1736775470; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=eSwvvmVvsB22wLUgLx1l57TNEET3qKwfaIXxvEEr30VeethVvbv3EADzseGtFaKAGD
         rWyQblUsUnkdlfP+BSvMC7lRStCbm3C36vxtbbM+8/LXLOy+Xv57TEbJHrF2NdUjZnW2
         QBLGRz0EjfrPwmbx578b71KKWUj7qjENy3gw07llUH8AJQpeVcDeqTRuNgXXlBrKw3/V
         /zDqLE7oEB7F0P/Mu45EeKBAPRaf/BPONjTzx3pCKP5keiMDqPok0Sjxu/RZ3p8uGzW1
         IPh5nD5N6abpV9ukM4cTmeFiiqxWhN3le3643K42zD2SSmKSE/WO78Nr1lSh8rW43USf
         8W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170670; x=1736775470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=s+raxJ5Of7YoMCXPtEPk5mO/7OIj+Y5wKrdJxjQXT/WBplPaijZKVQ+SQy8lmbZE6C
         5uy/XqaSMtz+KwJFxwOXB1Z22g7qNEqEufxDnLnNlSm2t9JN4cg3tje60x0ah7vOXCZD
         JeTReexRjf6lee3HnL+ix+EsXSd+TKEOrrgvv5x1QRydfXoVYtMHukuzwPtInz2iXBc6
         w0oWTwTcN1TzcCJsp7VTkYxqZs+TxpoFNgOu85mFTkYY33veQseWppKyHabX4bT91uUd
         LzY5anRH8JFpwmKp6zIy8rlyWrnba3xo/bPpktGqbFVPaAeOkhGvILFPlDBeVTFhqpax
         N3kA==
X-Forwarded-Encrypted: i=1; AJvYcCX9wHIdKtMWnxsY+6DO5RvQIJGcqSyg9RY4atSpvrtwlvXwGZpNN1JJUmfgPZC7kyT3TjJf1Ir1/ZJZyEA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwRYhbvuFGhM1LeHwaD1SKA2R39PBd8/AmknRoWXDmwi9DAYQlk
	5YGsm86xJsT9GJogm/E2K6zWBCM0jVEsrJPAWs1ovY2zA5qmxV2pLAj2U47nydw=
X-Gm-Gg: ASbGncv817dO9uwMtRTU/XNWGxeIHYl3iMcc5nS++GcuJRNRHp85liVK2GR6rptb97C
	G8JAtlUTvkz9HRRGvSXh1gco+XNiXLL/Y7KVuXr17TUTOX2DxS8i/YTuct4GaGxk8Jtpomv4g29
	rwC7+8FXudmadOViniEbkHs3LsXZeSudLFIJtVBECId+CRRkj5K0F98AXR01lQP66ZEYxH2EN1U
	uFRYEIXrwYxqMBnfgxMCDdvHvJUZZJbT3Bfd6eJCu3ii8NZxqcRfUnVgU6oAPtzvaHPDLPuFqR6
	D5FZiM7vUwbqRxgywxFdFMNDcJl2JJcgCp9e7XI0cf25xwHkN42N
X-Google-Smtp-Source: AGHT+IFnWXSZW4FIIFkfBRxwzvmAw3s/HsdTqMia2pBdvLu70V6jfgNFfu5B3ABCLJ+ulhyhNt7Jxw==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr865705425ad.26.1736170668665;
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm290583325ad.187.2025.01.06.05.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Message-ID: <760c9610-a11b-4bc2-852e-340adb27f666@bytedance.com>
Date: Mon, 6 Jan 2025 21:37:36 +0800
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
Subject: Re: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D
 level page table
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
 <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
 <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/6 21:34, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:05:16PM +0800, Qi Zheng wrote:
>>> I understand that you want to sort p.._free_tlb() routines, but please
>>
>> Yes, I thought it was a minor change, so I just did it.
>>
>>> do not move the code around or make a separate follow-up patch.
>>
>> Well, if you have a strong opinion about this, I can send an updated
>> patch.
> 
> If you ever send v5, then please update this patch.

OK, will do.

> 
>> Thanks!
> 
> Thank you!

