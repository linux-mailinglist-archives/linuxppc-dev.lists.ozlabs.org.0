Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFD2A464C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 14:28:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQVw012shzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 00:28:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DDGsed/r; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQRq10PPRzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 22:08:22 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id j30so21617419lfp.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 03:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0sEXlBoxnDPWC0PSImx6b45EW/XdSxvl0dskuufPCkM=;
 b=DDGsed/rnR9bezm8l99j+eaiR9Ng8+VD49bJiK1NAcb13ryZua3eiHNJkEUJYM7q4q
 zCCEua4OxygsHhj1XVYFclEnvfs8dtk8HZUq1aa2fKeCC1ivOtLxqOefmDgSGp9oFlOr
 hAWnMoFYPcy6/inHtPYp6y+Ll+sbonCF0KjG6nyml+YxQJr6IbSjcrdNbOQkutO8NxkL
 FEkF/0STPopqzOAi1pVyuF642sMpo4gqoXWfJTZgyjNsKfE0QyHjFu93yXEkV6QK5fCs
 LXCWy6h56hyXQaKhqHUvZP6L632PtDIPp/Z07qwJ3b4T1YdUnIRaKCRJ/6v0LV3pGdBe
 QkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0sEXlBoxnDPWC0PSImx6b45EW/XdSxvl0dskuufPCkM=;
 b=sTEUGLxYdJqfAhGfgPvGJO7HCk31y7kZWfBpv72scJwp0QG31HEMPVTJjOHEcx/Fv6
 x4cZza1w4MftHrqGlC4EWd9f4gIjCdHEzhLVV5n2cBJcXe/Lq4DahxVtvNJ4jFjEPs54
 cbVW5GLJZfZa4bUcZ4TBHm+Z6/7Wm3cvLcFcyP++0b0TcZ7zdkTOwbz7pky4lBif7ujQ
 1GdidH1OwZ53ZVeQyPS51LrNcdMauZ2rSDBSj57eyDRKYekgxdLPJcGHs0XMXtJsa9aS
 8cEdEV9JeXwHi534xH5eFQrs/fBkI59KC+z/fS3ftPDLfsK8nUs/O7NKNq8wn3GvKYFr
 9KOA==
X-Gm-Message-State: AOAM532rU6XaIMMqseDOn70rk0dZUl1aZ6Sb5DplGA5kCxO3GvKdmmkf
 p4SKgp/Agu8sleuRSA8feYtdaw==
X-Google-Smtp-Source: ABdhPJzAyrukqGQuCxp2/NOEVoOC9ZkivmVdXf94z98OJ3dGsVtTaaSEH+8Z/YJLbxgkwYbzErDtUQ==
X-Received: by 2002:a19:c187:: with SMTP id r129mr8047701lff.533.1604401696649; 
 Tue, 03 Nov 2020 03:08:16 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id w9sm4094835ljh.95.2020.11.03.03.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:08:15 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id B845910231C; Tue,  3 Nov 2020 14:08:16 +0300 (+03)
Date: Tue, 3 Nov 2020 14:08:16 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201103110816.t6a3ebtgcm7mfogy@box>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201101170815.9795-3-rppt@kernel.org>
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

On Sun, Nov 01, 2020 at 07:08:13PM +0200, Mike Rapoport wrote:
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index 46b1804c1ddf..054c8cce4236 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -76,6 +76,32 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
>  static inline void hibernate_restore_unprotect_page(void *page_address) {}
>  #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
>  
> +static inline void hibernate_map_page(struct page *page, int enable)
> +{
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +		unsigned long addr = (unsigned long)page_address(page);
> +		int ret;
> +
> +		/*
> +		 * This should not fail because remapping a page here means
> +		 * that we only update protection bits in an existing PTE.
> +		 * It is still worth to have WARN_ON() here if something
> +		 * changes and this will no longer be the case.
> +		 */
> +		if (enable)
> +			ret = set_direct_map_default_noflush(page);
> +		else
> +			ret = set_direct_map_invalid_noflush(page);
> +
> +		if (WARN_ON(ret))

_ONCE?
> +			return;
> +
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	} else {
> +		debug_pagealloc_map_pages(page, 1, enable);
> +	}
> +}
> +
>  static int swsusp_page_is_free(struct page *);
>  static void swsusp_set_page_forbidden(struct page *);
>  static void swsusp_unset_page_forbidden(struct page *);

-- 
 Kirill A. Shutemov
