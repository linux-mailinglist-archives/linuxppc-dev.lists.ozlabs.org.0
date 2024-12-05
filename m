Return-Path: <linuxppc-dev+bounces-3821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B89E529E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 11:42:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3rYn0mnMz2y8P;
	Thu,  5 Dec 2024 21:42:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733395341;
	cv=none; b=fkW7tWg7YRJ3XtEHMbbyu3oiYgssjDqThAv29SIuSS9kRKx23rMk+agMxnfwcbZ30pVgjBis3U94zlEUR+jvNvDlqhR6e71c5X7pRomt0jtxHUflvbf9AIYfxSHOSKC3Nc4J51Hy3LIj/n953vdPcJ40TFGfwvIJLKh6PcjjJdnK+5vcYmjsWW48AA+Pp9zz3TwNEjpO4UOtMTW0Chc1GPWymn5zM8bjlyNoX13/2oHCY0rNyGhgFoYRW22rqGHXvG0Hfq4j77MhqNfJR9I2ZpIiaK6IlxddzEkvwAmQ7VdEdNKMEelUe6vNc+r0dPqjxHO2Gi7Wd9rpAhnuKpc6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733395341; c=relaxed/relaxed;
	bh=NpjbWdmxcAIXzRJx5q9vD7vDoZz87NCxOTxK+RIIF/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBdsd5vBvr69HuL1rc3n9hCODFAMvgEjHpfQnnZyICERjjFodASAX02OXVmp7M9DDmIst691vA/yCPCxwxK3m0VmKU50oRoAO0U+qCVY9mSSKpQo6PmCIzEmlfx6o/j7JFsl7vz60tQutfSS5pbyTp3Hkr43hew9E+V0DVrvT8XVxdR2yYdgiLsr1KVLPhf9NF40IATXSpap/iUdHzlMI9QFSlc4WwRsgPkesplW4wRqyjcdaK1kj3MkcHYBUoymVyZoNMr/lUBTwDDzvcb1rjQl29veMm1EX6dUmynBuyrxqaP53HfqpmrR9uxIBlt4uiemD8EzcdKdmXy3ZOMZMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cVJahe8T; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5DDbLPL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cVJahe8T; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5DDbLPL; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cVJahe8T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5DDbLPL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cVJahe8T;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5DDbLPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3rYk1Kp7z2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 21:42:17 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22C691F38E;
	Thu,  5 Dec 2024 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733395328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpjbWdmxcAIXzRJx5q9vD7vDoZz87NCxOTxK+RIIF/I=;
	b=cVJahe8T0zfiHnZpHFeIM60hxQahgH/zWPRfOa9wRoxqZisC0YHR/Wtv/qUUKo8Pr0FwSN
	JUOZ7nPRexmb4MmWaIvaib4sQRbivmLipHBpTlH0uPP8MJDa2AIy9E1dPqzE+PTxyEKOLY
	LMARM8ShoXUC6EWZbaiFADPc4iUVWDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733395328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpjbWdmxcAIXzRJx5q9vD7vDoZz87NCxOTxK+RIIF/I=;
	b=R5DDbLPLRVr87/3z5oCebQ5WeW+ebSLjRspIPnCrt3kyhH1e+gYZFlf4SfgTjhpkBl6ezx
	orvcTyyoTuBlXbBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733395328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpjbWdmxcAIXzRJx5q9vD7vDoZz87NCxOTxK+RIIF/I=;
	b=cVJahe8T0zfiHnZpHFeIM60hxQahgH/zWPRfOa9wRoxqZisC0YHR/Wtv/qUUKo8Pr0FwSN
	JUOZ7nPRexmb4MmWaIvaib4sQRbivmLipHBpTlH0uPP8MJDa2AIy9E1dPqzE+PTxyEKOLY
	LMARM8ShoXUC6EWZbaiFADPc4iUVWDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733395328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpjbWdmxcAIXzRJx5q9vD7vDoZz87NCxOTxK+RIIF/I=;
	b=R5DDbLPLRVr87/3z5oCebQ5WeW+ebSLjRspIPnCrt3kyhH1e+gYZFlf4SfgTjhpkBl6ezx
	orvcTyyoTuBlXbBg==
Date: Thu, 5 Dec 2024 11:42:07 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Haren Myneni <haren@linux.ibm.com>
Cc: mahesh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	npiggin@gmail.com, maddy@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character driver
 for dump retrieval
Message-ID: <Z1GDf7yrwoP4Pq0l@kitsune.suse.cz>
References: <20241124052040.239813-1-haren@linux.ibm.com>
 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
 <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
 <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
 <dc4e922325c2000cc90555d4fe936e57b779c935.camel@linux.ibm.com>
 <Z1CJ4NuO3gUdqUY4@kitsune.suse.cz>
 <cb309fcf4cf5f6ced1cb00b9af42efe7412a5f4f.camel@linux.ibm.com>
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
In-Reply-To: <cb309fcf4cf5f6ced1cb00b9af42efe7412a5f4f.camel@linux.ibm.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com,us.ibm.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 06:14:06PM -0800, Haren Myneni wrote:
> On Wed, 2024-12-04 at 17:57 +0100, Michal Suchánek wrote:
> > On Mon, Dec 02, 2024 at 08:40:05PM -0800, Haren Myneni wrote:
> > > On Wed, 2024-11-27 at 10:11 +0100, Michal Suchánek wrote:
> > > > On Tue, Nov 26, 2024 at 12:40:20PM -0800, Haren Myneni wrote:
> > > > > On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar wrote:
> > > > > > On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> > > > > > [...]
> > > > > > > +static ssize_t papr_platform_dump_handle_read(struct file
> > > > > > > *file,
> > > > > > > +		char __user *buf, size_t size, loff_t *off)
> > > > > > > +{
> > > > > > > +	struct ibm_platform_dump_params *params = file-
> > > > > > > > private_data;
> > > > > > > +	u64 total_bytes;
> > > > > > > +	s32 fwrc;
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Dump already completed with the previous read calls.
> > > > > > > +	 * In case if the user space issues further reads,
> > > > > > > returns
> > > > > > > +	 * -EINVAL.
> > > > > > > +	 */
> > > > > > > +	if (!params->buf_length) {
> > > > > > > +		pr_warn_once("Platform dump completed for dump
> > > > > > > ID
> > > > > > > %llu\n",
> > > > > > > +			(u64) (((u64)params->dump_tag_hi << 32)
> > > > > > > +				params->dump_tag_lo));
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	if (size < SZ_1K) {
> > > > > > > +		pr_err_once("Buffer length should be minimum
> > > > > > > 1024
> > > > > > > bytes\n");
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * The hypervisor returns status 0 if no more data
> > > > > > > available to
> > > > > > > +	 * download. Then expects the last RTAS call with NULL
> > > > > > > buffer
> > > > > > > +	 * to invalidate the dump which means dump will be
> > > > > > > freed in the
> > > > > > > +	 * hypervisor.
> > > > > > > +	 */
> > > > > > > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > > {
> > > > > > > +		params->buf_length = 0;
> > > > > > > +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> > > > > > > +		/*
> > > > > > > +		 * Returns 0 (success) to the user space so
> > > > > > > that user
> > > > > > > +		 * space read stops.
> > > > > > 
> > > > > > Does this implicitly invalidates the dump irrespective of
> > > > > > whether
> > > > > > userspace has requested or not ?
> > > > > 
> > > > > No, the RTAS call from the last read() will invalidate the
> > > > > dump.
> > > > > Expect
> > > > > the user space make the read() until returns 0 which means the
> > > > > last
> > > > > read() will return 0 after invalidate the dump. 
> > > > > 
> > > > > size_t read() 
> > > > > {
> > > > >    if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > > > >            RTAS call to invalidate dump
> > > > >            return 0;
> > > > >    }
> > > > >    get the data from RTAS call
> > > > >    If the RTAS call return status is DUMP_COMPLETE
> > > > >              params->status = RTAS_IBM_PLATFORM_DUMP_COMPLETE
> > > > >    return bytes_written
> > > > > }
> > > > > 
> > > > > If the RTAS call returns DUMP_COMPLETE, the hypervisor expects
> > > > > one
> > > > > more
> > > > > RTAS call to invalidate the dump which is done as part of the
> > > > > last
> > > > > read()

> > > Yes, providing support for FD from ioctl for the following reasons:
> > > 
> > > - get-vpd char driver is providing only for FD from ioctl. So
> > > thought
> > > of using same interface for platform-dump so that having consitent
> > > interface for all RTAS function char drivers. 
> > > 
> > > - file->private_data is assigned to miscdevice in misc_register and
> > > also assigned to some other miscdevice struct in driver specific
> > > code.
> > > So was thinking of not following semantics in the existing code if
> > > I
> > > private_data to save internal param struct.
> > > 
> > > Please let me know if you prefer to use FD from open() for
> > > platform-
> > > dump read().
> > 
> > There is no way to specify the dump id with open() of the character
> > device. So for open() other mechanism would have to be used, such as
> > sysfs/debugfs which can list the IDs as filenames, or something
> > similar.
> 
> you mentioned about standard file handling code using FD from open. So
> I was referring to passing dump ID with ioctl as in the current patch,
> but using FD returned from open() for read() calls like:
> fd = open()
> ret =  ioctl(fd,.. dumpid)
> read(fd, buf, size)
> 
> As in get-vpd, we will have one other RTAS stream function get-indices. 

It would be much clearer if these two related functions were
implemented together.

> I will add this support later. So I am proposing same interfaces for
> RTAS functions as provided by papr-vpd so that same type of interfaces
> will be used across all RTAS functions

The proposed interface is similar but subtly different. While
papr_vpd accumulates the data in kernel and returns them in single
call, this API requires the user to call read() repeatedly to obtain
the data, unlike papr_vpd.

With the requirement to introduce a new API it can as well be designed
to fit the call in question.

> fd = open()
> devfd = ioctl(fd,.. dumpid)
> read(devfd, buf, size)    --> will just returns 0 if the previous RTAS
> call returns dump complete status. But will not invalidate the dump.
> ret = ioctl(devfd, .. dumpid) - can be used to invalidate dump as you
> suggested.  
> 
> > 
> > > > But also the size 0 read both indicates the EOF and invalidates
> > > > the
> > > > dump, these should be separate.
> > > > 
> > > > Which differs from the hypervisor API that makes it impossible to
> > > > save
> > > > the dump without deleting it, and introduces a regression.
> > > 
> > > The hypervisor API says to invalidate the dump after saving it. In
> > > the
> > > current interface it does - The user space makes the last read()
> > > (for
> > > return 0) after saving the complete dump. 
> > > 
> > > All read() calls return size (> 0) == RTAS calls for dump
> > > read() expects return 0 == same RTAS invalidate dump
> > > 
> > > So the only difference is if the user does not call to invalidate
> > > dump
> > > explicitly even though saved the dump, but we do not have the
> > > current
> > > usage, Only the extract-dump command is the only usage now and
> > > please
> > > note that this command is used for non-HMC manages system. It is
> > > not
> > > used on HMC managed system which has its own command gets the dump
> > > directly from the hypervisor.    
> > 
> > However, the hypervisor does provide the option to read the dump
> > without
> > invalidating it.
> > 
> > At the very least this option is useful for testing. Not making it a
> > separate call makes it needlessly difficult for people testing the
> > feature.
> > 
> > If as you say this is used exclusively by extract-dump, and it
> > already
> > calls an IOCTL to obtain a FD it can call another IOCTL on it to do
> > the
> > invalidation. There is hte corner case that the kernel might need to
> > finish the reading of the dump on its own if the userspace did not to
> > perform the IOCTL, or return an error if the dump is not fully read
> > yet.
> 
> kernel should not read the remaining dump if the user space did not
> issue or returns an error if the complete dump is not read. should
> leave it to the user space as it is doing now. As Mahesh pointed
> before, what if the user space gets exited for some reason in the
> middle of dump collection. 
> 
> should be same before but one more ioctl to invaldate the dump
> 
> read()
> {
>    if the status is 'dump complete' 
>          return 0;
> 
>    if the status is 'dump invalidated'
>          return -EINVAL  -- means user space issued ioctl to invalidate
> before. should not expect this but in case
> 
>    RTAS call to get the dump
>    return size;
> }
> 
> ioctl(devfd, ...) 
> {
>   if the status is 'dump complete'
>       RTAS call to invalidate dump
>       return 0;
> 
>   return -EINVAL --- expects the user space to issue this ioctl after
> read() returns 0
> }

That makes not a very nice API, though.

Also EINVAL is not exactly helpful: the call arguments are valid, the
kernel merely refused to do the remaining reads until it can perform the
invalidation according to the hypervisor API.

> > > > If you are doing IOCTLs anyway the invalidation could be an
> > > > IOCTL. Or
> > > > you could really follow the RTAS ABI and only incalidate if the
> > > > user
> > > > passes NULL and 0.
> > > 
> > > I could use this ioctl interface to invalidate the dump.
> > > 
> > > devfd = ioctl(fd ..) for dump ID
> > > read(devfd)
> > > ret = ioctl(devfd ...) to invalidate dump 
> > > 
> > > I will make changes if you are OK with this interface
> > 
> > Yes, for the ioctl interface this looks like a better option.
> 
> Thanks for your suggestion. As I mentioned above, will add this change.
> > 
> > > > But more generally the previously added RTAS wrappers do not
> > > > closely
> > > > follow the RTAS ABI, and do accumulation of read data in the
> > > > kernel,
> > > > passing the whole buffer to userspace afterwards.
> > > > 
> > > > Why cannot it be done in this case?
> > > 
> > > platform-dump RTAS returns more data unlike in get-vpd. In one case
> > > noticed 3G data which is not the ideal case to save in the kernel
> > > buffer within ioctl. 
> > > 
> > > Also platform-dump RTAS function supports interleave calls for
> > > multiple
> > > dump IDs at the same time unlike in get-vpd case.
> > 
> > It would be nice to document why this call is incompatible with the
> > existing implementations somewhere in the commit message or a
> > comment.
> 
> I think mentioned about interleave calls. Sure will update in comments.
> 
> > 
> > > > Even more generally if the dump IDs are stable these could be
> > > > listed
> > > > in
> > > > some sysfs or debugfs directory, and provide standard file
> > > > operations,
> > > > including unlink() to remove the dump.
> > > 
> > > dump IDs are not stable. The hypervisor can have several dumps with
> > > different IDs at the same time. so unlink() can not be used.
> > 
> > I mean stable in the sense that same dump corresponds always to the
> > same
> > ID. Not in the sense that new dumps cannot be addded, and old
> > removed.
> > 
> > It is indeed unclear what is the lifecycle of these dump IDs, and how
> > they are created, and how the userspace is obtaining them.
> 
> Dump IDs can be 64bit value and so I think they may not be reused.
> Whenever the hypervisor has the dump ot if the user initiates the dump
> with BMC interface, notifies to the partition with the dump ID and
> automatically executes extract_platdump command.  

So the reason you can get away with not implementing get-indices is that
the dump ID is passed in an event that invokes saving the dump.

That should perhaps be documented as well.

Also it does sound like get-indices together with these dump reading
functions would work with a filesystem API with readdir returning the
get-indices, and then the filename in open() or unlink() giving the dump
ID.

It's not really a problem if dump IDs are reused over time, it's also
possible to delete a file, and create one with the same name later. What
would be a problem for this is if get-indices gave different results
each time even without the available dumps changing.

However, it would make unlink() quite inefficient requiring to read the
dump a second time.

Also if the only known tool used for reading dumps always reads the dump
once and then invalidates it repeated dump reading may trigger not yet
encountered hyperviisor bugs.

Thanks

Michal

> 
> We should be OK Since using ioctl to invalidate
> 
> fd = open()
> devfd = ioctl(fd,.. dumpid)
> read(devfd, buf, size)
> ret = ioctl(devfd, .. dumpid)
> 
> Will implement the above change. Please let me know if you have any
> concerns. 
> 
> Thanks
> Haren
> 
> > 
> > Thanks
> > 
> > Michal
> > 
> > > > With the bonus that at least one of these filesystems has some
> > > > provisions for confidentiality lockdown. The implementation could
> > > > use
> > > > that to make the dumps unavailable in confidentiality lockdown
> > > > level
> > > > if
> > > > the dumps are considered confidential without reimplementing the
> > > > check.
> > > 
> > > We are adding new driver (interfaces) to support lockdown.
> > > Otherwise
> > > the current usage is sufficient. But we could modify to restrict
> > > the
> > > interface for confidentiality lockdown in future if we have that
> > > restriction.
> > > 
> > > Thanks
> > > Haren
> > > 
> > > > Thanks
> > > > 
> > > > Michal
> 

