Return-Path: <linuxppc-dev+bounces-10078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D0AF7E1A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 18:43:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bY2cx2zpbz2yPd;
	Fri,  4 Jul 2025 02:42:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751560976;
	cv=none; b=O2zbKdvpzf4K93mwdnVDfedaVl0x63UE0ukVRcerCI4b3WJb6n9cz+vNXQAxS0FmoyXTHr9zx4XhA4EJ12Osl3jcheXVeE+PwsZk26N+C5qcW+ZrjZvIaak2lw1mAaBbQv+uorLT3fpFjNUM6sEdsCYm0LhsvcK3F7ua2NPOd0uh+825zLoaEYWUU1TIppjs4jyOccSJY8SCHMJJuuURTc49TysaaXLLjT/DuBRD0+wrFzE0loEbETP7EgduK1ymr/jHlxnCRzklZJNS8W5KEXkHjwzaoBB0qIgIafDoBe5HmfuqBXX6t/zIfshuBt8M16rnNDl9U8/ndyVlvGJo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751560976; c=relaxed/relaxed;
	bh=vNJeWSeRcHeJYp56ea0icbMw4D9OJYF8Ft586dydoJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RlLvMA3g6BqzRylbgwfgvL1OKxSiCg/cudSm8HHjHgsdNc+1I8I84pI9AxpPsb2M3gWGVwIA4lcUTSjefmuOfKdQmhqqV5mnPBk0UC00p5gSESoNL11xeNwoJRXn759vxRV5JbapIg5fwEt1q9goRn3y3qWMDg41Jl0siEGkCAYUpXkxN1aQ6bw/IgOFaIOTPAMxPrutdsjaAYC/jMTFA2E2MxLSKK1u6in/P4PL0hwnjd0Sq76CkQQ5zfeeLJDdC5DVKA+fFexKrAUTbbRjwJ9lL94CMvyopjzyOk4vuXpKdde8Z3txDBnudjheETc7yKPH01XsoMalz73Q2z5GaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jTJhALoz; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sZAPoNN+; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jTJhALoz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sZAPoNN+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 322 seconds by postgrey-1.37 at boromir; Fri, 04 Jul 2025 02:42:53 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bY2cs0YNrz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 02:42:52 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751560640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNJeWSeRcHeJYp56ea0icbMw4D9OJYF8Ft586dydoJE=;
	b=jTJhALozm1XSZmVKfGIYmaK+SkyCaAt2Om3QT/cEPLVbMBjvna3p9xaQHEBf4d5bSIlARr
	PNsZVISnaP3GA4KHOQJSqcZYBeFiegi6MAsiwMHrf1gUbOcsAmnUrWA3zsOlTVoSAW5qOM
	MpsbVQ1gBDbs9LmAOwbWeKo+KU54GzwPsomVjgKshq9sfLzC/eF8Cl/bgwlNxdyDod26Dg
	i6IMs4anElx0GWHeUVpNSbA5eQNent7afauN3ucsuGKdBgwVMxZ5JjlFGhCMmcD7FuJOKp
	uI22IfhrwBkj+oafUjL1PGQxdSgABLt4S8s67rc0pCR931bFL2XCaxalRcD3Ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751560640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNJeWSeRcHeJYp56ea0icbMw4D9OJYF8Ft586dydoJE=;
	b=sZAPoNN+HzM27I6PWIqMYVMZiFPSh/b9hFaed8OPF4y/bXdM+aW8i8kUCi6AEZilOvCEiQ
	c26ZKjLOJQCddZDw==
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
In-Reply-To: <cover.1750861319.git.namcao@linutronix.de>
References: <cover.1750861319.git.namcao@linutronix.de>
Date: Thu, 03 Jul 2025 18:37:19 +0200
Message-ID: <87sejdtem8.ffs@tglx>
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

On Thu, Jun 26 2025 at 16:47, Nam Cao wrote:
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
>
> Nam Cao (3):
>   powerpc/xive: Untangle xive from child interrupt controller drivers
>   powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
>   powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

Gentle reminder @PPC people.

Thanks,

        tglx

