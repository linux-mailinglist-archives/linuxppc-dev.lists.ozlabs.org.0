Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1758642DFE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:55:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqRX3F3gz3c71
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:55:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=QSwuYPPe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::831; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=QSwuYPPe;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20831.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::831])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjz6d4Cz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBziAVoR2WC+9GvuA6QynHhoz5hN4+Y8XFu8MxX4WZPDQtqzsrOFiYzEaPsPsraFoRUSBxBkrOtqwdsLGUik0FyVSSu2k+A9G6yKTjRjYXGZAt0TncIE1C82KpYo9g+XPH5Uxkn3dpKxCRP3MjpYeaQO4cYUW3ZT2cacvw5HDyvFIPl91bAbDtwVFD5BpeeedDrhGkYnwTDo8JXieW5GoqWTfdnKtfUDGQWrlxTgAqWmNreJgIxgvx7MbJx2v7UGZLBCaMvY1aGPw7ShclqmvLtg2YBg6kWKT/hCHYJ3DgUWEwXvYYDjOnHU0h9MCpH48Z/QHsI378S9J0gcjBcwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae8lwIsssZlGnbFvce9EsnokVk2I1hNmGTfRw32yF8U=;
 b=B7XNc9P15NIrxeyAKyuiUDtsbVfsKCCytnTjSYPvnqj2nISsGfTnbVf58B5GF9e2I4ZXDwnhq69aku/mKj+IyeWsFLKLwrSMMdL7jbMRqcz1owy7qlWsvLj/3D/Y3P3fVxHW2DIP/Dej+dTYcKMmynMJoLvSamNVTOwgvqM+rIa9eHI1IYxLRuVWn3qNH+fVDah3OUGvDUcmszRR3/U9x9k1X23O/JqjPHtS1iX0NAx9buyPzzs4ShF/RhAaJk44OjqhyRR/x4Tm+PtzASjsFmrMDmlC6YCsl564cxqgzCbNVzy31kfJ1SHsFpK7o742Il9VuDRhxucxC01plBGrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae8lwIsssZlGnbFvce9EsnokVk2I1hNmGTfRw32yF8U=;
 b=QSwuYPPeMUD2346RRtHUm7fbS75ximiKxVhdRykiY59UHGNbqZ40sMMmqOhZ/rExLp8XId50SW4LMs+Bi0OliaAqCkzFlxc4se6t9DRONHlfdYev0ULWxTu4hqaM3WlLiAl3lvwH1CKZLx2YsQy59nu38R44u1W1qODQWhqLsmv+4BVcnVd1A52n7mBTYc49iQyL9mWOmebk9qy+uxY9ZMu5U3lt0y988iKqz2/k/Y1YUOxGptyRgNlvROe9Y6oWiHO/dYfL9027ifuHAFK7ctS7/Vaj5/D4Xn4vUi7y22PWvI8kT+VQq2ust4JqOT8d8xYtLizOXQprqf2YG9JotA==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:04 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:04 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 1/6] hyperv: Make remove callback of hyperv driver void returned
Date: Mon,  5 Dec 2022 23:36:39 +0800
Message-ID:  <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205153644.60909-1-set_pte_at@outlook.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [WnNGDx12n1r1x93HO6MhsKT0plQVIEpL]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-2-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: 71dbcf0a-5c3c-484a-620c-08dad6d68f0c
X-MS-Exchange-SLBlob-MailProps: 	/OoUGmN/RpVKD6y7RJd2fRTadJ6Pq1otARSEbI97kVQ9z76jX14Tr7C5cCQtdf4M5XZP85xv443qKM8XJUUTY9vplACCtPV+01OWzWKqwEm2iHlIDyrUO2h0lX6vTsyGepk5inxHYSodPTq30yKGZCb1oU+MHA2jx2qwhzlFKJBjkvxRpXA66ICv3kBmsl/+CQkHPhlPySD0ss+9W2g+WZlGMm0yCUy32sd0q9YuypSmYJcPPXKXkJvNb0S6glt419b1MAQZ3edZnwWaqE2AX303XUrMGxNnL8mOY5ryp0KzO2VFc+drS0hf90EA15Gmf25f/ND2x302N3Ii4VwxJq6ywsdSvxBWFHXEx/8KwcRBINa9VqLaKeOWvLCe70XDh7+AXswzdLkkmlFRXIOx4g2sTZKzNdYaPfLdSXvYruRvY/wU6njOsTCDal9mSonQ/riFf5RehgwNzIsyydi7eqdnltxxkTf2EJ76QSl8BqH7QqE6YW48n/40JIZksnCx1ZMXbwFg6wO/ZbtNoZ8PNCSAOtRp1gpbiZ7j6Rnfl8e170ilDIVmZJUv6Z0c8B6pL0JpHm/cDQ4Meo5Jin7f+pqTvK37/9zROsfFAfDKvdgfadFemeJlSgnPC2LnDCjiWsiioc3KOdQ8V9hT81vpVikTB7r3gfcBKv8qAoXIa/FLeI+IevS/AbHLlhHLz34yPIVr2/SM6MRp970oINzuXfwF6xsFnaDtwEzwrWtQ7ervgOig9iOvwN3x8GrX0fi0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	B81qwk0qSoOZYJrtBfcT47Xt44jYLh/VKFX+E3kMqQYmfFk8SXM+8vExypNHMKIHQRT/zJMka4Er/K5f2P3NV15gVEMGgZsddBhEOYvuoQJFBnTT+eFhdEVqhhSSBVQRII6Fg1YsKgqtYoxtlj/4y9Bzh8ucSSHA+9TIbe9zQeHWhAM/PNQjttwG1RtFsGUvf/ofrbsDGcpq5xZALhbMMynXEZDqNrH6FwBiw0q/rUMEoUjomv3xyLonHh37yRgMMpZTbOOg7p3F5ouFUNilzcml3W2ytrKmI4RwD0xmKRvKUWA2+veZ9uYryabLOHMlkzOcUnRlHGAprOvRElfd+RPvytsT20SEsxI01F7C9g1hlAMmXYCRD8E7x++TEy12CRZxKwNWB0vDtUrEgSmqTlx5Zy0U9YASgSJoZs7Vj2WDRggJZuFkiLxvN4tp1or0Kc9iuKf5u5rtVEewhWlPaPMGyXLtCiI9VGBELA4a7bXJsU6eP0yQg6B6cnZgrJeH9jhGjAsKaL6jbESfVQaNOHzB05pkr5hLy5I36GsXT4ws9/AoAVF2WJntTF/uh+A0fX+MvcCspw5mrjeXtjU5W5trzILnWpssLIlSir9r8lI2blmOURidgALv8igds8PQZK0s18MN9vyvhdVnDuKlvQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?n522cQ1GcV1UrEICbjb1jIAAwVVOPiapm1xNue+XRZ3VefdhXjbMRZBo2wCb?=
 =?us-ascii?Q?bdL1jozAb5TMpuwVfWHnTDB6VhkZTdYOYKUqZehy3oBL4/RBiMfDg358wSUQ?=
 =?us-ascii?Q?ZOV5Q6atm/PtjHdnjcFnZaJUPg2lecd2Wb09XFQ7pyWe4TlcuoTGl+sikGt1?=
 =?us-ascii?Q?7TRZEs2E0pD7RSGcGeht6CFxkRgAeduLLSS+R/WIEIrFRMOYq+F6Itym9PRO?=
 =?us-ascii?Q?LGVzYhZaaJzOQAIGSxmj7itxW56bOviz+WXHGi2uvHxU9zh/2rB535QNnGr7?=
 =?us-ascii?Q?c/ZVFxCRcpIYgUa9d0QKh85vY01TgsAMyNA3XmvXUC1KjzdB3MxsDK7IAGM2?=
 =?us-ascii?Q?Y37oSJSoOo7MxPHm6EvisSzxyf/Rw9t0H3LqBZ0OjpJEjA7/17iVhv5dwoWY?=
 =?us-ascii?Q?cBZW8UZK8UuiaUXdcEkYMEqTvYcjuoGJzDawYo6jpap+tcdv57b63BoGpBQ8?=
 =?us-ascii?Q?a96vKiLHvkR+gXZeILA4MJamCBQqtxqoLdXLItCJf5m72u8icqcmSRvEYdE2?=
 =?us-ascii?Q?4IHvn7BdrC/IDePWeIOb1SSbyVWehAetwuRnbSqw3iiSsYLtrREhjIWJgfTR?=
 =?us-ascii?Q?GkmcpVM+t7U48kX+1eKVNKuojxsXbCDs3JSFbYX+oujfc8pSpo9eT9w6dvIw?=
 =?us-ascii?Q?uUYlBaRUYTW21RFtAvMYU/g6uOVfTsok93MGJaoQAXtp+lFxDJ8854nYhC0R?=
 =?us-ascii?Q?CWpSe3GYZt7segEvFDf2cntpmPwlIYmRdhZUPuB60/aiVdRnAO9dHTC5bceE?=
 =?us-ascii?Q?6PkgCBP3QzR71H0tzz57zRbriRjyBuZrq1J4qLPgtabL1KTKIhEMqx+/fPAV?=
 =?us-ascii?Q?gr+aGrg0h3j0yU3ki7Aq3S9/Ry3eO5L1/d64J28kWLHqcThN8Bn8CK0bGaAY?=
 =?us-ascii?Q?8Yu6TMprJOYqY2HKV6vMxv2KxyK6PR1iUDRHnUezYsMMVUWZw2Da63yfAZWR?=
 =?us-ascii?Q?LyyC1boyUu2GVV8PuT/2IT6H6SwtuRYgkdAZKxedzPejUiUh4VEky18X0plZ?=
 =?us-ascii?Q?ePUErKaurU0Zpm+uXkBMFoon9mLL6a3z6Uq2wOMyrV764uuSZB/z5voaOnqP?=
 =?us-ascii?Q?hqoEjrE16YJ1/uZA+VHI+qkKtelHzj47tXVODhJYUfjHGV8RVokJNnilNt1X?=
 =?us-ascii?Q?/Uin5HYRGuf5JpyQq9sowMV9A/V4+/dsApi3EVrtxGmnLkI5+zCUAKFYRN1B?=
 =?us-ascii?Q?aDttA4mXqSKP0eNuzIlhV0MiCmeMZcjrLSLkML7PpDFNy6PxJ09OZjOfszzo?=
 =?us-ascii?Q?ue64UTwi658sIGyLvVSy1u2akAKATiYbm2iHssmNVQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dbcf0a-5c3c-484a-620c-08dad6d68f0c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:04.0145
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

This change is for hyperv bus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 4 +---
 drivers/hid/hid-hyperv.c                | 4 +---
 drivers/hv/hv_balloon.c                 | 5 +----
 drivers/hv/hv_util.c                    | 4 +---
 drivers/input/serio/hyperv-keyboard.c   | 4 +---
 drivers/net/hyperv/netvsc_drv.c         | 4 +---
 drivers/pci/controller/pci-hyperv.c     | 3 +--
 drivers/scsi/storvsc_drv.c              | 4 +---
 drivers/uio/uio_hv_generic.c            | 5 ++---
 drivers/video/fbdev/hyperv_fb.c         | 5 +----
 include/linux/hyperv.h                  | 2 +-
 net/vmw_vsock/hyperv_transport.c        | 4 +---
 12 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index ca127ff797f7..d117fff26d99 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -165,7 +165,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 	return ret;
 }
 
-static int hyperv_vmbus_remove(struct hv_device *hdev)
+static void hyperv_vmbus_remove(struct hv_device *hdev)
 {
 	struct drm_device *dev = hv_get_drvdata(hdev);
 	struct hyperv_drm_device *hv = to_hv(dev);
@@ -176,8 +176,6 @@ static int hyperv_vmbus_remove(struct hv_device *hdev)
 	hv_set_drvdata(hdev, NULL);
 
 	vmbus_free_mmio(hv->mem->start, hv->fb_size);
-
-	return 0;
 }
 
 static int hyperv_vmbus_suspend(struct hv_device *hdev)
diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
index ab57b49a44ed..ef16c2a54362 100644
--- a/drivers/hid/hid-hyperv.c
+++ b/drivers/hid/hid-hyperv.c
@@ -535,7 +535,7 @@ static int mousevsc_probe(struct hv_device *device,
 }
 
 
-static int mousevsc_remove(struct hv_device *dev)
+static void mousevsc_remove(struct hv_device *dev)
 {
 	struct mousevsc_dev *input_dev = hv_get_drvdata(dev);
 
@@ -544,8 +544,6 @@ static int mousevsc_remove(struct hv_device *dev)
 	hid_hw_stop(input_dev->hid_device);
 	hid_destroy_device(input_dev->hid_device);
 	mousevsc_free_device(input_dev);
-
-	return 0;
 }
 
 static int mousevsc_suspend(struct hv_device *dev)
diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index 6c127f061f06..6bbd2e6fa3d4 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -1990,7 +1990,7 @@ static int balloon_probe(struct hv_device *dev,
 	return ret;
 }
 
-static int balloon_remove(struct hv_device *dev)
+static void balloon_remove(struct hv_device *dev)
 {
 	struct hv_dynmem_device *dm = hv_get_drvdata(dev);
 	struct hv_hotadd_state *has, *tmp;
@@ -2031,8 +2031,6 @@ static int balloon_remove(struct hv_device *dev)
 		kfree(has);
 	}
 	spin_unlock_irqrestore(&dm_device.ha_lock, flags);
-
-	return 0;
 }
 
 static int balloon_suspend(struct hv_device *hv_dev)
@@ -2112,7 +2110,6 @@ static  struct hv_driver balloon_drv = {
 
 static int __init init_balloon_drv(void)
 {
-
 	return vmbus_driver_register(&balloon_drv);
 }
 
diff --git a/drivers/hv/hv_util.c b/drivers/hv/hv_util.c
index 835e6039c186..24995ac41c86 100644
--- a/drivers/hv/hv_util.c
+++ b/drivers/hv/hv_util.c
@@ -602,7 +602,7 @@ static int util_probe(struct hv_device *dev,
 	return ret;
 }
 
-static int util_remove(struct hv_device *dev)
+static void util_remove(struct hv_device *dev)
 {
 	struct hv_util_service *srv = hv_get_drvdata(dev);
 
@@ -610,8 +610,6 @@ static int util_remove(struct hv_device *dev)
 		srv->util_deinit();
 	vmbus_close(dev->channel);
 	kfree(srv->recv_buffer);
-
-	return 0;
 }
 
 /*
diff --git a/drivers/input/serio/hyperv-keyboard.c b/drivers/input/serio/hyperv-keyboard.c
index d62aefb2e245..31def6ce5157 100644
--- a/drivers/input/serio/hyperv-keyboard.c
+++ b/drivers/input/serio/hyperv-keyboard.c
@@ -369,7 +369,7 @@ static int hv_kbd_probe(struct hv_device *hv_dev,
 	return error;
 }
 
-static int hv_kbd_remove(struct hv_device *hv_dev)
+static void hv_kbd_remove(struct hv_device *hv_dev)
 {
 	struct hv_kbd_dev *kbd_dev = hv_get_drvdata(hv_dev);
 
@@ -378,8 +378,6 @@ static int hv_kbd_remove(struct hv_device *hv_dev)
 	kfree(kbd_dev);
 
 	hv_set_drvdata(hv_dev, NULL);
-
-	return 0;
 }
 
 static int hv_kbd_suspend(struct hv_device *hv_dev)
diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
index 89eb4f179a3c..50c20e4d4147 100644
--- a/drivers/net/hyperv/netvsc_drv.c
+++ b/drivers/net/hyperv/netvsc_drv.c
@@ -2594,7 +2594,7 @@ static int netvsc_probe(struct hv_device *dev,
 	return ret;
 }
 
-static int netvsc_remove(struct hv_device *dev)
+static void netvsc_remove(struct hv_device *dev)
 {
 	struct net_device_context *ndev_ctx;
 	struct net_device *vf_netdev, *net;
@@ -2603,7 +2603,6 @@ static int netvsc_remove(struct hv_device *dev)
 	net = hv_get_drvdata(dev);
 	if (net == NULL) {
 		dev_err(&dev->device, "No net device to remove\n");
-		return 0;
 	}
 
 	ndev_ctx = netdev_priv(net);
@@ -2637,7 +2636,6 @@ static int netvsc_remove(struct hv_device *dev)
 
 	free_percpu(ndev_ctx->vf_stats);
 	free_netdev(net);
-	return 0;
 }
 
 static int netvsc_suspend(struct hv_device *dev)
diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index ba64284eaf9f..3a09de70d6ea 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -3756,7 +3756,7 @@ static int hv_pci_bus_exit(struct hv_device *hdev, bool keep_devs)
  *
  * Return: 0 on success, -errno on failure
  */
-static int hv_pci_remove(struct hv_device *hdev)
+static void hv_pci_remove(struct hv_device *hdev)
 {
 	struct hv_pcibus_device *hbus;
 	int ret;
@@ -3795,7 +3795,6 @@ static int hv_pci_remove(struct hv_device *hdev)
 	hv_put_dom_num(hbus->bridge->domain_nr);
 
 	kfree(hbus);
-	return ret;
 }
 
 static int hv_pci_suspend(struct hv_device *hdev)
diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index bc46721aa01c..d253e7d5959d 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -2093,7 +2093,7 @@ static int storvsc_change_queue_depth(struct scsi_device *sdev, int queue_depth)
 	return scsi_change_queue_depth(sdev, queue_depth);
 }
 
-static int storvsc_remove(struct hv_device *dev)
+static void storvsc_remove(struct hv_device *dev)
 {
 	struct storvsc_device *stor_device = hv_get_drvdata(dev);
 	struct Scsi_Host *host = stor_device->host;
@@ -2109,8 +2109,6 @@ static int storvsc_remove(struct hv_device *dev)
 	scsi_remove_host(host);
 	storvsc_dev_remove(dev);
 	scsi_host_put(host);
-
-	return 0;
 }
 
 static int storvsc_suspend(struct hv_device *hv_dev)
diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index c08a6cfd119f..20d9762331bd 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -355,20 +355,19 @@ hv_uio_probe(struct hv_device *dev,
 	return ret;
 }
 
-static int
+static void
 hv_uio_remove(struct hv_device *dev)
 {
 	struct hv_uio_private_data *pdata = hv_get_drvdata(dev);
 
 	if (!pdata)
-		return 0;
+		return;
 
 	sysfs_remove_bin_file(&dev->channel->kobj, &ring_buffer_bin_attr);
 	uio_unregister_device(&pdata->info);
 	hv_uio_cleanup(dev, pdata);
 
 	vmbus_free_ring(dev->channel);
-	return 0;
 }
 
 static struct hv_driver hv_uio_drv = {
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 072ce07ba9e0..721b7c34a99e 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1226,8 +1226,7 @@ static int hvfb_probe(struct hv_device *hdev,
 	return ret;
 }
 
-
-static int hvfb_remove(struct hv_device *hdev)
+static void hvfb_remove(struct hv_device *hdev)
 {
 	struct fb_info *info = hv_get_drvdata(hdev);
 	struct hvfb_par *par = info->par;
@@ -1248,8 +1247,6 @@ static int hvfb_remove(struct hv_device *hdev)
 
 	hvfb_putmem(hdev, info);
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static int hvfb_suspend(struct hv_device *hdev)
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 3b42264333ef..1f128f28a487 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1273,7 +1273,7 @@ struct hv_driver {
 	} dynids;
 
 	int (*probe)(struct hv_device *, const struct hv_vmbus_device_id *);
-	int (*remove)(struct hv_device *);
+	void (*remove)(struct hv_device *dev);
 	void (*shutdown)(struct hv_device *);
 
 	int (*suspend)(struct hv_device *);
diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
index 59c3e2697069..7cb1a9d2cdb4 100644
--- a/net/vmw_vsock/hyperv_transport.c
+++ b/net/vmw_vsock/hyperv_transport.c
@@ -879,13 +879,11 @@ static int hvs_probe(struct hv_device *hdev,
 	return 0;
 }
 
-static int hvs_remove(struct hv_device *hdev)
+static void hvs_remove(struct hv_device *hdev)
 {
 	struct vmbus_channel *chan = hdev->channel;
 
 	vmbus_close(chan);
-
-	return 0;
 }
 
 /* hv_sock connections can not persist across hibernation, and all the hv_sock
-- 
2.25.1

