Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A183E870401
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 15:25:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Rq4HWVZv;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=I4SzUl53;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpLZW38VYz3vjZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 01:25:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Rq4HWVZv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=I4SzUl53;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 389 seconds by postgrey-1.37 at boromir; Tue, 05 Mar 2024 01:24:43 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpLYl3k8Sz3dTn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 01:24:43 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709562280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHKSpmj3DHeQFSFdUlKh9foXfF7ZumMJ/fAU2N/1zwg=;
	b=Rq4HWVZvvMHVESuVLtocY6NYdSEH/dE2Xp+N+TBjJXWY+OrV4fvA+rn/A7w0wJxyIjPIJf
	QTa6R4Eb1wokypLG7dbaBsi5i8zhEDi9LU9bptZXEFvUbnDBg6gerU+lhPZyaHxNZkAOsS
	mTzpDlnqKUJvNXA4L04jqwX3JzVkSU+ZGiPLJ/VCTxlTohnbPbe+z1CnQSRu+cce6LH9h0
	Sa370W8eh0GbAfR9vmQvwZNst0eSpaxdW8ZouLeirMq3p8RKUQs7fQG3uvIt9pLE0Wq4zp
	R3ZPirxAPzPASBf+TTa1N00LDKMiFM2cjj8a2CEL2UYtF0F7MnMFkxu8gmdXjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709562280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHKSpmj3DHeQFSFdUlKh9foXfF7ZumMJ/fAU2N/1zwg=;
	b=I4SzUl53PxaS52fDo8iHgVdIzZ8oprWFwZxy69wJaPobECSxLSjV/QRnCr94seWE4mCgtZ
	MoFnmWnDVT3IBKAw==
To: Bitao Hu <yaoma@linux.alibaba.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for
 interrupt statistics
In-Reply-To: <3a89fafb-f62e-472f-b40b-8bf97954e9e3@linux.alibaba.com>
References: <20240228072216.95130-1-yaoma@linux.alibaba.com>
 <20240228072216.95130-3-yaoma@linux.alibaba.com>
 <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
 <87plwdwycx.ffs@tglx>
 <3a89fafb-f62e-472f-b40b-8bf97954e9e3@linux.alibaba.com>
Date: Mon, 04 Mar 2024 15:24:39 +0100
Message-ID: <87wmqiulaw.ffs@tglx>
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
Cc: pmladek@suse.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jan.kiszka@siemens.com, deller@gmx.de, liusong@linux.alibaba.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, yaoma@linux.alibaba.com, kernelfans@gmail.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04 2024 at 20:00, Bitao Hu wrote:
>> +# Snapshot for interrupt statistics
>> +config GENERIC_IRQ_STAT_SNAPSHOT
>> +	bool
>> +
>>   # Support forced irq threading
>>   config IRQ_FORCED_THREADING
>>          bool
>
> I think we should follow Douglas's suggestion by making
> "config GENERIC_IRQ_STAT_SNAPSHOT" automatically selectable by
> "config SOFTLOCKUP_DETECTOR_INTR_STORM". This can prevent users
> from inadvertently disabling "config GENERIC_IRQ_STAT_SNAPSHOT"
> while enabling "config SOFTLOCKUP_DETECTOR_INTR_STORM".

The above is not even configurable by the user. It's only selectable by
some other config option.

> +# Snapshot for interrupt statistics
> +config GENERIC_IRQ_STAT_SNAPSHOT
> +       bool
> +       help
> +
> +         Say Y here to enable the kernel to provide a snapshot mechanism
> +         for interrupt statistics.

That makes is visible which is pointless because it's only relevant when
there is an actual user.

Thanks,

        tglx
