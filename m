Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CED83F93A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 19:52:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JNb2N6eo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNLCD2Zshz3bnB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 05:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JNb2N6eo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TMv2w1rSnz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jan 2024 12:28:38 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40ef5316e01so440665e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 17:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706405311; x=1707010111; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUXUIxIBKb7yXVS8ERVW4fwa4sKRyx0T69mWwoqQkWg=;
        b=JNb2N6eonrBZJYKNW95KMpytxXwVnQDQFSgoB+Z2d4OhNPexBPWn6zCVaL16sX3WFC
         VSRmhCa4CPymm4igeDNPsTGp/OMcAp9kcQabX0TGiutcSZ0L4m9JJA/IIUjGvNZWtnQb
         AE958B4+W57CIDJjPOQ2HJr6DTRUMaPgfspEb3uFl8MmSF5jIo/jYMxo5ex7xbrzyU1J
         iT+WQBLhTOpdI9cn0GlHQhuQOms+dfVGsAOvH8Qg0ocYSrBgJ20U11rcnJYk9bM95Jg9
         sMUoQEbzv27N3VsIwFWP8MoIwaXm3BTgWuC0rCJxhdQsQuoqdbnhvx/Tn8xgmKlOnJF+
         9l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706405311; x=1707010111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUXUIxIBKb7yXVS8ERVW4fwa4sKRyx0T69mWwoqQkWg=;
        b=f2ng6Y/oxFFpkTBO6n4C+ebHd5BBVWTs27i2XD+X98lqLYbTiGSAgLNJwfJC71kTct
         F3mC66lmJKiPqliVJdFNvyIKc9HXwzwqm1WCZf1rYg7ITqAweFtuBbpAEN4vCCJDPBQ5
         1/c7v6MBJV47e3JEZaAEP1WVSCwpe8bDapIHPF0gR7F+arr4gqwDeCFB+4ycN8p9la9l
         uwiVqx0rZUzzarsb7G2FBXHRrW6l0BA+qCGBh9NHZH7iGLAN2HGZmjnRsNMWyd85vszK
         Y7p1NMHH79VgTq15150TtIOsMiuHEmu7LuDQvGgJXYOn9WJ9qK+hRAGwgqrB4O756qd+
         u2qg==
X-Gm-Message-State: AOJu0YyuzgflSm7OiKfFWUmmox6vIUeEkPvMZvL3mVy9/Nlgdh55+Yhf
	j9Rtr/3a3INt5T/E1AlzuIB70k9LJvv32UCbxabgRJg0RFkWyv1A
X-Google-Smtp-Source: AGHT+IHept3nMUj4LCYzYJiT9LNHHbS9INXuvww5u4glPmCjjXCtKxmvIBnhSwXHbRZoEWgm1HAkmA==
X-Received: by 2002:a05:600c:1396:b0:40e:a569:3555 with SMTP id u22-20020a05600c139600b0040ea5693555mr2037091wmf.35.1706405310998;
        Sat, 27 Jan 2024 17:28:30 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1204:db7b:6df3:1a86:f66a? (soda.int.kasm.eu. [2001:678:a5c:1204:db7b:6df3:1a86:f66a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c1d8600b0040ee76ae773sm4537228wms.19.2024.01.27.17.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 17:28:30 -0800 (PST)
Message-ID: <0b14826b-9373-4458-919d-1da2a62d4226@gmail.com>
Date: Sun, 28 Jan 2024 02:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 01/14] kexec: split crashkernel reservation
 code out from crash_core.c
Content-Language: en-US, sv-SE
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-2-bhe@redhat.com>
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20240124051254.67105-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 29 Jan 2024 05:51:46 +1100
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2024-01-24 06:12, Baoquan He wrote:
> And also add config item CRASH_RESERVE to control its enabling of the
> codes. And update config items which has relationship with crashkernel
> reservation.
> 
> And also change ifdeffery from CONFIG_CRASH_CORE to CONFIG_CRASH_RESERVE
> when those scopes are only crashkernel reservation related.

> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 502986237cb6..a9243e0948a3 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2106,7 +2106,7 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
>   	def_bool y
>   
>   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> -	def_bool CRASH_CORE
> +	def_bool CRASH_RESEERVE
>   
>   config PHYSICAL_START
>   	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)

CRASH_RESEERVE is probably a typo and should be CRASH_RESERVE (with the 
former ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION isn't defined in my 
.config and `crashkernel=...` parameter has no effect).

Kind regards,
Klara Modin
