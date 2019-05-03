Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F158612D48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 14:14:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wWJg3R6RzDqlF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 22:14:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bootlin.com
 (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wWGw4msTzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 22:12:36 +1000 (AEST)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 6C9F73AE74E
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 11:12:26 +0000 (UTC)
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9D4FF100005;
 Fri,  3 May 2019 11:11:53 +0000 (UTC)
Date: Fri, 3 May 2019 13:11:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RESEND PATCH v3 05/11] mtd: rawnand: vf610_nfc: add
 initializer to avoid -Wmaybe-uninitialized
Message-ID: <20190503131152.57b4ce25@xps13>
In-Reply-To: <CAK7LNAQH8v8_HG6-cytT4qe05W9iiYwEP1mud4zG2NxxYcFptQ@mail.gmail.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-6-yamada.masahiro@socionext.com>
 <20190502161346.07c15187@xps13>
 <CAK7LNAQH8v8_HG6-cytT4qe05W9iiYwEP1mud4zG2NxxYcFptQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390 <linux-s390@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 X86 ML <x86@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Fri, 3 May
2019 19:36:35 +0900:

> Hi Miquel,
>=20
> On Thu, May 2, 2019 at 11:14 PM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> >
> > Hi Masahiro,
> >
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 23 Apr
> > 2019 12:49:53 +0900:
> > =20
> > > This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> > > place. We need to eliminate potential issues beforehand.
> > >
> > > Kbuild test robot has never reported -Wmaybe-uninitialized warning
> > > for this probably because vf610_nfc_run() is inlined by the x86
> > > compiler's inlining heuristic.
> > >
> > > If CONFIG_OPTIMIZE_INLINING is enabled for a different architecture
> > > and vf610_nfc_run() is not inlined, the following warning is reported:
> > >
> > > drivers/mtd/nand/raw/vf610_nfc.c: In function =E2=80=98vf610_nfc_cmd=
=E2=80=99:
> > > drivers/mtd/nand/raw/vf610_nfc.c:455:3: warning: =E2=80=98offset=E2=
=80=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >    vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
> > >    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >             nfc->regs + NFC_MAIN_AREA(0) + offset,
> > >             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >             trfr_sz, !nfc->data_access);
> > >             ~~~~~~~~~~~~~~~~~~~~~~~~~~~ =20
> >
> > IMHO this patch has no dependencies with this series. =20
>=20
>=20
> This patch is the prerequisite for 11/11.
> https://lore.kernel.org/patchwork/patch/1064959/
>=20
>=20
> Without the correct patch order,
> the kbuild test robot reports the warning.
>=20
>=20
> > Would you mind sending it alone with the proper Fixes tag? =20
>=20
>=20
> I do not think Fixes is necessary.

IMHO it is. Even if today the warning does not spawn, there is a
real C error which might already be an issue.

>=20
> Nobody has noticed this potential issue before.
> Without 11/11, probably we cannot reproduce this warning.
>=20
>=20
> BTW, this series has been for a while in linux-next.

Missed that. Ok, nevermind.


Thanks,
Miqu=C3=A8l
