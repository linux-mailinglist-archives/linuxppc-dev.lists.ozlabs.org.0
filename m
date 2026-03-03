Return-Path: <linuxppc-dev+bounces-17642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hQOmAD1ep2lWhAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 23:18:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4841F7E69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 23:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQVZ12FWXz3bfG;
	Wed, 04 Mar 2026 09:18:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772576313;
	cv=none; b=Z/nIRvJYjZaEkVqP+Q7AccMChpDhndxd+zLB4KohTbfyi0MZcrlDyeBgqlKAno/mR5fw+PBe6wrTZgdYEmbPeqSJU8BXcz35adjSgVTi9aOmSz9zMLY4ZNOIAAgoGEllGfw73iWOL+cny4ecYQDFTlvTEuV4xxJwsSFvGmFZmKSqfWGB3hgjOPwC+8SQQHiVfV2x/oJ3GXuRm2MS5PVzv7hdw4Ab5LrA7nsOayibVt3hIDsTSi4iKXxZk2Wv8dfsdFCFjut4Z1Ey099O524N/MevmoBezEk7+HlsPXH3ieQhGrZRX5lwIjkBijxYsodBqsAmly/5vzv60c8s4v2yZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772576313; c=relaxed/relaxed;
	bh=BP2R36w3xYUknyVVM5sNFE0Pq2fJT7cuN70tvl8P0F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf/z51svJzX8uQKBYbO1TWpts5/OZk+3o2TmDOirhY27g2Lj2plxe4hDQDVn792ODkeqwqNcKO4pXUDb/zTssUD/ZPqxOF98QprnINqHg8Y2Xhff+vnVgSFL5/qegTyuhvp5/OthyLdA9tAfucDDh0jkbajnvOqfKbMOvKA7yNCl38P6cNwPgMn/I62P4W3AAV5KtDjAwwRJsqaU17C5oJ8PqH66BAJn2JjPmiBjUEF1LRrnPChihsX/UCwgy179Df27dW7WLoNODT81wZrMRC3TGYIoavW6HvYSzNjF5EemIRV6q/Bi06OMTYXYKnIpibWJl4Y5cAzxHbSKE5OUIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TDgirRMe; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TDgirRMe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQVYw0WBhz3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 09:18:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BP2R36w3xYUknyVVM5sNFE0Pq2fJT7cuN70tvl8P0F8=; b=TDgirRMe9e/+WYFoYTAQq7tOTs
	n3lhPxA0uC4xXUHSKUoGdyS0FUEYdY1lsPT5yDeY3Jl04CutcDvjaJ6+Q3Vu/fL9sBAb+wTfurQgf
	t0li1gR28N452WXjgi643PV+t5nUfSdHHLUCcr3US0LAE29SxoPZgIT3T8W3ga9RKqK18QBz4wp7R
	LnCMIGqtRLRdW0teAYWqC/dxqac2YaDztPOn03I+oybc/z62V2MBEnsBSiG2HCMj9yv9s2/SIP6Mh
	lL5pqNxRI3v1TIuIBG7viDAXylqbpfoKmluG3AcOeO3K2fvSOBBIkl7YyUDTo+enLV1giDl9ay39o
	o2wr4APw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxY46-0000000CJPp-2JLA;
	Tue, 03 Mar 2026 22:18:06 +0000
Date: Tue, 3 Mar 2026 22:18:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org,
	david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
	jannh@google.com, rppt@kernel.org, mhocko@suse.com,
	pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com,
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org,
	borntraeger@linux.ibm.com, frankja@linux.ibm.com,
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, svens@linux.ibm.com,
	gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <aadeHiMqhHF0EQkt@casper.infradead.org>
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-3-surenb@google.com>
 <74bffc7a-2b8c-40ae-ab02-cd0ced082e18@lucifer.local>
 <CAJuCfpHBfhKFeWAtQo4r-ofVtO=5MvG+OToEgc2DEY+cuZDSGw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHBfhKFeWAtQo4r-ofVtO=5MvG+OToEgc2DEY+cuZDSGw@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 0B4841F7E69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17642-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:ritesh.li
 st@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[willy@infradead.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,infradead.org:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,casper.infradead.org:mid]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:11:31PM -0800, Suren Baghdasaryan wrote:
> On Mon, Mar 2, 2026 at 6:53 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > Overall I'm a little concerned about whether callers can handle -EINTR in all
> > cases, have you checked? Might we cause some weirdness in userspace if a syscall
> > suddenly returns -EINTR when before it didn't?
> 
> I did check the kernel users and put the patchset through AI reviews.
> I haven't checked if any of the affected syscalls do not advertise
> -EINTR as a possible error. Adding that to my todo list for the next
> respin.

This only allows interruption by *fatal* signals.  ie there's no way
that userspace will see -EINTR because it's dead before the syscall
returns to userspace.  That was the whole point of killable instead of
interruptible.

