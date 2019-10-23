Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAFE24C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 22:49:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z2Y250pmzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 07:49:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="bCC1XEBz";
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ywjJ64CPzDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 03:25:56 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id p12so12442708pgn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ozmEBacDU37qdWHmaIXZS/t2e/cIQTfwOrpKCFE/tE=;
 b=bCC1XEBzNQHigL0d7R6bPEzxm8alb+W4dTu8itjDoIuQnpvCdh21/KVzmfE+Tgs+ET
 ceWRH1QFAtQCwVmj0wWuvh6QCkQaRgwgCLBTlsOklkfp9LViU9s8B80hK7K0MoC/AGMW
 ZF1fsM40mC3fIPu5YTFXe03NoKjMsALdc4tX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ozmEBacDU37qdWHmaIXZS/t2e/cIQTfwOrpKCFE/tE=;
 b=ZgGAlPgCoXooqf4Bn9TKQd1k6kXj7PR8PND2no9vBjyXf0SeHY+SfHd8SvaBnfmEuR
 EO41aUGfmoIoGRI2SO9UaGqDLvrnUTVvQVQYKf4Fi3fOD6QvQ2AXVcFYfk5j6/f3nrsH
 VDleQw/dVZlFWnTNgiRPuI198bH/MIXXI7GJ/QmFmkgUbfja4RpMdZwqsFtLhLthWPRd
 h3FNNhxEJv4lNwASl7ByPoJoxk6QbhZB1MRMS8FK+Tu9qk/IVfPajKdFbpjZmsbRlU8i
 Ubx/sIXxAQ5Fxx5Vq2ujYSnuLeEshezUpV+8nysLjCgJDQynafJaclMevAt7KUs4F5rh
 f5DQ==
X-Gm-Message-State: APjAAAUAzZ0z9dCMLui6ZkHfUvlpHK8hDW9FT/V9EAG27nlil+mNadNy
 UAxK4fJ2zTFXQaBkcxdcGXCsMg==
X-Google-Smtp-Source: APXvYqw1/SgWscVWVYwNzvC56vf/67s2dhZn0DnFv2vyro2EnV66Rhc87hJA64tPAho0TcM73pujSw==
X-Received: by 2002:a63:1042:: with SMTP id 2mr11383658pgq.59.1571847952291;
 Wed, 23 Oct 2019 09:25:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y8sm27285047pgs.34.2019.10.23.09.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 09:25:51 -0700 (PDT)
Date: Wed, 23 Oct 2019 09:25:49 -0700
From: Kees Cook <keescook@chromium.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1 02/12] mm/usercopy.c: Prepare check_page_span()
 for PG_reserved changes
Message-ID: <201910230924.DE879ED80F@keescook>
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-3-david@redhat.com>
 <a8313fb1-50f3-9083-fd07-297ddf86658e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8313fb1-50f3-9083-fd07-297ddf86658e@redhat.com>
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:47:40 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Simon =?iso-8859-1?Q?Sandstr=F6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 10:20:14AM +0200, David Hildenbrand wrote:
> On 22.10.19 19:12, David Hildenbrand wrote:
> > Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
> > change that.
> > 
> > Let's make sure that the logic in the function won't change. Once we no
> > longer set these pages to reserved, we can rework this function to
> > perform separate checks for ZONE_DEVICE (split from PG_reserved checks).
> > 
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > Cc: Allison Randal <allison@lohutok.net>
> > Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>
> > Cc: Qian Cai <cai@lca.pw>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >   mm/usercopy.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/usercopy.c b/mm/usercopy.c
> > index 660717a1ea5c..a3ac4be35cde 100644
> > --- a/mm/usercopy.c
> > +++ b/mm/usercopy.c
> > @@ -203,14 +203,15 @@ static inline void check_page_span(const void *ptr, unsigned long n,
> >   	 * device memory), or CMA. Otherwise, reject since the object spans
> >   	 * several independently allocated pages.
> >   	 */
> > -	is_reserved = PageReserved(page);
> > +	is_reserved = PageReserved(page) || is_zone_device_page(page);
> >   	is_cma = is_migrate_cma_page(page);
> >   	if (!is_reserved && !is_cma)
> >   		usercopy_abort("spans multiple pages", NULL, to_user, 0, n);
> >   	for (ptr += PAGE_SIZE; ptr <= end; ptr += PAGE_SIZE) {
> >   		page = virt_to_head_page(ptr);
> > -		if (is_reserved && !PageReserved(page))
> > +		if (is_reserved && !(PageReserved(page) ||
> > +				     is_zone_device_page(page)))
> >   			usercopy_abort("spans Reserved and non-Reserved pages",
> >   				       NULL, to_user, 0, n);
> >   		if (is_cma && !is_migrate_cma_page(page))
> > 
> 
> @Kees, would it be okay to stop checking against ZONE_DEVICE pages here or
> is there a good rationale behind this?
> 
> (I would turn this patch into a simple update of the comment if we agree
> that we don't care)

There has been work to actually remove the page span checks entirely,
but there wasn't consensus on what the right way forward was. I continue
to leaning toward just dropping it entirely, but Matthew Wilcox has some
alternative ideas that could use some further thought/testing.

-- 
Kees Cook
