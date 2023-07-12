Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD6750BE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 17:09:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=jiqWTed+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1LkF30lMz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 01:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=jiqWTed+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1LjM2Xjcz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 01:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DNc/ePBoNgd+bEoPBcid3Rf/V7MDlOQu7ZJsXNCj0Mw=; b=jiqWTed+ZeLN2KTPCdu1HY3ZBo
	wH5c3x89xYsxPuc/QHg8uV5veO+oAqZ8AmXA9rY0Q98FKHPJw+OiAe6dHd+NFpKwLxhvWknI6uMXq
	Wcg903Vv3L9yDHlbBHFkDjr+1DAA5jBhb/YE8PD7rHARUVRRUk0lkM5C7TOWCaVhccxl8adTzE5Eb
	rO4px1w5Nj3DcFx0QKzw0kVjHuMi3zhu9LU/2T5c1R3YOdlzMfzBwe4iYmlQ9h/D+LG9RJ0VprlSG
	4BxIWdiLfUH9WK3mMzqlzC004PI9QICt61A+eXbUdghJDnkZ+i2o5ZgjpnknSikyCmebQfhFb/MR6
	qlI+KlLg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJbS0-00Gnv5-1z; Wed, 12 Jul 2023 15:08:20 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9F90030036B;
	Wed, 12 Jul 2023 17:08:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8781D240EBDA6; Wed, 12 Jul 2023 17:08:18 +0200 (CEST)
Date: Wed, 12 Jul 2023 17:08:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
Message-ID: <20230712150818.GL3100107@hirez.programming.kicks-ass.net>
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
 <xhsmh1qhduq9d.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh1qhduq9d.mognet@vschneid.remote.csb>
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
Cc: juri.lelli@redhat.com, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, dietmar.eggemann@arm.com, bristot@redhat.com, linux-kernel@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 12, 2023 at 04:02:38PM +0100, Valentin Schneider wrote:
> On 12/07/23 16:10, Peter Zijlstra wrote:
> > Hi
> >
> > Thomas just tripped over the x86 topology setup creating a 'DIE' domain
> > for the package mask :-)
> >
> > Since these names are SCHED_DEBUG only, rename them.
> > I don't think anybody *should* be relying on this, but who knows.
> >
> 
> FWIW I don't care much about the actual name.

Confusion is due to x86 growing an actual die topology and this not
being it.

Other than that, I can't be bothered too much about the silly name
either.

> There are some stray references to DIE in comments - see below. Bit funny
> to see:
> - *  - Package (DIE)
> + *  - Package (PKG)
> 
> With that:
> Acked-by: Valentin Schneider <vschneid@redhat.com>

Durr, I did a git-grep SD_INIT_NAME().. Thanks!
