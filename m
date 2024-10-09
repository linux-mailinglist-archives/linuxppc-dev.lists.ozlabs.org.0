Return-Path: <linuxppc-dev+bounces-1896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4293997112
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 18:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNymN4sQnz3bbS;
	Thu, 10 Oct 2024 03:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728490836;
	cv=none; b=clEV2RuW+T9CLHpolLWcedXukqcxxLRrel8/3Qa29AbLLpef37p0vRjPvk3+dNZgiMwn88V99q6HcAcZU1Gtwe2UBUyvMp5Mz1rJv6R/jLOJjVry6MTa61ynV6nFDPC2DKSfglzTbvOTMq7Z5ey05iDkXbp0So6uB2droBfIAM7npLyKihcnreUSn//dORTw7bpXt9lg2rDf/XzDmYXOyUU23z/qxaLKrzn8DNqWOjiPLtcD4+azVFQdJQ66Vrh0kT+X2xpLhT5y7QIiYEHmQGlLS5quLLhXTLmHNpAwbynUqdj7uG36BNfELcGTg02J1n4KK+24BjGTE2bBagMs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728490836; c=relaxed/relaxed;
	bh=lYmz6L6UnP/GocNauVPfyjEkC6As3tZdOQr+F+X9tbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etUt8rw9aOuheUCPgLS/w0PdWC1EwSa0jpJvSwFAhXCBqSFaWtkw5Twl3fjJpKhYMgfQrtwt27G6zgp+CvQEW0mMOhKPClE7sPF2ZjbXn/R/EIe5ZwYp7lLoka1K+4pyQPkO8VwceK5r6vXrC5b8ZdHf2nE1WsPAXU/+0MCv07MDev8Zr0/cZZyHOjYOEaaCi0GdJrKrq9Hn5tQ5J6CeSeJIx8uUg8wOjaLKOxmoAqPxJ4v0ymMRLSzgF3F103z4K788N7icp/jyyZWXq0evEz/aa+k3zlVoq4X6J1TrmpOtkg/in7U2OBeUPIqt+NjYSeP3dpwMVszbWe6Jwh6fHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWMZGUMQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWMZGUMQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNymM1cCpz3bbC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 03:20:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6B70A42605;
	Wed,  9 Oct 2024 16:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20A8C4CEC3;
	Wed,  9 Oct 2024 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728490832;
	bh=Uba5dcZr4KpnQUwqLKLl8MSM6Z2gkPYc3nfBePyhh4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWMZGUMQLhfL7hJM+BhMhNP9MtoirSlnfvKgPq0O8x0QNTfxobcUKmGhuCFQWdYhI
	 pctbqvZ5Xs+KWWs9F5nHagH13mKeSGlkXWU4U/U5A3ZNx/jKq9H5GUkOAqspz0MS40
	 O5iuGVtnaQEldzx7TliSn4LAkAv4RmYi6/uCfZLghc2iEwkLkkcEmNv/BuAZ9DGLeP
	 vKBl6a/x5h6mR5b5C6l9BSQ0D6D/j4vClV7ULZ5UL92eubCQyIkw4MPo60JNNfdDF8
	 d+G24X5yovtt6YSoGQh3JHsS6+tKdOvtP1Jsa9HYEh29v2BUkhe1YCEg78UtxDzPKh
	 XSl7hBzvzl+8Q==
Date: Wed, 9 Oct 2024 18:20:29 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 13/15] powerpc/rtas: Use fsleep() to minimize
 additional sleep duration
Message-ID: <ZwatTfHxojsZwqHw@localhost.localdomain>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <20240911-devel-anna-maria-b4-timers-flseep-v2-13-b0d3f33ccfe0@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911-devel-anna-maria-b4-timers-flseep-v2-13-b0d3f33ccfe0@linutronix.de>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Le Wed, Sep 11, 2024 at 07:13:39AM +0200, Anna-Maria Behnsen a écrit :
> When commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
> was introduced, documentation about proper usage of sleep realted functions

related*

> was outdated.
> 
> The commit message references the usage of a HZ=100 system. When using a
> 20ms sleep duration on such a system and therefore using msleep(), the
> possible additional slack will be +10ms.
> 
> When the system is configured with HZ=100 the granularity of a jiffy and of
> a bucket of the lowest timer wheel level is 10ms. To make sure a timer will
> not expire early (when queueing of the timer races with an concurrent
> update of jiffies), timers are always queued into the next bucket. This is
> the reason for the maximal possible slack of 10ms.
> 
> fsleep() limits the maximal possible slack to 25% by making threshold
> between usleep_range() and msleep() HZ dependent. As soon as the accuracy
> of msleep() is sufficient, the less expensive timer list timer based
> sleeping function is used instead of the more expensive hrtimer based
> usleep_range() function. The udelay() will not be used in this specific
> usecase as the lowest sleep length is larger than 1 microsecond.

Isn't udelay() for everything below 10us ?

> 
> Use fsleep() directly instead of using an own heuristic for the best
> sleeping mechanism to use..
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

