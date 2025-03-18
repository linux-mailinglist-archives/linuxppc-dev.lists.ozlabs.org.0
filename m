Return-Path: <linuxppc-dev+bounces-7184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA23A6769D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 15:39:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHDxp3CmSz2yrJ;
	Wed, 19 Mar 2025 01:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742308766;
	cv=none; b=e5PGyW8L0rQsrXtBKCtTeSzyVXYAQyfUP47z1eMNNf8YIyGd9GfMoIFmV1urbAKw8Izja4kOb3WYf5+hYnuJni4jtJ7UmrLkWXOjpv14nDGJbdn49TsOpVOpdWwPzSqUE5K/VYNI+mU5/hM1FJZep/in8Hlsyhsd9LGVQL07EV2Fvl+F9KzSpaoj2+noRPACK0IYF3Ay1LaFKaXJqh/l3s7eAoRfl68178oH6kdhj4G+rGW8ACwu11/Mlf0YTQcAroQI4G9AIlwLxdJTYjBaCXcp37jwvOh0UJWtow81IMsNrEOtsgeOLOHGDVcEoJWuo/AszZBmQpgbUe0IUNTIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742308766; c=relaxed/relaxed;
	bh=PsQlwRAe+Vfyt5oYdUWSq8JNPzE0Apo55NHwyi1kdq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzBbvuiGSXV12Dj1jdrlpKT2kI7PbeEcM+kyZGpNubRvblKWOvq/MO0x0Zc2Em7trYdJh4NewKnAO0qx/BQ71hD+APgctTjKg8BCFf9pY3/p2AJieu3yBlBiC4LWRI4/JdSGDRQ9H+3MTmjaFHfCDg72/k0B5B6K4YKpFw+QlB1KDHkOYkX4CaqWT7yazCX76YU8EWM+0X1Fpg09MeL6ky6naS854kjUZCEFuzWhyO6JhNT/hM4hs23A88bVDeL/tfpGyVK3zhdllHMHmgihufo+KSpxAajiD0GyFvnlNxsOep6F6VGzM2fAHm2Rdw4aKWWGnkJ9AEVgtyRr9LGFIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDbGDmCu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDbGDmCu; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDbGDmCu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDbGDmCu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHDxn2GyTz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 01:39:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742308759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PsQlwRAe+Vfyt5oYdUWSq8JNPzE0Apo55NHwyi1kdq0=;
	b=RDbGDmCuQrpYe3MSpH/j8S94RpRyuBkU8rYQm3wu8qmIyGBNYng0/uivQGrplLSUFZ2jpl
	1qVgSwn2MmtaNK+F6TvYiQbXLHYfKvGzqu9xwMVMhmVB9WZKxXWT9iGMLQllm+Xh0AMPcd
	jH1H5Wk5xImBljVQjcrO69AsEhUb9Xg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742308759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PsQlwRAe+Vfyt5oYdUWSq8JNPzE0Apo55NHwyi1kdq0=;
	b=RDbGDmCuQrpYe3MSpH/j8S94RpRyuBkU8rYQm3wu8qmIyGBNYng0/uivQGrplLSUFZ2jpl
	1qVgSwn2MmtaNK+F6TvYiQbXLHYfKvGzqu9xwMVMhmVB9WZKxXWT9iGMLQllm+Xh0AMPcd
	jH1H5Wk5xImBljVQjcrO69AsEhUb9Xg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-NR0CIjZmNeiXwTLjwYwViQ-1; Tue, 18 Mar 2025 10:39:17 -0400
X-MC-Unique: NR0CIjZmNeiXwTLjwYwViQ-1
X-Mimecast-MFC-AGG-ID: NR0CIjZmNeiXwTLjwYwViQ_1742308755
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d22c304adso14860915e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 07:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308755; x=1742913555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsQlwRAe+Vfyt5oYdUWSq8JNPzE0Apo55NHwyi1kdq0=;
        b=eNP3vcQS5SFhZvROH4ViqXBhR/N7zn0E2ZUiEvT7L8ank14y3TvrakZCxPsY11r8xl
         RgGxTxco3tAH+MHAGnaeYoVugpOBqYjVBmdO5b4muJijeX3Yb472O4TwVtoxzob0eowR
         nkxK8Cl418YNlOadZR7JVUFmD+Bwur2JxqkmUsJl1Qo5fqlZ5niGOB3YIRAmGoc9JvKY
         xqTho263wEv6M/VHtDsyP+nSdJlgmHRZ1XKWcz9JMGORTfYlWzhPuGgC4VqU84ZLb7FV
         tMmjr6WnFBmatleXD0wmv+VW4cZNsdghWoYIjOoXaWPxt0YpbP+2REWoB8O3r6cjzscD
         lPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQVMR37exLgMwVjYzrWq3xhjKFC2ZsgTsYARNqzKiuRcySDsl6+BmVdX651sHLyPJH7v1eA2TeoKNGLuE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKN2abjfCe21LEhf8uN/Cc+WeOqvNnYlhby7YhZYiUHTSrel1P
	6xFjKwP4+XaLiY2gIWNltsFi8YwjOTx/kTCyboSbplh2WxMC1t0QzQ2GlFIUBZI0GHAy8uR5Enq
	mUIVFhvUPxFWMbSRaZxTKJiHXHG67H/AaAUaCEKD6uWgCjsHtkN83yvb87VefilY=
X-Gm-Gg: ASbGncvyIui9kdYqRzv3NWGnR4nQAkb78pMvFqrRsEySY5KINHZmm/y/K9CHvtUMHby
	zGRS5BbNGJAnKRYsMSeXexhSgnd5pW25XOw0PfewGwTMXpmcVZYSUhNj5mvx7YPD7G384kot0xU
	DfPkNzZWIZe2mSBg0ww/b45hgTnCG/UYRw0wjP+7shmAfNbtDCFUJQaBnH0Ik/JXaCe2NLvF0OS
	RiBODEAae9q5+X42K7xlq77gNy+nIa9YyXCHBTKfFnMHMv1xxsWTW6SZkPjpcCaoWo67CRpxb5F
	OUKhgVIQL4Aqo33zYfQZZzlrrPzXcDQPTKLQVLUqDlZ0Fg==
X-Received: by 2002:a05:600c:138a:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43d3bc12751mr24184655e9.6.1742308755373;
        Tue, 18 Mar 2025 07:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWUKBTOZHulBPKccJIMkih2ejX9HgOTZC6YQk6IraOUM0a3ImJsw3fgLjtFZUV+DmHGg37Vw==
X-Received: by 2002:a05:600c:138a:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43d3bc12751mr24184395e9.6.1742308754930;
        Tue, 18 Mar 2025 07:39:14 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d393bb288sm27247155e9.29.2025.03.18.07.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:39:14 -0700 (PDT)
Message-ID: <d67a6f99-3d67-4843-8a32-83b086952ab2@redhat.com>
Date: Tue, 18 Mar 2025 15:39:13 +0100
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
Subject: Re: [PATCH] net: remove sb1000 cable modem driver
To: Arnd Bergmann <arnd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
References: <20250312085236.2531870-1-arnd@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250312085236.2531870-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2E2Y__aujC5IJQZMUjXzwDV4bnlNl2Z9ApBcsUq9tvA_1742308755
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/12/25 9:51 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This one is hilariously outdated, it provided a faster downlink over
> TV cable for users of analog modems in the 1990s, through an ISA card.
> 
> The web page for the userspace tools has been broken for 25 years, and
> the driver has only ever seen mechanical updates.
> 
> Link: http://web.archive.org/web/20000611165545/http://home.adelphia.net:80/~siglercm/sb1000.html
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../networking/device_drivers/cable/index.rst |   18 -
>  .../device_drivers/cable/sb1000.rst           |  222 ----
>  .../networking/device_drivers/index.rst       |    1 -
>  arch/powerpc/configs/ppc6xx_defconfig         |    1 -
>  drivers/acpi/acpi_pnp.c                       |    2 -
>  drivers/net/Kconfig                           |   24 -
>  drivers/net/Makefile                          |    1 -
>  drivers/net/sb1000.c                          | 1179 -----------------
>  include/uapi/linux/if_cablemodem.h            |   23 -
>  9 files changed, 1471 deletions(-)
>  delete mode 100644 Documentation/networking/device_drivers/cable/index.rst
>  delete mode 100644 Documentation/networking/device_drivers/cable/sb1000.rst
>  delete mode 100644 drivers/net/sb1000.c
>  delete mode 100644 include/uapi/linux/if_cablemodem.h

I'll wait a little more before applying this one, to possibly allow
explicit ack for the ACPI and powerPC bits.

/P


