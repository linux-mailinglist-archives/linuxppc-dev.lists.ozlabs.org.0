Return-Path: <linuxppc-dev+bounces-17625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ExRErY3p2lwfwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:34:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24D1F611E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:34:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQQwJ2zggz3bt7;
	Wed, 04 Mar 2026 06:34:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772566448;
	cv=none; b=Byhx7IJaJndHvM2QMrpCclewztuB2abY3RAXHMDEQcjV2dGQwdtAWANXrDXOiJfQHzV9ZT3jQQyzfbyYKDMH+hpVKeoS1733ufaFEpCH0G3F5rMDX8X5No2yFovMpHnY87Mo1dt2NplSOf61pwvIvIyyrsiGWCpX9Cix9LoYY7lavD/uI2DUr//af2iKUiVAY+FyU0bDdWGwKvhHfOGbSxJwNaqTTOAeaiapqwcGB1dXTwMn6skv9JBoOgXNcV7E967kXOoVHs22+V4XpM6gK2Z893oScqaRW9N+fpj4Fu10leLIVo9+3IlDKj5qnXxF7YuHwtuhnf3j4F7XNwISqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772566448; c=relaxed/relaxed;
	bh=ZXpIcz4Ycaeog6Y3ZoTrJJGRYAKKygpMh3gLHuWoTMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arT+MD+fIO6vudUADcWvtSo40t5HWcJDUdRXbODD7Gjox2kYyg/p4khmUaBq7fK5Ow68sLqwSYDCBx2tzDKZiuodkTYJzxHfLUqNR8wngDMmsASu1DJIyhFiBLdVcoT6T3vJ3muNkzq3W1Rt4xEcF1Ic/9hRR2ED/dKZWx3DE+pfCO+1v7dW3KiHb87QlawwiTj8Vp0QJ8/79L/j5QbCpczu5eFfT1J8l5dFCfnuYOc48zQzJAbRVs+l8PAO0tikEcbtSEB5mCevSo2Q/lRxM1LnMk51KyJ6RtUo7K3QxXhyVpQ/g/MhZ42JZGUfxOk+k+KcbnsFd9apNvG8btZtNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gC6G77/o; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gC6G77/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQQwH3ZmTz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:34:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4758A442D5;
	Tue,  3 Mar 2026 19:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD30C116C6;
	Tue,  3 Mar 2026 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772566445;
	bh=XNSxifEFf2irY46BpjtXhqwA8XGnDUzWVeM5fRdCTb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gC6G77/oeW8p4NXlyLn6UCy3gtHjA8Nj0dRRH2/liP8nHLq7QF9QUxaq98huKTstn
	 BGT3L1538Sdjm2VWaDskM6pl8gVfB2NoPmla+XHodrHSJimM4Rmi/itXdXwQbdNb3o
	 UWogD5C53UWVbwn0fiPe8uD6URMB95qolyuejUFr8NQB5y56SOSOy4Z/NKoFED+q2N
	 BPHaySs3Pn0x0/LYgaLCjAQU8Qsl7RpwFbZ21LKOIN/8CR7tdx/A7RfbKEe++yFMpy
	 LZZtlzYJGiUosgcklcUVVUv9gBD0S7XuasZxrAQG/f/nvKGB93MEEeNA5/Bc5SQ3PI
	 u552hl557d62w==
Message-ID: <0b06d473-4116-472f-8908-4f36d204b2e2@kernel.org>
Date: Tue, 3 Mar 2026 20:34:01 +0100
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
Subject: Re: [PATCH 1/2] KVM: PPC: e500: Fix build error due to using
 kmalloc_obj() with wrong type
To: Sean Christopherson <seanjc@google.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
References: <20260303190339.974325-1-seanjc@google.com>
 <20260303190339.974325-2-seanjc@google.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260303190339.974325-2-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 4B24D1F611E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17625-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action



Le 03/03/2026 à 20:03, Sean Christopherson a écrit :
> Fix a build error in kvmppc_e500_tlb_init() that was introduced by the
> conversion to use kzalloc_objs(), as KVM confusingly uses the size of the
> structure that is one and only field in tlbe_priv:
> 
>    arch/powerpc/kvm/e500_mmu.c:923:33: error: assignment to 'struct tlbe_priv *'
>      from incompatible pointer type 'struct tlbe_ref *' [-Wincompatible-pointer-types]
>    923 |         vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
>        |                                 ^
> 
> KVM has been flawed since commit 0164c0f0c404 ("KVM: PPC: e500: clear up
> confusion between host and guest entries"), but the issue went unnoticed
> until kmalloc_obj() came along and enforced types, as "struct tlbe_priv"
> was just a wrapper of "struct tlbe_ref" (why on earth the two ever existed
> separately...).
> 
> Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
> Cc: Kees Cook <kees@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/kvm/e500_mmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
> index 48580c85f23b..75ed1496ead5 100644
> --- a/arch/powerpc/kvm/e500_mmu.c
> +++ b/arch/powerpc/kvm/e500_mmu.c
> @@ -920,12 +920,12 @@ int kvmppc_e500_tlb_init(struct kvmppc_vcpu_e500 *vcpu_e500)
>   	vcpu_e500->gtlb_offset[0] = 0;
>   	vcpu_e500->gtlb_offset[1] = KVM_E500_TLB0_SIZE;
>   
> -	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
> +	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_priv,
>   					       vcpu_e500->gtlb_params[0].entries);
>   	if (!vcpu_e500->gtlb_priv[0])
>   		goto free_vcpu;
>   
> -	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
> +	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_priv,
>   					       vcpu_e500->gtlb_params[1].entries);
>   	if (!vcpu_e500->gtlb_priv[1])
>   		goto free_vcpu;


