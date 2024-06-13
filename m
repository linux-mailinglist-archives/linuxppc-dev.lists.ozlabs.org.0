Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271F906F0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 14:16:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=STzDZDTz;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=767Y7lEb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8avc0Ck;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dokv8vaD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0Lwd64N1z3cW5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 22:16:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=STzDZDTz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=767Y7lEb;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8avc0Ck;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dokv8vaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 491 seconds by postgrey-1.37 at boromir; Thu, 13 Jun 2024 22:15:23 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Lvv3N6bz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 22:15:23 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3B9F3539F;
	Thu, 13 Jun 2024 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zAvrPhZhF6uatcsrntRNbw3qSSmpluUGwwNlU0hJc4=;
	b=STzDZDTztcGnhBcI537899X64efXubsdtnkC2b8WMHTCpstKMnCsAKPc9tLfJo/dFWDT5r
	utckXRJcPjYGvH3SvE1Qj8urvvZ1mk8sd2p1qV5TUMr09mYVj8IHDdetIONIM77wEbUtPS
	FYe6bFBvQ9bISR8KKi/2bs5nmVl/2Sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zAvrPhZhF6uatcsrntRNbw3qSSmpluUGwwNlU0hJc4=;
	b=767Y7lEbmscSCVmr6ui8ujbNK8KhiYCKDbwiV56ppPlQLr8pYCfqYifwUB/e3p2tS3iv9Q
	UNPpOKp1KRQOGcAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zAvrPhZhF6uatcsrntRNbw3qSSmpluUGwwNlU0hJc4=;
	b=y8avc0CkMfS3mDoV+kIh1D3eaqfVannwxLCn6BglYyuXaPzEKXZYM8RigHQOIUX4kEdwK5
	2OgWyK/RBCKZwEi/Gztnj5h6HE9s4+HYDbBd1u17nYZUQ00QqMzQd3rWMvyhsKoeLNG6uM
	5x7mgHLvam9yqsUgHhLeruvI1Kd08Gk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zAvrPhZhF6uatcsrntRNbw3qSSmpluUGwwNlU0hJc4=;
	b=Dokv8vaDMACn9OruIAfqACroLQafUwYCiSelv8y1uJ8JpraEWbUWqP3Dl1VZm64EsOw6hs
	B4nUdNoVH8nj/QDg==
Date: Thu, 13 Jun 2024 14:07:04 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/2] Skip offline cores when enabling SMT on PowerPC
Message-ID: <20240613120704.GI19642@kitsune.suse.cz>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
 <875xudoz4d.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xudoz4d.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[linux.ibm.com,linutronix.de,gmail.com,csgroup.eu,infradead.org,lists.ozlabs.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -8.30
X-Spam-Level: 
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Nysal Jan K.A." <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 09:34:10PM +1000, Michael Ellerman wrote:
> "Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> > From: "Nysal Jan K.A" <nysal@linux.ibm.com>
> >
> > After the addition of HOTPLUG_SMT support for PowerPC [1] there was a
> > regression reported [2] when enabling SMT.
> 
> This implies it was a kernel regression. But it can't be a kernel
> regression because previously there was no support at all for the sysfs
> interface on powerpc.
> 
> IIUIC the regression was in the ppc64_cpu userspace tool, which switched
> to using the new kernel interface without taking into account the way it
> behaves.

The reported regression is in the ppc64_cpu tool behavior.

> Or are you saying the kernel behaviour changed on x86 after the powerpc
> HOTPLUG_SMT was added?
> 
> > On a system with at least
> > one offline core, when enabling SMT, the expectation is that no CPUs
> > of offline cores are made online.
> >
> > On a POWER9 system with 4 cores in SMT4 mode:
> > $ ppc64_cpu --info
> > Core   0:    0*    1*    2*    3*
> > Core   1:    4*    5*    6*    7*
> > Core   2:    8*    9*   10*   11*
> > Core   3:   12*   13*   14*   15*
> >
> > Turn only one core on:
> > $ ppc64_cpu --cores-on=1
> > $ ppc64_cpu --info
> > Core   0:    0*    1*    2*    3*
> > Core   1:    4     5     6     7
> > Core   2:    8     9    10    11
> > Core   3:   12    13    14    15
> >
> > Change the SMT level to 2:
> > $ ppc64_cpu --smt=2
> > $ ppc64_cpu --info
> > Core   0:    0*    1*    2     3
> > Core   1:    4     5     6     7
> > Core   2:    8     9    10    11
> > Core   3:   12    13    14    15
> >
> > As expected we see only two CPUs of core 0 are online
> >
> > Change the SMT level to 4:
> > $ ppc64_cpu --smt=4
> > $ ppc64_cpu --info
> > Core   0:    0*    1*    2*    3*
> > Core   1:    4*    5*    6*    7*
> > Core   2:    8*    9*   10*   11*
> > Core   3:   12*   13*   14*   15*
> >
> > The CPUs of offline cores are made online. If a core is offline then
> > enabling SMT should not online CPUs of this core.
> 
> That's the way the ppc64_cpu tool behaves, but it's not necessarily what
> other arches want.
> 
> > An arch specific
> > function topology_is_core_online() is proposed to address this.
> > Another approach is to check the topology_sibling_cpumask() for any
> > online siblings. This avoids the need for an arch specific function
> > but is less efficient and more importantly this introduces a change
> > in existing behaviour on other architectures.
> 
> It's only x86 and powerpc right?
> 
> Having different behaviour on the only two arches that support the
> interface does not seem like a good result.

That's unfortunate. At the same time changing the x86 behavior would
potentially lead to similar reports from people relying on the old
behavior.

> > What is the expected behaviour on x86 when enabling SMT and certain cores
> > are offline? 
> 
> AFAIK no one really touches SMT on x86 other than to turn it off for
> security reasons.

In particular I am not aware of x86 suporting those middle partially
enabled states. I don't have a x86 4+ way SMT cpu at hand to test, either.

The more likely excuse is that there is little use case for enabling
previously disabled CPUs (whole cores/thread groups) by changing the SMT
state, even if the SMT code happened to do it in the past.

That is, more technically, that the value of 'off' is 1 - 1 thread of
each core is enabled, and another value representing 'core disabled'
with no thread of the core running is to be treated specially, and not
changed when setting the system-wide SMT value.

These are separate concerns, and should be addressed by separate
interfaces.

Thanks

Michal
