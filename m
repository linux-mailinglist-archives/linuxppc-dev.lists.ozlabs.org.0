Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8D342BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:09:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J5hm39W6zDqVy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 19:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.85.208.195; helo=mail-lj1-f195.google.com;
 envelope-from=bhsharma@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J1nG6cqHzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 16:13:05 +1000 (AEST)
Received: by mail-lj1-f195.google.com with SMTP id m23so207744lje.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 23:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AEqsZw4ipa0Y+oNQeBxoS/aot+7Fb705bNxyWE6FSkw=;
 b=neU3wJWHD4ZKmsGitv6N8kMtU60NsVje2Jw7MqD1YhR0PnLN2yrgJkFl/RmBHZxUw2
 M775ubtreHlDCRRGXV37aMqQsflgMaG9e5jA4Aov6Gij8a0mdIfkveaOnKZDTF8CDGh5
 jaixeRI4xd+ppRviUhxg50zpd2JwdvK43yZcXN/Uqn6O487GPdOhqOzSDwGBTx+Q9ES1
 Wb6cyaRrdwJNFZ38vZZejdzS5JNDO5dTXExjz0AndAa/DsEGpynw8UFBUepz4frVBKal
 alT9BgVUkJuZkz7FmCGt8Tl6a+JUjwhX7qxWYwpvYt+6cPBxviGDrzZ8GyA5RuHu369H
 QW0w==
X-Gm-Message-State: APjAAAXGXYIvBe0fkRZKyuVjicBGBU3tMWf8ZcbU66y8/C0+ZWqDFj1t
 bH/xc+AL+93f3GdvIlhH2bPMUPfGtvsjUpYXMaoLdQ==
X-Google-Smtp-Source: APXvYqzTTb1X9rwQb0LptHLb7XAZkTpuMJ3EfOD/kPgZfM+XajZIKFyGUd1DcKJ3PCZK56fn3A09mDBT6BIBpNS6e2M=
X-Received: by 2002:a2e:3912:: with SMTP id g18mr7877169lja.38.1559628781074; 
 Mon, 03 Jun 2019 23:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
In-Reply-To: <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Tue, 4 Jun 2019 11:42:47 +0530
Message-ID: <CACi5LpMf1DqrKgUmbr528Qgxsc2z=YPu3925scte-J9unrd72w@mail.gmail.com>
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Jun 2019 19:07:14 +1000
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
 Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Kevin Hilman <khilman@baylibre.com>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, Alexander Popov <alex.popov@linux.com>,
 Qian Cai <cai@lca.pw>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
 Ding Xiang <dingxiang@cmss.chinamobile.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Tony Luck <tony.luck@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 James Morse <james.morse@arm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 linux-pci@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
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
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
 Devicetree List <devicetree@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Jerome Glisse <jglisse@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Juergen Gross <jgross@suse.com>, Denis Efremov <efremov@ispras.ru>,
 netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/30/2019 04:53 AM, Mauro Carvalho Chehab wrote:
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/acpi/dsd/leds.txt                  |  2 +-
>   Documentation/admin-guide/kernel-parameters.rst  |  6 +++---
>   Documentation/admin-guide/kernel-parameters.txt  | 16 ++++++++--------
>   Documentation/admin-guide/ras.rst                |  2 +-
>   .../devicetree/bindings/net/fsl-enetc.txt        |  7 +++----
>   .../bindings/pci/amlogic,meson-pcie.txt          |  2 +-
>   .../bindings/regulator/qcom,rpmh-regulator.txt   |  2 +-
>   Documentation/devicetree/booting-without-of.txt  |  2 +-
>   Documentation/driver-api/gpio/board.rst          |  2 +-
>   Documentation/driver-api/gpio/consumer.rst       |  2 +-
>   .../firmware-guide/acpi/enumeration.rst          |  2 +-
>   .../firmware-guide/acpi/method-tracing.rst       |  2 +-
>   Documentation/i2c/instantiating-devices          |  2 +-
>   Documentation/sysctl/kernel.txt                  |  4 ++--
>   .../translations/it_IT/process/howto.rst         |  2 +-
>   .../it_IT/process/stable-kernel-rules.rst        |  4 ++--
>   .../translations/zh_CN/process/4.Coding.rst      |  2 +-
>   Documentation/x86/x86_64/5level-paging.rst       |  2 +-
>   Documentation/x86/x86_64/boot-options.rst        |  4 ++--
>   .../x86/x86_64/fake-numa-for-cpusets.rst         |  2 +-
>   MAINTAINERS                                      |  6 +++---
>   arch/arm/Kconfig                                 |  2 +-
>   arch/arm64/kernel/kexec_image.c                  |  2 +-
>   arch/powerpc/Kconfig                             |  2 +-
>   arch/x86/Kconfig                                 | 16 ++++++++--------
>   arch/x86/Kconfig.debug                           |  2 +-
>   arch/x86/boot/header.S                           |  2 +-
>   arch/x86/entry/entry_64.S                        |  2 +-
>   arch/x86/include/asm/bootparam_utils.h           |  2 +-
>   arch/x86/include/asm/page_64_types.h             |  2 +-
>   arch/x86/include/asm/pgtable_64_types.h          |  2 +-
>   arch/x86/kernel/cpu/microcode/amd.c              |  2 +-
>   arch/x86/kernel/kexec-bzimage64.c                |  2 +-
>   arch/x86/kernel/pci-dma.c                        |  2 +-
>   arch/x86/mm/tlb.c                                |  2 +-
>   arch/x86/platform/pvh/enlighten.c                |  2 +-
>   drivers/acpi/Kconfig                             | 10 +++++-----
>   drivers/net/ethernet/faraday/ftgmac100.c         |  2 +-
>   .../fieldbus/Documentation/fieldbus_dev.txt      |  4 ++--
>   drivers/vhost/vhost.c                            |  2 +-
>   include/acpi/acpi_drivers.h                      |  2 +-
>   include/linux/fs_context.h                       |  2 +-
>   include/linux/lsm_hooks.h                        |  2 +-
>   mm/Kconfig                                       |  2 +-
>   security/Kconfig                                 |  2 +-
>   tools/include/linux/err.h                        |  2 +-
>   tools/objtool/Documentation/stack-validation.txt |  4 ++--
>   tools/testing/selftests/x86/protection_keys.c    |  2 +-
>   48 files changed, 77 insertions(+), 78 deletions(-)
>
> diff --git a/Documentation/acpi/dsd/leds.txt b/Documentation/acpi/dsd/led=
s.txt
> index 81a63af42ed2..cc58b1a574c5 100644
> --- a/Documentation/acpi/dsd/leds.txt
> +++ b/Documentation/acpi/dsd/leds.txt
> @@ -96,4 +96,4 @@ where
>       <URL:http://www.uefi.org/sites/default/files/resources/_DSD-hierarc=
hical-data-extension-UUID-v1.1.pdf>,
>       referenced 2019-02-21.
>
> -[7] Documentation/acpi/dsd/data-node-reference.txt
> +[7] Documentation/firmware-guide/acpi/dsd/data-node-references.rst
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentat=
ion/admin-guide/kernel-parameters.rst
> index 0124980dca2d..8d3273e32eb1 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -167,7 +167,7 @@ parameter is applicable::
>       X86-32  X86-32, aka i386 architecture is enabled.
>       X86-64  X86-64 architecture is enabled.
>                       More X86-64 boot options can be found in
> -                     Documentation/x86/x86_64/boot-options.txt .
> +                     Documentation/x86/x86_64/boot-options.rst.
>       X86     Either 32-bit or 64-bit x86 (same as X86-32+X86-64)
>       X86_UV  SGI UV support is enabled.
>       XEN     Xen support is enabled
> @@ -181,10 +181,10 @@ In addition, the following text indicates that the =
option::
>   Parameters denoted with BOOT are actually interpreted by the boot
>   loader, and have no meaning to the kernel directly.
>   Do not modify the syntax of boot loader parameters without extreme
> -need or coordination with <Documentation/x86/boot.txt>.
> +need or coordination with <Documentation/x86/boot.rst>.
>
>   There are also arch-specific kernel-parameters not documented here.
> -See for example <Documentation/x86/x86_64/boot-options.txt>.
> +See for example <Documentation/x86/x86_64/boot-options.rst>.
>
>   Note that ALL kernel parameters listed below are CASE SENSITIVE, and th=
at
>   a trailing =3D on the name of any parameter states that that parameter =
will
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 138f6664b2e2..4a02d1346635 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -53,7 +53,7 @@
>                       ACPI_DEBUG_PRINT statements, e.g.,
>                           ACPI_DEBUG_PRINT((ACPI_DB_INFO, ...
>                       The debug_level mask defaults to "info".  See
> -                     Documentation/acpi/debug.txt for more information a=
bout
> +                     Documentation/firmware-guide/acpi/debug.rst for mor=
e information about
>                       debug layers and levels.
>
>                       Enable processor driver info messages:
> @@ -963,7 +963,7 @@
>                       for details.
>
>       nompx           [X86] Disables Intel Memory Protection Extensions.
> -                     See Documentation/x86/intel_mpx.txt for more
> +                     See Documentation/x86/intel_mpx.rst for more
>                       information about the feature.
>
>       nopku           [X86] Disable Memory Protection Keys CPU feature fo=
und
> @@ -1189,7 +1189,7 @@
>                       that is to be dynamically loaded by Linux. If there=
 are
>                       multiple variables with the same name but with diff=
erent
>                       vendor GUIDs, all of them will be loaded. See
> -                     Documentation/acpi/ssdt-overlays.txt for details.
> +                     Documentation/admin-guide/acpi/ssdt-overlays.rst fo=
r details.
>
>
>       eisa_irq_edge=3D  [PARISC,HW]
> @@ -2383,7 +2383,7 @@
>
>       mce             [X86-32] Machine Check Exception
>
> -     mce=3Doption      [X86-64] See Documentation/x86/x86_64/boot-option=
s.txt
> +     mce=3Doption      [X86-64] See Documentation/x86/x86_64/boot-option=
s.rst
>
>       md=3D             [HW] RAID subsystems devices and level
>                       See Documentation/admin-guide/md.rst.
> @@ -2439,7 +2439,7 @@
>                       set according to the
>                       CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel config
>                       option.
> -                     See Documentation/memory-hotplug.txt.
> +                     See Documentation/admin-guide/mm/memory-hotplug.rst=
.
>
>       memmap=3Dexactmap [KNL,X86] Enable setting of an exact
>                       E820 memory map, as specified by the user.
> @@ -2528,7 +2528,7 @@
>                       mem_encrypt=3Don:         Activate SME
>                       mem_encrypt=3Doff:        Do not activate SME
>
> -                     Refer to Documentation/x86/amd-memory-encryption.tx=
t
> +                     Refer to Documentation/virtual/kvm/amd-memory-encry=
ption.rst
>                       for details on when memory encryption can be activa=
ted.
>
>       mem_sleep_default=3D      [SUSPEND] Default system suspend mode:
> @@ -3528,7 +3528,7 @@
>                       See Documentation/blockdev/paride.txt.
>
>       pirq=3D           [SMP,APIC] Manual mp-table setup
> -                     See Documentation/x86/i386/IO-APIC.txt.
> +                     See Documentation/x86/i386/IO-APIC.rst.
>
>       plip=3D           [PPT,NET] Parallel port network link
>                       Format: { parport<nr> | timid | 0 }
> @@ -5054,7 +5054,7 @@
>                       Can be used multiple times for multiple devices.
>
>       vga=3D            [BOOT,X86-32] Select a particular video mode
> -                     See Documentation/x86/boot.txt and
> +                     See Documentation/x86/boot.rst and
>                       Documentation/svga.txt.
>                       Use vga=3Dask for menu.
>                       This is actually a boot loader parameter; the value=
 is
> diff --git a/Documentation/admin-guide/ras.rst b/Documentation/admin-guid=
e/ras.rst
> index c7495e42e6f4..2b20f5f7380d 100644
> --- a/Documentation/admin-guide/ras.rst
> +++ b/Documentation/admin-guide/ras.rst
> @@ -199,7 +199,7 @@ Architecture (MCA)\ [#f3]_.
>     mode).
>
>   .. [#f3] For more details about the Machine Check Architecture (MCA),
> -  please read Documentation/x86/x86_64/machinecheck at the Kernel tree.
> +  please read Documentation/x86/x86_64/machinecheck.rst at the Kernel tr=
ee.
>
>   EDAC - Error Detection And Correction
>   *************************************
> diff --git a/Documentation/devicetree/bindings/net/fsl-enetc.txt b/Docume=
ntation/devicetree/bindings/net/fsl-enetc.txt
> index c812e25ae90f..25fc687419db 100644
> --- a/Documentation/devicetree/bindings/net/fsl-enetc.txt
> +++ b/Documentation/devicetree/bindings/net/fsl-enetc.txt
> @@ -16,8 +16,8 @@ Required properties:
>   In this case, the ENETC node should include a "mdio" sub-node
>   that in turn should contain the "ethernet-phy" node describing the
>   external phy.  Below properties are required, their bindings
> -already defined in ethernet.txt or phy.txt, under
> -Documentation/devicetree/bindings/net/*.
> +already defined in Documentation/devicetree/bindings/net/ethernet.txt or
> +Documentation/devicetree/bindings/net/phy.txt.
>
>   Required:
>
> @@ -51,8 +51,7 @@ Example:
>   connection:
>
>   In this case, the ENETC port node defines a fixed link connection,
> -as specified by "fixed-link.txt", under
> -Documentation/devicetree/bindings/net/*.
> +as specified by Documentation/devicetree/bindings/net/fixed-link.txt.
>
>   Required:
>
> diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt=
 b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> index 12b18f82d441..efa2c8b9b85a 100644
> --- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> @@ -3,7 +3,7 @@ Amlogic Meson AXG DWC PCIE SoC controller
>   Amlogic Meson PCIe host controller is based on the Synopsys DesignWare =
PCI core.
>   It shares common functions with the PCIe DesignWare core driver and
>   inherits common properties defined in
> -Documentation/devicetree/bindings/pci/designware-pci.txt.
> +Documentation/devicetree/bindings/pci/designware-pcie.txt.
>
>   Additional properties are described here:
>
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regula=
tor.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.t=
xt
> index 7ef2dbe48e8a..14d2eee96b3d 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> @@ -97,7 +97,7 @@ Second Level Nodes - Regulators
>                   sent for this regulator including those which are for a
>                   strictly lower power state.
>
> -Other properties defined in Documentation/devicetree/bindings/regulator.=
txt
> +Other properties defined in Documentation/devicetree/bindings/regulator/=
regulator.txt
>   may also be used.  regulator-initial-mode and regulator-allowed-modes m=
ay be
>   specified for VRM regulators using mode values from
>   include/dt-bindings/regulator/qcom,rpmh-regulator.h.  regulator-allow-b=
ypass
> diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentat=
ion/devicetree/booting-without-of.txt
> index e86bd2f64117..60f8640f2b2f 100644
> --- a/Documentation/devicetree/booting-without-of.txt
> +++ b/Documentation/devicetree/booting-without-of.txt
> @@ -277,7 +277,7 @@ it with special cases.
>     the decompressor (the real mode entry point goes to the same  32bit
>     entry point once it switched into protected mode). That entry point
>     supports one calling convention which is documented in
> -  Documentation/x86/boot.txt
> +  Documentation/x86/boot.rst
>     The physical pointer to the device-tree block (defined in chapter II)
>     is passed via setup_data which requires at least boot protocol 2.09.
>     The type filed is defined as
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driv=
er-api/gpio/board.rst
> index b37f3f7b8926..ce91518bf9f4 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -101,7 +101,7 @@ with the help of _DSD (Device Specific Data), introdu=
ced in ACPI 5.1::
>       }
>
>   For more information about the ACPI GPIO bindings see
> -Documentation/acpi/gpio-properties.txt.
> +Documentation/firmware-guide/acpi/gpio-properties.rst.
>
>   Platform Data
>   -------------
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 5e4d8aa68913..fdecb6d711db 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -437,7 +437,7 @@ case, it will be handled by the GPIO subsystem automa=
tically.  However, if the
>   _DSD is not present, the mappings between GpioIo()/GpioInt() resources =
and GPIO
>   connection IDs need to be provided by device drivers.
>
> -For details refer to Documentation/acpi/gpio-properties.txt
> +For details refer to Documentation/firmware-guide/acpi/gpio-properties.r=
st
>
>
>   Interacting With the Legacy GPIO Subsystem
> diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Document=
ation/firmware-guide/acpi/enumeration.rst
> index 850be9696931..1252617b520f 100644
> --- a/Documentation/firmware-guide/acpi/enumeration.rst
> +++ b/Documentation/firmware-guide/acpi/enumeration.rst
> @@ -339,7 +339,7 @@ a code like this::
>   There are also devm_* versions of these functions which release the
>   descriptors once the device is released.
>
> -See Documentation/acpi/gpio-properties.txt for more information about th=
e
> +See Documentation/firmware-guide/acpi/gpio-properties.rst for more infor=
mation about the
>   _DSD binding related to GPIOs.
>
>   MFD devices
> diff --git a/Documentation/firmware-guide/acpi/method-tracing.rst b/Docum=
entation/firmware-guide/acpi/method-tracing.rst
> index d0b077b73f5f..0aa7e2c5d32a 100644
> --- a/Documentation/firmware-guide/acpi/method-tracing.rst
> +++ b/Documentation/firmware-guide/acpi/method-tracing.rst
> @@ -68,7 +68,7 @@ c. Filter out the debug layer/level matched logs when t=
he specified
>
>   Where:
>      0xXXXXXXXX/0xYYYYYYYY
> -     Refer to Documentation/acpi/debug.txt for possible debug layer/leve=
l
> +     Refer to Documentation/firmware-guide/acpi/debug.rst for possible d=
ebug layer/level
>        masking values.
>      \PPPP.AAAA.TTTT.HHHH
>        Full path of a control method that can be found in the ACPI namesp=
ace.
> diff --git a/Documentation/i2c/instantiating-devices b/Documentation/i2c/=
instantiating-devices
> index 0d85ac1935b7..5a3e2f331e8c 100644
> --- a/Documentation/i2c/instantiating-devices
> +++ b/Documentation/i2c/instantiating-devices
> @@ -85,7 +85,7 @@ Method 1c: Declare the I2C devices via ACPI
>   -------------------------------------------
>
>   ACPI can also describe I2C devices. There is special documentation for =
this
> -which is currently located at Documentation/acpi/enumeration.txt.
> +which is currently located at Documentation/firmware-guide/acpi/enumerat=
ion.rst.
>
>
>   Method 2: Instantiate the devices explicitly
> diff --git a/Documentation/sysctl/kernel.txt b/Documentation/sysctl/kerne=
l.txt
> index f0c86fbb3b48..92f7f34b021a 100644
> --- a/Documentation/sysctl/kernel.txt
> +++ b/Documentation/sysctl/kernel.txt
> @@ -155,7 +155,7 @@ is 0x15 and the full version number is 0x234, this fi=
le will contain
>   the value 340 =3D 0x154.
>
>   See the type_of_loader and ext_loader_type fields in
> -Documentation/x86/boot.txt for additional information.
> +Documentation/x86/boot.rst for additional information.
>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> @@ -167,7 +167,7 @@ The complete bootloader version number.  In the examp=
le above, this
>   file will contain the value 564 =3D 0x234.
>
>   See the type_of_loader and ext_loader_ver fields in
> -Documentation/x86/boot.txt for additional information.
> +Documentation/x86/boot.rst for additional information.
>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/Documentation/translations/it_IT/process/howto.rst b/Documen=
tation/translations/it_IT/process/howto.rst
> index 9903ac7c566b..44e6077730e8 100644
> --- a/Documentation/translations/it_IT/process/howto.rst
> +++ b/Documentation/translations/it_IT/process/howto.rst
> @@ -131,7 +131,7 @@ Di seguito una lista di file che sono presenti nei so=
rgente del kernel e che
>       "Linux kernel patch submission format"
>               http://linux.yyz.us/patch-format.html
>
> -  :ref:`Documentation/process/translations/it_IT/stable-api-nonsense.rst=
 <it_stable_api_nonsense>`
> +  :ref:`Documentation/translations/it_IT/process/stable-api-nonsense.rst=
 <it_stable_api_nonsense>`
>
>       Questo file descrive la motivazioni sottostanti la conscia decision=
e di
>       non avere un API stabile all'interno del kernel, incluso cose come:
> diff --git a/Documentation/translations/it_IT/process/stable-kernel-rules=
.rst b/Documentation/translations/it_IT/process/stable-kernel-rules.rst
> index 48e88e5ad2c5..4f206cee31a7 100644
> --- a/Documentation/translations/it_IT/process/stable-kernel-rules.rst
> +++ b/Documentation/translations/it_IT/process/stable-kernel-rules.rst
> @@ -33,7 +33,7 @@ Regole sul tipo di patch che vengono o non vengono acce=
ttate nei sorgenti
>    - Non deve includere alcuna correzione "banale" (correzioni grammatica=
li,
>      pulizia dagli spazi bianchi, eccetera).
>    - Deve rispettare le regole scritte in
> -   :ref:`Documentation/translation/it_IT/process/submitting-patches.rst =
<it_submittingpatches>`
> +   :ref:`Documentation/translations/it_IT/process/submitting-patches.rst=
 <it_submittingpatches>`
>    - Questa patch o una equivalente deve esistere gi=C3=A0 nei sorgenti p=
rincipali di
>      Linux
>
> @@ -43,7 +43,7 @@ Procedura per sottomettere patch per i sorgenti -stable
>
>    - Se la patch contiene modifiche a dei file nelle cartelle net/ o driv=
ers/net,
>      allora seguite le linee guida descritte in
> -   :ref:`Documentation/translation/it_IT/networking/netdev-FAQ.rst <it_n=
etdev-FAQ>`;
> +   :ref:`Documentation/translations/it_IT/networking/netdev-FAQ.rst <it_=
netdev-FAQ>`;
>      ma solo dopo aver verificato al seguente indirizzo che la patch non =
sia
>      gi=C3=A0 in coda:
>      https://patchwork.ozlabs.org/bundle/davem/stable/?series=3D&submitte=
r=3D&state=3D*&q=3D&archive=3D
> diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Docu=
mentation/translations/zh_CN/process/4.Coding.rst
> index 5301e9d55255..8bb777941394 100644
> --- a/Documentation/translations/zh_CN/process/4.Coding.rst
> +++ b/Documentation/translations/zh_CN/process/4.Coding.rst
> @@ -241,7 +241,7 @@ scripts/coccinelle=E7=9B=AE=E5=BD=95=E4=B8=8B=E5=B7=
=B2=E7=BB=8F=E6=89=93=E5=8C=85=E4=BA=86=E7=9B=B8=E5=BD=93=E5=A4=9A=E7=9A=84=
=E5=86=85=E6=A0=B8=E2=80=9C=E8=AF=AD=E4=B9=89=E8=A1=A5=E4=B8=81=E2=80=9D
>
>   =E4=BB=BB=E4=BD=95=E6=B7=BB=E5=8A=A0=E6=96=B0=E7=94=A8=E6=88=B7=E7=A9=
=BA=E9=97=B4=E7=95=8C=E9=9D=A2=E7=9A=84=E4=BB=A3=E7=A0=81=EF=BC=88=E5=8C=85=
=E6=8B=AC=E6=96=B0=E7=9A=84sysfs=E6=88=96/proc=E6=96=87=E4=BB=B6=EF=BC=89=
=E9=83=BD=E5=BA=94=E8=AF=A5=E5=8C=85=E5=90=AB=E8=AF=A5=E7=95=8C=E9=9D=A2=E7=
=9A=84
>   =E6=96=87=E6=A1=A3=EF=BC=8C=E8=AF=A5=E6=96=87=E6=A1=A3=E4=BD=BF=E7=94=
=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E5=BC=80=E5=8F=91=E4=BA=BA=E5=91=98=E8=83=BD=
=E5=A4=9F=E7=9F=A5=E9=81=93=E4=BB=96=E4=BB=AC=E5=9C=A8=E4=BD=BF=E7=94=A8=E4=
=BB=80=E4=B9=88=E3=80=82=E8=AF=B7=E5=8F=82=E9=98=85
> -Documentation/abi/readme=EF=BC=8C=E4=BA=86=E8=A7=A3=E5=A6=82=E4=BD=95=E6=
=A0=BC=E5=BC=8F=E5=8C=96=E6=AD=A4=E6=96=87=E6=A1=A3=E4=BB=A5=E5=8F=8A=E9=9C=
=80=E8=A6=81=E6=8F=90=E4=BE=9B=E5=93=AA=E4=BA=9B=E4=BF=A1=E6=81=AF=E3=80=82
> +Documentation/ABI/README=EF=BC=8C=E4=BA=86=E8=A7=A3=E5=A6=82=E4=BD=95=E6=
=A0=BC=E5=BC=8F=E5=8C=96=E6=AD=A4=E6=96=87=E6=A1=A3=E4=BB=A5=E5=8F=8A=E9=9C=
=80=E8=A6=81=E6=8F=90=E4=BE=9B=E5=93=AA=E4=BA=9B=E4=BF=A1=E6=81=AF=E3=80=82
>
>   =E6=96=87=E4=BB=B6 :ref:`Documentation/admin-guide/kernel-parameters.rs=
t <kernelparameters>`
>   =E6=8F=8F=E8=BF=B0=E4=BA=86=E5=86=85=E6=A0=B8=E7=9A=84=E6=89=80=E6=9C=
=89=E5=BC=95=E5=AF=BC=E6=97=B6=E9=97=B4=E5=8F=82=E6=95=B0=E3=80=82=E4=BB=BB=
=E4=BD=95=E6=B7=BB=E5=8A=A0=E6=96=B0=E5=8F=82=E6=95=B0=E7=9A=84=E8=A1=A5=E4=
=B8=81=E9=83=BD=E5=BA=94=E8=AF=A5=E5=90=91=E8=AF=A5=E6=96=87=E4=BB=B6=E6=B7=
=BB=E5=8A=A0=E9=80=82=E5=BD=93=E7=9A=84
> diff --git a/Documentation/x86/x86_64/5level-paging.rst b/Documentation/x=
86/x86_64/5level-paging.rst
> index ab88a4514163..44856417e6a5 100644
> --- a/Documentation/x86/x86_64/5level-paging.rst
> +++ b/Documentation/x86/x86_64/5level-paging.rst
> @@ -20,7 +20,7 @@ physical address space. This "ought to be enough for an=
ybody" =C2=A9.
>   QEMU 2.9 and later support 5-level paging.
>
>   Virtual memory layout for 5-level paging is described in
> -Documentation/x86/x86_64/mm.txt
> +Documentation/x86/x86_64/mm.rst
>
>
>   Enabling 5-level paging
> diff --git a/Documentation/x86/x86_64/boot-options.rst b/Documentation/x8=
6/x86_64/boot-options.rst
> index 2f69836b8445..6a4285a3c7a4 100644
> --- a/Documentation/x86/x86_64/boot-options.rst
> +++ b/Documentation/x86/x86_64/boot-options.rst
> @@ -9,7 +9,7 @@ only the AMD64 specific ones are listed here.
>
>   Machine check
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Please see Documentation/x86/x86_64/machinecheck for sysfs runtime tunab=
les.
> +Please see Documentation/x86/x86_64/machinecheck.rst for sysfs runtime t=
unables.
>
>      mce=3Doff
>               Disable machine check
> @@ -89,7 +89,7 @@ APICs
>        Don't use the local APIC (alias for i386 compatibility)
>
>      pirq=3D...
> -     See Documentation/x86/i386/IO-APIC.txt
> +     See Documentation/x86/i386/IO-APIC.rst
>
>      noapictimer
>       Don't set up the APIC timer
> diff --git a/Documentation/x86/x86_64/fake-numa-for-cpusets.rst b/Documen=
tation/x86/x86_64/fake-numa-for-cpusets.rst
> index 74fbb78b3c67..04df57b9aa3f 100644
> --- a/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
> +++ b/Documentation/x86/x86_64/fake-numa-for-cpusets.rst
> @@ -18,7 +18,7 @@ For more information on the features of cpusets, see
>   Documentation/cgroup-v1/cpusets.txt.
>   There are a number of different configurations you can use for your nee=
ds.  For
>   more information on the numa=3Dfake command line option and its various=
 ways of
> -configuring fake nodes, see Documentation/x86/x86_64/boot-options.txt.
> +configuring fake nodes, see Documentation/x86/x86_64/boot-options.rst.
>
>   For the purposes of this introduction, we'll assume a very primitive NU=
MA
>   emulation setup of "numa=3Dfake=3D4*512,".  This will split our system =
memory into
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5cfbea4ce575..a38d7273705a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3874,7 +3874,7 @@ F:      Documentation/devicetree/bindings/hwmon/cir=
rus,lochnagar.txt
>   F:  Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
>   F:  Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
>   F:  Documentation/devicetree/bindings/sound/cirrus,lochnagar.txt
> -F:   Documentation/hwmon/lochnagar
> +F:   Documentation/hwmon/lochnagar.rst
>
>   CISCO FCOE HBA DRIVER
>   M:  Satish Kharat <satishkh@cisco.com>
> @@ -11272,7 +11272,7 @@ NXP FXAS21002C DRIVER
>   M:  Rui Miguel Silva <rmfrfs@gmail.com>
>   L:  linux-iio@vger.kernel.org
>   S:  Maintained
> -F:   Documentation/devicetree/bindings/iio/gyroscope/fxas21002c.txt
> +F:   Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
>   F:  drivers/iio/gyro/fxas21002c_core.c
>   F:  drivers/iio/gyro/fxas21002c.h
>   F:  drivers/iio/gyro/fxas21002c_i2c.c
> @@ -13043,7 +13043,7 @@ M:    Niklas Cassel <niklas.cassel@linaro.org>
>   L:  netdev@vger.kernel.org
>   S:  Maintained
>   F:  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> -F:   Documentation/devicetree/bindings/net/qcom,dwmac.txt
> +F:   Documentation/devicetree/bindings/net/qcom,ethqos.txt
>
>   QUALCOMM GENERIC INTERFACE I2C DRIVER
>   M:  Alok Chauhan <alokc@codeaurora.org>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 8869742a85df..0f220264cc23 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1263,7 +1263,7 @@ config SMP
>         uniprocessor machines. On a uniprocessor machine, the kernel
>         will run faster if you say N here.
>
> -       See also <file:Documentation/x86/i386/IO-APIC.txt>,
> +       See also <file:Documentation/x86/i386/IO-APIC.rst>,
>         <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO avail=
able at
>         <http://tldp.org/HOWTO/SMP-HOWTO.html>.
>
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_im=
age.c
> index 07bf740bea91..31cc2f423aa8 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -53,7 +53,7 @@ static void *image_load(struct kimage *image,
>
>       /*
>        * We require a kernel with an unambiguous Image header. Per
> -      * Documentation/booting.txt, this is the case when image_size
> +      * Documentation/arm64/booting.txt, this is the case when image_siz=
e
>        * is non-zero (practically speaking, since v3.17).
>        */
>       h =3D (struct arm64_image_header *)kernel;
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..e868d2bd48b8 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -898,7 +898,7 @@ config PPC_MEM_KEYS
>         page-based protections, but without requiring modification of the
>         page tables when an application changes protection domains.
>
> -       For details, see Documentation/vm/protection-keys.rst
> +       For details, see Documentation/x86/protection-keys.rst
>
>         If unsure, say y.
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 2bbbd4d1ba31..78fdf2dd71d1 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -395,7 +395,7 @@ config SMP
>         Y to "Enhanced Real Time Clock Support", below. The "Advanced Pow=
er
>         Management" code will be disabled if you say Y here.
>
> -       See also <file:Documentation/x86/i386/IO-APIC.txt>,
> +       See also <file:Documentation/x86/i386/IO-APIC.rst>,
>         <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO avail=
able at
>         <http://www.tldp.org/docs.html#howto>.
>
> @@ -1290,7 +1290,7 @@ config MICROCODE
>         the Linux kernel.
>
>         The preferred method to load microcode from a detached initrd is =
described
> -       in Documentation/x86/microcode.txt. For that you need to enable
> +       in Documentation/x86/microcode.rst. For that you need to enable
>         CONFIG_BLK_DEV_INITRD in order for the loader to be able to scan =
the
>         initrd for microcode blobs.
>
> @@ -1329,7 +1329,7 @@ config MICROCODE_OLD_INTERFACE
>         It is inadequate because it runs too late to be able to properly
>         load microcode on a machine and it needs special tools. Instead, =
you
>         should've switched to the early loading method with the initrd or
> -       builtin microcode by now: Documentation/x86/microcode.txt
> +       builtin microcode by now: Documentation/x86/microcode.rst
>
>   config X86_MSR
>       tristate "/dev/cpu/*/msr - Model-specific register support"
> @@ -1478,7 +1478,7 @@ config X86_5LEVEL
>         A kernel with the option enabled can be booted on machines that
>         support 4- or 5-level paging.
>
> -       See Documentation/x86/x86_64/5level-paging.txt for more
> +       See Documentation/x86/x86_64/5level-paging.rst for more
>         information.
>
>         Say N if unsure.
> @@ -1626,7 +1626,7 @@ config ARCH_MEMORY_PROBE
>       depends on X86_64 && MEMORY_HOTPLUG
>       help
>         This option enables a sysfs memory/probe interface for testing.
> -       See Documentation/memory-hotplug.txt for more information.
> +       See Documentation/admin-guide/mm/memory-hotplug.rst for more info=
rmation.
>         If you are unsure how to answer this question, answer N.
>
>   config ARCH_PROC_KCORE_TEXT
> @@ -1783,7 +1783,7 @@ config MTRR
>         You can safely say Y even if your machine doesn't have MTRRs, you=
'll
>         just add about 9 KB to your kernel.
>
> -       See <file:Documentation/x86/mtrr.txt> for more information.
> +       See <file:Documentation/x86/mtrr.rst> for more information.
>
>   config MTRR_SANITIZER
>       def_bool y
> @@ -1895,7 +1895,7 @@ config X86_INTEL_MPX
>         process and adds some branches to paths used during
>         exec() and munmap().
>
> -       For details, see Documentation/x86/intel_mpx.txt
> +       For details, see Documentation/x86/intel_mpx.rst
>
>         If unsure, say N.
>
> @@ -1911,7 +1911,7 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
>         page-based protections, but without requiring modification of the
>         page tables when an application changes protection domains.
>
> -       For details, see Documentation/x86/protection-keys.txt
> +       For details, see Documentation/x86/protection-keys.rst
>
>         If unsure, say y.
>
> diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
> index f730680dc818..59f598543203 100644
> --- a/arch/x86/Kconfig.debug
> +++ b/arch/x86/Kconfig.debug
> @@ -156,7 +156,7 @@ config IOMMU_DEBUG
>         code. When you use it make sure you have a big enough
>         IOMMU/AGP aperture.  Most of the options enabled by this can
>         be set more finegrained using the iommu=3D command line
> -       options. See Documentation/x86/x86_64/boot-options.txt for more
> +       options. See Documentation/x86/x86_64/boot-options.rst for more
>         details.
>
>   config IOMMU_LEAK
> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> index 850b8762e889..90d791ca1a95 100644
> --- a/arch/x86/boot/header.S
> +++ b/arch/x86/boot/header.S
> @@ -313,7 +313,7 @@ start_sys_seg:    .word   SYSSEG          # obsolete =
and meaningless, but just
>
>   type_of_loader:     .byte   0               # 0 means ancient bootloade=
r, newer
>                                       # bootloaders know to change this.
> -                                     # See Documentation/x86/boot.txt fo=
r
> +                                     # See Documentation/x86/boot.rst fo=
r
>                                       # assigned ids
>
>   # flags, unused bits must be zero (RFU) bit within loadflags
> diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> index 11aa3b2afa4d..33f9fc38d014 100644
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -8,7 +8,7 @@
>    *
>    * entry.S contains the system-call and fault low-level handling routin=
es.
>    *
> - * Some of this is documented in Documentation/x86/entry_64.txt
> + * Some of this is documented in Documentation/x86/entry_64.rst
>    *
>    * A note on terminology:
>    * - iret frame:    Architecture defined interrupt frame from SS to RIP
> diff --git a/arch/x86/include/asm/bootparam_utils.h b/arch/x86/include/as=
m/bootparam_utils.h
> index f6f6ef436599..101eb944f13c 100644
> --- a/arch/x86/include/asm/bootparam_utils.h
> +++ b/arch/x86/include/asm/bootparam_utils.h
> @@ -24,7 +24,7 @@ static void sanitize_boot_params(struct boot_params *bo=
ot_params)
>        * IMPORTANT NOTE TO BOOTLOADER AUTHORS: do not simply clear
>        * this field.  The purpose of this field is to guarantee
>        * compliance with the x86 boot spec located in
> -      * Documentation/x86/boot.txt .  That spec says that the
> +      * Documentation/x86/boot.rst .  That spec says that the
>        * *whole* structure should be cleared, after which only the
>        * portion defined by struct setup_header (boot_params->hdr)
>        * should be copied in.
> diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/=
page_64_types.h
> index 793c14c372cb..288b065955b7 100644
> --- a/arch/x86/include/asm/page_64_types.h
> +++ b/arch/x86/include/asm/page_64_types.h
> @@ -48,7 +48,7 @@
>
>   #define __START_KERNEL_map  _AC(0xffffffff80000000, UL)
>
> -/* See Documentation/x86/x86_64/mm.txt for a description of the memory m=
ap. */
> +/* See Documentation/x86/x86_64/mm.rst for a description of the memory m=
ap. */
>
>   #define __PHYSICAL_MASK_SHIFT       52
>
> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/a=
sm/pgtable_64_types.h
> index 88bca456da99..52e5f5f2240d 100644
> --- a/arch/x86/include/asm/pgtable_64_types.h
> +++ b/arch/x86/include/asm/pgtable_64_types.h
> @@ -103,7 +103,7 @@ extern unsigned int ptrs_per_p4d;
>   #define PGDIR_MASK  (~(PGDIR_SIZE - 1))
>
>   /*
> - * See Documentation/x86/x86_64/mm.txt for a description of the memory m=
ap.
> + * See Documentation/x86/x86_64/mm.rst for a description of the memory m=
ap.
>    *
>    * Be very careful vs. KASLR when changing anything here. The KASLR add=
ress
>    * range must not overlap with anything except the KASAN shadow area, w=
hich
> diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/mi=
crocode/amd.c
> index e1f3ba19ba54..06d4e67f31ab 100644
> --- a/arch/x86/kernel/cpu/microcode/amd.c
> +++ b/arch/x86/kernel/cpu/microcode/amd.c
> @@ -61,7 +61,7 @@ static u8 amd_ucode_patch[PATCH_MAX_SIZE];
>
>   /*
>    * Microcode patch container file is prepended to the initrd in cpio
> - * format. See Documentation/x86/microcode.txt
> + * format. See Documentation/x86/microcode.rst
>    */
>   static const char
>   ucode_path[] __maybe_unused =3D "kernel/x86/microcode/AuthenticAMD.bin"=
;
> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bz=
image64.c
> index 22f60dd26460..b07e7069b09e 100644
> --- a/arch/x86/kernel/kexec-bzimage64.c
> +++ b/arch/x86/kernel/kexec-bzimage64.c
> @@ -416,7 +416,7 @@ static void *bzImage64_load(struct kimage *image, cha=
r *kernel,
>       efi_map_offset =3D params_cmdline_sz;
>       efi_setup_data_offset =3D efi_map_offset + ALIGN(efi_map_sz, 16);
>
> -     /* Copy setup header onto bootparams. Documentation/x86/boot.txt */
> +     /* Copy setup header onto bootparams. Documentation/x86/boot.rst */
>       setup_header_size =3D 0x0202 + kernel[0x0201] - setup_hdr_offset;

For the arm, arm64 and x86 kexec bits:

Reviewed-by: Bhupesh Sharma <bhsharma@redhat.com>

Thanks,
Bhupesh
