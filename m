Return-Path: <linuxppc-dev+bounces-3585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9A9DA489
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 10:12:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XytxK5Gzsz2xrb;
	Wed, 27 Nov 2024 20:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732698725;
	cv=none; b=QbswaI+aPMGuuBZtEO1P9xLGvLGGv4dGIIVsmaR39kdlzv3PfLuPDqmNk16XCsZ0lFVHeIQSkBFCezqgx+8UkR+lPEV4rzYaVuChW1VskQ1pzSkOBNwL4+pdL7+94GZ7fvEbav5nZTgejm0MZBX4Si4uKLMo4Q9PlJy9GEu1TiMtYWPPS8lK3OwFvIOWvbchpQ06p1EhFpls5vVqOhRlC76VPgihGlC7i/jSl3dPt81/oE9qXGU6qAqQuuGIRubKyis8VZSRJgkqpL0ZkELh5Zt9O7OAc3GlI2NtBI7/+YmxLh4u4qnxMvg+g2nvFOh0FB73Wn9qV27dK+jSxc3urw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732698725; c=relaxed/relaxed;
	bh=iTUMnUmlMWQoEAV5H8D0LRBR1OUskbgU1dQNFzouUa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0sYC5siFag20LgKxcjiqewgAybCrVexjPKU2PnktCRTQaqBtY8CRyg9ybb0iyf7kv+qzIWn04QueG1wAaUrs7dEv4/r0TnY+J73D7dlcJDUUT4F8LNif0iBmuprY3Uz5HXKKKK0qaRW3jKVm2USwoIeITAljgTMaukrMhPu/epMob60LTU8ExVGBgTNYXU0glyemq4t12aUVIYYSXJL92RYbcakXXeTkZNAlRyWee2Oy9IK3c5A6bIUMi60t+YB5pn8wTStWc78xRtV3cA8KWGZ6HE7bpvLy6D+uLjccg6bhwS1rpg1u0EoTIqZiDnOulYM5ONiPUgn8VBFHIn+MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MyQAkR2S; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yBnLBQGq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MyQAkR2S; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yBnLBQGq; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MyQAkR2S;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yBnLBQGq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MyQAkR2S;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yBnLBQGq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XytxG5mcYz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 20:12:01 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E5E11F76C;
	Wed, 27 Nov 2024 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732698714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTUMnUmlMWQoEAV5H8D0LRBR1OUskbgU1dQNFzouUa4=;
	b=MyQAkR2SZ5iqnEflfBqpbxefN8blCQbKvuYI7A6Fl/gYfpXIL+wQ3U430E5Jsj5QmOOmIf
	YypBQ7ZXIDQVahYV4mlNDUtKmvwJQMZaWAUWr4vo5oLMsBH2WVd4q2cXVBv+qVukXxy1HX
	lf00wgXhAK/EGnrmsO9MkDpT6MBsRNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732698714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTUMnUmlMWQoEAV5H8D0LRBR1OUskbgU1dQNFzouUa4=;
	b=yBnLBQGqiqgRqaHZX+BEWFPMO+0y7mzDZ0ynPgrB0sDUC8uq6P5HHH3EHCEitRyqA1az9M
	9o9EL20po5qzysAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732698714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTUMnUmlMWQoEAV5H8D0LRBR1OUskbgU1dQNFzouUa4=;
	b=MyQAkR2SZ5iqnEflfBqpbxefN8blCQbKvuYI7A6Fl/gYfpXIL+wQ3U430E5Jsj5QmOOmIf
	YypBQ7ZXIDQVahYV4mlNDUtKmvwJQMZaWAUWr4vo5oLMsBH2WVd4q2cXVBv+qVukXxy1HX
	lf00wgXhAK/EGnrmsO9MkDpT6MBsRNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732698714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTUMnUmlMWQoEAV5H8D0LRBR1OUskbgU1dQNFzouUa4=;
	b=yBnLBQGqiqgRqaHZX+BEWFPMO+0y7mzDZ0ynPgrB0sDUC8uq6P5HHH3EHCEitRyqA1az9M
	9o9EL20po5qzysAA==
Date: Wed, 27 Nov 2024 10:11:53 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Haren Myneni <haren@linux.ibm.com>
Cc: mahesh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	npiggin@gmail.com, maddy@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character driver
 for dump retrieval
Message-ID: <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
References: <20241124052040.239813-1-haren@linux.ibm.com>
 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
 <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 26, 2024 at 12:40:20PM -0800, Haren Myneni wrote:
> On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar wrote:
> > On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> > [...]
> > > +static ssize_t papr_platform_dump_handle_read(struct file *file,
> > > +		char __user *buf, size_t size, loff_t *off)
> > > +{
> > > +	struct ibm_platform_dump_params *params = file->private_data;
> > > +	u64 total_bytes;
> > > +	s32 fwrc;
> > > +
> > > +	/*
> > > +	 * Dump already completed with the previous read calls.
> > > +	 * In case if the user space issues further reads, returns
> > > +	 * -EINVAL.
> > > +	 */
> > > +	if (!params->buf_length) {
> > > +		pr_warn_once("Platform dump completed for dump ID
> > > %llu\n",
> > > +			(u64) (((u64)params->dump_tag_hi << 32) |
> > > +				params->dump_tag_lo));
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (size < SZ_1K) {
> > > +		pr_err_once("Buffer length should be minimum 1024
> > > bytes\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The hypervisor returns status 0 if no more data available to
> > > +	 * download. Then expects the last RTAS call with NULL buffer
> > > +	 * to invalidate the dump which means dump will be freed in the
> > > +	 * hypervisor.
> > > +	 */
> > > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > > +		params->buf_length = 0;
> > > +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> > > +		/*
> > > +		 * Returns 0 (success) to the user space so that user
> > > +		 * space read stops.
> > 
> > Does this implicitly invalidates the dump irrespective of whether
> > userspace has requested or not ?
> 
> No, the RTAS call from the last read() will invalidate the dump. Expect
> the user space make the read() until returns 0 which means the last
> read() will return 0 after invalidate the dump. 
> 
> size_t read() 
> {
>    if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
>            RTAS call to invalidate dump
>            return 0;
>    }
>    get the data from RTAS call
>    If the RTAS call return status is DUMP_COMPLETE
>              params->status = RTAS_IBM_PLATFORM_DUMP_COMPLETE
>    return bytes_written
> }
> 
> If the RTAS call returns DUMP_COMPLETE, the hypervisor expects one more
> RTAS call to invalidate the dump which is done as part of the last
> read()
> 
> > 
> > Copy-pasting bellow code snippet from librtas side patch posted by
> > you to
> > librtas-devel mailing list:
> > + /*
> > + * rtas_platform_dump() is called with buf = NULL and length = 0
> > + * for "dump complete" RTAS call to invalidate dump.
> > + * For kernel interface, read() will be continued until the
> > + * return value = 0. Means kernel API will return this value only
> > + * after issued "dump complete" call. So nothing to do further
> > + * for the last RTAS call.
> > + */
> > + if (buffer == NULL)
> > + return 0;
> > 
> > If I understand this correctly, it looks like calling
> > rtas_platform_dump() with buf = NULL and length = 0, now does
> > nothing.
> Following the same read() ABI - expects to make calls until returns
> size 0.
>
> The current usage of rtas_platform_dump() in ppc64-
> diag/rtas_errd/extract_platdump.c
> 
> dump_complete = rtas_platform_dump(dump_tag, 0, dump_buf, DUMP_BUF_SZ,
>                                         &seq_next, &bytes);
> 
> while (dump_complete) {
> 
>    dump_complete = rtas_platform_dump(dump_tag, seq, dump_buf,
>  				DUMP_BUF_SZ, &seq_next, &bytes);
>                                 
> }
> 
> ret = rtas_platform_dump(dump_tag, seq, NULL, 0, 
>                                 &seq_next, &bytes);
> 
> we need to support both new and old interfaces and not changing the
> above code which uses librtas API.
> 
> So the new rtas_platform_dump() interface
> {
>  if the buffer == NULL 
>      return - nothing to do here. Dump is invalidated with the previous
> rtas_platform_dump()   
>  
>  size = read()
>  if size == 0 
>       dump complete and invalidate the dump
>       return 0
> 
>   return 1;
> }

No EOF?

So no standard file handling code can use this FD?

But also the size 0 read both indicates the EOF and invalidates the
dump, these should be separate.

Which differs from the hypervisor API that makes it impossible to save
the dump without deleting it, and introduces a regression.

If you are doing IOCTLs anyway the invalidation could be an IOCTL. Or
you could really follow the RTAS ABI and only incalidate if the user
passes NULL and 0.

But more generally the previously added RTAS wrappers do not closely
follow the RTAS ABI, and do accumulation of read data in the kernel,
passing the whole buffer to userspace afterwards.

Why cannot it be done in this case?

Even more generally if the dump IDs are stable these could be listed in
some sysfs or debugfs directory, and provide standard file operations,
including unlink() to remove the dump.

With the bonus that at least one of these filesystems has some
provisions for confidentiality lockdown. The implementation could use
that to make the dumps unavailable in confidentiality lockdown level if
the dumps are considered confidential without reimplementing the check.

Thanks

Michal

