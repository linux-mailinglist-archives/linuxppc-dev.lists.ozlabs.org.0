Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E25657979BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:20:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zP/xuzxa;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rR29qpV+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQwt5D8Kz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:20:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zP/xuzxa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rR29qpV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQvr3mTYz3dF1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 03:19:20 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id E52F71F7AB;
	Thu,  7 Sep 2023 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694107148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DTTBcxZxx2+0NlMD3L5gVt6o3uH4fSxQ8xU9A1Qtgs=;
	b=zP/xuzxa8CG4UJUz6dq8raZGILPN0wqt2MPIyPcRzMi27wg+JMxkJ3G7UBJ59u2X4UHs9J
	y7exoOAfmIXUMG+XE37+By+5gu1iwU/FQ9ObfPF4B8NH33M5Oi6EwU6WG3kj2mwx9vR3y8
	PBE4ZJJXsk5cCpAYtOmWlxbTmduPWd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694107148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DTTBcxZxx2+0NlMD3L5gVt6o3uH4fSxQ8xU9A1Qtgs=;
	b=rR29qpV+SE1U5AeH6ml7KVMTw+D4FbsE1ds90dHLWiOgNGm9Nmc4N36CX75XT4bOxyNfll
	dzwcDq1nvNbZArDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id AEE442C142;
	Thu,  7 Sep 2023 17:19:08 +0000 (UTC)
Date: Thu, 7 Sep 2023 19:19:07 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH RFC] powerpc/rtas: Make it possible to disable sys_rtas
Message-ID: <20230907171907.GC8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230906120855.28331-1-msuchanek@suse.de>
 <87bkefw0ws.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20230907160134.GZ8826@kitsune.suse.cz>
 <878r9ivsbn.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878r9ivsbn.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 07, 2023 at 11:52:44AM -0500, Nathan Lynch wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Wed, Sep 06, 2023 at 02:34:59PM -0500, Nathan Lynch wrote:
> >> Michal Suchanek <msuchanek@suse.de> writes:
> >> 
> >> > Additional patch suggestion to go with the rtas devices:
> >> >
> >> > -----------------------------------------------------------------------
> >> >
> >> > With most important rtas functions available through different
> >> > interfaces the sys_rtas interface can be disabled completely.
> >> >
> >> > Do not remove it for now to make it possible to run older versions of
> >> > userspace tools that don't support other interfaces.
> >> 
> >> Thanks. I hope making sys_rtas on/off-configurable will make sense
> >> eventually, and I expect this series to get us closer to that. But to me
> >> it seems too early and too coarse. A kernel built with RTAS_SYSCALL=n is
> >> not something I'd want to support or run in production soon. It would
> >> break too many known use cases, and likely some unknown ones as well.
> >
> > There are about 3 known use cases that absolutely need access by other
> > means than sys_rtas to work with lockdown, and about other 3 that would
> > work either way.
> 
> How do you figure that? I count 11 librtas APIs that use work areas (and
> therefore /dev/mem) that are definitely broken under lockdown. Maybe a
> couple of them are unused.

I am referring to this list of known uses:

https://github.com/ibm-power-utilities/librtas/issues/29

rtas_get_vpd is used by lsvpd (through libvpd and librtas)
rtas_platform_dump and rtas_get_indices is used by ppc64-diag
rtas_cfg_connector is used by powerpc-utils and is planned to be
replaced by in-kernel solution

That covers the complex cases.

rtas_set_sysparm is used by ppc64-diag and powerpc-utils
rtas_set_dynamic_indicator, rtas_get_dynamic_sensor are used by
ppc64-diag (related to rtas_get_indices)
rtas_errinjct + open/close are used by powerpc-utils

That's the simple cases.

Additional discussion here https://github.com/linuxppc/issues/issues/252

> > That's not so staggering that it could not be implemented in the kernel
> > from the start.
> > How long it will take for the known userspace users to catch up is
> > anotehr questio but again it's something that can be addressed.
> >
> > Making it possible to turn off sys_rtas will make it easier to uncover
> > the not yet known cases.
> 
> This is also true of making the configuration more granular than on or
> off. You would be free to disallow all calls if desired.
> 
> > What people want to support depends a lot on what is converted, and also
> > the situation of the distribution in question. Fast-rollong
> > distributions may want only the new interface quite soon, and so may
> > distributions that are starting development of new release.
> >
> > All this makes sense only if there is a plan to discontinue sys_rtas
> > entirely. For the simple calls that don't need data buffers it's still
> > usable.
> 
> I don't understand. How would it remain usable for the simple calls if
> it can be completely disabled?

Either the goal is to completely remove sys_rtas, and then an option for
disabling it is helpful for uncovering unexpected problems. Or thre
isn't a goal of sys_rtas removal, and then there is no point in having
an option to disable it, and it can be used for calls that don't need
buffers indefinitely.

Thanks

Michal
