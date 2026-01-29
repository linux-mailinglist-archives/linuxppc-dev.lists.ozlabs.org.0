Return-Path: <linuxppc-dev+bounces-16398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLS+N4lle2l2EQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 14:50:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650AB093F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 14:50:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f20rN2wf5z2ydj;
	Fri, 30 Jan 2026 00:49:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769694596;
	cv=none; b=ka7vnmtD586B/gX0SzRUqA1hZK3p24zN8vAvtFNZH+5TVkd1mdElkkFPzMzwhGqcUEviSSOSjxiFkzxcpeVtD5ky9QOuDJvW5nOCJHKyZSZe/+R7qbzUoPWJOtiesdSfBKU53nIb6izpI0ZAfjkJVb2Rgh3dv7u34mTT0nVlnTokoVGMBDymY0sOSrl6qxLow/QRvEFGpAG6yCPqBIFan3Nv9ywj0McB6apfgzzvnsIUS0qxSdVigmk51odQspaSFliH885WKiHwfg89PAl6tLi3F2hWYkWNvDZqyLgusfJmbWxBH4CLSzSAWYKs2B5Z8AlwDmWE82hX6I2BzK8kjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769694596; c=relaxed/relaxed;
	bh=L2m3MJadzQ92FjJDvV6pbq0LnAGzP5Bc/Tadk16iraY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PAyQ2NEu3+5bkj4h6Y+qitTDPOJ+RhsVnUJjD4DZ00T9S9yJsjqx9HwEc7lkGwptn430whfXfOP1bFIr1qVUjPXYYkEINoZWR3zdEyyFkUvR8sr+GZudkXfuVKAUAbvQUsSeilb1y1iSDn9h/gGVTkgqEoJtcDyykk3jzd4x66j8iz9P7LyIoN9nIwpBP+jvb3f+gpLn/eRxtdeOF32tu/ECb55WrXPJ4hNilkhnys+t+cBIe+u3y9aQRlCsVqUMGmzDapZ25zZH0yWDd4TYUKoaRQjj4ZRIi1mW78MHkjyY1lnr3+OFHwfjEfFhhSIFW/A/X8DXffnF2mLWfY53og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=OunAu2D+; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=OunAu2D+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f20rK3GmLz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 00:49:51 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769694585; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=L2m3MJadzQ92FjJDvV6pbq0LnAGzP5Bc/Tadk16iraY=;
	b=OunAu2D++BERjwUau27Qn8lhvUu76uneVVh7e7R3DznzMylloBEvTqvb0wni3O2k1ARE0XaMC/aB5Ib0zw9ahpxz4EfcnuBL0WVES7HeNF9VGDfjsZhACoCj/R/4SXboj46PfgluTH4sH604NeZAgcFWqg3PUDG3BGDAizYhMl4=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wy7d5tv_1769694581 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Jan 2026 21:49:42 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org,  balbirs@nvidia.com,  matthew.brost@intel.com,
  akpm@linux-foundation.org,  linux-kernel@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  david@redhat.com,  ziy@nvidia.com,
  apopple@nvidia.com,  lorenzo.stoakes@oracle.com,  lyude@redhat.com,
  dakr@kernel.org,  airlied@gmail.com,  simona@ffwll.ch,
  rcampbell@nvidia.com,  mpenttil@redhat.com,  jgg@nvidia.com,
  willy@infradead.org,  linuxppc-dev@lists.ozlabs.org,
  intel-xe@lists.freedesktop.org,  jgg@ziepe.ca,  Felix.Kuehling@amd.com,
  jhubbard@nvidia.com
Subject: Re: [PATCH v3 00/13] Remove device private pages from physical
 address space
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com> (Jordan Niethe's
	message of "Fri, 23 Jan 2026 17:22:56 +1100")
References: <20260123062309.23090-1-jniethe@nvidia.com>
Date: Thu, 29 Jan 2026 21:49:40 +0800
Message-ID: <875x8kbkaz.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain; charset=ascii
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.71 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ying.huang@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16398-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ying.huang@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1650AB093F
X-Rspamd-Action: no action

Hi, Jordan,

Jordan Niethe <jniethe@nvidia.com> writes:

> Introduction
> ------------
>
> The existing design of device private memory imposes limitations which
> render it non functional for certain systems and configurations - this
> series removes those limitations. These issues are:
>
>   1) Limited available physical address space 
>   2) Conflicts with arch64 mm implementation
>
> Limited available address space
> -------------------------------
>
> Device private memory is implemented by first reserving a region of the
> physical address space. This is a problem. The physical address space is
> not a resource that is directly under the kernel's control. Availability
> of suitable physical address space is constrained by the underlying
> hardware and firmware and may not always be available. 
>
> Device private memory assumes that it will be able to reserve a device
> memory sized chunk of physical address space. However, there is nothing
> guaranteeing that this will succeed, and there a number of factors that
> increase the likelihood of failure. We need to consider what else may
> exist in the physical address space. It is observed that certain VM
> configurations place very large PCI windows immediately after RAM. Large
> enough that there is no physical address space available at all for
> device private memory. This is more likely to occur on 43 bit physical
> width systems which have less physical address space.
>
> The fundamental issue is the physical address space is not a resource
> the kernel can rely on being to allocate from at will.  
>
> aarch64 issues
> --------------
>
> The current device private memory implementation has further issues on
> aarch64. On aarch64, vmemmap is sized to cover the ram only. Adding
> device private pages to the linear map then means that for device
> private page, pfn_to_page() will read beyond the end of vmemmap region
> leading to potential memory corruption. This means that device private
> memory does not work reliably on aarch64 [0].  
>
> New implementation
> ------------------
>
> This series changes device private memory so that it does not require
> allocation of physical address space and these problems are avoided.
> Instead of using the physical address space, we introduce a "device
> private address space" and allocate from there.
>
> A consequence of placing the device private pages outside of the
> physical address space is that they no longer have a PFN. However, it is
> still necessary to be able to look up a corresponding device private
> page from a device private PTE entry, which means that we still require
> some way to index into this device private address space. Instead of a
> PFN, device private pages use an offset into this device private address
> space to look up device private struct pages.
>
> The problem that then needs to be addressed is how to avoid confusing
> these device private offsets with PFNs. It is the limited usage
> of the device private pages themselves which make this possible. A
> device private page is only used for userspace mappings, we do not need
> to be concerned with them being used within the mm more broadly. This
> means that the only way that the core kernel looks up these pages is via
> the page table, where their PTE already indicates if they refer to a
> device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
> use this information to determine if the PTE contains a PFN which should
> be looked up in the page map, or a device private offset which should be
> looked up elsewhere.
>
> This applies when we are creating PTE entries for device private pages -
> because they have their own type there are already must be handled
> separately, so it is a small step to convert them to a device private
> PFN now too.
>
> The first part of the series updates callers where device private
> offsets might now be encountered to track this extra state.
>
> The last patch contains the bulk of the work where we change how we
> convert between device private pages to device private offsets and then
> use a new interface for allocating device private pages without the need
> for reserving physical address space.
>
> By removing the device private pages from the physical address space,
> this series also opens up the possibility to moving away from tracking
> device private memory using struct pages in the future. This is
> desirable as on systems with large amounts of memory these device
> private struct pages use a signifiant amount of memory and take a
> significant amount of time to initialize.

Now device private pages are quite different from other pages, even in a
separate address pace.  IMHO, it may be better to make that as explicit
as possible.  For example, is it a good idea to put them in its own
zone, like ZONE_DEVICE_PRIVATE?  It appears not natural to put pages
from different address spaces into one zone.  And, this may make them
easier to be distinguished from other pages.

[snip]

---
Best Regards,
Huang, Ying

