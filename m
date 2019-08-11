Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D088F00
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 03:36:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465hR62py1zDqvR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 11:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="AXhhUFeo"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465hPK0c3nzDr70
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 11:35:16 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id t132so47729577pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 18:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Zw+nh8qCKQOD3K2GFW9bgpIFhSU9vSD+z99NnnwXM2c=;
 b=AXhhUFeoBKKdT9LsBrc2PAhjlbi66oD6k7OARW/cod+XbPKUbLhJWk1yy6JGRz4xUP
 x2H4e7331p+kJl0SVIcrzZSO1AfMmOte1PoYKDuWy1amc+HoFuQck8bflfZx2w0ODNs+
 ri4t//L0Keq5NT5hHM+Tgz4gEAcEn9ql6eaYoKF8HepGxWjANmlw5JKddNdfvtjyi3wu
 w7nR3+4uoFGBzjBsMoEHyEMMQH42pt/I4zX+649Knjg+Bl/exC8h2hewQnHaTGXh4pkL
 6UwLPZYdYoRNbvNjvzBDNSelAqF4gOL2AhvqN7fMj82ba/iPE6b5GSelJ4NVkbzbu4Qc
 aY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Zw+nh8qCKQOD3K2GFW9bgpIFhSU9vSD+z99NnnwXM2c=;
 b=edxrBYKFT3Hb4y7ieaOZOmZTUnwpsUX+I56CKMnVfT+YbzjbM/e3suU2lt37AeReXE
 bEQx8urKbWkV6WUdbfH2b8MharpYCLFwVxL9ujO+TA87APFsXqb9U8KWHKs/qVALzxMY
 XpzINhJmbX5IlZCzz1Rr3l/giGZ/DmmorFEadROWeL7FCPQmiwyffVmotVsBExoyoJqh
 0nJtFHQpx9ShAuSnGjGn188TTeJQ53hdPhYYRv3ODM3HQg6wUYMrEhbx2o0uEk1EohAL
 +rew5nchYjGQwnWTdpJgk4oiDJDgyVKwbdL4R2Az0mXnF0Mb2crZrOPE3B7cmBAwWIjy
 kIxA==
X-Gm-Message-State: APjAAAUkkQeoNxH4Aw7EsYMnX1d1nCJ5Wxj6HaQoDiLvTSDzVqgNwcsq
 n4qu5C9viwpQD0gxC2ajMDAZXw==
X-Google-Smtp-Source: APXvYqydaLReTPGJtMm22+pRsfy2OronyOq4BntAxsQzFMMtz7OvGX0hZQWSl1UjwwA74cJeApqAqQ==
X-Received: by 2002:a17:90a:8c18:: with SMTP id
 a24mr16554646pjo.111.1565487311837; 
 Sat, 10 Aug 2019 18:35:11 -0700 (PDT)
Received: from localhost ([183.82.18.139])
 by smtp.gmail.com with ESMTPSA id 21sm8443524pjh.25.2019.08.10.18.35.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 10 Aug 2019 18:35:11 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 7/7] powerpc: add machine check safe copy_to_user
In-Reply-To: <87lfw1s6u0.fsf@concordia.ellerman.id.au>
References: <20190807145700.25599-1-santosh@fossix.org>
 <20190807145700.25599-8-santosh@fossix.org>
 <87lfw1s6u0.fsf@concordia.ellerman.id.au>
Date: Sun, 11 Aug 2019 07:05:09 +0530
Message-ID: <87mugg8oxe.fsf@santosiv.in.ibm.com>
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

Michael Ellerman <mpe@ellerman.id.au> writes:

> Santosh Sivaraj <santosh@fossix.org> writes:
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
>> +}
>
> This looks OK to me.
>
> It would be nice though if copy_to_user_mcsafe() followed the pattern of
> the other copy_to_user() etc. routines where the arch code is only
> responsible for the actual arch details, and all the checks are done in
> the generic code. That would be a good cleanup to do after this has gone
> in, as the 2nd implementation of the API.

Sure, will do that.

>
> cheers

