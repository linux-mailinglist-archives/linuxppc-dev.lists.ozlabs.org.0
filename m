Return-Path: <linuxppc-dev+bounces-17831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I87Iw76qmmcZAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:00:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7A2246FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSB226T5pz2ySS;
	Sat, 07 Mar 2026 03:00:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772812810;
	cv=none; b=P1p4jJhzAFU3y5tPooOZT1Vr1PTXClCRyzT/smF+aPFKwTlH+B2mjzpJR3XJqxTBznSvzId5lp1kUiICT+EmSMEqLYybQAinDZLXQgGeL0qZ+e7k0HnQ3xPWrZOt1sCW8xR6xvlULThM3S0H+eFWZkZNOD4APM9zFCYwrhIFxngLgvUz6Q/+N8wX/NVl+JL+LxU00EY9yN7/yuVPnNJpme7j/kdppNGZIHiTKmdVuYVf6uZ/gTBhu9rSL0+Kl3SF6wTCj3pNm7CXrg1a1Z50VLMXwR9hYXL40vTmA2x2u13HvGne4d34gjpnJNjuK3Xfhx8ag0EyslqdooGahWBUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772812810; c=relaxed/relaxed;
	bh=LhA+IXdOnWx0hCMkw/la6PJLWhXffuq9fpj/Z4yD+/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lN+b8XiRxGTZb9ignw4fPeiwhbsQBJdi7OO8GoYclxU5hyR94R3KCEILR2JwKg34m1z1x4t4NELJElxM7qXXxPpbclkoFs/EoNBhNX+UkntkiZYoVt7r6F22XyaQwaCtAXvxRSXm+xuSHi7DIBJPakOxtqqs3/0OkUqSXJglL3P+GW5hkbW4OBRoOdmitmsKwoaZRe5eYn8JpebCJrQ6lPJLlHd2hZJLmoR2mFbgm8oh/GbGGzD8f8N8LZJi6vgMQdzLwZA5u7Zg6Txv49F8LSLsBtdHsQB+yHNIVT6HglyVq0ThZ8azue5zu1+/X8O1ZJWrdoRdbVszIixsvLz1wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8WNbSnN; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8WNbSnN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSB220CKgz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 03:00:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B511A60053;
	Fri,  6 Mar 2026 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BB7C4CEF7;
	Fri,  6 Mar 2026 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772812807;
	bh=b454bzPbl55ULZOmmc23V4LQKs1U8z6A+oTB2cMxkSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j8WNbSnNmvDwOEQchSrC+awLU1F9TWqkmTuQb3KvRpAWzLZUou3D2zzmuiS70gZst
	 Bwh7Rl9TvfXwyWnldJX5HHuaemXXQi7DRfRcLyJPjVFKnw1+1TlSa2TwmtDO4gC3qZ
	 SsjHQhoYF375E35KJUUMbA3z9iVJvPN1gmhF5c+qtjvl8fDY/ZAsG4pCvqkzZOlwrZ
	 96lpeY6THs1o2800tnctleliaxJ6DVjEL58BBvLikn6o6CIi0KBcSywr5bhQOmeG6k
	 fANs39ciRtTxyGcNUR7fDgCyNsxmJGtaT5oJWRjq5/I1L9qFqOKV9/oNAUWE9k2uGs
	 OxrKcLaTxIjkg==
Message-ID: <546df3d8-2f63-4a83-be44-4cfe21ddb4c6@kernel.org>
Date: Fri, 6 Mar 2026 16:59:56 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] mm: Add helpers to create migration entries from
 struct pages
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ziy@nvidia.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org, linuxppc-dev@lists.ozlabs.org,
 intel-xe@lists.freedesktop.org, jgg@ziepe.ca, Felix.Kuehling@amd.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 ying.huang@linux.alibaba.com
References: <20260202113642.59295-1-jniethe@nvidia.com>
 <20260202113642.59295-7-jniethe@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260202113642.59295-7-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 94F7A2246FE
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
	TAGGED_FROM(0.00)[bounces-17831-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,oracle.com,redhat.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Action: no action

On 2/2/26 12:36, Jordan Niethe wrote:
> To create a new migration entry for a given struct page, that page is
> first converted to its pfn, before passing the pfn to
> make_readable_migration_entry() (and friends).
> 
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have a
> pfn and must be handled separately.
> 
> Prepare for this with a new set of helpers:
> 
>   - make_readable_migration_entry_from_page()
>   - make_readable_exclusive_migration_entry_from_page()
>   - make_writable_migration_entry_from_page()

This is pretty horrible. And everything I see in successive patches
around that is not any better.

Seriously, look at how terrible
make_readable_exclusive_migration_entry_from_page() is.
make_readable_exclusive_migration_device_private_entry is not any
better, but at least doesn't have this questionable flags parameter.

Correct me if I am wrong: all we want is:

make_readable_migration_entry() etc. to create something that
softleaf_to_page() / softleaf_to_folio() can properly convert to a
folio, right?

So maybe we should convert make_readable_migration_entry() and friends
to consume a page (not add new functions ...), and let it internally
figure out how to communicate in the entry that what we are dealing with
is not an ordinary pfn, but a special device-private entry.


> 
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> ---
> v1:
>   - New to series
> v2:
>   - Add flags param
> v3:
>   - No change
> v4:
>   - s/make_writeable_migration_entry_from_page/make_writable_migration_entry_from_page/
>     for the !CONFIG_MIGRATION case
> ---
>  include/linux/leafops.h | 14 ++++++++++++++
>  include/linux/swapops.h | 34 ++++++++++++++++++++++++++++++++++
>  mm/huge_memory.c        | 29 +++++++++++++++++------------
>  mm/hugetlb.c            | 15 +++++++++------
>  mm/memory.c             |  5 +++--
>  mm/migrate_device.c     | 12 ++++++------
>  mm/mprotect.c           | 10 +++++++---
>  mm/rmap.c               | 12 ++++++------
>  8 files changed, 96 insertions(+), 35 deletions(-)
> 
> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> index a9ff94b744f2..52a1af3eb954 100644
> --- a/include/linux/leafops.h
> +++ b/include/linux/leafops.h
> @@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
>  	return swp_offset(entry) & SWP_PFN_MASK;
>  }
>  
> +/**
> + * softleaf_to_flags() - Obtain flags encoded within leaf entry.
> + * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
> + *
> + * Returns: The flags associated with the leaf entry.
> + */
> +static inline unsigned long softleaf_to_flags(softleaf_t entry)
> +{
> +	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
> +
> +	/* Temporary until swp_entry_t eliminated. */
> +	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
> +}

The whole flags stuff does not really belong in this patch. If there are
cleanups to be had, perform them separately, please.


-- 
Cheers,

David

