Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395F933C08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 13:15:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UgjV6d58;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UgjV6d58;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPCyV2wGkz3fmg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 21:14:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UgjV6d58;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UgjV6d58;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jfalempe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPCxn4Q3gz3fTS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 21:14:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721214853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAGmeywEZ/JgSZ6hAqPsmz089vwWWyWA+lKvknqNmtE=;
	b=UgjV6d58WHZ+iXXAQqz1v624TIG6JOH+tHEBAebi7Q9voIpUFCEL7HkgVMoutyHFgv0nfr
	w/OECfpBrrUEf1lIt0tCFfVop/5ytVFZwt9f7A+fMTFU6nxfL4a7STAhjWxdAFfhwwQLuI
	+uzHAFYZPhy4QLJI1MRIoIE+wPp/Je0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721214853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAGmeywEZ/JgSZ6hAqPsmz089vwWWyWA+lKvknqNmtE=;
	b=UgjV6d58WHZ+iXXAQqz1v624TIG6JOH+tHEBAebi7Q9voIpUFCEL7HkgVMoutyHFgv0nfr
	w/OECfpBrrUEf1lIt0tCFfVop/5ytVFZwt9f7A+fMTFU6nxfL4a7STAhjWxdAFfhwwQLuI
	+uzHAFYZPhy4QLJI1MRIoIE+wPp/Je0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-RfBKBajGNnCzg7qbwefoaw-1; Wed, 17 Jul 2024 07:14:11 -0400
X-MC-Unique: RfBKBajGNnCzg7qbwefoaw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36831873b39so372759f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 04:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214850; x=1721819650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAGmeywEZ/JgSZ6hAqPsmz089vwWWyWA+lKvknqNmtE=;
        b=Q32EbiGkpDaiQSjr7J3NGO/EgEWwoTgsm7hYHYDaMnffpvpAvoIhZvDsK0Kcb0S/VY
         dIw4BBrnoXcCtUQ836sVE1x6kZn+mWZLHPQr0dHyUj2D3UCgSJdYZzrN2A9/EkPGMWNx
         a1vSqJPtgjLbddyL/boPlkDSuDsCvt1xd9RA/sS/PB9uEmbzyH6H+VcPJBMQ4D5OMka5
         z4UKvi7hRQSql6Zd/PjDx7Zqk+sBxS6Yn37cXro7UIWuNq/PLyhlbJziTZyl1FJNFtV7
         exsg+0YOvSjCOdHAkl7LtIMp9GMYUr8Vm59AHsp6EDPL2Gu/wiR4QxEyK+Wz2tdKDvAV
         qodA==
X-Forwarded-Encrypted: i=1; AJvYcCVhiph5+tDzlnC/EFq6k17BFQOJ6GNX7L1E549YlD1i6HmiVnYwUrhf1NRnpBqeZYQ4+fWZ7YjLduK1XYjxz4eqByCQOczIKxGzB1eopg==
X-Gm-Message-State: AOJu0YwNhiLZEbz4Sak12xfvQ06gnzoicHOowB7ACW27H+b9iJ1RS2uC
	NYfR0fU9aBHcNpNS7mPLvf9+lxulSNYX7RvrCSyB7/mrv2BkGft8/NuttN66+TbDk33/Q6zVYs8
	7wngXXwJNu/iFwhsOANUSccwVTiZINA2y3TfktechC0YSLq8fb/PTkjtnEWhsPZc=
X-Received: by 2002:a5d:5f8c:0:b0:367:943e:f436 with SMTP id ffacd0b85a97d-36831652b7cmr1395240f8f.30.1721214850119;
        Wed, 17 Jul 2024 04:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkv5VJxD9qI1kB5PB9WhCMM3ozFKBNBC+x5bcWuyaH6WTwCYKMg89QMw7W+wtEnk2KMCsWzg==
X-Received: by 2002:a5d:5f8c:0:b0:367:943e:f436 with SMTP id ffacd0b85a97d-36831652b7cmr1395208f8f.30.1721214849630;
        Wed, 17 Jul 2024 04:14:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbec3sm11450684f8f.85.2024.07.17.04.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:14:09 -0700 (PDT)
Message-ID: <f559a33a-6d2e-476d-87f6-cb1887e99b62@redhat.com>
Date: Wed, 17 Jul 2024 13:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 02/07/2024 14:26, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> v2:
>   * Use a struct kmsg_dump_detail to hold the reason and description
>     pointer, for more flexibility if we want to add other parameters.
>     (Kees Cook)
>   * Fix powerpc/nvram_64 build, as I didn't update the forward
>     declaration of oops_to_nvram()
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   arch/powerpc/kernel/nvram_64.c             |  8 ++++----
>   arch/powerpc/platforms/powernv/opal-kmsg.c |  4 ++--
>   arch/um/kernel/kmsg_dump.c                 |  2 +-
>   drivers/gpu/drm/drm_panic.c                |  4 ++--
>   drivers/hv/hv_common.c                     |  4 ++--
>   drivers/mtd/mtdoops.c                      |  2 +-
>   fs/pstore/platform.c                       | 10 +++++-----
>   include/linux/kmsg_dump.h                  | 22 +++++++++++++++++++---
>   kernel/panic.c                             |  2 +-
>   kernel/printk/printk.c                     | 11 ++++++++---
>   10 files changed, 45 insertions(+), 24 deletions(-)
> 

[...]

I pushed it to drm-misc-next, with the whitespace change in kmsg_dump.h

Thanks all for your reviews and comments.

Best regards,

-- 

Jocelyn

