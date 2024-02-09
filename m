Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABA84F935
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 17:05:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tSuRJbRu;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dtz6Rf5O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tSuRJbRu;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dtz6Rf5O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWdxJ2llwz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 03:05:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tSuRJbRu;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dtz6Rf5O;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tSuRJbRu;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dtz6Rf5O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jbohac@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 533 seconds by postgrey-1.37 at boromir; Sat, 10 Feb 2024 03:04:59 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWdwW19wRz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 03:04:58 +1100 (AEDT)
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id F22BD1F812;
	Fri,  9 Feb 2024 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1707494162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIwSyfS9URKJTNUQOckxGb9czB6AcK30gHimJxb1yGY=;
	b=tSuRJbRukpa8YnCVtte0KI3Z7pGuORUBW2HU2Due1v13Ij3yxndobnREEIqMXNruSbIsc5
	Oe3yf4Tol2wPA7o6r35fPV+RU6j1fhvNp3EHJpYPyY2zpzPhSbTnCOfSYukxUxJ9PJinPJ
	ibDT32qYVvwpfwIFwOl5MvASSVIaZ1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1707494162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIwSyfS9URKJTNUQOckxGb9czB6AcK30gHimJxb1yGY=;
	b=dtz6Rf5O/sWz8YAjDMw4LqyoHPNka6Z7Ug4M3Wv7w0v3DJPhsUDW73LrciUS0GMfShXX2B
	Y3isnOvtqHwqt2Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1707494162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIwSyfS9URKJTNUQOckxGb9czB6AcK30gHimJxb1yGY=;
	b=tSuRJbRukpa8YnCVtte0KI3Z7pGuORUBW2HU2Due1v13Ij3yxndobnREEIqMXNruSbIsc5
	Oe3yf4Tol2wPA7o6r35fPV+RU6j1fhvNp3EHJpYPyY2zpzPhSbTnCOfSYukxUxJ9PJinPJ
	ibDT32qYVvwpfwIFwOl5MvASSVIaZ1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1707494162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIwSyfS9URKJTNUQOckxGb9czB6AcK30gHimJxb1yGY=;
	b=dtz6Rf5O/sWz8YAjDMw4LqyoHPNka6Z7Ug4M3Wv7w0v3DJPhsUDW73LrciUS0GMfShXX2B
	Y3isnOvtqHwqt2Dw==
Date: Fri, 9 Feb 2024 16:56:01 +0100
From: Jiri Bohac <jbohac@suse.cz>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Re: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto core 0 if >=
 nr_cpu_ids
Message-ID: <ZcZLEe1mQHXvh44Y@dwarf.suse.cz>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
 <20231229120107.2281153-5-mpe@ellerman.id.au>
 <87cyukny0j.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyukny0j.fsf@kernel.org>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.10 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 MID_RHS_MATCH_FROMTLD(0.00)[];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ellerman.id.au,lists.ozlabs.org,gmail.com,redhat.com,linux.ibm.com];
	 BAYES_HAM(-0.00)[16.58%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.10
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Pingfan Liu <piliu@redhat.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 02, 2024 at 10:16:04AM +0530, Aneesh Kumar K.V wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> 
> ....
> 
> >  #ifdef CONFIG_PPC64
> >  int boot_cpu_hwid = -1;
> > @@ -492,12 +493,26 @@ void __init smp_setup_cpu_maps(void)
> >  			avail = !of_property_match_string(dn,
> >  					"enable-method", "spin-table");
> >  
> > -		cpu = assign_threads(cpu, nthreads, avail, intserv);
> > +		if (boot_core_hwid >= 0) {
> > +			if (cpu == 0) {
> > +				pr_info("Skipping CPU node %pOF to allow for boot core.\n", dn);
> > +				cpu = nthreads;
> > +				continue;
> > +			}
> >  
> > -		if (cpu >= nr_cpu_ids) {
> > +			if (be32_to_cpu(intserv[0]) == boot_core_hwid) {
> > +				pr_info("Renumbered boot core %pOF to logical 0\n", dn);
> > +				assign_threads(0, nthreads, avail, intserv);
> > +				of_node_put(dn);
> > +				break;
> >
> 
> I was expecting a 'continue' here. Why 'break' the loop? The condition that
> should break the loop should be cpu >= nr_cpu_ids 

No, the patch seems correct:

We're in the "if (boot_core_hwid >= 0)" branch, meaning that it
was determined by early_init_dt_scan_cpus() that boot_cpuid >=
nr_cpu_ids. So we loop until we get to the boot CPU, so it can be
renumbered to 0. Once we do that we break, because we
know we are already past nr_cpu_ids - otherwise boot_core_hwid
would not be >= 0. 


> > +			}
> > +		} else if (cpu >= nr_cpu_ids) {
> >  			of_node_put(dn);
> >  			break;
> >  		}

Here is what you expected - in case the boot CPU was < nr_cpu_ids
we break as soon as nr_cpu_ids is reached.

> > +
> > +		if (cpu < nr_cpu_ids)

this ensures that CPUs between nr_cpu_ids and the boot CPU are
correctly ignored in case we're already past nr_cpu_ids and only
scanning further to find the boot CPU to be renumbered to 0

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

