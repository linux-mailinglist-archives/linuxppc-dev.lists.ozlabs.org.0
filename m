Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF12A4872
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:42:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQXYg5wRVzDqL9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 01:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=tYRtCsCJ; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQXVM053gzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 01:39:22 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id 2so19251281ljj.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M/CcLnAggfPJTPHCvJqAFAyQXrrFbGX8RqEWGTOIlRk=;
 b=tYRtCsCJ97u7yAlrOFN203Mpt9jz/EvbuW4V+3hipSUNsR5M8ZDqWsq7efoMiN9R5c
 nhVCnARjFr5alomHWUrG2S/QRxbOVwaEaiSQTgeF0uEgCJ7a2rbupEC/g2AUeshC9i6C
 wIKR126viYncqhHiZROMnSmO9imaid0rNJepyxM6rr8Apn+RPbJ3qWs7P+ZnHrSgvOWA
 QcXHZrEHzXM4SVCDzBK7zqXcUTu3T+G1dUvHRbLGUKs/I2DIfrL0bitkL+B4SCLYpFfX
 lHpCGqsodauH4LxSQSOtDBLKGW1a7DHfcCp5nbfeol5ZCBBoivuqpYvLjRQisIJ68BoF
 UMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M/CcLnAggfPJTPHCvJqAFAyQXrrFbGX8RqEWGTOIlRk=;
 b=Y4g2ZgI5N2W+E1dbuzGOmTntnS6K7wnxkS2wRncybekkIc5RGxI/PP3Gxj7LT1w4EI
 jQ2m7IQwWPGvD8rQDCR2oCLGd2VqNpXi+DnBaOP6YI73a6YQhlkxYDzaA3oVdNp/ZATK
 sRjrGAD+jta4+dea81OFmG1p9wqj/iP0WxuU3S7RsmUDEtABB8C6RltI+EK33zQej8Ce
 nW5KOvDwZJJlcSe9+LApkPFTCRy24dF2qaIG8G2JBnoCvjLOwFTAFmS71CysC6lbhczW
 8UftkTQvpTKKzWKgb8oTGDjsU3OoYykc8p7D/nAUXZpEQYXkOsjjxYGtu4IAcnV8jcfg
 lRfg==
X-Gm-Message-State: AOAM530Yct8U0IYThzC9KAWzS1d/nErqnBGwxDFKbnAHCDneMK+Hsa8X
 /l0SZhoPhqgyxfHymkUQDAKHkA==
X-Google-Smtp-Source: ABdhPJz+L8qrHCJkzOuQS8/wvO1dQM/ksNE/UzgTA6Cx0Ac2GRFSZ5fX6eoakfcdH0CZnI4/h7s3ng==
X-Received: by 2002:a2e:879a:: with SMTP id n26mr9115208lji.347.1604414356208; 
 Tue, 03 Nov 2020 06:39:16 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id g27sm4334360ljl.91.2020.11.03.06.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 06:39:15 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 65F1510231C; Tue,  3 Nov 2020 17:39:16 +0300 (+03)
Date: Tue, 3 Nov 2020 17:39:16 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201103143916.otz2o4h2dlmewn3h@box>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-3-rppt@kernel.org>
 <20201103110816.t6a3ebtgcm7mfogy@box>
 <20201103121350.GI4879@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103121350.GI4879@kernel.org>
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 03, 2020 at 02:13:50PM +0200, Mike Rapoport wrote:
> On Tue, Nov 03, 2020 at 02:08:16PM +0300, Kirill A. Shutemov wrote:
> > On Sun, Nov 01, 2020 at 07:08:13PM +0200, Mike Rapoport wrote:
> > > diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> > > index 46b1804c1ddf..054c8cce4236 100644
> > > --- a/kernel/power/snapshot.c
> > > +++ b/kernel/power/snapshot.c
> > > @@ -76,6 +76,32 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
> > >  static inline void hibernate_restore_unprotect_page(void *page_address) {}
> > >  #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> > >  
> > > +static inline void hibernate_map_page(struct page *page, int enable)
> > > +{
> > > +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> > > +		unsigned long addr = (unsigned long)page_address(page);
> > > +		int ret;
> > > +
> > > +		/*
> > > +		 * This should not fail because remapping a page here means
> > > +		 * that we only update protection bits in an existing PTE.
> > > +		 * It is still worth to have WARN_ON() here if something
> > > +		 * changes and this will no longer be the case.
> > > +		 */
> > > +		if (enable)
> > > +			ret = set_direct_map_default_noflush(page);
> > > +		else
> > > +			ret = set_direct_map_invalid_noflush(page);
> > > +
> > > +		if (WARN_ON(ret))
> > 
> > _ONCE?
> 
> I've changed it to pr_warn() after David said people enable panic on
> warn in production kernels.

pr_warn_once()? :P

-- 
 Kirill A. Shutemov
