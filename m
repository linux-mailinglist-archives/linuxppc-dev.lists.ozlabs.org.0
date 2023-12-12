Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4907080FA9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 23:56:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=L+DtfLZQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqYs15jC6z3cX1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 09:56:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=L+DtfLZQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 13 Dec 2023 03:18:09 AEDT
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqP0x2Q4Kz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 03:18:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702397889; x=1733933889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J7+Xj3FjWfdGPh60vkm3axKqArxj/3g1wtG+A2GoS0g=;
  b=L+DtfLZQZxu6aRxhTHc5BTpyo7s/UWgN74UVbhKzZ7fMm8oWeoKYXVWQ
   Sh84smCGRQecUCamIyXo5Ppw5wY/NfgoXbTpJruDf0Ob2oaF4Ce63fNP4
   5gaaE1+wTniUKdtwnRJKYTD/TqUNtf4af5aEcLPd1qNp5KJi2ltrsu5jE
   YTPD8ig8cSJFwLuGSyMYKO9vTSQhrOXl578jX0fCdvdoYkIftZyU0KjkX
   1BNS8Z+V1XmqJK41h4O6QEPVwF7Jg+BSo3BCd1Gzuclg5qG+C9QIQywLA
   +HWJ6qi6jdJUaJBLMKBapTqoZ7/9jR29u7OPdpM39dNFM+D92kDlmSukD
   w==;
X-IronPort-AV: E=Sophos;i="6.04,270,1695679200"; 
   d="scan'208";a="34463669"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2023 17:16:55 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 653F3280075;
	Tue, 12 Dec 2023 17:16:55 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] Reapply "kbuild: Create directory for target DTB"
Date: Tue, 12 Dec 2023 17:16:10 +0100
Message-ID: <20231212161610.100862-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Dec 2023 09:56:13 +1100
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
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit dd7699e37f289fa433f42c6bcc108468c8b198c0.

On powerpc, dtb-y is usually empty unless CONFIG_OF_ALL_DTBS is set. While
passing a DTB as a make target explicitly works fine, individual DTB
builds may also be pulled in as dependencies by cuImage.% and similar
targets. In this case, nothing creates the arch/powerpc/dts directory,
causing out-of-tree builds to fail.

Fixes: dd7699e37f28 ("Revert "kbuild: Create directory for target DTB"")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 scripts/Makefile.lib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1a965fe68e011..3fe0fc46badfe 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -389,7 +389,8 @@ $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
 	$(call if_changed,wrap_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

