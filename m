Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B079128B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 09:50:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=V0P94YmB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I31yd+Ta;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfLQH2Tyxz3btq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 17:49:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=V0P94YmB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I31yd+Ta;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfLPQ2K3sz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 17:49:13 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 82A4C1F892;
	Mon,  4 Sep 2023 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693813716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcE11iaCJGwMeFr61ni8PMScazteO6GKmBlkpABTtrg=;
	b=V0P94YmBiGsGr4t5IESYBdrBJ/hKU45khJOM1tf34xqrWa6Da+kwP0EtwiWHA2CjhiYu0I
	Eodo8sBeVOuou8KkUAfXfN4+kHxciT5gz/mul4MIfT1wCZz5z1QV+nVHuCGC2v29acIPkv
	d9IW4AywNLzpmuJ081CNAKjw5FuGt1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693813716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcE11iaCJGwMeFr61ni8PMScazteO6GKmBlkpABTtrg=;
	b=I31yd+TaT+i7JU89GmQqP9Yw1Uwhq7HgG+7WdQmJLytT/zxAGX9MJKPaK5+A1TpPXCccfc
	6ilMSyhYNpa/KKCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 65CA92C142;
	Mon,  4 Sep 2023 07:48:36 +0000 (UTC)
Date: Mon, 4 Sep 2023 09:48:35 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
Message-ID: <20230904074835.GO8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz>
 <8734zz3hci.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734zz3hci.fsf@mail.lhotse>
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

On Thu, Aug 31, 2023 at 03:34:37PM +1000, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > Hello,
> >
> > thanks for working on this.
> >
> > On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wrote:
> >> From: Nathan Lynch <nathanl@linux.ibm.com>
> >> 
> >> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
> >> components using the ibm,get-vpd RTAS function.
> >> 
> >> We can expose this to user space with a /dev/papr-vpd character
> >> device, where the programming model is:
> >> 
> >>   struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
> >>   int devfd = open("/dev/papr-vpd", O_WRONLY);
> >>   int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
> >>   size_t size = lseek(vpdfd, 0, SEEK_END);
> >>   char *buf = malloc(size);
> >>   pread(devfd, buf, size, 0);
> >> 
> >> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
> >> the file contains the result of a complete ibm,get-vpd sequence. The
> >
> > Could this be somewhat less obfuscated?
> >
> > What the caller wants is the result of "ibm,get-vpd", which is a
> > well-known string identifier of the rtas call.
> 
> Not really. What the caller wants is *the VPD*. Currently that's done
> by calling the RTAS "ibm,get-vpd" function, but that could change in
> future. There's RTAS calls that have been replaced with a "version 2" in
> the past, that could happen here too. Or the RTAS call could be replaced
> by a hypercall (though unlikely).
> 
> But hopefully if the underlying mechanism changed the kernel would be
> able to hide that detail behind this new API, and users would not need
> to change at all.

With the device named rtas-vpd it's clearly tied to rtas.

If 'version 2' of the call happens it's more likely than not going to
have new data format because limit of current format was reached. Then
emulating that old call with the new one would be counterproductive or
impossible.

Even if the same data is available through different call there is no
problem. If the user really used the well-known "ibm,get-vpd" identifier
documented in the specification then the kernel can translate it
internally to whatever new method for obtaining the data exists. The
current revisions of the specification are not going to go away, and the
identifier is still well-known and documented, even if newer revisions
of the platform use different way to provide the data to the kernel.

Sure, with the current syscall interface it would not work because the
user translates this well-known identifier into a function token, and
passes that to the kernel. With that if the "ibm,get-vpd" is gone the
kernel cannot provide the data anymore.

That was done to make it possible to call functions that were not yet
known when the kernel was written. This is no longer allowed, and the
kernel has functionality for translating function names to tokens for
the functions it does know about. Then it can do the translation for
userspace as well, and when the call is implemented differently in the
future abstract that detail away.

> > Yet this identifier is never passed in. Instead we have this new
> > PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific to
> > this call only as is the /dev/papr-vpd device name, another new
> > identifier.
> >
> > Maybe the interface could provide a way to specify the service name?
> >
> >> file contents are immutable from the POV of user space. To get a new
> >> view of VPD, clients must create a new handle.
> >
> > Which is basically the same as creating a file descriptor with open().
> 
> Sort of. But much cleaner becuase you don't need to create a file in the
> filesystem and tell userspace how to find it.

Instead, you create a device in the filesystem, and assign an IOCTL, and
need to tell the userspace how to find both.

> 
> This pattern of creating file descriptors from existing file descriptors
> to model a hiearachy of objects is well established in eg. the KVM and
> DRM APIs.

Yet there is no object hierarchy to speak of here. There is one device
with one ioctl on it. The device name is tied to this specific call so a
different call will need both a new device and new IOCTL.

> 
> > Maybe creating a directory in sysfs or procfs with filenames
> > corresponding to rtas services would do the same job without extra
> > obfuscation?
> 
> It's not obfuscation, it's abstraction. The kernel talks to firmware to
> do things, and provides an API to user space. Not all the details of how
> the firmware works are relevant to user space, including the exact
> firmware calls required to implement a certain feature.

Well, it's not static data, it's a call. There might be different ways
to go around passing the arguments in and getting the results out.

Hiding the buffer management and chunking of the resulting data is an
abstraction, great.

Hiding the translation of well-known function name to the
system-specific token is an abstraction, great.

Translating the rtas error codes to well-known error codes specified in
errno.h is an abstraction, great.

Replacing the well-known function name defined in the specification with
Linux-specific device name and IOCLT number is not an abstraction. It's
more abstract than the system-specific function token but it's less
abstract than the well-known name defined by the specification.

Thanks

Michal
