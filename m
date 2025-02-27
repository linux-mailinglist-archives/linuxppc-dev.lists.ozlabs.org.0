Return-Path: <linuxppc-dev+bounces-6538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90FA4821C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 15:54:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3ZBJ49hMz3bpx;
	Fri, 28 Feb 2025 01:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740668088;
	cv=none; b=oACGUiRvZZGYSayo0EYok3QO0WdO7uRYQgMsdyBRI2ziYzPlZFj+ZYyYdUnOP9t540P9Sm3viBIgbomCtFHKaiVjdtWD4HaL5/xjLdqQQfrAZuu4nTdj9spf16ID+BNAnG9v3rt/mxHvIOY1XXJsHRB7lBNOGNDxlFgKkS9y6Y5CY69/rYO/aXgnFbnLJqLZZE42wNHKoPgWaYL8uqL6xJdTnPt7Lue/E7dMWeDgd9nPYNP0G6HEkcy94YWmrssFdSgn/vKcIYNMOhIeJUrx6QBmioMRKSc4vWGb7nhEnWPKzRRAY2wr+PV8vKemNfTwgEdLVtndatXPneBlNV08Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740668088; c=relaxed/relaxed;
	bh=ZM5dlKYbDvyyaA2EiYr1emsVmfFgrat0vaSkF0RS2y4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaOoWGuosXzUKxO+M/5pdI4/9Y/0rjpUON79rCWIrNXA9YTpbYM/7khZ6OIaOH6DILaCUvlhiE+XQCfqJWfa/9ZGXIP8lMCOqBOyMsj0g+N6sZmctRTE/rolYl3P0Eq41sNQxE533L1DBEm17Xb+84gWTApeEN28flT6jMfetwog/2aKi7rbrZrek1f7XjJMg2r+W69SseEmCO98kjcBvJQKho2SS7nNWNclwn4B071/728tB2Qq6+HWpJRWhw5BWpNvHTNL5UJk5nm/pOwnFNPKfxoDSZfl2T1zb1YtHteCycJZrB6UVyyl/5Q+1iiU7rxr7pPp+MWSSy4S0I0ZZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=qhMgdX1G; dkim-atps=neutral; spf=pass (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=qhMgdX1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3ZBG6XRwz3bpJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 01:54:46 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z3ZB93Q6pz9shm;
	Thu, 27 Feb 2025 15:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740668081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZM5dlKYbDvyyaA2EiYr1emsVmfFgrat0vaSkF0RS2y4=;
	b=qhMgdX1GedduGc8u0LlSsQIu1Pcw20kMiB8ybcxpi5eELtyM1qsIrCeB0luJmfc0oTll5U
	smkAclrDq8ACgewP+ruVm6HY4dviNQdtLnsRVUoC/lc1R4sIPJbYn2lffHgF/UivA53Dxz
	zqi0EhLii9P8jJqRghz55PB6yLYgUy0Vz0xe5/NeBWybRs5YndKRdo3ziMrFgnxkB8T3xN
	CCs4y8VNXm2wTktaI3edk1DB8YA4POctdqKC5EAAC6UOReZIqBAEO7WxAeg8eTHomogdoi
	zGcNu0XSVB7qVh7xWHpm/tw+z85elW+qYR5y7bt8HPOlgRgNs3GLphRjFYydHw==
Date: Thu, 27 Feb 2025 15:54:38 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0 on
 G5/G4 (kernel 6.13-rc3)
Message-ID: <20250227155438.1b7d372f@yea>
In-Reply-To: <7f795152-9d03-4f89-bfb6-125eb6e33873@linux.ibm.com>
References: <20241219000749.6836d610@yea>
	<87jzbqpnd9.fsf@mpe.ellerman.id.au>
	<20250226231418.1df533c6@yea>
	<7f795152-9d03-4f89-bfb6-125eb6e33873@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: r6bh8rnuyn4yc4fk6t7mpzhr4q4euiyc
X-MBO-RS-ID: a644a12a09a38255ad2
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URI_HEX autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 27 Feb 2025 09:00:06 +0530
Madhavan Srinivasan <maddy@linux.ibm.com> wrote:

> On 2/27/25 3:44 AM, Erhard Furtner wrote:
> > On Mon, 23 Dec 2024 23:58:26 +1100
> > Michael Ellerman <mpe@ellerman.id.au> wrote:
> >   
> >> Erhard Furtner <erhard_f@mailbox.org> writes:  
> >>> Greetings!
> >>>
> >>> I am aware there is commit cf89c9434af122f28a3552e6f9cc5158c33ce50a
> >>> (already merged in v6.13-rc3) which fixes some of the "Missing
> >>> '#size-cells' errors" but there is more:
> >>>
> >>> ------------[ cut here ]------------
> >>> hub 3-0:1.0: USB hub found
> >>> Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0    
> >>
> >> Something like below might fix it.
> >>
> >> cheers
> >>
> >>
> >> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> >> index 8e776ba39497..462ee36ef891 100644
> >> --- a/arch/powerpc/kernel/prom_init.c
> >> +++ b/arch/powerpc/kernel/prom_init.c
> >> @@ -2898,11 +2898,11 @@ static void __init fixup_device_tree_pmac(void)
> >>  	char type[8];
> >>  	phandle node;
> >>  
> >> -	// Some pmacs are missing #size-cells on escc nodes
> >> +	// Some pmacs are missing #size-cells on escc & i2s nodes
> >>  	for (node = 0; prom_next_node(&node); ) {
> >>  		type[0] = '\0';
> >>  		prom_getprop(node, "device_type", type, sizeof(type));
> >> -		if (prom_strcmp(type, "escc"))
> >> +		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
> >>  			continue;
> >>  
> >>  		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
> >>  
> > 
> > The fix works on my PowerMac G4 DP. And there is also https://patchwork.ozlabs.org/project/linuxppc-dev/patch/875xmizl6a.fsf@igel.home/ which seems to be the same patch.
> >   
> Sorry, missed it. I will add the above patch to -next.
> 
> Maddy

No problem, that can happen. Thanks!

It'll have to go in for v6.13 too. v6.12 was not affected.

Regards,
Erhard

