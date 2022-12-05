Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1A642DF3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqNN3vGBz2x9C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TuOHIawJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::814; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TuOHIawJ;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20814.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::814])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjh6K77z3bXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7jTjDzWGZuJWXp2Xf0AG8HahNOVOKnoEVsFB2rutv88BZM2c3xaXsz5C4fRwEFYb0Y0l8I3/v09pOe7xGheEc+3XKBDokUtRYf4d6TIAl1FBAXFQIp97ZKvkwM4XpG0cRI141tZw27/1glLmBRfRZlBadlg6b76Yt+gkNp36zEk3KRfdtezordshJbabUPS7m+x/U9DMblzEdnlyyBXNURfPkmvaAky5OW8OGVdHR4RaBQRmgaX8CXHPBJQ/0TYH5lhyeRMu0VYtq94jNEQbiQ3SKS4EApVilfLHuEzkCJJuPNSMdcn0VjWCfB0q9K9yHVPX9J2mqnnR3w/VyL58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUFfM58njfsAKB3lQ0oHWT+h/J46/EawXHZuEUQQcI8=;
 b=n+MVvpy1u7yw4FJFeLq6wmbp8Aiikb+XmfFP4Un4v43+NaTH6P6AGD8bff+tNXus4QBKR8KlsP6pHHquOzR661db/kTuhd7ODd5OfP98hSRqt3fkrMsyTF1FvfHaKCyzfWnxaOPeUe9YNAS9RP9gG2CLs2tQARU5yAQW3aUntwuy1qbVML3RoKw0EveyIxoAHAoStS73r6uTIKAOK9ItbA8lMrM4jIMi7PxZMADt6YZ9YYu8YRf97J8quAn9PTtRYjuXXXGQ2V4WrpXltnNp2YVvJnfKWiXwxX3xwz+gqt2rFmRIEci2Mrnz96NWlOT4JZjb271n3laTVc1i05eQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUFfM58njfsAKB3lQ0oHWT+h/J46/EawXHZuEUQQcI8=;
 b=TuOHIawJY1syipkEbNxq7xdl7eJkeRS4C2XwjghtApYQnL+OyWh3N13djfiAvpTblddOpb/RGECDEFcq/OMT6RkoEy7RhelxSRM9yMfGcSFrZWVR+o9DDP3+FavJWDDyH/5UsYJTP+dfgHmOWrO9nUxXmbwU2Y1hyeK0k/uS6qXKWvStLatYuS3me5fVW2zI/UhcUgm4WorpQ1GBeUki2k8MY2Gz3et9JpVYlMPPqrmoqCxX+keIKFOpIjL+T1pp0v7fu1mQ3xlSWZkjb/YhEs1bh3YCbhuFRGmu4hcqTQ9FBUAdY+t1bOPsVrIfdN6MF5ev5gGfJFCtrd1slydJiw==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:15 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:15 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 4/6] xen: make remove callback of xen driver void returned
Date: Mon,  5 Dec 2022 23:36:42 +0800
Message-ID:  <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205153644.60909-1-set_pte_at@outlook.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [pYL2ZN+CnnrmRvnvOClobKI4LpYOn9kj]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-5-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a76953-4a83-48a8-80d2-08dad6d695c8
X-MS-Exchange-SLBlob-MailProps: 	/OoUGmN/RpVKD6y7RJd2fRTadJ6Pq1otO0hXGE1Fkgli6QWdSXYMunSFX5pBjBN7ezKQeOV8KmNDGlFsM9QYDTvrVubKOUSRgjPFSd7fgVUt+R6alylE3Bq8Rzwp73dqfBU4V5uRSQqV/EucAcyogXSo97nG24RKNZYSZALSqTJRJmmeulUIBj6PfyTXQQo8z+I+PLm28x4LwHw2+SgbhGXZ1j+VviI2U/9lh9tYCeK/Odhk9DjR/lLUr0ZkqTsDQ/LYHZBz4i1homzrzwv9DPRQs8WPswEjAt25J86Hi1eQ1+UKeNBrCbjM6Vxey2UQ7WpPXdKHO45/RG5Wi1nn1tuQ3JwKrsJaz/OfKQQCzm96CIYpyDZcpupHWKvUHu2d5ztELB61IFxF+VHN91M0J2/a/MPW1piQs7x+xLxM+S5ClZ4IJJO1vqFE3z/oYymjBKDWgUmsD5DsPCZK7kjBOJMOakQN79HkVMHPRjbXfVYhp6N6qQnajV0D18cNm8dSQmzcU4TV9W3zHDe46LnW3ob/LRb/zYL1lu+DusPi6heXq9KIkR4SzW0KDVIPDP3Xkn8VKUc70RdDiMVEqFWAqdHKadztU19RkEAJuQGKF77Z9cxeOicaCCkXhtQLEDa0vuoqU0oHAAphIr7XJ8wshNQN9OZxdhTNhnQSojNki2EvFDyfLeuKkOYhJc+8/e2Culd4DHWXuzMqbK/pmzpPhu26Ik4SW4RIi33eRK2/73hcACfDYCLLQyQJ1EMS2GYp
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MDy9nSYZ5SidjtlSfxVwaH49UfrCtlA6Hp+5YkHMXi7a5Qbh70gNbqz/04MqTs0V0mDBN0cH6jFdHbOnYbTfHn6eYD1vXwKocP56wKrfiW+VJ4GC7y+nQU0KuiSmCJslPnii1E8EI34P+ZaaXhOv0Q1cepu3llbRHYHThj6yPG+VRib0JTEsgfQ33q5CtiznXQT4L984ilEkdNeIEutKJFpwjPxJAmLScCWzOBaa4N0GsnZLw8LukhGLRWPNr6tXpqvxCSDf5Oq884kSap9G9w8gX6h7rqEXsZoL7d+LHVxVfNq/0kBVGAld0VI98qyG3xMd/n5KSH0OHF4FxTMTLh+PjcLQekdaQ3UU/kYOxFxEpoYa9uhfIHgiz9DnCIMOOXmp/0BYG67fou17Gtw3leVDaMjxVvu992hiObXWRKzWir8HQcba+St0T7AnN4yFfsg162vMM1SYitV3j3AKU1gHKSSQJ4K9oWayKzaS8DjE3DIOchYA5t/8liH48hP+OZhk0+Ax9qN+OvTAkb4Y9KJKY+HxjACEooS0QBC6tZwyRhQ4IASyvh3J0TdBCcuW9CAM4gvYm1eMWwpn9X0i/Z+pBtNtBqjLQCNkEucpOl0JAycTsxCraShZfAhY/GyASqAphl7UbstovpOcjPnqJg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?41yWUbTb+6oMhLkvyBM6Vf9d8NgDMAqc1TiVPJzUIyaQse0kv2xpc4+NqCKC?=
 =?us-ascii?Q?zkr26/pVNLH/S1tEpXo4MJ4EIz0cKfwWFmdTC6ws6IJMwb19S15N01dY9WyE?=
 =?us-ascii?Q?AJPgv6XUdd8lCR9a9446mrDepICxxzGJzNdUKchhnddoqMIyzonQw3LQ/zle?=
 =?us-ascii?Q?y6qqxaHsqN8iiNda48ik56V7kI6t5K+k08hPDtmKwpEaXETwSyoL0qN3R83z?=
 =?us-ascii?Q?w18zbuhT8KUOhlTI9aFn35qf2x/DjNYbJ+samuje9guHxYyPjBKAm0hdqcgs?=
 =?us-ascii?Q?jlTblwZxqfHNjKXUlhXbFkvMFx6XD63yyUFbvwVJPA6MESUvv0lyjgwS2fET?=
 =?us-ascii?Q?Tff3mMlmiqf8FIyKrfYHU55Qk9LXLCPok4WdmTapBE3DFjLkBguVLM7AkSqx?=
 =?us-ascii?Q?4QeUjQh5F4GyLgrhLMPgKq50MJvieuaFpuptMslWKweDMeR8MEemQLnqlWBX?=
 =?us-ascii?Q?E+WmuhESJBM4dfnE0hRHoznPiba7qAEMvJwDIbZ+qP1ZWT9xAagGaCzWDm5L?=
 =?us-ascii?Q?OrZS7R+RBqWh5sInMXZ13WmJAYHMWCb0y5tlOYefhNxSO2Lo0I8uPAjue18V?=
 =?us-ascii?Q?46o38n4lJmy3ej9gyqeTKsKfb4QVJvW4hcV6TZ/T2tI2DrCns6kDBJLiFilY?=
 =?us-ascii?Q?kD2RCDR0ZTCDeGFgCSRQ7gUzpscRa5GHZwv2qqIRIgpBi2jWtiXwVYs6IuxA?=
 =?us-ascii?Q?pxpqWCPgQQOfrp16I1VvPFEvcGinPK80ucHtPrlPmtwlvdMm/uRZRjKSv6xz?=
 =?us-ascii?Q?NPX2+0aaO2mFlH4Eb1OgQ3JynyKV7bHAiz5eLehYfSw4XcqFyqKOhT+WTM7x?=
 =?us-ascii?Q?/U/jxrVEWvrlq91ihPG1fpCzF98fmiyUwmDGIV2Bj5BfP8n8DBVN2wf5jSNM?=
 =?us-ascii?Q?cztrvuEYZt+PoD4vch5PxS+k14Q/RD6FcWYLCN/r8f8ZUzxPP730k693m9tT?=
 =?us-ascii?Q?pxDAyBsGZjGsd9LnOYXvs93OOjhe3Vbh/L9XQcpOT/JCkt8OIl5ERMih81pP?=
 =?us-ascii?Q?1w36wmq1Tj7xYA0mRnOK8UqdLXKy7A7vRiAJXJi9LxEJKLGUapLAe4PkB2ib?=
 =?us-ascii?Q?knGeA+UIjiOadNLK156qXu3MXL5vmnLE5lBqVfh673hhJzCH/jm0izob5fzj?=
 =?us-ascii?Q?PLE9KNW4jgZowdeC0HILR6tEGGClaAJI5GsEM9sVdDj1bF2vOB2xpsv/sJYQ?=
 =?us-ascii?Q?bYpTrkVrdwM448/ohgDX+zqSDqng+0B1yJPm+yXPQBlDtkORoG1t3qZyQqIE?=
 =?us-ascii?Q?ig4kJ3cy1zQJ5Lec6JNGc3c9zTwqSxFY7rEu6F1Azw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a76953-4a83-48a8-80d2-08dad6d695c8
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:15.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1787
X-Mailman-Approved-At: Tue, 06 Dec 2022 03:48:37 +1100
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, Dawei Li <set_pte_at@outlook.com>, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit fc7a6209d571 ("bus: Make remove callback return
void") forces bus_type::remove be void-returned, it doesn't
make much sense for any bus based driver implementing remove
callbalk to return non-void to its caller.

This change is for xen bus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/block/xen-blkback/xenbus.c  | 4 +---
 drivers/block/xen-blkfront.c        | 3 +--
 drivers/char/tpm/xen-tpmfront.c     | 3 +--
 drivers/gpu/drm/xen/xen_drm_front.c | 3 +--
 drivers/input/misc/xen-kbdfront.c   | 5 ++---
 drivers/net/xen-netback/xenbus.c    | 3 +--
 drivers/net/xen-netfront.c          | 4 +---
 drivers/pci/xen-pcifront.c          | 4 +---
 drivers/scsi/xen-scsifront.c        | 4 +---
 drivers/tty/hvc/hvc_xen.c           | 4 ++--
 drivers/usb/host/xen-hcd.c          | 4 +---
 drivers/video/fbdev/xen-fbfront.c   | 6 ++----
 drivers/xen/pvcalls-back.c          | 3 +--
 drivers/xen/pvcalls-front.c         | 3 +--
 drivers/xen/xen-pciback/xenbus.c    | 4 +---
 drivers/xen/xen-scsiback.c          | 4 +---
 include/xen/xenbus.h                | 2 +-
 net/9p/trans_xen.c                  | 3 +--
 sound/xen/xen_snd_front.c           | 3 +--
 19 files changed, 22 insertions(+), 47 deletions(-)

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index c0227dfa4688..4807af1d5805 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -524,7 +524,7 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 	return 0;
 }
 
-static int xen_blkbk_remove(struct xenbus_device *dev)
+static void xen_blkbk_remove(struct xenbus_device *dev)
 {
 	struct backend_info *be = dev_get_drvdata(&dev->dev);
 
@@ -547,8 +547,6 @@ static int xen_blkbk_remove(struct xenbus_device *dev)
 		/* Put the reference we set in xen_blkif_alloc(). */
 		xen_blkif_put(be->blkif);
 	}
-
-	return 0;
 }
 
 int xen_blkbk_flush_diskcache(struct xenbus_transaction xbt,
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 35b9bcad9db9..e68576ded7cb 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2468,7 +2468,7 @@ static void blkback_changed(struct xenbus_device *dev,
 	}
 }
 
-static int blkfront_remove(struct xenbus_device *xbdev)
+static void blkfront_remove(struct xenbus_device *xbdev)
 {
 	struct blkfront_info *info = dev_get_drvdata(&xbdev->dev);
 
@@ -2489,7 +2489,6 @@ static int blkfront_remove(struct xenbus_device *xbdev)
 	}
 
 	kfree(info);
-	return 0;
 }
 
 static int blkfront_is_ready(struct xenbus_device *dev)
diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 379291826261..80cca3b83b22 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -360,14 +360,13 @@ static int tpmfront_probe(struct xenbus_device *dev,
 	return tpm_chip_register(priv->chip);
 }
 
-static int tpmfront_remove(struct xenbus_device *dev)
+static void tpmfront_remove(struct xenbus_device *dev)
 {
 	struct tpm_chip *chip = dev_get_drvdata(&dev->dev);
 	struct tpm_private *priv = dev_get_drvdata(&chip->dev);
 	tpm_chip_unregister(chip);
 	ring_free(priv);
 	dev_set_drvdata(&chip->dev, NULL);
-	return 0;
 }
 
 static int tpmfront_resume(struct xenbus_device *dev)
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 0d8e6bd1ccbf..90996c108146 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -717,7 +717,7 @@ static int xen_drv_probe(struct xenbus_device *xb_dev,
 	return xenbus_switch_state(xb_dev, XenbusStateInitialising);
 }
 
-static int xen_drv_remove(struct xenbus_device *dev)
+static void xen_drv_remove(struct xenbus_device *dev)
 {
 	struct xen_drm_front_info *front_info = dev_get_drvdata(&dev->dev);
 	int to = 100;
@@ -751,7 +751,6 @@ static int xen_drv_remove(struct xenbus_device *dev)
 
 	xen_drm_drv_fini(front_info);
 	xenbus_frontend_closed(dev);
-	return 0;
 }
 
 static const struct xenbus_device_id xen_driver_ids[] = {
diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 8d8ebdc2039b..67f1c7364c95 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -51,7 +51,7 @@ module_param_array(ptr_size, int, NULL, 0444);
 MODULE_PARM_DESC(ptr_size,
 	"Pointing device width, height in pixels (default 800,600)");
 
-static int xenkbd_remove(struct xenbus_device *);
+static void xenkbd_remove(struct xenbus_device *);
 static int xenkbd_connect_backend(struct xenbus_device *, struct xenkbd_info *);
 static void xenkbd_disconnect_backend(struct xenkbd_info *);
 
@@ -404,7 +404,7 @@ static int xenkbd_resume(struct xenbus_device *dev)
 	return xenkbd_connect_backend(dev, info);
 }
 
-static int xenkbd_remove(struct xenbus_device *dev)
+static void xenkbd_remove(struct xenbus_device *dev)
 {
 	struct xenkbd_info *info = dev_get_drvdata(&dev->dev);
 
@@ -417,7 +417,6 @@ static int xenkbd_remove(struct xenbus_device *dev)
 		input_unregister_device(info->mtouch);
 	free_page((unsigned long)info->page);
 	kfree(info);
-	return 0;
 }
 
 static int xenkbd_connect_backend(struct xenbus_device *dev,
diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index c1ba4294f364..001636901dda 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -977,7 +977,7 @@ static int read_xenbus_vif_flags(struct backend_info *be)
 	return 0;
 }
 
-static int netback_remove(struct xenbus_device *dev)
+static void netback_remove(struct xenbus_device *dev)
 {
 	struct backend_info *be = dev_get_drvdata(&dev->dev);
 
@@ -992,7 +992,6 @@ static int netback_remove(struct xenbus_device *dev)
 	kfree(be->hotplug_script);
 	kfree(be);
 	dev_set_drvdata(&dev->dev, NULL);
-	return 0;
 }
 
 /*
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 9af2b027c19c..bc17f5391b1a 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -2640,7 +2640,7 @@ static void xennet_bus_close(struct xenbus_device *dev)
 	} while (!ret);
 }
 
-static int xennet_remove(struct xenbus_device *dev)
+static void xennet_remove(struct xenbus_device *dev)
 {
 	struct netfront_info *info = dev_get_drvdata(&dev->dev);
 
@@ -2656,8 +2656,6 @@ static int xennet_remove(struct xenbus_device *dev)
 		rtnl_unlock();
 	}
 	xennet_free_netdev(info->netdev);
-
-	return 0;
 }
 
 static const struct xenbus_device_id netfront_ids[] = {
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 7378e2f3e525..fcd029ca2eb1 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -1055,14 +1055,12 @@ static int pcifront_xenbus_probe(struct xenbus_device *xdev,
 	return err;
 }
 
-static int pcifront_xenbus_remove(struct xenbus_device *xdev)
+static void pcifront_xenbus_remove(struct xenbus_device *xdev)
 {
 	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
 
 	if (pdev)
 		free_pdev(pdev);
-
-	return 0;
 }
 
 static const struct xenbus_device_id xenpci_ids[] = {
diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 66b316d173b0..71a3bb83984c 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -995,7 +995,7 @@ static int scsifront_suspend(struct xenbus_device *dev)
 	return err;
 }
 
-static int scsifront_remove(struct xenbus_device *dev)
+static void scsifront_remove(struct xenbus_device *dev)
 {
 	struct vscsifrnt_info *info = dev_get_drvdata(&dev->dev);
 
@@ -1011,8 +1011,6 @@ static int scsifront_remove(struct xenbus_device *dev)
 
 	scsifront_free_ring(info);
 	scsi_host_put(info->host);
-
-	return 0;
 }
 
 static void scsifront_disconnect(struct vscsifrnt_info *info)
diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 7c23112dc923..c879f922c716 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -394,9 +394,9 @@ static int xen_console_remove(struct xencons_info *info)
 	return 0;
 }
 
-static int xencons_remove(struct xenbus_device *dev)
+static void xencons_remove(struct xenbus_device *dev)
 {
-	return xen_console_remove(dev_get_drvdata(&dev->dev));
+	xen_console_remove(dev_get_drvdata(&dev->dev));
 }
 
 static int xencons_connect_backend(struct xenbus_device *dev,
diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index de1b09158318..46fdab940092 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -1530,15 +1530,13 @@ static void xenhcd_backend_changed(struct xenbus_device *dev,
 	}
 }
 
-static int xenhcd_remove(struct xenbus_device *dev)
+static void xenhcd_remove(struct xenbus_device *dev)
 {
 	struct xenhcd_info *info = dev_get_drvdata(&dev->dev);
 	struct usb_hcd *hcd = xenhcd_info_to_hcd(info);
 
 	xenhcd_destroy_rings(info);
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static int xenhcd_probe(struct xenbus_device *dev,
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 4d2694d904aa..ae8a50ecdbd3 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -67,7 +67,7 @@ MODULE_PARM_DESC(video,
 	"Video memory size in MB, width, height in pixels (default 2,800,600)");
 
 static void xenfb_make_preferred_console(void);
-static int xenfb_remove(struct xenbus_device *);
+static void xenfb_remove(struct xenbus_device *);
 static void xenfb_init_shared_page(struct xenfb_info *, struct fb_info *);
 static int xenfb_connect_backend(struct xenbus_device *, struct xenfb_info *);
 static void xenfb_disconnect_backend(struct xenfb_info *);
@@ -527,7 +527,7 @@ static int xenfb_resume(struct xenbus_device *dev)
 	return xenfb_connect_backend(dev, info);
 }
 
-static int xenfb_remove(struct xenbus_device *dev)
+static void xenfb_remove(struct xenbus_device *dev)
 {
 	struct xenfb_info *info = dev_get_drvdata(&dev->dev);
 
@@ -542,8 +542,6 @@ static int xenfb_remove(struct xenbus_device *dev)
 	vfree(info->gfns);
 	vfree(info->fb);
 	kfree(info);
-
-	return 0;
 }
 
 static unsigned long vmalloc_to_gfn(void *address)
diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index d6f945fd4147..ea52a2092bb8 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -1181,9 +1181,8 @@ static void pvcalls_back_changed(struct xenbus_device *dev,
 	}
 }
 
-static int pvcalls_back_remove(struct xenbus_device *dev)
+static void pvcalls_back_remove(struct xenbus_device *dev)
 {
-	return 0;
 }
 
 static int pvcalls_back_uevent(struct xenbus_device *xdev,
diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 1826e8e67125..5328f4d35f25 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -1085,7 +1085,7 @@ static const struct xenbus_device_id pvcalls_front_ids[] = {
 	{ "" }
 };
 
-static int pvcalls_front_remove(struct xenbus_device *dev)
+static void pvcalls_front_remove(struct xenbus_device *dev)
 {
 	struct pvcalls_bedata *bedata;
 	struct sock_mapping *map = NULL, *n;
@@ -1121,7 +1121,6 @@ static int pvcalls_front_remove(struct xenbus_device *dev)
 	kfree(bedata->ring.sring);
 	kfree(bedata);
 	xenbus_switch_state(dev, XenbusStateClosed);
-	return 0;
 }
 
 static int pvcalls_front_probe(struct xenbus_device *dev,
diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index d171091eec12..b11e401f1b1e 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -716,14 +716,12 @@ static int xen_pcibk_xenbus_probe(struct xenbus_device *dev,
 	return err;
 }
 
-static int xen_pcibk_xenbus_remove(struct xenbus_device *dev)
+static void xen_pcibk_xenbus_remove(struct xenbus_device *dev)
 {
 	struct xen_pcibk_device *pdev = dev_get_drvdata(&dev->dev);
 
 	if (pdev != NULL)
 		free_pdev(pdev);
-
-	return 0;
 }
 
 static const struct xenbus_device_id xen_pcibk_ids[] = {
diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index 6106ed93817d..954188b0b858 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -1249,7 +1249,7 @@ static void scsiback_release_translation_entry(struct vscsibk_info *info)
 	spin_unlock_irqrestore(&info->v2p_lock, flags);
 }
 
-static int scsiback_remove(struct xenbus_device *dev)
+static void scsiback_remove(struct xenbus_device *dev)
 {
 	struct vscsibk_info *info = dev_get_drvdata(&dev->dev);
 
@@ -1261,8 +1261,6 @@ static int scsiback_remove(struct xenbus_device *dev)
 	gnttab_page_cache_shrink(&info->free_pages, 0);
 
 	dev_set_drvdata(&dev->dev, NULL);
-
-	return 0;
 }
 
 static int scsiback_probe(struct xenbus_device *dev,
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index eaa932b99d8a..ad4fb4eab753 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -117,7 +117,7 @@ struct xenbus_driver {
 		     const struct xenbus_device_id *id);
 	void (*otherend_changed)(struct xenbus_device *dev,
 				 enum xenbus_state backend_state);
-	int (*remove)(struct xenbus_device *dev);
+	void (*remove)(struct xenbus_device *dev);
 	int (*suspend)(struct xenbus_device *dev);
 	int (*resume)(struct xenbus_device *dev);
 	int (*uevent)(struct xenbus_device *, struct kobj_uevent_env *);
diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index b15c64128c3e..4387990b9b41 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -294,13 +294,12 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 	kfree(priv);
 }
 
-static int xen_9pfs_front_remove(struct xenbus_device *dev)
+static void xen_9pfs_front_remove(struct xenbus_device *dev)
 {
 	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
 
 	dev_set_drvdata(&dev->dev, NULL);
 	xen_9pfs_front_free(priv);
-	return 0;
 }
 
 static int xen_9pfs_front_alloc_dataring(struct xenbus_device *dev,
diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
index 4041748c12e5..b66e037710d0 100644
--- a/sound/xen/xen_snd_front.c
+++ b/sound/xen/xen_snd_front.c
@@ -311,7 +311,7 @@ static int xen_drv_probe(struct xenbus_device *xb_dev,
 	return xenbus_switch_state(xb_dev, XenbusStateInitialising);
 }
 
-static int xen_drv_remove(struct xenbus_device *dev)
+static void xen_drv_remove(struct xenbus_device *dev)
 {
 	struct xen_snd_front_info *front_info = dev_get_drvdata(&dev->dev);
 	int to = 100;
@@ -345,7 +345,6 @@ static int xen_drv_remove(struct xenbus_device *dev)
 
 	xen_snd_drv_fini(front_info);
 	xenbus_frontend_closed(dev);
-	return 0;
 }
 
 static const struct xenbus_device_id xen_drv_ids[] = {
-- 
2.25.1

