Return-Path: <linuxppc-dev+bounces-16366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIYvGbAuemlq3wEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 16:43:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A55A44E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 16:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1RQ41qqvz2xm3;
	Thu, 29 Jan 2026 02:43:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769615020;
	cv=none; b=GTP4YkhMjiixHJqcb9i7+oYPAq36vNBDccTdSCBiV63IY9lMCWLCWvfFy24Qfb/9o/ObMIzPmo6RMU5budgytpmawSgWDg+TbmuWY59mu7rK459IzEjiS7ga8hw2aqF94yM8udNh0haS7pweF3GmLUBkG+TBGPXu8nAVAkOYe97iOsmTkfCRl1qCOhTIdxqac1gCYwJMNBIkx76Ty9kirVehzL0VWGroDgG67Tkv1MwpelqWTJSeQe/UqPPhMSAdSVHzhn1xJpBJCG0rTLSbAKH9WwOr01nXEun0kKGUcAQA9uj88+qL8iwiTX+USM8KwhcZjdJZdXEOG42lbRZDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769615020; c=relaxed/relaxed;
	bh=Q5ehoPfKCnMrGe3rcMqLU9mGYdKDQYwX3KSGhNVuayM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAiMJ0aS5MG61Y0v+uG7lx/i5eUpWRCLOd5AxNS8dkIRniVkodvFoPAWA8d5e2Ioucz7n5bjjxjD5uS27JkcBnCgFZV8WbRkvES8yp/xRj6lLsTtHa4IJlbCqMfgQ1qVFLSQU5Zx8rIUAEpk/Sal4L3CG8Vod3DCMfUNkdPc2W3b+TrMF++VpgiMFOIQ8o/byGetG7b7Iamq3QxBSs9z6vsIw/FbFDl6lXiTM4d2OKggRCwXgFQp5A4T3SII329DmDG92SKX2co/zeEvB1E3qeXrzmm9G5Z+Ptghj/s44cCcjBNpIA2mooi60EQW7NAB92XJy6e5+lQeA1tW7y9WNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k/feX2du; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k/feX2du;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1RQ319rQz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 02:43:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3150A405E4;
	Wed, 28 Jan 2026 15:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E418AC116C6;
	Wed, 28 Jan 2026 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769615017;
	bh=Ms6JSPLx+R0AGkkQXNUtlIKDAJmwsS9TPgZf+SoweB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k/feX2duw105DXZwD6VCd+YxveRBQQvZwG1gOS/X0ZdFYkzFA6flqG/HNZxbCSfEo
	 9S8zDChgoORh5Zyax+Grj+WTS3kYtPu9i+rikFALF271mQxYnQpc9H9/qdlMYKUfZF
	 AsBZ1QCegWxjyUlNMxdHoA0QkK/ou4etDhoUDKOHIHSLKb0z/7NK3UEWtL6R1o08hs
	 7MG3+rRl/P54CNe8LJHDsqbTyk4VKLMXkVVlsfhwjS2FCEAH8bGgkEjI1Z5sPALKEG
	 yP0jnOXkMTCnXyidLUhJ0LwyZCZCQybgN1qZ1dURyhzo/rGFzVuw/VvYe3wKcGr374
	 q2owya+xV+W4A==
Message-ID: <1fca424a-6215-4303-a0cd-623063945ce6@kernel.org>
Date: Wed, 28 Jan 2026 16:43:32 +0100
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
Subject: Re: [PATCH] powerpc: dts: fsl: Drop unused .dtsi files
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260128140222.1627203-1-robh@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260128140222.1627203-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16366-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:richardcochran@gmail.com,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C8A55A44E8
X-Rspamd-Action: no action



Le 28/01/2026 à 15:02, Rob Herring (Arm) a écrit :
> These files are not included by anything and therefore don't get built or
> tested.
> 
> There's also no upstream driver for the interlaken-lac stuff.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../boot/dts/fsl/interlaken-lac-portals.dtsi  | 156 ------------------
>   arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi |  45 -----

Those two files were added by commit 8c43d2b0ca10 ("powerpc: Add T4 LAC 
device tree binding & defs") together with 
Documentation/devicetree/bindings/powerpc/fsl/interlaken-lac.txt

Should the Documentation file be removed as well ?

Regardless,

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



>   .../boot/dts/fsl/pq3-mpic-message-B.dtsi      |  43 -----
>   .../fsl/qoriq-fman3-0-10g-1-best-effort.dtsi  |  80 ---------
>   4 files changed, 324 deletions(-)
>   delete mode 100644 arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
>   delete mode 100644 arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
>   delete mode 100644 arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
>   delete mode 100644 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
> 

