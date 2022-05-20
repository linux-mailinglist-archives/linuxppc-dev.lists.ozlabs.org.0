Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A852F1D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Yyk2Skhz3cgg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 03:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pHF2/Hc2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pHF2/Hc2; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Yxz1gMcz3bsH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 03:44:22 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 s11-20020a4ab54b000000b0035f0178dfcfso1636097ooo.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WyiL1ty1TX9eGoECLXqnVlWl+qyOL28rm0F3LiqWh9E=;
 b=pHF2/Hc24MEutmfdmxbkKXT9c/7rQlCwvmF78VPTZ+tjwzKtY9/RuVISJbYxHwqNsD
 Xzt3SLHKa2d5qa+OqYscZ+OTiRwFqMJAHwzZkdk+Z/waItSSH9WSnRBUrYoyeNQ/FKSd
 dcDuLuJcagcnaZdGnWMkZNnOBfiMOjFzIB4laKqjyJUH53sH4GX5OunDb9/gdLnsK3aI
 w/DAhKZZEutRq9pvpMje87d6IZ62xhcuZ3ZXBQQkoGXAWIGvfzP6BFvv5GXz4zvuFT0d
 zaBR0KkP4mbwm9sICv9SPsmZlQwmSQ1FjYWyB1TwfquY0RwXMxW9VlT+YETigLXajwRK
 AGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WyiL1ty1TX9eGoECLXqnVlWl+qyOL28rm0F3LiqWh9E=;
 b=NZIgyN3g5XjKkJbVSUk3//E+hQs5vxgqKK5R0R0UM2f+6uyWRI8fbToHVQdG+trBfM
 OBWcuHYe0hTqwdXeumsGAntGeXDGSxQJ7gj9FQaEUQLqp26/Agjy2bPiuR1fB8xJf9W8
 7LG1+/Y79hPB2RbYqj05jT3OZvzkm0wgm5j52MD9cuvZrCT6rB0GS6NUNqU9W81p7CT1
 uFJvk8L3s3ScP8q5XSiU1bB1Md05xp0JY0z/lpJIVUmfuxHvESYuXVHlP9AN7Ow3u+2W
 Xcl7RY1GHA3k1nL7/5Sw38/c28h/Uj+peAo3EZ5o6i7+fHXXT2Dv0ZKX9ZlLazeGUBTz
 qCZQ==
X-Gm-Message-State: AOAM531a9EUdCY48VHTEoqF9AEWr9GbfSluNP0aRyKpJ2RhHD1Zg5Izx
 bS8pbAt8MCPud68xkMMEs4E=
X-Google-Smtp-Source: ABdhPJxeWLwdtILwiGAbwJfS6uXJXlDG1K4sgXzkQHx+MSR6qYmkKv1ONdkB1X6MmkGPbYnZrxAYjQ==
X-Received: by 2002:a05:6820:515:b0:35f:3213:e694 with SMTP id
 m21-20020a056820051500b0035f3213e694mr4711826ooj.42.1653068655867; 
 Fri, 20 May 2022 10:44:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y199-20020a4a45d0000000b0040e699e8d8asm643181ooa.45.2022.05.20.10.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 10:44:14 -0700 (PDT)
Message-ID: <070470fb-20bb-0345-b19e-49d164f2bbcc@roeck-us.net>
Date: Fri, 20 May 2022 10:44:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, 
 H_NOOP return code
Content-Language: en-US
To: Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20220520172055.32220-1-cheloha@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220520172055.32220-1-cheloha@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru,
 vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/22 10:20, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> guest control of one or more virtual watchdog timers.
> 
> Add the opcode for the H_WATCHDOG hypercall to hvcall.h.  While here,
> add a definition for H_NOOP, a possible return code for H_WATCHDOG.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>

Please provide a change log against the earlier RFC series.

Thanks,
Guenter

> ---
>   arch/powerpc/include/asm/hvcall.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index d92a20a85395..4b4f69c35b4f 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -87,6 +87,7 @@
>   #define H_P7		-60
>   #define H_P8		-61
>   #define H_P9		-62
> +#define H_NOOP		-63
>   #define H_TOO_BIG	-64
>   #define H_UNSUPPORTED	-67
>   #define H_OVERLAP	-68
> @@ -324,7 +325,8 @@
>   #define H_RPT_INVALIDATE	0x448
>   #define H_SCM_FLUSH		0x44C
>   #define H_GET_ENERGY_SCALE_INFO	0x450
> -#define MAX_HCALL_OPCODE	H_GET_ENERGY_SCALE_INFO
> +#define H_WATCHDOG		0x45C
> +#define MAX_HCALL_OPCODE	H_WATCHDOG
>   
>   /* Scope args for H_SCM_UNBIND_ALL */
>   #define H_UNBIND_SCOPE_ALL (0x1)

