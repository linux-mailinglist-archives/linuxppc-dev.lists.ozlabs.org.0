Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id DB5698CC854
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 23:56:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6zkypWr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f19+oMTl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl4dh1t57z3wKp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 07:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6zkypWr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f19+oMTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl4cw5s82z3gCw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 07:46:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716414377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0IPOkswwA/TJ9xaHowV/cvfG1H4kLvnXT+ET0mPfmoA=;
	b=Q6zkypWrLByt8VdI/TmX8Ci4YnjIxgXSfDqvlxTVgpJCqQPmyfQfjLfJYDfuQ2deZ46anz
	WACELr531OEhfE8+8jrUVcwgSyxfts9nakVrVo9bO0qpJlQn+qCJhg+seXeRTGQioyI7pn
	jY+dVVExxL3fKygyX1FDv9o6W541khg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716414378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0IPOkswwA/TJ9xaHowV/cvfG1H4kLvnXT+ET0mPfmoA=;
	b=f19+oMTlwqPAiwtzfzspNOctzG72bQBrAXt2L3YOuHF4XvaGPMcmlEDA2l4eGJNVLAeaHH
	3wru3MoreECXo8OXyM3YpT1CY7wdrU5sF+2TFeDltP85FEqYVws5+/mf0f//+D7wPX7UN7
	cHoW8m2X8qDwPSs0s8Yf+QxofWt8P9Q=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-PRCjL_ViPnWA9f3iDFFWOQ-1; Wed, 22 May 2024 17:46:15 -0400
X-MC-Unique: PRCjL_ViPnWA9f3iDFFWOQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ab90673bf4so110316d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 14:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716414375; x=1717019175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IPOkswwA/TJ9xaHowV/cvfG1H4kLvnXT+ET0mPfmoA=;
        b=bAfChOgTZ8dOJlqi/BacY9F5Xxn9jglb8cC5JNIwFldrTOD0fbmAisxMyizGeh1vjK
         F+z6i/I0o5hh4TOQliH6WEuK1mARD09uAO/hwK8BC1eX6t9EMEAcM8hbIoHWtNgSVJlM
         rxRzcVYcHkIhm5zsOg8iVliZeurkd26pkN39y1lOqo5BxvBAUObjRl1KH26ukD99bq3/
         6xhhrbcr5smW2sC4C6RYBQOZJ8ZXKLsi+fWRJVH6GMGe3KRIcxSp7K4Id6MKoe/basFP
         C9QwqT9J0JMt6HULOt5tfmBq9/fcIRZd77T0oo+8JxezQ9zFLor3K5cDxxNRYCPnv3k0
         J93w==
X-Forwarded-Encrypted: i=1; AJvYcCVJNpZfeczxvSI8qgq3bcjCXfyHzx8EAT6ivphGAsoCWwK/RC2EBfsvAZPIhmrpiSut+xH26h7LTGcIoBzB/3kpah+P9Ro7q0vsAxwl8w==
X-Gm-Message-State: AOJu0YxvWl65Dnwrej/mYMnTUUD0+Sra7/plpnO90IECcpata3aDoXSg
	1Bbr+db8KhIGBCZBpzCh8JM/PwJCyqPBgBs6PGDqrvPxD6+xDIXdh/J/9no70OEazHWRFo44hNt
	HxFcYlw9FG1R5Fc9omxTvISQLnYzYBlK+q2PKhL/3vjTOMspv2PVUfkBqR06qk4U=
X-Received: by 2002:a05:6214:3004:b0:69b:1c6d:9a64 with SMTP id 6a1803df08f44-6ab80920651mr35047026d6.4.1716414374689;
        Wed, 22 May 2024 14:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrpao2OsvBu8SGwX0VKGUdrFoO4tAR8Hf7zdwQnywyhHnT3+AiYwuxl3MoZyQZWINIE7Uy4g==
X-Received: by 2002:a05:6214:3004:b0:69b:1c6d:9a64 with SMTP id 6a1803df08f44-6ab80920651mr35046606d6.4.1716414373600;
        Wed, 22 May 2024 14:46:13 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cd266sm136827696d6.80.2024.05.22.14.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 14:46:13 -0700 (PDT)
Date: Wed, 22 May 2024 17:46:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zk5noUEYI4lknyJy@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
 <ZkPY4CSnZWZnxjTa@x1n>
 <ZkSMv31Cwx080no7@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <ZkSMv31Cwx080no7@localhost.localdomain>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 12:21:51PM +0200, Oscar Salvador wrote:
> On Tue, May 14, 2024 at 03:34:24PM -0600, Peter Xu wrote:
> > The question is whether we can't.
> > 
> > Now we reserved a swp entry just for hwpoison and it makes sense only
> > because we cached the poisoned pfn inside.  My long standing question is
> > why do we ever need that pfn after all.  If we don't need the pfn, we
> > simply need a bit in the pgtable entry saying that it's poisoned, if
> > accessed we should kill the process using sigbus.
> > 
> > I used to comment on this before, the only path that uses that pfn is
> > check_hwpoisoned_entry(), which was introduced in:
> > 
> > commit a3f5d80ea401ac857f2910e28b15f35b2cf902f4
> > Author: Naoya Horiguchi <nao.horiguchi@gmail.com>
> > Date:   Mon Jun 28 19:43:14 2021 -0700
> > 
> >     mm,hwpoison: send SIGBUS with error virutal address
> >     
> >     Now an action required MCE in already hwpoisoned address surely sends a
> >     SIGBUS to current process, but the SIGBUS doesn't convey error virtual
> >     address.  That's not optimal for hwpoison-aware applications.
> >     
> >     To fix the issue, make memory_failure() call kill_accessing_process(),
> >     that does pagetable walk to find the error virtual address.  It could find
> >     multiple virtual addresses for the same error page, and it seems hard to
> >     tell which virtual address is correct one.  But that's rare and sending
> >     incorrect virtual address could be better than no address.  So let's
> >     report the first found virtual address for now.
> > 
> > So this time I read more on this and Naoya explained why - it's only used
> > so far to dump the VA of the poisoned entry.
> 
> Well, not really dumped, but we just pass the VA down the chain to the
> signal handler.
> 
> But on the question whether we need the pfn encoded, I am not sure
> actually.
> check_hwpoisoned_entry() checks whether the pfn where the pte sits is
> the same as the hwpoisoned one, so we know if the process has to be
> killed.
> 
> Now, could we get away with using pte_page() instead of pte_pfn() in there, and
> passing the hwpoisoned page instead ot the pfn?
> I am trying to think of the implications, then we should not need the
> encoded pfn?

I sincerely don't know; we need help from someone know better on hwpoison,
maybe.

It's at least not needed in fault paths, afaiu.

> 
> > However what confused me is, if an entry is poisoned already logically we
> > dump that message in the fault handler not memory_failure(), which is:
> > 
> > MCE: Killing uffd-unit-tests:650 due to hardware memory corruption fault at 7f3589d7e000
> > 
> > So perhaps we're trying to also dump that when the MCEs (points to the same
> > pfn) are only generated concurrently?  I donno much on hwpoison so I cannot
> > tell, there's also implication where it's only triggered if
> > MF_ACTION_REQUIRED.  But I think it means hwpoison may work without pfn
> > encoded, but I don't know the implication to lose that dmesg line.
> 
> Not necesarily concurrently, but simply if for any reason the page could
> not have been unmapped.
> Let us say you have ProcessA and ProcessB mapping the same page.
> We get an MCE for that page but we could not unmapped it, at least not
> from all processes (maybe just ProcessA).
> 
> memory-failure code will mark it as hwpoison, now ProcessA faults it in
> and gets killed because we see that the page is hwpoisoned in the fault
> path, so we sill send VM_FAULT_HWPOISON all the way down till you see
> the:
> 
> "MCE: Killing uffd-unit-tests:650 due to hardware memory corruption
> fault at 7f3589d7e000" from e.g: arch/x86/mm/fault.c:do_sigbus()
> 
> Now, ProcessB still has the page mapped, so upon re-accessing it,
> it will trigger a new MCE event. memory-failure code will see that this

The question is why accessing that hwpoison entry from ProcB triggers an
MCE.  Logically that's a swap entry and it should generate a page fault
rather than MCE.  Then in the pgfault hanlder we don't need that encoded
pfn as we have vmf->address.

> page has already been marked as hwpoisoned, but since we failed to
> unmap it (otherwise no one should be re-accessing it), it goes: "ok,
> let's just kill everybody who has this page mapped".
> 
> 
> > We used to not dump error for swapin error.  Note that here what I am
> > saying is not that Axel is doing things wrong, but it's just that logically
> > swapin error (as pte marker) can also be with !QUIET, so my final point is
> > we may want to avoid having the assumption that "pte marker should always
> > be QUITE", because I want to make it clear that pte marker can used in any
> > form, so itself shouldn't imply anything..
> 
> I think it would make more sense if we have a separate marker for swapin
> errors?
> I mean, deep down, they do not mean the same as poison, right?
> 
> Then you can choose which events get to be silent because you do not
> care, and which ones need to scream loud.
> I think swapin errors belong to the latter. At least I a heads-up why a
> process is getting killed is appreciated, IMHO.

Right it can be separate, and that was the plan IIRC. But maybe an overkill
for now if nobody cared, and we can wait until someone really cares about
that.  After all adding a dmesg line for such event is much easier than
removing one..

Thanks,

-- 
Peter Xu

