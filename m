Return-Path: <linuxppc-dev+bounces-14456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E06C80EF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 15:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFSSH00Cgz302b;
	Tue, 25 Nov 2025 01:11:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763993518;
	cv=none; b=AxUyQ6Lq0VHEHM+qnglswjlFZjJz/DLX3AhQVQEuaLhjaK/2Nsl3/J0R/C6064jw28MDq+nSvD5hiO7lcJdkdVqZvJ4u8Cayr29QtynHHxUZpPEgtmEr+vyGB+B6Krj5yEn5sM2Bo+ZxkyXoH9KJHpEG2Kxs1hgpqg7uNjkiVW7nsvwRR3bQie+Q7ryjHtuYATG8nhcgIk/V8MCOiY3FHWPLGAyMPgmmh61v/Oha8GOKRX8a8rYCBUNHrAqqAkVUVU9lJaES7iDTPp0mAWGeYMQRRGc7v/9XT9Eom1txIgHHuuz9fFSqCUq+J2mRHdlOE5/yA9ACm1wDPyZK4DBgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763993518; c=relaxed/relaxed;
	bh=KMDKfFvqxZF3OgYS2Y3qGBHTWecl6sSIcgPW0EPBoLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYha5FIIOy9Fhoj/U7iYb13GvVbmwZfIHdnY9lTpLo6DSaWo8YDafTojOsszHJmrDvUGRDrOX9453UGz8rCqfstl+r8dKXAVjSKb9LIcnonxJrwAPPRdDgN4vN6h/I0uqC6iZqaTRxd5ty6cu6QXEuTITcAjSiWNEK+iqOtj7CN4i82NAmPF/3YkqaNbqTLXvGVvAKfXu1X7xR/va7PkmA6C993z2GZs6a0ANGkIl1rrWtQ88vtwbjEUPrIPePcjzAOIB4YImeQJiC6wImujqTQeu8VsoKrkxrkfd0y3mo0TKGqn4632HuInRVxkJ/WKN6Qr48j3OqZtPFONpn3pJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TjUGt8Li; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TjUGt8Li;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFSSF6RGZz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 01:11:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 123B2601A7;
	Mon, 24 Nov 2025 14:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE78BC116C6;
	Mon, 24 Nov 2025 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993515;
	bh=pKRds4IT+BzPKh2fxA3wO0tgnvzHdhCWGBCp+0CwG9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TjUGt8Li6YfogSyMUKImhk9t7zCEyR/5lyaBjeNw6RcKDKrbRq6HnmNGUOxqptBCd
	 dLRr5vxSkWtTK/HdcfyyhBGI6jbvcRygLDwJPNmugo/e/qBVwdADZJpApwewQnH0Lz
	 Zvd3xoS+6vTxsekxWrHLixtrCO8PmynL3TGa54AYYvreiAeQp5nXHtEPY83/MIXq9v
	 IDvhAooUaPXLRXgkrwnbgHUW6P169b7ay8AKZtPjbmGcLHflIqg6kF1HvRTZ7a8+u+
	 51pYm9HXbc2JA+xZLuh0Y9NS3lb+de9hbRLWFhjCNgsTJpUFrYKe7BdliclaVXA64P
	 5nWYBjsK1rt0g==
Message-ID: <9800804f-6e8a-4d08-8eb1-f114df6d6b7a@kernel.org>
Date: Mon, 24 Nov 2025 15:11:44 +0100
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
Subject: Re: [PATCH v5 07/12] mm: bail out of lazy_mmu_mode_* in interrupt
 context
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
 <20251124132228.622678-8-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/24/25 14:22, Kevin Brodsky wrote:
> The lazy MMU mode cannot be used in interrupt context. This is
> documented in <linux/pgtable.h>, but isn't consistently handled
> across architectures.
> 
> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
> interrupt context, because such calls do occur in certain
> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
> batching in interrupt contexts"). Other architectures do not check
> this situation, most likely because it hasn't occurred so far.
> 
> Let's handle this in the new generic lazy_mmu layer, in the same
> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt().
> Also remove the arm64 handling that is now redundant.
> 
> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
> disabled while in interrupt (see queue_pte_barriers() and
> xen_get_lazy_mode() respectively). This will be handled in the
> generic layer in a subsequent patch.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

(resending as I pushed the wrong button there ...)

Moving this patch earlier LGTM, hoping we don't get any unexpected
surprises ...

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

