Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F788E80F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:11:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jmsmEL1R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VWD60TNz3vdw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jmsmEL1R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VVV0PcMz3ddR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:10:57 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e740fff1d8so4975879b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711552255; x=1712157055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GhC1S2pW9btr9pVuDZELsqNgJuQdIsA6xlv8onmT65s=;
        b=jmsmEL1R6KhFu1V9/MaL7T8G3hoOkDspvkKsERHNT0L9aaPog8/TYG4Z8cL/fww1DX
         ZTuvLpC6D7mv/3IUAtx5hcI/DTBMOGZdGr1EU/oLLWDeGoM2RF07m7abn8PXi48ViXqy
         nUEXrRWymPsYlWb+RbyCN22xwpuur9v4rVm94MHrAtNW5g8BTUnSkn6WHvStxKiK2EzL
         00udxVJJZtkgv5uXmBqQFecwNm66uNBOzjexMsLIxWDJRjr/TmcqjpxuSZ6XxKZpbNwK
         iTUvK1rgpWB6BOrx+c/ZcKIDeFi1ddWca8Dg8+aqamUTH7rK2CUhruaambdM6XzHllin
         7mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552255; x=1712157055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhC1S2pW9btr9pVuDZELsqNgJuQdIsA6xlv8onmT65s=;
        b=SU/SbRgcUPrqvZc1+75R4c/WOardnk+6lRn9v49O/WgxxwtuPfQW5oJbAIuVQYN4iX
         jV6nIeSgrz1AreVGATd9F+x1ar9M4XbbfGJVmLIkZ/cF4Usn3lw4Z+axTWXkA6pH57/d
         AltStADpzjFRRB8tv9Xn5e97ncEv1wDA7FeBL/GGAtwqg9IAktdKa+yCs4cyulnBJjkw
         TXVU+CsSd+NMI8KWVcIN6Gc4FhXM52WZgyY6FugGWnWHkARbIbQDO0L52ALGNAnavmXN
         sFHws2H/XcQq+BZ099oDYlLxG6p5dgajuGtV81ctZv4EVatvOMhZa2VZ29nO1xC7AftU
         QNtg==
X-Forwarded-Encrypted: i=1; AJvYcCVlVTiM4MIQuAgpTkx1JQYxBdmMbB/2U4RCtxH4LvxMDPsfPICgY45KTHc4QT02aYixhRxcA6xl4oxqKOIvqVJbYsT+B25Q3Y2h8ZPGzA==
X-Gm-Message-State: AOJu0Ywkr/HDlTmhqK9sMGsOVVc9nBjOG4ChEzgj7FNHE8aK4DHv/otQ
	t248Oa4sxeifTOcxmTx8yVG1xkCIUDe6Deep8xBCuNDELshDFK72
X-Google-Smtp-Source: AGHT+IFTcwPFOlfI6eRT+0rf0ZnAMCTISb8ttH9tKFaraPJRt460mqVcAAiNBuFiDAxZrRyiWoSPIw==
X-Received: by 2002:a05:6a20:f39d:b0:1a0:adbc:7a96 with SMTP id qr29-20020a056a20f39d00b001a0adbc7a96mr225466pzb.36.1711552255375;
        Wed, 27 Mar 2024 08:10:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u8-20020a62ed08000000b006e4e616e520sm7950526pfh.72.2024.03.27.08.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:10:54 -0700 (PDT)
Message-ID: <320aacc6-b7e5-4c3d-948e-d0743ab26c5d@roeck-us.net>
Date: Wed, 27 Mar 2024 08:10:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
 <20240327144431.GL403975@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240327144431.GL403975@kernel.org>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux
 -kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/27/24 07:44, Simon Horman wrote:
> On Mon, Mar 25, 2024 at 10:52:46AM -0700, Guenter Roeck wrote:
>> Add name of functions triggering warning backtraces to the __bug_table
>> object section to enable support for suppressing WARNING backtraces.
>>
>> To limit image size impact, the pointer to the function name is only added
>> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
>> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
>> parameter is replaced with a (dummy) NULL parameter to avoid an image size
>> increase due to unused __func__ entries (this is necessary because __func__
>> is not a define but a virtual variable).
>>
>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> - Rebased to v6.9-rc1
>> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
>>
>>   arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
>> index 05a485c4fabc..470ce6567d20 100644
>> --- a/arch/sh/include/asm/bug.h
>> +++ b/arch/sh/include/asm/bug.h
>> @@ -24,21 +24,36 @@
>>    * The offending file and line are encoded in the __bug_table section.
>>    */
>>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>> +
>> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
>> +# define HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
>> +#else
>> +# define __BUG_FUNC_PTR
>> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
>> +
> 
> Hi Guenter,
> 
> a minor nit from my side: this change results in a Kernel doc warning.
> 
>       .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead
> 
> Perhaps either the new code should be placed above the Kernel doc,
> or scripts/kernel-doc should be enhanced?
> 

Thanks a lot for the feedback.

The definition block needs to be inside CONFIG_DEBUG_BUGVERBOSE,
so it would be a bit odd to move it above the documentation
just to make kerneldoc happy. I am not really sure that to do
about it.

I'll wait for comments from others before making any changes.

Thanks,
Guenter

>>   #define _EMIT_BUG_ENTRY				\
>>   	"\t.pushsection __bug_table,\"aw\"\n"	\
>>   	"2:\t.long 1b, %O1\n"			\
>> -	"\t.short %O2, %O3\n"			\
>> -	"\t.org 2b+%O4\n"			\
>> +	__BUG_FUNC_PTR				\
>> +	"\t.short %O3, %O4\n"			\
>> +	"\t.org 2b+%O5\n"			\
>>   	"\t.popsection\n"
>>   #else
>>   #define _EMIT_BUG_ENTRY				\
>>   	"\t.pushsection __bug_table,\"aw\"\n"	\
>>   	"2:\t.long 1b\n"			\
>> -	"\t.short %O3\n"			\
>> -	"\t.org 2b+%O4\n"			\
>> +	"\t.short %O4\n"			\
>> +	"\t.org 2b+%O5\n"			\
>>   	"\t.popsection\n"
>>   #endif
>>   
>> +#ifdef HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC	__func__
>> +#else
>> +# define __BUG_FUNC	NULL
>> +#endif
>> +
>>   #define BUG()						\
>>   do {							\
>>   	__asm__ __volatile__ (				\
> 
> ...

