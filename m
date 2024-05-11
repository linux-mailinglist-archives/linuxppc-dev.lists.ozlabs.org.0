Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A18C31A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 15:32:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=MJytqCsm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vc69W3Zw3z3cYx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 23:31:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=MJytqCsm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 225 seconds by postgrey-1.37 at boromir; Sat, 11 May 2024 23:31:17 AEST
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vc68j5KTCz30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 23:31:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4lYGUWOcK9HX3JPe4znKDDjJTqzGzxpbCmSdvA07oks=; t=1715434278; x=1716039078; 
	b=MJytqCsm25qSmEvgNDZBCVSAHgVk8Ms+FjgkF1QgTdiWttB9amVR/TqSaO7ZkSceZEWW29uP5Da
	h8t+y1aMNHJk0UnQD3n/DewlgbJlLsM2O5R7pouqWY+whItAdU10PnOfizBfsorHgDsps+m7unUut
	M/rvHUdeqaiyZQvj7ibpzBda60pPzCOak6HysoI6xkZERWNhHa2quGYNCqN8Y3WWE5jWdEuC4KP8q
	9gDhvib1q21buB4jDCSvdeZrtmY7729EQ6gRufUF+ybvjmGBWvIP//nwc/4lhJRCFehuaS6B1al0r
	M+yEe3Zv1rs23ejZsdxJIT2R5/pXsLMlrvmw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1s5ml1-00000002q1a-3xm2; Sat, 11 May 2024 15:27:23 +0200
Received: from dynamic-078-055-008-036.78.55.pool.telefonica.de ([78.55.8.36] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1s5ml1-00000001eR2-36nv; Sat, 11 May 2024 15:27:23 +0200
Message-ID: <54da4e8f76d0eca5c0780c9fbd1760b8115dfaa4.camel@physik.fu-berlin.de>
Subject: Re: Boot failure with ppc64 port on iMacs G5
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>, tuxayo <victor@tuxayo.net>
Date: Sat, 11 May 2024 15:27:23 +0200
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
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 78.55.8.36
X-ZEDAT-Hint: PO
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Claudia Neumann <dr.claudia.neumann@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, 2024-03-06 at 12:57 +1100, Michael Ellerman wrote:
> > p, the second, older image works as expected. However, the recent one d=
oes not
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

Here is a freshly generated image using kernel 6.7.12 as the installer kern=
el:

> https://cdimage.debian.org/cdimage/ports/tests/ppc64-test-20240511/debian=
-12.0.0-ppc64-NETINST-1.iso

Still hangs for me with QEMU emulating a PPC970.

Will retest once kernel 6.8.x enters Debian unstable.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
