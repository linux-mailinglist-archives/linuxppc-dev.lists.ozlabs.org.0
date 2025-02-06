Return-Path: <linuxppc-dev+bounces-5911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D69A2B2B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 20:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpnpH4y2sz30ML;
	Fri,  7 Feb 2025 06:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738871591;
	cv=none; b=ft0s/aJL+iCZyb99p3JC57TYtRdagznnCKSQ2kynpeH+0vSV0hNPMH2ydUuyBz9fsM4rWMQ9fDvvhIZrEK6gVsYwkWwYZq4cfNa+XLwuvZPUJO5eU3N746xFRbrlmXcKRQOnDYxtu+VRuq17hElsmlgAKpVEHX/7+z2kajUVVFqVhYHQCRE2CV2dsNlFgS+kkJWsJ5zBbi45oYfv7PEv+0kTbLo9eCZwHW7LlQ4vbXDp47KoDJ7kLBpgQ1xfAW2oeS5LTbQPRUN0rclfUfZI0yLl6o7zPdC6PPPHEsP6UmTW4xPCZIMjleOZhMaf4CtIXoRPQMYL2LUoSiCtB1MzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738871591; c=relaxed/relaxed;
	bh=7JgvIAIceAwHxj2fyskGk885eH/ty9kKVu+V1n/Kkmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+VqOiirCuCtecKad9+Kx4mB0XVu5y3sRMn7cBVf6MAZkgLng+bfTpFoDp6DrDNYrUKqRLwKszCJDGA+Ah6zAySvqfyQQ4H+MR/7nl30EZTRg5UUefbc/7U88oevz3LjTytWmbaPZncxH6rSeP/IZg7F+DlqEBDtNfeNP3zd3DxsXzBfjIXEM1Gr9uESeBT0hmor/Tdmg2wmFb3gibEO4QuTy0gfAWPVBekfHj77reyYLRtp00mC6Ka7NemQMDKlLR/zpFSCGzhHs5vUbTz7LhJklVMPVzzhaLnvaM69PWHevTrQLfGaiWgu65DyN5k8NTpM6GkVgK6ThMX0G5Fyrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rZrR517e; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J3Tvfp0S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DUleIDDA; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QNSCHbGt; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rZrR517e;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J3Tvfp0S;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DUleIDDA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QNSCHbGt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpnpG3KjMz304f
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 06:53:10 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE92421163;
	Thu,  6 Feb 2025 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738871587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JgvIAIceAwHxj2fyskGk885eH/ty9kKVu+V1n/Kkmk=;
	b=rZrR517efNCOoa49s4+wv59OdAQbG4xDK/2eTkjP7jpYIHDuGJrITPmSognfa99QzzLomt
	SlUP4g5GXdjVjewFeBLmEC6fQN5OqjJXWrLsQArV3OCFtamoU7A51HMc4ahfE/JX9DvfSw
	sDrM5jZR9HJFYUNQnQirVACA1l1zslQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738871587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JgvIAIceAwHxj2fyskGk885eH/ty9kKVu+V1n/Kkmk=;
	b=J3Tvfp0SkFC5Dh3zb5qrMLBeyjN0VVlsI6Zm9PVd07FPdXKbjIYUsnSaQOWZY5g6URaqce
	VQ/N+ZanCpRpdmCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738871586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JgvIAIceAwHxj2fyskGk885eH/ty9kKVu+V1n/Kkmk=;
	b=DUleIDDAhFWAZ5P+H4QOKCGzLYMFqC6NRrox6Z0XWm5NkMjOo/Neyn26j0adwaA0zCH7Z1
	KkRR3a/hnh62Gf2sDxwwJAqMAdTdJRbrKSoetdmj2r3u3dn545m1vRJ3TNrllkTJo3jeg6
	FuEnCBB2XfcsXb3ynzYkseZ7C6jvZ8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738871586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JgvIAIceAwHxj2fyskGk885eH/ty9kKVu+V1n/Kkmk=;
	b=QNSCHbGtlKqCTrXDs81VvAdDGvSnKPmYCnn6i0QC4XdtnZ/55ST5kIExaYAuQb10pv/rHv
	K9llWdmXciremUCg==
Date: Thu, 6 Feb 2025 20:53:05 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com
Subject: Re: [PATCH v2 6/6] powerpc/pseries: Add papr-platform-dump character
 driver for dump retrieval
Message-ID: <Z6UTId3-o5HM69IY@kitsune.suse.cz>
References: <20250111003010.2147021-1-haren@linux.ibm.com>
 <20250111003010.2147021-7-haren@linux.ibm.com>
 <Z6N1pDdLbcFXg3bi@kitsune.suse.cz>
 <d9341cf39ff817e7c1a47f0f793ac6e61dd1d2fc.camel@linux.ibm.com>
 <Z6R-WEfBCBpMQpey@kitsune.suse.cz>
 <9a1b6a0accb80b2824037f93ffb120a3aabd02a5.camel@linux.ibm.com>
 <Z6TV8q-IsJ5XGOgN@kitsune.suse.cz>
 <63702395ffbbb9362a7290dc87f5504969c1a67e.camel@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63702395ffbbb9362a7290dc87f5504969c1a67e.camel@linux.ibm.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,us.ibm.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 06, 2025 at 10:34:42AM -0800, Haren Myneni wrote:
> On Thu, 2025-02-06 at 16:32 +0100, Michal Suchánek wrote:
> > On Thu, Feb 06, 2025 at 07:28:14AM -0800, Haren Myneni wrote:
> > > On Thu, 2025-02-06 at 10:18 +0100, Michal Suchánek wrote:
> > > > On Wed, Feb 05, 2025 at 11:51:19PM -0800, Haren Myneni wrote:
> > > > > On Wed, 2025-02-05 at 15:28 +0100, Michal Suchánek wrote:

> > > > > > > +
> > > > > > > +	if (params->status != RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > > +		pr_warn("Platform dump is not complete, but
> > > > > > > requested "
> > > > > > > +			"to invalidate dump for ID(%llu)\n",
> > > > > > > +			dump_tag);
> > > > > > 
> > > > > > Not sure if something should be done here or if relying on
> > > > > > translation
> > > > > > of the error from the RTAS call is advisable.
> > > > > 
> > > > > This check just diplays message in case if the user initiated
> > > > > to
> > > > > invalidate the dump without saving it completely. Then
> > > > > invalidates
> > > > > the
> > > > > dump with RTAS call and retuns the RTAS return value. 
> > > > > 
> > > > > As mentioned above, platform-dump is available only on non-HMC
> > > > > based
> > > > > systems. So invoke the collection of dump by BMC based
> > > > > interface,
> > > > > not
> > > > > widely used. I can remove this check if preferred.
> > > > 
> > > > From the previous discussion it sounds like trying to invalidate
> > > > the
> > > > dump without first reading it in full is an error.
> > > 
> > > Thanks for your suggestions.
> > > 
> > > Yes, it was doing as part of read() calls. But explicit ioctl to
> > > invalidate here. I was thinking like user space removing FD without
> > > reading or writing operation.
> > 
> > And is it possible to invalidate the dump without reading it fully
> > first?
> > 
> > If not then there is no point trying to do the call that is known to
> > fail anyway.
> 
> Generally not possible if uses librtas API rtas_platform_dump() which
> reads the dump completely and then the application calls this API
> explicitly to invalidate the dump (with buffer NULL - as doing in the
> current implementation). The current use case is extract_platdump
> command (ppc64-diag package)
> 
> extract_platdump() {   /* we are not chamging this implementation */
>  
> status = rtas_platform_dump() - initial call
> while !dump_complete {
> 	status = rtas_platform_dump()
> 	if (status < 0) failure
> 	if (status == 0) dump_complete = 1
> }
> 
> status = rtas_platform_dump() -  to invalidate dump by passing buffer =
> NULL
> 
> We should not expect using any command other than extract_platdump
> since the use case of collecting platform dump is narrow and is only on
> non-hmc based systems.
> 
> Hence added warning message if the dump is not completely read and
> invalidate the dump like removing file by mistake.
> 
> But I like your suggestion of returning an error (-EPERM) if not saved
> the dump completely.

I think EPERM is not correct in this case. It's not a problem of
permission but of incorrect state.

There are some errors around that like EBUSY or EINPROGRESS.

Thanks

Micahl

