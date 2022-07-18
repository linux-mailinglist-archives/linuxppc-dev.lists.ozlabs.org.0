Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6E577DC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 10:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmb6N5W2Nz3c4Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 18:41:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.130; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmb5x6QZmz3050
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 18:41:08 +1000 (AEST)
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUY5o-1o4fAF3TjU-00QWAk for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul
 2022 10:41:04 +0200
Received: by mail-yb1-f181.google.com with SMTP id f73so19494486yba.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 01:41:03 -0700 (PDT)
X-Gm-Message-State: AJIora+thJMItTLqkz0A4S4UoC/TC9+Gj/E6obnonVIezVVF67nvo5VW
	WWf6/9lLMylZ2I3sL9nz/oTyqnvbN8rd2F4oPa4=
X-Google-Smtp-Source: AGRyM1v6P9bRfP0SGacMoyNgstO+0kAXXfpT0DxcKtXM2lnDi5JkTyHnmtvpqCyUYAbfe++I5HITDjFfLLAjFIN9yoU=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr25927260ybq.472.1658133650969; Mon, 18
 Jul 2022 01:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-2-shorne@gmail.com>
 <YtTif+vNq+gkfqsc@infradead.org>
In-Reply-To: <YtTif+vNq+gkfqsc@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 10:40:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
Message-ID: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gA21jqc+ydAsb6EenCSlGokcXFAzuw5jrMVPwjJs4Z/iyosBwx2
 B/CLAKrgUDBOVHdYptiMO4HerBBdynmV9C8eOsiH+F4a5vaD5iPTsV7xNUmivCzx+hl3lkP
 Fde1qzMaW14WOyg8i20NDSU5XBEJGsF20W3NARaVkHz0A7M7wrwmZc69oGhGPSDU88GPMVi
 rURW58JxPbQQM8qmtoJFA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wXLKoyXAIx0=:cqmDm4HPsNUm+mT7Mf5lop
 ftcidItHFZsTQwZt9C27QkGbPq/jUxWdmDQraGe0olgrm9y3m/TBhw/myuXxMSRd7wCSM55wC
 pmCIGC2pedDq9poul66ywX32bCqu+WCliY+LZ2sW2M53X5vbu4JAT+zKuFMvtfJNiDOIwu8Fj
 kbRJ/2cji8fo5HxBpT7i8HWse6Q34/O2KLwr21LwaUO84ERvSz/ZChC26n+V3ZNkf23l55qa4
 CxSh4SurPvcReRWQ6rtiN6Xpj8OiZ9tfocmkIyaxU/V6A06sedmGqoXgzU3BaKc+7MUs2bRyp
 GaBSj/siSvbUzOV8xr2nVuz8UpplkzFsEdLIPNwaDZEbqXH/pCEut6Idu2z120jnrbwPR1gIE
 1OYUcF7+atco9vjpTRpZ3Au3mO9sqviCqaLscu/mq46TRwBcjOK60UZqBR52qGdu0fNlO+HhP
 V6TdZJ7Ogm3QWrqN9Vz9dQjlYnFqFz/LzQ8vOj9aGdeLlUiJd6E81asZG9UvkW11dG/OKljMa
 aU9PgCe/xF/WSM/cQITC1ic3iAooQuO/xxy3D1diBDuw38oIEI7xLzwCPdNLfwvyJLLMKCRrH
 Co+8JoQwnKKS+IpbxV6tylLAqq4NVVHdnxxVUIe0Ly6SXiD8vyoAZAKYvKZpRD6A4+aBxoVjg
 8pDnoXORcHQ9t3s//1ME+gmdppVqz8bmjyneOQ8Fh5N6qUWjjweLZkXF1Krru35LgkToUFRiX
 rG+dvs+xe+zwFs0K0wfL+Vc3umidZl8g6DnOxP1IoWCApsybAqWhdYeHObJmG0ya8Q05zgnKq
 MqeViNDEvM9Z5lHxbiftx8wEdFftBI3ZWqLr/3FNtvGNV6cVcaDrxmemJlz6whC1foZTqH22e
 VRO8ORwoMjiSuI9khYgA==
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
Cc: "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Stafford Horne <shorne@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, the arch/x86 maintainers <x86@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@li
 nux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 6:33 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Jul 17, 2022 at 12:34:52PM +0900, Stafford Horne wrote:
> > The generic pci.h header now only provides a definition of
> > pci_get_legacy_ide_irq which is used by architectures that support PNP.
> > Of the architectures that use asm-generic/pci.h this is only x86.
>
> Please move this into a separate header, ike legacy-ide.h.  It doens't
> have anyting to do with actual PCI support.

It looks like asm/libata-portmap.h is meant to have this information already,
and this is what libata uses, while drivers/ide used the
pci_get_legacy_ide_irq()
function for the same purpose.

Only ia64 and powerpc have interesting definitions of both, and they
return the same thing, so I think this is sufficient to remove the last caller:

diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
index 2fa0f7d55259..d7a6250589d6 100644
--- a/drivers/pnp/resource.c
+++ b/drivers/pnp/resource.c
@@ -16,7 +16,7 @@
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/irq.h>
-#include <linux/pci.h>
+#include <linux/libata.h>
 #include <linux/ioport.h>
 #include <linux/init.h>

@@ -322,8 +322,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp,
struct pci_dev *pci,
                 * treat the compatibility IRQs as busy.
                 */
                if ((progif & 0x5) != 0x5)
-                       if (pci_get_legacy_ide_irq(pci, 0) == irq ||
-                           pci_get_legacy_ide_irq(pci, 1) == irq) {
+                       if (ATA_PRIMARY_IRQ(pci) == irq ||
+                           ATA_SECONDARY_IRQ(pci) == irq) {
                                pnp_dbg(&pnp->dev, "  legacy IDE device %s "
                                        "using irq %d\n", pci_name(pci), irq);
                                return 1;

This is fine on the architectures that currently return an error from
pci_get_legacy_ide_irq() but will change to returning 15/14 instead,
because they do not support ISA devices, so pci_dev_uses_irq()
will never be called either.

        Arnd
