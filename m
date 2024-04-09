Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0216F89D625
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 11:59:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yUJNjNeK;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RudeqC4D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDLyy4xqbz3vZD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 19:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yUJNjNeK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RudeqC4D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDLyF0dfvz3bv8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 19:58:44 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1712656715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKspgdo2jemqpn3T00b+Xa65C9dMoGtY4Dq7FXO0Tyg=;
	b=yUJNjNeKDiThpVYIfc/hToqHg6dkX3L/HoTYvzbPfhlp1m8uKGs2XlnA7L8y5fI5N4cOFQ
	dQ32nytZ/3UjhNV3dbTOO3Jfj16arUKQd3ugTeQbmVrxaxteUt94atCZh9WNssL7HPPxr3
	pCn1ZaCza7yC716aaOz0E9ElJsPiAsyL6aSGwchk4R4+heV6rolxLRbt3rqpDlNbHV0Zsg
	LM1od7FRSc1KMmptgN9TzUpAkmHkOtD8w6Z/GiQIOQr0nIuvqpNqMb/4UrsnnroGwkCm8s
	MZ283Al2wq+ZdOXvpPy3OWQoVsoJT3sajNpnJ3c4lnq/exiGmnSga1uqUzT3tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1712656715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKspgdo2jemqpn3T00b+Xa65C9dMoGtY4Dq7FXO0Tyg=;
	b=RudeqC4DlrksEdfkH3Xkz8ONgur7Wdpdnh1N4nAB5MWJHlWx6HGF7wJP3MPuxDdcYmBaf0
	oxZPsIOLB3/qZhBw==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv12 1/4] genirq: Provide a snapshot mechanism for
 interrupt statistics
In-Reply-To: <20240306125208.71803-2-yaoma@linux.alibaba.com>
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-2-yaoma@linux.alibaba.com>
Date: Tue, 09 Apr 2024 11:58:34 +0200
Message-ID: <87frvu7t85.ffs@tglx>
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
> The soft lockup detector lacks a mechanism to identify interrupt storms
> as root cause of a lockup. To enable this the detector needs a
> mechanism to snapshot the interrupt count statistics on a CPU when the
> detector observes a potential lockup scenario and compare that against
> the interrupt count when it warns about the lockup later on. The number
> of interrupts in that period give a hint whether the lockup might be
> caused by an interrupt storm.
>
> Instead of having extra storage in the lockup detector and accessing
> the internals of the interrupt descriptor directly, convert the per CPU
> irq_desc::kstat_irq member to a data structure which contains the
> counter plus a snapshot member and provide interfaces to take a
> snapshot of all interrupts on the current CPU and to retrieve the delta
> of a specific interrupt later on.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

This does not apply anymore.

Also can you please split this apart to convert kstat_irqs to a struct
with just the count in it and then add the snapshot mechanics on top.

Thanks,

        tglx

