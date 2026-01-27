Return-Path: <linuxppc-dev+bounces-16325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BXEIuX/eGmOuQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 19:11:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2B98D65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 19:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0tlL5sXsz309N;
	Wed, 28 Jan 2026 05:11:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769537502;
	cv=none; b=Vn667MKs/LhFgbSiCtBs01Czs1fIwQ/7onUPfYmN/+s1miGzrbjKwmMOISnvG95IJUdh1n8ay8VxGGLMFn4NsQ18XoojWzkj+Sbdwn5g0SyFcnPe7ek7EdUG9jK4cwl2KowochBp5yD+zCKynG0Wsg4PbiRwUZoL04dTQNaBFlYasYGCfDWjyRJixYtqn1BvcG1xwz9C7MZIOiWW3kXXt34/gltl388uS5NELhmr+cUgR0oREglV7nPKNL6wkZA0kR+qavVPDIuDEJlFQYnuNu82O3Au5xMkFf82PvSvu8fB0iKNB+4YedGjy4w7cr4AA+En8oyXEwF5ztvl1JYBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769537502; c=relaxed/relaxed;
	bh=2GTgDTMSjRtu9XA/FLPKOljq2ml0hMhzhLI6yqYD4CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dx7KY6Qr/yiqbSpadcvUnUu/6dYTTwtXcREw1IFaf9STjtmNQUks3F8q0hw8aEE34oYyfAyi4mRXsVE4j0mAsYm/IAJ4V2JY6pI0YpCOR0BkqoLCCPv1BOhow6g7C87Llqt828KimBF58s/Iy9f7UJPvTqtGzzGOY9aeeycVrICI9NUixR1NgMYxRF77CBYnfyexSpg6HejpfzAQXUN/o4k4h6Q3XtLVO4AAMv+fGNI1eLXl2ovgBWbh6i1CO91QZw46Al9eoGp+LID2qvSnEUdkUR9esn0wTYC3ndc4FDT01CNFWMuIdAmxsHJ/sXYSRO9FuuekRooVumyVRK8W1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ByaWjtsS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ByaWjtsS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0tlK4XgBz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 05:11:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 503606013B;
	Tue, 27 Jan 2026 18:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A5C116C6;
	Tue, 27 Jan 2026 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769537498;
	bh=esR6CFIdT2IldE04x541sMjzg2hM0kwiBu50M1Q4i6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByaWjtsSvwoLSW/kNH7xWLyVjxxz5GlRC8jYXsgV/gqb4/lcnR/DbPtvL6ZsfFpSk
	 UMuJqyvtKtohQKsmQxoM99rDtG1O4GqRTw9ZhQsEmWLSfLiBrUcxYInGfM89HyeRgM
	 CxuZITcoVajun6fKU8J38DnbH8BoWcjGzNDWtXdHngn0Bx8YWSVtKYdo5/nJpd1YVl
	 JH22ZwPPk16pgnbMx9Vr3rouzXVb84WvDBKXKk6PK90HPv2OIOvHU6AimhWntYIXkX
	 +GnE9E9QwmWlr81X+KXfieSH8beDfJtCHQfJLkjpSxZ2STIQw2Fz3NkhSNYKoguw1h
	 QmmKWVv1yE1UQ==
Date: Tue, 27 Jan 2026 20:11:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH mm-unstable] arch, mm: consolidate empty_zero_page
Message-ID: <aXj_x5CyUeys7ONM@kernel.org>
References: <20260124095628.668870-1-rppt@kernel.org>
 <2157220c-0394-40fa-9918-a8514171bd10@gaisler.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2157220c-0394-40fa-9918-a8514171bd10@gaisler.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16325-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k
 @lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1FE2B98D65
X-Rspamd-Action: no action

Hi,

On Tue, Jan 27, 2026 at 05:02:39PM +0100, Andreas Larsson wrote:
> On 2026-01-24 10:56, Mike Rapoport wrote:
>
> > Every architecture defines empty_zero_page that way or another, but for the
> > most of them it is always a page aligned page in BSS and most definitions
> > of ZERO_PAGE do virt_to_page(empty_zero_page).
> 
> Running this in an LDOM on an UltraSparc T4 sparc64, the entire LDOM
> hangs after a while during boot.
> 
> > diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> > index c2d19c9a9244..2bd99944176d 100644
> > --- a/arch/sparc/mm/init_64.c
> > +++ b/arch/sparc/mm/init_64.c
> > @@ -177,9 +177,6 @@ extern unsigned long sparc_ramdisk_image64;
> >  extern unsigned int sparc_ramdisk_image;
> >  extern unsigned int sparc_ramdisk_size;
> >  
> > -struct page *mem_map_zero __read_mostly;
> > -EXPORT_SYMBOL(mem_map_zero);
> > -
> >  unsigned int sparc64_highest_unlocked_tlb_ent __read_mostly;
> >  
> >  unsigned long sparc64_kern_pri_context __read_mostly;
> > @@ -2506,18 +2503,6 @@ void __init mem_init(void)
> >  	 */
> >  	register_page_bootmem_info();
> >  
> > -	/*
> > -	 * Set up the zero page, mark it reserved, so that page count
> > -	 * is not manipulated when freeing the page from user ptes.
> > -	 */
> > -	mem_map_zero = alloc_pages(GFP_KERNEL|__GFP_ZERO, 0);
> > -	if (mem_map_zero == NULL) {
> > -		prom_printf("paging_init: Cannot alloc zero page.\n");
> > -		prom_halt();
> > -	}
> > -	mark_page_reserved(mem_map_zero);
> > -
> > -
> >  	if (tlb_type == cheetah || tlb_type == cheetah_plus)
> >  		cheetah_ecache_flush_init();
> >  }
> 
> This just removes the mark_page_reserved(mem_map_zero) without 
> replacing it with something corresponding to that. Perhaps part
> of the problem?

I don't think so, empty_zero_page is in BSS now an it's reserved as a part
of the kernel image.

I suspect that virt_to_page() does not work BSS symbols on sparc64. Can you
please try with this patch:

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 74ede706fb32..0578c5172d4e 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -22,6 +22,7 @@
 #include <asm/adi.h>
 #include <asm/page.h>
 #include <asm/processor.h>
+#include <asm/vaddrs.h>
 
 /* The kernel image occupies 0x4000000 to 0x6000000 (4MB --> 96MB).
  * The page copy blockops can use 0x6000000 to 0x8000000.
@@ -210,6 +211,11 @@ extern unsigned long _PAGE_CACHE;
 extern unsigned long pg_iobits;
 extern unsigned long _PAGE_ALL_SZ_BITS;
 
+extern unsigned long kern_base;
+#define ZERO_PAGE(vaddr)						   \
+	(virt_to_page(empty_zero_page + ((unsigned long)__va(kern_base)) - \
+		      ((unsigned long)KERNBASE)))
+
 /* PFNs are real physical page numbers.  However, mem_map only begins to record
  * per-page information starting at pfn_base.  This is to handle systems where
  * the first physical page in the machine is at some huge physical address,
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 2bd99944176d..d2d724ba4f83 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -170,6 +170,8 @@ static void __init read_obp_memory(const char *property,
 
 /* Kernel physical address base and size in bytes.  */
 unsigned long kern_base __read_mostly;
+EXPORT_SYMBOL(kern_base);
+
 unsigned long kern_size __read_mostly;
 
 /* Initial ramdisk setup */
 
> Cheers,
> Andreas

-- 
Sincerely yours,
Mike.

