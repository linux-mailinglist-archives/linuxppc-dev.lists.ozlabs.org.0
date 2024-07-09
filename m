Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A4092C405
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 21:45:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKnMstD1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKnMstD1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJWgP33rgz3cb2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 05:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKnMstD1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKnMstD1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJWfh6QxFz3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 05:44:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720554294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXci+blh8PkiQtprZqDs2hDj0sD+bUxrPmPIC5bsg+Y=;
	b=KKnMstD15uETrCVIcggT/SlKLrBcKaGdFAcaytARKM9Nkc1/pOgpmy+JqyCBjXFWP6NIYa
	f4Yl+qGDRrHXLBnOJOUYPmuSn7Gi1yxi8U5vM+QW9GHwMpfHnq8DBna0TKDF3R+blsEu0l
	HNWfetZ0yPAW+Iq9ugUz/toQXZWwiLI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720554294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pXci+blh8PkiQtprZqDs2hDj0sD+bUxrPmPIC5bsg+Y=;
	b=KKnMstD15uETrCVIcggT/SlKLrBcKaGdFAcaytARKM9Nkc1/pOgpmy+JqyCBjXFWP6NIYa
	f4Yl+qGDRrHXLBnOJOUYPmuSn7Gi1yxi8U5vM+QW9GHwMpfHnq8DBna0TKDF3R+blsEu0l
	HNWfetZ0yPAW+Iq9ugUz/toQXZWwiLI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317--SCELkGzPFq7Ay7z5K8fig-1; Tue, 09 Jul 2024 15:44:49 -0400
X-MC-Unique: -SCELkGzPFq7Ay7z5K8fig-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-447e34d7437so2791171cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2024 12:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720554288; x=1721159088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXci+blh8PkiQtprZqDs2hDj0sD+bUxrPmPIC5bsg+Y=;
        b=EnMhSLVy/JmlaUAIEBDjH4bimvODDVKShWKZDjTQ0lQqIPP1JxWXuf1LUKrI1sALr3
         bKrvLhwO2TG8lSoo1zHGr9utahtP4UFe1YALYpNNUP1CUCne7vEJeHJYLKnELfttMz7k
         mK/5iPPxaCQDoJP41xXEBz80GmifFKiUUu9RLvOYMBomkAj0cQ7upmUHShBQiF8dv7hT
         ekCawT39hg7UdX7Y7PTwga0Ch46Rh19Enl1uXf32XtIZo1NiS+O6lghMDUmTbGKbvl0x
         +a8xRF9OPYNGLw5kdUm835oRXP9DLOkh6aZBC2VBk1RovShgYS3o3nRs5P9T/DWBupMW
         Mcdg==
X-Forwarded-Encrypted: i=1; AJvYcCWs3cHAD3EjG7g/cxKsQSNwQJvCZKcJq75oMHWgQR3U9If3TABtiU3BCJOsi/GDQKYeIA+wuX6TMu6fFuV8OKx2a3mevoFYra7gYq34lg==
X-Gm-Message-State: AOJu0YyazBd73bzKsJTKuvX04Dqo+4wAA21he7WUMVrZc2xNo+bC3sSt
	g7/4XtKpVFpwxvEkswOw5fj9DgFvNYGrvdBE/ehWaia32FbWCl2jUylPtYq/NomwI0n+asMWBD0
	0McfrizwIbZS2x+tVf8a9lY/Uu9gZOz0A6m0AnWsvyNpRi6n3ZYViCOQUANW4V/s=
X-Received: by 2002:a0c:ec85:0:b0:6b0:8202:5c4e with SMTP id 6a1803df08f44-6b61c214838mr37183816d6.5.1720554287690;
        Tue, 09 Jul 2024 12:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT3nxt9dEv/1jdMBOaRXRJgsCkAMxzEcLl92fDe742ry87qRXqAQQYG1bMf32HDc67VfqpLg==
X-Received: by 2002:a0c:ec85:0:b0:6b0:8202:5c4e with SMTP id 6a1803df08f44-6b61c214838mr37183666d6.5.1720554287366;
        Tue, 09 Jul 2024 12:44:47 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba8c087sm11474646d6.121.2024.07.09.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:44:46 -0700 (PDT)
Date: Tue, 9 Jul 2024 15:44:43 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 7/8] mm/x86: Add missing pud helpers
Message-ID: <Zo2TKzvv2rkKjfTg@x1n>
References: <20240703212918.2417843-8-peterx@redhat.com>
 <202407061716.WH5NMiL2-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202407061716.WH5NMiL2-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, oe-kbuild-all@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 06, 2024 at 05:16:15PM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-dax-Dump-start-address-in-fault-handler/20240705-013812
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240703212918.2417843-8-peterx%40redhat.com
> patch subject: [PATCH v2 7/8] mm/x86: Add missing pud helpers
> config: i386-randconfig-011-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061716.WH5NMiL2-lkp@intel.com/config)
> compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061716.WH5NMiL2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407061716.WH5NMiL2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/atomic.h:8,
>                     from include/linux/atomic.h:7,
>                     from include/linux/jump_label.h:256,
>                     from include/linux/static_key.h:1,
>                     from arch/x86/include/asm/nospec-branch.h:6,
>                     from arch/x86/include/asm/irqflags.h:9,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/spinlock.h:59,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from arch/x86/mm/pgtable.c:2:
>    In function 'pudp_establish',
>        inlined from 'pudp_invalidate' at arch/x86/mm/pgtable.c:649:14:
> >> arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
>       67 |                         __ ## op ## _wrong_size();                      \
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
>       78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
>          |                                 ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
>       12 | #define raw_xchg arch_xchg
>          |                  ^~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
>     4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~
>    arch/x86/include/asm/pgtable.h:1415:24: note: in expansion of macro 'xchg'
>     1415 |                 return xchg(pudp, pud);
>          |                        ^~~~

So this is the PAE paging on i386 which indeed didn't get covered in my
testsuite.. where it only covered allno/alldef which were always 2lvls.

I'll fix it when I repost, I'll add PAE into my harness too.

-- 
Peter Xu

