Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DB301BD0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 13:26:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNsgf2CwkzDr3G
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 23:26:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bKuMIpY9; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNsZh4zYbzDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 23:22:33 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id kx7so6632456pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CRaVGlQqRX3eurTgpUbO4LACsIgYJz7bYMhi3+skM5w=;
 b=bKuMIpY94qcNZor5JJbg9y1rkV+5c8vEcy8sNNmZrJUwLgNFSRZhf+all1fV932huz
 wST13It32l8icQp15BnImsizqjvbJQLYNhoL7x7ZRkgBgcOfNuR8Oy0kVPUtgd1ORKS6
 JEyqT1VlF3ILsaDXQZtPvomWZNaQJnlMIURLJq0oMoqXmWEnsJ9AEU7HJ5sPiJoq/dOm
 vwEBo/rNNqQJZ9HFhwjQUVLozjNpoyus8kim5gwC4+mChA5Y9Kan3xIm7TjU2jav6WrC
 5DV23rzG1YktYfARiBniJtFxlEvfZYmXbYjVn2fO51jteM+KsG+O3Dr62VcXSAjmPccp
 gqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CRaVGlQqRX3eurTgpUbO4LACsIgYJz7bYMhi3+skM5w=;
 b=ZJOMqGLO6nf9na2FsayUjozVZlbr5b5qCVvFycZeAbxqa17nAjmVs19y4t8iPPeFqA
 X/0SUT0k7X9vtUBThD0KaGMgXQ87ARStZQdyvu54PGt1TGdvYCcdF8S3MLY+Iv69xe/s
 /1+KvgnOOiezTu8D/opPXbU02JC9zxqfmscJWY6vQcwT7knjt2vA9Ud1+HJucgKmUas8
 oAE2YR1ZNulcU0reWOsCnC/LWbpqrFDvLWJJg5rSmX1oEodZ44wDlT8X6JWVLXP0iulV
 7IY2LBrR75kFdWzTyj+lLxvM/JMk45xt+DaQuXc8n/lQ5Fd5t3/yXDgriHCRiIbfPw6I
 2+QA==
X-Gm-Message-State: AOAM532dxQciNQHjbZ9eCkcnM64g3XGeslJLRMKtXMhde8WK7HoJ/sm1
 7QjSl1rOXa+eRADFoiJMUoI=
X-Google-Smtp-Source: ABdhPJy/cCBq2SaALYuvfokncGx1EYWoF3TIXnlyNQ1FvlbAreoJvYPu98Y/UK3bgTxLg0uNGqM4cA==
X-Received: by 2002:a17:90a:de97:: with SMTP id
 n23mr7464729pjv.216.1611490949139; 
 Sun, 24 Jan 2021 04:22:29 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id 5sm13830020pff.125.2021.01.24.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 04:22:28 -0800 (PST)
Date: Sun, 24 Jan 2021 22:22:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 05/12] mm: HUGE_VMAP arch support cleanup
To: Christoph Hellwig <hch@infradead.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-6-npiggin@gmail.com>
 <20210124114008.GE694255@infradead.org>
In-Reply-To: <20210124114008.GE694255@infradead.org>
MIME-Version: 1.0
Message-Id: <1611489959.87u9aj91nf.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ding Tianhong <dingtianhong@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christoph Hellwig's message of January 24, 2021 9:40 pm:
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/v=
malloc.h
>> index 2ca708ab9b20..597b40405319 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -1,4 +1,12 @@
>>  #ifndef _ASM_ARM64_VMALLOC_H
>>  #define _ASM_ARM64_VMALLOC_H
>> =20
>> +#include <asm/page.h>
>> +
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +bool arch_vmap_p4d_supported(pgprot_t prot);
>> +bool arch_vmap_pud_supported(pgprot_t prot);
>> +bool arch_vmap_pmd_supported(pgprot_t prot);
>> +#endif
>=20
> Shouldn't the be inlines or macros?  Also it would be useful
> if the architectures would not have to override all functions
> but just those that are it actually implements?

It gets better in the next patches. I did it this way again to avoid=20
moving a lot of code at the same time as changing name / prototype
slightly.

I didn't see individual generic fallbacks being all that useful really=20
at this scale. I don't mind keeping the explicit false.

> Also lots of > 80 char lines in the patch.

Yeah there's a few, I can reduce those.

Thanks,
Nick
