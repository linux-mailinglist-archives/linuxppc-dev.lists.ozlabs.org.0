Return-Path: <linuxppc-dev+bounces-2782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FCE9BA732
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:13:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlM12D6z2y8d;
	Mon,  4 Nov 2024 04:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653983;
	cv=none; b=mXyWaTJMDRONLBoDBh3NRRTzYG8KrOF7MOkvV10GTlhzCZoQ56q41dJNJRBHrCxbX3U6t7hdf1+HPF0MHUpxuzJ8IxruFHHShBHcBE04H/h4uqI+2Ioq7E+pFTKFgiO0a/OmhDMyB7sks+fM31S/GIjU2JeL1k74mNdANgwQaf92/Q/SqkctJEvSKzUG4WUPKWnEcviFkB0s3PQRTW7Md3x6SB/309/mInwRsH9ZsaL6cfy3G/fm30tYiMlB0+tsQc7gWrJW66Ba0qy4d2JcOoJhn8+XnMAib9VCrPvjLipM8OUSqwi2x586Z0LEHReiuM0SP3O8zFdQfKP1vJCTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653983; c=relaxed/relaxed;
	bh=M36VTqR2mWbQaVQ4Aw14E28PNfouFI3aAv6NzsIcqC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VM5+wBF3pnc89KzD7MuObNUoFCremidGqEmoTbhGpQhZZPMWiyS32X7M74xA3/DRfu1OgGWEm2a1DTzTnDIzcAkBCKnsAe2OedXbASqxIZsLeYYZWqgrCO//JRHB86i1xyiasU3KX2rajWFnTOjLpm/TWHFFpwfUe43ySlqKYz/pYVxef82PP3bvkXYkLi6BX8LR2PMslNwzSmhzletYUuiYca9pzH+ptDH8THZg/l2M3NI2N4PPV9nPJvzSP5ao6RsFGyZgwrQMptiM1PY82lCW3WvXJEQAHt7K12xlGdTqiapPvIKOz1cRS3MQJEeafmRhY2nxmtrl4o7pRNrxxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=jnQwjCqu; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=jnQwjCqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlC33kRz2xJK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653475;
	bh=vzqsMVfnVQ7g+xXQgYvHKh8WFOGMi08tymfd1lvAle8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jnQwjCquAR0qBDmeS/BwDJVhGZ6sUlQQGbmFuOa4A9M2739yz7dkzMP816T+fVMTN
	 habdRX2zL4MWpQPB/EZc2fhWd6l5iWr1VitiXAmds7L0pbHnrrKO6nxJP5pGMDdPpU
	 9SGYolS2xrGzTPAPqNh3lGCxTyletOjJlUB8aEf0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:31 +0000
Subject: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
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
Message-Id: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2296;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vzqsMVfnVQ7g+xXQgYvHKh8WFOGMi08tymfd1lvAle8=;
 b=+c8c3AK6YNFtR/f5MlFDxfac5E4AdcTfe/LYH8cKiLv+aN2C4MrR8vpsa2SsTXy5NHtfEpdBh
 t4Y6vgc31e8BINAGXwLU2VEDayYxRmKzGs5LRvtEfi4Ux875Z1qlOu8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several drivers need to dynamically calculate the size of an binary
attribute. Currently this is done by assigning attr->size from the
is_bin_visible() callback.

This has drawbacks:
* It is not documented.
* A single attribute can be instantiated multiple times, overwriting the
  shared size field.
* It prevents the structure to be moved to read-only memory.

Introduce a new dedicated callback to calculate the size of the
attribute.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 fs/sysfs/group.c      | 2 ++
 include/linux/sysfs.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 45b2e92941da1f49dcc71af3781317c61480c956..8b01a7eda5fb3239e138372417d01967c7a3f122 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -98,6 +98,8 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 				if (!mode)
 					continue;
 			}
+			if (grp->bin_size)
+				size = grp->bin_size(kobj, *bin_attr, i);
 
 			WARN(mode & ~(SYSFS_PREALLOC | 0664),
 			     "Attribute %s: Invalid permissions 0%o\n",
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index c4e64dc112063f7cb89bf66059d0338716089e87..4746cccb95898b24df6f53de9421ea7649b5568f 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -87,6 +87,11 @@ do {							\
  *		SYSFS_GROUP_VISIBLE() when assigning this callback to
  *		specify separate _group_visible() and _attr_visible()
  *		handlers.
+ * @bin_size:
+ *		Optional: Function to return the size of a binary attribute
+ *		of the group. Will be called repeatedly for each binary
+ *		attribute in the group. Overwrites the size field embedded
+ *		inside the attribute itself.
  * @attrs:	Pointer to NULL terminated list of attributes.
  * @bin_attrs:	Pointer to NULL terminated list of binary attributes.
  *		Either attrs or bin_attrs or both must be provided.
@@ -97,6 +102,9 @@ struct attribute_group {
 					      struct attribute *, int);
 	umode_t			(*is_bin_visible)(struct kobject *,
 						  struct bin_attribute *, int);
+	size_t			(*bin_size)(struct kobject *,
+					    const struct bin_attribute *,
+					    int);
 	struct attribute	**attrs;
 	struct bin_attribute	**bin_attrs;
 };

-- 
2.47.0


