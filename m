Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818A8500FD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 01:08:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=NO551Aeq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWrfd2nVnz3dJk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 11:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=NO551Aeq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWrd14wgyz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 11:07:17 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6ddf26eba3cso1070918a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 16:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707523634; x=1708128434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+k6mhvn9Z1qEZ9gBX0t2yHWJO1e3EK/9q68mH5gChTQ=;
        b=EhusGmQEC2pMeQ4X9JC3URWI3+buHEHzE+5ofSi50WFQ8851AwIPcuNZZqCrfT5dmr
         dDNq8gr5xKDG+QpBphHr3sdxBRY5/OJy53y8g8JlqcIGDdgda4GRLZBoB5a0ThIkHohc
         IiXAEP1a4Q8EU1XlXiWR2/Pg6DYTlzj/eVMawfnb7TWpWuROPv11OrLjOCOMXYZQ7NwB
         d+LmsLhqIqXsz83tX4xeDeVVjc90iB6R0+b7cJj1Mqd1w77QGdi3CFLdemYIN++3w7c7
         cvGgLKHbG7tTv0KJ6em9FwAuKTnR7KjKmpRCGqK/FmZ+rcRuSp1wcL4RoWYR75vFOHUt
         rZFA==
X-Gm-Message-State: AOJu0YyB3pjw72Giw1ewJtNQbhyhHf6f49ThrudcXe7u30XR9kIXLH0O
	dQR1yDRk5sLVgIrzyzzkHGA5NoQs4PnZT4ajb2sN2WqHBA2SCAvx
X-Google-Smtp-Source: AGHT+IH4opTdo8HqHY7p/R9q5oe280YiygC8qVbJOabjFrYZu7CeA+vGlEkejvXOg+Od/xkov5EJVA==
X-Received: by 2002:a05:6358:7596:b0:178:e2b3:98da with SMTP id x22-20020a056358759600b00178e2b398damr1319305rwf.28.1707523634437;
        Fri, 09 Feb 2024 16:07:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgUzJFpJ9ws+tmlTd8/7HwuJQKeu6oQjkpNSm4hJ3gi7i4h5xl+vew3uXGJHFJptUOWfPGS2gDS7G7g6CsfT1Ygi0R/lO7joiCLRZF1X4UaFZp5GwWZywYMTFf0wWTfksE4ZzEkVzSDoAksiVjZzB8B/TLh2pbw0gv8kqmR8RNEdTvwtgbqZ7avUiWr+Jw/iHl014clpyxPfK4n/XUu/2ANsRnDH6371JJzqxWNcWn8tEWqTr8xyRwVljZgapCwj5E0rMWjMfDIy3wUmUQ
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id fd23-20020a056a002e9700b006e03cce3f4asm1134093pfb.25.2024.02.09.16.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:07:13 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707523632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+k6mhvn9Z1qEZ9gBX0t2yHWJO1e3EK/9q68mH5gChTQ=;
	b=NO551AeqHmfAsopWz1n+TrdIT6Q88VXLtFC9mCaTH3mUfo5o4xlwWQ3kZEXfftQAKwA7J9
	vl353OHigWEtfOb0nEV7JG4V0wqwAz1GGTCU5MjRoFFKN0H/m1K78+lc/d/eW9JDCwr0GO
	AdPZ2X8CgxT+1KhsWA9VV35af/MjyyDPp5SylHfDcTnhvt85LOnQQ4OHwFObUxNbRJhHCX
	QGFs26Xl60Z5KqKs9YbjG10CyOR0znlmrHXnwB34DzWgHupP4vDm4tvKBRjbIXsIWO0vW1
	Trt1vQFCeDvjFQL5daGKa7B5Caiy6EjgxL//pTy8hKKm0bUVjdRRggqYTjmB3w==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Fri, 09 Feb 2024 21:07:16 -0300
Subject: [PATCH 1/4] powerpc: vio: move device attributes into a new ifdef
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-bus_cleanup-powerpc2-v1-1-79a56dcaebb1@marliere.net>
References: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
In-Reply-To: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3550; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=/dPB3W4ot4IPM57QJHJQ3SgqCr0LIpHfgk+Di4Umxa8=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlxr5PtVS5G6NzxtWQjjXBVbaqJRYDiONqEaNdt
 KuakVG0roSJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZca+TwAKCRDJC4p8Y4ZY
 pjTkD/9hDewxgLOen60OPPy4AvqOqiFv3Dcx0MlJLDI18HrgJrsq6KPziTvoODmAvRF3KcPqeOE
 TIqT+O7t6xXiIKcGtkxHqWv6qWGDoujS//gNjvxqQY5bq0yLnrd3RE6qB/ymNLrZ2hgCK1Xl2EZ
 B/Ms2ZLg7kKX9kNEjYurQk9ltAKu5JnRtKgzOJWz2OersWN3poZfkr5FhM5MKYR16y+MH+jZn08
 K2pxP7P2dpawBHxGEZu8XV30QwEs4mGFjL8ho6uaVouIBV0Pk6Ui4X1ecrUbKhK7mIGE852fLgI
 J4D4mLh8E2Wx853tNoGliqhbIUSUwbxx9o6tOb8LZ4zQdlr1+0XAjB2wU5x6tX0f+NIdNvDeNOk
 jPqg09gzZqCT//fDTptx0aUVMPYC3wdUDhF62KyEiAFe8HDi/RFMAu6Qip/Xes3YiK1dc4UoiRE
 bfmguG71tMbn6Vo+CKAXvlv1SE7sNKsLhm432VQQOlKPsY7iDur+NhLwliMZxw6fcu+u4mp1khT
 lgh7ZycqyQQWh0YChQHbz3sRsQ/cfJ9MRncijvWGjo/d1gBE/Lk1EQ7Mo/u7MLUOqiBcwnf5AoQ
 kUElMBvpwDuhz4WD1FdOwgRFY7t52AAyx9gKpP8yoRBcXsBFndCoIhiCCdcmH5j70ZS+V3EAETA
 C6g0QBVV6HU1HVw==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to make the distinction of the vio_bus_type variable based on
CONFIG_PPC_SMLPAR more explicit, move the required structs into a new
ifdef block. This is needed in order to make vio_bus_type const and
because the distinction is made explicit, there is no need to set the
fields within the vio_cmo_sysfs_init function.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/platforms/pseries/vio.c | 59 +++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 2dc9cbc4bcd8..6c58824190a2 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -991,18 +991,6 @@ static DEVICE_ATTR_RO(cmo_allocated);
 static DEVICE_ATTR_RW(cmo_desired);
 static DEVICE_ATTR_RW(cmo_allocs_failed);
 
-static struct attribute *vio_cmo_dev_attrs[] = {
-	&dev_attr_name.attr,
-	&dev_attr_devspec.attr,
-	&dev_attr_modalias.attr,
-	&dev_attr_cmo_entitled.attr,
-	&dev_attr_cmo_allocated.attr,
-	&dev_attr_cmo_desired.attr,
-	&dev_attr_cmo_allocs_failed.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(vio_cmo_dev);
-
 /* sysfs bus functions and data structures for CMO */
 
 #define viobus_cmo_rd_attr(name)                                        \
@@ -1062,11 +1050,7 @@ static struct attribute *vio_bus_attrs[] = {
 };
 ATTRIBUTE_GROUPS(vio_bus);
 
-static void __init vio_cmo_sysfs_init(void)
-{
-	vio_bus_type.dev_groups = vio_cmo_dev_groups;
-	vio_bus_type.bus_groups = vio_bus_groups;
-}
+static void __init vio_cmo_sysfs_init(void) { }
 #else /* CONFIG_PPC_SMLPAR */
 int vio_cmo_entitlement_update(size_t new_entitlement) { return 0; }
 void vio_cmo_set_dev_desired(struct vio_dev *viodev, size_t desired) {}
@@ -1584,14 +1568,6 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(modalias);
 
-static struct attribute *vio_dev_attrs[] = {
-	&dev_attr_name.attr,
-	&dev_attr_devspec.attr,
-	&dev_attr_modalias.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(vio_dev);
-
 void vio_unregister_device(struct vio_dev *viodev)
 {
 	device_unregister(&viodev->dev);
@@ -1626,6 +1602,38 @@ static int vio_hotplug(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+#ifdef CONFIG_PPC_SMLPAR
+static struct attribute *vio_cmo_dev_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_devspec.attr,
+	&dev_attr_modalias.attr,
+	&dev_attr_cmo_entitled.attr,
+	&dev_attr_cmo_allocated.attr,
+	&dev_attr_cmo_desired.attr,
+	&dev_attr_cmo_allocs_failed.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(vio_cmo_dev);
+
+struct bus_type vio_bus_type = {
+	.name = "vio",
+	.dev_groups = vio_cmo_dev_groups,
+	.bus_groups = vio_bus_groups,
+	.uevent = vio_hotplug,
+	.match = vio_bus_match,
+	.probe = vio_bus_probe,
+	.remove = vio_bus_remove,
+	.shutdown = vio_bus_shutdown,
+};
+#else /* CONFIG_PPC_SMLPAR */
+static struct attribute *vio_dev_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_devspec.attr,
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(vio_dev);
+
 struct bus_type vio_bus_type = {
 	.name = "vio",
 	.dev_groups = vio_dev_groups,
@@ -1635,6 +1643,7 @@ struct bus_type vio_bus_type = {
 	.remove = vio_bus_remove,
 	.shutdown = vio_bus_shutdown,
 };
+#endif /* CONFIG_PPC_SMLPAR */
 
 /**
  * vio_get_attribute: - get attribute for virtual device

-- 
2.43.0

