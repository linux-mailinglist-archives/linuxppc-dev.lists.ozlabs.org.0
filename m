Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3E4126D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 21:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCvdB2Lw6z2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 05:24:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20210112.gappssmtp.com header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=51peZIPp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20210112.gappssmtp.com
 header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=51peZIPp; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCvcS0lrzz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 05:23:50 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id e15so33165804lfr.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lfxmCAIn9aHEGlNTCFP6oI4sdv4GtF/cTPp74Gw1WBM=;
 b=51peZIPp0Z/EhYUJjOrVhklffvLaouyg2C5XP2pPvI6GKpQqRTRJNH9z0riNU6JUST
 o0XwKLmOpbRlulubaDys5ESijC7RfZDY0btoMVLhd24Wbuq4HCPaAcFG5bL/hMGrqGtL
 7xl5z5ix8Uq+1/IFKbmMGW0qkcT6Kblu2SXf54ogQOpF0XmbXZnVwYt6ayxUDZ2i0zc5
 ndwQC+lLTjKOM/5Nx96ULxzCt3Is+WBaiGfGuvvkAWuKo2L9VaqIf1rPaXJawFd0DZaR
 UVhdwOrDahN59n5xgeFFwe62qLfoeS4Srs8f0W8HdLOxbwittlQusCzObDZLZ8VTA7Ay
 5WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lfxmCAIn9aHEGlNTCFP6oI4sdv4GtF/cTPp74Gw1WBM=;
 b=6tOhpJcEIRJMS9FHgFYDJ79PbKpbeJosjb762qiTStiuDTw6K0mVC4M9DLvhNOoBqL
 9wSpUbniRbY2tJDBguHeL6MckN/uzfSnuM5n2QDo6UkmMR9hyuyzqdalM7KlERJBGCOU
 WZzVckoryMfbqtzeSKLgOqX/Ltmv30DpZHMCavLOYg/vhljKpXRpMMSUM0W5PR7w19zC
 jZU2NWQSIEOqjQieEhwjGR3V1ZrRisNsw9DqJzwHA7jSrBmK4lAZ9pR0BPz8K9Dcrj+u
 OP4G1653r5fLT56eM+U65MkwXo3S8V2Pc2bs2ZEsb+Bnh3sTNi5uNJuYKc9fxfwZkh37
 jnfg==
X-Gm-Message-State: AOAM532RT9vkJ1reC7uwl4a1PzbFoTpQGP7P9jG/CiL9H5kXjxPxRG3B
 ftVLPTEntzw2brjE001WMSGpgg==
X-Google-Smtp-Source: ABdhPJzBd1RwKOZT1XWwd9VMdTBk2dtlBYL+yyroRGVVu01s956l3lUsknRhzDPFsjv00pVQxtEqOw==
X-Received: by 2002:a05:651c:83:: with SMTP id
 3mr23323003ljq.341.1632165822010; 
 Mon, 20 Sep 2021 12:23:42 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j21sm1858858ljh.87.2021.09.20.12.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:23:41 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id B961C103053; Mon, 20 Sep 2021 22:23:41 +0300 (+03)
Date: Mon, 20 Sep 2021 22:23:41 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 08, 2021 at 05:58:36PM -0500, Tom Lendacky wrote:
> diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
> index 470b20208430..eff4d19f9cb4 100644
> --- a/arch/x86/mm/mem_encrypt_identity.c
> +++ b/arch/x86/mm/mem_encrypt_identity.c
> @@ -30,6 +30,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/mem_encrypt.h>
> +#include <linux/cc_platform.h>
>  
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> @@ -287,7 +288,7 @@ void __init sme_encrypt_kernel(struct boot_params *bp)
>  	unsigned long pgtable_area_len;
>  	unsigned long decrypted_base;
>  
> -	if (!sme_active())
> +	if (!cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
>  		return;
>  
>  	/*

This change break boot for me (in KVM on Intel host). It only reproduces
with allyesconfig. More reasonable config works fine, but I didn't try to
find exact cause in config.

Convertion to cc_platform_has() in __startup_64() in 8/8 has the same
effect.

I believe it caused by sme_me_mask access from __startup_64() without
fixup_pointer() magic. I think __startup_64() requires special treatement
and we should avoid cc_platform_has() there (or have a special version of
the helper). Note that only AMD requires these cc_platform_has() to return
true.

-- 
 Kirill A. Shutemov
