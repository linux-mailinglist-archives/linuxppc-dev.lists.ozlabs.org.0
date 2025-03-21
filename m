Return-Path: <linuxppc-dev+bounces-7274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C9A6C0D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 18:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK83d5hsSz30RK;
	Sat, 22 Mar 2025 04:06:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742576765;
	cv=none; b=mJ3uCDPxVlCVXj7gP5KdvE1qSge1vNjsp8JqdcfzBZ3oH0RqPVguvnlDF3TkmXI+yPqLeqx82bFSLiud/ffobb3aQ3MCW//98WNHgnn1D5a08hEbNc9rCn42dFOY+IdMFfE9Av4d7H9V7MBGFdudSyjX3wCP6BRZ7a+PFUEB/E+0TwsgQzPez8Dx54lWRc6pQZAM/SIciBIIp2jNf+OjWZKyJFNVcW4AL1A/MWTZzssk7npoPSdncoOMfo5VDJJOOZcp043B6Z31eLejsjIsV9hsBsEWScFAq2T0Afqh+uvVhawKR2tz3z9AaWtewljyEjf0iKuNqBI2OBBlpruSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742576765; c=relaxed/relaxed;
	bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQ5yehCgaJ+ohnFv3VWqzaNm0w8am6N45h8Ax10+h7GWTzUR723TGsiHy+C2TzpkCVTtdv+qS60Aj58Qy1XraIXJbvXkvK+QQCnlLdDrXxoUyEUwWcU47Up1iGQUFmXALxZvaEs3xxxfiaQsFXhWeO+A6mg6Fvbi6blduhFQK5Q9vCHhd2jt+tdD3qQntFy4IWCjLqdBq231bYuattv9lg6Cyq7XxPEiuQKKxij2eazfYFt8gJx5olOjIWGMtdDsUMshq6dE08nZ9aG4h5HbSKqcgkHSBn8HOUrAUV1AymhddFkXHOlKiC3zlUM+FwDftXKrkr/WiYDsk2KNfxK5Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cJFrl/nA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cJFrl/nA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK83b4Mzvz3089
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 04:06:02 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2235189adaeso44034535ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576760; x=1743181560; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
        b=cJFrl/nA0b1Ju0SFta7DkfHozmFKrvT37exjWVNq8TyBrnHTpAVSe/J2M1LDLu6tqf
         dNr0u+a7+ekLrlil467PF0s4ktQfj92nkaOGZie9GVqYj7d2717HF9cJKLGzstRONeRx
         UecgS3tERa4RQC2hvuzaIAVcQqkJQxl5PEaYb0Q+3aqCFQ0gIbrqDJtG4pEvhL8K/A06
         PozwNciULZnb4u8/K1RPlUj3tdyYgNbmbWvakD9kwq9kQtRnyNiYpIOUa76tgecc8GtY
         Q3wkmrXMlNHjGCJhEvMRNRmQw5vDmTF9NsA37qg/QfjzonywJ3Gr80A8JVBmCeK51fXM
         LFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576760; x=1743181560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
        b=U09xONtNO9FZHDbyqdQGxcBaUR8LdRYlKSAy6HTnKBwtwZIu7w8TLcjK/VxkS+TZHb
         46oIJboR3H0EaQIqbBpZ2P/jz/awxTbociD/kPSfB+1zLXdk92Eql9ZKKVyrKtHuTb2E
         VabC7aZXXqnIcX13aoHeKdUEO1QpiG2bQZWhbx8mfS1QKWlrY5hZD4HgJ+coZ4tGYLYH
         dvGe72lparuxQnRdmhb3w3bSf1Clj66aHSqcOPH6z/VH4isezD8Shh9mw56D5wJD7Js7
         NQ+z1JVwd75KWgf9EHQUpg/ixXbfFK40q+5jE7FvIoLxD2V58F9PQXUv620pzuYxkbbr
         ynTA==
X-Forwarded-Encrypted: i=1; AJvYcCV+tz/ERTa1/ZiAA4081177drie/ATThvIuVkjUV4cpw+BZvEx2+tG8d/0EmrotywxsIuJ7RYhBh3CgbPI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyR+DJj23mNLtlzAJQvvZDRTQv+CCr2M9rpXyWnq5J9H/EHOmE1
	M3ldBp0LiUUg1KIeyMh5D2ku+1HM5z9aPuvstIjtPeM3NzaRazLi
X-Gm-Gg: ASbGnctOBGXItBiltc6WUhtRhecutWgpttzt01uzVOnznLUOAOE+g1sl6hr13NVLENv
	inIQB68jnvxdZYgzTA/oLp3PUw3mbjkwtOQQqCFlEY7mpEIYKnRd0vJke23OBosQzt6s6jWIPb+
	xyNIqDxjHGhTqIM0i++Gyx8pe9Ggqp2X+68Y9EGjlCUgOA1ig7IiVC0JWS10v9YM5g4W6douaG6
	Q+TBaLste+vdlgSjpmRc6346b/TvZ4UQZV1ZuL73iMq75M0EwtXUx/xBk8eOzZX9efkQcrYjA9D
	igP5FC6Ptqc2Emco39KJj687nyu2c0Nue1FickKSeCwIa4PdXn0mWw1X1Q3Z+UtgXEvRhy29NA+
	zACUZzlkzEos+GDe0Vw==
X-Google-Smtp-Source: AGHT+IGlJ+Z2e1+BqNuKZjJeYaVTSO5uEIrxfNDx54p4mNFYbbGfGIs11ZjWWb6jUGSm+z6+aHdutQ==
X-Received: by 2002:a17:902:ce84:b0:223:fb95:b019 with SMTP id d9443c01a7336-2265e7a1b2emr136230625ad.24.1742576760001;
        Fri, 21 Mar 2025 10:06:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45879sm19661595ad.65.2025.03.21.10.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:05:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6bb68f0-7e93-4db2-9fe6-f615f06ddeb1@roeck-us.net>
Date: Fri, 21 Mar 2025 10:05:55 -0700
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
Subject: Re: [PATCH v4 10/14] s390: Add support for suppressing warning
 backtraces
To: Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-11-acarmina@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250313114329.284104-11-acarmina@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/13/25 04:43, Alessandro Carminati wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because
> __func__ is not a define but a virtual variable).
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> ---
>   arch/s390/include/asm/bug.h | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> index c500d45fb465..44d4e9f24ae0 100644
> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,6 +8,15 @@
>   
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"	.long	%0-.\n"
> +# define __BUG_FUNC	__func__

gcc 7.5.0 on s390 barfs; it doesn't like the use of "__func__" with "%0-."

drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c: In function 'anx_dp_aux_transfer':
././include/linux/compiler_types.h:492:20: warning: asm operand 0 probably doesn't match constraints

I was unable to find an alternate constraint that the compiler would accept.

I don't know if the same problem is seen with older compilers on other architectures,
or if the problem is relevant in the first place.

gcc 10.3.0 and later do not have this problem. I also tried s390 builds with gcc 9.4
and 9.5 but they both crash for unrelated reasons.

If this is a concern, the best idea I have is to make KUNIT_SUPPRESS_BACKTRACE
depend on, say,
	depends on CC_IS_CLANG || (CC_IS_GCC && GCC_VERSION >= 100300)

A more complex solution might be to define an architecture flag such
as HAVE_SUPPRESS_BACKTRACE, make that conditional on the gcc version
for s390 only, and make KUNIT_SUPPRESS_BACKTRACE depend on it.

Guenter


