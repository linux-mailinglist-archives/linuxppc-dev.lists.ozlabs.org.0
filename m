Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818E8CFDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:42:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467l3t2c2yzDqP9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="I+a/3Ifr"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467l0w12yWzDqpk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:39:42 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v12so5463387pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=r84qtxIuA7/blK51KqUqinmNMAkGTw/Qe9MaT+YbCuA=;
 b=I+a/3IfrZka+df+VqO9hj1OrRsHIccQpcN3wJL1M06I0MWZHAMgdReQ9u09u/xk5QT
 YH4G5KjoAs3u/+JfQIXMAdNw7d1S5TrrOBCp03qrJuzA++sRNm15SwkkknjFsufbEfsV
 Xbqc3ApEG/vIj1Cci+lUAnazDWSYFtLQUPtkrt6cL2JsgB5I9xGxzRHt3Vkf94Dbz34m
 ghXkXRhpZSvjyomABZ6z4PeASet4xx4OGRm6vzBrTBUCBAEHCoQ89YMIe+cnj20NSvid
 60gXOa7ILqXgpe7VFulvVxxGo2oDwblbJqizPoJWaTqWb77uP2AfZfWX0qqYP/4p7r9i
 6EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=r84qtxIuA7/blK51KqUqinmNMAkGTw/Qe9MaT+YbCuA=;
 b=Hexsm5m+8Gu+E7s/+7SKeIftbOg/GcJaVeeoDkIk0knrTwzW/JmVUppwsmmeDEs4F3
 aKYnZ15ny26zXWLzu1y0JkLyS8i7WEaCCQrSQRB2gRSv414LJIfvCfPqbs3vwA7/Db/Q
 d6AQTtCzDIlvot5/t9g0BtbVowuT45LvXVNrqq5KOByomJdpaIeIKvqZDHm1mFvbfJCP
 z2he9WvnvTFMU3Yd6oB6IvF1otYIiYB7uEIN7D+ljqZSnQk2zAA6rYgh3zlEV1zT4mO5
 htogNoSHWdpGvNScd6P/4CQ9Pv36ngMSV4P8N0LUS5LUzbymkXfKl7oRe4A2QtZte+xl
 TQdA==
X-Gm-Message-State: APjAAAU+DSGX6PzLrbzAhiSTmD3xQxdtSaHvkAF4GUw+lgxRigxknE14
 pCYUkYOnUVsfRMgJpzqy1nu0ig==
X-Google-Smtp-Source: APXvYqwteVY2sGfFJZ13FnbIh3pNMmFyoM8OwTJPd/Jr/1JBkTgUgmhx+Zai3JUK3Kchry/hm3UpxA==
X-Received: by 2002:a17:90a:246f:: with SMTP id
 h102mr6246079pje.125.1565775580607; 
 Wed, 14 Aug 2019 02:39:40 -0700 (PDT)
Received: from localhost ([129.41.84.73])
 by smtp.gmail.com with ESMTPSA id j11sm10747882pjb.11.2019.08.14.02.39.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 02:39:40 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Balbir Singh <bsingharora@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 4/7] extable: Add function to search only kernel
 exception table
In-Reply-To: <916d5741-a0bd-8860-4a38-7a5ef677214a@gmail.com>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-5-santosh@fossix.org>
 <916d5741-a0bd-8860-4a38-7a5ef677214a@gmail.com>
Date: Wed, 14 Aug 2019 15:09:37 +0530
Message-ID: <877e7gqe5i.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balbir Singh <bsingharora@gmail.com> writes:

> On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
>> Certain architecture specific operating modes (e.g., in powerpc machine
>> check handler that is unable to access vmalloc memory), the
>> search_exception_tables cannot be called because it also searches the
>> module exception tables if entry is not found in the kernel exception
>> table.
>> 
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@kernel.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  include/linux/extable.h |  2 ++
>>  kernel/extable.c        | 11 +++++++++--
>>  2 files changed, 11 insertions(+), 2 deletions(-)
>> 
>> diff --git a/include/linux/extable.h b/include/linux/extable.h
>> index 41c5b3a25f67..81ecfaa83ad3 100644
>> --- a/include/linux/extable.h
>> +++ b/include/linux/extable.h
>> @@ -19,6 +19,8 @@ void trim_init_extable(struct module *m);
>>  
>>  /* Given an address, look for it in the exception tables */
>>  const struct exception_table_entry *search_exception_tables(unsigned long add);
>> +const struct exception_table_entry *
>> +search_kernel_exception_table(unsigned long addr);
>> 
>
> Can we find a better name search_kernel still sounds like all of the kernel.
> Can we rename it to search_kernel_linear_map_extable?

I thought search_kernel_exception_table and search_module_extables were
non-ambiguous enough :-) But If you think name will be confusing, I can
change that as suggested.

Thanks,
Santosh

>
>  
>>  #ifdef CONFIG_MODULES
>>  /* For extable.c to search modules' exception tables. */
>> diff --git a/kernel/extable.c b/kernel/extable.c
>> index e23cce6e6092..f6c9406eec7d 100644
>> --- a/kernel/extable.c
>> +++ b/kernel/extable.c
>> @@ -40,13 +40,20 @@ void __init sort_main_extable(void)
>>  	}
>>  }
>>  
>> +/* Given an address, look for it in the kernel exception table */
>> +const
>> +struct exception_table_entry *search_kernel_exception_table(unsigned long addr)
>> +{
>> +	return search_extable(__start___ex_table,
>> +			      __stop___ex_table - __start___ex_table, addr);
>> +}
>> +
>>  /* Given an address, look for it in the exception tables. */
>>  const struct exception_table_entry *search_exception_tables(unsigned long addr)
>>  {
>>  	const struct exception_table_entry *e;
>>  
>> -	e = search_extable(__start___ex_table,
>> -			   __stop___ex_table - __start___ex_table, addr);
>> +	e = search_kernel_exception_table(addr);
>>  	if (!e)
>>  		e = search_module_extables(addr);
>>  	return e;
>> 

-- 
if (( RANDOM % 2 )); then ~/bin/cookie; else fortune -s; fi
#cat ~/notes/quotes | sort -R | head -1 | cut -f2- -d " "
