Return-Path: <linuxppc-dev+bounces-14642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23380CA7AC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNBMk5Gjmz2xs1;
	Sat, 06 Dec 2025 00:01:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764939682;
	cv=none; b=c04RhwO3/SZDm3FkOpQqwXH9f8id2TlWWhe6l890H49H5L4VTQMFQCeY0/tVbXS3IKeENktEMdliemvvEKiuEvz4PGh5rML0w9bEDbjO9w4XzikNEKFfIJKaGpvYtekUNqdBgUkrqJXnRnOWRP9pia/Uj+Fbz0FMog/Ighi8ft3ek/S8j3J1T0omSjuqKeFt+8x7n52Y0DbafJsMINfiNsZHA07heBl1BmnAAZC92tATnF7ZZ1MhWCdofw/pXvey18MMdt4kOqXZS4yV7QZfvYJflGuh68nCubLUxyXZw6Nqf7tYZCFm7oTvGRefQthkvUEK7ou2c437BJvmIFD+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764939682; c=relaxed/relaxed;
	bh=O/A7vZpgIBnKA8LnxsqL7KkP6nyGfOKKNJo36CMVlRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOlRZj+kc9DA8iNHWQ+11EbCTcVCM6LXx18I5SNkWYvfFK2Q3je5KbCqVke3LyCH5zXHWuMKFjrRSMymoXNv2B51MU8jYPvHoUevpR5khdWrMuETlVz/BeEJOGyLe+wwJmgtjY4NVGG3DaZDSBs5YUZG9GmIrFW2r5Xm/cZe1yXI8X3+Tz1VnRrBByUaZfjzY4BVW3YyauQZKaW8qP1GwC2InXmuJoRjUCSCPztmuf2uGzs7wY5jMvpUX3ojATvI9vDrdvsjt/BbzGZfRVFUN3z6hioTBDqzTI5rMUljGuIznfEmZ1vdYbyZqUb6MmEi38itQouEf86wGiqBJymXTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNBMh70HYz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:01:20 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A482F19F6;
	Fri,  5 Dec 2025 05:00:42 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 164973F59E;
	Fri,  5 Dec 2025 05:00:39 -0800 (PST)
Message-ID: <f07f5f70-eb4c-4e45-b7d6-96c8455255d2@arm.com>
Date: Fri, 5 Dec 2025 14:00:37 +0100
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
Subject: Re: [PATCH v5 00/12] Nesting support for lazy MMU mode
To: Venkat <venkat88@linux.ibm.com>
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/12/2025 17:08, Venkat wrote:
> [...]
> Tested this patch series by applying on top of mm-unstable, on both HASH and RADIX MMU, and all tests are passed on both MMU’s.
>
> Ran: cache_shape, copyloops, mm from linux source, selftests/powerpc/ and ran memory-hotplug from selftests/. Also ran below tests from avocado misc-test repo.
>
> Link to repo: https://github.com/avocado-framework-tests/avocado-misc-tests
>
> avocado-misc-tests/memory/stutter.py
> avocado-misc-tests/memory/eatmemory.py
> avocado-misc-tests/memory/hugepage_sanity.py
> avocado-misc-tests/memory/fork_mem.py
> avocado-misc-tests/memory/memory_api.py
> avocado-misc-tests/memory/mprotect.py
> avocado-misc-tests/memory/vatest.py avocado-misc-tests/memory/vatest.py.data/vatest.yaml
> avocado-misc-tests/memory/transparent_hugepages.py
> avocado-misc-tests/memory/transparent_hugepages_swapping.py
> avocado-misc-tests/memory/transparent_hugepages_defrag.py
> avocado-misc-tests/memory/ksm_poison.py
>
> If its good enough, please add below tag for PowerPC changes.
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Many thanks for the testing! Will add your tag to patch 1, 3 and 10.

- Kevin

