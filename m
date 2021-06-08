Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 581093A0603
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03HQ5v5xz3c4Z
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MIVZhyRT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MIVZhyRT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MIVZhyRT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MIVZhyRT; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03CW251pz302Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViEykWcWGSvJdleNjNz3B2WrAcaruIrzouc3Tvdb1Z4=;
 b=MIVZhyRTkeRFZ/1WbeW+P+y3D72z7cSexje8FstTZUGnBVnPNrymEeeWy/dDBpwgLaHBjO
 g15LQBoRfRkRfzDo4mICyoissIpGL+2QLBqm9BHpBiBRz0fyc6Qj1/TKxPg/HF6CJUp9Cn
 jiAwwBHqWbuahn3TrD7+bRo277Yxqfo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViEykWcWGSvJdleNjNz3B2WrAcaruIrzouc3Tvdb1Z4=;
 b=MIVZhyRTkeRFZ/1WbeW+P+y3D72z7cSexje8FstTZUGnBVnPNrymEeeWy/dDBpwgLaHBjO
 g15LQBoRfRkRfzDo4mICyoissIpGL+2QLBqm9BHpBiBRz0fyc6Qj1/TKxPg/HF6CJUp9Cn
 jiAwwBHqWbuahn3TrD7+bRo277Yxqfo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-cQns6VLMN0GdStlEOJVUvw-1; Tue, 08 Jun 2021 17:24:17 -0400
X-MC-Unique: cQns6VLMN0GdStlEOJVUvw-1
Received: by mail-oi1-f199.google.com with SMTP id
 r19-20020acaa8130000b02901f41b1b235bso3220441oie.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ViEykWcWGSvJdleNjNz3B2WrAcaruIrzouc3Tvdb1Z4=;
 b=fkhjGGaOH8NcEujkTXT0JBD6VoNaz4GMFXzjaE56TRNoivC6idiO9wH2S7Noq0AYUD
 YO2NbHZTPIoDXDH0sVzQq8ezXnt7h6srGO6Z2A66Tp2Rvrr90ccuvuOChYtRHxx/ohjE
 J8gNcNG0nL8T3SovrxL9O5depO2JXyM3+5iwRl00KHyYy5fT3wD9au4awkIRbkJKRFSr
 Q6R+Ojeqai0wz/AZvJ+9/yRlNTeeP/DsO9FKv5fl3kXNTdwUzLovfp+qB62GYcXfdSqA
 lE9HDUKW6sDJ9L7uTjhr2/ebQvW7x4xhsXPvoS5CiUWxHu4UIkRQ63m/yWNyo+s/hwga
 KU0Q==
X-Gm-Message-State: AOAM533KVf3IUTxU+bSoLwhQOUhlS83G56ZdWy/Z9H0o8DbXznK08eZ9
 6sF37xj1EuEC92o6H8FtySkxkyMPmlpiUvv8gC8gKjyx4GBdflzBvhN+0LDWsixZx+H/x5rkBi7
 IRMP4yKAErZfIrtm5kJsZejOp2g==
X-Received: by 2002:a05:6830:18c2:: with SMTP id
 v2mr9157817ote.153.1623187456524; 
 Tue, 08 Jun 2021 14:24:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6QzilQkRl7SxrG+FgBy24w4LGvOChfmKmMWjk5ocJ4F1tbHl+3eLZ+0Zx8MJFGgZAvEZWoA==
X-Received: by 2002:a05:6830:18c2:: with SMTP id
 v2mr9157792ote.153.1623187456326; 
 Tue, 08 Jun 2021 14:24:16 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:16 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 06/11] fpga: bridge: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:45 -0700
Message-Id: <20210608212350.3029742-8-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/fpga-bridge.c       | 22 +++++++++++-----------
 include/linux/fpga/fpga-bridge.h |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
index 05c6d4f2d043f..beef53b194b27 100644
--- a/drivers/fpga/fpga-bridge.c
+++ b/drivers/fpga/fpga-bridge.c
@@ -85,14 +85,14 @@ static struct fpga_bridge *__fpga_bridge_get(struct device *dev,
 }
 
 /**
- * of_fpga_bridge_get - get an exclusive reference to a fpga bridge
+ * of_fpga_bridge_get - get an exclusive reference to an fpga bridge
  *
- * @np: node pointer of a FPGA bridge
+ * @np: node pointer of an FPGA bridge
  * @info: fpga image specific information
  *
  * Return fpga_bridge struct if successful.
  * Return -EBUSY if someone already has a reference to the bridge.
- * Return -ENODEV if @np is not a FPGA Bridge.
+ * Return -ENODEV if @np is not an FPGA Bridge.
  */
 struct fpga_bridge *of_fpga_bridge_get(struct device_node *np,
 				       struct fpga_image_info *info)
@@ -113,11 +113,11 @@ static int fpga_bridge_dev_match(struct device *dev, const void *data)
 }
 
 /**
- * fpga_bridge_get - get an exclusive reference to a fpga bridge
+ * fpga_bridge_get - get an exclusive reference to an fpga bridge
  * @dev:	parent device that fpga bridge was registered with
  * @info:	fpga manager info
  *
- * Given a device, get an exclusive reference to a fpga bridge.
+ * Given a device, get an exclusive reference to an fpga bridge.
  *
  * Return: fpga bridge struct or IS_ERR() condition containing error code.
  */
@@ -224,7 +224,7 @@ EXPORT_SYMBOL_GPL(fpga_bridges_put);
 /**
  * of_fpga_bridge_get_to_list - get a bridge, add it to a list
  *
- * @np: node pointer of a FPGA bridge
+ * @np: node pointer of an FPGA bridge
  * @info: fpga image specific information
  * @bridge_list: list of FPGA bridges
  *
@@ -373,7 +373,7 @@ struct fpga_bridge *fpga_bridge_create(struct device *dev, const char *name,
 EXPORT_SYMBOL_GPL(fpga_bridge_create);
 
 /**
- * fpga_bridge_free - free a fpga bridge created by fpga_bridge_create()
+ * fpga_bridge_free - free an fpga bridge created by fpga_bridge_create()
  * @bridge:	FPGA bridge struct
  */
 void fpga_bridge_free(struct fpga_bridge *bridge)
@@ -397,7 +397,7 @@ static void devm_fpga_bridge_release(struct device *dev, void *res)
  * @br_ops:	pointer to structure of fpga bridge ops
  * @priv:	FPGA bridge private data
  *
- * This function is intended for use in a FPGA bridge driver's probe function.
+ * This function is intended for use in an FPGA bridge driver's probe function.
  * After the bridge driver creates the struct with devm_fpga_bridge_create(), it
  * should register the bridge with fpga_bridge_register().  The bridge driver's
  * remove function should call fpga_bridge_unregister().  The bridge struct
@@ -430,7 +430,7 @@ struct fpga_bridge
 EXPORT_SYMBOL_GPL(devm_fpga_bridge_create);
 
 /**
- * fpga_bridge_register - register a FPGA bridge
+ * fpga_bridge_register - register an FPGA bridge
  *
  * @bridge: FPGA bridge struct
  *
@@ -454,11 +454,11 @@ int fpga_bridge_register(struct fpga_bridge *bridge)
 EXPORT_SYMBOL_GPL(fpga_bridge_register);
 
 /**
- * fpga_bridge_unregister - unregister a FPGA bridge
+ * fpga_bridge_unregister - unregister an FPGA bridge
  *
  * @bridge: FPGA bridge struct
  *
- * This function is intended for use in a FPGA bridge driver's remove function.
+ * This function is intended for use in an FPGA bridge driver's remove function.
  */
 void fpga_bridge_unregister(struct fpga_bridge *bridge)
 {
diff --git a/include/linux/fpga/fpga-bridge.h b/include/linux/fpga/fpga-bridge.h
index 817600a32c935..6c3c28806ff13 100644
--- a/include/linux/fpga/fpga-bridge.h
+++ b/include/linux/fpga/fpga-bridge.h
@@ -11,7 +11,7 @@ struct fpga_bridge;
 /**
  * struct fpga_bridge_ops - ops for low level FPGA bridge drivers
  * @enable_show: returns the FPGA bridge's status
- * @enable_set: set a FPGA bridge as enabled or disabled
+ * @enable_set: set an FPGA bridge as enabled or disabled
  * @fpga_bridge_remove: set FPGA into a specific state during driver remove
  * @groups: optional attribute groups.
  */
-- 
2.26.3

