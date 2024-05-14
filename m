Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8F8C5CE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 23:35:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTIT9KHw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTIT9KHw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vf8lr3FHYz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 07:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTIT9KHw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTIT9KHw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vf8l6631xz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 07:34:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715722475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Xu6ycBxA1ncNcxZjTIGSkpvUsVz0mp4Jxa+4CoWmo=;
	b=BTIT9KHw68mN4wCkOXqiaWaVuqqAC5cOpFTlCr7QNfcppPB8rDIGUjTJiGis4TBWK0wZ5S
	Gr0j+aBgTggMB27XKFXm1kq0WwFhDv70iQ8JrG55FMq8L9aYQQpTyywwcoSsIr70XpHFL/
	MZvmKHMadcFzuw7q8Hjt5BtSQIUahsY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715722475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Xu6ycBxA1ncNcxZjTIGSkpvUsVz0mp4Jxa+4CoWmo=;
	b=BTIT9KHw68mN4wCkOXqiaWaVuqqAC5cOpFTlCr7QNfcppPB8rDIGUjTJiGis4TBWK0wZ5S
	Gr0j+aBgTggMB27XKFXm1kq0WwFhDv70iQ8JrG55FMq8L9aYQQpTyywwcoSsIr70XpHFL/
	MZvmKHMadcFzuw7q8Hjt5BtSQIUahsY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-wZIEzoP4OgCgjSTJ5egxmA-1; Tue, 14 May 2024 17:34:33 -0400
X-MC-Unique: wZIEzoP4OgCgjSTJ5egxmA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2b978f93aeeso423087a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 14:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715722472; x=1716327272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2Xu6ycBxA1ncNcxZjTIGSkpvUsVz0mp4Jxa+4CoWmo=;
        b=QY+mVqm93vrnyROW3wR1gUFOU1+ohCePDaA/NtM4Lg1FkdLCPK1Pz1m3vBo9NqAjh0
         7yK+hboOYG7caEcoNt+MwmjBHM5MSY0UVfSI8wXUOlzVy9IrjZB4sbknh91+XWW22Swn
         q6bjMnBTECbx3ngWIxzSPGvI/GqIPVFJKHHO6qCT2GkcJdLxqNHBFid1+IGgExAiMwFd
         FNv/Ql2H5aPfXIl751EHFDGAFC34yZ+htlwIFtEcyp/gfUq5Lgzsf7hK20pHcc/7S5h2
         T8sNzrW5sm9dO57NfSF3x3cdhO5tHmTBP+VOOjEv937E9QXELN5GSUtwTjYNa/D8Cv8Z
         myHg==
X-Forwarded-Encrypted: i=1; AJvYcCWN+EXaBX8EtrsaD8s0OmN0VN9Oyo7mVlxecHrOrSCc9WZJGuDGcro3np/knLKX+8JPzIon8sDjr2wsUbzL2+tn+i2+T5EF4qOPiuNmGQ==
X-Gm-Message-State: AOJu0YyEz5aTilnlxnicfG9LgzrEZyodn1cfvqlwEWKtcojkXOX9UGpe
	tKf0uSavr3dTWBhQdUFIsKnClt81Ov6bmF6v+5NbiAd+ThtgNIFOx41S+pAmip7UuHoQUUi/6k6
	DogcK9VYJ+WlgQ+ZxL1whRdXkTUmv9zrnYyQDCKuBSzeZrtwCUAI3AdW6gb5dURg=
X-Received: by 2002:a17:903:246:b0:1eb:50eb:c07d with SMTP id d9443c01a7336-1ef441aa0a2mr161489295ad.4.1715722472099;
        Tue, 14 May 2024 14:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlPBl9ea4KstMsjdvAfVmaII4uiOPY4sbbUGcaeXkU+KlSg8op9ntpdI4qQN60DSBg7ZfBtw==
X-Received: by 2002:a17:903:246:b0:1eb:50eb:c07d with SMTP id d9443c01a7336-1ef441aa0a2mr161488855ad.4.1715722471349;
        Tue, 14 May 2024 14:34:31 -0700 (PDT)
Received: from x1n ([50.204.89.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad9da4sm102645805ad.107.2024.05.14.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 14:34:30 -0700 (PDT)
Date: Tue, 14 May 2024 15:34:24 -0600
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <ZkPY4CSnZWZnxjTa@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <ZkPJCc5N1Eotpa4u@localhost.localdomain>
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

On Tue, May 14, 2024 at 10:26:49PM +0200, Oscar Salvador wrote:
> On Fri, May 10, 2024 at 03:29:48PM -0400, Peter Xu wrote:
> > IMHO we shouldn't mention that detail, but only state the effect which is
> > to not report the event to syslog.
> > 
> > There's no hard rule that a pte marker can't reflect a real page poison in
> > the future even MCE.  Actually I still remember most places don't care
> > about the pfn in the hwpoison swap entry so maybe we can even do it? But
> > that's another story regardless..
> 
> But we should not use pte markers for real hwpoisons events (aka MCE), right?

The question is whether we can't.

Now we reserved a swp entry just for hwpoison and it makes sense only
because we cached the poisoned pfn inside.  My long standing question is
why do we ever need that pfn after all.  If we don't need the pfn, we
simply need a bit in the pgtable entry saying that it's poisoned, if
accessed we should kill the process using sigbus.

I used to comment on this before, the only path that uses that pfn is
check_hwpoisoned_entry(), which was introduced in:

commit a3f5d80ea401ac857f2910e28b15f35b2cf902f4
Author: Naoya Horiguchi <nao.horiguchi@gmail.com>
Date:   Mon Jun 28 19:43:14 2021 -0700

    mm,hwpoison: send SIGBUS with error virutal address
    
    Now an action required MCE in already hwpoisoned address surely sends a
    SIGBUS to current process, but the SIGBUS doesn't convey error virtual
    address.  That's not optimal for hwpoison-aware applications.
    
    To fix the issue, make memory_failure() call kill_accessing_process(),
    that does pagetable walk to find the error virtual address.  It could find
    multiple virtual addresses for the same error page, and it seems hard to
    tell which virtual address is correct one.  But that's rare and sending
    incorrect virtual address could be better than no address.  So let's
    report the first found virtual address for now.

So this time I read more on this and Naoya explained why - it's only used
so far to dump the VA of the poisoned entry.

However what confused me is, if an entry is poisoned already logically we
dump that message in the fault handler not memory_failure(), which is:

MCE: Killing uffd-unit-tests:650 due to hardware memory corruption fault at 7f3589d7e000

So perhaps we're trying to also dump that when the MCEs (points to the same
pfn) are only generated concurrently?  I donno much on hwpoison so I cannot
tell, there's also implication where it's only triggered if
MF_ACTION_REQUIRED.  But I think it means hwpoison may work without pfn
encoded, but I don't know the implication to lose that dmesg line.

> I mean, we do have the means to mark a page as hwpoisoned when a real
> MCE gets triggered, why would we want a pte marker to also reflect that?
> Or is that something for userfaultd realm?

No it's not userfaultfd realm.. it's just that pte marker should be a
generic concept, so it logically can be used outside userfaultfd.  That's
also why it's used in swapin errors, in which case we don't use anything
else in this case but a bit to reflect "this page is bad".

> 
> > And also not report swapin error is, IMHO, only because arch errors said
> > "MCE" in the error logs which may not apply here.  Logically speaking
> > swapin error should also be reported so admin knows better on why a proc is
> > killed.  Now it can still confuse the admin if it really happens, iiuc.
> 
> I am bit confused by this.
> It seems we create poisoned pte markers on swap errors (e.g:
> unuse_pte()), which get passed down the chain with VM_FAULT_HWPOISON,
> which end up in sigbus (I guess?).
> 
> This all seems very subtle to me.
> 
> First of all, why not passing VM_FAULT_SIGBUS if that is what will end
> up happening?
> I mean, at the moment that is not possible because we convolute swaping
> errors and uffd poison in the same type of marker, so we do not have any
> means to differentiate between the two of them.
> 
> Would it make sense to create yet another pte marker type to split that
> up? Because when I look at VM_FAULT_HWPOISON, I get reminded of MCE
> stuff, and that does not hold here.

We used to not dump error for swapin error.  Note that here what I am
saying is not that Axel is doing things wrong, but it's just that logically
swapin error (as pte marker) can also be with !QUIET, so my final point is
we may want to avoid having the assumption that "pte marker should always
be QUITE", because I want to make it clear that pte marker can used in any
form, so itself shouldn't imply anything..

Thanks,

-- 
Peter Xu

