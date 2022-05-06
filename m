Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025E51E166
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 23:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw46m0KV9z3c9K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 07:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=igj0qkwu;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JhebiFX5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=igj0qkwu; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=JhebiFX5; 
 dkim-atps=neutral
X-Greylist: delayed 2369 seconds by postgrey-1.36 at boromir;
 Sat, 07 May 2022 07:51:56 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw4643grqz3bkb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 07:51:56 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651873913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJ3McpVzRFsgMBX23wgT/+qwHu2rZPiW0v6oIUJCIkI=;
 b=igj0qkwuwc7TJty88qJFZzgeFNtRFh7UFPJIoYtA35jxy2m3y6o5O4BdduJ2eTQP9yoEOj
 Y/Pma7uZ5nWvIQhbGPHLJmY6SG3i1CJVChRqzHb1xg1wCqo9z7wxEHAXtt5f9+bWp12aKl
 yxCDDHDVcTytIFMWLuivfqlaAY9rBazDQQyIjF1A+y1F0wqODasPHnEJyRNpLJt15J6YsH
 E5X1+fUKoagpdADMaiiKzhZbUA2CMwr6sDFvgkwLGqIpuqPfaj+XgnRcnoX0GKhhe7+t9y
 p/OQVpvdQapJpV5hYP5MRwR5/f2imVDr8Suxn6wvt2CDlZBIK6rpU9RNXp1y6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651873913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJ3McpVzRFsgMBX23wgT/+qwHu2rZPiW0v6oIUJCIkI=;
 b=JhebiFX5xqgDI1pfgNQ3AdRq6c3Eu2eESoBA4srTY5Ncp8q55tWwCzdaaNdIoRN0NdxHUo
 pfYq18JFAjczX9Dg==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
In-Reply-To: <87mtfufifa.ffs@tglx>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
 <87mtfufifa.ffs@tglx>
Date: Fri, 06 May 2022 23:51:52 +0200
Message-ID: <87ilqifhxj.ffs@tglx>
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

On Fri, May 06 2022 at 23:41, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
>> Programming an HPET channel as periodic requires setting the
>> HPET_TN_SETVAL bit in the channel configuration. Plus, the comparator
>> register must be written twice (once for the comparator value and once for
>> the periodic value). Since this programming might be needed in several
>> places (e.g., the HPET clocksource and the HPET-based hardlockup detector),
>> add a helper function for this purpose.
>>
>> A helper function hpet_set_comparator_oneshot() could also be implemented.
>> However, such function would only program the comparator register and the
>> function would be quite small. Hence, it is better to not bloat the code
>> with such an obvious function.
>
> This word salad above does not provide a single reason why the periodic
> programming function is required and better suited for the NMI watchdog
> case and then goes on and blurbs about why a function which is not
> required is not implemented. The argument about not bloating the code
> with an "obvious???" function which is quite small is slightly beyond my
> comprehension level.

What's even more uncomprehensible is that the patch which actually sets
up that NMI watchdog cruft has:

> +       if (hc->boot_cfg & HPET_TN_PERIODIC_CAP)
> +               hld_data->has_periodic = true;

So how the heck does that work with a HPET which does not support
periodic mode?

That watchdog muck will still happily invoke that set periodic function
in the hope that it works by chance?

Thanks,

        tglx
