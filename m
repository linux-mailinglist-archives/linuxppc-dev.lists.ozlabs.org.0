Return-Path: <linuxppc-dev+bounces-4800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEEA05263
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 05:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSbDF6ywSz3028;
	Wed,  8 Jan 2025 15:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736312045;
	cv=none; b=Kgn9IX6f7GlZs1E1Ov6tyr90zLoO4ySMjlXW2niCjb4loiZunSM374Rp4O0RpxFO9quPWcq3AC/p0FeoEW768n0a+WAF4Hzdt8dzQdIscbQtsXzN1UgwYliSH3E8qA4tvfehM63DAXDzNT3jjpMnTEUedNDmobuLxvRYTSl1Q2MFUBYIDOD+jBdrQhDOdgeXan9Xg1+EFcQx+rgCu5iX60aTzbmW1hYdwYyx03z00BWvoVJzQkYfK469gYOuCHgPbwNrsAadzQOqjWu7NQgN5qpS1FszzBzaREbGAnwIZ0ls8sO2tpQZNtHScuh1MCYWH+Qu8Vlh4U3xfEKNvDk54w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736312045; c=relaxed/relaxed;
	bh=NTAeASi7vVObUDW8V2zM5ksK3/uTU7NPiyOQuEofviY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSwIDAQekSClG3BOu/YsTj+RwuYhMtrcj7i+ha6OdA1mUnK6yzz02AOTXXBVshC9MvIWxzxW87IvRHabEvqReUfKSPo1rWZVUBtZpv/RG4AAqG6ve+Eaeij2ZmiW3iNo2bnOht4LTHwtRvx0Czfj/jDM4wAouEc95w8eF0V9gbltMn2I7+AvdCfENBJ8jtW/JUgo9Dvtr7IIg8eWlgnYNONk31qQAzybWEM+vF6NCAd1B+UwbC9qs0b0222tG4NErdoWJLP6lJdgtRE62blCkmFh5pOwaYFo/HwX4Sp/dqzJ2+Bxzu1xVOHJaHb/ifXOM+tDt2b4escG2RuXF9c6kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RibuA00L; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RibuA00L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSbDD5lVjz301N
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 15:54:02 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so23678776a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 20:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736312040; x=1736916840; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTAeASi7vVObUDW8V2zM5ksK3/uTU7NPiyOQuEofviY=;
        b=RibuA00Lgt9O09P17JsLmIYlBlc2/BJNZg+1ci6rNZD0YdkkAKXIAqKEvKOcCkQRyl
         B8eDcikFXbYsVEoRrFfsV7caqaUEq4ehtwnVXTAqbRgoRTY4g4Wmj/ayY7l2ANJZe04J
         ci+Xx67ELVnsnnrJ15JEl4UI2Ilpm9leVqLlie48W04YXYB+nfsYIkQj62FLrP+9UNZB
         CCniamZPkRL+8RtriVldE+55n+wedA6+5VC3q1HKCDySC2EUnglMCcN4ntvQ7Vlg1SgP
         LeZZIFv2TzQAuUOTUVQlDx7+F5cD5kAf4sp9z0yRBOSU4ppcaMR0eLJfZ3JYA/6m0AeG
         X05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736312040; x=1736916840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTAeASi7vVObUDW8V2zM5ksK3/uTU7NPiyOQuEofviY=;
        b=fPh4VTTZMx8/DeGy+Q9I2F+y9UH8GiEgK1eiCs6T18FGL90bW+V5BUk5+apKldd4EB
         ebGO4JzZ4SxLEwcz6e1J0rSwplmkW4wK4Fr+cTwJrTtwNE3k4bPpApWyOOZ4LfZIBK53
         NGbqiFQa0kFsIcRQVjILS43kSaR9YJRljdfyNWj+pO5T/xEZGUUiDMuUdDUkdlz9iN0h
         PADelDQElJtY2I0m80Cut8VJu6qDMN9BXXVwEqtPSG4V0ub5+7rAB/dJrTw0FjaYyXxT
         6iBpqYKqNz1SRRWm/u1eSS4/3qp7BarHke1TOqKr7yOpOLdxgcgU3WQt23HfMJ8wR+kD
         JaMA==
X-Forwarded-Encrypted: i=1; AJvYcCUi2Ws9/q44nyQSYiuTVEq4HC9gNCSwJ3do3TQVRq3bOwAYSaiRt4nsKFR7YOf7kUzuUuSc5Qv9fPgv1og=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzLpXpkmt31d/AhvQ1RpeGHAgVVV1TfBGlUMBkoiqofXa5KgWu
	WryIdyaPjOn5rFIp73utZYAS0P+WK2sxnSpnQ751Mv/8D7/kuWtQtg18LQwggn8=
X-Gm-Gg: ASbGnctiAbiLyO9vqTz4foA0hjpm3CceMcAgwbEyub6dIYGdATVAij3LUVeotfv4z0C
	PtRxNQt7UOUScQsrcRlHMyZPnk4V+vmzrkYzwXzNMBibxSMoR0mVExWW04F/i4rAh/rsUUsEyUd
	TyrdfjgzufgLD5lD7N29Zh8zmnDD+kjB8RbXMks2gxFTyKXrbvByw+vD0egzHjJldnJqWoWktPi
	AfHnHlWl7XEmL4cRUV2g8U0aZh955BZRuVysMdM1L9T5EIBVJZQT/uCPwX62laIXIA=
X-Google-Smtp-Source: AGHT+IGF/lDnmbVBM65O0BZ//6tKBYkr4Hn46ySNw0SXEM+WKDuSN4ZlNc368YPeAlJVvXi3c8brJg==
X-Received: by 2002:a05:6a00:1385:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72d21f17738mr1884512b3a.4.1736312039609;
        Tue, 07 Jan 2025 20:53:59 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d012b1de0sm4918303b3a.80.2025.01.07.20.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 20:53:59 -0800 (PST)
Message-ID: <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
Date: Wed, 8 Jan 2025 13:53:51 +0900
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
Subject: Re: [PATCH v3 5/6] s390/crash: Use note name macros
To: Dave Martin <Dave.Martin@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, kexec@lists.infradead.org,
 binutils@sourceware.org, devel@daynix.com
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
 <Z31Tp0nMhb/ntUW0@e133380.arm.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <Z31Tp0nMhb/ntUW0@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/01/08 1:17, Dave Martin wrote:
> Hi,
> 
> On Tue, Jan 07, 2025 at 09:45:56PM +0900, Akihiko Odaki wrote:
>> Use note name macros to match with the userspace's expectation.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
>>   1 file changed, 23 insertions(+), 39 deletions(-)
>>
>> diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
> 
> [...]
> 
>> @@ -281,10 +272,8 @@ static void *nt_init_name(void *buf, Elf64_Word type, void *desc, int d_len,
>>   	return PTR_ADD(buf, len);
>>   }
>>   
>> -static inline void *nt_init(void *buf, Elf64_Word type, void *desc, int d_len)
>> -{
>> -	return nt_init_name(buf, type, desc, d_len, nt_name(type));
>> -}
>> +#define NT_INIT(buf, type, desc) \
>> +	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
> 
> Nit: this macro name clashes with the naming scheme in elf.h.
> 
> I think that there is a (weak) convention that macros with upper-case
> names don't expand to a C function call; thus, a macro with an upper-
> case name can be invoked in places where a C function call would not be
> allowed.  (This convention is not followed everywhere, though -- it's
> up to the maintainer what they prefer here.)

I wanted to clarify it is a macro as it concatenates tokens with ##, but 
I also find there are many macros that are named lower-case and performs 
token concatenation.

S390 maintainers, please tell usr your opinion.

> 
> (Note also, the outer parentheses and the parentheses around (buf)
> appear redundant -- although harmless?)

They only make a difference in trivial corner cases and may look 
needlessly verbose.

> 
>>   
>>   /*
>>    * Calculate the size of ELF note
>> @@ -300,10 +289,7 @@ static size_t nt_size_name(int d_len, const char *name)
>>   	return size;
>>   }
>>   
>> -static inline size_t nt_size(Elf64_Word type, int d_len)
>> -{
>> -	return nt_size_name(d_len, nt_name(type));
>> -}
>> +#define NT_SIZE(type, desc) (nt_size_name(sizeof(desc), NN_ ## type))
> 
> Nit: name prefix clash (again); possibly redundant parentheses.
> 
> [...]
> 
>> @@ -348,16 +332,16 @@ static size_t get_cpu_elf_notes_size(void)
>>   	struct save_area *sa = NULL;
>>   	size_t size;
>>   
>> -	size =	nt_size(NT_PRSTATUS, sizeof(struct elf_prstatus));
>> -	size +=  nt_size(NT_PRFPREG, sizeof(elf_fpregset_t));
>> -	size +=  nt_size(NT_S390_TIMER, sizeof(sa->timer));
>> -	size +=  nt_size(NT_S390_TODCMP, sizeof(sa->todcmp));
>> -	size +=  nt_size(NT_S390_TODPREG, sizeof(sa->todpreg));
>> -	size +=  nt_size(NT_S390_CTRS, sizeof(sa->ctrs));
>> -	size +=  nt_size(NT_S390_PREFIX, sizeof(sa->prefix));
>> +	size =	NT_SIZE(PRSTATUS, struct elf_prstatus);
>> +	size +=  NT_SIZE(PRFPREG, elf_fpregset_t);
>> +	size +=  NT_SIZE(S390_TIMER, sa->timer);
>> +	size +=  NT_SIZE(S390_TODCMP, sa->todcmp);
>> +	size +=  NT_SIZE(S390_TODPREG, sa->todpreg);
>> +	size +=  NT_SIZE(S390_CTRS, sa->ctrs);
>> +	size +=  NT_SIZE(S390_PREFIX, sa->prefix);
> 
> It might be worth fixing the funny spacing on these lines, since all
> the affected lines are being replaced.
> 
>>   	if (cpu_has_vx()) {
>> -		size += nt_size(NT_S390_VXRS_HIGH, sizeof(sa->vxrs_high));
>> -		size += nt_size(NT_S390_VXRS_LOW, sizeof(sa->vxrs_low));
>> +		size += NT_SIZE(S390_VXRS_HIGH, sa->vxrs_high);
>> +		size += NT_SIZE(S390_VXRS_LOW, sa->vxrs_low);
>>   	}
>>   
>>   	return size;
>> @@ -373,7 +357,7 @@ static void *nt_prpsinfo(void *ptr)
>>   	memset(&prpsinfo, 0, sizeof(prpsinfo));
>>   	prpsinfo.pr_sname = 'R';
>>   	strcpy(prpsinfo.pr_fname, "vmlinux");
>> -	return nt_init(ptr, NT_PRPSINFO, &prpsinfo, sizeof(prpsinfo));
>> +	return NT_INIT(ptr, PRPSINFO, prpsinfo);
>>   }
>>   
>>   /*
>> @@ -589,7 +573,7 @@ static size_t get_elfcorehdr_size(int phdr_count)
>>   	/* PT_NOTES */
>>   	size += sizeof(Elf64_Phdr);
>>   	/* nt_prpsinfo */
>> -	size += nt_size(NT_PRPSINFO, sizeof(struct elf_prpsinfo));
>> +	size += NT_SIZE(PRPSINFO, struct elf_prpsinfo);
>>   	/* regsets */
>>   	size += get_cpu_cnt() * get_cpu_elf_notes_size();
>>   	/* nt_vmcoreinfo */
> 
> Otherwise, this looks sensible to me.
> 
> Cheers
> ---Dave


