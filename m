Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8351DFED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 22:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw1m25w1wz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 06:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zS7mT4GO;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5wkuYkNH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=zS7mT4GO; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=5wkuYkNH; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw1lQ54vKz3byZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 06:05:38 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651867535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MVppxWloPHGJWVXPfoL2Mp1gCDmCbq5jYvkOUctTPwE=;
 b=zS7mT4GOFbktfGjTiNzsOezexuL61fgcFzjZlZAaPH7GPyJ2Q7bJAFEDsyscoPuCfFVQXy
 MQv9fxTolSCsKtYLSyZInAmifCbsge2rcmwRurq4fs6letvqkFnJbaTyhjCsRTPV60X6uE
 rinuSxovZT2eQZmTTINCqVtTXoHEFIdOgI1zfPR/KL1VUfVwn2fIFHM766ozhigodnfH5s
 jReDujbvbA2//EkDSTXQNLuOihMxNNQNvdzlCmWip8r6V8GGcekFaYq43MM8Slzjs9F8uF
 PGtWQGOFlmpNWcrTP2AzpuqH8ZoMSNTnNEko3cwpIKeOk6ve9AbhRkGjDS/MIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651867535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MVppxWloPHGJWVXPfoL2Mp1gCDmCbq5jYvkOUctTPwE=;
 b=5wkuYkNHIkwqACUXoQDb2h1xfBOD4wVbdnhxKNW06YuXNMEFHsj/QnO9X2mOg3FHRYYiy1
 G0NPRPNdhl+hS1AA==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 03/29] x86/apic/msi: Set the delivery mode
 individually for each IRQ
In-Reply-To: <20220506000008.30892-4-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-4-ricardo.neri-calderon@linux.intel.com>
Date: Fri, 06 May 2022 22:05:34 +0200
Message-ID: <8735hmh1f5.ffs@tglx>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> There are no restrictions in hardware to set  MSI messages with its
> own delivery mode.

"messages with its own" ? Plural/singular confusion.

> Use the mode specified in the provided IRQ hardware
> configuration data. Since most of the IRQs are configured to use the
> delivery mode of the APIC driver in use (set in all of them to
> APIC_DELIVERY_MODE_FIXED), the only functional changes are where
> IRQs are configured to use a specific delivery mode.

This does not parse. There are no functional changes due to this patch
and there is no point talking about functional changes in subsequent
patches here.

> Changing the utility function __irq_msi_compose_msg() takes care of
> implementing the change in the in the local APIC, PCI-MSI, and DMAR-MSI

in the in the

> irq_chips.
>
> The IO-APIC irq_chip configures the entries in the interrupt redirection
> table using the delivery mode specified in the corresponding MSI message.
> Since the MSI message is composed by a higher irq_chip in the hierarchy,
> it does not need to be updated.

The point is that updating __irq_msi_compose_msg() covers _all_ MSI
consumers including IO-APIC.

I had to read that changelog 3 times to make sense of it. Something like
this perhaps:

  "x86/apic/msi: Use the delivery mode from irq_cfg for message composition

   irq_cfg provides a delivery mode for each interrupt. Use it instead
   of the hardcoded APIC_DELIVERY_MODE_FIXED. This allows to compose
   messages for NMI delivery mode which is required to implement a HPET
   based NMI watchdog.

   No functional change as the default delivery mode is set to
   APIC_DELIVERY_MODE_FIXED."

Thanks,

        tglx
