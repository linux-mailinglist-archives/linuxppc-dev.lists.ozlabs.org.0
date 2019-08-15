Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 026208E1AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4686JL6vKrzDqyv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:09:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="uTNUm8o8"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686GD1wKfzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:07:31 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c81so334999pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6AkzvLAhb44ySDSJof1CTP/r441hp6IrMh57XhAQ5QU=;
 b=uTNUm8o8XrLZ9gJdyQUCzqYZPOXtQBONmBrOtlIg3G96m8gQeXFVHZ/GbdoZUgU0ex
 dPZgtSMZQ1l84qTJw9wpkmg8RXPiCpCn7WsvaBZU8FmMktORf6NYE/vEjjhmm3nTvEle
 JRfKL0vnPtnqxle8w60zC2OT7flRUEsenZdtRTvZjm9vbSvJmBjKpEfZSmYEdeTKYlKG
 WD5ac56SN1E3n/MJPeLK7XjbjXUDIWmdMnT2nauS6H5TSj4AxxXURYF96Qfis5HSbZjS
 qK+9oQAi7RC+rVzxnmvR6Oxl+uPcIohFR6H7V+nhF6CBJYg1lNrtmSY9BsVCpKj9EYOC
 evaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6AkzvLAhb44ySDSJof1CTP/r441hp6IrMh57XhAQ5QU=;
 b=iffAIfAKzFNR41XiluRpX9S/CQHF+qGw7AFrDuhSWjRcJlTMyOoVsXMo8TBKdY7K5E
 lUCdk2wvRzUw8I1dD1BnPtA3B3CK/+/Dzw0QDRVo97vd8vByUkoey1u7Fd5+/n9rpQtx
 3Rw5glEmIll1GKjC6WeaMqKq/tjge6OLPj9koFdFRhvXqzMEZQ1n84hzVrZXfwuSxOdA
 cG++HMS0qWaI4qNpC3NCLUoeLDVTyERQWAroFlSDxYdhr1ChgbZusP5Wt2hV1OupX+/w
 wLHsXWPwuLMas24IkZTJkOyub3Kc8m41j37BsuX6mSk/jzasy7wu5aWAsf3U/Idvey2N
 6RcQ==
X-Gm-Message-State: APjAAAW7nxfUUP/X4UmeMEZfLoqu53vuqQM7HEFG2H6bVRGrj0U3OCJQ
 MbVfRCeJQNBmSIQAfKcLY3hTiQ==
X-Google-Smtp-Source: APXvYqwAf9uoH1s9sLDcRT8qkxaQoZiC+RAh4A0ZNB5kuA3yUd9Ew79QgOBoM1AP9p33GX0KgR8q+g==
X-Received: by 2002:a62:1688:: with SMTP id 130mr2607323pfw.187.1565827648302; 
 Wed, 14 Aug 2019 17:07:28 -0700 (PDT)
Received: from localhost ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id n185sm762325pga.16.2019.08.14.17.07.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:07:27 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Balbir Singh <bsingharora@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 7/7] powerpc: add machine check safe copy_to_user
In-Reply-To: <74d12529-d068-0210-e229-5cea68bcf9da@gmail.com>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-8-santosh@fossix.org>
 <74d12529-d068-0210-e229-5cea68bcf9da@gmail.com>
Date: Thu, 15 Aug 2019 05:37:24 +0530
Message-ID: <874l2jqojn.fsf@santosiv.in.ibm.com>
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
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Balbir,

Balbir Singh <bsingharora@gmail.com> writes:

> On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
>> Use  memcpy_mcsafe() implementation to define copy_to_user_mcsafe()
>> 
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>>  arch/powerpc/Kconfig               |  1 +
>>  arch/powerpc/include/asm/uaccess.h | 14 ++++++++++++++
>>  2 files changed, 15 insertions(+)
>> 
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 77f6ebf97113..4316e36095a2 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -137,6 +137,7 @@ config PPC
>>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
>>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>>  	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
>> +	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>  	select ARCH_KEEP_MEMBLOCK
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index 8b03eb44e876..15002b51ff18 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -387,6 +387,20 @@ static inline unsigned long raw_copy_to_user(void __user *to,
>>  	return ret;
>>  }
>>  
>> +static __always_inline unsigned long __must_check
>> +copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
>> +{
>> +	if (likely(check_copy_size(from, n, true))) {
>> +		if (access_ok(to, n)) {
>> +			allow_write_to_user(to, n);
>> +			n = memcpy_mcsafe((void *)to, from, n);
>> +			prevent_write_to_user(to, n);
>> +		}
>> +	}
>> +
>> +	return n;
>
> Do we always return n independent of the check_copy_size return value and
> access_ok return values?

Yes we always return the remaining bytes not copied even if check_copy_size
or access_ok fails.

Santosh

>
> Balbir Singh.
>
>> +}
>> +
>>  extern unsigned long __clear_user(void __user *addr, unsigned long size);
>>  
>>  static inline unsigned long clear_user(void __user *addr, unsigned long size)
>> 
