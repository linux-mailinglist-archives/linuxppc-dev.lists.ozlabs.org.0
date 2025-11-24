Return-Path: <linuxppc-dev+bounces-14457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD286C80F66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 15:18:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFSbY41nsz30Vm;
	Tue, 25 Nov 2025 01:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763993897;
	cv=none; b=bIjXM3ROYlhuDFldd0/TFdJ4Qbt2MHFtercyz2cV9cgm4CdbID2lhEC/StHvx6lciGjFlo7MxEoQheZ3CMr5UnxgmnIiCdSF9t+grPZfmpnu+5+73SS8u7EQ9c6KB24FKJHjitXnCX5kCOPkfEjHdHOXK8Vg+JTOkfZn/9y/4CncE5ARz/rrNyILl+LmXQCbqLkYt6ABKfvu4d33H6aRAtf3q82Et5l07FX5pDUX2fMZsT5//ZW+H0Mm6U6cn9mRA52QlcWRXTEEhNKoCh6C+SQj5Exo5f2+pl8lcbeuT6swGhpPpOXA4qGaspfMg4TRAiy0tPUFk8LUysOioaPmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763993897; c=relaxed/relaxed;
	bh=iIVOeLlAMzSzkUicW6ueGU9frfBx2birDEczttcvHHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJSqwRV53ADFOqgcU/Ih3p+bERnwtCAsYA4lak2pGU9shhhFKvvYe4oda+WPfM1i4jVlzsdTrk9Iwd5g1qvgPYVmE5QYKuvCf2a+1FyfBBD3WFYiFm4y95dNdET87aqgB+wRY3arXA9+KFRAXRv6zdyvTw5tn0ARKkJEd+ewoyUpzE4+Bxt+Gi1vprbHuCrDfxHVDGxwCa+ThfXDY7rx1dpIPiwifJg+x3AbGe42ZAMaenm2b7KDLkgC+QDeq41O9z//IVxxkZ2nhtQvrz/96RuCojOseu/mMlETbsnW+QHmivlUlu8nHCTCbi+Ur5bQL1JuJ07W0yWm28zo7CcB2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwY/4Czd; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwY/4Czd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFSbX6btzz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 01:18:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1230D44070;
	Mon, 24 Nov 2025 14:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C2BC4CEF1;
	Mon, 24 Nov 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993894;
	bh=a/6C0mF2h1YMNLw+DoImoO4DgoQDEX8r5mtUDpbvJqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jwY/4CzdWYY3yql3el0w+panwPS8eTjG7NM5YCf3L3YhAsy5JwYjh7Es6LPXbY89K
	 UzT72wJIiWxPTXvC40ejjtyyoevI1urf2RHf3q2IQUAdx3ePP+T4aUCoLSuGBW+5t9
	 AyiGGmZu06pHbDaUwcXprsC2/AOzkRIQV4P+9nx22kKeJxYI/6ZX91Ahx+H6MJ6otw
	 r5N1JbHHbfGXrrxqIl8Vle4agRInm92WILAzWl7GR78JqldJ+4Ahy0TaoQXDl+8qyU
	 P/r56C1XkT4MDr3u/nrxsHIOTWIbg9bUxLNNU6+mmG6IXjp3Uu9lJEaRSB+6XeQQRZ
	 piKMF1RKiWZwg==
Message-ID: <53a032d0-a394-4040-ba9b-79610ec4b791@kernel.org>
Date: Mon, 24 Nov 2025 15:18:02 +0100
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
Subject: Re: [PATCH v5 12/12] x86/xen: use lazy_mmu_state when
 context-switching
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-13-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-13-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/24/25 14:22, Kevin Brodsky wrote:
> We currently set a TIF flag when scheduling out a task that is in
> lazy MMU mode, in order to restore it when the task is scheduled
> again.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode in task_struct::lazy_mmu_state. We can therefore check that
> state when switching to the new task, instead of using a separate
> TIF flag.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Nothing jumped at me, hoping for another pair of eyes from the XEN folks

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

