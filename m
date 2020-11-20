Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F3E2BA9C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 13:03:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcwDC1GCvzDqST
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 23:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.242;
 helo=mslow2.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccw4k5QbXzDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 22:56:36 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 0C2113AE6CF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 11:43:24 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AE8DE240009;
 Fri, 20 Nov 2020 11:42:47 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:42:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 23/23] mtd: devices: powernv_flash: Add function
 names to headers and fix 'dev'
Message-ID: <20201120124246.4aee04d6@xps13>
In-Reply-To: <20201120075000.GA1869941@dell>
References: <20201109182206.3037326-24-lee.jones@linaro.org>
 <20201119210716.25046-1-miquel.raynal@bootlin.com>
 <20201120075000.GA1869941@dell>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Lee Jones <lee.jones@linaro.org> wrote on Fri, 20 Nov 2020 07:50:00
+0000:

> On Thu, 19 Nov 2020, Miquel Raynal wrote:
>=20
> > On Mon, 2020-11-09 at 18:22:06 UTC, Lee Jones wrote: =20
> > > Fixes the following W=3D1 kernel build warning(s):
> > >=20
> > >  drivers/mtd/devices/powernv_flash.c:129: warning: Cannot understand =
 * @mtd: the device
> > >  drivers/mtd/devices/powernv_flash.c:145: warning: Cannot understand =
 * @mtd: the device
> > >  drivers/mtd/devices/powernv_flash.c:161: warning: Cannot understand =
 * @mtd: the device
> > >  drivers/mtd/devices/powernv_flash.c:184: warning: Function parameter=
 or member 'dev' not described in 'powernv_flash_set_driver_info'
> > >=20
> > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Cc: Richard Weinberger <richard@nod.at>
> > > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: linux-mtd@lists.infradead.org
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org> =20
> >=20
> > Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.gi=
t nand/next, thanks. =20
>=20
> Superstar.  Thanks for your help Miquel.
>=20

haha :) well it was late, I applied these patches to the wrong branch,
I just moved them to the mtd/next branch, sorry for the push -f :)

Cheers,
Miqu=C3=A8l
