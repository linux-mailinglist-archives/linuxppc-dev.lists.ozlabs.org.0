Return-Path: <linuxppc-dev+bounces-17809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCkkLxzHqmnVWwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:22:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF02207BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:22:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS5CF2qZxz3cBb;
	Fri, 06 Mar 2026 23:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772795954;
	cv=none; b=KbZX01svQ2Y8WsOMbviH5MK/OT4Ks2dOOSsOzJIiWIx15EZQ6sznjHlj3Y5qA7S/UHsirzC1358AOA/pNOnk8++Eiu52MLnzksOfFh91nP7g8N2Ow1eduHTytHbpnbphnXdYC6i7KvMxPmkWieqJXO0VbvEhmrODtPcoAURdv0W+lCX0ZHJf8xAm5bPvRjUQVW21rTLhwieE6XQgYcQF0ppoSEBeakLEgeab5AVZ7k5VJZphucbe2UmCe5B9zw2hPANcXJwkBpkzzJcvdLSaJbN+NWAQfYBdzGunC297A83Lh3fH6oarb5sCp2fS2EV/l3spaAAKJWD2IK9v/I8v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772795954; c=relaxed/relaxed;
	bh=Mao5sDzSUZ+f9uQRGE4C9WfuIvF/XWcry+r5NOvZOYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1RiShiDe04yHva+SQab71rp5KrRwLSt7g6dLLueXO7yYxyc8a+PCuF5kUDPFJilkUkULvNS9gq0JR5soQ2aP8mVJC6Q8wh4Jpo7yJP2bjrvXnRVXiChqzPyC7XR/sDNPtAumoA5voWsi1jVevvZT8MG8rSzAYcuaad7o35vMPj6sE5Fe9fOB4qR0bH92KAiRaYnpiNAsaf2GW1+CZNI6vytNq6BBk3PB9aKMH/Po40ehOfxybtPER/hD4KLVQSMxybkS4qD24wgQJjvVkVk4P7HynFt72/3/wtgxF1ovvGXWdlva73hHoKqvdv4s2ILtPwAc/mQ5z4YRn34QOx1LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SIoEzS/D; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SIoEzS/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS3nt0GRWz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 22:19:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9820460127;
	Fri,  6 Mar 2026 11:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD33C4CEF7;
	Fri,  6 Mar 2026 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795950;
	bh=Mao5sDzSUZ+f9uQRGE4C9WfuIvF/XWcry+r5NOvZOYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIoEzS/DxNjqL5S12WR+Z4yk2+4eKi12ei99kZadEHX7MESoV5Wv16WGPtc0njmef
	 y90QEYTXb5wJZglbt0twBS0mvmRICjSm+Pf4pNVSyOyHKbWu/l+0AES9uhiEQcOvDj
	 kh9D9puozrjzimBHTc3sbXUJPclGB4LyqpXKH2lNjcq9sZ/0S+5RJbLGfNQij8sk07
	 mEgagnudwYDACrGUEXJGJRHldgqqHPbw2M4hPETiptO3fvQnUBFuVUWhwsn15OIe8O
	 Nd8cqwkuH0f6HODDVKq1OY5MrRDFUqGhe3otSE6QZyqmDQt7e1ZTflx4ufrWF8MyJf
	 iV3kpykXdQjkw==
Date: Fri, 6 Mar 2026 11:19:02 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 0/4] mm: move vma_(kernel|mmu)_pagesize() out of
 hugetlb.c
Message-ID: <371cf0f7-4b30-4d8c-99e7-ae0543f8be23@lucifer.local>
References: <20260306101600.57355-1-david@kernel.org>
 <4rzf46kw6hq3b5ivv7cvgyza4yfrvk2shrncytobabxef644nm@wzu2bw63co37>
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
In-Reply-To: <4rzf46kw6hq3b5ivv7cvgyza4yfrvk2shrncytobabxef644nm@wzu2bw63co37>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D4BF02207BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17809-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,linux.ibm.com,gmail.com,ellerman.id.au,linux.dev,suse.de,oracle.com,google.com,suse.com,redhat.com,intel.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:pfalcato@suse.de,m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pbonzini@redhat.com,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:13:41AM +0000, Pedro Falcato wrote:
> On Fri, Mar 06, 2026 at 11:15:56AM +0100, David Hildenbrand (Arm) wrote:
> > Looking into vma_(kernel|mmu)_pagesize(), I realized that there is one
> > scenario where DAX would not do the right thing when the kernel is
> > not compiled with hugetlb support.
> >
> > Without hugetlb support, vma_(kernel|mmu)_pagesize() will always return
> > PAGE_SIZE instead of using the ->pagesize() result provided by dax-device
> > code.
> >
> > Fix that by moving vma_kernel_pagesize() to core MM code, where it belongs.
> > I don't think this is stable material, but am not 100% sure.
> >
> > Also, move vma_mmu_pagesize() while at it. Remove the unnecessary hugetlb.h
> > inclusion from KVM code.
> >
> > Cross-compiled heavily.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > Cc: Muchun Song <muchun.song@linux.dev>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@kernel.org>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Pedro Falcato <pfalcato@suse.de>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
>
> Although we all love less mail, FYI it seems like this didn't work properly
> for the patches (no CC's on there).
>
> Did you try git-email --cc-cover?

Yeah I noticed this also :>) Assumed it was a new way of doing things somehow?
:P

>
> --
> Pedro

Cheers, Lorenzo

