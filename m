Return-Path: <linuxppc-dev+bounces-7374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F32EA75268
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 23:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPZZv1g8Pz2xxy;
	Sat, 29 Mar 2025 09:15:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743200103;
	cv=none; b=XxE21HFxr738tLcDup/Z28DxWFh2+uUYg2Jv87LZxtrFyLhD9LZTqjfGgEhFqfycjqzel4Y/cNc8K6xpkdjUYtb6qI/MM+IDJhHaq/OME2zTEmlcCZrznaMBwO1438CtbCAPTEeQgiPGEvg1nXSfMxZTpJBgg4W0V74EV/dp2l5Zwrm41PDtmlNXjpcxBPE0mQofVyqHCw7tUYQavZJhjMAqlAK6Zk8d0OX5yEtlS8mr8gqownrwoMBpc17QF70Vc3DpOp64JbO5X1exz9xGP41k7UW3lmMS9GiQP1Uglm6Ek7Gg6Ht8W0BgI1F29SweD0S49yLT0y+P6iFgcZSsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743200103; c=relaxed/relaxed;
	bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnzGlrG+dgyjASi/miUVQWVjkro5/8lPe0l/t3/S1qe9gLG1EFQQKtdGP5WlH8/0ebBuMWw647p/k4T/A85SH4L0evY5qNzKrM/lB1TqgtpZcWuMmW4YWyOBIvN63oac6CVSuXULOBzEea6LNiO5bGjQgNCnsFsWA7cw81MBi24F4N/jTTzHcmLaPrwRLoLvrGQdZVFkXQkJVHoxU2jpcXqby0BJeDlH2tM6sXqfqD7X1IcbaDx9sbxHEP6IbQb0qhP9pSMzAGdn9jFSSHy2Tl+bD3NXRJrOc8sN13HXKhAvBFVHs1IPYxNfmrlKcD7Y85fV2Bol3lVVaV45KXMZog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HKOzs+zN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HKOzs+zN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPZZs4cWvz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Mar 2025 09:15:00 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so9401325ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 15:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200098; x=1743804898; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=HKOzs+zNhLqxRolyvbZPYERO1Tho/pdaMapkDUVlqvHhW8qtVnBqFz8jkfH93C2qBM
         xIDJ+bxJ5iQ2LRfLcPAS0crOvGZlxRNYrE+12JeyAAedeMCtfLVp+saZHd8J2F9eNZ0n
         cXNnRPjzAa1Y05FWFDfw2ue6Yqwc8T+Lv/4A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200098; x=1743804898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=Ouif5t4lNqRfh/6sE5VNVVa8uIityvD9EXFURdvOvj5bqQIDHir8VnNdsDvOJRGRV7
         82H+WyReTQwAo9i1vmmFx1Oob0mF8Ccdv7q9I5YI4U5morlZ8q9Bfnk+LEm/LSKO5wpm
         HttsyXdguoyUeF6MDeFUA/5EbPGk4/ChPah8x1hfGZkW8r9rbbvwmGKRLOWpzWf3LnJ8
         VOi7sftZvdXtOUfwIETi0eGf3iufZjnQldISsXOj6+9pnpLR2Um1gBFm0zC/hFjsG8x2
         0tumlKP9SmkaYsvba1c6ThbeNLtTDWkWOWfdB2dnG1/alQ8yntWcEO+pZn4i1cSKfBbX
         j/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUDXNeAVi9bRt4oLnMHycJQPwH3q5utAiDVpr/opuS9GQuc5hI++s5LFUi/qzws7dxtMp8tweANsSpHcEY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzPpMC+TZ6hPzi4LbJWzKH7ovp/xVjRnJ0qU0Dh9/ZI4W8PMe78
	JL4C0v2q4v/L1Z8kEV4YcLIrJvbpk84ICuMnmQQdiEKxfx7gxnacedeLbdWG+gw=
X-Gm-Gg: ASbGnct4OBHmmsybfrEC5a8A3M/AWb/TOtsafnrRFxkOdASlreuwKd/oVe6BXxd79JC
	TG17kj8kj+Z6Sc5BFCfm+YLJdt8MxVYEMiEjbQew+JHIHj4EhQxHrxE41N1QcFPit76iNexb2x7
	vcjK7PefPjVkW3ZkNfM6b1j8GHod90oQfAf+1XlFJfd2yZKWt4dDUBMIahSzjg1mAZVYQOdHB5S
	bR37okes5b88Y6kxAFqKH71CFHZKy9roXmyecXE2ODvzzRux2KfGZBbxJa3A1JL3LpeaAdAZDyz
	+nVDw/TUFKevL83TaLifhW93DjBrrJ3OjZRha9qY3jdreuZgu9II0g8=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993;
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
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
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah


