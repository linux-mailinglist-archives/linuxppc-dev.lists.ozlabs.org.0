Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C37E60F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 00:52:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4605CS4y2qzDqgZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 08:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=202.36.163.20; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chrisp@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="cbGOYfl3"; dkim-atps=neutral
X-Greylist: delayed 74260 seconds by postgrey-1.36 at bilbo;
 Fri, 02 Aug 2019 08:50:12 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4605900vb5zDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 08:50:11 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 93F9E886BF;
 Fri,  2 Aug 2019 10:50:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1564699810;
 bh=A/JEprKOo3XQFYMzYvttJ9D89Rk+PL3gbi4n0kq+uZY=;
 h=From:To:Cc:Subject:Date;
 b=cbGOYfl38VKhW+sOjwodouRzMm10xVaFwlej6uzAqQiSiDFunF/khMVqybwYooplf
 sMS/T6n9k5uO21DBeBZWPpz8O9g5JDOk1SGAmfQFXxQcvORKaeYt8/nZanAIp0PFlc
 RIiYeZil627gx9p5LlDuzKHlhL+Y38z3vY6QBzzwtZP0tYtn5lMsQui2Tn5upyr4wh
 tgNJXaXx4Y9dTfcT9ca6OOj7yG05LQ9XxCmbqzgWlOo4rYE53mk4lyyj12mL3svGaU
 fZuJzMMePaJZo43UWeEroxjMQWRilKT7YHC3OsQW8LbcxBbIXtoNvBlhNByUxhvto8
 CoNu30wwXXZqg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5d436ca10000>; Fri, 02 Aug 2019 10:50:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 6DED913EC73;
 Fri,  2 Aug 2019 10:50:12 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 3657C1E0504; Fri,  2 Aug 2019 10:50:10 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr, malat@debian.org
Subject: [PATCH v3] powerpc: Support CMDLINE_EXTEND
Date: Fri,  2 Aug 2019 10:50:06 +1200
Message-Id: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
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
Changes in v3:
- don't use BUG_ON in prom_strlcat
- rearrange things to eliminate prom_strlcpy

Changes in v2:
- incorporate ideas from Christope's patch https://patchwork.ozlabs.org/p=
atch/1074126/
- support CMDLINE_FORCE

 arch/powerpc/Kconfig            | 20 +++++++++++++++++-
 arch/powerpc/kernel/prom_init.c | 36 ++++++++++++++++++++++-----------
 2 files changed, 43 insertions(+), 13 deletions(-)

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
index 514707ef6779..1c7010cc6ec9 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -298,16 +298,24 @@ static char __init *prom_strstr(const char *s1, con=
st char *s2)
 	return NULL;
 }
=20
-static size_t __init prom_strlcpy(char *dest, const char *src, size_t si=
ze)
-{
-	size_t ret =3D prom_strlen(src);
+static size_t __init prom_strlcat(char *dest, const char *src, size_t co=
unt)
+{
+	size_t dsize =3D prom_strlen(dest);
+	size_t len =3D prom_strlen(src);
+	size_t res =3D dsize + len;
+
+	/* This would be a bug */
+	if (dsize >=3D count)
+		return count;
+
+	dest +=3D dsize;
+	count -=3D dsize;
+	if (len >=3D count)
+		len =3D count-1;
+	memcpy(dest, src, len);
+	dest[len] =3D 0;
+	return res;
=20
-	if (size) {
-		size_t len =3D (ret >=3D size) ? size - 1 : ret;
-		memcpy(dest, src, len);
-		dest[len] =3D '\0';
-	}
-	return ret;
 }
=20
 #ifdef CONFIG_PPC_PSERIES
@@ -759,10 +767,14 @@ static void __init early_cmdline_parse(void)
=20
 	prom_cmd_line[0] =3D 0;
 	p =3D prom_cmd_line;
-	if ((long)prom.chosen > 0)
+
+	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && (long)prom.chosen > 0)
 		l =3D prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
-	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) && (l <=3D 0 || p[0] =3D=3D '\0')) =
/* dbl check */
-		prom_strlcpy(prom_cmd_line, CONFIG_CMDLINE, sizeof(prom_cmd_line));
+
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <=3D 0 || p[0] =3D=3D '\0')
+		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
+			     sizeof(prom_cmd_line));
+
 	prom_printf("command line: %s\n", prom_cmd_line);
=20
 #ifdef CONFIG_PPC64
--=20
2.22.0

