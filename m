Return-Path: <linuxppc-dev+bounces-11680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC7B42316
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 16:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH4FW5xPBz2xlM;
	Thu,  4 Sep 2025 00:07:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756908479;
	cv=none; b=Pe1JMmYjXNwgNRANB/brRFraA2Lf9Mum+oJLk9/4TCvfuebvSDaVsCgSG0ZJowBAqbTrioWIcmMlJamrcHGzGTGDG5sWC/Kk8aiSSThGVQlw/EhV5ljTYik98gEiGEwGLIsE+7mXTyjEuyBLt2uSLfDqWR0gXBQvbT7yJFIHsxE0LtlJDbWZwdHyjiycZjKpPJJETFXN/urkyw941NoMxyA3ivWiivBcMyu5SeRTvHtdaQVrQ71iRWrnf+AN0OFoEIUW0KoalXL6RojwyW3OfYPKPMYlCqUvWPaSU8X7+zigdAVUA78FVBhE4YRLATNsdKTwak3jzCs9ICfT+sPfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756908479; c=relaxed/relaxed;
	bh=h99L/xUEMcKmLOyCiyNSDjuYt9VsaV2u8XsWO4O1chE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oLF62RuledZKqkZbT+mQJHh8cWEzQ7BENSTui1osxz4bP1f2JuKAF9dVn9gC6oLfC1BlRu21NU0I5pl4cqNLaoZWW5+A3cVk4rEcDwVb7apXROIYd2migOWvKFqpebl6og89ARkK7S9nuLFjC6XUkqSl6Mc/zVPcOJuqkragQEZRImKdy453m781l92ss7271PrC2wEocoZ9LHzi8mAKwEm3Bp4L2aNuOcPRitsXdnQyUNtUrws81baBy1uvrHAb3kLxkiHGC4ZIWH42+SF56T320ost671W6Nkhpfu5DfjdgxkWlZJoH+Fte4357gdglaACrGhPR1VAyYTmWE3olw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L6y6BXTX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hYnhtyJa; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L6y6BXTX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hYnhtyJa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH4FV1Vpbz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 00:07:58 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756908466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h99L/xUEMcKmLOyCiyNSDjuYt9VsaV2u8XsWO4O1chE=;
	b=L6y6BXTXt1GRUMgEfwZ4Rp+TOpn/kQyrz+HLBosMz3RKEXpVMMJ/IHf5J83kb9nBcCL56K
	8GlvsFTLpMKiw/ylzl26Qf+7pgjz4AUYlYv/xdMKHK0pcqsEv2NfptWjIRqINkLXb7+xXx
	jHeJ+3i4IXPwJVMl+DpeBxv+9zLcP+E4uib3ALcAyWyQHIHzPeJGjEycHM8wdIHjaj1W5v
	qSViy2u6XyKWEhc/Qb5Tj7cblJEsFst4g07QJXlp2LMGaWVaj5Y4NMPRFBZGUfT+E0x1t/
	Cl9LNQxV40M0vjnsBFMd3imurZJ1Ryahz618O8KSkcSxR6vlYCnP45r8ehUkZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756908466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h99L/xUEMcKmLOyCiyNSDjuYt9VsaV2u8XsWO4O1chE=;
	b=hYnhtyJamT7hva8b+XslxMzQ/xmvCo9csd0Por7h4e2LQ5X6wa/HMcuTvhJIO6+tJHiFxU
	4xnkJGlAjwoUwsBA==
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Marc Zyngier <maz@kernel.org>, Gautam
 Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH v2 0/3] powerpc: Cleanup and convert to MSI parent domain
In-Reply-To: <cover.1754903590.git.namcao@linutronix.de>
References: <cover.1754903590.git.namcao@linutronix.de>
Date: Wed, 03 Sep 2025 16:07:44 +0200
Message-ID: <87y0qvy6hb.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 11 2025 at 11:28, Nam Cao wrote:

> The initial implementation of PCI/MSI interrupt domains in the hierarchical
> interrupt domain model used a shortcut by providing a global PCI/MSI
> domain.
>
> This works because the PCI/MSI[X] hardware is standardized and uniform, but
> it violates the basic design principle of hierarchical interrupt domains:
> Each hardware block involved in the interrupt delivery chain should have a
> separate interrupt domain.
>
> For PCI/MSI[X], the interrupt controller is per PCI device and not a global
> made-up entity.
>
> Unsurprisingly, the shortcut turned out to have downsides as it does not
> allow dynamic allocation of interrupt vectors after initialization and it
> prevents supporting IMS on PCI. For further details, see:
>
> https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/
>
> The solution is implementing per device MSI domains, this means the
> entities which provide global PCI/MSI domain so far have to implement MSI
> parent domain functionality instead.
>
> This series:
>
>    - Untangle XIVE driver from Powernv and Pseries drivers
>
>    - Convert the Powernv and Pseries drivers to implement MSI parent domain
>      functionality

Polite reminder to the PPC folks. Can we please get this moving so we
can finally cleanup the pci_msi_create_irq_domain() leftovers?

Thanks,

        tglx

