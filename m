Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC978EC65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 13:45:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=izPsRN9A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+OsiQYYJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbzqp4ZmMz3by9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 21:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=izPsRN9A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+OsiQYYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbzpt2lk2z303p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 21:44:37 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 3C9FB1F747;
	Thu, 31 Aug 2023 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693482274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MHHnHgrEAT7SU+B47p021T79kiscFAM8uW21D1uVpo=;
	b=izPsRN9AjY0e+4GjlvewrGqzdLstuQTlPM5RErtWPR+2XctWYigMZwE8E0pAdYxA8pWq2N
	g75ULSTR9sbpIcmbDYtU7DvZyoGA1P4mYgzWUuUeMwjtbThxTMt+W6X5BZ0YO99/7o/Gh6
	7RL/vXNSd/O8IfUSCoGyPKT+r6VEwgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693482274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MHHnHgrEAT7SU+B47p021T79kiscFAM8uW21D1uVpo=;
	b=+OsiQYYJUKnv6TdxKkxo7u5M8u1kIp1oQVJxWoOPwos6JfOUw0cbs3cgOgPpNx+doDEDUR
	uoEt805UoUFGAGBg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 90C9C2C142;
	Thu, 31 Aug 2023 11:44:33 +0000 (UTC)
Date: Thu, 31 Aug 2023 13:44:31 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
Message-ID: <20230831114431.GH8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz>
 <8734zz3hci.fsf@mail.lhotse>
 <20230831103811.GF8826@kitsune.suse.cz>
 <87r0nj1lzr.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0nj1lzr.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 31, 2023 at 09:37:12PM +1000, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Thu, Aug 31, 2023 at 03:34:37PM +1000, Michael Ellerman wrote:
> >> Michal Suchánek <msuchanek@suse.de> writes:
> >> > On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wrote:
> >> >> From: Nathan Lynch <nathanl@linux.ibm.com>
> >> >> 
> >> >> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
> >> >> components using the ibm,get-vpd RTAS function.
> >> >> 
> >> >> We can expose this to user space with a /dev/papr-vpd character
> >> >> device, where the programming model is:
> >> >> 
> >> >>   struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
> >> >>   int devfd = open("/dev/papr-vpd", O_WRONLY);
> >> >>   int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
> >> >>   size_t size = lseek(vpdfd, 0, SEEK_END);
> >> >>   char *buf = malloc(size);
> >> >>   pread(devfd, buf, size, 0);
> >> >> 
> >> >> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
> >> >> the file contains the result of a complete ibm,get-vpd sequence. The
> >> >
> >> > Could this be somewhat less obfuscated?
> >> >
> >> > What the caller wants is the result of "ibm,get-vpd", which is a
> >> > well-known string identifier of the rtas call.
> >> 
> >> Not really. What the caller wants is *the VPD*. Currently that's done
> >> by calling the RTAS "ibm,get-vpd" function, but that could change in
> >> future. There's RTAS calls that have been replaced with a "version 2" in
> >> the past, that could happen here too. Or the RTAS call could be replaced
> >> by a hypercall (though unlikely).
> >> 
> >> But hopefully if the underlying mechanism changed the kernel would be
> >> able to hide that detail behind this new API, and users would not need
> >> to change at all.
> >> 
> >> > Yet this identifier is never passed in. Instead we have this new
> >> > PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific to
> >> > this call only as is the /dev/papr-vpd device name, another new
> >> > identifier.
> >> >
> >> > Maybe the interface could provide a way to specify the service name?
> >> >
> >> >> file contents are immutable from the POV of user space. To get a new
> >> >> view of VPD, clients must create a new handle.
> >> >
> >> > Which is basically the same as creating a file descriptor with open().
> >> 
> >> Sort of. But much cleaner becuase you don't need to create a file in the
> >> filesystem and tell userspace how to find it.
> >
> > You very much do. There is the /dev/papr-vpd and PAPR_VPD_CREATE_HANDLE
> > which userspace has to know about, the PAPR_VPD_CREATE_HANDLE is not
> > even possible to find at all.
> 
> Well yeah you need the device itself :)

And as named it's specific to this call, and new devices will be needed
for any additional rtas called implemented.

> 
> And yes the ioctl is defined in a header, not in the filesystem, but
> that's entirely normal for an ioctl based API.

Of course, because the ioctl API has no safe way of passing a string
identifier for the function. Then it needs to create these obscure IDs.

Other APIs that don't have this problem exist.

Thanks

Michal
