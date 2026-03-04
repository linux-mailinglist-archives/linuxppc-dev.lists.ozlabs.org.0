Return-Path: <linuxppc-dev+bounces-17708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPMYO0f2p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:07:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B931FD335
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:07:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmyX36r1z3c40;
	Wed, 04 Mar 2026 20:07:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772615236;
	cv=none; b=AN7JjkXWMWrvQBVfHzg1GgMe5M+vfnT+Zy8SyREj6UPxSQZEumh51Gf6sLmZOWWCkbDZfIeBhpVzvQ02i0vcLYEVukKlvUMLa5oAmADsdIxdH7G5LErx8vyvQxKWqSw/rwAqV/ltfSRZNbEOzUNcM3rdIBFdrwY5QRTwccD/IOuU1cGGLj1chZ8VxCHM9cRAQQGMD0mF7y9YBUT64iw2giP/OthXrMageD6lFSydQyT4mUc4eUbnl4t6SwetshOVsS1Mwi62wU5+Qf5ArQW1jAxGzuVAUthSl+IP/AUKLx+Q6e0GKKyphfnWKbf2PQOahmNBs2u4waWkybAoUT+o4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772615236; c=relaxed/relaxed;
	bh=SpP89tt4PiXcT/4IvUtniIHQSdbAeCSJqbhbntj6lzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1QMyvOOwSHnCEd3Ar4Hk5t958iOXzoQhGbyKzm7Dwchsk+x151hkTvXKNHoevdGnUzL3rBcQBQSH/xwrlOnpW/oKUJY8+Twajr4/2kD4gt4J7XB4ZXgBM3UfKxXSlgdHYtoR9NpnrX4xRH+CDDXXxCIo//eD/D5SFAzKoElhAIWTTzLn5p3Xae2AjvmUutTI7kV9YSYt5CktuAhxy72U6cKMwVxDMLPANTsrtN1Wt91KV7To470umWur0s7uu8oH0S7E6F3/LozbvNgLPRcXOqaB0aZOfmdIhC4F6RAMI+C6tNcHNBmOfDigwEB80YjXxEWoRm6HdiarEX25RS1hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KE067Ue8; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KE067Ue8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmyW5QkPz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:07:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4DA0600AD;
	Wed,  4 Mar 2026 09:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8865C2BC87;
	Wed,  4 Mar 2026 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772615233;
	bh=672SBC8u5t8kVDzclxxnrDVmy/LpItQTIInLTSVSKMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KE067Ue8IQa38GsVrb+1Gzf88w1P2fwUwi7EKw1JCf286er+sYOtKcXDSqYfWk0yb
	 h4tjHeqdRrTL7G113O8dNSxk7PC3o7Jy7kejiE7m4cjsemm1CeBoCo66AgqEaVWrSI
	 3uzfSbZ4vMGHJ35K+1uL5xee0KwB+Z2bUA4G/pGC8y0ni9MH7bsJ0zuPFvbAq6ec8P
	 BtQOjiwyYjJfCzXJFTioUfi7DIVzEeouh8srKFMiGlkK5sFWhMFJK/Z5cQq41VNpGe
	 b2g5X2MCH1eZyY1oyCwn+mK+u2BZsCTGgxd8I6okSpcZG2a0cmqMq+9LhD1+OnNJa+
	 tc0D/CbEQJyhg==
Message-ID: <77e64962-7c01-4f1a-8c15-e7a966741833@kernel.org>
Date: Wed, 4 Mar 2026 10:07:10 +0100
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
Subject: Re: [RFC v1 09/10] powerpc: book3s64: Make use of H_RPTI_TYPE_ALL
 macro
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
 <3fb34ebce6a92855ce6c20326c1f7f99097227e3.1772013273.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <3fb34ebce6a92855ce6c20326c1f7f99097227e3.1772013273.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 11B931FD335
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17708-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action



Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
> Instead of opencoding, let's use the pre-defined macro (H_RPTI_TYPE_ALL)
> at the following places.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/mm/book3s64/radix_tlb.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 6ce94eaefc1b..7de5760164a9 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -885,8 +885,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
>   	} else if (type == FLUSH_TYPE_GLOBAL) {
>   		if (!mmu_has_feature(MMU_FTR_GTSE)) {
>   			unsigned long tgt = H_RPTI_TARGET_CMMU;
> -			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> -					     H_RPTI_TYPE_PRT;
> +			unsigned long type = H_RPTI_TYPE_ALL;
>   
>   			if (atomic_read(&mm->context.copros) > 0)
>   				tgt |= H_RPTI_TARGET_NMMU;
> @@ -982,8 +981,7 @@ void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
>   {
>   	if (!mmu_has_feature(MMU_FTR_GTSE)) {
>   		unsigned long tgt = H_RPTI_TARGET_CMMU | H_RPTI_TARGET_NMMU;
> -		unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> -				     H_RPTI_TYPE_PRT;
> +		unsigned long type = H_RPTI_TYPE_ALL;
>   
>   		pseries_rpt_invalidate(0, tgt, type, H_RPTI_PAGE_ALL,
>   				       start, end);
> @@ -1337,8 +1335,7 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
>   			unsigned long tgt, type, pg_sizes;
>   
>   			tgt = H_RPTI_TARGET_CMMU;
> -			type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> -			       H_RPTI_TYPE_PRT;
> +			type = H_RPTI_TYPE_ALL;
>   			pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
>   
>   			if (atomic_read(&mm->context.copros) > 0)


