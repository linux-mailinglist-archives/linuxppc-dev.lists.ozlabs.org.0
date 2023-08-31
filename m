Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E678D78EC25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 13:38:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GHFGJcRf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbzgG610vz3c3M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 21:38:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GHFGJcRf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbzfL6PQjz307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 21:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693481834;
	bh=NieNTG0tNzzVvsThzMeIe32E2Zx4qltnxkjiY+X1TfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GHFGJcRfI6DcZiI/v/6yEBQ3oxXE5c9i+zC3zeb0myQNDRzQO/S8gw9QgrJLyvn8e
	 KLtdbnW8dffaGXBf7MnN6bCc1lBTWBfTESSYANTETxB40SGfQ0F+9ZW4/mEz5GRzkf
	 HyJsK+248PvJWL5liVwfU4XSD5uxPTGfu82sF0Cwwq/jx8/bu3YfaSoFxAJxrvtHLe
	 fCPvXCpYir9NfrNSyQfp50HX84DvIr/mb8SsvYaZM+4Onag47+NpcPUbWzWXuRiQ9B
	 8Mt53MSWGjg6rSsaEiSY2GAF6rGCZ0ic9LOe6W+1sBIXzNWkod2YK+OuM3WF0vMkn0
	 rEVp+cU7c8fiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbzfL4JZtz4wb5;
	Thu, 31 Aug 2023 21:37:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
In-Reply-To: <20230831103811.GF8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz> <8734zz3hci.fsf@mail.lhotse>
 <20230831103811.GF8826@kitsune.suse.cz>
Date: Thu, 31 Aug 2023 21:37:12 +1000
Message-ID: <87r0nj1lzr.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Thu, Aug 31, 2023 at 03:34:37PM +1000, Michael Ellerman wrote:
>> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> > On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wr=
ote:
>> >> From: Nathan Lynch <nathanl@linux.ibm.com>
>> >>=20
>> >> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
>> >> components using the ibm,get-vpd RTAS function.
>> >>=20
>> >> We can expose this to user space with a /dev/papr-vpd character
>> >> device, where the programming model is:
>> >>=20
>> >>   struct papr_location_code plc =3D { .str =3D "", }; /* obtain all V=
PD */
>> >>   int devfd =3D open("/dev/papr-vpd", O_WRONLY);
>> >>   int vpdfd =3D ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
>> >>   size_t size =3D lseek(vpdfd, 0, SEEK_END);
>> >>   char *buf =3D malloc(size);
>> >>   pread(devfd, buf, size, 0);
>> >>=20
>> >> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
>> >> the file contains the result of a complete ibm,get-vpd sequence. The
>> >
>> > Could this be somewhat less obfuscated?
>> >
>> > What the caller wants is the result of "ibm,get-vpd", which is a
>> > well-known string identifier of the rtas call.
>>=20
>> Not really. What the caller wants is *the VPD*. Currently that's done
>> by calling the RTAS "ibm,get-vpd" function, but that could change in
>> future. There's RTAS calls that have been replaced with a "version 2" in
>> the past, that could happen here too. Or the RTAS call could be replaced
>> by a hypercall (though unlikely).
>>=20
>> But hopefully if the underlying mechanism changed the kernel would be
>> able to hide that detail behind this new API, and users would not need
>> to change at all.
>>=20
>> > Yet this identifier is never passed in. Instead we have this new
>> > PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific =
to
>> > this call only as is the /dev/papr-vpd device name, another new
>> > identifier.
>> >
>> > Maybe the interface could provide a way to specify the service name?
>> >
>> >> file contents are immutable from the POV of user space. To get a new
>> >> view of VPD, clients must create a new handle.
>> >
>> > Which is basically the same as creating a file descriptor with open().
>>=20
>> Sort of. But much cleaner becuase you don't need to create a file in the
>> filesystem and tell userspace how to find it.
>
> You very much do. There is the /dev/papr-vpd and PAPR_VPD_CREATE_HANDLE
> which userspace has to know about, the PAPR_VPD_CREATE_HANDLE is not
> even possible to find at all.

Well yeah you need the device itself :)

And yes the ioctl is defined in a header, not in the filesystem, but
that's entirely normal for an ioctl based API.

cheers
