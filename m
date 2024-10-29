Return-Path: <linuxppc-dev+bounces-2680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487A9B46F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 11:34:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd68F1Cddz2xt7;
	Tue, 29 Oct 2024 21:34:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730198093;
	cv=none; b=bwjiWSYmr2aBijRTHMfvfWmCyJojd4I2aY8W9J0vqQi2iR4hmMSoDx1jStAs4llkNjYyV++F05tJQ2lwPaLLqT5udEBIrY7mUTqMYtuIp6rYJQMHx6udBDyCsWwio3/QGkJP9E3WoOI5X9Yprp2zS5ri+VQiwU7YOPHc6wYx272CC3AMOCtuK+lFINUeLP2QXj7y28VGdF7oDFVjw9Ll06Aw4LMgjqbOy9IIZIxZE9pKH3X2gWG2TmneNaw+Mh8uXNGh9mO1ZZc+2kYJMCk/9KQpTs2+5cqzrIzYP0D83zwwgZv1AOk3f+unXlfgN/XMXfQbglkBdYv9s8yUEaibXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730198093; c=relaxed/relaxed;
	bh=2+H9NX81ixCjYAfT7N4DoTKgLlJZv3MD1n13tjXfSCM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SuHoxXfKatBiYX6y80pOcVT7w6NFwmOvlq+COJKVthF2bhVcJyO3l7nm6AKepFNWOP9sk274+r7iPzCHshIcF9/LfgHMwoLA1cphq59Up44CMHCH+xiKMk1yDiF/NMzzhiEhF52it3V1YnrLlPcmqmRHvycBbBNKr26eiQoK5oTO4axOl1o//uELOhNM26s08/mICGCx5gQ6idYNmqaxCd96ttcqhX63AOw8D7rjXQjLxYc3xG0yTCJKowX+jUhK4G3RkVa8QpxuUjbiOcOgl1qwm3OD+m1rEOqMO+TqbvRG7cm/QmGXKOzTgsWWqqZiwA3NdCpegupzAQalgFGzIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=DU62FGFl; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=DU62FGFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 249 seconds by postgrey-1.37 at boromir; Tue, 29 Oct 2024 21:34:48 AEDT
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd6883F7yz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 21:34:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2+H9NX81ixCjYAfT7N4DoTKgLlJZv3MD1n13tjXfSCM=; t=1730198088; x=1730802888; 
	b=DU62FGFls/NKQwWvfKdnduuBRLlFVPvWbZjZqP3OchUD2HZW6OtfpkfeYZvpeuadXUAAQKs++5b
	oy4AMHpoWKPde5obrt7pgDn5+JiM1w3eEzNB6WRysJOwB0N8ZOVArJHJg+C10ksAU4ZHyuLAxB28E
	KjtERb/9fYLZma6bGDz9UVn8C0/XIovazypaPdDYrgZDOvCZv10nz9uiPrzs78e2UoTZggwjAFRCW
	wJtiLwVgPuzN4JHW3WK7KEGgTCBIaLwp8mFlY8jGcffqKLaoi6aep2d8yT4SM+pgu0B11zab8qTBY
	yrpCT/bd1osMh+1z9sQVdGPkI4awOBEbk46Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5jUc-000000018h2-1TRD; Tue, 29 Oct 2024 11:30:30 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5jUc-00000002h91-0ZAr; Tue, 29 Oct 2024 11:30:30 +0100
Message-ID: <fa44eaa5610b3d7e0fe4e38f64b0634359bb0ff7.camel@physik.fu-berlin.de>
Subject: Re: Boot failure with ppc64 port on iMacs G5
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>, tuxayo <victor@tuxayo.net>
Cc: debian-powerpc@lists.debian.org, linuxppc-dev	
 <linuxppc-dev@lists.ozlabs.org>, Claudia Neumann
 <dr.claudia.neumann@gmx.de>,  Aditi Mishra <aditi@linux.ibm.com>
Date: Tue, 29 Oct 2024 11:30:29 +0100
In-Reply-To: <871q8op1g1.fsf@mail.lhotse>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
	 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
	 <87r0gvg49s.fsf@mail.lhotse>
	 <be7a1a66e9cc4789704d2c93f0b770ea391a4c28.camel@physik.fu-berlin.de>
	 <87frxag1ew.fsf@mail.lhotse>
	 <1768836b7e6895f3c2fb0cb4a01a40fee7473dd5.camel@physik.fu-berlin.de>
	 <871q8op1g1.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
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
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.78
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

On Wed, 2024-03-06 at 12:57 +1100, Michael Ellerman wrote:
> > Yep, the second, older image works as expected. However, the recent one=
 does not
> > and I have absolutely no clue why.
>=20
> I actually tested both, and both work, but then I cited the wrong one in
> my email >_<
>=20
> So at least on qemu that newer kernel is OK:
>=20
>   Preparing to boot Linux version 6.6.15-powerpc64 (debian-kernel@lists.d=
ebian.org) (gcc-13 (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debi=
an) 2.42) #1 SMP Debian 6.6.15-2 (2024-02-04)
>   ...
>   Booting Linux via __start() @ 0x0000000004800000 ...
>   Hello World !
>   smp_core99_probe
>   smp_core99_bringup_done
>   Starting system log daemon: syslogd, klogd.

Just as a heads-up: This particular issue is related to this patch in the D=
ebian kernel package:

> https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/patches/b=
ugfix/powerpc/fbdev-offb-Update-expected-device-name.patch?ref_type=3Dheads

Removing this patch unbreaks the console on PowerMac G5.

I could also reproduce this issue with the latest ppc64el image on PowerKVM=
:

> https://cdimage.debian.org/cdimage/daily-builds/daily/current/ppc64el/iso=
-cd/debian-testing-ppc64el-netinst.iso

Here is a video demonstrating the issue:

> https://people.debian.org/~glaubitz/debian-bug-1033058.mp4

And here is the corresponding bug report:

> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1085949

This issue can be easily reproduced with QEMU.

Aditi Mishra (CC'ed) is trying to reproduce the issue as well, but so far h=
as been unsuccessful.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

