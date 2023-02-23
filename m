Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BB6A00BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 02:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMbR85Hjnz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 12:44:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+b06J0w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+b06J0w;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMbPy3VHPz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 12:43:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=exZkU1nmxYgHYb5MmlRanTFni1d8EpMHC+AWVfIzNqg=; b=X+b06J0wQjj56Rv4JfRdtWJKHI
	V2RIN8Du1k7E4u/tpy4IevN50y4MFslnFqOQQuTinQNSoIcDMaMqHtKcCGeplfE/GO72LdO29q1yz
	/UtQJu5EOaGkfZyVeaaS6YGWSDxGGEqmFxsS3ZhPML/2hDkKrLpCC13q2QZ9eli01A4LuWHLgKMDQ
	XBSgSH+HqM0h/njL3TJEN8Wf5QRMjCSJVl+ZDXOS+0bfEgpHNWgsJr4ZSw74vp9bk2PfLOAzj+UJX
	kEliChkDrPklkR9JKM6D4o+GMxsL0mh/Sp33CdZHNr1NynhrzHpYUkcmNb/1gXMqvO6KejPF9M+OZ
	ghQtvIVA==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV0d7-00EgSa-Vi; Thu, 23 Feb 2023 01:42:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] macintosh: via-pmu-led: requires ATA to be set
Date: Wed, 22 Feb 2023 17:42:41 -0800
Message-Id: <20230223014241.20878-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Elimar Riesebieter <riesebie@lxtec.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LEDS_TRIGGER_DISK depends on ATA, so selecting LEDS_TRIGGER_DISK
when ATA is not set/enabled causes a Kconfig warning:

WARNING: unmet direct dependencies detected for LEDS_TRIGGER_DISK
  Depends on [n]: NEW_LEDS [=y] && LEDS_TRIGGERS [=y] && ATA [=n]
  Selected by [y]:
  - ADB_PMU_LED_DISK [=y] && MACINTOSH_DRIVERS [=y] && ADB_PMU_LED [=y] && LEDS_CLASS [=y]

Fix this by making ADB_PMU_LED_DISK depend on ATA.

Seen on both PPC32 and PPC64.

Fixes: 0e865a80c135 ("macintosh: Remove dependency on IDE_GD_ATA if ADB_PMU_LED_DISK is selected")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Elimar Riesebieter <riesebie@lxtec.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
v2: add a complete Subject:

 drivers/macintosh/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -86,6 +86,7 @@ config ADB_PMU_LED
 
 config ADB_PMU_LED_DISK
 	bool "Use front LED as DISK LED by default"
+	depends on ATA
 	depends on ADB_PMU_LED
 	depends on LEDS_CLASS
 	select LEDS_TRIGGERS
