Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038EF8C676C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:34:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=AXekDMCF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfZ1r5hkRz3cWR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 23:33:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=AXekDMCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfZ150hMfz30WB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 23:33:11 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-51fb14816f6so8912488e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715779988; x=1716384788; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IZnKfmHcaXKfk4mANRDz90u7oAjx4Am3VbR95ZF3WgM=;
        b=AXekDMCF9W8LLFH/i6i8CKgyWYRnnTq5M1jUUH6Rq3jZ1Vv+X3f5/oAha/3itEDVwB
         kDs1sVXoFcpmwOGoCsW+hRyPEeUTYo3geLRMxpuheq2YF+aPho9ioztb97nAew1XBmnH
         Lr5DhXx/6fWx73+Sjm3Q9jCHMsFB6BfmP/ft8pP7rPMi76tp+s4batGjl6MMtKSHw5yQ
         747GCjjG+td2xkHaozyPEPgPPGGHPvsocoKX1dOfdQTlZYu+scX1zkoc40Jjv5F5pStc
         eS21OGFc3/OIh18MPCo9v7ad6dPVj+DqA6OkOfigyaZ1FIGk/HFxmOhKwAiG7Jp7vVyv
         c7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715779988; x=1716384788;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZnKfmHcaXKfk4mANRDz90u7oAjx4Am3VbR95ZF3WgM=;
        b=uIcsiqKWQqGXSUa/vhv9xp+73rCpd/KP2BKPnkMbg7FiLlxJb28IGFY/LpARetMZaI
         iqbf1zZhbCxfITbu7I+p3E7Tzvf4H0+ss3fRMLByRCRwLa41TBuvOESUpkrFOLc8cJdy
         Fl5Eiho/8v9lzPANZ+oM5A7h62XbdV0jqLLpUXWPWOZrMqROzDpngyzpefz5ql1rGwpK
         RfRRAUDCSIjtsaqBYZs9QWMZmsMMYa+TFB37fddM3QCfwEHGKjv4E6xfl64+JCi9VGFb
         eUZTNl2k5Ue7XKbmSOS4Zq0etFAKa3GbRVt7dByON0bD3mRTZRqJQE4EsqAECV5m75XP
         ZfYg==
X-Forwarded-Encrypted: i=1; AJvYcCWjr0GL2whicpuvPWpExAmEG33LPemkJLbYurTfsbiVNrGvuWsbGcht43IbFW3YjkQwWoVGHDPsq1wcrh3RRO6EwLSzePYMJOeEjxea6A==
X-Gm-Message-State: AOJu0YxijUhxZ6plfcrCitl2ZxXSeij8R0T8krcI7wXQbCeOshGvvDAy
	b/BFuq7VAtQ1iXpXzaRYMVQWWyAO5n3/N80NSyQLe51GBPyJpDNxN4LDeOr9KWs=
X-Google-Smtp-Source: AGHT+IHARK6h98zaZeHwpQW3CC/oAdRtrkGoOz4whPQzV2TK8WECwB1HF5F/+Wjw4JdTyvdc6/Eqyw==
X-Received: by 2002:a05:6512:3e10:b0:51a:f16d:52a8 with SMTP id 2adb3069b0e04-52210070178mr14110770e87.50.1715779987823;
        Wed, 15 May 2024 06:33:07 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d86b3sm2613126e87.210.2024.05.15.06.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 06:33:07 -0700 (PDT)
Message-ID: <7eb6bf4b-5510-48fe-aa6c-ac5207d5a2c1@cryptogams.org>
Date: Wed, 15 May 2024 15:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: X25519 core functions for ppc64le
From: Andy Polyakov <appro@cryptogams.org>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-3-dtsen@linux.ibm.com>
 <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
Content-Language: en-US
In-Reply-To: <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> +static void cswap(fe51 p, fe51 q, unsigned int bit)
>> +{
>> +    u64 t, i;
>> +    u64 c = 0 - (u64) bit;
>> +
>> +    for (i = 0; i < 5; ++i) {
>> +        t = c & (p[i] ^ q[i]);
>> +        p[i] ^= t;
>> +        q[i] ^= t;
>> +    }
>> +}
> 
> The "c" in cswap stands for "constant-time," and the problem is that 
> contemporary compilers have exhibited the ability to produce 
> non-constant-time machine code as result of compilation of the above 
> kind of technique. The outcome is platform-specific and ironically some 
> of PPC code generators were observed to generate "most" 
> non-constant-time code. "Most" in sense that execution time variations 
> would be most easy to catch.

Just to substantiate the point, consider 
https://godbolt.org/z/faYnEcPT7, and note the conditional branch in the 
middle of the loop, which flies in the face of constant-time-ness. In 
case you object 'bit &= 1' on line 7 in the C code. Indeed, if you 
comment it out, the generated code will be fine. But the point is that 
the compiler is capable of and was in fact observed to figure out that 
the caller passes either one or zero and generate the machine code in 
the assembly window. In other words 'bit &= 1' is just a reflection of 
what the caller does.

> ... the permanent solution is to do it 
> in assembly. I can put together something...

Though you should be able to do this just as well :-) So should I or 
would you?

Cheers.

