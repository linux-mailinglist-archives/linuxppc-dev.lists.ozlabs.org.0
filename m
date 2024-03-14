Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE79B87BE1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 14:55:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OhZATZ0e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwTR83Z0Xz3vdb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 00:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OhZATZ0e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwTQR3rFCz3vX7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 00:54:38 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dd8dd198d0so7238935ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710424476; x=1711029276; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VYCoE6x/5FFdiDNbW6/F39BZo8+6Gfyjcn8t3LZwS0o=;
        b=OhZATZ0eO3NWqVdnVzPTtj3O5pGd9YE472/TDHK+Hls1CKGwS6Vy4WhmerrXn6uE5V
         M20sBS5iDhGcZxG0Vzc9wtTg+4inu2YCluibvuNlFt5sVjz5M4DHF7+qkD7SbDEbQSDJ
         JTf1eIemFAyK00MbtYVYBcJmvWzicFOWDCDZWHDB/VRwxVt163jH63M8r4P2ZegfBC6L
         Pd1DDdg46SDQy9FJuPAU0NbzuNkvsAlLHqfk753GBujtNtC42xWjLsft5WyBrQnOLTBE
         hfaQDJlRP3YtjXPfevTmqvuBAlD/CA+AD5UEju0HPs1kBLb3rxEfO4L173OlM2d0tXwA
         ydIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710424476; x=1711029276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYCoE6x/5FFdiDNbW6/F39BZo8+6Gfyjcn8t3LZwS0o=;
        b=TGsSAmruTcA4eq0GmINWIx5QwlYewjayitrkuJ+0e/vvpiCFDkc9reUMtG4SLL2X+h
         PXGAw5BTrqRsqFua/mcp5sYSfIavoLo3nkje+D4h/OvGoA6YEtJdFQ68+wZTVdfntKdj
         KEveZM0fBql7Nclg4uPEisp60C+d0H/nZpos6TwKnczD+MG22GH9WSw7SroqBhlamFlh
         HTV6RDfi7VlnsDSeLymCm19xEnkKFIQ4Hp3xBrspYtxRCcjNjmmVHie2xtszhiLG1/Lp
         nvAW8f3KJr/FVgUrp8mPfnY+0voU3DJerjtWw8zqOlpA+tvyr+tHP1KIKgh3GltFnQd2
         c/fw==
X-Forwarded-Encrypted: i=1; AJvYcCUuvOhjzmud0wtK9gCBpoVseh2jUYO72ETMpVUEbIy3Y+dcpGp8PK/6xOkXQk0iU58pt05eROgNnQ8eBkNz6g57Ul013KJr3l02aDqq2A==
X-Gm-Message-State: AOJu0YxL5Cv9B2zJVHDheFFy718qjzc82XhWRvOUeN8dZPZoEc/si4Jk
	fvF3QhRAwKKKw45AuDbs5Qh8OfjnGZIsb+mS/DAHMRuLEAsm+vYI
X-Google-Smtp-Source: AGHT+IF1d/JjNvaUdlV4zt2IUW1FJQXeQEYCUkspAPTpUNljVFGhXPd+BPdq0X4tfzWPOphzi79Nzg==
X-Received: by 2002:a17:902:d2d0:b0:1dc:6d64:dcff with SMTP id n16-20020a170902d2d000b001dc6d64dcffmr41795plc.37.1710424476027;
        Thu, 14 Mar 2024 06:54:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902e80a00b001dd95b5dd0fsm1700430plg.69.2024.03.14.06.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:54:35 -0700 (PDT)
Message-ID: <a4229dee-8a4b-488d-99de-84ed255583a5@roeck-us.net>
Date: Thu, 14 Mar 2024 06:54:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] s390: Add support for suppressing warning
 backtraces
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-12-linux@roeck-us.net>
 <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmer
 mann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/24 00:57, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> On Tue, Mar 12, 2024 at 6:06 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> Add name of functions triggering warning backtraces to the __bug_table
>> object section to enable support for suppressing WARNING backtraces.
>>
>> To limit image size impact, the pointer to the function name is only added
>> to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
>> are enabled. Otherwise, the __func__ assembly parameter is replaced with a
>> (dummy) NULL parameter to avoid an image size increase due to unused
>> __func__ entries (this is necessary because __func__ is not a define but a
>> virtual variable).
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks for your patch!
> 
>> --- a/arch/s390/include/asm/bug.h
>> +++ b/arch/s390/include/asm/bug.h
>> @@ -8,19 +8,30 @@
>>
>>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>>
>> +#if IS_ENABLED(CONFIG_KUNIT)
>> +# define HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC_PTR        "       .long   %0-.\n"
>> +# define __BUG_FUNC    __func__
>> +#else
>> +# define __BUG_FUNC_PTR
>> +# define __BUG_FUNC    NULL
>> +#endif /* IS_ENABLED(CONFIG_KUNIT) */
>> +
>>   #define __EMIT_BUG(x) do {                                     \
>>          asm_inline volatile(                                    \
>>                  "0:     mc      0,0\n"                          \
>>                  ".section .rodata.str,\"aMS\",@progbits,1\n"    \
>>                  "1:     .asciz  \""__FILE__"\"\n"               \
>>                  ".previous\n"                                   \
>> -               ".section __bug_table,\"awM\",@progbits,%2\n"   \
>> +               ".section __bug_table,\"awM\",@progbits,%3\n"   \
> 
> This change conflicts with commit 3938490e78f443fb ("s390/bug:
> remove entry size from __bug_table section") in linus/master.
> I guess it should just be dropped?
> 

Yes, I know. I'll send v2 rebased to v6.9-rc1 once it is available and,
yes, the change will be gone after that.

Thanks,
Guenter


