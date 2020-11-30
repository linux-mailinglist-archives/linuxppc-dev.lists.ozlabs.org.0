Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7562C9137
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 23:35:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClKn628rRzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 09:35:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=wy/wct3O; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=XY7Bodsg; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClKlF0186zDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 09:33:44 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606775613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mm7z8+LQNmpqR3/51ygd5ccUSxfGw1mG3mvRt4yFQJc=;
 b=wy/wct3OdzxqH87mZ8U35WXS8YHdfm2FzpA6J1iXgNuazw7m2Gm1nOJyNA+eXh4y49E8xD
 hbTN1gqi/zWyeh4p3SjPXMm6HslikbmaTtfKzQn4RSVLhiJhQfeyGUQ0JsA2jMC/Ue7Frw
 Lk2fPYkJwI0K/wDBcij7KrLZu+awwdIR/F/gX8kPPyfASwV6t2wAAbzArXEsB16ubqvBX/
 M80xQ13aSOs491Jc3IIuPC/JazN6blWKZ2O/d4TQfXoHlSttBgwynNIQcornI92e+S9hAK
 IObQcadw6KYEWaKsQS3UbWCTxMlQqJoIVRUt2wObT0aTArG8qOKWOB9dR8SL5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606775613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mm7z8+LQNmpqR3/51ygd5ccUSxfGw1mG3mvRt4yFQJc=;
 b=XY7Bodsgz1q+NQjLQMpVRYw72W7/aL9naYJ1Niv9vjB1Ci877/KySl8fwhkuMojdh+eAmw
 eso+VrublYa7j6BQ==
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernel v4 5/8] genirq: Add free_irq hook for IRQ
 descriptor and use for mapping disposal
In-Reply-To: <877dq2ij45.fsf@nanos.tec.linutronix.de>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-6-aik@ozlabs.ru>
 <877dq2ij45.fsf@nanos.tec.linutronix.de>
Date: Mon, 30 Nov 2020 23:33:33 +0100
Message-ID: <87360qiif6.fsf@nanos.tec.linutronix.de>
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

On Mon, Nov 30 2020 at 23:18, Thomas Gleixner wrote:
> On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
>> We want to make the irq_desc.kobj's release hook free associated resources
>> but we do not want to pollute the irqdesc code with domains.
>
> Can you please describe your changelog in factual ways without 'we and I
> and want'? See Documentation/process/

And while we are at process. MAINTAINERS clearly says:

IRQ DOMAINS (IRQ NUMBER MAPPING LIBRARY)
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

IRQ SUBSYSTEM
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

So why are these patches not applying against that git branch?

Thanks,

        tglx






 
