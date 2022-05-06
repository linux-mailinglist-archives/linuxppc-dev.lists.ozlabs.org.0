Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359A51DBAE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvvCn33SCz3cFC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 01:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=JjukZl1a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.74;
 helo=conuserg-07.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=JjukZl1a; 
 dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvvC85r5hz3bqr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 01:10:44 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 246F8tNF028085;
 Sat, 7 May 2022 00:08:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 246F8tNF028085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651849736;
 bh=VWu6RNovZZlWzjVI82T26ZkYKFtgzo8H7rKhNuRBvqE=;
 h=From:To:Cc:Subject:Date:From;
 b=JjukZl1ajjnROurCI7d4tVD2V+auAAoaTV8eCoq4+DaujU3yMVuUEyuyr6LwWj0L3
 JWLl97Veyic5o1T/O+yEvgIbnvD2oJ53WvLFTekEPE2XGlzuuwxIbV475fhVzZUTXb
 9vLIZRPiAdYKUjzvkJReF1rlOeVZMxRfyRAF8MDhq9pS5gdoENYbaH2VnIlFS3dfVe
 +cJXIXolT3MfRNa6j+tnmjv1arylMYNLmbAsql7Cq51Q/lNrwbg//b+CWaVLXATVox
 aveENEtZzaDGhZeLMdoGW21mQ/qpWaTPmycNecnftbuY+/21XlrCkT0zIcFshfJR8j
 CPEHCRkuH/Ilg==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Subject: [PATCH v2] crypto: vmx - Align the short log with Makefile cleanups
Date: Sat,  7 May 2022 00:08:20 +0900
Message-Id: <20220506150820.1310802-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I notieced the log is not properly aligned:

  PERL drivers/crypto/vmx/aesp8-ppc.S
  CC [M]  fs/xfs/xfs_reflink.o
  PERL drivers/crypto/vmx/ghashp8-ppc.S
  CC [M]  drivers/crypto/vmx/aes.o

Add some spaces after 'PERL'.

While I was here, I cleaned up the Makefile:

 - Merge the two similar rules

 - Remove redundant 'clean-files' (Having 'targets' is enough)

 - Move the flavour into the build command

This still avoids the build failures fixed by commit 4ee812f6143d
("crypto: vmx - Avoid weird build failures").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Fix CONFIG_LITTLE_ENDIAN -> CONFIG_CPU_LITTLE_ENDIAN

 drivers/crypto/vmx/Makefile | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 709670d2b553..2560cfea1dec 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -2,21 +2,10 @@
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 
-ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
-override flavour := linux-ppc64le
-else
-override flavour := linux-ppc64
-endif
-
-quiet_cmd_perl = PERL $@
-      cmd_perl = $(PERL) $(<) $(flavour) > $(@)
+quiet_cmd_perl = PERL    $@
+      cmd_perl = $(PERL) $< $(if $(CONFIG_CPU_LITTLE_ENDIAN), linux-ppc64le, linux-ppc64) > $@
 
 targets += aesp8-ppc.S ghashp8-ppc.S
 
-$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl FORCE
-	$(call if_changed,perl)
-  
-$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl FORCE
+$(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perl)
-
-clean-files := aesp8-ppc.S ghashp8-ppc.S
-- 
2.32.0

