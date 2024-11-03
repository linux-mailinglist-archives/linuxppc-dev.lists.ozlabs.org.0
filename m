Return-Path: <linuxppc-dev+bounces-2786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5459BA736
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:13:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlR0BdKz2yV8;
	Mon,  4 Nov 2024 04:13:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653986;
	cv=none; b=OaobLsDXb83E1+XyTvyKO4G+A9ZbMuc7AbEIXyg7vNswqgDb4LjQ15M2OmuSqeg+tBwK2Y7xMU7vVEYhZEeHdI+P0IuNGmrbRO1LVsLnwDeupFgNibO4vK3MFETtPHLekShJHs97rBC/rVl7+tt7qAQbzKvuQbkEb/SvCmMqjCSRQoBTgDL/Dap7H+cQH7zJ+K6X9tTqxuvJNH4f4RtKHe6j0hqqxVp/wFQxWDPWi5jVXg9gfmyxUsEenwv8bDvshE42zVTBeDLwxj8te+Mo7s43jYjQzCRdCspNui8T2HvRfK6xIrGmXvIgLwB8Mg17bMUIxAA06oCo9k7PBt+BMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653986; c=relaxed/relaxed;
	bh=9HYw53DmrqKpugqVG3nMdMcMXkbRy2TD2QmYRdSsWfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=He2crA2Morh6vxlPL5V6nwd6XWTYnPC2SAG/8h0ccmaMEw/Q8Pwm/syG6AQbD2yV5rbdJfXoAYhguEBXBLnMmf30+stA+PLKM/8yYCZfSw38w8U7vSjgfAJKxct3b5pfFDsEbDYcGzkacs6xFX5DAmMgfToPIC/wRYl8+2vTWx7AH9NRTHfG1H/KpykObhVq9UCqjjC+4J1xDUgpb9oY4at45KcVRvtVf8XAFNCUgoq3LXQ9FCyoNWd+ZyRJAKDog4eWSChndJwXUhhUfM30G5iPpTDqg7Qq4uXQcpSzBsH7PndTkDbA7HN43aJdKpZOfzy53fDIDIh0wyA5usb1OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=FKhFlW+f; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=FKhFlW+f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlM202Fz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:13:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=i1lGRcvBSYaAkRCU3PsefBTXEi2eEGtd/RNZhauMerg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKhFlW+fXVU9iiG5WHWrfxqIg2MK5RN4rmEJ6qMm9w3609SWSEqzIiyskpf0F3SE/
	 5Hue+UAKF4NoE2Q53mkBkJ7j/9iT4JRSPm/DM+o1r+XqpuQf548H1TiWzMDARBYT4p
	 NmQ6pgjd99tSp5B6B0CVtWY1Wv6AMrStXbMf+hV8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:39 +0000
Subject: [PATCH v2 10/10] driver core: Constify attribute arguments of
 binary attributes
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
Message-Id: <20241103-sysfs-const-bin_attr-v2-10-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2330;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=i1lGRcvBSYaAkRCU3PsefBTXEi2eEGtd/RNZhauMerg=;
 b=wjQlo57jq0Wj7AlLBOYWjC3NLTcXdQ4S/vHvyo3etlKonEvBK3xDMeXVEI2nFeo1fRBiMSJWq
 8Dy1FhYi+4pDACqaxOlIcEPw5eL4UaDS9rJJgllbu0x7Wp3mt9dGtys
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As preparation for the constification of struct bin_attribute,
constify the arguments of the read and write callbacks.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/base/node.c     | 4 ++--
 drivers/base/topology.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index eb72580288e62727e5b2198a6451cf9c2533225a..3e761633ac75826bedb5dd30b879f7cc1af95ec3 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -27,7 +27,7 @@ static const struct bus_type node_subsys = {
 };
 
 static inline ssize_t cpumap_read(struct file *file, struct kobject *kobj,
-				  struct bin_attribute *attr, char *buf,
+				  const struct bin_attribute *attr, char *buf,
 				  loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -48,7 +48,7 @@ static inline ssize_t cpumap_read(struct file *file, struct kobject *kobj,
 static BIN_ATTR_RO(cpumap, CPUMAP_FILE_MAX_BYTES);
 
 static inline ssize_t cpulist_read(struct file *file, struct kobject *kobj,
-				   struct bin_attribute *attr, char *buf,
+				   const struct bin_attribute *attr, char *buf,
 				   loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index 89f98be5c5b9915b2974e184bf89c4c25c183095..1090751d7f458ce8d2a50e82d65b8ce31e938f15 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -23,7 +23,7 @@ static ssize_t name##_show(struct device *dev,				\
 
 #define define_siblings_read_func(name, mask)					\
 static ssize_t name##_read(struct file *file, struct kobject *kobj,		\
-			   struct bin_attribute *attr, char *buf,		\
+			   const struct bin_attribute *attr, char *buf,		\
 			   loff_t off, size_t count)				\
 {										\
 	struct device *dev = kobj_to_dev(kobj);                                 \
@@ -33,7 +33,7 @@ static ssize_t name##_read(struct file *file, struct kobject *kobj,		\
 }										\
 										\
 static ssize_t name##_list_read(struct file *file, struct kobject *kobj,	\
-				struct bin_attribute *attr, char *buf,		\
+				const struct bin_attribute *attr, char *buf,	\
 				loff_t off, size_t count)			\
 {										\
 	struct device *dev = kobj_to_dev(kobj);					\

-- 
2.47.0


