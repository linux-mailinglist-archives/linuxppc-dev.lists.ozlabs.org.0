Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DE8C72FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 10:39:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=dGCczesd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg3Rs4j5tz3fmn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 18:39:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=dGCczesd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg3R53MSCz3clp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 18:38:55 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-51f72a29f13so591155e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715848725; x=1716453525; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOeW1i0XSjN8EcRDRG2ima3ZBqcENGXoN19rlekIi1o=;
        b=dGCczesd1ClVon8SgMAx4u1ilm5LOP3rUY4QX0+dk/CPHpMpxrWqf/11xoxgnHl4vW
         ZcyO9gTV2/TPVII9Tqvl1W7+RfWomjDKrwqMo66ouguAxNXUqKQk8ygaM7AwMKkZkZyq
         ZxrKcQIbQB1TxAxtXe7ciwQrbgbCozI8XR5HJpXlE+pHrNg6nyoSWYlwo8+rnDfv8maX
         whs4dTmJzSGAy6vMwR2PDCDnKa00q8NPawt3eLwi5k/F2JXOn12gx9ZPbFeorXn7iI/3
         ou75dbUEgYrj2EXYWoUrLuETqgMHrantWb/KjxoYxnVbKbR0Epi/j4reF7yGSPMSv44N
         Z+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715848725; x=1716453525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOeW1i0XSjN8EcRDRG2ima3ZBqcENGXoN19rlekIi1o=;
        b=MChz49HTeq990LGZMarBmu0vBPXc3u0PTbOeow7hPRZSDJxwT7PvWnvTkkCdSGRMhn
         mND+QaD4oyxyqxNpanQfyhhsYQXNeISwYVTLkl7qY7atvW9+t7D2zqi2iq102qjw+8ZB
         7Hf+0xcxPo8x2qkfG/CThekQ7/AocgpXWbIiu76T4Bs2k5hqedo6eDxAx+iQmnl2o+W8
         T4QllVIERBFdkbGp8q1bf7T3LklMY1qQK5KkSY9bxHa22L4BZS+LzoydAF/MXdKxzoGw
         ao7GUkv5PjfTMSJztZOuqV40vOUs/FLyYjrefkniKEvxjOPaX3xk4nJm7ivYo8uPfz7O
         UJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzJ3O1Im0AHu4TRmnjKY5K47qKNKhKYZTxJKgTmAzCtaKlxn4epMtPQMgoyi7CCkkk0uvtMt95YzKD8pA8zCoLgfJcpkXSQFLzWx9LBQ==
X-Gm-Message-State: AOJu0Yw6rE5CMxpR8qogi1DyGIiolyqomzm9SwSTBO+O/9k4z7xosdFy
	nIi3CZzytCA8aCg39Umk+tr2DaMzIfjIFBO0UKtQujAaxopwI9OEojJqhx5tBTA=
X-Google-Smtp-Source: AGHT+IH4ciVi2WPFfN4wIB15qPhRg9zSbcHYMDpqRPhOgTsgCJ+nsPiQObpBhEe9fHl4yk1Q/wux9A==
X-Received: by 2002:a19:5f41:0:b0:518:9362:f63 with SMTP id 2adb3069b0e04-5220f97041fmr11199702e87.0.1715848724887;
        Thu, 16 May 2024 01:38:44 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad461sm2876576e87.33.2024.05.16.01.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 01:38:44 -0700 (PDT)
Message-ID: <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org>
Date: Thu, 16 May 2024 10:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Michael Ellerman <mpe@ellerman.id.au>, Danny Tsen <dtsen@linux.ibm.com>,
 linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com> <87a5kqwe59.fsf@mail.lhotse>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <87a5kqwe59.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

>> +.abiversion	2
> 
> I'd prefer that was left to the compiler flags.

Problem is that it's the compiler that is responsible for providing this 
directive in the intermediate .s prior invoking the assembler. And there 
is no assembler flag to pass through -Wa. If concern is ABI neutrality, 
then solution would rather be #if (_CALL_ELF-0) == 2/#endif. One can 
also make a case for

#ifdef _CALL_ELF
.abiversion _CALL_ELF
#endif

Cheers.

