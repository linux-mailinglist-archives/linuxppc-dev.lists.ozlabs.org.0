Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74527887A5C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 21:45:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TG8xN/Lf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aLDuLGbK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2B5f3Ss6z3dVr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 07:44:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TG8xN/Lf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aLDuLGbK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2B4s6NjLz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 07:44:13 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1711226639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=498F8PEQ9wEXgdD7gmsVyIePv6lPN9KMgR9cake0cII=;
	b=TG8xN/LfoRRdGRKLPJytQ0WbpsaWMv0WrL4DXHc0QF2TG12Q+SQKz6wiObWgnnW0HcR/Ql
	F7NpwBCwlA2vJX8wi6bn4x4VVQlSM5xIJQKIHzRKU4I9+XuSiat0R7PfEeZifBlwk4bJAL
	yvEB7eWVJx7O4K4GgJ3YXt6yO//Uay0/EmyvWT4oESAp+K6tUUEXEQ0ZBxK2rsiVEj8bEV
	3Bzbt37hwIC0Ytzq/bSAlCawj2peBQWRNNvikh9Hcvrg0VIKo1H75ASOhVTq+sdlRR2Hkm
	sjgXecrKKsUDj5FuF+LpeihW7o64DPQnycD8y6KM3vUmurhroDmduosVLQYLHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1711226639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=498F8PEQ9wEXgdD7gmsVyIePv6lPN9KMgR9cake0cII=;
	b=aLDuLGbKEM9RIsVsNKRqttDQtUs33o/e8HGUnEg3BejCTi8TFZVBG6mVCOBMb9MEViBHMg
	qYbmaaadEYPf6dDw==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv12 4/4] watchdog/softlockup: report the most frequent
 interrupts
In-Reply-To: <20240306125208.71803-5-yaoma@linux.alibaba.com>
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-5-yaoma@linux.alibaba.com>
Date: Sat, 23 Mar 2024 21:43:58 +0100
Message-ID: <87zfuofzld.ffs@tglx>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06 2024 at 20:52, Bitao Hu wrote:
> +	if (__this_cpu_read(snapshot_taken)) {
> +		for_each_active_irq(i) {
> +			count = kstat_get_irq_since_snapshot(i);
> +			tabulate_irq_count(irq_counts_sorted, i, count, NUM_HARDIRQ_REPORT);
> +		}
> +
> +		/*
> +		 * We do not want the "watchdog: " prefix on every line,
> +		 * hence we use "printk" instead of "pr_crit".
> +		 */

You are not providing any justification why the prefix is not
wanted. Just saying 'We do not want' does not cut it and who is 'We'. I
certainly not.

I really disagree because the prefixes are very useful for searching log
files. So not having it makes it harder to filter out for no reason.

Thanks,

        tglx
