Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A3575C7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 09:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lkjw81snqz3cfP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 17:41:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lkjvd2dc1z3c20
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 17:40:43 +1000 (AEST)
Received: from mail-ot1-f48.google.com ([209.85.210.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3sNa-1nUUyM3isq-00zppQ for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul
 2022 09:40:39 +0200
Received: by mail-ot1-f48.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso2976916otv.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 00:40:38 -0700 (PDT)
X-Gm-Message-State: AJIora9APWYhVVFGtxNctpnK1+W19xAuvXSgXJBMZG4Gc5tmszuL0pkX
	YTO39SNq+mibM1vFSLhe1bcIjXljyxcRXgu5qzg=
X-Google-Smtp-Source: AGRyM1uqN7hbJWu1Kc45V1df/TuEhLpRBy0jFrUgJKDcJEoO7ehMJuFR6t3QFdid1eQbrmQCLxECRTpajxA3X2Ob8Ys=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr14141207ywe.42.1657870826723; Fri, 15
 Jul 2022 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220714214657.2402250-1-shorne@gmail.com> <20220714214657.2402250-2-shorne@gmail.com>
 <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
In-Reply-To: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 Jul 2022 09:40:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3S5crDdUcO0kAgOLVGYgXnkU9D3uo44Wrcu5LdAWCGoQ@mail.gmail.com>
Message-ID: <CAK8P3a3S5crDdUcO0kAgOLVGYgXnkU9D3uo44Wrcu5LdAWCGoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to architectures
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:38EswcCyhp9Vx8oxlR5oA51zaxlLnLPiNOSLr9fCsrwf5xnSX6M
 9AZB4zKJCZIVNMQ0uef0ROT88heMunTKkni+fnZm7rhEaWl6/wFHqqdwy1UnQMcv+3taF+e
 1ca+7xvj3wHK9LAVEfx9vmpu+NA3/O4kL99liaFd/g//TVQuIOF1edV9qH4z4PKMaupZA4u
 oS/Uuk44sd+xTZ/nawYIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i7kSf3DFCr8=:1vIuCFaVDoXM2j50sKkSED
 brQeeNhU3+8lA0eTV8zHFblxGTXUa8luX1F20+nj9ynUrJEOyClfn0hHbNky1+kLJpN1ZBcNZ
 nLhLisC6wALFoY19IrwvaKYztE8EqngahICgRg3yjpUY0OVDsXr1xo2TxG3RFHY7ZlN3/ynk0
 vs6+PjR1F9sqbY8eSPi9lzIThFIrHvGNNBINgLykgEB4qrCn0lSr21s4EtIePs+nTXjkjitxT
 /mpTBIWEe8U4KVCaBK0rIpHibVis4TYjqmPyapeIkkHwRmwP9mmzjBzNTDZZ1kSB5pPgeetYS
 36WNVIGv9OFwejRH/GjHRylSqCjIy8kEl1mUj2rcfb7j8YfyP8IeIgFI73I9XRx6NNuMOSRUS
 q/G3zBjXb0lSdzBNferfN0Lo882y2fRZ2LYCavuyZj04iuEkFErNTKNWK/Q7IYmNZv3pN402a
 122OEI9zINwgCnjzV0LU9GAVGFBmP9th9ncQeFNXeMTE7mwALRcri7ayIDJ6CfiYAQHANusMs
 /WrcNKs/sQS3b8UTqP2XOJg18r+YD7Qc66xOx26d76nd/fKlivONdKtNM/FwI+V7AqZKHLhwh
 yo5+ejtoosjcJ+FSBcPT11zLOmE8P9w/SkEzORVFTRRsQlRaLQqzwr6dmpP8wrzV4ongKeU98
 9UJWjiRFKdwC5at1JWxntorcoDNN3/mNxITheeTsy8E2ncr6UuO1ZuTCY9EUlAXdCAszEIi8d
 bgpAv8DqIW7WbUsqrXUfNDonFEBm3HTnpIF2ugVRpxHyeVvcGihzHiQ7/TO7H8gWdIVy+cM3A
 tgYv8vVfs0emSfHzEzMG9Bosv2tHRZf9yk7IWbmhUfzwmHAf3oGUoESXL2lWq1s2hmJywbi4g
 uZFoXcsMNZWceIkGLS8g==
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
Cc: "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Stafford Horne <shorne@gmail.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.
 com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 15, 2022 at 3:45 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
>
> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > +{
> > +       return channel ? 15 : 14;
> > +}
>
> This addition does not make sense for the xtensa as it isn't even possible
> to enable PNP support (the only user of this function) on xtensa.

Nice catch! I had looked at this function earlier and only tried to infer
which architectures might have this based on who has those interrupt
numbers reserved for ISA devices, but looking at CONFIG_PNP is clearly
better here.

PNP depends on "ISA || ACPI", and this already rules out most
architectures. The remaining ones are:

* x86, ia64, alpha: These clearly use PNP based on-board devices on
   common machines, and use PC-style interrupts

* arm64, loongarch: These select PNP when ACPI is enabled. I don't
   think they actually use PNP, but for the moment the function needs to
  be defined, probably returning 0. Loongarch still lacks PCI support
  though, so asm/pci.h is not yet there.

* arm, mips, powerpc: Only a few older machines in each of these
  support ISA devices, and the function is probably machine specific.
  These all have a custom pci.h already and don't use the asm-generic
  version.

* m68k: there are two that enable CONFIG_ISA and one that enables
  CONFIG_PCI, but nothing that has both, so we don't need this
  function.

In summary, I think only x86 actually uses this function, and it is
correct there, everything else either has its own implementation
or does not need it, so the existing asm-generic/pci.h file can
just be folded into the x86 asm/pci.h. That is a great cleanup.

        Arnd
