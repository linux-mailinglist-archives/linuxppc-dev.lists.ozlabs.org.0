Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F16E77D311
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 04:14:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zYkn3VY0zDqnp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 12:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=2001:df5:b000:5::4; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chrisp@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="n8/0XorC"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zYhx2vJBzDqgG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 12:12:33 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 268C6806CB;
 Thu,  1 Aug 2019 14:12:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1564625550;
 bh=BJLWyjePC2+DBjwmNFu0d5Smcae6KotI87TPj31Ta1s=;
 h=From:To:Cc:Subject:Date;
 b=n8/0XorCrJswqUn9NfbqYYPlt64vFpvc3/IhMiayXavNkA/vKYF6Rz4sfeo3C5rtI
 3NIUbnx5tkYijcT//IQ+9LOWLUIwnopClchyGUvil0dUyldFuO9Zj6RfZdCWAQSDZZ
 YIdZyfNhq+A+fn+sjzIMj9i/BvgyPppa2so5xZGOqekNgAlii7samzZJT0aDSpjEBO
 bfJcd23OmkUc+n9ZhuHQ+K0VbRJysMLZQ2quQFTNtXmSvX/ERIUYp7e9rGkBX9waPJ
 71pbl8iZWkcCle//8nbQFT6YG1bUHAZKTlSuT50ztGEPnke0uTbFCP4MUYXgSdhSni
 NtwVnR0NRUJEw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5d424a8d0000>; Thu, 01 Aug 2019 14:12:29 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 7023313EEED;
 Thu,  1 Aug 2019 14:12:31 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 330BC1E0504; Thu,  1 Aug 2019 14:12:29 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr, malat@debian.org
Subject: [PATCH v2] powerpc: Support CMDLINE_EXTEND
Date: Thu,  1 Aug 2019 14:12:06 +1200
Message-Id: <20190801021206.26799-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bring powerpc in line with other architectures that support extending or
overriding the bootloader provided command line.

The current behaviour is most like CMDLINE_FROM_BOOTLOADER where the
bootloader command line is preferred but the kernel config can provide a
fallback so CMDLINE_FROM_BOOTLOADER is the default. CMDLINE_EXTEND can
be used to append the CMDLINE from the kernel config to the one provided
by the bootloader.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
While I'm at it does anyone think it's worth getting rid of the default C=
MDLINE
value if CMDLINE_BOOL and maybe CMDLINE_BOOL? Every defconfig in the kern=
el
that sets CMDLINE_BOOL=3Dy also sets CMDLINE to something other than
"console=3DttyS0,9600 console=3Dtty0 root=3D/dev/sda2". Removing CMDLINE_=
BOOL and
unconditionally setting the default value of CMDLINE to "" would clean up=
 the
Kconfig even more.

Changes in v2:
- incorporate ideas from Christope's patch https://patchwork.ozlabs.org/p=
atch/1074126/

 arch/powerpc/Kconfig            | 20 +++++++++++++++++++-
 arch/powerpc/kernel/prom_init.c | 26 +++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 77f6ebf97113..d413fe1b4058 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -852,15 +852,33 @@ config CMDLINE
 	  some command-line options at build time by entering them here.  In
 	  most cases you will need to specify the root device here.
=20
+choice
+	prompt "Kernel command line type" if CMDLINE !=3D ""
+	default CMDLINE_FROM_BOOTLOADER
+
+config CMDLINE_FROM_BOOTLOADER
+	bool "Use bootloader kernel arguments if available"
+	help
+	  Uses the command-line options passed by the boot loader. If
+	  the boot loader doesn't provide any, the default kernel command
+	  string provided in CMDLINE will be used.
+
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The command-line arguments provided by the boot loader will be
+	  appended to the default kernel command string.
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
-	depends on CMDLINE_BOOL
 	help
 	  Always use the default kernel command string, even if the boot
 	  loader passes other arguments to the kernel.
 	  This is useful if you cannot or don't want to change the
 	  command-line options your boot loader passes to the kernel.
=20
+endchoice
+
 config EXTRA_TARGETS
 	string "Additional default image types"
 	help
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
index 514707ef6779..df29f141dbd2 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -310,6 +310,25 @@ static size_t __init prom_strlcpy(char *dest, const =
char *src, size_t size)
 	return ret;
 }
=20
+static size_t __init prom_strlcat(char *dest, const char *src, size_t co=
unt)
+{
+	size_t dsize =3D prom_strlen(dest);
+	size_t len =3D prom_strlen(src);
+	size_t res =3D dsize + len;
+
+	/* This would be a bug */
+	BUG_ON(dsize >=3D count);
+
+	dest +=3D dsize;
+	count -=3D dsize;
+	if (len >=3D count)
+		len =3D count-1;
+	memcpy(dest, src, len);
+	dest[len] =3D 0;
+	return res;
+
+}
+
 #ifdef CONFIG_PPC_PSERIES
 static int __init prom_strtobool(const char *s, bool *res)
 {
@@ -761,8 +780,13 @@ static void __init early_cmdline_parse(void)
 	p =3D prom_cmd_line;
 	if ((long)prom.chosen > 0)
 		l =3D prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
-	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) && (l <=3D 0 || p[0] =3D=3D '\0')) =
/* dbl check */
+
+	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || l <=3D 0 || p[0] =3D=3D '\0')
 		prom_strlcpy(prom_cmd_line, CONFIG_CMDLINE, sizeof(prom_cmd_line));
+	else if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
+		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
+			     sizeof(prom_cmd_line));
+
 	prom_printf("command line: %s\n", prom_cmd_line);
=20
 #ifdef CONFIG_PPC64
--=20
2.22.0

