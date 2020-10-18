Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342D291573
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 05:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDQsG3JPxzDqjk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 14:50:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lox7NMqZ; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDQqb3CDrzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 14:49:14 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id hk7so3679817pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X4qHoygSzqTKRDzkJq6t6yBpbF+Ft2yq/15kwOh1m9g=;
 b=Lox7NMqZexy2YU1ftxw1t4lIbQMYzOkHl7rwr3JhCoNKYKdKr3PEUL7mOjoLp1SRwG
 0Tg0bE3Q66j/ZVxMyVQTBZuhr+ODN79ahVSAjPWmlEmcLbK3jsHaDGm/y0kd6Xb4bYLE
 AF3wZC6xLon/vbhFYKC/fdk87Q8Sm0+1VanlnSB+PbK4JQlOYIsAHsPk/CuqQlzIotHw
 LQobuRSOdq7WhP3CCn8YJwvosox3zqyw7BHEcUlaqsxn57ZsnQalS1fRnQtxG83MNFw5
 io9KmBZEkHCbCZ2YtZmyxOaSH6N7orfWnlGpheDSOtD3OrUddUqsMR6AR4GLUmGLgKR7
 VqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X4qHoygSzqTKRDzkJq6t6yBpbF+Ft2yq/15kwOh1m9g=;
 b=CnDJraVySVPJpA2zBvo8uRFb/+ZSSrd0nzImDdR5u6U0IiUx6AMWE5PxOQSh6S1WtF
 fXGL6AqPU0M8CtEtHIBl9zWbfS1dHEAi5cKB9WgnTCk9XRFV0b1nnpX9intqfbVCUxqJ
 qk5ul49+V0TQjVE5k+BqXBsCb/KN+6vLuADxoSih/SIoEHYFG40BFsoRFUrifYop6Fwl
 XZYvlGiRBDef8kdsZgE0Ybxy9MzEsPmvdbTvuec8X5RIly0eeS1KP5LJSh6J8GrdO+MM
 gytwCUjZoHrniZrTPeM3XNwlH6Gjw6OzVaxJH7a/qIJMokA5o5bwRvgu0j4iEul23APg
 OSbQ==
X-Gm-Message-State: AOAM532J3M3XiSTudqIDsTQD1cLo+EZ5vRSIgFpB+06FxFGBiO1ffsKt
 mXt2S3TXLroCLi6rHI7x4zIGgfmnp0k=
X-Google-Smtp-Source: ABdhPJx1W2qisQbSC7OHbU2SgYHsG2uE0LaC25LfPMHme4tCOUfEQMikfqttr1JFhIrkiT3WoW151A==
X-Received: by 2002:a17:902:8341:b029:d4:e3fa:e464 with SMTP id
 z1-20020a1709028341b02900d4e3fae464mr11449474pln.66.1602992953138; 
 Sat, 17 Oct 2020 20:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([49.207.205.150])
 by smtp.gmail.com with ESMTPSA id p22sm7261478pju.48.2020.10.17.20.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 20:49:12 -0700 (PDT)
Subject: Re: [PATCH v5 11/23] powerpc/book3s64/pkeys: Store/restore userspace
 AMR/IAMR correctly on entry and exit from kernel
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-12-aneesh.kumar@linux.ibm.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <ef174ccb-62b1-9385-b213-42c1718d5cfa@gmail.com>
Date: Sun, 18 Oct 2020 09:19:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-12-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/08/20 9:39 am, Aneesh Kumar K.V wrote:
> This prepare kernel to operate with a different value than userspace AMR/IAMR.
> For this, AMR/IAMR need to be saved and restored on entry and return from the
> kernel.
> 
> With KUAP we modify kernel AMR when accessing user address from the kernel
> via copy_to/from_user interfaces. We don't need to modify IAMR value in
> similar fashion.
> 
> If MMU_FTR_PKEY is enabled we need to save AMR/IAMR in pt_regs on entering
> kernel from userspace. If not we can assume that AMR/IAMR is not modified
> from userspace.
> 
> We need to save AMR if we have MMU_FTR_KUAP feature enabled and we are
> interrupted within kernel. This is required so that if we get interrupted
> within copy_to/from_user we continue with the right AMR value.
> 
> If we hae MMU_FTR_KUEP enabled we need to restore IAMR on return to userspace
> beause kernel will be running with a different IAMR value.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 177 ++++++++++++++++++++---
>  arch/powerpc/include/asm/ptrace.h        |   4 +-
>  arch/powerpc/kernel/asm-offsets.c        |   2 +
>  arch/powerpc/kernel/entry_64.S           |   6 +-
>  arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>  arch/powerpc/kernel/syscall_64.c         |  30 +++-
>  6 files changed, 192 insertions(+), 31 deletions(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
