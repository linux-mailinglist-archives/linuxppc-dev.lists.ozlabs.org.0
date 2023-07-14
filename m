Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94383753674
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 11:29:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M7ByKjPF;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=k+C8NSid;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2R5c3ThRz3c50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 19:29:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M7ByKjPF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=k+C8NSid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mgorman@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2R4h0q5jz30PB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 19:29:08 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 52FBE1FD60;
	Fri, 14 Jul 2023 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689326944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJwS6jgM/F6rS04d9Wc7YkG+2OJLOoEr4udYg+BGyWw=;
	b=M7ByKjPFDt0Rl68Wb1mvPnAjDU5b3pAE5iH9/ciB8X3D6xixrnXoSQrV8Rh3yToMKgUEJR
	oPISriOh5bLfikITiwKuaJwUN6FaPBVWmMvx8nXWBTYMNZIeg+VjCkwG3EuRYshxXz7lPf
	A/phey/kQFkpQVENnHfz6gZD0tWjx6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689326944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJwS6jgM/F6rS04d9Wc7YkG+2OJLOoEr4udYg+BGyWw=;
	b=k+C8NSid4g/P8wTLz5Q9iHDOuQnYjvks/1FLJZmrLFGYlbJlJnkWj2ktRkgPOAZd1rNaqg
	1m+w+8kfkkYyhwDg==
Received: from suse.de (unknown [10.163.43.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E6FD42C142;
	Fri, 14 Jul 2023 09:29:00 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:28:53 +0100
From: Mel Gorman <mgorman@suse.de>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
Message-ID: <20230714092853.tueulnlqloc3m4gw@suse.de>
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
 <xhsmh1qhduq9d.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
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
Cc: juri.lelli@redhat.com, Peter Zijlstra <peterz@infradead.org>, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, dietmar.eggemann@arm.com, bristot@redhat.com, linux-kernel@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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
> 
> There are some stray references to DIE in comments - see below. Bit funny
> to see:
> - *  - Package (DIE)
> + *  - Package (PKG)
> 
> With that:
> Acked-by: Valentin Schneider <vschneid@redhat.com>
> 

No objection either, PKG is less ambiguous than DIE

Acked-by: Mel Gorman <mgorman@suse.de>

-- 
Mel Gorman
SUSE Labs
