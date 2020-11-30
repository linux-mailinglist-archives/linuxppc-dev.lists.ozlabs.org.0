Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C002C9025
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 22:43:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClJcj2vvqzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 08:43:01 +1100 (AEDT)
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
 header.s=2020 header.b=flvGJ0pX; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=1fSliX71; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClJZx65g6zDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 08:41:29 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606772483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NgAh9VYwDOpjvKBpD2kOK9tCCluKx8G046lvyTTuLAM=;
 b=flvGJ0pXm8+KoywzWh7TI7hPa+f4S8bNnctn1hTerxfblVkBvWtRmRzFNNnl1uYEtTMDWo
 BuDjZHkzhZgd8BRQ0Bga1Iskh5D+8Lmp/HSqtifCMCC9/Qi0mCjBhcqbV9zhiFZ0liDp3x
 BWh1TiP8AZgth915d7oNFSy0NLQabOvU2wVh8ZGg6i7tAccHC7PJiumKbQB6nlHCaWV+RC
 6sN9e2/MIzIZFprcTm/MGYaSqKQJYnhEk2Imc58ZIXS85u08a9rZ2ICEqadK4zuCmA+iQ2
 s5FsCttc46/wlZnNc/E4z6svCCRjJJLS0CfosU4U3hm++PkKrT05dSDeNGNsBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606772483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NgAh9VYwDOpjvKBpD2kOK9tCCluKx8G046lvyTTuLAM=;
 b=1fSliX71lIiev+tFc4Vm9I65X+STSs/VhekX/6qU2C94l/LibCpwQml9cMFLGz5A8OkzIe
 8lcnZgcqy03lmJBA==
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ
 allocation
In-Reply-To: <20201124061720.86766-3-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-3-aik@ozlabs.ru>
Date: Mon, 30 Nov 2020 22:41:22 +0100
Message-ID: <87blfeiku5.fsf@nanos.tec.linutronix.de>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, linux-gpio@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey,

On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
> There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
> passes realloc==true. There is no obvious reason for handling this
> specific case in the generic code.

There is also no obvious reason for _NOT_ handling it at the core code.

> This splits out __irq_domain_alloc_irqs_data() to make it clear what
> IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.

That's your interpretation of cleaner.

You need to expose __irq_domain_alloc_irqs_data() for that which is a
core only functionality, so it's not cleaner. It's exposing internals
which are not to be exposed.

The right thing to do is to get rid of the legacy allocation of x86
during early_irq_init() which is possible with the recent restructuring
of the interrupt initialization code in x86. That's a cleanup which will
actually remove code and not expose internals just because.

> This should cause no behavioral change.

Should not cause is a pretty weak statement.

You're missing a nasty detail here. Contrary to the normal irqdomain
rules virq 0 _IS_ valid on x86 for historical reasons and that's not
trivial to change.

Thanks,

        tglx
