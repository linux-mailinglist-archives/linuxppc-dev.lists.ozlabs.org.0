Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BA526FF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 10:16:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0dd40kB6z3cBP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 18:16:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Tm0Wc2Hr;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DQ1ba3l4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=Tm0Wc2Hr; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=DQ1ba3l4; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0dcM3rm1z3bcp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 18:15:31 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652516125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHF9WVJF89fHPJq0+8oiweP3wjgNVxTMSM/vRu60nYc=;
 b=Tm0Wc2HrL4EoLv6k4cC472VP8Biprl05MvetpUZPEzW0ctnc4AfNAc9GzrCaDwbUR7asay
 k9meZSHbxU07Wx7caJes3ehRYibTz13rBlObuMSuFk7ZgN3LUGwEFHSwzQDAbs76ml91Iv
 TfrRfjYmgQ6VlChzQQtCqbE57X4yHCjEY/nFJ+u//Q0QW7b86PnnHZ0bks5Z5KNxstDgFB
 8ieqdzZXwb8nQd54BAROxS5Y0qPLEeda5doQcCE+EFzABk7gxmFkNcD+FzEZp8aT5/YOg/
 zBTpa9/aRp4PQD0V/GvzjQhFx5s/3qzmVoPUo4/nyL1Yd+fdRZVYofcuJu1UWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652516125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHF9WVJF89fHPJq0+8oiweP3wjgNVxTMSM/vRu60nYc=;
 b=DQ1ba3l4HOXe/g0FH1Hxfxmq/Jov5eLSl+952ajCcfZuyexUDsvo3a6HGCEtaOgGvBGZVv
 W7XCCMG7O6GU1PCg==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH v6 05/29] x86/apic/vector: Do not allocate vectors for NMIs
In-Reply-To: <20220513234542.GC9074@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
 <87zgjufjrf.ffs@tglx> <20220513180320.GA22683@ranerica-svr.sc.intel.com>
 <87v8u9rwce.ffs@tglx> <20220513234542.GC9074@ranerica-svr.sc.intel.com>
Date: Sat, 14 May 2022 10:15:24 +0200
Message-ID: <87sfpcsf6r.ffs@tglx>
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
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Tony Luck <tony.luck@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 13 2022 at 16:45, Ricardo Neri wrote:
> On Fri, May 13, 2022 at 10:50:09PM +0200, Thomas Gleixner wrote:
>> > Also, if lapic_nmi_controller.irq_set_affinity() is NULL, then irq_chips
>> > INTEL-IR, AMD-IR, those using msi_domain_set_affinity() need to check for NULL.
>> > They currently unconditionally call the parent irq_chip's irq_set_affinity().
>> > I see that there is a irq_chip_set_affinity_parent() function. Perhaps it can
>> > be used for this check?
>> 
>> Yes, this lacks obviously a NMI specific set_affinity callback and this
>> can be very trivial and does not have any of the complexity of interrupt
>> affinity assignment. First online CPU in the mask with a fallback to any
>> online CPU.
>
> Why would we need a fallback to any online CPU? Shouldn't it fail if it cannot
> find an online CPU in the mask?

Might as well fail. Let me think about it.

>> I did not claim that this is complete. This was for illustration.
>
> In the reworked patch, may I add a Co-developed-by with your name and your SOB?

Suggested-by is good enough.

Thanks,

        tglx
