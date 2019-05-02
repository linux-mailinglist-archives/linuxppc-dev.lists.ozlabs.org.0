Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381E11C6A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:15:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vzN14nKZzDqLN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 01:15:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vzHL6kTxzDqLN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 01:11:06 +1000 (AEST)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 93A483A954D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 14:14:27 +0000 (UTC)
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BC10960015;
 Thu,  2 May 2019 14:13:47 +0000 (UTC)
Date: Thu, 2 May 2019 16:13:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RESEND PATCH v3 05/11] mtd: rawnand: vf610_nfc: add
 initializer to avoid -Wmaybe-uninitialized
Message-ID: <20190502161346.07c15187@xps13>
In-Reply-To: <20190423034959.13525-6-yamada.masahiro@socionext.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-6-yamada.masahiro@socionext.com>
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
 linux-s390@vger.kernel.org, Mathieu Malaterre <malat@debian.org>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 23 Apr
2019 12:49:53 +0900:

> This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> place. We need to eliminate potential issues beforehand.
>=20
> Kbuild test robot has never reported -Wmaybe-uninitialized warning
> for this probably because vf610_nfc_run() is inlined by the x86
> compiler's inlining heuristic.
>=20
> If CONFIG_OPTIMIZE_INLINING is enabled for a different architecture
> and vf610_nfc_run() is not inlined, the following warning is reported:
>=20
> drivers/mtd/nand/raw/vf610_nfc.c: In function =E2=80=98vf610_nfc_cmd=E2=
=80=99:
> drivers/mtd/nand/raw/vf610_nfc.c:455:3: warning: =E2=80=98offset=E2=80=99=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
>    vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>             nfc->regs + NFC_MAIN_AREA(0) + offset,
>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>             trfr_sz, !nfc->data_access);
>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~

IMHO this patch has no dependencies with this series.
Would you mind sending it alone with the proper Fixes tag?

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
> Changes in v3: None
> Changes in v2:
>   - split into a separate patch
>=20
>  drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf61=
0_nfc.c
> index a662ca1970e5..19792d725ec2 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -364,7 +364,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
>  {
>  	const struct nand_op_instr *instr;
>  	struct vf610_nfc *nfc =3D chip_to_nfc(chip);
> -	int op_id =3D -1, trfr_sz =3D 0, offset;
> +	int op_id =3D -1, trfr_sz =3D 0, offset =3D 0;
>  	u32 col =3D 0, row =3D 0, cmd1 =3D 0, cmd2 =3D 0, code =3D 0;
>  	bool force8bit =3D false;
> =20

Thanks,
Miqu=C3=A8l
