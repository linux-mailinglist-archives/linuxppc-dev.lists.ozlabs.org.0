Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F612AAE28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 00:08:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTqYt1nbvzDqhK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 10:08:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=HHy8ULY4; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=xPQeUFys; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTqX85NCZzDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 10:07:20 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604876836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F2GMvMxuw9C07O50HklVxv9DDobdLyUS5hM1A7VEEQM=;
 b=HHy8ULY458RylAle8YXvD/j7zwAqn7icr8I6jVfaHDPCeywD4Uml3UPq0sAKsnNgV+iRZl
 0A4lRPLJ1y5o3yLs0KRQPv40kMD9rGLjz791pa7+jY/tb8L/INs13fGD2gpdzAwXED6UzU
 xGYQHtxBd6T5PGMp7+Cz9DGnbCupFvLBLYH9tMTW1cVOmdF4CbANIrz1r4j7KgdqPGFBUQ
 7yIde0+5JB6jj9udHhahRAz1i7nctrkrIEGSCNrYidNrhXohay4cOyFlnqcWVhUO22NOm+
 BeYhPJj01JaSvLKyX4txkyTgGWbBaOrDXnVd73O7MxdG6wEHUhlCb9QOpQ2fJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604876836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F2GMvMxuw9C07O50HklVxv9DDobdLyUS5hM1A7VEEQM=;
 b=xPQeUFysOSPdEsVnhRBtYJntraTrcRN8CLAfjuKRb4sq3UCCJltDeoN3mgc2l+6OOtJ+Cs
 z4/cjwRW2zY3ilDA==
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v2] irq: Add reference counting to IRQ mappings
In-Reply-To: <4ed56f8d-3fe4-2d5d-6ec4-139efc742cb2@ozlabs.ru>
References: <20201029110141.94304-1-aik@ozlabs.ru>
 <4ed56f8d-3fe4-2d5d-6ec4-139efc742cb2@ozlabs.ru>
Date: Mon, 09 Nov 2020 00:07:15 +0100
Message-ID: <87blg7jvmk.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 06 2020 at 14:06, Alexey Kardashevskiy wrote:
> Hi,
>
> This one seems to be broken in the domain associating part so please 
> ignore it, I'll post v3 soon. Thanks,

When you do that please use a proper subject line:

 [ PATCH vN ] $subsystem: Shortlog

and to find the subsystem string just run git log kernel/irq/irqdomain.c
for hints.

Thanks,

        tglx
