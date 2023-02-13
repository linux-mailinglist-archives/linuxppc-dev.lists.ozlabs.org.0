Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBF694A35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 16:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFnhN6ZXgz3cFN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 02:05:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jeiuJTj7;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Fuyr7ypH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jeiuJTj7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Fuyr7ypH;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFngV0gDYz2xHH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 02:04:37 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 124F91F385;
	Mon, 13 Feb 2023 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676300674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OToXXZIiWyAXEWcNWyx7IuheXO6/EAzirjW2J5oIVV8=;
	b=jeiuJTj7Atw+amz6Q6JVcsHkMzhJtLLZAZB0WGuZruMAcoS6BkxP2GDc5J6w/IhAt1Zxc3
	33Gs/gyhDUJTn+en/dTdYkILOT06hkOkv6pkKfGr0I3aXB5v7CwsIcFxBBAP50RLNt1woY
	8Dmd3mUYubLXPE9908DGDz2J0N89/Fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676300674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OToXXZIiWyAXEWcNWyx7IuheXO6/EAzirjW2J5oIVV8=;
	b=Fuyr7ypH29sejDdyzCavt4aKXfOGvtbOIQ8gs49CBpeEkD0xjflMdNhW25mvxU7yGphGBq
	9ObgRgxkM0d4w0BA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 2A9DF2C141;
	Mon, 13 Feb 2023 15:04:31 +0000 (UTC)
Date: Mon, 13 Feb 2023 16:04:29 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/cpuhp: respect current SMT when adding
 new CPU
Message-ID: <20230213150429.GZ19419@kitsune.suse.cz>
References: <20230213124510.12651-1-ldufour@linux.ibm.com>
 <87ilg5aahx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilg5aahx.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>, npiggin@gmail.com, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Feb 13, 2023 at 08:46:50AM -0600, Nathan Lynch wrote:
> Laurent Dufour <ldufour@linux.ibm.com> writes:
> > When a new CPU is added, the kernel is activating all its threads. This
> > leads to weird, but functional, result when adding CPU on a SMT 4 system
> > for instance.
> >
> > Here the newly added CPU 1 has 8 threads while the other one has 4 threads
> > active (system has been booted with the 'smt-enabled=4' kernel option):
> >
> > ltcden3-lp12:~ # ppc64_cpu --info
> > Core   0:    0*    1*    2*    3*    4     5     6     7
> > Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
> >
> > There is no SMT value in the kernel. It is possible to run unbalanced LPAR
> > with 2 threads for a CPU, 4 for another one, and 5 on the latest.
> >
> > To work around this possibility, and assuming that the LPAR run with the
> > same number of threads for each CPU, which is the common case,
> 
> I am skeptical at best of baking that assumption into this code. Mixed
> SMT modes within a partition doesn't strike me as an unreasonable
> possibility for some use cases. And if that's wrong, then we should just
> add a global smt value instead of using heuristics.
> 
> > the number
> > of active threads of the CPU doing the hot-plug operation is computed. Only
> > that number of threads will be activated for the newly added CPU.
> >
> > This way on a LPAR running in SMT=4, newly added CPU will be running 4
> > threads, which is what a end user would expect.
> 
> I could see why most users would prefer this new behavior. But surely
> some users have come to expect the existing behavior, which has been in
> place for years, and developed workarounds that might be broken by this
> change?
> 
> I would suggest that to handle this well, we need to give user space
> more ability to tell the kernel what actions to take on added cores, on
> an opt-in basis.
> 
> This could take the form of extending the DLPAR sysfs command set:
> 
> Option 1 - Add a flag that tells the kernel not to online any threads at
> all; user space will online the desired threads later.
> 
> Option 2 - Add an option that tells the kernel which SMT mode to apply.

powerpc-utils grew some drmgr hooks recently so maybe the policy can be
moved to userspace?

Thanks

Michal
