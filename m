Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F28332B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 05:14:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jXariojB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TH35h3xJNz3cQX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 15:14:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jXariojB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=palmer@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TH34q1gltz3bYQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 15:13:29 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-361ae51a4d9so2989345ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 20:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705724006; x=1706328806; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEQfFjGG9xeqy4UfcMEbmKUfJ92yD+DVChzT3CuoIZ8=;
        b=jXariojBdOJMnJUdeROp6DNhGLcNLJoF3RzA3+SLc1siuPjWnVl4SXW8KHxdatIjey
         wec6TJHYxo8/6Sw/gfUwBgofU958SmpKkStQXpm14+CXpiHRSEQR0XL3SLgmzKLEnBb5
         vDaNRQwLh2Gm/yLa/P7TY5C7k1bpvEyGNfYDazk6wFp07QmQhBMjbKrsN2Rl8thxobmE
         Z14rPNDrKPB0jVlAhv97qEq1YMUj5n9hMD/RUlDtyLqy/TMuhnk8lQZnjc4s/9Aqidao
         sJfjp3wC+W+Ks9lXwdkYckbuCp4ub3ooA0hqxD+NdBYBplGdYJR6rVhekcCXK6dKoYuB
         FOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705724006; x=1706328806;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEQfFjGG9xeqy4UfcMEbmKUfJ92yD+DVChzT3CuoIZ8=;
        b=EGPxL5y5O8nbNmbIzocZp324GPZ9FIhtaMM2OjeXJMH28uCOJj8s64b2xg5K+qT7Eh
         GGvpUyFTURFXJPu8YIifJhF806Vey1tWyG0BXevgR7awBIwrUVpJf88xFJ6b0GcfNmEr
         tQ5cxpj30HXiLDmHIg/P51S6DOD2UR7DRmDyYLiZYqqy6YIt+/pdM6FySixDdoBiTB4L
         MkECDoYpAQ/agocWXeuaaWJBBtPpfssJGXl63FF1uhSQAHRQ1i8WeJa5O6u/GrtkBeHS
         8xYlsfQ4VUt9zqiqqrbWSSNSzvqro3bVXTike1JosfQRsngPGJisrcgw6NsitPgcHlTz
         zXnQ==
X-Gm-Message-State: AOJu0Ywdco6nFAMlfJJ2uPvx4+PG2NOEqSVf6/UXWVE9kqSAG/GJyADW
	TG/20750Hrb5yUQXcQV217w74/Xq/O+qZVCS9IDumetAo9AtItMQSyBrYRCzuH8=
X-Google-Smtp-Source: AGHT+IHn/lDsj6RpPJ5iOJ3naXMlOTNeOjJPdGGzDt9qU3TE5KrD+gOz+Skv2dSn1c3/Yo+fhVy9cA==
X-Received: by 2002:a92:c70f:0:b0:361:ab5c:210d with SMTP id a15-20020a92c70f000000b00361ab5c210dmr1150792ilp.32.1705724006287;
        Fri, 19 Jan 2024 20:13:26 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id kx6-20020a170902f94600b001d5f59fe6aasm3743602plb.37.2024.01.19.20.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 20:13:25 -0800 (PST)
Date: Fri, 19 Jan 2024 20:13:25 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 20:13:22 PST (-0800)
Subject: Re: [PATCH v2] tty: hvc: Fix the RISC-V SBI driver for a refactoring
In-Reply-To: <CAAhSdy0naZf8aKkAH6MgYyLior3rZEjx0WWWgp4Ljakrb5q5XQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org
Message-ID: <mhng-c6ffd557-de85-4e89-b8aa-c4ac80951e81@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Jan 2024 19:59:11 PST (-0800), anup@brainfault.org wrote:
> On Sat, Jan 20, 2024 at 4:15 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> I missed the int->size_t refactoring in f32fcbedbe92 ("tty: hvc: convert
>> to u8 and size_t"), which causes the newly used ops in 88ead68e764c
>> ("tty: Add SBI debug console support to HVC SBI driver") to fail to
>> build due to a
>>
>> linux/drivers/tty/hvc/hvc_riscv_sbi.c:59:15: error: incompatible function pointer types initializing 'ssize_t (*)(uint32_t, const u8 *, size_t)' (aka 'long (*)(unsigned int, const unsigned char *, unsigned long)') with an expression of type 'int (uint32_t, const char *, int)' (aka 'int (unsigned int, const char *, int)') [-Wincompatible-function-pointer-types]
>>         .put_chars = hvc_sbi_dbcn_tty_put,
>>
>> Fixes: f32fcbedbe92 ("tty: hvc: convert to u8 and size_t")
>> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
>> Link: https://lore.kernel.org/r/20240119215612.20529-2-palmer@rivosinc.com
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> Changes since v1 <20240119215612.20529-2-palmer@rivosinc.com>:
>> * Fix the return and arguments correctly.
>> * Also fix the hvc_sbi_dbcn_tty_{get,put}().
>> ---
>>  drivers/tty/hvc/hvc_riscv_sbi.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
>> index 2f3571f17ecd..f8cd3310ef35 100644
>> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
>> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
>> @@ -15,7 +15,7 @@
>>
>>  #include "hvc_console.h"
>>
>> -static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
>> +static ssize_t hvc_sbi_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
>>  {
>>         int i;
>>
>> @@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
>>         return i;
>>  }
>>
>> -static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
>> +static ssize_t hvc_sbi_tty_get(uint32_t vtermno, u8 *buf, size_t count)
>
> The hvc_sbi_tty_put() and hvc_sbi_tty_get() functions are already
> updated in Linus's tree. We only need to fix hvc_sbi_dbcn_tty_put()
> and hvc_sbi_dbcn_tty_get()
>
> Please rebase this fix upon Linux-6.8-rc1 whenever that is available.

Ya, it's kind of clunky: we added functions at the same time as the 
refactoring, so there's no good clean tree to apply a patch to.  Right 
now I've actually got this bundled up into a merge, that's usually the 
worst option but it's about as good as I could come up with -- Linus 
still hasn't merged my part 2, so I'm going to send a part 3 once I get 
through the tests on my end.

So we'll see, likely tomorrow, and then I'll deal with the fallout after 
rc1...

>
>>  {
>>         int i, c;
>>
>> @@ -44,12 +44,12 @@ static const struct hv_ops hvc_sbi_v01_ops = {
>>         .put_chars = hvc_sbi_tty_put,
>>  };
>>
>> -static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
>> +static ssize_t hvc_sbi_dbcn_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
>>  {
>>         return sbi_debug_console_write(buf, count);
>>  }
>>
>> -static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
>> +static ssize_t hvc_sbi_dbcn_tty_get(uint32_t vtermno, u8 *buf, size_t count)
>>  {
>>         return sbi_debug_console_read(buf, count);
>>  }
>> --
>> 2.43.0
>>
>>
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thanks,
> Anup
