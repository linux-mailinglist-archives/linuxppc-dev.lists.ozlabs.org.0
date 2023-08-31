Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234578EC21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 13:36:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UF3L/Qvw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GXWjUDpU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbzdJ1RBNz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 21:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UF3L/Qvw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GXWjUDpU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbzcP2Rgpz303p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 21:35:32 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 37CD42185A;
	Thu, 31 Aug 2023 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693481729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6MX7PW+1n+B/o2Itfvqj8gySQ2KC8/I/7WQRX5hGAs=;
	b=UF3L/QvwwIt+vPZq4etLR0uzpuWmFeC/rOQIAeUDfZw0amPVFxorLdQTOqhrpuA7IkPE5g
	IE9kCvZDDvwYiBTHfJFJ+GgOi++RQ1Qxdv/xeT7LT188JZz45pXFrDFpZUSQckU5VRyHZV
	KMfB8PvxzbUg9hMEfaTgBvFjLdg7gnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693481729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6MX7PW+1n+B/o2Itfvqj8gySQ2KC8/I/7WQRX5hGAs=;
	b=GXWjUDpUIdeztpAphFkD3NgYN2MiZ0R6wdOpb+vl2e09IybmlsLR8S5/emTdC+VOwfwGiU
	efGT3eojnOkTVwBw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 1A7CC2C142;
	Thu, 31 Aug 2023 11:35:29 +0000 (UTC)
Date: Thu, 31 Aug 2023 13:35:27 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
Message-ID: <20230831113527.GG8826@kitsune.suse.cz>
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

Still the kernel could use the name that is well-known today even if it
uses different implementation internally in the future.

> 
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
> 
> This pattern of creating file descriptors from existing file descriptors
> to model a hiearachy of objects is well established in eg. the KVM and
> DRM APIs.

> 
> >> The memory required for the VPD buffers seems acceptable, around 20KB
> >> for all VPD on one of my systems. And the value of the
> >> /rtas/ibm,vpd-size DT property (the estimated maximum size of VPD) is
> >> consistently 300KB across various systems I've checked.
> >> 
> >> I've implemented support for this new ABI in the rtas_get_vpd()
> >> function in librtas, which the vpdupdate command currently uses to
> >> populate its VPD database. I've verified that an unmodified vpdupdate
> >> binary generates an identical database when using a librtas.so that
> >> prefers the new ABI.
> >> 
> >> Likely remaining work:
> >> 
> >> * Handle RTAS call status -4 (VPD changed) during ibm,get-vpd call
> >>   sequence.
> >> * Prevent ibm,get-vpd calls via rtas(2) from disrupting ibm,get-vpd
> >>   call sequences in this driver.
> >> * (Maybe) implement a poll method for delivering notifications of
> >>   potential changes to VPD, e.g. after a partition migration.
> >
> > That sounds like something for netlink. If that is desired maybe it
> > should be used in the first place?
> 
> I don't see why that is related to netlink. It's entirely normal for
> file descriptor based APIs to implement poll.
> 
> netlink adds a lot of complexity for zero gain IMO.

It kind of solves the problem with shoehorning something that's not
really a file into file descriptors. You don't have to when not using
them. It also solves how to access multiple services without creating a
large number of files and large number of obscure constants.

Thanks

Michal
