Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867ED81C6B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 09:35:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=l7enKWkO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxLFw1VB3z3cDy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 19:35:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=l7enKWkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxLF13Kb6z30dn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 19:34:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1703234054; x=1734770054;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ik9crkT0XTZ3SsD0fxNTR3pdx9l+an8Ix+Qa0YkNTG8=;
  b=l7enKWkOV0rHyGMtw+QeXnG0Vnd8+IbF0ulEuaigC61q1948hkFXIDe5
   96UlfpXXuE4uPzGzv2y/0yxjLYj5LsHLB3MsfjRWyYz0n4FQxXfQY22jS
   W1QCMzc/aQt3tccXiZ9KwHm55PjGkXEFYlHlFP1bXDWVOi0/ZZZxBBU51
   OkPpvN5JbXqwTd9oGrbhYuXq558TWpzhO18AF30fwt5N+0EjTnOP4Q6u5
   4kzGHx/AYpxF16WEwFPLpuEGR/BeWcoTWWsd4A+XZuOjxKhge3r7PjE1p
   N5UHah3nAAsHdaEclJnRoEVTppyjPanuUXnXWnQICRKfKQG1pNQc2gtTz
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,294,1695679200"; 
   d="scan'208";a="34649508"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Dec 2023 09:34:07 +0100
Received: from [192.168.2.128] (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 80332280075;
	Fri, 22 Dec 2023 09:34:06 +0100 (CET)
Message-ID: <ced9897c5db7ea22313d58ba95590e634e98e54b.camel@ew.tq-group.com>
Subject: Re: [PATCH] powerpc/6xx: set High BAT Enable flag on G2 cores
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 22 Dec 2023 09:34:06 +0100
In-Reply-To: <875y0rkpe1.fsf@mail.lhotse>
References: <20231221124538.159706-1-matthias.schiffer@ew.tq-group.com>
	 <875y0rkpe1.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-12-22 at 12:16 +1100, Michael Ellerman wrote:
> Matthias Schiffer <matthias.schiffer@ew.tq-group.com> writes:
> > MMU_FTR_USE_HIGH_BATS is set for G2-based cores (G2_LE, e300cX), but th=
e
> > high BATs need to be enabled in HID2 to work. Add register definitions
> > and introduce a G2 variant of __setup_cpu_603.
> >=20
> > This fixes boot on CPUs like the MPC5200B with STRICT_KERNEL_RWX enable=
d.
>=20
> Nice find.
>=20
> Minor nit on naming. The 32-bit code mostly uses the numeric names, eg.
> 603, 603e, 604 etc. Can we stick with that, rather than using "G2"?
>=20
> Wikipedia says G2 =3D=3D 603e. But looking at your patch you're not chang=
ing
> all the 603e cores, so I guess it's not that clear cut?
>=20
> If using "G2" makes the most sense then it would be nice to update
> Documentation/arch/powerpc/cpu_families.rst to mention it (not asking
> you to do it necessarily, more a note for us).

According to the 603e manual I could find (MPR603EUM-01), the HID2 register=
 does not exist in the
original 603e cores - the register was only added by Freescale in its exten=
ded implementations.

The manual of the MPC5200 calls its core an "e300", but that seems to be an=
 older implementation
than the "e300c[1-4]" cores described in the "e300" manual. I'm not sure if=
 "e300" (without "cX")
and "G2_LE" are synonymous.

So AFAIR either "G2" or "e300" could be an appropriate name for the family,=
 but which is better I
can't say.

Regards,
Matthias




>=20
> cheers

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
