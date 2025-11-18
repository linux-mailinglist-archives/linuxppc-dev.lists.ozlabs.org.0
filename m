Return-Path: <linuxppc-dev+bounces-14304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC094C69F6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 15:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9n7T3yR2z2yvH;
	Wed, 19 Nov 2025 01:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763476181;
	cv=none; b=l1YQSqgTa05DNZlzugV3Dva2qMjeKLWA8tZPScppowOuxF7l7gUGK6ReGbfvNhaLsTWYA6UFCkIP0Or5oslhjcmnBeU3qmmdD7muXCs7EHFlev/JbNAmsK1lRxcySd6gnnh9Wp9ZU5G/WBSDnY/turmst8Qs2kGYBys3hwTif1YUmuFOCLMYnGhtNJmOS+vMeh7AOymblVwMgjsFCUGkrGzZ4Tm7o/Twr1nX7ILR83SVmjjQgnggKyK+YeikvOuUpibtbBBOtzU1vrFAQ4hRs2VcudkAYqmL9Adb82tgpmabU++SGn/O3QqYrURiVt9MpWuZn4qMr6wbo+DRbpRLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763476181; c=relaxed/relaxed;
	bh=0n9UnbJWA0qi+JmKy/6pHK84BHEidvZ9wIicmRWTn88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=exFpaNQmGZx1tNImB2SSPju/jafoVaWeXI5VeUnvdv7XgqG7WPBZ6XAXRxvRaSslQwLedLOISjQTn7HxS+XzJfKBov6UridxZI/jWCyaQfDv1yx26DaZbrkPrngpKtNA8pqBQcHOR6IoRJIT6AK7PfdEfz1BUtz62bOpv9QXUIk3Y+7krxTw6GWW2IKZyxxG9LIRk4bDJQlJUB7GQbDcfi9QgKUWtGdERR91WUoixmRxmdfWYiyxvcLm42LgM+W/fvcMthS/jXJwT3CdizoYoY7pOvwUW38/KPO6kugngwNTDnO3viEntysFQZXCq3FXG7TEXEWOkvLY+Y1YmFH94g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UEKPZFD8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h/sRwr7x; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UEKPZFD8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h/sRwr7x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9n7S09ctz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 01:29:39 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763476171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0n9UnbJWA0qi+JmKy/6pHK84BHEidvZ9wIicmRWTn88=;
	b=UEKPZFD8IIH9dBvKhwzK+fXlmTby97FDKBDH31b76QtLz4uD0gbhWa+W7SG6f2imgKHsWF
	nu7N2cXnD+OCXTKolN3SzKUxx0O8+YMYrf0DJRqkmvAsYU7YQt4xMRIRn31eSNTDdyUdTG
	IT2upU2s7XedV+LOJih1/IaYmQwaNjbWORnGZX5SwX7NuvSC4KD3ikvjJIvhOM46GhQd01
	52oJbqmp9xU9wMBK5pfo+VUj795hv5/+DoNV18rIIGuY7Np5J8ffKQgUsoL/5nUfJg3+NS
	VL74Yn4la+CYnL9s6qvPYaEX2wHWgAZZrqm1x678CcgHB2dDbTcn5wYaPqQxpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763476171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0n9UnbJWA0qi+JmKy/6pHK84BHEidvZ9wIicmRWTn88=;
	b=h/sRwr7xzeJWCEHSEV2dmP1lyM8HmabFe+SrA74S6/B5KUksS4LoIrxmGid+rFGCLsbVgL
	qsdlJxY2x7xXHyBw==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Eric
 Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nichlas
 Piggin <npiggin@gmail.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 0/4] uaccess: Prepare for masked user access on powerpc
In-Reply-To: <cover.1763396724.git.christophe.leroy@csgroup.eu>
References: <cover.1763396724.git.christophe.leroy@csgroup.eu>
Date: Tue, 18 Nov 2025 15:29:29 +0100
Message-ID: <87y0o35s8m.ffs@tglx>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 17 2025 at 17:43, Christophe Leroy wrote:
> This is v5 of the series "powerpc: Implement masked user access". This
> version only includes the preparatory patches to enable merging of
> powerpc architecture patches that depend on them on next cycle.
>
> It applies on top of commit 6ec821f050e2 (tag: core-scoped-uaccess)
> from tip tree.
>
> Thomas, Peter, could you please take those preparatory patches
> in tip tree for v6.19, then Maddy will take powerpc patches
> into powerpc-next for v6.20.

I've applied them to tip core/uaccess, which contains only the uaccess
related bits. That branch is immutable and could be consumed by PPC if
required.

Thanks,

        tglx

