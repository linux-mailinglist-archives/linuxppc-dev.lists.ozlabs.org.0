Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B636C22056A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:50:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B67Lz3qt7zDqn5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:50:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B67HL2vsfzDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:47:41 +1000 (AEST)
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M3loZ-1jvK5T1rDH-000xJT for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul
 2020 08:47:36 +0200
Received: by mail-qk1-f178.google.com with SMTP id q198so865842qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:47:35 -0700 (PDT)
X-Gm-Message-State: AOAM533273gF+eW/s6/nY8l5/6gVZfOU3vuGsANDXnv2hkb9TQ6kzQhr
 lNzDfuIrV+PjyaDkM3daRhfnDjNJTxtHo9jVNSk=
X-Google-Smtp-Source: ABdhPJyFS0Zk4AmYJjgRoHnkDRGYzV2yqrKuev4xpaWExBMOSp+Vk7tlNoV31gVNZsw16288M3SPusHOFA0ODDFCn0I=
X-Received: by 2002:a37:a496:: with SMTP id n144mr8314087qke.286.1594795654855; 
 Tue, 14 Jul 2020 23:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
 <20200714234625.GA428442@bjorn-Precision-5520>
In-Reply-To: <20200714234625.GA428442@bjorn-Precision-5520>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jul 2020 08:47:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
Message-ID: <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Dm/nSu/2jMn31VjHgCFTJZkfWOWdrku9K/SIXnJqD7rIXWuBUUl
 pDqrjoaoZbEWpDkXGwA8in5j+WqlSbCHPvdjqRSnMlshpXQJOTDEttASNhIhwsgTuBOuy/4
 tYfkPX0M4YGYTJyWu80kMg9fYRyoQ7axIQ+vB9ufUzZ8n9I+c2yNNd4xCGYaPw9DXlZur+r
 n8MPA6TDv46yoz5zX0VFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gICHG2vGid0=:qfYg8kl4+OC6P+7luH8KA1
 7H3KFi45AR/R185Yi7m15t9OYIlphAhys52GL2+wNjl/Hdcy8HqVdKamOC/vAXnE/YbbEHxwF
 xM4oh9MsbKXpT8J0JbrhBZRHXUOOQ+lQ2HuZvsZd3519n8eklciUgbDVFhLXcAeRFqRFc/3IK
 HVlKanxZsrNM/OkP0brphs8vZUe8bIWXv9lb9QOoWNusCtWsLL1N3ENNctAsdC7Vfg0D6muas
 mbTVIsHooBCcjntw47nwqRoL764MwVRrl1ojELeZdw/zHq9GyhWPx/YFxQCWr/n7XVhQXyZO4
 zcPAVruCOxOKC1iHIEGzCMKxj7vNpmRtFhib+Thys5bu8c7tsGCwbXUJvGmD8p4gBupctsdUq
 m/4pWCALKflAZIdbXDDSpN4d9ZES9jg6XF3yyVtMNoi3v8Y7Mvb8LiGXEt8Yt/zCYgnFM04pP
 wo1bpCdHwQcpaPRedXMMthNzScG4ugWNV7eflzcdh6aB3Xf48BNcaqVpUm5WSb+nwbPpBcauj
 mVHUhYV1zFm628ABxUC/SAmgHVV7rYhTmDOo49KV1whUjCYpXDul15RfO2wn4CUgS1WgVO3mu
 Jx9IKqWlJwvYJrLZNyhw1y92/mmbM14qm/8oEWlJKDIScYWPQ7GEWNjui67w9qnPaSTtxrez9
 pSAZld84fmwR05KTFUH/9jedzEEdqNMLvx2mVGiu29Od1Erd6+8zglwK68kA8TPm/gsI1/kTC
 UMEd6jmNBOL1r97BB7ZSa1bgXssO+RkgzFsODTH12tc9wZA1yzNdqcUOrmeOsvz6zvfaC4/FM
 s7ldyg9+fynkcxmeIGAIkeOrzcLvMcmqxWnQFvUVDNoXr0XVniZJq7qU7jozmpW+82DefD8u3
 bDhCiIjFPV1rDnyg3DSOx/Agc6Lqnu3+p1QX6cPBZsJI4mfsloQFLk78+Wyw9Vp7eUU1Tt3jN
 xv09JbcxYG56HDoNuNFhQc9vVLWh6L90i1taKGEiMZfvI6rsTwHmp
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
Cc: Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Kjetil Oftedal <oftedal@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 1:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:

 So something like:
>
>   void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)
>
> and where we used to return anything non-zero, we just set *val = ~0
> instead?  I think we do that already in most, maybe all, cases.

Right, this is what I had in mind. If we start by removing the handling
of the return code in all files that clearly don't need it, looking at
whatever remains will give a much better idea of what a good interface
should be.

>  git grep -E "(if|return|=).*\<pci_(read|write)_config" drivers
> finds about 400 matches.

Right, and this is some 112 files to look at.

I had a slightly different regex, which found more false-positives, but
also these:

arch/x86/kernel/amd_nb.c:      : pci_read_config_dword(root, 0x64, value));
drivers/i2c/busses/i2c-sis630.c:     pci_write_config_byte(sis630_dev,
SIS630_BIOS_CTL_REG, b | 0x80)) {
drivers/i2c/busses/i2c-viapro.c:     !pci_read_config_word(pdev,
SMBBA2, &vt596_smba) &&
drivers/ide/rz1000.c:     !pci_write_config_word(dev, 0x40, reg & 0xdfff)) {
drivers/net/ethernet/realtek/r8169_main.c:
pci_write_config_byte(pdev, 0x070f, val) == PCIBIOS_SUCCESSFUL)
include/linux/rtsx_pci.h:#define rtsx_pci_read_config_dword(pcr,
where, val) pci_read_config_dword((pcr)->pci, where, val)
include/linux/rtsx_pci.h:#define rtsx_pci_write_config_dword(pcr,
where, val) pci_write_config_dword((pcr)->pci, where, val)
drivers/misc/cardreader/rts5261.c:              retval =
rtsx_pci_read_config_dword(pcr,
drivers/misc/cardreader/rts5261.c:      retval =
rtsx_pci_write_config_dword(pcr, PCR_SETTING_REG2, lval);

That last one is interesting because I think this is a case in which we
actually want to check for errors, as the driver seems to use it
to ensure that accessing extended config space at offset 0x814
works before relying on the value. Unfortunately the implementation
seems buggy as it a) keeps using the possibly uninitialized value after
printing a warning and b) returns the PCIBIOS_* value in place of a
negative errno and then ignores it in the caller.

      Arnd
