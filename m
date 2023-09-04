Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C07911FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 09:21:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C0Mf8wbU;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v48ti8b0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfKnX4Zwqz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 17:21:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C0Mf8wbU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v48ti8b0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfKmd392Rz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 17:20:49 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 742A41F38D;
	Mon,  4 Sep 2023 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693812039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9A67NxvEX2h1/v4+LUuiZ01h0Et7i6T5mGr4ReHF0Zc=;
	b=C0Mf8wbUEB/IfKwTL86n88Qcww1W7e0Px1gU9UlWm57TYSFs0NSlc/ehZYWv1TV57hqpQ5
	rBTY8Cuix7pDbYLfAvOWqgMRdNHF1u2XKIw7YNtBW9RtnK5fR4gD+v8fiR13BwJVHZOYGV
	OwvvQUiiZtFXBIFYifJvAXGUNDOqGOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693812039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9A67NxvEX2h1/v4+LUuiZ01h0Et7i6T5mGr4ReHF0Zc=;
	b=v48ti8b0W9Ye60VIVNTQm1Wn4UJR8HxabewwnCCG1TV7Pg1pUpNPLsxje8Pjo4n0COQw+X
	itdT4U15Ux9KPTAQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id AB5322C142;
	Mon,  4 Sep 2023 07:20:38 +0000 (UTC)
Date: Mon, 4 Sep 2023 09:20:37 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
Message-ID: <20230904072037.GN8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz>
 <8734zz3hci.fsf@mail.lhotse>
 <20230831103811.GF8826@kitsune.suse.cz>
 <87r0nj1lzr.fsf@mail.lhotse>
 <20230831114431.GH8826@kitsune.suse.cz>
 <875y4vytxe.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875y4vytxe.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
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

On Thu, Aug 31, 2023 at 12:59:25PM -0500, Nathan Lynch wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Thu, Aug 31, 2023 at 09:37:12PM +1000, Michael Ellerman wrote:
> >> Michal Suchánek <msuchanek@suse.de> writes:
> >> > On Thu, Aug 31, 2023 at 03:34:37PM +1000, Michael Ellerman wrote:
> >> >> Michal Suchánek <msuchanek@suse.de> writes:
> >> >> > On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wrote:
> >> >> >> From: Nathan Lynch <nathanl@linux.ibm.com>
> >> >> >> 
> >> >> >> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
> >> >> >> components using the ibm,get-vpd RTAS function.
> >> >> >> 
> >> >> >> We can expose this to user space with a /dev/papr-vpd character
> >> >> >> device, where the programming model is:
> >> >> >> 
> >> >> >>   struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
> >> >> >>   int devfd = open("/dev/papr-vpd", O_WRONLY);
> >> >> >>   int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
> >> >> >>   size_t size = lseek(vpdfd, 0, SEEK_END);
> >> >> >>   char *buf = malloc(size);
> >> >> >>   pread(devfd, buf, size, 0);
> >> >> >> 
> >> >> >> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
> >> >> >> the file contains the result of a complete ibm,get-vpd sequence. The
> >> >> >
> >> >> > Could this be somewhat less obfuscated?
> >> >> >
> >> >> > What the caller wants is the result of "ibm,get-vpd", which is a
> >> >> > well-known string identifier of the rtas call.
> >> >> 
> >> >> Not really. What the caller wants is *the VPD*. Currently that's done
> >> >> by calling the RTAS "ibm,get-vpd" function, but that could change in
> >> >> future. There's RTAS calls that have been replaced with a "version 2" in
> >> >> the past, that could happen here too. Or the RTAS call could be replaced
> >> >> by a hypercall (though unlikely).
> >> >> 
> >> >> But hopefully if the underlying mechanism changed the kernel would be
> >> >> able to hide that detail behind this new API, and users would not need
> >> >> to change at all.
> >> >> 
> >> >> > Yet this identifier is never passed in. Instead we have this new
> >> >> > PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific to
> >> >> > this call only as is the /dev/papr-vpd device name, another new
> >> >> > identifier.
> >> >> >
> >> >> > Maybe the interface could provide a way to specify the service name?
> >> >> >
> >> >> >> file contents are immutable from the POV of user space. To get a new
> >> >> >> view of VPD, clients must create a new handle.
> >> >> >
> >> >> > Which is basically the same as creating a file descriptor with open().
> >> >> 
> >> >> Sort of. But much cleaner becuase you don't need to create a file in the
> >> >> filesystem and tell userspace how to find it.
> >> >
> >> > You very much do. There is the /dev/papr-vpd and PAPR_VPD_CREATE_HANDLE
> >> > which userspace has to know about, the PAPR_VPD_CREATE_HANDLE is not
> >> > even possible to find at all.
> >> 
> >> Well yeah you need the device itself :)
> >
> > And as named it's specific to this call, and new devices will be needed
> > for any additional rtas called implemented.
> >
> >> 
> >> And yes the ioctl is defined in a header, not in the filesystem, but
> >> that's entirely normal for an ioctl based API.
> >
> > Of course, because the ioctl API has no safe way of passing a string
> > identifier for the function. Then it needs to create these obscure IDs.
> >
> > Other APIs that don't have this problem exist.
> 
> Looking at the cover letter for the series, I wonder if my framing and
> word choice is confusing? Instead of "new character devices for RTAS
> functions", what I would really like to convey is "new character devices
> for platform features that are currently only accessible through the
> rtas() syscall". But that's too long :-)

and does that really change anything?

> You (Michal) seem to favor a kernel-user ABI where user space is allowed
> to invoke arbitrary RTAS functions by name. But we already have that in
> the form of the rtas() syscall. (User space looks up function tokens by
> name in the DT.) The point of the series is that we need to move away
> from that. It's too low-level and user space has to use /dev/mem when
> invoking any of the less-simple RTAS functions.

We don't have that, directly accessing /dev/mem does not really work.
And that's what needs fixing in my view.

The rtas calls are all mechanically the same, the function implemented
here should be able to call any of them if there was a way to specify
the call.

Given that there is desire to have access to multiple calls I don't
think it makes sense to allocate a separate device with different name
for each.

The ioclt interface is not nice for this. however.

Given that different calls have different parameters having one ioctl
for all of them would be quite messy.

Still even as is the ioctl takes a string argument which is problematic
on its own.

Given that there is an argument to the call it cannot be reasonably
implemented as sysfs file, either.

That's probably why the crypto API ended up with using netlink. The
situation is very similar there: there are algorithms identified by
strings, there are parameters that vary by the algorithm, the operation
requested, and other parameters.

Unlike ioctl netlink has helpers for packing multiple fields into a
message and getting them out, on both kernel and user side. With that no
string pointers need to be passed around between kernel space and user
space, only one message buffer. Passing the buffer length and field
length is part of the protocol, and cannot be missed. When an argument
is not passed it is clearly not there, in the ioctl case it becomes
garbage.

Adding one call through netlink may require more effort than ioctl.
However, adding additional calls will be easy, especially for simpla
calls that don't take arguments.

Even if ioctls are used adding all rtas ioctls on one device at least
reduces redundancy of allocated identifiers.

Thanks

Michal
