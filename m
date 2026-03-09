Return-Path: <linuxppc-dev+bounces-17901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGJHNljOrmnEIwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:42:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFA239E95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTyr51mqGz3bnm;
	Tue, 10 Mar 2026 00:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773063765;
	cv=none; b=a3O+gAawmOoEG8LUKn8aWanLxhwM1UisDLOtQuqRHx53r6SnX7Rh2aw9/qeH58eOcX5LDU3QqGAPh6oLNirAEQ4S7I4PjMsKtjOsmQFLtBd41r4OgQzhovFS8NNvn/2eiTIdJ+tbXoA22H6vYU/oHJhX+EN8X5iR9+Mcuh+4y1DAYKjXYW4xYVLizWoIC2KzyqR98ig/4sAL2H3J0TWYvagwsPMfBWjOg+nefGtcCDHZcTDv+FbOV2J9tvHS/vHDhhc7avptEajWDqwpHGPqTdClfeN755MSAgoyVhBlvgifdDE1zEOTZHTJggxQqv1Es5MeznPcoWMxWw7bxX5lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773063765; c=relaxed/relaxed;
	bh=QdLqgkrqeAfJ6Qj1NcjlAT2Fn0qLa5PiGFwuIm6W/I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0cLhqbjlRgYs71+luclIFq8AdnWZtBHTM5mMileMleEbb5OkIhJcu+fEldCGIDjnC+nxZwaRCVV6ezv2i0qHYnwQOFupTufoR/WdAloTGjQoApMvBH1pE8qPzkX3+G3z8deaV4PPvHoyi6x/2G6SOz1m3Xkh9GlwFA1764mCW4oigTmwO2Z3+I7t4ICuDBKJfOquRig44jjkE8vqCe8IGOjfbgqgUT7YNRK7g2wiDfdcZqHkZhPrio2JBlQo443hQ/SkPQEPv0+XzlbziDBrFZrtxAs2LGDRk/Wy6wSdbgwR9aV7EBhrLAfYe/qlzerxL4cTLkVCDhige2uQrLPFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQnV0/0I; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQnV0/0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTyr42qhcz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 00:42:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6966443410;
	Mon,  9 Mar 2026 13:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF653C2BCB0;
	Mon,  9 Mar 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773063762;
	bh=QdLqgkrqeAfJ6Qj1NcjlAT2Fn0qLa5PiGFwuIm6W/I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQnV0/0Ib5o0KbD2/Ib4XNlPdDfuU95v07ZdnPKKg/jFgYKnhJQhqIjmKDE6jqoHa
	 UbnrtJYOdfufndzBfXb1qT70GS2hllMwKgjigWNx4X/AmvD8OC015KFUUmWfM896jr
	 wXD1IkVH+s3e1kL5CIa837syBspn675hbIjHowdCIOfapdJc/If84l+T88BRb5Q1/C
	 fHHYCOP92nycWnMvBnifB/KK9hIBMPUEWC6c1NlMCuWDVPTlHFviQ7LzRunEaSUMkn
	 iJr6MSJLjAjFWmO3A7thdciHjEBjfED6vCHJ9FMv7WUeep4AHm6VcjAK/bvyCVE536
	 8QEJ6P5eRDAHw==
Date: Mon, 9 Mar 2026 13:42:35 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 0/4] mm: move vma_(kernel|mmu)_pagesize() out of
 hugetlb.c
Message-ID: <9172a09f-f014-4a76-b813-8f0c79fbe2f4@lucifer.local>
References: <20260306101600.57355-1-david@kernel.org>
 <4rzf46kw6hq3b5ivv7cvgyza4yfrvk2shrncytobabxef644nm@wzu2bw63co37>
 <371cf0f7-4b30-4d8c-99e7-ae0543f8be23@lucifer.local>
 <5eae6c52-c3f9-407e-8fb8-01a950b282bf@kernel.org>
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
In-Reply-To: <5eae6c52-c3f9-407e-8fb8-01a950b282bf@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D8CFA239E95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17901-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:pfalcato@suse.de,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pbonzini@redhat.com,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,linux.dev,oracle.com,google.com,suse.com,redhat.com,intel.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_TWELVE(0.00)[21];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:12:50PM +0100, David Hildenbrand (Arm) wrote:
> On 3/6/26 12:19, Lorenzo Stoakes (Oracle) wrote:
> > On Fri, Mar 06, 2026 at 11:13:41AM +0000, Pedro Falcato wrote:
> >> On Fri, Mar 06, 2026 at 11:15:56AM +0100, David Hildenbrand (Arm) wrote:
> >>> Looking into vma_(kernel|mmu)_pagesize(), I realized that there is one
> >>> scenario where DAX would not do the right thing when the kernel is
> >>> not compiled with hugetlb support.
> >>>
> >>> Without hugetlb support, vma_(kernel|mmu)_pagesize() will always return
> >>> PAGE_SIZE instead of using the ->pagesize() result provided by dax-device
> >>> code.
> >>>
> >>> Fix that by moving vma_kernel_pagesize() to core MM code, where it belongs.
> >>> I don't think this is stable material, but am not 100% sure.
> >>>
> >>> Also, move vma_mmu_pagesize() while at it. Remove the unnecessary hugetlb.h
> >>> inclusion from KVM code.
> >>>
> >>> Cross-compiled heavily.
> >>>
> >>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> >>> Cc: Nicholas Piggin <npiggin@gmail.com>
> >>> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >>> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> >>> Cc: Muchun Song <muchun.song@linux.dev>
> >>> Cc: Oscar Salvador <osalvador@suse.de>
> >>> Cc: Lorenzo Stoakes <ljs@kernel.org>
> >>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >>> Cc: Vlastimil Babka <vbabka@kernel.org>
> >>> Cc: Mike Rapoport <rppt@kernel.org>
> >>> Cc: Suren Baghdasaryan <surenb@google.com>
> >>> Cc: Michal Hocko <mhocko@suse.com>
> >>> Cc: Jann Horn <jannh@google.com>
> >>> Cc: Pedro Falcato <pfalcato@suse.de>
> >>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>> Cc: Dan Williams <dan.j.williams@intel.com>
> >>
> >> Although we all love less mail, FYI it seems like this didn't work properly
> >> for the patches (no CC's on there).
> >>
> >> Did you try git-email --cc-cover?
> >
> > Yeah I noticed this also :>) Assumed it was a new way of doing things somehow?
> > :P
>
> "--cc-cover" is apparently not the git default on my new machine.
>
> "See, I CCed you, I totally did not try to sneak something in. Oh, I
> messed up my tooling, stupid me ...". :)

;)

Wasn't aware of that option actually, handy!

>
> --
> Cheers,
>
> David

Cheers, Lorenzo

