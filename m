Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF451FF02
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 16:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxjb92MLmz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 00:04:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tvslSlzi;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=B+umBlaN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=tvslSlzi; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=B+umBlaN; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxjZY1lV7z2xY0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 00:03:49 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652105019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GqbJqls16FNy0vugLmt3uGKWWGVnEjYiGmRysMH1yNs=;
 b=tvslSlziDv2t2phpzE4lNj+wrzJgX67KxhCt1FuyD1ceg6sJFkBlxDhpRcOusXD3vCH1GO
 rrwBIOqwLBE/09DZS1RWIEpRUyzO4Ylxq9wypMWnCjV9KtGMgRRbEooy5Av5VpyEFRGz5A
 ZhYHIWm3yehXFdD4iBjXd6R7PU5v8T6fgojfu0Xj9/TcO08hmV7QXMv6URnVkVzfzFLPYQ
 nCVwI6uHnWtOiluEEbY/QZ0aJobXPwV6uKRnLdA5YA8RqQpeGlC+MXbMXss77eJLujwtT7
 ZzQK/ggooLf32/huA0pdmI4dXrznLN0honUiqbA/ZsXU29EKPlPPYg33zHC8PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652105019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GqbJqls16FNy0vugLmt3uGKWWGVnEjYiGmRysMH1yNs=;
 b=B+umBlaN/4/EfvGP0sahg2ByBcjgBKcjCmDqM6xwlN4Jeh/lEDpTcEWCOSnSQddUEZRznA
 Ju1piRkbSamhYbAA==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 22/29] x86/watchdog/hardlockup: Add an HPET-based
 hardlockup detector
In-Reply-To: <20220506000008.30892-23-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-23-ricardo.neri-calderon@linux.intel.com>
Date: Mon, 09 May 2022 16:03:39 +0200
Message-ID: <877d6uref8.ffs@tglx>
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

On Thu, May 05 2022 at 17:00, Ricardo Neri wrote:
> +	if (is_hpet_hld_interrupt(hdata)) {
> +		/*
> +		 * Kick the timer first. If the HPET channel is periodic, it
> +		 * helps to reduce the delta between the expected TSC value and
> +		 * its actual value the next time the HPET channel fires.
> +		 */
> +		kick_timer(hdata, !(hdata->has_periodic));
> +
> +		if (cpumask_weight(hld_data->monitored_cpumask) > 1) {
> +			/*
> +			 * Since we cannot know the source of an NMI, the best
> +			 * we can do is to use a flag to indicate to all online
> +			 * CPUs that they will get an NMI and that the source of
> +			 * that NMI is the hardlockup detector. Offline CPUs
> +			 * also receive the NMI but they ignore it.
> +			 *
> +			 * Even though we are in NMI context, we have concluded
> +			 * that the NMI came from the HPET channel assigned to
> +			 * the detector, an event that is infrequent and only
> +			 * occurs in the handling CPU. There should not be races
> +			 * with other NMIs.
> +			 */
> +			cpumask_copy(hld_data->inspect_cpumask,
> +				     cpu_online_mask);
> +
> +			/* If we are here, IPI shorthands are enabled. */
> +			apic->send_IPI_allbutself(NMI_VECTOR);

So if the monitored cpumask is a subset of online CPUs, which is the
case when isolation features are enabled, then you still send NMIs to
those isolated CPUs. I'm sure the isolation folks will be enthused.

Thanks,

        tglx
