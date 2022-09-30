Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D287C5F06F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3xP5msqz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:56:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=deE0d0yw;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z5r7BXce;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=deE0d0yw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z5r7BXce;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3wj3H6nz2xsL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:55:48 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 40AD021906;
	Fri, 30 Sep 2022 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1664528144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joZS8AG47mwYnMMfKilOvgBEM6dTImnAipK4P3/0Frc=;
	b=deE0d0ywX0NZeFwgxu5JECyndy4U3NwmqcsoMpONaTX4yknZ3pRf6TGx34f61B3MuJpCMg
	WPHeTNadn1HzyNW1oswIca9/OXrhJJB7/i8+qhNweTtc8TkaRZN41LBs2NQFA+vKcpChXo
	FT0YgHu8KOTXAaBVqEA6PANatyelQhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1664528144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joZS8AG47mwYnMMfKilOvgBEM6dTImnAipK4P3/0Frc=;
	b=z5r7BXcee89sLrrBUManXGpxmyBOn8SbM3UtA40kZ4qn1WDjCOfUQQ7THB9kAuYBWz1n9Z
	cWTuppx0Uu6pieAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 2591F2C178;
	Fri, 30 Sep 2022 08:55:44 +0000 (UTC)
Date: Fri, 30 Sep 2022 10:55:42 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Pass hw_cpu_id to node
 associativity HCALL
Message-ID: <20220930085542.GW28810@kitsune.suse.cz>
References: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
 <87wn9lbzcn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn9lbzcn.fsf@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Sep 29, 2022 at 05:16:40PM -0500, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > Generally the hypervisor decides to allocate a window on different
> > VAS instances. But if the user space wishes to allocate on the
> > current VAS instance where the process is executing, the kernel has
> > to pass associativity domain IDs to allocate VAS window HCALL. To
> > determine the associativity domain IDs for the current CPU, passing
> > smp_processor_id() to node associativity HCALL which may return
> > H_P2 (-55) error during DLPAR CPU event.
> >
> > This patch fixes this issue by passing hard_smp_processor_id() with
> > VPHN_FLAG_VCPU flag (PAPR 14.11.6.1 H_HOME_NODE_ASSOCIATIVITY).
> >
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> > index fe33bdb620d5..533026fd1f40 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -348,7 +348,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
> >  		 * So no unpacking needs to be done.
> >  		 */
> >  		rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
> > -				  VPHN_FLAG_VCPU, smp_processor_id());
> > +				  VPHN_FLAG_VCPU, hard_smp_processor_id());
> >  		if (rc != H_SUCCESS) {
> >  			pr_err("H_HOME_NODE_ASSOCIATIVITY error: %d\n", rc);
> >  			goto out;
> 
> Yes, it is always wrong to pass Linux CPU numbers to the hypervisor,
> which has its own numbering for hardware threads. It usually coincides
> with Linux's numbering in practice, which tends to hide bugs like this.
> 
> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

This is the code that introduces the problem, right?

Fixes: b22f2d88e435 ("powerpc/pseries/vas: Integrate API with open/close windows")

Thanks

Michal
