Return-Path: <linuxppc-dev+bounces-4771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DDA03F42
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:34:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9VG5qcNz30hG;
	Tue,  7 Jan 2025 23:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736253286;
	cv=none; b=SeeW97fC3RN9PYTolUlgS93nZ+M0DP5QvxY82oYwUjiSVxLB3H8jb61ahSNtKP++bJWhJEjNTtfBWDpmzI0IHf9i1Po0yylEGEjFUEQKRqE7iX4dHem4enEuXQ4OXKQnvKL31haI/M61hwf82POezLdDM4N+Ow0S6K5Qo2Lc3bY3EyOiBm75nEaFPxEv4Vqyh4IsvU/JDvW1+PsxUQdbjbWBPpRGPIfi3lTrA0AkrzAUFrHuYmxZx2ZF9o4WUyBcTRMiNkRQ6NYjFDfoq0OmDdZiMmqG3HMYjGhc63pDcN4bFNRj0tl9oQFViuy7i4FeaTUncyo5WE15ozGc0cGCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736253286; c=relaxed/relaxed;
	bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UA2E8lfAXLxRrWPZ3IjhivTn+xMAycm31MaBZ3m+Fto6yfH+HJ6tHUKOWenmk762hgZFo/Amijghf9cl3PIB1ne70f3aB49fGpKU/xo+g+SYUINfGSncZMPvxMINYuIssejw9fMQnol3Z44S4qVE7m+0Ifxl5S5eK4mXXK70nNCiZABiVMA1D9jlGjAra5qj3ooxAYKiKI8UC6Nq4WPPSAO9DlJNAJ3rOB1zm+j3mUOVLcEBZ7cuwoM+6SVTRGqDKWTXFwnThEs9Xs5YMxtLdcH0MjAhN0NAUeGWdGZbR2pu+lpFTT41YWI9gSX0VN/zt6VrAA963qa4iJEWgF6ZmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OD+b7fU2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OD+b7fU2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9VB5cp4z30fM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:34:42 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2161eb94cceso158992805ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736253281; x=1736858081; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
        b=OD+b7fU2CDk54Ds1iWL9XFQXtgalw74K/HzljPeQ0gt8KjEZfQY9unda1ikRKUPVDj
         qiBpgVlKtB8wBv5FOjwmahxxFJ6hdpTml4uHq0AkPxjzxRqlkoRTCBAC+1aUla3v9MzE
         WAxTdtxEGDIjEuy1let6UTP456Lq1E/fndWDYdKnNy5uspMPGaR3bLsh1u/A6H3PeY47
         k69/MUhBagqqe1FldCZ9uewEQb7v6gMyOULokbShJ8imU7EXt29ZvpB00ouc6OSQNekj
         EDutBALP15SRmeG+mSyisztZ0SXiAVSEJyq81tC+W7TjNoJXIi4/4c/H21MMGWzzag/W
         epQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253281; x=1736858081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
        b=jBCAeWPhQqh8qX99SwCVx8GWocrGqZaPLS4PiUE396sVD+S/CUO9ycKcs4kZAv5uW0
         1cUI3Rxl8SkmtYwk8mc+u7u6jXqHqV3xHaWuYFvxpz7380C+gG4CTFExBK9Wh1bpBV0k
         Kc/bKZSgtr4rfByPMgd56q7PCOQuASe5KailYfFTv3TVaOJS3+RCT95gjRuZDGkBmm9d
         qyJfCzEdI0G3hGPMrU+W0TURxautRSAmH/OhOIZ3u91Btv+xBbRrEJcynKhP/3N3ESGy
         /NqD/fXjGePywJg0F2T775S4L5ad22kxrmsbe3ez8PyxC4C/Iv2ERG/f5HXbtMR/1TzJ
         0B7g==
X-Forwarded-Encrypted: i=1; AJvYcCVcXEiJ5CbxYtWpMGJ3GCsvNv+qwPrAnZb1RtjXuLkXlsk0OpRjMh//KzQBeOh4a+PVIikMHQBIQj5oW4I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx300CN1aGLw1H6gPyAqzEXteySO1ZJU5vGcmOlZiv7fMg4VJZz
	Ngb2D6e85d4l7jKEkSEoX5im/7ocX0rxAGJWGX5pyJVopeSNp8Dj1sblYJy1gcs=
X-Gm-Gg: ASbGncuALo5IPW8JI0MGM/ZqjEmc42I3iMRfyFit83IvJwFmnIMcS2w7ILOo+JrD2IG
	xEMcZm/VlKR+5/E3dz+iGqru68DcItIZ+mtuLO4bJv68Wi4ESlzWdJvaC3Wv71eFIwFFaaGDaUU
	PHFf0TBt7LTKAxdoDcGuzQoUvyZRBmdXeM3bf3jC+mx7/s2Ch23eVpNtESGRoR8bh/9bFKRRx1f
	rYWmBHGWAg5rk0QYRm/NhkXf9b63Mj38MDqrvOqhj8/SIYoSax/gOqJE3nuNzKI4HSOvprlOzO/
	q+2n
X-Google-Smtp-Source: AGHT+IE3yUUkb0m+aLP2spLDFrGsHc6y1BQTdsXYC7/WM0wTJqWEm80meD2oBwGaRCvgAk0D5TXwug==
X-Received: by 2002:a17:902:e746:b0:215:8847:435c with SMTP id d9443c01a7336-219e6e8c595mr965146185ad.12.1736253280842;
        Tue, 07 Jan 2025 04:34:40 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cddsm311379695ad.48.2025.01.07.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:34:40 -0800 (PST)
Message-ID: <9040b9ee-88c9-4347-b8b6-5894b45e62b8@bytedance.com>
Date: Tue, 7 Jan 2025 20:34:22 +0800
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
Subject: Re: [PATCH v4 13/15] mm: pgtable: introduce generic
 __tlb_remove_table()
Content-Language: en-US
To: Andreas Larsson <andreas@gaisler.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 palmer@dabbelt.com, tglx@linutronix.de, david@redhat.com, jannh@google.com,
 hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <f7febc7719fd84673a8eae8af71b7b4278d3e110.1735549103.git.zhengqi.arch@bytedance.com>
 <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/7 20:32, Andreas Larsson wrote:
> On 2024-12-30 10:07, Qi Zheng wrote:
>> diff --git a/arch/sparc/include/asm/tlb_32.h b/arch/sparc/include/asm/tlb_32.h
>> index 5cd28a8793e39..910254867dfbd 100644
>> --- a/arch/sparc/include/asm/tlb_32.h
>> +++ b/arch/sparc/include/asm/tlb_32.h
>> @@ -2,6 +2,7 @@
>>   #ifndef _SPARC_TLB_H
>>   #define _SPARC_TLB_H
>>   
>> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
> 
> sparc32 does not select MMU_GATHER_TABLE_FREE, and therefore does not
> have (nor need) __tlb_remove_table, so this define should not be added.

Got it. Will remove it in v5.

> 
> 
>>   #include <asm-generic/tlb.h>
>>   
>>   #endif /* _SPARC_TLB_H */
>> diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
>> index 3037187482db7..1a6e694418e39 100644
>> --- a/arch/sparc/include/asm/tlb_64.h
>> +++ b/arch/sparc/include/asm/tlb_64.h
>> @@ -33,6 +33,7 @@ void flush_tlb_pending(void);
>>   #define tlb_needs_table_invalidate()	(false)
>>   #endif
>>   
>> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
>>   #include <asm-generic/tlb.h>
>>   
>>   #endif /* _SPARC64_TLB_H */
> LGTM.
> 
> 
> With the removal of the define for sparc32 in v5:
> 
> Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc

Thanks!

> 
> Thanks,
> Andreas
> 

