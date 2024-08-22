Return-Path: <linuxppc-dev+bounces-342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86495B1CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 11:37:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqJ5K63LTz2yNf;
	Thu, 22 Aug 2024 19:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=f3VCcASV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqJ5J6hzyz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:37:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ew4XJV0bOTsY5qn2+zYb5/OFku83Mlpg9puNUd46LUI=; t=1724319445; x=1724924245; 
	b=f3VCcASVjmhs8CCeTQGZiTMEY6uXSw57wH5/R0CPJ1pzuNpfz+usav8MHd49xGOCDS49y+6/CCb
	bU1GPEg+Km9ZpeIkaGf5Wnd+4CErq3RjE8FJk0N9TlbU17tj9wxFY90WDimS2f4QZ2+zNV8qBq/J5
	5HAnVRD81xaVL6LR6p7Y5MTyxaYUKNwxHKBNOLIEaOmlNIHR1PwHePz0zK0WnBVrWEFwq00HyoZtZ
	p4AG8XOBwECatbdyikNQwpzQWIjsfURXRCfauqHCdEUGX8sKxEqfUxaeONR5rwBZY35hFXEV7XiGm
	iB4gDQ/ovVsMwirI11eSrxGatX0niFsvVc6g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sh4Fi-000000011Jg-3QjS; Thu, 22 Aug 2024 11:37:10 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sh4Fi-00000003DQ3-2PLa; Thu, 22 Aug 2024 11:37:10 +0200
Message-ID: <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related
 config items
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Dave Vasilevsky <dave@vasilevsky.ca>, 
 Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
 debian-powerpc@lists.debian.org, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,  akpm@linux-foundation.org,
 ebiederm@xmission.com, hbathini@linux.ibm.com,  piliu@redhat.com,
 viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Date: Thu, 22 Aug 2024 11:37:09 +0200
In-Reply-To: <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
	 <20240124051254.67105-6-bhe@redhat.com>
	 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
	 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
X-ZEDAT-Hint: PO

Hi Baoquan,

On Thu, 2024-08-22 at 17:17 +0800, Baoquan He wrote:
> > The change to enable CONFIG_CRASH_DUMP by default apparently broke the =
boot
> > on 32-bit Power Macintosh systems which fail after GRUB with:
> >=20
> > 	"Error: You can't boot a kdump kernel from OF!"
> >=20
> > We may have to turn this off for 32-bit Power Macintosh systems.
> >=20
> > See this thread on debian-powerpc ML: https://lists.debian.org/debian-p=
owerpc/2024/07/msg00001.html
>=20
> If so, fix need be made.
>=20
> We may need change in ARCH_SUPPORTS_CRASH_DUMP of ppc, can you or anyone
> post a patch? I don't know how to identify 32-bit Power Macintosh.
>=20
> arch/powerpc/Kconfig:
> =3D=3D=3D
> config ARCH_SUPPORTS_CRASH_DUMP
>         def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>        =20
> config ARCH_SELECTS_CRASH_DUMP
>         def_bool y
>         depends on CRASH_DUMP
>         select RELOCATABLE if PPC64 || 44x || PPC_85xx
> ......
> config PHYSICAL_START
>         hex "Physical address where the kernel is loaded" if PHYSICAL_STA=
RT_BOOL
>         default "0x02000000" if PPC_BOOK3S && CRASH_DUMP && !NONSTATIC_KE=
RNEL
>         default "0x00000000"

I think the architecture does support crash dumps, but I think the kernel h=
as to
be booted from kexec in this case. Booting a kernel with CRASH_DUMP enabled=
 won't
work from Open Firmware. So, I think CRASH_DUMP should just be disabled for
PPC_BOOK3S_32 by default and users who want to use it on these systems, wil=
l have to
enable it explicitly.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

