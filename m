Return-Path: <linuxppc-dev+bounces-3797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C979E402E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 17:57:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Nws6ckSz2yjb;
	Thu,  5 Dec 2024 03:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733331437;
	cv=none; b=nsDJYbfQb6cfLTYZn3hQZEqyna//0/A7GmoPF38xjF9wjiXZSek/gtla3qhIpPQVILFE6mroHBYYqLnkvXR7F7DcszEjzWYVWsSBdnFsq1drWIzZ3dClWcgww7M8tNiR+KIjIVdFwooj6FsDnAy4MkTBEvVKaNwLoN5GKJbQhn/YoDmSMPIV5lHj1mF2Zw8zzug6g1C3RZdUSuX3SL3+vnCtA5yIKmKNSgDCLvICGdm/R6J/VQGfokkoCd7kURBw05AJtczCQ4FHHcURqCg9ZDkj7/2/Yr5zw1B/252NTKV+zrNphgh0PCZoquw5oeQcsqxvlL1Bly2wyi7WHlQT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733331437; c=relaxed/relaxed;
	bh=gRrUTUB3h/BxDSnnO4oNA+JpoziJFwjK6p8oMLFnMG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU8bnrBqpeJpXgs9Gd3XD/EGj6roj4idmUGkvAYgz3GRpdNvSO/C9lDx3N3DPisOuWjUGgLe6QxSWrbFycq/ysxB6CIQ1jFkM9EX+wU5OSQbc9U4HSin5i3jB89E9x67TQGUJ2ne5p1mRdCA6PiSsj1T1zI92gHC+KacSNiHW5q+RM/v1/P3oTtk9WjuENv9CT6K5+XYTUT0IvX0Nvepbr/QPSec8L208JrYEQgZx/MPddwTHW57ZWij7vYFdy1aa5Jaxy0V/f6i0bgtj2nIhyJNo85IV+i7Urv7YJccX5pOG+VXCki3/cSpYd9Idp65UWo7yoPVMuE++xMcZrqzTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gbc/fETX; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/ife4VoH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gbc/fETX; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/ife4VoH; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gbc/fETX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/ife4VoH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gbc/fETX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/ife4VoH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Nwp2vzNz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 03:57:13 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 705A4219BF;
	Wed,  4 Dec 2024 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733331425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRrUTUB3h/BxDSnnO4oNA+JpoziJFwjK6p8oMLFnMG8=;
	b=gbc/fETXHyrFb/ah3qqe9rF9WJubzqryfYA3YdhboJ683Iks4DBM5GpGLWblYcw3RhQL0q
	WBrQN3iRqLLZ0dx1XIZgoPCLP4DUBLER+BDT5ffaUl9nMh8JgA6iufbiDdcRlSyMWI9iVp
	XBxe+CZQormugEhqmZGNwGGjuf1exKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733331425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRrUTUB3h/BxDSnnO4oNA+JpoziJFwjK6p8oMLFnMG8=;
	b=/ife4VoHThF5jeA5FhwYi7279sHQJX5UZRAkGMy8kPugLFZgu37C1K0lbyPsu/9GDwqUGe
	v6tuyhREdfhVxJBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733331425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRrUTUB3h/BxDSnnO4oNA+JpoziJFwjK6p8oMLFnMG8=;
	b=gbc/fETXHyrFb/ah3qqe9rF9WJubzqryfYA3YdhboJ683Iks4DBM5GpGLWblYcw3RhQL0q
	WBrQN3iRqLLZ0dx1XIZgoPCLP4DUBLER+BDT5ffaUl9nMh8JgA6iufbiDdcRlSyMWI9iVp
	XBxe+CZQormugEhqmZGNwGGjuf1exKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733331425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRrUTUB3h/BxDSnnO4oNA+JpoziJFwjK6p8oMLFnMG8=;
	b=/ife4VoHThF5jeA5FhwYi7279sHQJX5UZRAkGMy8kPugLFZgu37C1K0lbyPsu/9GDwqUGe
	v6tuyhREdfhVxJBA==
Date: Wed, 4 Dec 2024 17:57:04 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Haren Myneni <haren@linux.ibm.com>
Cc: mahesh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	npiggin@gmail.com, maddy@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character driver
 for dump retrieval
Message-ID: <Z1CJ4NuO3gUdqUY4@kitsune.suse.cz>
References: <20241124052040.239813-1-haren@linux.ibm.com>
 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
 <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
 <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
 <dc4e922325c2000cc90555d4fe936e57b779c935.camel@linux.ibm.com>
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
In-Reply-To: <dc4e922325c2000cc90555d4fe936e57b779c935.camel@linux.ibm.com>
X-Spam-Score: -4.30
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
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com,us.ibm.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:40:05PM -0800, Haren Myneni wrote:
> On Wed, 2024-11-27 at 10:11 +0100, Michal Suchánek wrote:
> > On Tue, Nov 26, 2024 at 12:40:20PM -0800, Haren Myneni wrote:
> > > On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar wrote:
> > > > On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> > > > [...]
> > > > > +static ssize_t papr_platform_dump_handle_read(struct file
> > > > > *file,
> > > > > +		char __user *buf, size_t size, loff_t *off)
> > > > > +{
> > > > > +	struct ibm_platform_dump_params *params = file-
> > > > > >private_data;
> > > > > +	u64 total_bytes;
> > > > > +	s32 fwrc;
> > > > > +
> > > > > +	/*
> > > > > +	 * Dump already completed with the previous read calls.
> > > > > +	 * In case if the user space issues further reads,
> > > > > returns
> > > > > +	 * -EINVAL.
> > > > > +	 */
> > > > > +	if (!params->buf_length) {
> > > > > +		pr_warn_once("Platform dump completed for dump
> > > > > ID
> > > > > %llu\n",
> > > > > +			(u64) (((u64)params->dump_tag_hi << 32)
> > > > > |
> > > > > +				params->dump_tag_lo));
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	if (size < SZ_1K) {
> > > > > +		pr_err_once("Buffer length should be minimum
> > > > > 1024
> > > > > bytes\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * The hypervisor returns status 0 if no more data
> > > > > available to
> > > > > +	 * download. Then expects the last RTAS call with NULL
> > > > > buffer
> > > > > +	 * to invalidate the dump which means dump will be
> > > > > freed in the
> > > > > +	 * hypervisor.
> > > > > +	 */
> > > > > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > {
> > > > > +		params->buf_length = 0;
> > > > > +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> > > > > +		/*
> > > > > +		 * Returns 0 (success) to the user space so
> > > > > that user
> > > > > +		 * space read stops.
> > > > 
> > > > Does this implicitly invalidates the dump irrespective of whether
> > > > userspace has requested or not ?
> > > 
> > > No, the RTAS call from the last read() will invalidate the dump.
> > > Expect
> > > the user space make the read() until returns 0 which means the last
> > > read() will return 0 after invalidate the dump. 
> > > 
> > > size_t read() 
> > > {
> > >    if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > >            RTAS call to invalidate dump
> > >            return 0;
> > >    }
> > >    get the data from RTAS call
> > >    If the RTAS call return status is DUMP_COMPLETE
> > >              params->status = RTAS_IBM_PLATFORM_DUMP_COMPLETE
> > >    return bytes_written
> > > }
> > > 
> > > If the RTAS call returns DUMP_COMPLETE, the hypervisor expects one
> > > more
> > > RTAS call to invalidate the dump which is done as part of the last
> > > read()
> > > 
> > > > Copy-pasting bellow code snippet from librtas side patch posted
> > > > by
> > > > you to
> > > > librtas-devel mailing list:
> > > > + /*
> > > > + * rtas_platform_dump() is called with buf = NULL and length = 0
> > > > + * for "dump complete" RTAS call to invalidate dump.
> > > > + * For kernel interface, read() will be continued until the
> > > > + * return value = 0. Means kernel API will return this value
> > > > only
> > > > + * after issued "dump complete" call. So nothing to do further
> > > > + * for the last RTAS call.
> > > > + */
> > > > + if (buffer == NULL)
> > > > + return 0;
> > > > 
> > > > If I understand this correctly, it looks like calling
> > > > rtas_platform_dump() with buf = NULL and length = 0, now does
> > > > nothing.
> > > Following the same read() ABI - expects to make calls until returns
> > > size 0.
> > > 
> > > The current usage of rtas_platform_dump() in ppc64-
> > > diag/rtas_errd/extract_platdump.c
> > > 
> > > dump_complete = rtas_platform_dump(dump_tag, 0, dump_buf,
> > > DUMP_BUF_SZ,
> > >                                         &seq_next, &bytes);
> > > 
> > > while (dump_complete) {
> > > 
> > >    dump_complete = rtas_platform_dump(dump_tag, seq, dump_buf,
> > >  				DUMP_BUF_SZ, &seq_next, &bytes);
> > >                                 
> > > }
> > > 
> > > ret = rtas_platform_dump(dump_tag, seq, NULL, 0, 
> > >                                 &seq_next, &bytes);
> > > 
> > > we need to support both new and old interfaces and not changing the
> > > above code which uses librtas API.
> > > 
> > > So the new rtas_platform_dump() interface
> > > {
> > >  if the buffer == NULL 
> > >      return - nothing to do here. Dump is invalidated with the
> > > previous
> > > rtas_platform_dump()   
> > >  
> > >  size = read()
> > >  if size == 0 
> > >       dump complete and invalidate the dump
> > >       return 0
> > > 
> > >   return 1;
> > > }
> > 
> > No EOF?
> 
> read() returns size, 0 or < 0. Returns 0 is like EOF. 

Indeed, looks like the special EOF value is only added by libc, sorry
about the noise.

> > So no standard file handling code can use this FD?
> 
> Yes, providing support for FD from ioctl for the following reasons:
> 
> - get-vpd char driver is providing only for FD from ioctl. So thought
> of using same interface for platform-dump so that having consitent
> interface for all RTAS function char drivers. 
> 
> - file->private_data is assigned to miscdevice in misc_register and
> also assigned to some other miscdevice struct in driver specific code.
> So was thinking of not following semantics in the existing code if I
> private_data to save internal param struct.
> 
> Please let me know if you prefer to use FD from open() for platform-
> dump read().

There is no way to specify the dump id with open() of the character
device. So for open() other mechanism would have to be used, such as
sysfs/debugfs which can list the IDs as filenames, or something similar.

> > But also the size 0 read both indicates the EOF and invalidates the
> > dump, these should be separate.
> > 
> > Which differs from the hypervisor API that makes it impossible to
> > save
> > the dump without deleting it, and introduces a regression.
> 
> The hypervisor API says to invalidate the dump after saving it. In the
> current interface it does - The user space makes the last read() (for
> return 0) after saving the complete dump. 
> 
> All read() calls return size (> 0) == RTAS calls for dump
> read() expects return 0 == same RTAS invalidate dump
> 
> So the only difference is if the user does not call to invalidate dump
> explicitly even though saved the dump, but we do not have the current
> usage, Only the extract-dump command is the only usage now and please
> note that this command is used for non-HMC manages system. It is not
> used on HMC managed system which has its own command gets the dump
> directly from the hypervisor.    

However, the hypervisor does provide the option to read the dump without
invalidating it.

At the very least this option is useful for testing. Not making it a
separate call makes it needlessly difficult for people testing the
feature.

If as you say this is used exclusively by extract-dump, and it already
calls an IOCTL to obtain a FD it can call another IOCTL on it to do the
invalidation. There is hte corner case that the kernel might need to
finish the reading of the dump on its own if the userspace did not to
perform the IOCTL, or return an error if the dump is not fully read yet.

> > If you are doing IOCTLs anyway the invalidation could be an IOCTL. Or
> > you could really follow the RTAS ABI and only incalidate if the user
> > passes NULL and 0.
> 
> I could use this ioctl interface to invalidate the dump.
> 
> devfd = ioctl(fd ..) for dump ID
> read(devfd)
> ret = ioctl(devfd ...) to invalidate dump 
> 
> I will make changes if you are OK with this interface

Yes, for the ioctl interface this looks like a better option.

> > But more generally the previously added RTAS wrappers do not closely
> > follow the RTAS ABI, and do accumulation of read data in the kernel,
> > passing the whole buffer to userspace afterwards.
> > 
> > Why cannot it be done in this case?
> 
> platform-dump RTAS returns more data unlike in get-vpd. In one case
> noticed 3G data which is not the ideal case to save in the kernel
> buffer within ioctl. 
> 
> Also platform-dump RTAS function supports interleave calls for multiple
> dump IDs at the same time unlike in get-vpd case.

It would be nice to document why this call is incompatible with the
existing implementations somewhere in the commit message or a comment.

> > Even more generally if the dump IDs are stable these could be listed
> > in
> > some sysfs or debugfs directory, and provide standard file
> > operations,
> > including unlink() to remove the dump.
> 
> dump IDs are not stable. The hypervisor can have several dumps with
> different IDs at the same time. so unlink() can not be used.

I mean stable in the sense that same dump corresponds always to the same
ID. Not in the sense that new dumps cannot be addded, and old removed.

It is indeed unclear what is the lifecycle of these dump IDs, and how
they are created, and how the userspace is obtaining them.

Thanks

Michal

> > With the bonus that at least one of these filesystems has some
> > provisions for confidentiality lockdown. The implementation could use
> > that to make the dumps unavailable in confidentiality lockdown level
> > if
> > the dumps are considered confidential without reimplementing the
> > check.
> 
> We are adding new driver (interfaces) to support lockdown. Otherwise
> the current usage is sufficient. But we could modify to restrict the
> interface for confidentiality lockdown in future if we have that
> restriction.
> 
> Thanks
> Haren
> 
> > 
> > Thanks
> > 
> > Michal
> 

