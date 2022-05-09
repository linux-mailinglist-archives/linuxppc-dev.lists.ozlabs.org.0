Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC351FEF1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 16:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxjVZ15Ddz3cFj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 00:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vmKUlABh;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VlTE3d1m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=vmKUlABh; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=VlTE3d1m; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxjTv676Vz3bYk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 23:59:47 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652104781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDSynU42H0ANPTpjgbswkYJXVZufPOPf8nzkhHqjA9g=;
 b=vmKUlABhaBvEYz0X9LA3g5SRs3q6NK9pjEq5HDfdrkv8DNhJiu+xhSkMA6zdgQEprlDzCg
 uQWR46Hiz1n5Y0hzLAPihWXSh1PrxlSYk2hsuQTYX1OFGec+wVrZGK7qp4we6RqTX+Qakh
 BSagp92ogKOfiZ4quMyZMILbTxMIr02LfddqQvQLeX/k6xcU1kjTJJJN9L3wNd+67mHM8m
 16UrGlt5n8Yz3RlqdYJT1GHL7F4HJ3T/aHL+iOWbDqGgRE84ihDkeISbp4UTxCINqutLyz
 0i120YG1QFJBnP0HMncXXV9Af4R86Xe56Ls8BflDNQUL6C1XIO8Zsz+kiLneKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652104781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDSynU42H0ANPTpjgbswkYJXVZufPOPf8nzkhHqjA9g=;
 b=VlTE3d1mTqdZW3KhBs4KorVfZhqO0/Xdh68Ua4w6Qxm6hC/qsLC7dU9afDjI28gB3NaJhD
 xlvkhK2X24Pr7XCw==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 21/29] x86/nmi: Add an NMI_WATCHDOG NMI handler category
In-Reply-To: <20220506000008.30892-22-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-22-ricardo.neri-calderon@linux.intel.com>
Date: Mon, 09 May 2022 15:59:40 +0200
Message-ID: <87a6bqrelv.ffs@tglx>
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
> Add a NMI_WATCHDOG as a new category of NMI handler. This new category
> is to be used with the HPET-based hardlockup detector. This detector
> does not have a direct way of checking if the HPET timer is the source of
> the NMI. Instead, it indirectly estimates it using the time-stamp counter.
>
> Therefore, we may have false-positives in case another NMI occurs within
> the estimated time window. For this reason, we want the handler of the
> detector to be called after all the NMI_LOCAL handlers. A simple way
> of achieving this with a new NMI handler category.
>
> @@ -379,6 +385,10 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
>  	}
>  	raw_spin_unlock(&nmi_reason_lock);
>  
> +	handled = nmi_handle(NMI_WATCHDOG, regs);
> +	if (handled == NMI_HANDLED)
> +		goto out;
> +

How is this supposed to work reliably?

If perf is active and the HPET NMI and the perf NMI come in around the
same time, then nmi_handle(LOCAL) can swallow the NMI and the watchdog
won't be checked. Because MSI is strictly edge and the message is only
sent once, this can result in a stale watchdog, no?

Thanks,

        tglx



