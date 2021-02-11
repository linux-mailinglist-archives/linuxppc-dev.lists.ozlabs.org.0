Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C12523196AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 00:33:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcCcG5yqfzDwv6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 10:33:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.178;
 helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcCV53RyqzDwnv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 10:27:56 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id f3so4379856oiw.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 15:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ADz3YBOZKFLK6zF24DOxVVKS+J+CretpaVJj7vT++ec=;
 b=GfAswGYeBYQHjzo4ajJGqdApRcUtbIwKd8aOaPC219vqKfEBDuzXu4VeukF608UgJD
 fjzVKxhXr48so01nkVgRL3Frq03B/HoLiVDieExFZZAScWg4MSaeKed0QTr71jaXKlaR
 zPv0KJx4mx/ddnRu4R02I+7mB1GRQvrK3EdOvfxWVUGaaMe+P+VXgapX/1gxFksdN15g
 XJgT7R0meJRD8Lc1VZXgiDgzSjUweIngPSCw9jlAb12b4MzSjL+fvkdIzVge5JOldumV
 gfk6mHUGXztCl8EFJxyErWxcWP2L9uo1QC8tA1zd96crFcY5DgKpqkaqcuh5xj20Nu4x
 HjJg==
X-Gm-Message-State: AOAM532PNfx8vKUjvCgBOcaiaPX1Ot6gf97/qgU40BGVbBg74oi7zqqB
 5cXPfFEO0LwvNU8BhuWlbw==
X-Google-Smtp-Source: ABdhPJy+twQqGpwKSav6zIZvsh713BBmGhpUj6WaxgTGWBdNTF041IP+ZozxodSFlnoZb6Znde+AKQ==
X-Received: by 2002:aca:eb13:: with SMTP id j19mr185629oih.10.1613086073175;
 Thu, 11 Feb 2021 15:27:53 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id s18sm1283922oih.53.2021.02.11.15.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 15:27:51 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] driver core: platform: Drop of_device_node_put()
 wrapper
Date: Thu, 11 Feb 2021 17:27:45 -0600
Message-Id: <20210211232745.1498137-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210211232745.1498137-1-robh@kernel.org>
References: <20210211232745.1498137-1-robh@kernel.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>,
 Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Gilles Muller <Gilles.Muller@inria.fr>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_device_node_put() is just a wrapper for of_node_put(). The platform
driver core is already polluted with of_node pointers and the only 'get'
already uses of_node_get() (though typically the get would happen in
of_device_alloc()).

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix build
---
 drivers/base/platform.c   | 2 +-
 include/linux/of_device.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 95fd1549f87d..9d5171e5f967 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -571,7 +571,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_device_node_put(&pa->pdev.dev);
+	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index d7a407dfeecb..1d7992a02e36 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -38,11 +38,6 @@ extern int of_device_request_module(struct device *dev);
 extern void of_device_uevent(struct device *dev, struct kobj_uevent_env *env);
 extern int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env);
 
-static inline void of_device_node_put(struct device *dev)
-{
-	of_node_put(dev->of_node);
-}
-
 static inline struct device_node *of_cpu_device_node_get(int cpu)
 {
 	struct device *cpu_dev;
@@ -94,8 +89,6 @@ static inline int of_device_uevent_modalias(struct device *dev,
 	return -ENODEV;
 }
 
-static inline void of_device_node_put(struct device *dev) { }
-
 static inline const struct of_device_id *of_match_device(
 		const struct of_device_id *matches, const struct device *dev)
 {
-- 
2.27.0

