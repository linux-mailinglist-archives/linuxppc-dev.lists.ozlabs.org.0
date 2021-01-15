Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2F2F71A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:42:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7nN1st7zDsb4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:42:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Udbf83LH; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH7jH0Fs1zDrRV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:38:26 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id n10so5206500pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=10eygU+aac9Nf/OFBRPrkjsaUReEJVqbqB6ZOAECcrc=;
 b=Udbf83LHvOlY3ob4TqK/BnUc17qHIXOavr/tLMTDizQOvXucRyx4raN5ko9iCRjXLy
 ezuxo8MnRaScN+U1Rk2sNYFowBHCRKjobrHYJ8IbVi2T/kaEp2Cw9vPCprtbxH0kXW60
 mdde8xd8aYF3VuDsi5wIW+/Obb8aLuLDxc9K51NYMOOY/TIyxm/1lS8EdgRuTcJe3rYF
 NPJPOAKTv7eBN32avCPbqIkywlnUdAydzgaq2s5JT1Wwe1Dpw6oXTS10AlD1xmt0A+62
 ABGFjwmQ7W3G21HooTWLXzx2TzbXiuvaZyWk442ePiL+bzoNw7YOkFSripP2dgtTu5L+
 eb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=10eygU+aac9Nf/OFBRPrkjsaUReEJVqbqB6ZOAECcrc=;
 b=T+6v/jRgMzcI1NRvzBE0+Sn3thsPz85jX+0TCJ3SIQG3VuDafMDaL1ruPW52FqtE5v
 no/SuERnDpwM0C2dC/e8qmIK6ffFChMzyG3M1VehXJ1+CUDtCX6sczOOL9N5+ycxtE4T
 mpVUy9JytsKnOYUMTDoVkqviqQkNVK3PwJXqH+ixsbN0ywzZAUR+nRj5N+28GuROkSk/
 LXBJgsg9oXpyJQ4sDyqa7q73a+bQyDYHh4tqCJ97+qHiPJfYHDq76I7bwFcc8F+UwfkN
 AGD8coHn1lSBMdXMbX0h1k9S2g9iuzN0Tc23FtKpBkHnKck5EhrtAZYNqhpw+yCALZri
 fvfA==
X-Gm-Message-State: AOAM531OJr9sajhI4TWnAflx6/Rt/Cyf2vHkReZD8n4TuBURZQQaTsIM
 OW/RP3jwGf0SEnx3RCU35QA5PA==
X-Google-Smtp-Source: ABdhPJw1xMJyzAFBIawSKG8Lj4+31K/2aLFJu02hFigoH2bWgWbhWHwO+dTMrUyZuWPAdCodxtuwcg==
X-Received: by 2002:a63:da58:: with SMTP id l24mr10758325pgj.178.1610685503714; 
 Thu, 14 Jan 2021 20:38:23 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id a31sm6695622pgb.93.2021.01.14.20.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:38:23 -0800 (PST)
Subject: Re: [PATCH 2/6] powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-3-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <bc0f3f7e-f842-8357-dfc3-4138841c2e75@ozlabs.ru>
Date: Fri, 15 Jan 2021 15:38:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-3-nathanl@linux.ibm.com>
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



On 15/01/2021 09:00, Nathan Lynch wrote:
> This constant is unused.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/kernel/rtas-proc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
> index e0f8329966d6..d2b0d99824a4 100644
> --- a/arch/powerpc/kernel/rtas-proc.c
> +++ b/arch/powerpc/kernel/rtas-proc.c
> @@ -755,8 +755,6 @@ static int ppc_rtas_tone_volume_show(struct seq_file *m, void *v)
>   	return 0;
>   }
>   
> -#define RMO_READ_BUF_MAX 30
> -
>   /**
>    * ppc_rtas_rmo_buf_show() - Describe RTAS-addressable region for user space.
>    *
> 

-- 
Alexey
