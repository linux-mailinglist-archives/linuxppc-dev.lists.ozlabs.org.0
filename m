Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9221DA45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:39:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B57BF6TngzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 01:39:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B56VF1X82zDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 01:08:35 +1000 (AEST)
Received: from mail-ej1-f41.google.com ([209.85.218.41]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MVubb-1kKTWr3heX-00Rqwt for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul
 2020 17:08:28 +0200
Received: by mail-ej1-f41.google.com with SMTP id lx13so17619660ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 08:08:27 -0700 (PDT)
X-Gm-Message-State: AOAM530yhRomNGJu5W5NckTaVFTb/p4XV9P6MYFetXmUpb6FqpttOFLM
 J+NKRM3O1DByvMgCj/aOT94dHeloffD8V+4kTEE=
X-Google-Smtp-Source: ABdhPJwTQltR//Qoy7CJjbYFWf5SE8su8bBzApvuOmTDy/uiiaL5a6kEWZGPL3gOs+ATNW8dGkRO2Pf0imsPrOKn0vM=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr53585665lfk.173.1594652906936; 
 Mon, 13 Jul 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200713122247.10985-1-refactormyself@gmail.com>
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Jul 2020 17:08:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:NarOHKs64zhyCkyzN8W5lgAX1lhX3WRKQ2GDC1doYr5FkeR9DCa
 Bi8SbTX5C4OX8uINYaWOIUe4BwvsJkXKAyRx3MH0TmZfLnSUYsnNx4zFryhjyuQvL+W1C6+
 /O5QQekoMypRr3uMNRZAZOQI1YxSLtgYFrJJn939KrroUCo/oVH97IxzjAiJ9rlxaCAH3T4
 L60d+BxWj9CG5VERenzMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KQg/58nuSO8=:eJ9fRA8uFDi4ozZEfqHug5
 tV6yeZ//e/VerCpXibl/dLTFHEWZgadxs5iJucTU9sNbb8CPeqcRm36K42wMOPVPfsaG3TAUP
 MP0sQ7egW75n3ryYLJfzo9aukI858pgPEbqOgwo4DCmczm/rNDtrbMxqb+9DauszG5ajwPOYr
 aUEXDJFdhr5SU/EJVBV6QeJii5uq/0Lda+UuTbAfItvrO3JgEDaS3Us1Pw8WAq0h2E3ktJcas
 bJ7p343dFyeSSE8k93n4/merF0Ph7TO2xQ/psLRSaIqWjNw+HBAS5MlycX2wjSntGteT97Y5c
 IA4dN9dJBB2lbi9PPM2y2aZNDJIHHvXfhxtuuGF0Wbi+V3sEWiXfRwOcBsh20USUG1EBXEltP
 sl5ZeTqi67wOwWBqJvNr7xSiOcO0VkAGEEnqjCrbdBn0sVcIss2nEjusxIeVuspb/pqmtHsxx
 PWfHbQgj6q4xonr7DTm1Wu6xiXJp60o+b/EYIxnAvNfkeKEyCatmAMzAcjZwhBsv3YHnql5IG
 uzpZv1L5lfohpiG4dyYjPs3Eyy7q6h9D431mP4Ih/jvNWJ8Fy/m6EU5q4XoQcsg0drZCpr1WS
 QovyAc9oGHxFMmpaIeXhIJDu6oUCOrQaYwJFOENQDovXjXkNjavcAycHHU32BMznfEz+3NxYA
 j3/ShyOYOGSYhFOqTIheZQKLmw0X6xgCUCKyIIFqnUDmFQ+JI/WyfgdL6tBQLpfESQE32s7+d
 a6aQT69lFoyeswUvXto+KZnWTaU5/l0XYufcsxPTgs4LnVJMQu2qKR4PS8MbNyG3Vbx9wszaC
 a2+2xDVyB4vF6IZ+zyvjuf1Cq8dr/YXiEraM9Hy/u6PTme8JYnnalwXLf2sowuegshPj3RRol
 biKyPIhJVwJmRH6588MttJy7krBeY3U3KTeV9u4ZE0h3ob9KND6K2a7XOObUogBSe64alUHV2
 AHgfMr/pH6GEmCFD+4rRLrFSnspEcui+N45whkvtPMA8PM+gZEVtY
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:32:15 +1000
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
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Paul Mackerras <paulus@samba.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Bjorn Helgaas <helgaas@kernel.org>, rfi@lists.rocketboards.org,
 Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-atm-general@lists.sourceforge.net, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Matt Turner <mattst88@gmail.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Networking <netdev@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, alpha <linux-alpha@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.
>
> PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
> codes of PCIBIOS* are positive values and this introduces some complexities
> which other archs need not incur.

I think the intention is good, but I find the series in its current
form very hard
to review, in particular the way you touch some functions three times with
trivial changes. Instead of

1) replace PCIBIOS_SUCCESSFUL with 0
2) drop pointless 0-comparison
3) reformat whitespace

I would suggest to combine the first two steps into one patch per
subsystem and drop the third step.

> PLAN:
>
> 1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0
>
> 2a.  Audit all functions returning PCIBIOS_* error values directly or
>      indirectly and prevent possible bug coming in (2b)
>
> 2b.  Make all functions returning PCIBIOS_* error values call
>      pcibios_err_to_errno(). *This will change their behaviour, for good.*
>
> 3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
>      This handles the positive error codes directly and will not use any
>      PCIBIOS* definitions. So calls to it have no outside dependence.
>
> 4.   Make all x86 codes that needs to convert to -E* values call the
>      cloned version - pcibios_err_to_errno_v2()
>
> 5.   Assign PCIBIOS_* errors values directly to generic -E* errors
>
> 6.   Refactor pcibios_err_to_errno() and mark it deprecated
>
> 7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
>      or 0.
>
> 8.   Remove all PCIBIOS* definitions in include/linux/pci.h and
>      pcibios_err_to_errno() too.
>
> 9.   Redefine all PCIBIOS* definitions with original values inside
>      arch/x86/pci/pcbios.c
>
> 10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c
>
> 11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()
>
> 12.  Remove pcibios_err_to_errno_v2()
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>

I would hope that there is a simpler procedure to get to good
code than 12 steps that rename the same things multiple times.

Maybe the work can be split up differently, with a similar end result
but fewer and easier reviewed patches. The way I'd look at the
problem, there are three main areas that can be dealt with one at
a time:

a) callers of the high-level config space accessors
   pci_{write,read}_config_{byte,word,dword}, mostly in device
   drivers.
b) low-level implementation of the config space accessors
    through struct pci_ops
c) all other occurrences of these constants

Starting with a), my first question is whether any high-level drivers
even need to care about errors from these functions. I see 4913
callers that ignore the return code, and 576 that actually
check it, and almost none care about the specific error (as you
found as well). Unless we conclude that most PCI drivers are
wrong, could we just change the return type to 'void' and assume
they never fail for valid arguments on a valid pci_device* ?

For b), it might be nice to also change other aspects of the interface,
e.g. passing a pci_host_bridge pointer plus bus number instead of
a pci_bus pointer, or having the callback in the pci_host_bridge
structure.

> Bolarinwa Olayemi Saheed (35):
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0

Some patches have identical subject lines including the subsystem
prefix, which you should avoid. Try to also fix the git request-pull
output to not drop that prefix here so the list makes more sense.

        Arnd
