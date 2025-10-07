Return-Path: <linuxppc-dev+bounces-12685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93EBC032A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 07:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgl2B4jsSz2ywC;
	Tue,  7 Oct 2025 16:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759814690;
	cv=none; b=G0TnHWln8Etzf3B7lfbpVqVm27fgSJ5rGRr/8PElEY8OlmKIg0nWuf3lupwNpKitbYVvKqeixdvR1bcftpT8dxfBbxtJjyedQfpdkSQuwAfQwh59a/2gAl9W0Pgp/kZVl+9Eqc8vSGsK/MF5iHUv7QNR5VF3Oem2YQhi2UmiwvpZZLJqYSetUAJi4g5n51eWz4W9UcwFUN/waIecXRbaOFjs5IaZqF6wesA/oeK4pQClrQ1u2s0keXkt2J6a6mtirTJf7aT4VVVTsiZisfagp3NdJH7C64rzKRDNTfyotQBqIRn3ZnDcCF63Op4v0xnzE0M4bRFmekw1CZ8WPL5DFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759814690; c=relaxed/relaxed;
	bh=UTFzF4P3cvWjOGepCmPTm6ttevU3TMHOVgykIyMXzBY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GUX9MjwwugnIx86ptUBzt+4dP8M3VdZdRm8fYxggxqGgQQuip87ANHd4pkXtY4erbEZ7bXUqFrilBqpy7KNoRj+HAOLVeRMxLKmF9lRN+kb5zjYEhSNGjjj1WbXyqtvcbjKuEalBhffvpG2MO9Y44AhDqUX8PqUktu5ikYD0/uMl0DT8iFERBVQbhPp5QsVVrEli1ebex+EhAjV/AEQxTb35uDDbJ6t4NEoORWfNqQ0yKMgPyf/9dDWFnqfLDDsZiwHIsuxoeE/jjtc/KHBt23WVdyXWktc7zlEny6O2owuna32/ZMdjSXHKnZCqqphoPVePve2p9SMMFKDeG9XYww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=a1jsX9x5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gYIKhcuP; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=a1jsX9x5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gYIKhcuP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgl286m6Jz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 16:24:48 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759814672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UTFzF4P3cvWjOGepCmPTm6ttevU3TMHOVgykIyMXzBY=;
	b=a1jsX9x522XVeyNA/YFM+SOeSUBzwXbAYbGJV5shTkl3aUoWDRwjBkjxP+V/hJ7MNPOqhm
	cDhDiCgTyyEkcrC7rvP8H6i9uv4uEoUEnhCSWy88zO1SrnRyPCDWASu91tZ7KcnbRDHa3L
	vVhni4JU2Dtcl+Gwwe0p85S5FVys2umLXihQiL8QHGAr7kXEI8DFKpvU6o4k1pA7ZVQzJH
	dB7he6Yg/uwUpBvwMx0Q18ezLBtKZEb+LOJ53/iIMTpmzsOfZYiS5BUjhEalkl1Dvj3VfJ
	4CilgYoEsQQQ1AriV+0H1tGCljul56zQ3AH2f3Yq8hap/g5uFPn8BSCyMl6JoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759814672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UTFzF4P3cvWjOGepCmPTm6ttevU3TMHOVgykIyMXzBY=;
	b=gYIKhcuPhN7ALMlVQ9D0AGcxzA34FtUR1OKpbDlFdjbgpGKGrcOoWoR+D+Pv4960K0wncV
	eGcX1WARLQVQw/DQ==
To: Ritesh Harjani <ritesh.list@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Gautam Menghani <gautam@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] powerpc/xive: Untangle xive from child interrupt
 controller drivers
In-Reply-To: <68e48df8.170a0220.4b4b0.217d@mx.google.com>
References: <cover.1754903590.git.namcao@linutronix.de>
 <83968073022a4cc211dcbd0faccd20ec05e58c3e.1754903590.git.namcao@linutronix.de>
 <68e48df8.170a0220.4b4b0.217d@mx.google.com>
Date: Tue, 07 Oct 2025 07:24:27 +0200
Message-ID: <875xcrxp10.fsf@yellow.woof>
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

Hi Ritesh,

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
> I am facing kernel crash on host when trying to run kvm pseries guest on
> powernv host. Looking it a bit more closely, I see that we are missing
> conversion of xxx_irq_handler_data()) to xxx_irq_chip_data() at few other
> places, including in powerpc KVM code. 
[snip]
> Here is the diff which fixed this.. 
[snip]
> ... However grepping for "handler_data" in arch/powerpc I see there is
> atleast one more place where we may still need the fix.. There are few
> more places which grep returned - but I am not sure if they all really need
> the fix. But I guess VAS should be fixed i.e :
>
> arch/powerpc/platforms/powernv/vas.c:   xd = irq_get_handler_data(vinst->virq);
>
> Would you like to submit an official patch for converting these other places too?

Thanks for the report. I didn't expect struct xive_irq_data to be used
in multiple files while making that patch, sorry about that!

Something like your patch should do the job. However, my gut feeling is
that multiple files shouldn't share a single irq struct this way. Let me
stare at it...

Nam

