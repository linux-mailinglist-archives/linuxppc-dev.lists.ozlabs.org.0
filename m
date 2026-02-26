Return-Path: <linuxppc-dev+bounces-17218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMVqA6+ln2mHdAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 02:45:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DE19FE98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 02:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLvRG43Blz2yFb;
	Thu, 26 Feb 2026 12:45:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772070314;
	cv=none; b=bz+yub+sSLxH7pP4XvjJkZYpO2NPPDTYBrOubqd4s/9omG6EOIvEGGgvO5uFV9iSGOP0LgyGBVnW5FYB1P1DH/zEMgtqAnYbRv2e3rQhx8Q6NQU90gJoLtjcM9JGZ6xv5Fc/iOISa5GpOP3XZLn7RvYZuMTAiKf+rEwWIfBT+KEMUgmOSitVTKbBngKFogJvUjzzUhEe7YcOAYZPsR4CL2+ON9FqMG7H++EoYuHVgWG043Kw7KG9gmryJeFrZz7IMn40diLmUJ5fFutlfN6MtAqhtzT0scvWMj7kJq09Ucd66TrUtuSBGO+xPDKTA1S0o/PUuwqzXCqCyDsI9eEFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772070314; c=relaxed/relaxed;
	bh=2KLFSpe/y6PBK2utudpiIr0PIzy9MAZDLPGOa1YtlsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTx8OipGo4pkgzc+5gOEovSI2Htkg/6Krv/YtiY2jOXpDez+mvHnZBnJA0qymYAGt/iuKbp92itj4INX8JHk/HR9wFs0bMj7GFkp1ha678wu6kGQFiR8XmxZfQFgn1PsLI726FV+BoLyI9ew1lhdoWdcGtGsudQ/3DdFjMuy/9Ks2iTps3anZeV2i7CdqW9dX4A3qtyJBOs2sP/TuxrjaHKs7H0x2yQi1UVhplY+BUp+W93RvgHQJpSXSBMiSe50ivbYdl+flkFOmTVMIf62VFzK84tl5noP8E9YkvT4GArHAvexeeNCqdZpxedqV1ICQg5qNb0dImaUs80FrlPrtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XesDZs3s; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XesDZs3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLvRD3zQWz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 12:45:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2KLFSpe/y6PBK2utudpiIr0PIzy9MAZDLPGOa1YtlsY=; b=XesDZs3s/vFUSEaG45tkq6htUZ
	NJxH6F2qYowi6RtzeQQ3dtaB3ZeeDPR4ubDUMvmpH2ydYlmDsxRZ5Z4YvHDajuiqRpncZFJqAJhPm
	/gIhyt15cpKMDEeeiF5A/+VA5w4wHe+kNK6ZjDomj9gaasy0dnuG8ET1jbV6wwuUn3XmRDHkVxNes
	6cwyc4sLgFIrxr85apUI8ECSCO1HEK/UtQVUNrp73IO/Won5hrtxzMZtaO3RcKLC3LVCyq2B4vHeC
	zjAMpR6Os2COBQUc3OO9FiNNoqB6wzgNsg02JnEQPtoGXZ3Chi8yKoU69EX9CZfnQdX4lq21VOakp
	PNwin7Hg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQR5-00000005Cbx-3sNs;
	Thu, 26 Feb 2026 01:45:05 +0000
Message-ID: <17c0c331-276b-4f43-890e-39fb3010103c@infradead.org>
Date: Wed, 25 Feb 2026 17:45:03 -0800
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
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20260222060101.2086504-1-rdunlap@infradead.org>
 <4e84b9ea-9e7b-420a-bca9-6febd87a80cb@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4e84b9ea-9e7b-420a-bca9-6febd87a80cb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:geoff@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17218-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,infradead.org:email]
X-Rspamd-Queue-Id: A19DE19FE98
X-Rspamd-Action: no action



On 2/24/26 10:57 PM, Christophe Leroy (CS GROUP) wrote:
> Hi Randy,
> 
> Le 22/02/2026 à 07:01, Randy Dunlap a écrit :
>> Eliminate all kernel-doc warnings in ps3.h:
>> - add one missing struct member description
>> - add one missing function short description
>> - correct one enum name typo
>> - change several incomplete kernel-doc comments to plain "/*" comments
>>
>> Examples:
>>
>> Warning: arch/powerpc/include/asm/ps3.h:96 struct member 'dev' not
>>   described in 'ps3_dma_region'
>> Warning: arch/powerpc/include/asm/ps3.h:408 missing initial short
>>   description on line: * ps3_system_bus_set_drvdata -
>> Warning: arch/powerpc/include/asm/ps3.h:473 Enum value
>>   'PS3_LPM_TB_TYPE_INTERNAL' not described in enum 'ps3_lpm_tb_type'
>> Warning: arch/powerpc/include/asm/ps3.h:473 Excess enum value
>>   '@PS3_LPM_RIGHTS_USE_TB' description in 'ps3_lpm_tb_type'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> You sent a V2 with the same subject some time ago, see https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20251129183636.1893634-1-rdunlap@infradead.org/
> 
> Is this patch something else, does it superseeds V2, or is it a wrong resend of V1 ?

Yup, it's a wrong resend of v1. It means that my patch tracking system
failed me. Sorry about that.

-- 
~Randy


