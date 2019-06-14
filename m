Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC245A4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 12:23:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QGs16bw5zDrQq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 20:23:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sX7cDuPN"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QGjS3MWTzDrdc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 20:16:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45QGjM1H2Jz9vDbj;
 Fri, 14 Jun 2019 12:16:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sX7cDuPN; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RsZZFblO1owP; Fri, 14 Jun 2019 12:16:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45QGjL6tmgz9vDbh;
 Fri, 14 Jun 2019 12:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560507383; bh=TY2dCqN2e9LwCfIjpEtnXQ6QZOx6P42BO2JkGX44zKo=;
 h=From:Subject:To:Cc:Date:From;
 b=sX7cDuPNCOH3k1NV5WEEAQVIfWziAd8Yttao5/aoEyBT0eSlXHRjPskvTVdPr820M
 GMCllAQp+pwfGchnsGUjQ24zxvechvXUsYdfgm90jqvm2kG6mvV2/nyUMo0fQ1Awme
 5YfAXVzfmyFBYJsQRM+ClutAhF5IvooTaDlCYPGw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C4018B7AD;
 Fri, 14 Jun 2019 12:16:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b9t6QDuhCvSj; Fri, 14 Jun 2019 12:16:24 +0200 (CEST)
Received: from PO15451.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08F808B7AC;
 Fri, 14 Jun 2019 12:16:24 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id DF66968D78; Fri, 14 Jun 2019 10:16:23 +0000 (UTC)
Message-Id: <1b4946c9e580b51b6ca2ddc5963d66406c013c2d.1560507284.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 1/3] powerpc/boot: don't force gzipped uImage
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 14 Jun 2019 10:16:23 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch modifies the generation of uImage by handing over
the selected compression type instead of forcing gzip

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
 v3: no change
 v2: no change
---
 arch/powerpc/boot/wrapper | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 532d45833396..85d97360b1c9 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -40,6 +40,7 @@ dts=
 cacheit=
 binary=
 compression=.gz
+uboot_comp=gzip
 pie=
 format=
 
@@ -130,6 +131,7 @@ while [ "$#" -gt 0 ]; do
 	;;
     -z)
 	compression=.gz
+	uboot_comp=gzip
 	;;
     -Z)
 	shift
@@ -137,15 +139,21 @@ while [ "$#" -gt 0 ]; do
         [ "$1" != "gz" -o "$1" != "xz" -o "$1" != "none" ] || usage
 
 	compression=".$1"
+	uboot_comp=$1
 
         if [ $compression = ".none" ]; then
                 compression=
+		uboot_comp=none
         fi
+	if [ $uboot_comp = "gz" ]; then
+		uboot_comp=gzip
+	fi
 	;;
     --no-gzip)
         # a "feature" of the the wrapper script is that it can be used outside
         # the kernel tree. So keeping this around for backwards compatibility.
         compression=
+	uboot_comp=none
         ;;
     -?)
 	usage
@@ -368,6 +376,7 @@ if [ -z "$cacheit" -o ! -f "$vmz$compression" -o "$vmz$compression" -ot "$kernel
     *)
         # drop the compression suffix so the stripped vmlinux is used
         compression=
+	uboot_comp=none
 	;;
     esac
 
@@ -411,7 +420,7 @@ membase=`${CROSS}objdump -p "$kernel" | grep -m 1 LOAD | awk '{print $7}'`
 case "$platform" in
 uboot)
     rm -f "$ofile"
-    ${MKIMAGE} -A ppc -O linux -T kernel -C gzip -a $membase -e $membase \
+    ${MKIMAGE} -A ppc -O linux -T kernel -C $uboot_comp -a $membase -e $membase \
 	$uboot_version -d "$vmz" "$ofile"
     if [ -z "$cacheit" ]; then
 	rm -f "$vmz"
-- 
2.13.3

