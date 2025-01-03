Return-Path: <linuxppc-dev+bounces-4597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7BA0034D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 04:54:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPV7W1j4bz3029;
	Fri,  3 Jan 2025 14:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735876455;
	cv=none; b=Ly31u873PW2q1cjnfxMGNnHzq5D0LS3ndGJPsnkQDnOfWqMSwBWGevnc4wmaQJrHnTtTpkFDnEsDPkpa5gtqlr1sQx8fE/xmcKRk7LYfN+07V95vn5FV6JssADNfZI7xk5GA9nd9RGypjKV1ffBp8MueaGcDPRSqeD6rX3vQRFt8dyZARkWRqc63uRyFrS/bgPEQ+y6V5Ttnhorp6Fjo1lp1T+WJDzbGO8AV5mN1MgUY18d9+jxV8jMbrTtKro2v3oO8LiwoOVhjd4nIKdFxPIpKbNWQdREcYx9qrhQEslFduHpLfJICTIrgQhKyM5uM5u56GE9AznqUOJSg8iGw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735876455; c=relaxed/relaxed;
	bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATKZ/DOAATUWlutA7VnLM6zpibaXY0Li03NE0TF/J8kehjDbIbnXCYedO+dJvxXjOX4r1MhMs4x1GMLhu8iws3GxIb6/SU8gO/tyvIKvOmtdawzweWR9zDi61jMvYcg2rF/pxSaNGPy9ycKWjzlwFj+qxb1GtDaL0ZwbNgHmMja84Yo+wj4HQk68+MqpRaKNWffH8M07Jxn2tiOa19y78yot1kcBDKCu53BKBGGu320d6joG6Pciwh2do3RSTue9Js5ZPUahmtq9zJtRvdV7EY/iXsJiugGcl3YjWdFvwZKFqdxY/XS4lqu0tBHa3Kj4ENrCN5YirESYHZVA5B1X6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UO8l5FG7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UO8l5FG7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPV7V17vRz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 14:54:13 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21670dce0a7so84146705ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 19:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876451; x=1736481251; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=UO8l5FG7nN/J2sgnyFxI7Rd3LWzRAIFKGeTH5r+RBFrAIWnAwE2Pd+A9q+ZFKwVkzz
         0hQ2OHoX42SosO2Nt0rk5HRFPUdwNTCU+4ZY7CZhovuGkhlp7Alr/thfhzBMJ3EUZvva
         zSnFKawh3P8rqk7Jp8aGJOYRmpYR81nABGVOq+6h/GSPXh+CYRJ3/5ONVFGa0XGVNFWX
         qD44/NdorSyQAJDsuQyVZsWFDRE7EnSekpoRGrpL2RaFZ0TJ14EkRG2x+0gtsk1V1BRi
         mFBHMILgru/VaJOQWTZoDm2p209tnKOPkdhGtrjEAljKzlRyozVXurO5EA29EasF6RmZ
         KKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876451; x=1736481251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=WQOSaXDvFx2ouL648H11KFwnlhYB6M4mAIadzePw4ngw0QXLv2viLWehbLKpb5BaLe
         qVNzR8duq54p7vQsA7TmOxLTMjT9z1xpj/zQ24ScOk5Pru6msBwFb8ZOHeTL53yHIzVw
         lUIjrZbiI45gGgLRP/M5WeVsxd17uYQl5aWhH7MKtqAX47ap3u/kArhSnm+FsnrrnrmK
         /eiEJQ2mgZE0aSvhx8qKT3NEJaF6WWxJNmRcmC6lKs/NxTfUjX+UaN4T6xwgMQC5XaGY
         EOlKrvc03cbgc6EYjF1PBxSou9mtCsAXUMsKLvblw2LKbUL+50SV0n01kaOXI25hqksz
         7GHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+tio3nVQ3H7Y3y7hzwpw0jNUxZl2NN1bKfCTbamouuZqDuaj3ExRdQ/QIn0bk0p1yVo0mENsrEEdd1w0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzW58yTw1+2o170fvAlwB5AjjNGJlPLXoXRefgBtxcmk3c5jXIZ
	AUX5szKVDnMmz/y4bpicRRB0T1tMPF3lmSoTuwEphCHEK3+k9f9nrC5INFuodzk=
X-Gm-Gg: ASbGncty9fALq6JV3+fbnFCp+c1KWXUefxc8WiEsxuhGkbrwBkK9+Pe6ClOR73B8Mw7
	4p+m+3+teIei41bUVVLVdaDK4MrWcpMX3C67VZObO1I9j9152dgqeNQxASbO2vA7/sk5+gqnJ1d
	PZZoQY09U9O+ptWj2WxvcI3ZhOBACrTM5+NbnxpLHCRigPkv78qPvRRdxGjkzd9PhAIAIux+hpq
	xTNS6WobpHErZCT0pn+e1TqHxoEczl8sw+ZgGj1yMRHV359fVEIbhFd0W2CU5HPcRoiPmW9bZew
	NDEf4A==
X-Google-Smtp-Source: AGHT+IGRLBberTsNPcVz5fDDiJ496OTTAGvxwwTdPWwuUiji7gMKzctc+wxIQ/Y0LkCE8MhlfHWUlw==
X-Received: by 2002:a05:6a21:6d86:b0:1e0:ae58:2945 with SMTP id adf61e73a8af0-1e5e081179bmr90059001637.31.1735876450877;
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fba98sm25284573b3a.161.2025.01.02.19.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Message-ID: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Date: Fri, 3 Jan 2025 11:53:56 +0800
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
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
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
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/3 00:53, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
>> index 551d614d3369c..3466fbe2e508d 100644
>> --- a/arch/riscv/include/asm/pgalloc.h
>> +++ b/arch/riscv/include/asm/pgalloc.h
>> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>>   				  unsigned long addr)
>>   {
>> -	if (pgtable_l5_enabled)
>> +	if (pgtable_l5_enabled) {
>> +		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
>> +
>> +		pagetable_p4d_dtor(ptdesc);
>>   		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> 
> Nit: could use the new ptdesc variable here instead of calling
> virt_to_ptdesc().

Right, but we will remove pagetable_p4d_dtor() in patch #10, so this
may not matter.

Thanks!

> 
> - Kevin

