Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50A89F104
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 13:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF17h3MyHz3vbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 21:39:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF17D1nHyz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 21:38:48 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VF17B15kWz4wx6;
	Wed, 10 Apr 2024 21:38:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VF17B0HGSz4wx5;
	Wed, 10 Apr 2024 21:38:44 +1000 (AEST)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Donnellan
 <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: Make cxl obsolete
In-Reply-To: <0dd09e90-440d-46f0-827e-cbef93ce72c6@csgroup.eu>
References: <20240409031027.41587-1-ajd@linux.ibm.com>
 <20240409031027.41587-2-ajd@linux.ibm.com> <87bk6jb17s.fsf@mail.lhotse>
 <0dd09e90-440d-46f0-827e-cbef93ce72c6@csgroup.eu>
Date: Wed, 10 Apr 2024 21:38:44 +1000
Message-ID: <87o7aha1mj.fsf@mail.lhotse>
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
Cc: "fbarrat@linux.ibm.com" <fbarrat@linux.ibm.com>, "ukrishn@linux.ibm.com" <ukrishn@linux.ibm.com>, "manoj@linux.ibm.com" <manoj@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/04/2024 =C3=A0 06:37, Michael Ellerman a =C3=A9crit=C2=A0:
>> Andrew Donnellan <ajd@linux.ibm.com> writes:
>>> The cxl driver is no longer actively maintained and we intend to remove=
 it
>>> in a future kernel release. Change its status to obsolete, and update t=
he
>>> sysfs ABI documentation accordingly.
>>>
>>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>>> ---
>>>   Documentation/ABI/{testing =3D> obsolete}/sysfs-class-cxl | 3 +++
>>>   MAINTAINERS                                             | 4 ++--
>>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>>   rename Documentation/ABI/{testing =3D> obsolete}/sysfs-class-cxl (99%)
>>=20
>> This is a good start, but I suspect if there are any actual users they
>> are not going to be monitoring the status of cxl in the MAINTAINERS file=
 :)
>>=20
>> I think we should probably modify Kconfig so that anyone who's using cxl
>> on purpose has some chance to notice before we remove it.
>>=20
>> Something like the patch below. Anyone who has an existing config and
>> runs oldconfig will get a prompt, eg:
>>=20
>>    Deprecated support for IBM Coherent Accelerators (CXL) (DEPRECATED_CX=
L) [N/m/y/?] (NEW)
>>=20
>> Folks who just use defconfig etc. won't notice any change which is a
>> pity. We could also change the default to n, but that risks breaking
>> someone's machine. Maybe we do that in a another releases time.
>
> When I boot one of my boards I see:
>
> [    0.641090] mcr3000-hwmon 10000800.hwmon: hwmon_device_register() is=20
> deprecated. Please convert the driver to use=20
> hwmon_device_register_with_info().
>
> Could we do something similar, write a message at boottime when the CXL=20
> driver gets probed ?

Yeah, I think so.

There's still the problem that people tend not to look at dmesg until
something breaks, but at least we can try and get their attention.

cheers
