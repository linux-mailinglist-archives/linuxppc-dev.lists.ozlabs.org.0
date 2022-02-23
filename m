Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5EA4C1303
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 13:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3bLG25kYz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 23:43:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O/3TthIL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O/3TthIL; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3bKb6pSTz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 23:42:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D36BBB81F52
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3546CC340F6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645620158;
 bh=vfHK+gkNDrAvQXi1VtrHdfwiLvh+3euoD4Z2MIR/0m0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O/3TthIL4XfWE4YBU4n+//W2s9Oow3MOp0B72JrNSWI9KdK60Fxzenp1OHUXkcfNg
 wQ7nSn9LwIWUM+G3FYGfPJNfyAsXufq6P/hrN4O65dMg+sODhN+Eq+xESdDU6kkZPn
 KGWyOsXBMn0QXs3d1k/784mt2AhszZ2hGQ24pD0l+ywIQ8PdW3Lv6NpsT3QhFcby8J
 IgUqm/pVBKu3CC3PrhVeIq9ZhkFShwNCPKjC2XoyoUGEOvbYj6krNNEmELypMGKImn
 A7z8e4rFe7arHT49oeRXRQiNaNFWqRLSlQSuF6qDCG+RKV0Sg8fWcV0Xrgo04qcTyl
 ivzYRC93uGpoA==
Received: by mail-vk1-f175.google.com with SMTP id w128so11452519vkd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 04:42:38 -0800 (PST)
X-Gm-Message-State: AOAM533rdKYybFIZPEVQe+aqYOCnE/BBLA69Qpwt5doCpLzalGc0Dc3c
 Ve5FelR6lsGVYl3glv2o4c80GeB03olAOZOzjtY=
X-Google-Smtp-Source: ABdhPJwiS2/TnUZj6eqhOkeNucJDlHqkwMwsfsk+suYlfmqT0vHvdSP7AQRVGgao7f8HjSLljPJQRV0WirIw6+DTixk=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr1166442vkf.35.1645620157156; Wed, 23 Feb
 2022 04:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-18-guoren@kernel.org>
 <4379941.LvFx2qVVIh@eto.sf-tec.de>
In-Reply-To: <4379941.LvFx2qVVIh@eto.sf-tec.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Feb 2022 20:42:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRcfvd6Sin=3Dv91WZO6DxLsUsB=ap+F1WehKb6=w5fkA@mail.gmail.com>
Message-ID: <CAJF2gTRcfvd6Sin=3Dv91WZO6DxLsUsB=ap+F1WehKb6=w5fkA@mail.gmail.com>
Subject: Re: [PATCH V5 17/21] riscv: compat: vdso: Add setup additional pages
 implementation
To: Rolf Eike Beer <eb@emlix.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 8:19 PM Rolf Eike Beer <eb@emlix.com> wrote:
>
> > @@ -66,35 +68,35 @@ static int vdso_mremap(const struct vm_special_mapp=
ing
> > *sm, return 0;
> >  }
> >
> > -static int __init __vdso_init(void)
> > +static int __init __vdso_init(struct __vdso_info *vdso_info)
> >  {
> >       unsigned int i;
> >       struct page **vdso_pagelist;
> >       unsigned long pfn;
> >
> > -     if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
> > +     if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4)) {
> >               pr_err("vDSO is not a valid ELF object!\n");
> >               return -EINVAL;
> >       }
> >
>
> Does anyone actually guarantee that this is at least this 4 bytes long?

You can ref:
arch/arm64/kernel/vdso.c
arch/arm/kernel/vdso.c
arch/nds32/kernel/vdso.c

and in arch/powerpc/boot/elf.h:
arch/powerpc/kernel/fadump.c:   memcpy(elf->e_ident, ELFMAG, SELFMAG);
arch/powerpc/boot/elf.h:#define ELFMAG0         0x7f    /* EI_MAG */
arch/powerpc/boot/elf.h:#define ELFMAG1         'E'
arch/powerpc/boot/elf.h:#define ELFMAG2         'L'
arch/powerpc/boot/elf.h:#define ELFMAG3         'F'
arch/powerpc/boot/elf.h:#define ELFMAG          "\177ELF"
arch/powerpc/boot/elf.h:#define SELFMAG         4


>
> Eike
> --
> Rolf Eike Beer, emlix GmbH, https://www.emlix.com
> Fon +49 551 30664-0, Fax +49 551 30664-11
> Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
> Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 31=
60
> Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-Id=
Nr.: DE 205 198 055
>
> emlix - smart embedded open source



--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
