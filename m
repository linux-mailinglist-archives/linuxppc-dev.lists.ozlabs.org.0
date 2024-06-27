Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7891A06C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 09:30:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+JkRA2c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+JkRA2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qwS2C96z3fmp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 17:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+JkRA2c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+JkRA2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jfalempe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qvj6rvBz3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 17:29:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719473373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
	b=A+JkRA2c6hGai46RC92hnqighdL165ICWakllLKX8cgvzbtTss0ZvJXr7AVNmYVwaX1jLi
	uAX3/z19M+YWmGatfRQcYl9eGKioCin9jUQWLmNZBH8+FTpgmvTGoojbF37eLm5WLKROTQ
	4i+DGcxYOQVTfIuAA+O0dIcoUJ2k0kI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719473373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
	b=A+JkRA2c6hGai46RC92hnqighdL165ICWakllLKX8cgvzbtTss0ZvJXr7AVNmYVwaX1jLi
	uAX3/z19M+YWmGatfRQcYl9eGKioCin9jUQWLmNZBH8+FTpgmvTGoojbF37eLm5WLKROTQ
	4i+DGcxYOQVTfIuAA+O0dIcoUJ2k0kI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-eIUqbt9LMTKTZICjOam2DQ-1; Thu, 27 Jun 2024 03:29:30 -0400
X-MC-Unique: eIUqbt9LMTKTZICjOam2DQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52ce3a9a2daso4229608e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 00:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719473369; x=1720078169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
        b=hdiqHayBxUQyaBzOR3MohMa6xY4p8Z0AqnqgNgsUoC7YbVRnOWFd5yj0qt2ptFHHqs
         gUjI6aj8w+CMOmRrV5ml+y0oXslbmYOwz4yGTTEaH7iWFmTr6KcfBlG88nPU4lWhUOcy
         13l6ZX/Dyb4QiWcbTslwAIoC2Lek91nFQKgCjUQ7sVqVnEJHUtK2lM3MHEQHsDLyknse
         OPR7kEVftnmLHFRt5uyPQUmT647NHGwFxVrxGRG0M2+nOjJsNO1KWcRr5nnogyxscr6x
         z4M+/ExJvT9VXWGqFOmQPswLZH/CUnlaZF3N6l+Ivb3R4++Z/jfYJcYaX/QcKLnhIdma
         atpg==
X-Forwarded-Encrypted: i=1; AJvYcCVYHnsXQOFoJ67wXUvL+WKw56zgHirZzb3cdl9Oas+mB5bs5inA0j91ieBJOJdVngY7xxGoyZ3Di1uZUvKaMbH5jeW37LqJoLxlDKnpBQ==
X-Gm-Message-State: AOJu0YwEa6JgmFZF8AYQeUW/i1ycUgXoHNXOPVksZ10lJYCPNFPDoAhn
	Z5AshTTD8zzWZlgiuV0Kg5abU12SEhW6dQrSB9LHjtMO3qm7oQiuf8xm8URcA0OWJUVKc1s2k9r
	R1nK9I9YCXPzaYMKyhej+h1ENJ5n5ECsBKJBixGjkXCAqx/qjebJWEHtJa3OwFnk=
X-Received: by 2002:a05:6512:688:b0:52c:8837:718a with SMTP id 2adb3069b0e04-52ce185cffdmr9405309e87.43.1719473369051;
        Thu, 27 Jun 2024 00:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbOO3gAiuM5teegTvAjdpAZYISeHz2jPAZuVwH5HNKIpTCZBH+tcy4/G9Q3EUr6abmm1rODg==
X-Received: by 2002:a05:6512:688:b0:52c:8837:718a with SMTP id 2adb3069b0e04-52ce185cffdmr9405275e87.43.1719473368602;
        Thu, 27 Jun 2024 00:29:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245e7csm52601955e9.3.2024.06.27.00.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:29:28 -0700 (PDT)
Message-ID: <4aa3a028-04e5-4658-9879-df60dab06c54@redhat.com>
Date: Thu, 27 Jun 2024 09:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
To: Petr Mladek <pmladek@suse.com>
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <ZnvKcnC9ruaIHYij@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZnvKcnC9ruaIHYij@pathway.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/06/2024 10:00, Petr Mladek wrote:
> On Tue 2024-06-25 14:39:29, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new parameter "const char *desc" to the kmsg_dumper
>> dump() callback, and update all drivers that are using it.
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   arch/powerpc/kernel/nvram_64.c             |  3 ++-
>>   arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
>>   drivers/gpu/drm/drm_panic.c                |  3 ++-
>>   drivers/hv/hv_common.c                     |  3 ++-
>>   drivers/mtd/mtdoops.c                      |  3 ++-
>>   fs/pstore/platform.c                       |  3 ++-
>>   include/linux/kmsg_dump.h                  | 13 ++++++++++---
>>   kernel/panic.c                             |  2 +-
>>   kernel/printk/printk.c                     |  8 +++++---
>>   9 files changed, 28 insertions(+), 13 deletions(-)
> 
> The parameter is added into all dumpers. I guess that it would be
> used only drm_panic() because it is graphics and might be "fancy".
> The others simply dump the log buffer and the reason is in
> the dumped log as well.

Ok, I also tried to retrieve the reason from the dumped log, but that's 
really fragile.

> 
> Anyway, the passed buffer is static. Alternative solution would
> be to make it global and export it like, for example, panic_cpu.

It's not a static buffer, because the string is generated at runtime.
eg: https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/init.c#L158

So it will be hard to avoid race conditions.

> 
> Best Regards,
> Petr
> 

