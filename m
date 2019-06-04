Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28434467
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 12:32:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J7X05jbqzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 20:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=mchehab+samsung@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="c43fmGuy"; dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J6Zz4b5czDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 19:49:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3k/+hinVCOAW7PyAk4gGWRix3vBPUw0AszrhY/mQ3ZU=; b=c43fmGuydsUZF63gosC+IZttlH
 gYzXBa8/0V4uVej1GzWEfMdi2xsydIvFd4tLBw+bv5HsldVLWQpvBcl2DkCU8yEkZ3PpnBYigbxPy
 aJIPOI/kE6ARXFCY1s5KfQX2iWaMACSu0pb5sUT6WRNnaSYW3Q/O3/Uowzws4daSoi9dcPsmsSY2l
 VX04lJI0KYglAeJjvFrz+UFSQLllkCQ53CYPXVg36kjtzR1mDsSFjNm9hkWBnUY5w3LhWk+QfvoOT
 XtTwuQYDFsrF/nEh1fnH19V8Vx4DlTvLBA8VAJkQ8nL7ezVvWeKU28nLcOpjX2tHNEltz/jrED1vA
 JHOrPT3Q==;
Received: from [187.113.6.249] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY61q-0004kh-OZ; Tue, 04 Jun 2019 09:46:51 +0000
Date: Tue, 4 Jun 2019 06:46:14 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
Message-ID: <20190604064614.67cde821@coco.lan>
In-Reply-To: <64e136de-1a7b-3436-9675-44ea9fa7b64a@c-s.fr>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
 <64e136de-1a7b-3436-9675-44ea9fa7b64a@c-s.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Jun 2019 20:30:48 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 Wolfram Sang <wsa@the-dreams.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Russell King <linux@armlinux.org.uk>, Paul Mackerras <paulus@samba.org>,
 Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Andy Gross <agross@kernel.org>,
 xen-devel@lists.xenproject.org, Jason Wang <jasowang@redhat.com>,
 Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
 Quentin Perret <quentin.perret@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Jiri Kosina <jkosina@suse.cz>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Feng Tang <feng.tang@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Yannik Sembritzki <yannik@sembritzki.me>, Harry Wei <harryxiyou@gmail.com>,
 linux-i2c@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 YueHaibing <yuehaibing@huawei.com>, Robert Moore <robert.moore@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 David Brown <david.brown@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, linux-pci@vger.kernel.org,
 Bhupesh Sharma <bhsharma@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 platform-driver-x86@vger.kernel.org,
 Ding Xiang <dingxiang@cmss.chinamobile.com>, linux-kselftest@vger.kernel.org,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Raphael Gault <raphael.gault@arm.com>,
 Joel Stanley <joel@jms.id.au>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Darren Hart <dvhart@infradead.org>, Erik Schmauss <erik.schmauss@intel.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Palmer Dabbelt <palmer@sifive.com>,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonathan =?UTF-8?B?TmV1c2No?= =?UTF-8?B?w6RmZXI=?= <j.neuschaefer@gmx.net>,
 SeongJae Park <sj38.park@gmail.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org, devel@acpica.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Olof Johansson <olof@lixom.net>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, Michal Hocko <mhocko@suse.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
 Manfred Spraul <manfred@colorfullife.com>,
 Luis Chamberlain <mcgrof@kernel.org>, x86@kernel.org,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
 devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-edac@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Denis Efremov <efremov@ispras.ru>,
 netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, 3 Jun 2019 09:34:15 +0200
Christophe Leroy <christophe.leroy@c-s.fr> escreveu:

> Le 30/05/2019 =C3=A0 01:23, Mauro Carvalho Chehab a =C3=A9crit=C2=A0:
> > Mostly due to x86 and acpi conversion, several documentation
> > links are still pointing to the old file. Fix them.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >   Documentation/acpi/dsd/leds.txt                  |  2 +-
> >   Documentation/admin-guide/kernel-parameters.rst  |  6 +++---
> >   Documentation/admin-guide/kernel-parameters.txt  | 16 ++++++++--------
> >   Documentation/admin-guide/ras.rst                |  2 +-
> >   .../devicetree/bindings/net/fsl-enetc.txt        |  7 +++----
> >   .../bindings/pci/amlogic,meson-pcie.txt          |  2 +-
> >   .../bindings/regulator/qcom,rpmh-regulator.txt   |  2 +-
> >   Documentation/devicetree/booting-without-of.txt  |  2 +-
> >   Documentation/driver-api/gpio/board.rst          |  2 +-
> >   Documentation/driver-api/gpio/consumer.rst       |  2 +-
> >   .../firmware-guide/acpi/enumeration.rst          |  2 +-
> >   .../firmware-guide/acpi/method-tracing.rst       |  2 +-
> >   Documentation/i2c/instantiating-devices          |  2 +-
> >   Documentation/sysctl/kernel.txt                  |  4 ++--
> >   .../translations/it_IT/process/howto.rst         |  2 +-
> >   .../it_IT/process/stable-kernel-rules.rst        |  4 ++--
> >   .../translations/zh_CN/process/4.Coding.rst      |  2 +-
> >   Documentation/x86/x86_64/5level-paging.rst       |  2 +-
> >   Documentation/x86/x86_64/boot-options.rst        |  4 ++--
> >   .../x86/x86_64/fake-numa-for-cpusets.rst         |  2 +-
> >   MAINTAINERS                                      |  6 +++---
> >   arch/arm/Kconfig                                 |  2 +-
> >   arch/arm64/kernel/kexec_image.c                  |  2 +-
> >   arch/powerpc/Kconfig                             |  2 +-
> >   arch/x86/Kconfig                                 | 16 ++++++++--------
> >   arch/x86/Kconfig.debug                           |  2 +-
> >   arch/x86/boot/header.S                           |  2 +-
> >   arch/x86/entry/entry_64.S                        |  2 +-
> >   arch/x86/include/asm/bootparam_utils.h           |  2 +-
> >   arch/x86/include/asm/page_64_types.h             |  2 +-
> >   arch/x86/include/asm/pgtable_64_types.h          |  2 +-
> >   arch/x86/kernel/cpu/microcode/amd.c              |  2 +-
> >   arch/x86/kernel/kexec-bzimage64.c                |  2 +-
> >   arch/x86/kernel/pci-dma.c                        |  2 +-
> >   arch/x86/mm/tlb.c                                |  2 +-
> >   arch/x86/platform/pvh/enlighten.c                |  2 +-
> >   drivers/acpi/Kconfig                             | 10 +++++-----
> >   drivers/net/ethernet/faraday/ftgmac100.c         |  2 +-
> >   .../fieldbus/Documentation/fieldbus_dev.txt      |  4 ++--
> >   drivers/vhost/vhost.c                            |  2 +-
> >   include/acpi/acpi_drivers.h                      |  2 +-
> >   include/linux/fs_context.h                       |  2 +-
> >   include/linux/lsm_hooks.h                        |  2 +-
> >   mm/Kconfig                                       |  2 +-
> >   security/Kconfig                                 |  2 +-
> >   tools/include/linux/err.h                        |  2 +-
> >   tools/objtool/Documentation/stack-validation.txt |  4 ++--
> >   tools/testing/selftests/x86/protection_keys.c    |  2 +-
> >   48 files changed, 77 insertions(+), 78 deletions(-) =20
>=20
> [...]
>=20
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 8c1c636308c8..e868d2bd48b8 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -898,7 +898,7 @@ config PPC_MEM_KEYS
> >   	  page-based protections, but without requiring modification of the
> >   	  page tables when an application changes protection domains.
> >  =20
> > -	  For details, see Documentation/vm/protection-keys.rst
> > +	  For details, see Documentation/x86/protection-keys.rst =20
>=20
> It looks strange to reference an x86 file, for powerpc arch.

Indeed. Yet, seeking for the API documented there:

 $ git grep -l pkey_mprotect
Documentation/x86/protection-keys.rst
arch/alpha/kernel/syscalls/syscall.tbl
arch/arm/tools/syscall.tbl
arch/arm64/include/asm/unistd32.h
arch/ia64/kernel/syscalls/syscall.tbl
arch/m68k/kernel/syscalls/syscall.tbl
arch/microblaze/kernel/syscalls/syscall.tbl
arch/mips/kernel/syscalls/syscall_n32.tbl
arch/mips/kernel/syscalls/syscall_n64.tbl
arch/mips/kernel/syscalls/syscall_o32.tbl
arch/parisc/kernel/syscalls/syscall.tbl
arch/powerpc/kernel/syscalls/syscall.tbl
arch/s390/kernel/syscalls/syscall.tbl
arch/sh/kernel/syscalls/syscall.tbl
arch/sparc/kernel/syscalls/syscall.tbl
arch/x86/entry/syscalls/syscall_32.tbl
arch/x86/entry/syscalls/syscall_64.tbl
arch/xtensa/kernel/syscalls/syscall.tbl
include/linux/syscalls.h
include/uapi/asm-generic/unistd.h
kernel/sys_ni.c
mm/mprotect.c
tools/include/uapi/asm-generic/unistd.h
tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
tools/perf/builtin-trace.c
tools/testing/selftests/x86/protection_keys.c

Despite being used on several archs, the only documentation for it
is inside the x86 directory, as it seems that this is not
arch-specific.

Perhaps the file should, instead, be moved to another book.

Thanks,
Mauro
