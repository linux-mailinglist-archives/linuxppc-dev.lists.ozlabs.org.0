Return-Path: <linuxppc-dev+bounces-2781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F184B9BA731
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:13:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlL12LPz2yJL;
	Mon,  4 Nov 2024 04:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653981;
	cv=none; b=BCvVKZhiMtYX3qvdmdRk6CLd8xzzVScHluKF63L3YbOsf9HhAiJSN7pP45ihxGvmRKAltV/mdpaNMBjrl2EgjQvfJu/HNtZjAUlN5x3sBHc1dJd1wgu2DUOHKV6gNn2Mk0zSkFX8loJ8iMmBcHULVJ60iQevKa5lQkVJfSexXqmG/bYF89FrJ7V0Sox4tSne26jq4JPYH1W+EJD38aipjkfj0+kxsIxw4URyed+iMkcE5R4CL+yJ10Iuz7trD4yt37wm63GzDSrABLsa/jzPqtojV2Ob/Cucu0DnWilRauCdfxexvqWXQr7Igpy8lE8gND8DGNiQaagGF9rZhZVIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653981; c=relaxed/relaxed;
	bh=1/DHiLQ6vlc2BjFhM2SeKyOHXC/Q4Rm8UPXvuK+gbdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuqkMBl1EGV/eR3zIj3TmQK/tbwqKCe/2J3u8L35tR2dPXEDAG2zTiUvlky5NuEQiK2VPSyhjCyGkn8bZ8jyhuRS+1rKcw3XPgiO3rZq1RvsdUREF9x3wDnfDf5wR7oBPyLPiwZNapT+EEYVsDxWlccY2h6eY/zImp67JeZxYQeqydoWGEMf6XEAhzD/BcwPSWRuuC3e9wbu5q7Dh2XDsAwF6n03wNxUm5AKC6ZeeJPqc3adGgbT5eXvjEt6Vo937BG1kBFUPa+GxYFEowlTBeiPEqhA/rGi5DgIGSqwudAHYXXXuw74kL6RPy+mxmoDTuioLOC1t3yHaT+X9FUBhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=SyRnyZMY; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=SyRnyZMY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlC3b3hz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=GMdVqpFwoDETa/zGkV60zA/YyucohMN7ciiORB0dDFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SyRnyZMYYiuvS05pAbdP2BNw8Ha3Wp0EjLxI/8VZebe+J32OJzQ0FfngSr11pbc3S
	 3hLaAVDffCbL3wYrk/f1ofcjd6D+cxYnSPaa7E742CRmKRTph9QuWBX2pSm+y7iW5V
	 1DVHDyNnW5ZmICuH8Tv9nJe+/D6n4jWkebWhVEBk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:37 +0000
Subject: [PATCH v2 08/10] sysfs: implement all BIN_ATTR_* macros in terms
 of __BIN_ATTR()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241103-sysfs-const-bin_attr-v2-8-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2547;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GMdVqpFwoDETa/zGkV60zA/YyucohMN7ciiORB0dDFM=;
 b=G1PulaFbJ1PZH7AnZk220ddkyci6/SVWNb+Rtvwc4kmmjYqzz3Epr6UCHfWP8qbRyhd/TurKs
 If4brtJxns8CxxC6suNmBgy57hhP6OtLmxJDPf6RSsE1N5AsLzcns6R
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The preparations for the upcoming constification of struct bin_attribute
requires some logic in the structure definition macros.
To avoid duplication of that logic in multiple macros, reimplement all
other macros in terms of __BIN_ATTR().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index cb2a5e277c2384f2e8add8fbf2907e8a819576ec..d17c473c1ef292875475bf3bdf62d07241c13882 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -333,17 +333,11 @@ struct bin_attribute {
 	.size	= _size,						\
 }
 
-#define __BIN_ATTR_RO(_name, _size) {					\
-	.attr	= { .name = __stringify(_name), .mode = 0444 },		\
-	.read	= _name##_read,						\
-	.size	= _size,						\
-}
+#define __BIN_ATTR_RO(_name, _size)					\
+	__BIN_ATTR(_name, 0444, _name##_read, NULL, _size)
 
-#define __BIN_ATTR_WO(_name, _size) {					\
-	.attr	= { .name = __stringify(_name), .mode = 0200 },		\
-	.write	= _name##_write,					\
-	.size	= _size,						\
-}
+#define __BIN_ATTR_WO(_name, _size)					\
+	__BIN_ATTR(_name, 0200, NULL, _name##_write, _size)
 
 #define __BIN_ATTR_RW(_name, _size)					\
 	__BIN_ATTR(_name, 0644, _name##_read, _name##_write, _size)
@@ -364,11 +358,8 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR_WO(_name, _size)
 struct bin_attribute bin_attr_##_name = __BIN_ATTR_RW(_name, _size)
 
 
-#define __BIN_ATTR_ADMIN_RO(_name, _size) {					\
-	.attr	= { .name = __stringify(_name), .mode = 0400 },		\
-	.read	= _name##_read,						\
-	.size	= _size,						\
-}
+#define __BIN_ATTR_ADMIN_RO(_name, _size)				\
+	__BIN_ATTR(_name, 0400, _name##_read, NULL, _size)
 
 #define __BIN_ATTR_ADMIN_RW(_name, _size)					\
 	__BIN_ATTR(_name, 0600, _name##_read, _name##_write, _size)
@@ -379,10 +370,8 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RO(_name, _size)
 #define BIN_ATTR_ADMIN_RW(_name, _size)					\
 struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RW(_name, _size)
 
-#define __BIN_ATTR_SIMPLE_RO(_name, _mode) {				\
-	.attr	= { .name = __stringify(_name), .mode = _mode },	\
-	.read	= sysfs_bin_attr_simple_read,				\
-}
+#define __BIN_ATTR_SIMPLE_RO(_name, _mode)				\
+	__BIN_ATTR(_name, _mode, sysfs_bin_attr_simple_read, NULL, 0)
 
 #define BIN_ATTR_SIMPLE_RO(_name)					\
 struct bin_attribute bin_attr_##_name = __BIN_ATTR_SIMPLE_RO(_name, 0444)

-- 
2.47.0


