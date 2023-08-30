Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB278D398
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 09:30:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a7iPapvR;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VRb/XPyy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbGCm6rsXz3bv9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 17:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a7iPapvR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VRb/XPyy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbGBs6BRWz2xqw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 17:29:25 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2A4AA21857;
	Wed, 30 Aug 2023 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693380551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RDKL3FVR0q+3mrYHwwsm4NJ+Qv2pWJE5r9SemDUWx8=;
	b=a7iPapvR0AMqUYR8z7J3NwjG1qnBeWgQ8v7gDMgkHdXRoF+OqT0wRh2JvYKcrp5R/01VUI
	EQKXFa5j2Gw4dTAZQ8sOexRIar59hrde4JLfUHgksXGmaZusR61ZpN9oQd+hhwDBS27Bzv
	uL5d+jRehDdG1QlpfiIs3fOHDK2VYWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693380551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RDKL3FVR0q+3mrYHwwsm4NJ+Qv2pWJE5r9SemDUWx8=;
	b=VRb/XPyyZbjXqcB1w2q2t6NDgsoHsxg/4kv4MfGj6WL+77gGh9ahWKz6AVCnllUtA1/X8x
	S1JB9MprdX+eZrCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 501C32C142;
	Wed, 30 Aug 2023 07:29:10 +0000 (UTC)
Date: Wed, 30 Aug 2023 09:29:09 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: nathanl@linux.ibm.com
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
Message-ID: <20230830072801.GC8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
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

Hello,

thanks for working on this.

On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
> 
> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
> components using the ibm,get-vpd RTAS function.
> 
> We can expose this to user space with a /dev/papr-vpd character
> device, where the programming model is:
> 
>   struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
>   int devfd = open("/dev/papr-vpd", O_WRONLY);
>   int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
>   size_t size = lseek(vpdfd, 0, SEEK_END);
>   char *buf = malloc(size);
>   pread(devfd, buf, size, 0);
> 
> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
> the file contains the result of a complete ibm,get-vpd sequence. The

Could this be somewhat less obfuscated?

What the caller wants is the result of "ibm,get-vpd", which is a
well-known string identifier of the rtas call.

Yet this identifier is never passed in. Instead we have this new
PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific to
this call only as is the /dev/papr-vpd device name, another new
identifier.

Maybe the interface could provide a way to specify the service name?

> file contents are immutable from the POV of user space. To get a new
> view of VPD, clients must create a new handle.

Which is basically the same as creating a file descriptor with open().

Maybe creating a directory in sysfs or procfs with filenames
corresponding to rtas services would do the same job without extra
obfuscation?

> This design choice insulates user space from most of the complexities
> that ibm,get-vpd brings:
> 
> * ibm,get-vpd must be called more than once to obtain complete
>   results.
> * Only one ibm,get-vpd call sequence should be in progress at a time;
>   concurrent sequences will disrupt each other. Callers must have a
>   protocol for serializing their use of the function.
> * A call sequence in progress may receive a "VPD changed, try again"
>   status, requiring the client to start over. (The driver does not yet
>   handle this, but it should be easy to add.)

That certainly reduces the complexity of the user interface making it
much saner.

> The memory required for the VPD buffers seems acceptable, around 20KB
> for all VPD on one of my systems. And the value of the
> /rtas/ibm,vpd-size DT property (the estimated maximum size of VPD) is
> consistently 300KB across various systems I've checked.
> 
> I've implemented support for this new ABI in the rtas_get_vpd()
> function in librtas, which the vpdupdate command currently uses to
> populate its VPD database. I've verified that an unmodified vpdupdate
> binary generates an identical database when using a librtas.so that
> prefers the new ABI.
> 
> Likely remaining work:
> 
> * Handle RTAS call status -4 (VPD changed) during ibm,get-vpd call
>   sequence.
> * Prevent ibm,get-vpd calls via rtas(2) from disrupting ibm,get-vpd
>   call sequences in this driver.
> * (Maybe) implement a poll method for delivering notifications of
>   potential changes to VPD, e.g. after a partition migration.

That sounds like something for netlink. If that is desired maybe it
should be used in the first place?

> Questions, points for discussion:
> 
> * Am I allocating the ioctl numbers correctly?
> * The only way to discover the size of a VPD buffer is
>   lseek(SEEK_END). fstat() doesn't work for anonymous fds like
>   this. Is this OK, or should the buffer length be discoverable some
>   other way?

So long as users have /rtas/ibm,vpd-size as the top bound of the data
they can receive I don't think it's critical to know the current VPD
size.

Thanks

Michal
