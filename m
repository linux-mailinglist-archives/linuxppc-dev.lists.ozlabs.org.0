Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24BA6D0AE7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 18:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnTDN4YFXz3fSm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 03:20:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OeMblc9d;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WTxPDxtf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OeMblc9d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WTxPDxtf;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnTCS1Q2lz3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 03:19:47 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 0EEA7219F8;
	Thu, 30 Mar 2023 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680193180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rFB1bczKoSUfxkLTehDWurRBcthSjwP2XB1p4I+TL4=;
	b=OeMblc9dRPHt0BVeqZwiwF0rH4yqT7zvCyenGjoJkhyRfiWBmyVTSyptRp56huOieK2MDB
	2aFRQ3BgzTeyi4P5ozPQZLizpQf/gNzuhJfVWPY4HiVIBdNDhQ9JEyOYpPOoxQBCcjYFtx
	dRcsftathaGlZZ+iyMPNGUyuImMOTGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680193180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rFB1bczKoSUfxkLTehDWurRBcthSjwP2XB1p4I+TL4=;
	b=WTxPDxtfraT/lNFhdyKPumxjixhRFsfinFwb22mu9hDP9ZrSe3ndfobzqflySJ6pd8YYzb
	hj3Ddo6siiCFqzBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id B87002C141;
	Thu, 30 Mar 2023 16:19:39 +0000 (UTC)
Date: Thu, 30 Mar 2023 18:19:38 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/cpuhp: respect current SMT when adding
 new CPU
Message-ID: <20230330161938.GY3132@kitsune.suse.cz>
References: <20230213124510.12651-1-ldufour@linux.ibm.com>
 <87ilg5aahx.fsf@linux.ibm.com>
 <20230213150429.GZ19419@kitsune.suse.cz>
 <87fsb9a7zx.fsf@linux.ibm.com>
 <45989617-e6f9-0ca5-3371-571268807fc5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45989617-e6f9-0ca5-3371-571268807fc5@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Srikar Dronamraju <srikar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 30, 2023 at 05:51:57PM +0200, Laurent Dufour wrote:
> On 13/02/2023 16:40:50, Nathan Lynch wrote:
> > Michal Suchánek <msuchanek@suse.de> writes:
> >> On Mon, Feb 13, 2023 at 08:46:50AM -0600, Nathan Lynch wrote:
> >>> Laurent Dufour <ldufour@linux.ibm.com> writes:
> >>>> When a new CPU is added, the kernel is activating all its threads. This
> >>>> leads to weird, but functional, result when adding CPU on a SMT 4 system
> >>>> for instance.
> >>>>
> >>>> Here the newly added CPU 1 has 8 threads while the other one has 4 threads
> >>>> active (system has been booted with the 'smt-enabled=4' kernel option):
> >>>>
> >>>> ltcden3-lp12:~ # ppc64_cpu --info
> >>>> Core   0:    0*    1*    2*    3*    4     5     6     7
> >>>> Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
> >>>>
> >>>> There is no SMT value in the kernel. It is possible to run unbalanced LPAR
> >>>> with 2 threads for a CPU, 4 for another one, and 5 on the latest.

> Indeed, that's not so easy. There are multiple ways for the SMT level to be
> impacted:
>  - smt-enabled kernel option
>  - smtstate systemctl service (if activated), saving SMT level at shutdown
> time to restore it a boot time
>  - pseries-energyd daemon (if activated) could turn off threads
>  - ppc64_cpu --smt=x user command
>  - sysfs direct writing to turn off/on specific threads.
> 
> There is no SMT level saved, on "disk" or in the kernel, and any of these
> options can interact in parallel. So from the user space point of view, the
> best we could do is looking for the SMT current values, there could be
> multiple values in the case of a mixed SMT state, peek one value and apply it.
> 
> Extending the drmgr's hook is still valid, and I sent a patch series on the
> powerpc-utils mailing list to achieve that. However, changing the SMT level
> in that hook means that newly added CPU will be first turn on and there is
> a window where this threads could be seen active. Not a big deal but not
> turning on these extra threads looks better to me.

Which means

1) add an option to not onlince hotplugged CPUs by default

2) when a tool that wants to manage CPU onlining is active it can set
the option so that no threads are onlined automatically, and online the
desired threads

3) when no such tool is active the default should be to online all
threeads to preserve compatibility with existing behavior

> That's being said, I can't see any benefit of a user space implementation
> compared to the option I'm proposing in that patch.

The userspace implementation can implement arbitrily complex policy,
that's not something that belongs into the kernel.

Thanks

Michal
