Return-Path: <linuxppc-dev+bounces-17611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAphAj0Tp2mfdQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 17:58:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4401F439C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 17:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQMSm0ZmNz3bf8;
	Wed, 04 Mar 2026 03:58:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772557111;
	cv=none; b=X26C+3JhX3LeZi8pkLOZV2GbuXsEEEx/4Y8CQNRS+ttipoPEpK1P2qtcz69rtX1+ovwvv/zWYuNAT8YluYEv4aEFce6YobQA3zqRsHZcteikqeQ0HEeko4gd4nmLrBWGxAqdt1dgE9QTicdC4xrMNIOv3508HbAuc04Z/DCsfNIBJwSdxbYXC+C40Y8EuHZyox9+2EPHtWwL8bH35t5oN85YaWYvqS2s5cyjJSe/EYdgQj2pP0HfpfDqwS7ZVR2jN/kd4rv2iTfv/soX99JmYSSDqUc4MXTOwn8m4yAfl8eg7Q/bHpFkIIGF34IaVkTVZEcjVkuK5OwoUrqovqF9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772557111; c=relaxed/relaxed;
	bh=zuO7xXLZYBoTVCsXlC8EM/dmyDiHVPbuEm4QCTzJl5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CunJBtGQBhhBFDKWBid8O+H8JxUA4AVtZ6lsaswSTxpC087PT2tIJsZZ+UxP7bE52Jr4C0Nye+gY+RZjHLc+USB2wZgIh0DdR002oG/W1AX4jEPR5WZHj1AB0nGECwnsYyJnt56o0aY3zg+NKYZ7g5oWh1qDLqb1ML03yoscwMgTr8x8oDc3NprfweUL8u+gp9Cyrh5RxdVuAD8PN8A4Jco8rQ6jhv1cvUhpifHxiwH+VjtxNCrEduULE4gN3Fi8R/8YUGqEAfJUnOzgCLYqWIo1B1h810a3Az+3vrOUgiMI5NXRz2UZlUhraR+deUpCd8SviEfQD21TNa626vQ58Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JBBTutCI; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JBBTutCI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQMSl07mFz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 03:58:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 997AD60018;
	Tue,  3 Mar 2026 16:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0E5C116C6;
	Tue,  3 Mar 2026 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557108;
	bh=OVAgh1C/XzfXbtKoxyBCaCV23qvyohGYSDUW/NXiyOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JBBTutCIgj+C/noMsPz566cZ3KYohlS0hKyF0VtP/i5dmPER2jOpLCgGR15Y05W72
	 UQysmqgLUTi3xS9Qr6l1lUAhKPrPgbhXodgkzDhMu1tUQro014B1M8nnsjU2qSVzRS
	 Zq1LfVR1GOrklFPIiR0TbyOR9ZXSeBfPp3OEo/PKYNWnLbVOqhhDg9yCx5pofEAxPZ
	 3HlEI5qbfqbeJdcbJbJ3EgyKwpla/AMOu3KBppMY1kAerQ4HrLcz/82I//rViPevQe
	 SQYH0WS7fL4D3TYQ9YbqRA+20UkwbAbClS4R/y5ymTtlnQWvommix5lPjinIIB5Shf
	 +W1RgiTRjqeHA==
Message-ID: <06a86676-51e8-4298-9f63-00e2ad9cdd0e@kernel.org>
Date: Tue, 3 Mar 2026 17:58:19 +0100
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
Subject: Re: [PATCH v6 04/13] mm/migrate_device: Add migrate PFN flag to track
 device private pages
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
 <20260202113642.59295-5-jniethe@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260202113642.59295-5-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1E4401F439C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17611-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,amd.com:email]
X-Rspamd-Action: no action

On 2/2/26 12:36, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> normal PFN and must be handled separately.
> 
> Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
> that a migrate pfn contains a PFN for a device private page.
> 
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> v1:
> - Update for HMM huge page support
> - Update existing drivers to use MIGRATE_PFN_DEVICE
> v2:
> - Include changes to migrate_pfn_from_page()
> - Rename to MIGRATE_PFN_DEVICE_PRIVATE
> - drm/amd: Check adev->gmc.xgmi.connected_to_cpu
> - lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE
> 
> v3:
> - Use adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE
> 
> v4:
> - No change
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  7 ++++++-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  3 ++-
>  drivers/gpu/drm/xe/xe_svm.c              |  2 +-
>  include/linux/migrate.h                  | 14 +++++++++-----
>  lib/test_hmm.c                           |  6 +++++-
>  5 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index b6075a2808c2..fc9465db6d5e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -212,7 +212,12 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
>  unsigned long
>  svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
>  {
> -	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
> +	unsigned long flags = 0;
> +
> +	if (adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE)
> +		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
> +	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT) |
> +	       flags;
>  }

Just pack it into a single line (checkpatch should no longer complain),
or alternatively, indent "flags" properly.

Shouldn't migrate_pfn really be called pfn_to_migrate_pfn()?

Also, looks like a "addr_to_migrate_pfn()" might be a reasonable helper,
which might also reduce the line lenght :)


But now I wonder: could't migrate_pfn() detect internally that this is
MIGRATE_PFN_DEVICE_PRIVATE, similar to how migrate_pfn_from_page() does
it? After all, there must be a "struct page/struct folio" there, or am I
wrong?


-- 
Cheers,

David

