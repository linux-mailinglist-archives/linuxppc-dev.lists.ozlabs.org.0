Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 165882E995
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 01:59:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dnk14RVKzDqRF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 09:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="dSUfwFTu"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dmyj1SMtzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 09:25:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RazRaO77oi4v76+wx0dJdEaoi/VQFuVEwWYPPHKu8xs=; b=dSUfwFTu0gLEPKtvUampsHgA4J
 kPaJt8m6hx9U6afg1qs4m5bepAFuSc2co2qkpWV5JcLBvveizAbZbEd3p4LLmv6HrJBMOs2ag3B9z
 St0HgJpW8+69omI+VNqqut7Kbhzx43aQntWAV3rAws5Rk/pHDc4ALTSSAfzdUMXhjl2j8Bl7iHJF4
 UrIM2q+VvtNabupNTw4ys30hAi5nWGZj3pPZyu0LivD8vUBT9tOYFiS8GdMbYj/8/J5nJpiIMxW3H
 ftxzi9bqvZHyqhg2efDLwnAZwS0uLJMzc4bFMiGxI6oL++P0pmkjSIoPTjO/d2KQfgzG1O6gkjUk3
 yk5L8OdA==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vN-0005Sn-OP; Wed, 29 May 2019 23:24:02 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vJ-0007yG-2E; Wed, 29 May 2019 20:23:57 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 22/22] docs: fix broken documentation links
Date: Wed, 29 May 2019 20:23:53 -0300
Message-Id: <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 May 2019 09:58:01 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Lutomirski <luto@kernel.org>,
 Wolfram Sang <wsa@the-dreams.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Paul Mackerras <paulus@samba.org>,
 Alessia Mantegazza <amantegazza@vaga.pv.it>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Kevin Hilman <khilman@baylibre.com>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, Jason Wang <jasowang@redhat.com>,
 Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
 Jakub Wilk <jwilk@jwilk.net>, Ding Xiang <dingxiang@cmss.chinamobile.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Jiri Kosina <jkosina@suse.cz>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Feng Tang <feng.tang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-mm@kvack.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Yannik Sembritzki <yannik@sembritzki.me>, Harry Wei <harryxiyou@gmail.com>,
 linux-i2c@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 YueHaibing <yuehaibing@huawei.com>, Robert Moore <robert.moore@intel.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Len Brown <lenb@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 James Morse <james.morse@arm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 linux-pci@vger.kernel.org, Bhupesh Sharma <bhsharma@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 platform-driver-x86@vger.kernel.org, Quentin Perret <quentin.perret@arm.com>,
 linux-kselftest@vger.kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Raphael Gault <raphael.gault@arm.com>,
 Joel Stanley <joel@jms.id.au>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Darren Hart <dvhart@infradead.org>, linux-edac@vger.kernel.org,
 Erik Schmauss <erik.schmauss@intel.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Palmer Dabbelt <palmer@sifive.com>, Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
 David Howells <dhowells@redhat.com>, David Brown <david.brown@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
 Manfred Spraul <manfred@colorfullife.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Andy Gross <agross@kernel.org>, Dave Young <dyoung@redhat.com>,
 devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jerome Glisse <jglisse@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross <jgross@suse.com>,
 Denis Efremov <efremov@ispras.ru>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mostly due to x86 and acpi conversion, several documentation
links are still pointing to the old file. Fix them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/acpi/dsd/leds.txt                  |  2 +-
 Documentation/admin-guide/kernel-parameters.rst  |  6 +++---
 Documentation/admin-guide/kernel-parameters.txt  | 16 ++++++++--------
 Documentation/admin-guide/ras.rst                |  2 +-
 .../devicetree/bindings/net/fsl-enetc.txt        |  7 +++----
 .../bindings/pci/amlogic,meson-pcie.txt          |  2 +-
 .../bindings/regulator/qcom,rpmh-regulator.txt   |  2 +-
 Documentation/devicetree/booting-without-of.txt  |  2 +-
 Documentation/driver-api/gpio/board.rst          |  2 +-
 Documentation/driver-api/gpio/consumer.rst       |  2 +-
 .../firmware-guide/acpi/enumeration.rst          |  2 +-
 .../firmware-guide/acpi/method-tracing.rst       |  2 +-
 Documentation/i2c/instantiating-devices          |  2 +-
 Documentation/sysctl/kernel.txt                  |  4 ++--
 .../translations/it_IT/process/howto.rst         |  2 +-
 .../it_IT/process/stable-kernel-rules.rst        |  4 ++--
 .../translations/zh_CN/process/4.Coding.rst      |  2 +-
 Documentation/x86/x86_64/5level-paging.rst       |  2 +-
 Documentation/x86/x86_64/boot-options.rst        |  4 ++--
 .../x86/x86_64/fake-numa-for-cpusets.rst         |  2 +-
 MAINTAINERS                                      |  6 +++---
 arch/arm/Kconfig                                 |  2 +-
 arch/arm64/kernel/kexec_image.c                  |  2 +-
 arch/powerpc/Kconfig                             |  2 +-
 arch/x86/Kconfig                                 | 16 ++++++++--------
 arch/x86/Kconfig.debug                           |  2 +-
 arch/x86/boot/header.S                           |  2 +-
 arch/x86/entry/entry_64.S                        |  2 +-
 arch/x86/include/asm/bootparam_utils.h           |  2 +-
 arch/x86/include/asm/page_64_types.h             |  2 +-
 arch/x86/include/asm/pgtable_64_types.h          |  2 +-
 arch/x86/kernel/cpu/microcode/amd.c              |  2 +-
 arch/x86/kernel/kexec-bzimage64.c                |  2 +-
 arch/x86/kernel/pci-dma.c                        |  2 +-
 arch/x86/mm/tlb.c                                |  2 +-
 arch/x86/platform/pvh/enlighten.c                |  2 +-
 drivers/acpi/Kconfig                             | 10 +++++-----
 drivers/net/ethernet/faraday/ftgmac100.c         |  2 +-
 .../fieldbus/Documentation/fieldbus_dev.txt      |  4 ++--
 drivers/vhost/vhost.c                            |  2 +-
 include/acpi/acpi_drivers.h                      |  2 +-
 include/linux/fs_context.h                       |  2 +-
 include/linux/lsm_hooks.h                        |  2 +-
 mm/Kconfig                                       |  2 +-
 security/Kconfig                                 |  2 +-
 tools/include/linux/err.h                        |  2 +-
 tools/objtool/Documentation/stack-validation.txt |  4 ++--
 tools/testing/selftests/x86/protection_keys.c    |  2 +-
 48 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/Documentation/acpi/dsd/leds.txt b/Documentation/acpi/dsd/leds.txt
index 81a63af42ed2..cc58b1a574c5 100644
--- a/Documentation/acpi/dsd/leds.txt
+++ b/Documentation/acpi/dsd/leds.txt
@@ -96,4 +96,4 @@ where
     <URL:http://www.uefi.org/sites/default/files/resources/_DSD-hierarchical-data-extension-UUID-v1.1.pdf>,
     referenced 2019-02-21.
 
-[7] Documentation/acpi/dsd/data-node-reference.txt
+[7] Documentation/firmware-guide/acpi/dsd/data-node-references.rst
diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 0124980dca2d..8d3273e32eb1 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -167,7 +167,7 @@ parameter is applicable::
 	X86-32	X86-32, aka i386 architecture is enabled.
 	X86-64	X86-64 architecture is enabled.
 			More X86-64 boot options can be found in
-			Documentation/x86/x86_64/boot-options.txt .
+			Documentation/x86/x86_64/boot-options.rst.
 	X86	Either 32-bit or 64-bit x86 (same as X86-32+X86-64)
 	X86_UV	SGI UV support is enabled.
 	XEN	Xen support is enabled
@@ -181,10 +181,10 @@ In addition, the following text indicates that the option::
 Parameters denoted with BOOT are actually interpreted by the boot
 loader, and have no meaning to the kernel directly.
 Do not modify the syntax of boot loader parameters without extreme
-need or coordination with <Documentation/x86/boot.txt>.
+need or coordination with <Documentation/x86/boot.rst>.
 
 There are also arch-specific kernel-parameters not documented here.
-See for example <Documentation/x86/x86_64/boot-options.txt>.
+See for example <Documentation/x86/x86_64/boot-options.rst>.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
 a trailing = on the name of any parameter states that that parameter will
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 138f6664b2e2..4a02d1346635 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -53,7 +53,7 @@
 			ACPI_DEBUG_PRINT statements, e.g.,
 			    ACPI_DEBUG_PRINT((ACPI_DB_INFO, ...
 			The debug_level mask defaults to "info".  See
-			Documentation/acpi/debug.txt for more information about
+			Documentation/firmware-guide/acpi/debug.rst for more information about
 			debug layers and levels.
 
 			Enable processor driver info messages:
@@ -963,7 +963,7 @@
 			for details.
 
 	nompx		[X86] Disables Intel Memory Protection Extensions.
-			See Documentation/x86/intel_mpx.txt for more
+			See Documentation/x86/intel_mpx.rst for more
 			information about the feature.
 
 	nopku		[X86] Disable Memory Protection Keys CPU feature found
@@ -1189,7 +1189,7 @@
 			that is to be dynamically loaded by Linux. If there are
 			multiple variables with the same name but with different
 			vendor GUIDs, all of them will be loaded. See
-			Documentation/acpi/ssdt-overlays.txt for details.
+			Documentation/admin-guide/acpi/ssdt-overlays.rst for details.
 
 
 	eisa_irq_edge=	[PARISC,HW]
@@ -2383,7 +2383,7 @@
 
 	mce		[X86-32] Machine Check Exception
 
-	mce=option	[X86-64] See Documentation/x86/x86_64/boot-options.txt
+	mce=option	[X86-64] See Documentation/x86/x86_64/boot-options.rst
 
 	md=		[HW] RAID subsystems devices and level
 			See Documentation/admin-guide/md.rst.
@@ -2439,7 +2439,7 @@
 			set according to the
 			CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel config
 			option.
-			See Documentation/memory-hotplug.txt.
+			See Documentation/admin-guide/mm/memory-hotplug.rst.
 
 	memmap=exactmap	[KNL,X86] Enable setting of an exact
 			E820 memory map, as specified by the user.
@@ -2528,7 +2528,7 @@
 			mem_encrypt=on:		Activate SME
 			mem_encrypt=off:	Do not activate SME
 
-			Refer to Documentation/x86/amd-memory-encryption.txt
+			Refer to Documentation/virtual/kvm/amd-memory-encryption.rst
 			for details on when memory encryption can be activated.
 
 	mem_sleep_default=	[SUSPEND] Default system suspend mode:
@@ -3528,7 +3528,7 @@
 			See Documentation/blockdev/paride.txt.
 
 	pirq=		[SMP,APIC] Manual mp-table setup
-			See Documentation/x86/i386/IO-APIC.txt.
+			See Documentation/x86/i386/IO-APIC.rst.
 
 	plip=		[PPT,NET] Parallel port network link
 			Format: { parport<nr> | timid | 0 }
@@ -5054,7 +5054,7 @@
 			Can be used multiple times for multiple devices.
 
 	vga=		[BOOT,X86-32] Select a particular video mode
-			See Documentation/x86/boot.txt and
+			See Documentation/x86/boot.rst and
 			Documentation/svga.txt.
 			Use vga=ask for menu.
 			This is actually a boot loader parameter; the value is
diff --git a/Documentation/admin-guide/ras.rst b/Documentation/admin-guide/ras.rst
index c7495e42e6f4..2b20f5f7380d 100644
--- a/Documentation/admin-guide/ras.rst
+++ b/Documentation/admin-guide/ras.rst
@@ -199,7 +199,7 @@ Architecture (MCA)\ [#f3]_.
   mode).
 
 .. [#f3] For more details about the Machine Check Architecture (MCA),
-  please read Documentation/x86/x86_64/machinecheck at the Kernel tree.
+  please read Documentation/x86/x86_64/machinecheck.rst at the Kernel tree.
 
 EDAC - Error Detection And Correction
 *************************************
diff --git a/Documentation/devicetree/bindings/net/fsl-enetc.txt b/Documentation/devicetree/bindings/net/fsl-enetc.txt
index c812e25ae90f..25fc687419db 100644
--- a/Documentation/devicetree/bindings/net/fsl-enetc.txt
+++ b/Documentation/devicetree/bindings/net/fsl-enetc.txt
@@ -16,8 +16,8 @@ Required properties:
 In this case, the ENETC node should include a "mdio" sub-node
 that in turn should contain the "ethernet-phy" node describing the
 external phy.  Below properties are required, their bindings
-already defined in ethernet.txt or phy.txt, under
-Documentation/devicetree/bindings/net/*.
+already defined in Documentation/devicetree/bindings/net/ethernet.txt or
+Documentation/devicetree/bindings/net/phy.txt.
 
 Required:
 
@@ -51,8 +51,7 @@ Example:
 connection:
 
 In this case, the ENETC port node defines a fixed link connection,
-as specified by "fixed-link.txt", under
-Documentation/devicetree/bindings/net/*.
+as specified by Documentation/devicetree/bindings/net/fixed-link.txt.
 
 Required:
 
diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
index 12b18f82d441..efa2c8b9b85a 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
@@ -3,7 +3,7 @@ Amlogic Meson AXG DWC PCIE SoC controller
 Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and
 inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pci.txt.
+Documentation/devicetree/bindings/pci/designware-pcie.txt.
 
 Additional properties are described here:
 
diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 7ef2dbe48e8a..14d2eee96b3d 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -97,7 +97,7 @@ Second Level Nodes - Regulators
 		    sent for this regulator including those which are for a
 		    strictly lower power state.
 
-Other properties defined in Documentation/devicetree/bindings/regulator.txt
+Other properties defined in Documentation/devicetree/bindings/regulator/regulator.txt
 may also be used.  regulator-initial-mode and regulator-allowed-modes may be
 specified for VRM regulators using mode values from
 include/dt-bindings/regulator/qcom,rpmh-regulator.h.  regulator-allow-bypass
diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index e86bd2f64117..60f8640f2b2f 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -277,7 +277,7 @@ it with special cases.
   the decompressor (the real mode entry point goes to the same  32bit
   entry point once it switched into protected mode). That entry point
   supports one calling convention which is documented in
-  Documentation/x86/boot.txt
+  Documentation/x86/boot.rst
   The physical pointer to the device-tree block (defined in chapter II)
   is passed via setup_data which requires at least boot protocol 2.09.
   The type filed is defined as
diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index b37f3f7b8926..ce91518bf9f4 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -101,7 +101,7 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
 	}
 
 For more information about the ACPI GPIO bindings see
-Documentation/acpi/gpio-properties.txt.
+Documentation/firmware-guide/acpi/gpio-properties.rst.
 
 Platform Data
 -------------
diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 5e4d8aa68913..fdecb6d711db 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -437,7 +437,7 @@ case, it will be handled by the GPIO subsystem automatically.  However, if the
 _DSD is not present, the mappings between GpioIo()/GpioInt() resources and GPIO
 connection IDs need to be provided by device drivers.
 
-For details refer to Documentation/acpi/gpio-properties.txt
+For details refer to Documentation/firmware-guide/acpi/gpio-properties.rst
 
 
 Interacting With the Legacy GPIO Subsystem
diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Documentation/firmware-guide/acpi/enumeration.rst
index 850be9696931..1252617b520f 100644
--- a/Documentation/firmware-guide/acpi/enumeration.rst
+++ b/Documentation/firmware-guide/acpi/enumeration.rst
@@ -339,7 +339,7 @@ a code like this::
 There are also devm_* versions of these functions which release the
 descriptors once the device is released.
 
-See Documentation/acpi/gpio-properties.txt for more information about the
+See Documentation/firmware-guide/acpi/gpio-properties.rst for more information about the
 _DSD binding related to GPIOs.
 
 MFD devices
diff --git a/Documentation/firmware-guide/acpi/method-tracing.rst b/Documentation/firmware-guide/acpi/method-tracing.rst
index d0b077b73f5f..0aa7e2c5d32a 100644
--- a/Documentation/firmware-guide/acpi/method-tracing.rst
+++ b/Documentation/firmware-guide/acpi/method-tracing.rst
@@ -68,7 +68,7 @@ c. Filter out the debug layer/level matched logs when the specified
 
 Where:
    0xXXXXXXXX/0xYYYYYYYY
-     Refer to Documentation/acpi/debug.txt for possible debug layer/level
+     Refer to Documentation/firmware-guide/acpi/debug.rst for possible debug layer/level
      masking values.
    \PPPP.AAAA.TTTT.HHHH
      Full path of a control method that can be found in the ACPI namespace.
diff --git a/Documentation/i2c/instantiating-devices b/Documentation/i2c/instantiating-devices
index 0d85ac1935b7..5a3e2f331e8c 100644
--- a/Documentation/i2c/instantiating-devices
+++ b/Documentation/i2c/instantiating-devices
@@ -85,7 +85,7 @@ Method 1c: Declare the I2C devices via ACPI
 -------------------------------------------
 
 ACPI can also describe I2C devices. There is special documentation for this
-which is currently located at Documentation/acpi/enumeration.txt.
+which is currently located at Documentation/firmware-guide/acpi/enumeration.rst.
 
 
 Method 2: Instantiate the devices explicitly
diff --git a/Documentation/sysctl/kernel.txt b/Documentation/sysctl/kernel.txt
index f0c86fbb3b48..92f7f34b021a 100644
--- a/Documentation/sysctl/kernel.txt
+++ b/Documentation/sysctl/kernel.txt
@@ -155,7 +155,7 @@ is 0x15 and the full version number is 0x234, this file will contain
 the value 340 = 0x154.
 
 See the type_of_loader and ext_loader_type fields in
-Documentation/x86/boot.txt for additional information.
+Documentation/x86/boot.rst for additional information.
 
 ==============================================================
 
@@ -167,7 +167,7 @@ The complete bootloader version number.  In the example above, this
 file will contain the value 564 = 0x234.
 
 See the type_of_loader and ext_loader_ver fields in
-Documentation/x86/boot.txt for additional information.
+Documentation/x86/boot.rst for additional information.
 
 ==============================================================
 
diff --git a/Documentation/translations/it_IT/process/howto.rst b/Documentation/translations/it_IT/process/howto.rst
index 9903ac7c566b..44e6077730e8 100644
--- a/Documentation/translations/it_IT/process/howto.rst
+++ b/Documentation/translations/it_IT/process/howto.rst
@@ -131,7 +131,7 @@ Di seguito una lista di file che sono presenti nei sorgente del kernel e che
 	"Linux kernel patch submission format"
 		http://linux.yyz.us/patch-format.html
 
-  :ref:`Documentation/process/translations/it_IT/stable-api-nonsense.rst <it_stable_api_nonsense>`
+  :ref:`Documentation/translations/it_IT/process/stable-api-nonsense.rst <it_stable_api_nonsense>`
 
     Questo file descrive la motivazioni sottostanti la conscia decisione di
     non avere un API stabile all'interno del kernel, incluso cose come:
diff --git a/Documentation/translations/it_IT/process/stable-kernel-rules.rst b/Documentation/translations/it_IT/process/stable-kernel-rules.rst
index 48e88e5ad2c5..4f206cee31a7 100644
--- a/Documentation/translations/it_IT/process/stable-kernel-rules.rst
+++ b/Documentation/translations/it_IT/process/stable-kernel-rules.rst
@@ -33,7 +33,7 @@ Regole sul tipo di patch che vengono o non vengono accettate nei sorgenti
  - Non deve includere alcuna correzione "banale" (correzioni grammaticali,
    pulizia dagli spazi bianchi, eccetera).
  - Deve rispettare le regole scritte in
-   :ref:`Documentation/translation/it_IT/process/submitting-patches.rst <it_submittingpatches>`
+   :ref:`Documentation/translations/it_IT/process/submitting-patches.rst <it_submittingpatches>`
  - Questa patch o una equivalente deve esistere già nei sorgenti principali di
    Linux
 
@@ -43,7 +43,7 @@ Procedura per sottomettere patch per i sorgenti -stable
 
  - Se la patch contiene modifiche a dei file nelle cartelle net/ o drivers/net,
    allora seguite le linee guida descritte in
-   :ref:`Documentation/translation/it_IT/networking/netdev-FAQ.rst <it_netdev-FAQ>`;
+   :ref:`Documentation/translations/it_IT/networking/netdev-FAQ.rst <it_netdev-FAQ>`;
    ma solo dopo aver verificato al seguente indirizzo che la patch non sia
    già in coda:
    https://patchwork.ozlabs.org/bundle/davem/stable/?series=&submitter=&state=*&q=&archive=
diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
index 5301e9d55255..8bb777941394 100644
--- a/Documentation/translations/zh_CN/process/4.Coding.rst
+++ b/Documentation/translations/zh_CN/process/4.Coding.rst
@@ -241,7 +241,7 @@ scripts/coccinelle目录下已经打包了相当多的内核“语义补丁”
 
 任何添加新用户空间界面的代码（包括新的sysfs或/proc文件）都应该包含该界面的
 文档，该文档使用户空间开发人员能够知道他们在使用什么。请参阅
-Documentation/abi/readme，了解如何格式化此文档以及需要提供哪些信息。
+Documentation/ABI/README，了解如何格式化此文档以及需要提供哪些信息。
 
 文件 :ref:`Documentation/admin-guide/kernel-parameters.rst <kernelparameters>`
 描述了内核的所有引导时间参数。任何添加新参数的补丁都应该向该文件添加适当的
diff --git a/Documentation/x86/x86_64/5level-paging.rst b/Documentation/x86/x86_64/5level-paging.rst
index ab88a4514163..44856417e6a5 100644
--- a/Documentation/x86/x86_64/5level-paging.rst
+++ b/Documentation/x86/x86_64/5level-paging.rst
@@ -20,7 +20,7 @@ physical address space. This "ought to be enough for anybody" ©.
 QEMU 2.9 and later support 5-level paging.
 
 Virtual memory layout for 5-level paging is described in
-Documentation/x86/x86_64/mm.txt
+Documentation/x86/x86_64/mm.rst
 
 
 Enabling 5-level paging
diff --git a/Documentation/x86/x86_64/boot-options.rst b/Documentation/x86/x86_64/boot-options.rst
index 2f69836b8445..6a4285a3c7a4 100644
--- a/Documentation/x86/x86_64/boot-options.rst
+++ b/Documentation/x86/x86_64/boot-options.rst
@@ -9,7 +9,7 @@ only the AMD64 specific ones are listed here.
 
 Machine check
 =============
-Please see Documentation/x86/x86_64/machinecheck for sysfs runtime tunables.
+Please see Documentation/x86/x86_64/machinecheck.rst for sysfs runtime tunables.
 
    mce=off
 		Disable machine check
@@ -89,7 +89,7 @@ APICs
      Don't use the local APIC (alias for i386 compatibility)
 
    pirq=...
-	See Documentation/x86/i386/IO-APIC.txt
+	See Documentation/x86/i386/IO-APIC.rst
 
    noapictimer
 	Don't set up the APIC timer
diff --git a/Documentation/x86/x86_64/fake-numa-for-cpusets.rst b/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
index 74fbb78b3c67..04df57b9aa3f 100644
--- a/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
+++ b/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
@@ -18,7 +18,7 @@ For more information on the features of cpusets, see
 Documentation/cgroup-v1/cpusets.txt.
 There are a number of different configurations you can use for your needs.  For
 more information on the numa=fake command line option and its various ways of
-configuring fake nodes, see Documentation/x86/x86_64/boot-options.txt.
+configuring fake nodes, see Documentation/x86/x86_64/boot-options.rst.
 
 For the purposes of this introduction, we'll assume a very primitive NUMA
 emulation setup of "numa=fake=4*512,".  This will split our system memory into
diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4ce575..a38d7273705a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3874,7 +3874,7 @@ F:	Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
 F:	Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
 F:	Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
 F:	Documentation/devicetree/bindings/sound/cirrus,lochnagar.txt
-F:	Documentation/hwmon/lochnagar
+F:	Documentation/hwmon/lochnagar.rst
 
 CISCO FCOE HBA DRIVER
 M:	Satish Kharat <satishkh@cisco.com>
@@ -11272,7 +11272,7 @@ NXP FXAS21002C DRIVER
 M:	Rui Miguel Silva <rmfrfs@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/iio/gyroscope/fxas21002c.txt
+F:	Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
 F:	drivers/iio/gyro/fxas21002c_core.c
 F:	drivers/iio/gyro/fxas21002c.h
 F:	drivers/iio/gyro/fxas21002c_i2c.c
@@ -13043,7 +13043,7 @@ M:	Niklas Cassel <niklas.cassel@linaro.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
-F:	Documentation/devicetree/bindings/net/qcom,dwmac.txt
+F:	Documentation/devicetree/bindings/net/qcom,ethqos.txt
 
 QUALCOMM GENERIC INTERFACE I2C DRIVER
 M:	Alok Chauhan <alokc@codeaurora.org>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8869742a85df..0f220264cc23 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1263,7 +1263,7 @@ config SMP
 	  uniprocessor machines. On a uniprocessor machine, the kernel
 	  will run faster if you say N here.
 
-	  See also <file:Documentation/x86/i386/IO-APIC.txt>,
+	  See also <file:Documentation/x86/i386/IO-APIC.rst>,
 	  <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO available at
 	  <http://tldp.org/HOWTO/SMP-HOWTO.html>.
 
diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 07bf740bea91..31cc2f423aa8 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -53,7 +53,7 @@ static void *image_load(struct kimage *image,
 
 	/*
 	 * We require a kernel with an unambiguous Image header. Per
-	 * Documentation/booting.txt, this is the case when image_size
+	 * Documentation/arm64/booting.txt, this is the case when image_size
 	 * is non-zero (practically speaking, since v3.17).
 	 */
 	h = (struct arm64_image_header *)kernel;
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..e868d2bd48b8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -898,7 +898,7 @@ config PPC_MEM_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/vm/protection-keys.rst
+	  For details, see Documentation/x86/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2bbbd4d1ba31..78fdf2dd71d1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -395,7 +395,7 @@ config SMP
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also <file:Documentation/x86/i386/IO-APIC.txt>,
+	  See also <file:Documentation/x86/i386/IO-APIC.rst>,
 	  <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO available at
 	  <http://www.tldp.org/docs.html#howto>.
 
@@ -1290,7 +1290,7 @@ config MICROCODE
 	  the Linux kernel.
 
 	  The preferred method to load microcode from a detached initrd is described
-	  in Documentation/x86/microcode.txt. For that you need to enable
+	  in Documentation/x86/microcode.rst. For that you need to enable
 	  CONFIG_BLK_DEV_INITRD in order for the loader to be able to scan the
 	  initrd for microcode blobs.
 
@@ -1329,7 +1329,7 @@ config MICROCODE_OLD_INTERFACE
 	  It is inadequate because it runs too late to be able to properly
 	  load microcode on a machine and it needs special tools. Instead, you
 	  should've switched to the early loading method with the initrd or
-	  builtin microcode by now: Documentation/x86/microcode.txt
+	  builtin microcode by now: Documentation/x86/microcode.rst
 
 config X86_MSR
 	tristate "/dev/cpu/*/msr - Model-specific register support"
@@ -1478,7 +1478,7 @@ config X86_5LEVEL
 	  A kernel with the option enabled can be booted on machines that
 	  support 4- or 5-level paging.
 
-	  See Documentation/x86/x86_64/5level-paging.txt for more
+	  See Documentation/x86/x86_64/5level-paging.rst for more
 	  information.
 
 	  Say N if unsure.
@@ -1626,7 +1626,7 @@ config ARCH_MEMORY_PROBE
 	depends on X86_64 && MEMORY_HOTPLUG
 	help
 	  This option enables a sysfs memory/probe interface for testing.
-	  See Documentation/memory-hotplug.txt for more information.
+	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
 	  If you are unsure how to answer this question, answer N.
 
 config ARCH_PROC_KCORE_TEXT
@@ -1783,7 +1783,7 @@ config MTRR
 	  You can safely say Y even if your machine doesn't have MTRRs, you'll
 	  just add about 9 KB to your kernel.
 
-	  See <file:Documentation/x86/mtrr.txt> for more information.
+	  See <file:Documentation/x86/mtrr.rst> for more information.
 
 config MTRR_SANITIZER
 	def_bool y
@@ -1895,7 +1895,7 @@ config X86_INTEL_MPX
 	  process and adds some branches to paths used during
 	  exec() and munmap().
 
-	  For details, see Documentation/x86/intel_mpx.txt
+	  For details, see Documentation/x86/intel_mpx.rst
 
 	  If unsure, say N.
 
@@ -1911,7 +1911,7 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/x86/protection-keys.txt
+	  For details, see Documentation/x86/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index f730680dc818..59f598543203 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -156,7 +156,7 @@ config IOMMU_DEBUG
 	  code. When you use it make sure you have a big enough
 	  IOMMU/AGP aperture.  Most of the options enabled by this can
 	  be set more finegrained using the iommu= command line
-	  options. See Documentation/x86/x86_64/boot-options.txt for more
+	  options. See Documentation/x86/x86_64/boot-options.rst for more
 	  details.
 
 config IOMMU_LEAK
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 850b8762e889..90d791ca1a95 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -313,7 +313,7 @@ start_sys_seg:	.word	SYSSEG		# obsolete and meaningless, but just
 
 type_of_loader:	.byte	0		# 0 means ancient bootloader, newer
 					# bootloaders know to change this.
-					# See Documentation/x86/boot.txt for
+					# See Documentation/x86/boot.rst for
 					# assigned ids
 
 # flags, unused bits must be zero (RFU) bit within loadflags
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 11aa3b2afa4d..33f9fc38d014 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -8,7 +8,7 @@
  *
  * entry.S contains the system-call and fault low-level handling routines.
  *
- * Some of this is documented in Documentation/x86/entry_64.txt
+ * Some of this is documented in Documentation/x86/entry_64.rst
  *
  * A note on terminology:
  * - iret frame:	Architecture defined interrupt frame from SS to RIP
diff --git a/arch/x86/include/asm/bootparam_utils.h b/arch/x86/include/asm/bootparam_utils.h
index f6f6ef436599..101eb944f13c 100644
--- a/arch/x86/include/asm/bootparam_utils.h
+++ b/arch/x86/include/asm/bootparam_utils.h
@@ -24,7 +24,7 @@ static void sanitize_boot_params(struct boot_params *boot_params)
 	 * IMPORTANT NOTE TO BOOTLOADER AUTHORS: do not simply clear
 	 * this field.  The purpose of this field is to guarantee
 	 * compliance with the x86 boot spec located in
-	 * Documentation/x86/boot.txt .  That spec says that the
+	 * Documentation/x86/boot.rst .  That spec says that the
 	 * *whole* structure should be cleared, after which only the
 	 * portion defined by struct setup_header (boot_params->hdr)
 	 * should be copied in.
diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index 793c14c372cb..288b065955b7 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -48,7 +48,7 @@
 
 #define __START_KERNEL_map	_AC(0xffffffff80000000, UL)
 
-/* See Documentation/x86/x86_64/mm.txt for a description of the memory map. */
+/* See Documentation/x86/x86_64/mm.rst for a description of the memory map. */
 
 #define __PHYSICAL_MASK_SHIFT	52
 
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 88bca456da99..52e5f5f2240d 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -103,7 +103,7 @@ extern unsigned int ptrs_per_p4d;
 #define PGDIR_MASK	(~(PGDIR_SIZE - 1))
 
 /*
- * See Documentation/x86/x86_64/mm.txt for a description of the memory map.
+ * See Documentation/x86/x86_64/mm.rst for a description of the memory map.
  *
  * Be very careful vs. KASLR when changing anything here. The KASLR address
  * range must not overlap with anything except the KASAN shadow area, which
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index e1f3ba19ba54..06d4e67f31ab 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -61,7 +61,7 @@ static u8 amd_ucode_patch[PATCH_MAX_SIZE];
 
 /*
  * Microcode patch container file is prepended to the initrd in cpio
- * format. See Documentation/x86/microcode.txt
+ * format. See Documentation/x86/microcode.rst
  */
 static const char
 ucode_path[] __maybe_unused = "kernel/x86/microcode/AuthenticAMD.bin";
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 22f60dd26460..b07e7069b09e 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -416,7 +416,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 	efi_map_offset = params_cmdline_sz;
 	efi_setup_data_offset = efi_map_offset + ALIGN(efi_map_sz, 16);
 
-	/* Copy setup header onto bootparams. Documentation/x86/boot.txt */
+	/* Copy setup header onto bootparams. Documentation/x86/boot.rst */
 	setup_header_size = 0x0202 + kernel[0x0201] - setup_hdr_offset;
 
 	/* Is there a limit on setup header size? */
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index dcd272dbd0a9..f62b498b18fb 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -70,7 +70,7 @@ void __init pci_iommu_alloc(void)
 }
 
 /*
- * See <Documentation/x86/x86_64/boot-options.txt> for the iommu kernel
+ * See <Documentation/x86/x86_64/boot-options.rst> for the iommu kernel
  * parameter documentation.
  */
 static __init int iommu_setup(char *p)
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 7f61431c75fb..400c1ba033aa 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -711,7 +711,7 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
 }
 
 /*
- * See Documentation/x86/tlb.txt for details.  We choose 33
+ * See Documentation/x86/tlb.rst for details.  We choose 33
  * because it is large enough to cover the vast majority (at
  * least 95%) of allocations, and is small enough that we are
  * confident it will not cause too much overhead.  Each single
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index 1861a2ba0f2b..c0a502f7e3a7 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -86,7 +86,7 @@ static void __init init_pvh_bootparams(bool xen_guest)
 	}
 
 	/*
-	 * See Documentation/x86/boot.txt.
+	 * See Documentation/x86/boot.rst.
 	 *
 	 * Version 2.12 supports Xen entry point but we will use default x86/PC
 	 * environment (i.e. hardware_subarch 0).
diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 283ee94224c6..2438f37f2ca1 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -333,7 +333,7 @@ config ACPI_CUSTOM_DSDT_FILE
 	depends on !STANDALONE
 	help
 	  This option supports a custom DSDT by linking it into the kernel.
-	  See Documentation/acpi/dsdt-override.txt
+	  See Documentation/admin-guide/acpi/dsdt-override.rst
 
 	  Enter the full path name to the file which includes the AmlCode
 	  or dsdt_aml_code declaration.
@@ -355,7 +355,7 @@ config ACPI_TABLE_UPGRADE
 	  This option provides functionality to upgrade arbitrary ACPI tables
 	  via initrd. No functional change if no ACPI tables are passed via
 	  initrd, therefore it's safe to say Y.
-	  See Documentation/acpi/initrd_table_override.txt for details
+	  See Documentation/admin-guide/acpi/initrd_table_override.rst for details
 
 config ACPI_TABLE_OVERRIDE_VIA_BUILTIN_INITRD
 	bool "Override ACPI tables from built-in initrd"
@@ -365,7 +365,7 @@ config ACPI_TABLE_OVERRIDE_VIA_BUILTIN_INITRD
 	  This option provides functionality to override arbitrary ACPI tables
 	  from built-in uncompressed initrd.
 
-	  See Documentation/acpi/initrd_table_override.txt for details
+	  See Documentation/admin-guide/acpi/initrd_table_override.rst for details
 
 config ACPI_DEBUG
 	bool "Debug Statements"
@@ -374,7 +374,7 @@ config ACPI_DEBUG
 	  output and increases the kernel size by around 50K.
 
 	  Use the acpi.debug_layer and acpi.debug_level kernel command-line
-	  parameters documented in Documentation/acpi/debug.txt and
+	  parameters documented in Documentation/firmware-guide/acpi/debug.rst and
 	  Documentation/admin-guide/kernel-parameters.rst to control the type and
 	  amount of debug output.
 
@@ -445,7 +445,7 @@ config ACPI_CUSTOM_METHOD
 	help
 	  This debug facility allows ACPI AML methods to be inserted and/or
 	  replaced without rebooting the system. For details refer to:
-	  Documentation/acpi/method-customizing.txt.
+	  Documentation/firmware-guide/acpi/method-customizing.rst.
 
 	  NOTE: This option is security sensitive, because it allows arbitrary
 	  kernel memory to be written to by root (uid=0) users, allowing them
diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index b17b79e612a3..ac6280ad43a1 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1075,7 +1075,7 @@ static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
 	}
 
 	/* Indicate that we support PAUSE frames (see comment in
-	 * Documentation/networking/phy.txt)
+	 * Documentation/networking/phy.rst)
 	 */
 	phy_support_asym_pause(phydev);
 
diff --git a/drivers/staging/fieldbus/Documentation/fieldbus_dev.txt b/drivers/staging/fieldbus/Documentation/fieldbus_dev.txt
index 56af3f650fa3..89fb8e14676f 100644
--- a/drivers/staging/fieldbus/Documentation/fieldbus_dev.txt
+++ b/drivers/staging/fieldbus/Documentation/fieldbus_dev.txt
@@ -54,8 +54,8 @@ a limited few common behaviours and properties. This allows us to define
 a simple interface consisting of a character device and a set of sysfs files:
 
 See:
-Documentation/ABI/testing/sysfs-class-fieldbus-dev
-Documentation/ABI/testing/fieldbus-dev-cdev
+drivers/staging/fieldbus/Documentation/ABI/sysfs-class-fieldbus-dev
+drivers/staging/fieldbus/Documentation/ABI/fieldbus-dev-cdev
 
 Note that this simple interface does not provide a way to modify adapter
 configuration settings. It is therefore useful only for adapters that get their
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 1e3ed41ae1f3..69938dbae2d0 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -1694,7 +1694,7 @@ EXPORT_SYMBOL_GPL(vhost_dev_ioctl);
 
 /* TODO: This is really inefficient.  We need something like get_user()
  * (instruction directly accesses the data, with an exception table entry
- * returning -EFAULT). See Documentation/x86/exception-tables.txt.
+ * returning -EFAULT). See Documentation/x86/exception-tables.rst.
  */
 static int set_bit_to_user(int nr, void __user *addr)
 {
diff --git a/include/acpi/acpi_drivers.h b/include/acpi/acpi_drivers.h
index de1804aeaf69..98e3db7a89cd 100644
--- a/include/acpi/acpi_drivers.h
+++ b/include/acpi/acpi_drivers.h
@@ -25,7 +25,7 @@
 #define ACPI_MAX_STRING			80
 
 /*
- * Please update drivers/acpi/debug.c and Documentation/acpi/debug.txt
+ * Please update drivers/acpi/debug.c and Documentation/firmware-guide/acpi/debug.rst
  * if you add to this list.
  */
 #define ACPI_BUS_COMPONENT		0x00010000
diff --git a/include/linux/fs_context.h b/include/linux/fs_context.h
index 1f966670c8dc..623eb58560b9 100644
--- a/include/linux/fs_context.h
+++ b/include/linux/fs_context.h
@@ -85,7 +85,7 @@ struct fs_parameter {
  * Superblock creation fills in ->root whereas reconfiguration begins with this
  * already set.
  *
- * See Documentation/filesystems/mounting.txt
+ * See Documentation/filesystems/mount_api.txt
  */
 struct fs_context {
 	const struct fs_context_operations *ops;
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 47f58cfb6a19..df1318d85f7d 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -77,7 +77,7 @@
  *	state.  This is called immediately after commit_creds().
  *
  * Security hooks for mount using fs_context.
- *	[See also Documentation/filesystems/mounting.txt]
+ *	[See also Documentation/filesystems/mount_api.txt]
  *
  * @fs_context_dup:
  *	Allocate and attach a security structure to sc->security.  This pointer
diff --git a/mm/Kconfig b/mm/Kconfig
index ee8d1f311858..6e5fb81bde4b 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -165,7 +165,7 @@ config MEMORY_HOTPLUG_DEFAULT_ONLINE
 	  onlining policy (/sys/devices/system/memory/auto_online_blocks) which
 	  determines what happens to newly added memory regions. Policy setting
 	  can always be changed at runtime.
-	  See Documentation/memory-hotplug.txt for more information.
+	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
 
 	  Say Y here if you want all hot-plugged memory blocks to appear in
 	  'online' state by default.
diff --git a/security/Kconfig b/security/Kconfig
index aeac3676dd4d..6d75ed71970c 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -62,7 +62,7 @@ config PAGE_TABLE_ISOLATION
 	  ensuring that the majority of kernel addresses are not mapped
 	  into userspace.
 
-	  See Documentation/x86/pti.txt for more details.
+	  See Documentation/x86/pti.rst for more details.
 
 config SECURITY_INFINIBAND
 	bool "Infiniband Security Hooks"
diff --git a/tools/include/linux/err.h b/tools/include/linux/err.h
index 2f5a12b88a86..25f2bb3a991d 100644
--- a/tools/include/linux/err.h
+++ b/tools/include/linux/err.h
@@ -20,7 +20,7 @@
  * Userspace note:
  * The same principle works for userspace, because 'error' pointers
  * fall down to the unused hole far from user space, as described
- * in Documentation/x86/x86_64/mm.txt for x86_64 arch:
+ * in Documentation/x86/x86_64/mm.rst for x86_64 arch:
  *
  * 0000000000000000 - 00007fffffffffff (=47 bits) user space, different per mm hole caused by [48:63] sign extension
  * ffffffffffe00000 - ffffffffffffffff (=2 MB) unused hole
diff --git a/tools/objtool/Documentation/stack-validation.txt b/tools/objtool/Documentation/stack-validation.txt
index 4dd11a554b9b..de094670050b 100644
--- a/tools/objtool/Documentation/stack-validation.txt
+++ b/tools/objtool/Documentation/stack-validation.txt
@@ -21,7 +21,7 @@ instructions).  Similarly, it knows how to follow switch statements, for
 which gcc sometimes uses jump tables.
 
 (Objtool also has an 'orc generate' subcommand which generates debuginfo
-for the ORC unwinder.  See Documentation/x86/orc-unwinder.txt in the
+for the ORC unwinder.  See Documentation/x86/orc-unwinder.rst in the
 kernel tree for more details.)
 
 
@@ -101,7 +101,7 @@ b) ORC (Oops Rewind Capability) unwind table generation
    band.  So it doesn't affect runtime performance and it can be
    reliable even when interrupts or exceptions are involved.
 
-   For more details, see Documentation/x86/orc-unwinder.txt.
+   For more details, see Documentation/x86/orc-unwinder.rst.
 
 c) Higher live patching compatibility rate
 
diff --git a/tools/testing/selftests/x86/protection_keys.c b/tools/testing/selftests/x86/protection_keys.c
index 5d546dcdbc80..798a5ddeee55 100644
--- a/tools/testing/selftests/x86/protection_keys.c
+++ b/tools/testing/selftests/x86/protection_keys.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Tests x86 Memory Protection Keys (see Documentation/x86/protection-keys.txt)
+ * Tests x86 Memory Protection Keys (see Documentation/x86/protection-keys.rst)
  *
  * There are examples in here of:
  *  * how to set protection keys on memory
-- 
2.21.0

