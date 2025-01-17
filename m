Return-Path: <linuxppc-dev+bounces-5360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF56A15039
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 14:09:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZKnZ425gz2yDr;
	Sat, 18 Jan 2025 00:09:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737119362;
	cv=none; b=OfnDyNRPUbA83FSyGakKLyOq+oMSyDvu5skLJtfCdhHz+M3leo55kR4zOda0VQSOehkLKZiD3JtZEX6u8JGQf7ONeZ4mfRbqC/wWdbrlWlIGS53qYGNL3w+dm8icANlE9DJg9M08oHiPBZyMXYZlVLKEbkubHuyiaDfiTJ8wcQCw0z3PbeE1aqTRRgoeVxwP0TSYBP0rkisqNLlMwM5q2Q8yHI2nPxQPIBz2n4eLCyAJ+Ao6BEl1DWimLuiN5rkOjFnfv22rs54WbTOQFhfahcDjBkPu9/UJCyZuW+aTSAejTqzFDwxJWJBs6uZ9peruAdwgw4xUEyk4wo/wBg6qhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737119362; c=relaxed/relaxed;
	bh=JgSrgxATeLSMWrnRc+d58QJE+AgqKRYBqUdU25meeXM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DA+hbib8d9un7Xfut4S+AOlWLge04lrhKw6H8Juv3UY6hCtTwdOksrcvDgt6N1q5i8BSqaWL7tUPu7V0bo/0dzskn8VP6RexLr2NX+xX/3INelBuXUG6tvkHOfF2lYDvStsNaDp6ECEHQQgUCo/BBdrnsoM8CUUaNKuCBkUdMmRglHPKpsPsbBEfPjxddnbJVXUKft8Qih2086qIl4+nZwTHfDCul7cUV5yQ3wIjos25I1AZtZehMMuwVzqi8qC0TfeywiavcA458RirGE79aQVIlUADMgcavjgSwys+aNbzFlKsLVgJT/s13ZOXfEyaVwOG8j/MjfONV/PMgrrV+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=gB+0yLEX; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fZo1H/BE; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=gB+0yLEX; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fZo1H/BE; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=mbenes@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=gB+0yLEX;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fZo1H/BE;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=gB+0yLEX;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fZo1H/BE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=mbenes@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 432 seconds by postgrey-1.37 at boromir; Sat, 18 Jan 2025 00:09:21 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZKnY1hc1z2xst
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 00:09:20 +1100 (AEDT)
Received: from pobox.suse.cz (unknown [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDA1221177;
	Fri, 17 Jan 2025 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737118924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JgSrgxATeLSMWrnRc+d58QJE+AgqKRYBqUdU25meeXM=;
	b=gB+0yLEXF2s+dZ6ugNySFz7tUpEiyJU2ys49pfpdfHnwn8ZqxJNXCymKHvpf5/QGv4j8sD
	/eKXq/ZXdqjugJz2j9eUyFWv/Fc3pR9l3CLfapeoXCt7YtO7PwIry/AVJNt2TjfUG4vLDY
	wMz6CvhVegJqwY+qZIedRREjLp+Occw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737118924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JgSrgxATeLSMWrnRc+d58QJE+AgqKRYBqUdU25meeXM=;
	b=fZo1H/BEKSEaEFUQjYrAy7Ye9Zi6rB9/n8du7zJXp3hL9uZV0R6N5jzUAD0RflvIw7AQhz
	Zeh1+dWrD+V8KxBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737118924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JgSrgxATeLSMWrnRc+d58QJE+AgqKRYBqUdU25meeXM=;
	b=gB+0yLEXF2s+dZ6ugNySFz7tUpEiyJU2ys49pfpdfHnwn8ZqxJNXCymKHvpf5/QGv4j8sD
	/eKXq/ZXdqjugJz2j9eUyFWv/Fc3pR9l3CLfapeoXCt7YtO7PwIry/AVJNt2TjfUG4vLDY
	wMz6CvhVegJqwY+qZIedRREjLp+Occw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737118924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JgSrgxATeLSMWrnRc+d58QJE+AgqKRYBqUdU25meeXM=;
	b=fZo1H/BEKSEaEFUQjYrAy7Ye9Zi6rB9/n8du7zJXp3hL9uZV0R6N5jzUAD0RflvIw7AQhz
	Zeh1+dWrD+V8KxBg==
Date: Fri, 17 Jan 2025 14:02:04 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Petr Mladek <pmladek@suse.com>
cc: Joe Lawrence <joe.lawrence@redhat.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, jikos@kernel.org, 
    shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, 
    christophe.leroy@csgroup.eu, naveen@kernel.org, 
    live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
In-Reply-To: <Z4ktTdwl8aqqwZpf@pathway.suse.cz>
Message-ID: <alpine.LSU.2.21.2501171401290.6283@pobox.suse.cz>
References: <20250114143144.164250-1-maddy@linux.ibm.com> <Z4jRisgTXOR5-gmv@pathway.suse.cz> <af77083e-2100-ea2e-ae14-dc5761456fef@redhat.com> <Z4ktTdwl8aqqwZpf@pathway.suse.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,csgroup.eu,vger.kernel.org,lists.ozlabs.org];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Thu, 16 Jan 2025, Petr Mladek wrote:

> On Thu 2025-01-16 08:10:44, Joe Lawrence wrote:
> > On 1/16/25 04:29, Petr Mladek wrote:
> > > On Tue 2025-01-14 20:01:44, Madhavan Srinivasan wrote:
> > >> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER, which
> > >> adds the caller id as part of the dmesg. Due to this, even though
> > >> the expected vs observed are same, end testcase results are failed.
> > > 
> > > CONFIG_PRINTK_CALLER is not the only culprit. We (SUSE) have it enabled
> > > as well and the selftests pass without this patch.
> > > 
> > > The difference might be in dmesg. It shows the caller only when
> > > the messages are read via the syslog syscall (-S) option. It should
> > > not show the caller when the messages are read via /dev/kmsg
> > > which should be the default.
> > > 
> > > I wonder if you define an alias to dmesg which adds the "-S" option
> > > or if /dev/kmsg is not usable from some reason.
> > > 
> > 
> > Hi Petr,
> > 
> > To see the thread markers on a RHEL-9.6 machine, I built and installed
> > the latest dmesg from:
> > 
> >   https://github.com/util-linux/util-linux
> > 
> > and ran Madhavan's tests.  I don't think there was any alias involved:
> > 
> >   $ alias | grep dmesg
> >   (nothing)
> > 
> >   $ ~/util-linux/dmesg | tail -n1
> >   [ 4361.322790] [  T98877] % rmmod test_klp_livepatch
> 
> Good to know. I havn't seen this yet.
> 
> > >From util-linux's 467a5b3192f1 ("dmesg: add caller_id support"):
> > 
> >  The dmesg -S using the old syslog interface supports printing the
> >  PRINTK_CALLER field but currently standard dmesg does not support
> >  printing the field if present. There are utilities that use dmesg and
> >  so it would be optimal if dmesg supported PRINTK_CALLER as well.
> > 
> > does that imply that printing the thread IDs is now a (util-linux's)
> > dmesg default?
> 
> It looks like. The caller ID information is available also via
> /dev/kmsg but the older dmesg version did not show it. I guess that
> they just added support to parse and show it. It actually makes
> sense to show the same output independently on whether the messages
> are read via syslog or /dev/kmsg.
> 
> So, we need this patch, definitely ;-)

Yes.

Madhavan, could you add the above findings to the commit log when you 
submit a new version, please?

Thank you,
Miroslav

