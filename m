Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A55851E56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 21:05:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=bP3iAHEn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYb731gkpz3dXX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:05:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=bP3iAHEn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYb5X4HySz3cDy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 07:04:32 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2435299b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 12:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707768269; x=1708373069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+k6mhvn9Z1qEZ9gBX0t2yHWJO1e3EK/9q68mH5gChTQ=;
        b=PMCgWwJU38nr1k6tWgUUJVoMFw9Awp2lqt1/jmc6HkyRjuB5QliZyQZdeelSKLiyT+
         ghsuSUNnB7GSiLGxgYHKw5lU2ssxzQAgNt2HmBQBauEJ50xmeVCqHdwKb4AwvThPjPUT
         UkEhFJtbl01UEIg1fWaaINvhoY+hW2yYqnU3J2gEY/FopeHiti2P/UyTubYlt3mGWFDx
         sz3oR7nSlJ8f9aqtNnXdiXCDQ9WfOWcZ5IU63KBOmBgcIl+RJYaGWnR7ruD2h4/mz5x7
         CL4u682xVOxb96rrb4rXGTAyTDI1bAckQXf7KczmyXLjvWu3uRPKDIHOVHVvqVDUGwYH
         C5EA==
X-Gm-Message-State: AOJu0Yx5Hf0hhVHcOeOIYD5RQSVRUmi5Mf5NEVsaNuJUr3GRdOwc98fr
	1Al1+uLAxlNY+xrs8Uwl9NnmRNKu8Z73R0BC3ZM1cBNGOdXGT1x7vCEOdMuX4FxcAA==
X-Google-Smtp-Source: AGHT+IGINKvWIJviGPBsQnG5Y9YOLcPHdz9CrHwwAVWMn9ql/eiw3kT15DsdD3uic+drF37CCVC1HQ==
X-Received: by 2002:a05:6a00:2285:b0:6e0:e83f:22b2 with SMTP id f5-20020a056a00228500b006e0e83f22b2mr690051pfe.6.1707768269378;
        Mon, 12 Feb 2024 12:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgCKtXsirL9+QyNsE0b5YkwqaCJEVuunHmZiNUfim68vjnO8XGkKWA2NreEOZ0RSlBb3qqPDE9lmUmMvdr98zBQy8+1jKmB9dfhrw8nu6MM5mlX8CEaZ/iT0CgLQnTGOAZydd0Csi8eeyOx2IKo6VZ/n/Ut8LWuj66AZ2+5UXFInwWbYcjtpnFYkA3p/WGduxbKaZbt62JulX6ZC71jRy4yujVg07lxtY7ckd/Fq9yMi/FfOd6tejjrmZB7odbngxdb11zlm5mXngl+xli
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id f10-20020a056a001aca00b006da2aad58adsm6111971pfv.176.2024.02.12.12.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:04:28 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707768267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+k6mhvn9Z1qEZ9gBX0t2yHWJO1e3EK/9q68mH5gChTQ=;
	b=bP3iAHEn0t2yIJiVbc1IyGN2VF+//5u0L0EATzxHY3YxIY4L1r0vN0V9Cbv9NQDfzFpT3q
	Bqgo27U94aD0xX6d4v+y7PNjMECKek+XV449DEEKPWFRYq/oAcXGXh/D4AX+UCYmcCBklV
	NP10gnmtADQzI+Ousof7Y2oArHK4kfo+uwnQT2Fm+8qh19D/q3GzF45gQHdhsCJqwKnghe
	oA6IVAbiuyv/s26a9Ar/wddXkkOOfQqip4dNNYdy8YbeToIp6UYDa79/gLsXX6k2Z76nUz
	s7J9EUiy6wlS/MJeSIBjouw9VM8uNzcmDqGciSBZ3avEsAKouc3jRDfobjMquA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 12 Feb 2024 17:04:59 -0300
Subject: [PATCH v2 1/5] powerpc: vio: move device attributes into a new
 ifdef
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-bus_cleanup-powerpc2-v2-1-8441b3f77827@marliere.net>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3550; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=/dPB3W4ot4IPM57QJHJQ3SgqCr0LIpHfgk+Di4Umxa8=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlynnuYhyrYfoN9ksVb2HrsIX3LZN4DUe/acctL
 x6Xnv1jhDaJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcp57gAKCRDJC4p8Y4ZY
 pogdEACTenv2YC6Xsjpap9+JxL5O8Hq3ORJnwXLvrAn4x6mBHwtceDg/pPNfOqkVy9XQZRxfFVJ
 KwWQV0VqIM2Z52von87F2QcHJxdL6F6WanAxjOzy27t5q0qAzTUxERt37hiHxKAHK7rL44KmhEK
 +hpKTYyBAh26HMTqROzSD/KenTsWP/vcmiNYVpMcPy+5iF/Z9U+cbkByxndneohlOxnbHGZ0Rj9
 +8K3wWMo7QWf6ZVFIrDbUozum0iw4tKBYoPOcWTTt21zVRE+2Z10E9EDhaXZ/XxWD5Xz/MjjOSh
 xVXmwjsEy9T03nNVoHxWTtPzM3y35XIvvQGgCV5ZuhXOiAFD2EAV7aSCMY8+fNW+xi70zgw73c0
 PIYgw2TbBATBlTe4kHi+S0gffDNmN/aiLOOd0F0EpW66emuyI5k2HhEW86uTvedC3SlQJupi3PX
 QosGuWCkcwsvFqHhIcPHh8m3LJ8RpGm7kavGSVij1fmPvNNd+ba588nPqJTz93vS7H4KEOQ2pmh
 oWInWLPm+ONFZReKtvOnJRjuapq5ktmelIMwSQmGeB0vchpwU49Zg5wsAG8NV+Lhszu1nztPuWi
 Fiz07LP/fRLsHcsF2JCIGLhZ6JbhgXnVrcTZzrOxB7qYcJLd7i5fIvgKfoPgYaDslzaiOb8OLG7
 4+8MdJT/Qw5wCqA==
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

