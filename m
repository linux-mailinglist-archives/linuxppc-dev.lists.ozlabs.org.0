Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0478E5CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 07:35:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CfUlB1K0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbqcv5ryZz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 15:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CfUlB1K0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbqc10M8Kz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:34:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693460080;
	bh=SwSBRbC6mjZkvJoDun8+bKfr+tZQhaLtalluXzs6Duc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CfUlB1K0DqQKJM9OJoUKQ11aQKqJSNGJ6/7Y2KXUqbVaBPXkYCWCtO1xdZCihRxuh
	 yuJX6+R8J6AJ9PzMi7e3TpKe7h/o3Or4FWAkqaiH98nKk8aQDVPfCzf14IRPS0n6yE
	 VVha7HbRtCxsy3PYUcyIXhSKX/dZ/bAd6AVJeL+e4gIi6VVqiXx73ntI+pXV8Mm8MT
	 RZQtfG+Y6wNPQGLeufqffF79ntoILWTc2QcOOXv1tB2GQsXD6yt0ETcu3AcrGtPSHP
	 zB4VNL+oTQuxSzAHJkxZCS3HXw0DgKG/iJyCel8MzmyNr/LYMhs036827sgCJYAByk
	 z1mdSi79NFoXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rbqc069cyz4wy6;
	Thu, 31 Aug 2023 15:34:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 nathanl@linux.ibm.com
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
In-Reply-To: <20230830072801.GC8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz>
Date: Thu, 31 Aug 2023 15:34:37 +1000
Message-ID: <8734zz3hci.fsf@mail.lhotse>
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> thanks for working on this.
>
> On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wrote:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>=20
>> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
>> components using the ibm,get-vpd RTAS function.
>>=20
>> We can expose this to user space with a /dev/papr-vpd character
>> device, where the programming model is:
>>=20
>>   struct papr_location_code plc =3D { .str =3D "", }; /* obtain all VPD =
*/
>>   int devfd =3D open("/dev/papr-vpd", O_WRONLY);
>>   int vpdfd =3D ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
>>   size_t size =3D lseek(vpdfd, 0, SEEK_END);
>>   char *buf =3D malloc(size);
>>   pread(devfd, buf, size, 0);
>>=20
>> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
>> the file contains the result of a complete ibm,get-vpd sequence. The
>
> Could this be somewhat less obfuscated?
>
> What the caller wants is the result of "ibm,get-vpd", which is a
> well-known string identifier of the rtas call.

Not really. What the caller wants is *the VPD*. Currently that's done
by calling the RTAS "ibm,get-vpd" function, but that could change in
future. There's RTAS calls that have been replaced with a "version 2" in
the past, that could happen here too. Or the RTAS call could be replaced
by a hypercall (though unlikely).

But hopefully if the underlying mechanism changed the kernel would be
able to hide that detail behind this new API, and users would not need
to change at all.

> Yet this identifier is never passed in. Instead we have this new
> PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific to
> this call only as is the /dev/papr-vpd device name, another new
> identifier.
>
> Maybe the interface could provide a way to specify the service name?
>
>> file contents are immutable from the POV of user space. To get a new
>> view of VPD, clients must create a new handle.
>
> Which is basically the same as creating a file descriptor with open().

Sort of. But much cleaner becuase you don't need to create a file in the
filesystem and tell userspace how to find it.

This pattern of creating file descriptors from existing file descriptors
to model a hiearachy of objects is well established in eg. the KVM and
DRM APIs.

> Maybe creating a directory in sysfs or procfs with filenames
> corresponding to rtas services would do the same job without extra
> obfuscation?

It's not obfuscation, it's abstraction. The kernel talks to firmware to
do things, and provides an API to user space. Not all the details of how
the firmware works are relevant to user space, including the exact
firmware calls required to implement a certain feature.

>> This design choice insulates user space from most of the complexities
>> that ibm,get-vpd brings:
>>=20
>> * ibm,get-vpd must be called more than once to obtain complete
>>   results.
>> * Only one ibm,get-vpd call sequence should be in progress at a time;
>>   concurrent sequences will disrupt each other. Callers must have a
>>   protocol for serializing their use of the function.
>> * A call sequence in progress may receive a "VPD changed, try again"
>>   status, requiring the client to start over. (The driver does not yet
>>   handle this, but it should be easy to add.)
>
> That certainly reduces the complexity of the user interface making it
> much saner.

Yes :)

>> The memory required for the VPD buffers seems acceptable, around 20KB
>> for all VPD on one of my systems. And the value of the
>> /rtas/ibm,vpd-size DT property (the estimated maximum size of VPD) is
>> consistently 300KB across various systems I've checked.
>>=20
>> I've implemented support for this new ABI in the rtas_get_vpd()
>> function in librtas, which the vpdupdate command currently uses to
>> populate its VPD database. I've verified that an unmodified vpdupdate
>> binary generates an identical database when using a librtas.so that
>> prefers the new ABI.
>>=20
>> Likely remaining work:
>>=20
>> * Handle RTAS call status -4 (VPD changed) during ibm,get-vpd call
>>   sequence.
>> * Prevent ibm,get-vpd calls via rtas(2) from disrupting ibm,get-vpd
>>   call sequences in this driver.
>> * (Maybe) implement a poll method for delivering notifications of
>>   potential changes to VPD, e.g. after a partition migration.
>
> That sounds like something for netlink. If that is desired maybe it
> should be used in the first place?

I don't see why that is related to netlink. It's entirely normal for
file descriptor based APIs to implement poll.

netlink adds a lot of complexity for zero gain IMO.

cheers
