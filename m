Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F852141B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 13:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyGRd0c66z3cH0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 21:44:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iiIyquw+;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wrd2WsMh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=iiIyquw+; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=wrd2WsMh; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyGQy4dxdz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 21:44:10 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652183045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Js8RDp7iMnj24JVY5ETKpHQgMOnO+QR2UvUOw/t3NVI=;
 b=iiIyquw+8QYZcovxorjqRFjfwhtMfLsHJEqe7bb762UGT/v/l/uDU2MlyH5t4U6gak6twB
 cCyHPEaUDEHU0enPu0J4DBw0J15rjARHL269aYiMpCupYu3BwyjP2tKIEcoTzzuFT76fSs
 Z0yC68PLfuFj70wdQZ68UUH/P13qMaOf9EUpMqUg6EgaWEupFN2HWfhg6OWSZyr0hg/ZGt
 Qzi4v4cd/H7wytmGiF+HHWJ9XcNU3cDxrdhX3LKr8Dq8hqBErcTwz/b/6JL8w7xTiMyZdu
 TWiYR1JW/491ynSImOymZIIK8iEtjvf2oz1jdx2qz/HmDYNZXQ9LjnzhjQSgpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652183045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Js8RDp7iMnj24JVY5ETKpHQgMOnO+QR2UvUOw/t3NVI=;
 b=wrd2WsMhhsrFIarhn4h+pO3O6mNNt4p+QTgQfzqOJMhou7WWpPXvvVvQJWm3tmm+PLi6JN
 3qRFd4zzo70zIfDQ==
To: Nicholas Piggin <npiggin@gmail.com>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 28/29] x86/tsc: Restart NMI watchdog after refining
 tsc_khz
In-Reply-To: <1652180070.1r874kr0tg.astroid@bobo.none>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-29-ricardo.neri-calderon@linux.intel.com>
 <1652180070.1r874kr0tg.astroid@bobo.none>
Date: Tue, 10 May 2022 13:44:05 +0200
Message-ID: <87ilqdpq7u.ffs@tglx>
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
Cc: "Ravi V.
 Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 Ricardo Neri <ricardo.neri@intel.com>, iommu@lists.linux-foundation.org,
 Tony Luck <tony.luck@intel.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10 2022 at 21:16, Nicholas Piggin wrote:
> Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
>> +	/*
>> +	 * If in use, the HPET hardlockup detector relies on tsc_khz.
>> +	 * Reconfigure it to make use of the refined tsc_khz.
>> +	 */
>> +	lockup_detector_reconfigure();
>
> I don't know if the API is conceptually good.
>
> You change something that the lockup detector is currently using, 
> *while* the detector is running asynchronously, and then reconfigure
> it. What happens in the window? If this code is only used for small
> adjustments maybe it does not really matter but in principle it's
> a bad API to export.
>
> lockup_detector_reconfigure as an internal API is okay because it
> reconfigures things while the watchdog is stopped [actually that
> looks untrue for soft dog which uses watchdog_thresh in
> is_softlockup(), but that should be fixed].
>
> You're the arch so you're allowed to stop the watchdog and configure
> it, e.g., hardlockup_detector_perf_stop() is called in arch/.
>
> So you want to disable HPET watchdog if it was enabled, then update
> wherever you're using tsc_khz, then re-enable.

The real question is whether making this refined tsc_khz value
immediately effective matters at all. IMO, it does not because up to
that point the watchdog was happily using the coarse calibrated value
and the whole use TSC to assess whether the HPET fired mechanism is just
a guestimate anyway. So what's the point of trying to guess 'more
correct'.

Thanks,

        tglx

