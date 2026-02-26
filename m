Return-Path: <linuxppc-dev+bounces-17265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBO+OHg1oGkqgwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:58:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ADF1A578D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:58:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM9384Psbz2yFd;
	Thu, 26 Feb 2026 22:58:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772107124;
	cv=none; b=XNUSf3VGdyzkEKO/RkZnkX9Jo4C2JKSAofTvhzIFSXz08NkeJg8lw/sFzRo+74zrWU0arMhW5qWl2DiPE6E+SVCz95fhLiWQD4jWzr9wYtgbfLbyJtMwpikWPXujVMKC3xxa90iNApI5AcdlnrIk/Yc+4r0uzCKDsQt1Ctw17vFqwncPlpf/cQcEvHPAodBxv/56/zbquvGjhu1+FhUjxPA07YIxCoBldTnRDqVvCKs9uG3gvD9bn/MqU5D8pXrW9oRFF879RBne7J7bwv9FNC7ljRIYKJg4wNzV2NPBCkz/iieCZ92DJyOnjY/a8biT9jOn29Gl2BHuQStCLipMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772107124; c=relaxed/relaxed;
	bh=98cEuXzv6JmWerhZ4Ql2zIBcKKlVeYDERJ94sOoOLrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaXNTwO+9lmKQNbkdNsbVHRFmRjHkFwODunNSBUn1CrPilw53Y1AQYvT+kxaURTwb4tQzjLKuq2arC58mcchvGSBJUsqFEsUf0DL0XtAohQd/P4U7jSlJRMVff/znuiDZMR+WOow4xylmJzzA82GdNVATLj9bCwZzdNawNkApRuFrJh32jIw3TEmIAhyxxy5Ylm2ARaJGjgZDa41wtUIY3hUYDgnb4gNpCPbAtLSGV7XAEGLVIbwuIMF0LfCJ4F+L8oSSW4abzXluR4LNAWUTpzmMA5rdUtcVbChPu+4N0StAvoECVSzsb0Bbh4HxjV1Q3/ZMul7yOdATib+GAyCbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pP7hCifO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pP7hCifO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM9372ZNmz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:58:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 775C740A57;
	Thu, 26 Feb 2026 11:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A1AC116C6;
	Thu, 26 Feb 2026 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772107120;
	bh=zn8yKuJ1zDmtWRCrKCoPb1OsScnauxoVHbFHn7DDEm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pP7hCifOX9x8ofBjLulBWxKJCXG6wJbDS1ujNDKzqoveYUj9/c+bYMnrU7ovjsCrr
	 jVAn1/5BSX93/4+JbE1kkKu/i2IDyM5G/Q+vofNkCI1l9cAl57c0ecEKF2tgqo8OAm
	 /MN12XtE5X8sYn3e686f6DZrxrq3BAO5G2p9SC0BOd84OHikFAwD82OZcNe+SOOm+F
	 V9HyHqTjzs+WbCjvvhq9RPIeurYRM2mSZ3aJon0tO5Vm4FUVvOxksTxMmnU4h42LWD
	 tlKQph/8UA62XiSUurtPMcw48IZTZlv+kYXpefgIZCqiVtZHStR7dq3ivIk4AccKNz
	 raTmd8OHuigRA==
Message-ID: <c4a9ba45-24d5-474f-968f-a9dde81d3303@kernel.org>
Date: Thu, 26 Feb 2026 12:58:37 +0100
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
Subject: Re: [PATCH] powerpc/ps3: fix ps3.h kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20260222060101.2086504-1-rdunlap@infradead.org>
 <4e84b9ea-9e7b-420a-bca9-6febd87a80cb@kernel.org>
 <17c0c331-276b-4f43-890e-39fb3010103c@infradead.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <17c0c331-276b-4f43-890e-39fb3010103c@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:geoff@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17265-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ozlabs.org:url]
X-Rspamd-Queue-Id: 62ADF1A578D
X-Rspamd-Action: no action



Le 26/02/2026 à 02:45, Randy Dunlap a écrit :
> 
> 
> On 2/24/26 10:57 PM, Christophe Leroy (CS GROUP) wrote:
>> Hi Randy,
>>
>> Le 22/02/2026 à 07:01, Randy Dunlap a écrit :
>>> Eliminate all kernel-doc warnings in ps3.h:
>>> - add one missing struct member description
>>> - add one missing function short description
>>> - correct one enum name typo
>>> - change several incomplete kernel-doc comments to plain "/*" comments
>>>
>>> Examples:
>>>
>>> Warning: arch/powerpc/include/asm/ps3.h:96 struct member 'dev' not
>>>    described in 'ps3_dma_region'
>>> Warning: arch/powerpc/include/asm/ps3.h:408 missing initial short
>>>    description on line: * ps3_system_bus_set_drvdata -
>>> Warning: arch/powerpc/include/asm/ps3.h:473 Enum value
>>>    'PS3_LPM_TB_TYPE_INTERNAL' not described in enum 'ps3_lpm_tb_type'
>>> Warning: arch/powerpc/include/asm/ps3.h:473 Excess enum value
>>>    '@PS3_LPM_RIGHTS_USE_TB' description in 'ps3_lpm_tb_type'
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>
>> You sent a V2 with the same subject some time ago, see https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev%2Fpatch%2F20251129183636.1893634-1-rdunlap%40infradead.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C5f40eabfbf95474b6c4608de74d8ad0e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639076671142017726%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Bk2srZQMhhrA6rpHEFx2CIxSee8%2FUM2TIrNQSFpP8%2B4%3D&reserved=0
>>
>> Is this patch something else, does it superseeds V2, or is it a wrong resend of V1 ?
> 
> Yup, it's a wrong resend of v1. It means that my patch tracking system
> failed me. Sorry about that.
> 

Ok so I reject that one.

Here is the list of patches from you we have in the pipe:

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=18663

Christophe

