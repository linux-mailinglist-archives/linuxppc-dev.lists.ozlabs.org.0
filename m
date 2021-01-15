Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB82F71B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:48:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7wP5r61zDsbF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:48:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QOCu8Beq; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH7k10fn3zDsZ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:39:04 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id x12so4056660plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dMbJHwLkPAXWWFhKWn5CEoHQOIl/KOyAwyeSh9CMGWA=;
 b=QOCu8Beq3P+zhMlrVaEEFkYLC0t6f9oVFNBcIdZPVloIBfoRxWvwzrJ+o1ysAyAUiR
 UuicMOlNhIvOkXpIixZaX4gxP1aEJpgD9tSqO4MfTtO7pvsDTtC6BLvh6Oyn2fGSS1nS
 fuVcvNy+/Dv0jx12qeRrwLql2xHFCpuWtnWJFM2VFY8eTMeWXXFgzcnMzZVIEWCHMXK6
 cYaAkwQC8I8hjeQ7CMr5ha64cpXSXWXV76fWm32BYmyjskORqNEgQnmspfYUShLpfNZa
 oIq44O/It3VCKf4mDzSybjBgveYa01EiKDJ4aVU5zuRabXpUzIhqX5YyRugEH84A2RNU
 qpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMbJHwLkPAXWWFhKWn5CEoHQOIl/KOyAwyeSh9CMGWA=;
 b=WiSlw0UHlLUCmJAcgqeHdlsBjPHzXr7e2owVyAArhO0Z8vpkFdEHIQRVEpFWnrJ6Ml
 ZKVWCwzWNhXmUluHWHXfqKh2FV1TTnjEB9wcAQNPKuBLHqvPe7S6aeGPLiQsL3ZqMXXp
 Z/X9okuMx2kFbZKeODVV84TEddP5fQDFM0SWPUaC2fPSRIMNHjv/77d+53QbahfbpHD1
 biNoEamYThGgZv7oRMpBsBA1Z94BKxegfkVc/MnVOnIbmJPCp4rCHCaUgKqk2klxLlpy
 25tJSok8zmH1yZE4p+1Aog7aO753J8ENINea1O5a7wKw1lijkHIVyB6MfGN7HonJAVj4
 Ygzg==
X-Gm-Message-State: AOAM5302n2S2SqGtyKbGLofBSE8lPcLJO+psBBZ0xVnQHXlbrlbWhoqv
 IDJQqut5v6FHG8y1nBmTzyWMOg/O9LU/cQ==
X-Google-Smtp-Source: ABdhPJzaUSqQg7QquuewdybXRJSH3UPokpumPRD8XVvxlPQyO+EJaqz7hGFC08qeFvb+nYPUhFPkmA==
X-Received: by 2002:a17:902:c209:b029:de:76f8:395 with SMTP id
 9-20020a170902c209b02900de76f80395mr141756pll.85.1610685541450; 
 Thu, 14 Jan 2021 20:39:01 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id g30sm6152578pfr.152.2021.01.14.20.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:39:00 -0800 (PST)
Subject: Re: [PATCH 1/6] powerpc/rtas: improve ppc_rtas_rmo_buf_show
 documentation
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-2-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <9ed7d0c4-9130-2a7e-4539-906bce4b5879@ozlabs.ru>
Date: Fri, 15 Jan 2021 15:38:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-2-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/01/2021 08:59, Nathan Lynch wrote:
> Add kerneldoc for ppc_rtas_rmo_buf_show(), the callback for
> /proc/powerpc/rtas/rmo_buffer, explaining its expected use.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/kernel/rtas-proc.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
> index 2d33f342a293..e0f8329966d6 100644
> --- a/arch/powerpc/kernel/rtas-proc.c
> +++ b/arch/powerpc/kernel/rtas-proc.c
> @@ -757,7 +757,16 @@ static int ppc_rtas_tone_volume_show(struct seq_file *m, void *v)
>   
>   #define RMO_READ_BUF_MAX 30
>   
> -/* RTAS Userspace access */
> +/**
> + * ppc_rtas_rmo_buf_show() - Describe RTAS-addressable region for user space.
> + *
> + * Base + size description of a range of RTAS-addressable memory set
> + * aside for user space to use as work area(s) for certain RTAS
> + * functions. User space accesses this region via /dev/mem.


mmm ufff wuuuuut argh^w^w^w^w Thanks for documenting it :)

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> Apart from
> + * security policies, the kernel does not arbitrate or serialize
> + * access to this region, and user space must ensure that concurrent
> + * users do not interfere with each other.
> + */
>   static int ppc_rtas_rmo_buf_show(struct seq_file *m, void *v)
>   {
>   	seq_printf(m, "%016lx %x\n", rtas_rmo_buf, RTAS_RMOBUF_MAX);
> 

-- 
Alexey
