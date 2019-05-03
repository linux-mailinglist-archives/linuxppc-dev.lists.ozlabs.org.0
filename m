Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE012BA1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 12:38:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wTBh0vG2zDqjW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 20:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="Z9DJFCMs"; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wT9H4PLFzDqbs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 20:37:37 +1000 (AEST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x43AbB0h022130
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 May 2019 19:37:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x43AbB0h022130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1556879832;
 bh=nx8pRpSymsndYyxiLURa2CmLp1S0V3DIvOeXzS6J2dI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z9DJFCMs9SiG0ydN+PixilbR52yYIyY2zfsPB4K9H9YDIZeaiO0+73EV37BI4dbKT
 RIwY8tmNwZeXEt9//bhIvkYWIhfW2IkzzH771aRBvscTu9GEHoQzcpjJ2/mceswuyA
 UoYtEVm+7rpwbX9TsIqHs2aB8WSYzGo289mkk2MluGxo+kQWlVOI55hY8Uc1/aDk5X
 VYekSVunoIfpqxu37gsIlPVBJYa9z5MOVA54gyFomljDwfKI1uhys53T6nwrTJ2nVq
 QylcF8PTyIHK9LgKR9vf+WBxHVRuogdZ50YluV2ZhEOzEo2Cd+9/7v8nhX6EqBk386
 v5ePSyPvmuTQQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id y196so3269333vsc.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2019 03:37:12 -0700 (PDT)
X-Gm-Message-State: APjAAAUUuq8afww+QF+BfCm5XfvUa/AJb2umQdslkBiNmF8Icf+t4n4B
 pZwOblBUIpmpwHv32PWxR+R/CbKe7s94837M0zQ=
X-Google-Smtp-Source: APXvYqwW2Xu7GuqfKtmc5UNaxfQ7dLxglJaqeji2MUglK/C6WjCbAXsTf0Y6inBC5zIGxhOWML+vIGWkcTtVvMWlajs=
X-Received: by 2002:a67:ee98:: with SMTP id n24mr4943708vsp.155.1556879831230; 
 Fri, 03 May 2019 03:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-6-yamada.masahiro@socionext.com>
 <20190502161346.07c15187@xps13>
In-Reply-To: <20190502161346.07c15187@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 3 May 2019 19:36:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQH8v8_HG6-cytT4qe05W9iiYwEP1mud4zG2NxxYcFptQ@mail.gmail.com>
Message-ID: <CAK7LNAQH8v8_HG6-cytT4qe05W9iiYwEP1mud4zG2NxxYcFptQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 05/11] mtd: rawnand: vf610_nfc: add initializer
 to avoid -Wmaybe-uninitialized
To: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Miquel,

On Thu, May 2, 2019 at 11:14 PM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Masahiro,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 23 Apr
> 2019 12:49:53 +0900:
>
> > This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> > place. We need to eliminate potential issues beforehand.
> >
> > Kbuild test robot has never reported -Wmaybe-uninitialized warning
> > for this probably because vf610_nfc_run() is inlined by the x86
> > compiler's inlining heuristic.
> >
> > If CONFIG_OPTIMIZE_INLINING is enabled for a different architecture
> > and vf610_nfc_run() is not inlined, the following warning is reported:
> >
> > drivers/mtd/nand/raw/vf610_nfc.c: In function =E2=80=98vf610_nfc_cmd=E2=
=80=99:
> > drivers/mtd/nand/raw/vf610_nfc.c:455:3: warning: =E2=80=98offset=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
> >    vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
> >    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >             nfc->regs + NFC_MAIN_AREA(0) + offset,
> >             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >             trfr_sz, !nfc->data_access);
> >             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> IMHO this patch has no dependencies with this series.


This patch is the prerequisite for 11/11.
https://lore.kernel.org/patchwork/patch/1064959/


Without the correct patch order,
the kbuild test robot reports the warning.


> Would you mind sending it alone with the proper Fixes tag?


I do not think Fixes is necessary.

Nobody has noticed this potential issue before.
Without 11/11, probably we cannot reproduce this warning.


BTW, this series has been for a while in linux-next.


>
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > Changes in v3: None
> > Changes in v2:
> >   - split into a separate patch
> >
> >  drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf=
610_nfc.c
> > index a662ca1970e5..19792d725ec2 100644
> > --- a/drivers/mtd/nand/raw/vf610_nfc.c
> > +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> > @@ -364,7 +364,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
> >  {
> >       const struct nand_op_instr *instr;
> >       struct vf610_nfc *nfc =3D chip_to_nfc(chip);
> > -     int op_id =3D -1, trfr_sz =3D 0, offset;
> > +     int op_id =3D -1, trfr_sz =3D 0, offset =3D 0;
> >       u32 col =3D 0, row =3D 0, cmd1 =3D 0, cmd2 =3D 0, code =3D 0;
> >       bool force8bit =3D false;
> >
>
> Thanks,
> Miqu=C3=A8l
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--
Best Regards

Masahiro Yamada
