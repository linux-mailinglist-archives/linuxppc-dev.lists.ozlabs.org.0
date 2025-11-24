Return-Path: <linuxppc-dev+bounces-14455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA1C80EEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 15:11:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFSRF19fsz2xQs;
	Tue, 25 Nov 2025 01:11:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763993465;
	cv=none; b=QFAR2spvKelB2JhlV7sXoFg0QUvKrGfv/4gI1V0Ro2FaCQz5KVhzky0vUk05EgntmDmXQpA0iyh1fj7/MHgO8PKYA4OnBXra2mG7pEaewGrk44vyqyCX7kdZgKxFeAVIQ7gJ+WTMCXmLfGjlkABPb0Gs19BrAp9gcid5Knw62pFR2mk7phrXNXygSn9qxHwW9FgCcNyLGDF5+eUQEwKCdLy6JBkbYhdG8T+eBnRq91WVU+iWVJsHqijgEts3fRzytiI0Xzam1p1qEOnCyzdvcTPhg13b+8Gly9sLlUH+W0jNZFmWtyOkTAXqm4cGRIMyOxqsSiTvKsxDoJ+BPVpK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763993465; c=relaxed/relaxed;
	bh=jSkF3ZRD0txUuUowRzgmTMI1fvINIcu6kZL0IrYQPWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePPBXsY971TtZJTcRkEJIU+ajD2hUWFtlqj5MVEJ1TenBbRAv4sULVvFuI0lhlJyw5UjG5mv4eX8f7v7R8jEYDRdSUB+UcdSG52hFF85kf+w78y4xPHk3Lwk+MD4PU3xqBgHpAnbCTMNP2fhkD7t6kffLPTmxiELRA4C7mW3Gc8DHqKM4hrq72NQvfEOHuSKxE9VG3rTYjs/QCJBAcPcegpaDIXo4dwdbfBuCvkm0x34OSGCQuCqQAQUwCwNUNkNylCI73vihf3w5nmoG+16PwI0gsMC4Jh2nM9NE+C7vxmchTNS20dTxCx4rrKp1lwSZmUCqd03vN6fCKM4AKd1lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ToE45XUa; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ToE45XUa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFSRD3cNqz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 01:11:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0786601DF;
	Mon, 24 Nov 2025 14:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6DAC4CEF1;
	Mon, 24 Nov 2025 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993461;
	bh=9kXuey4j1iyNfngrjmnOHDtQji8gClrywMZaIofSoSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ToE45XUaNEKKgD2WXInctkwlv3+HBQ1TWbbC/9sEmPQZUN1wYevCeBRVBAV0rozFL
	 I7wUvi5bxWcACKzxrEjR9VQMVUyaT8qQ5kFVhrVVlB89kgJUI6qWdrkHnaxN18F/OQ
	 mF0tJs2Sp8oYTUiLgE5alNCnrBVLa6AKCyHt+H//u0eb1VNFNAFg7+La3UkcsIK7YK
	 bQXVkMezHzr95Qf3Ef+lnUif4ZyWCABBRpSmPiFrnUGowf1Rr2Xo8pRrZ38LeAit4M
	 dcuirEqLwFTeqTAFHiWTbkf/ytXN0PIulzMPv+dkinYGeRr/hIAHNbLek15LEi+dsr
	 2rHEM1RGj8ISg==
Message-ID: <ef07b0f4-1f77-4c6b-9c67-8228632b1fec@kernel.org>
Date: Mon, 24 Nov 2025 15:10:49 +0100
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
Subject: Re: [PATCH v5 09/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
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
 <20251124132228.622678-10-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-10-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/24/25 14:22, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need a TIF flag for that purpose -
> let's use the new in_lazy_mmu_mode() helper instead.
> 
> The explicit check for in_interrupt() is no longer necessary either
> as in_lazy_mmu_mode() always returns false in interrupt context.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Nothing jumped at me

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

