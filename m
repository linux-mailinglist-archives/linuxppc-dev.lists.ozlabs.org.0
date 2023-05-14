Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F0701EED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 20:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QK9mz0V3nz3chj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 04:21:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=3hM1VI6N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=3hM1VI6N;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QK9m42lwgz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 04:20:35 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-ba6d024a196so3093729276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684088430; x=1686680430;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/w8Ik+B9LqquAVc24RATG4RXaBZs1t11jn/s3N/obhU=;
        b=3hM1VI6NWGWu8nKjmz4E776n6/tfMkoFz07qqIrs1oaapPZVpFGqRfLcsrD2Q9+aIl
         lVkR5CaBLhkLbvj6PetC97KquetslVNm4ewYDv3VlmeuHTS81B9LSL8mS5hv5NNIrJ5k
         qfkEuu9pgy+dtpTd6GHTh0Gi0u67Y0T46ElzOPo7riZGmKUfHA7vSk0Zmd7HgvGJHxab
         DqbZyXByDthzzyzxr91aGkpWgNkslpXmOPPlerkZVQyLnPVqgNtVTmJy+exwCn44tZ+/
         VxkE3CJ7HkShwyo4XrVtp449lbAR3UPOjv88P7k+8G1RfjN7YRQ6k8XKtpgdfILs4FOB
         5kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684088430; x=1686680430;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/w8Ik+B9LqquAVc24RATG4RXaBZs1t11jn/s3N/obhU=;
        b=OXx0OyPy1gEI84iFyNZJbKG5jiEx7FTAW9GVB1UisYJLDs7m+3WRRAB1zpk03xLqNU
         iaOg3iKXJUe+q4JqaJPCEAfq/jhgq1z0GnTO95Brrse/hvjqN0bm0t5peU58TWs6p57q
         H03clXFedVuX+GxyIxHdqoCBSlI+A76bbc3rU9lZkGJewxTxUw7ZCvGW4jEuMVraoCLS
         1tNzbDdK3rS0g+0h1vyfblnK/0E5OWOqgP7GRPUPJ44yquyTAa0Qk1hJD90RUGy6MdTD
         BbBbXuO3gfPFAvN+DpO83pfdh82XgBTnmz8eZGftuDp+jEcAO0sziDDb/knFFYlOVMdC
         mSXg==
X-Gm-Message-State: AC+VfDxvZguTcNN5tKsd8/uGcOU/kICstgpKVn79zwXcSI/lp9BFPnEN
	ImABtbF/E6JSLFC1tVRJKFNDiA==
X-Google-Smtp-Source: ACHHUZ4uC/iK9slyVYAwsZbskAJfVUMUdzJpIRbgKgSPhKsknTzzPntrNJG85XVm7SRutl/ig2uJ2g==
X-Received: by 2002:a25:abe5:0:b0:ba1:b539:a39a with SMTP id v92-20020a25abe5000000b00ba1b539a39amr27412446ybi.6.1684088430350;
        Sun, 14 May 2023 11:20:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 192-20020a2503c9000000b00ba73c26f0d6sm1520144ybd.15.2023.05.14.11.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 11:20:28 -0700 (PDT)
Date: Sun, 14 May 2023 11:20:16 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 08/23] parisc: add pte_unmap() to balance get_ptep()
In-Reply-To: <ca4ac780-42b0-4818-bd84-e1a4acbb28dd@gmx.de>
Message-ID: <6de39db5-d9aa-b35a-1652-8bdf90e7df72@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <44ebbf90-5fbb-2815-17c7-fcfe3c87d78e@google.com> <ca4ac780-42b0-4818-bd84-e1a4acbb28dd@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <m
 onstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 13 May 2023, Helge Deller wrote:

> Hi Hugh,
> 
> On 5/10/23 06:52, Hugh Dickins wrote:
> > To keep balance in future, remember to pte_unmap() after a successful
> > get_ptep().  And (we might as well) pretend that flush_cache_pages()
> > really needed a map there, to read the pfn before "unmapping".
> >
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >   arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
> >   1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> > index 1d3b8bc8a623..b0c969b3a300 100644
> > --- a/arch/parisc/kernel/cache.c
> > +++ b/arch/parisc/kernel/cache.c
> > @@ -425,10 +425,15 @@ void flush_dcache_page(struct page *page)
> >     offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
> >     addr = mpnt->vm_start + offset;
> >     if (parisc_requires_coherency()) {
> > +			bool needs_flush = false;
> >      pte_t *ptep;
> >
> >   			ptep = get_ptep(mpnt->vm_mm, addr);
> > -			if (ptep && pte_needs_flush(*ptep))
> > +			if (ptep) {
> > +				needs_flush = pte_needs_flush(*ptep);
> > +				pte_unmap(ptep);
> > +			}
> > +			if (needs_flush)
> >     		flush_user_cache_page(mpnt, addr);
> >     } else {
> >   			/*
> > @@ -560,14 +565,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
> >   static void flush_cache_page_if_present(struct vm_area_struct *vma,
> >   	unsigned long vmaddr, unsigned long pfn)
> >   {
> > -	pte_t *ptep = get_ptep(vma->vm_mm, vmaddr);
> > +	bool needs_flush = false;
> > +	pte_t *ptep;
> >
> >    /*
> >     * The pte check is racy and sometimes the flush will trigger
> >     * a non-access TLB miss. Hopefully, the page has already been
> >     * flushed.
> >     */
> > -	if (ptep && pte_needs_flush(*ptep))
> > +	ptep = get_ptep(vma->vm_mm, vmaddr);
> > +	if (ptep) {
> > +		needs_flush = pte_needs_flush(*ptep))
> 
> ^^^^^
> One ")" too much and lacks a trailing ";"
> Should be:
> 		needs_flush = pte_needs_flush(*ptep);
> 
> With that fixed the kernel compiles and boots sucessfully on parisc.

Urgh! Indeed, thanks a lot Helge: I'll fold that in.

Hugh
