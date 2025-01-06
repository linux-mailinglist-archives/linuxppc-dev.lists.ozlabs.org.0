Return-Path: <linuxppc-dev+bounces-4707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07DA026A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 14:35:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRZtW1ZQsz305n;
	Tue,  7 Jan 2025 00:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736170515;
	cv=none; b=BxSAr9Yl9UoZWHWbyY8aLKhLH/9JKK0wv9PSVvmhuJlKDk23kR2k6yYM8FNXdd+AqWWEU24uIRPHZW/JMT3U2tzvHDyi8bpLhj7idjvJ42ENCV0oBBxqpRAPnzOMYLuq4qmPWWyaxcxIlwECCEj9mQzzlpWJSqFsRNpQqRnm7UCQbDIplp65qzYzACstaOViMM6j6avJP2xltIaDILuxFTNq6yLAcrDlqxu6uxBfoX/MYK8/JfMCVyICI1715J4PbZcLbTuW9eSsgUfTssSqGFPecUYYNZIXdZDNBIDyIRPMc+5C/mlF84h4Qr0xV4t5hfpRe0OLzFpYWAz8Y+JK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736170515; c=relaxed/relaxed;
	bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mt2VVcCj8mXIJyIr2cWHGSdl4iB+Ie6J1l9ebJRJc1y3ua1Q3d1rvF5eCetsWEmBkFWPENP5H5YDP1jon81AgdP/OMMXaxcE1M2RZpKTASAE/j2qrcTJHtGwdUkgyMLqt/NjK+OeW2MM/xMQX11cXy2mdyWlWNhH1LJ6FHJzINaMw4WzI1ECR433S3yBpaORyLMlJsR3n85GAUX+sQvjEjFLu1+Cn7gU2feyE+hqhKO3EGHpfIAbObpQHTB6nH7DH40/rQ1lJfcSwCzp4TXfyGWgS/8Ue0nxYF86uAyujOuTU5z28mCc+IMfvsG/9NNsL1BGpSrdNbSDo9/HdnRUEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=d9lrvkEJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=d9lrvkEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRZtT4K2cz300V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 00:35:11 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21644aca3a0so23020795ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 05:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170508; x=1736775308; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=d9lrvkEJQkZCCdEYqAlNFysJQlg5l1l2rYPyv92mwv8If63DBq/P9bkVKwHMUv4bEa
         9ePUzSkRnXfobf8aWH0yqmcULvWltpfL8+DzRXchyRgd3i1ViQLi6aq5V8B6sjtYMjdU
         gWUMC7xXygBXCilOThUlJXs3ybQQZKE0y5+RzJ2iVcaUjCaxjkzHkxUqdf1fhUdmkSH5
         6V4C6NxKRiiBJDBh2foYb/LmwHeACgys81KySzbjiVmuQsYY3HBRbCO2mUagVo+JT/Hf
         zZlSO2qoz5ChvUtxpttWE5FxTUAq1zDiZ5fc64zJ2M1bB2+rg+zByROkqn/VSLj3I47W
         tmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170508; x=1736775308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=tJU1wMiomoNi3r5q8i5H88G3CLAUtvgvgNGhY+gIcYaNUB22/y972QUTBgljMhtz8n
         yK15lAv7vuM0wTnRcBvc1HOamwAg3w3imlf9gdMk0GN1RKYFs4ucd2ejNXzi6zinGF00
         5VKXVGxeXrB+TN0JHdLSmp56a+8+UFdcsGpn0TVNcs9FfuhlHgQztE64hhhUd1PWiSNq
         zLGgJaVMnXqlx8F31l150S0yxA58mLvuYMEEZ/e3iwpzDXm4f8ookScf1v+t59goX3un
         lQrfioAh9bnnujo6aYZC23bSyKZnNT8T6m+lZB7M/hqezhxsjYtCCrv7qBvrzdbKqAJA
         47cw==
X-Forwarded-Encrypted: i=1; AJvYcCXN3qkJ4i7obM/jfE5Wh8LxTMAVDFUl38DGduj8JxGIFnZe48+c8Tya8PRibHyoSpajX70jNrcFoTiTk1c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3qSb2ntvvYPEJHDWcQjgm2zFtg/lkAqbV/NvFPYE6g9j9M8+v
	EDrgyO89Gwk8VhKJSMQTbDl4kB9k1f7rSDS97x5V8UDKuNesvSKma8nTAxqUyMQ=
X-Gm-Gg: ASbGnct3dmWriTRIFR4Gg7n2kR5u91aFE8irggdxOyt19F/f7HRme/PQll54OvJR6Xq
	68RPS2kEQF8AtAoXUCUbOf2X/Lq2FEh1vn4ROVP1EDffOcRXk+2ryzzsJJvzbV89hXLP5xOgdev
	JbSJYWxVqUAqu3qJVHbkrgMkbErTh8+cCkGCBk3e9/8mkhB1Gf/fNODPCcXh1GZyuMFrGENi+1c
	tg3CBbDptltws/CJdtgZgwFhAwJ0TKAZ2WYgRPOAVnB+K1aHGoCwljCb60NXlQhrTdqiYqOjmQP
	C266GXAm5BGKX13xrtjC5kKTQKyyOiObNwLWtr0dTWhbDahtQdLq
X-Google-Smtp-Source: AGHT+IFuxfmftFbdw6fO4bIMnZYJ/q+si7Sq93AxF4PGQarIeYtLJTB7gRBGy3tWc8bUzZwj1LueBQ==
X-Received: by 2002:a17:902:e844:b0:216:3083:d03d with SMTP id d9443c01a7336-219e6f13c50mr852868805ad.44.1736170508636;
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdf02sm292469725ad.151.2025.01.06.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Message-ID: <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
Date: Mon, 6 Jan 2025 21:34:55 +0800
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/6 20:44, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:02:17PM +0800, Qi Zheng wrote:
>>> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>>>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>>>> PMD|PUD|P4D to __tlb_remove_table().
>>>
>>> The above and Subject are still incorrect: pagetable_dtor() is
>>> called from pagetable_dtor_free(), not from __tlb_remove_table().
>>
>> Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
>> pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
> 
> Right. But you Subject and description claim "... also move the
> pagetable_dtor()" not to pagetable_dtor_free() - which is another
> function.

OK, will change the subject and description to:

s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to pagetable_dtor_free().

But pagetable_dtor_free() is newly introduced in this patch, should it
be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
strange. :(

> 
>> And the main purpose of this patch is also to move pagetable_dtor()
>> to __tlb_remove_table(). So I think this description makes sense?
> 
> The patch makes sense, but the description it is incorrect ;)
> 
> Thanks!

Thanks!

