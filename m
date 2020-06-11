Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A61F60A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 05:50:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j8yd0kmzzDqld
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 13:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=G+51MYtW; 
 dkim-atps=neutral
X-Greylist: delayed 417 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Jun 2020 13:49:09 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j8x16Fn2zDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 13:49:09 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E14CA8066C;
 Thu, 11 Jun 2020 15:42:00 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1591846920;
 bh=pwafHa80MS48ZYS1w+T8ti3oHQ+XDqAf4v1bbkbcS9Y=;
 h=From:To:Cc:Subject:Date;
 b=G+51MYtWispe9zo+EqobmmCcvJ9ZPm1CPezyWwqE3SuKGa19vni9XeMcKLRyb9t+4
 VpBcq6/X7+vbocXrDPcIUh33jDpNbDL8DkvzTry4w8NYC9M5WnIJVdQaJ+ZbjkTAjy
 0lLEEzwCfzkjzNf02NVCsyklzv3P8fOlhGAXvNGA2EA9ABPLfw09ZjIkmsn5FrWYub
 IE1uXDKAJLq3jqCVn9Lb1FXvU9ZSScRPf4O3+Ph+2Pn9QW2s3FmhOkAwfHFJHbRlJk
 5kX5htHlDBFq5HFPnotezxauGrpkwJ5XMRAGQuA6FnBqUDQzmgoMAc9gK0rIZFPkV7
 pgI48YJrKslIw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5ee1a7fe0000>; Thu, 11 Jun 2020 15:41:50 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id 95E2B13EDE4;
 Thu, 11 Jun 2020 15:41:49 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id D1D52280083; Thu, 11 Jun 2020 15:41:49 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@c-s.fr
Subject: [PATCH v2] powerpc: Remove inaccessible CMDLINE default
Date: Thu, 11 Jun 2020 15:41:40 +1200
Message-Id: <20200611034140.9133-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
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

Since commit cbe46bd4f510 ("powerpc: remove CONFIG_CMDLINE #ifdef mess")
CONFIG_CMDLINE has always had a value regardless of CONFIG_CMDLINE_BOOL.

For example:

 $ make ARCH=3Dpowerpc defconfig
 $ cat .config
 # CONFIG_CMDLINE_BOOL is not set
 CONFIG_CMDLINE=3D""

When enabling CONFIG_CMDLINE_BOOL this value is kept making the 'default
"..." if CONFIG_CMDLINE_BOOL' ineffective.

 $ ./scripts/config --enable CONFIG_CMDLINE_BOOL
 $ cat .config
 CONFIG_CMDLINE_BOOL=3Dy
 CONFIG_CMDLINE=3D""

Remove CONFIG_CMDLINE_BOOL and the inaccessible default.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
It took me a while to get round to sending a v2, for a refresher v1 can b=
e found here:

http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20190802050232.229=
78-1-chris.packham@alliedtelesis.co.nz/

Changes in v2:
- Rebase on top of Linus's tree
- Fix some typos in commit message
- Add review from Christophe
- Remove CONFIG_CMDLINE_BOOL

 arch/powerpc/Kconfig | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..51abc59c3334 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -859,12 +859,8 @@ config PPC_DENORMALISATION
 	  Add support for handling denormalisation of single precision
 	  values.  Useful for bare metal only.  If unsure say Y here.
=20
-config CMDLINE_BOOL
-	bool "Default bootloader kernel arguments"
-
 config CMDLINE
-	string "Initial kernel command string" if CMDLINE_BOOL
-	default "console=3DttyS0,9600 console=3Dtty0 root=3D/dev/sda2" if CMDLI=
NE_BOOL
+	string "Initial kernel command string"
 	default ""
 	help
 	  On some platforms, there is currently no way for the boot loader to
--=20
2.27.0

