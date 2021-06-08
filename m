Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 766883A05EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03DK6hcsz3048
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJDIeOCZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJDIeOCZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DJDIeOCZ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJDIeOCZ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03CH1bfmz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkGKzO+CiTBdUeThyikbeVsS+KLpb2VNkP5sOtTgFKc=;
 b=DJDIeOCZrGj/UoIdHByexLmH8K30vs42JorX04jjdcbx3FvMC/nMqID1S/1NJtakdwPZ4Z
 todPzhPHsuy2RnyAGhSIBZ1H7I6W0JG8ABykKL1a49/tAH3ygy0Dl0MSbE+LgGvHA/Zr4v
 8VQJ+pxLCzRgX8+zP3cy8AXwGwo5tV8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkGKzO+CiTBdUeThyikbeVsS+KLpb2VNkP5sOtTgFKc=;
 b=DJDIeOCZrGj/UoIdHByexLmH8K30vs42JorX04jjdcbx3FvMC/nMqID1S/1NJtakdwPZ4Z
 todPzhPHsuy2RnyAGhSIBZ1H7I6W0JG8ABykKL1a49/tAH3ygy0Dl0MSbE+LgGvHA/Zr4v
 8VQJ+pxLCzRgX8+zP3cy8AXwGwo5tV8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-xCihrLDnMbqxLQEt9p6NlQ-1; Tue, 08 Jun 2021 17:24:05 -0400
X-MC-Unique: xCihrLDnMbqxLQEt9p6NlQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 f5-20020a4ab0050000b029023e3bd79e80so14072424oon.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkGKzO+CiTBdUeThyikbeVsS+KLpb2VNkP5sOtTgFKc=;
 b=l7fKCUMHzEbIERoeehDWwP1Ove1RUwA8vvGvI8KIWEokGKJWFWtJosb5EwvgjQrSaw
 LR0M+g0fQcJZqoKFf1pDyFs/AfQE26MkTjE4fPfcNm7Wj8thtucsuiV11k/uw6SsDm/T
 a/ablF27MIfiUcoJHVmLnDKlEgM5dG3jPUzfdBk2gpEyO6QDYQe4+yGorR1JaLjqXrc3
 nLCyTdv0kIJoyfMDlvWwesmEWWP1bH7v7k8fv2nt3GC31kdYOFXIb3aoUpDRF0eGk7rt
 +1Ujt4ywKtFU5W/mN/kKehCz5lf2hPkO2kEzNdjRBEAH1E73ZoSskUV8FOLiC/l56gZn
 6PKQ==
X-Gm-Message-State: AOAM533Ogc0hvs9ROjKTFKONjjsA3bO18SNckF3cxu2hLdI4sUYz/6zn
 FMtoNuf33XVr1S+raNeOhxYMrEtC2gFbXZC5J1zLCN9CQr7amEoEr4wqRFk2yEaRBA67Lst4zGW
 QawrnP2kXAYZujZIHptMYTBrvGQ==
X-Received: by 2002:aca:1b11:: with SMTP id b17mr1881541oib.41.1623187444312; 
 Tue, 08 Jun 2021 14:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypvAWW+ej6XH2gSOp4Ggl1rvJ/MHexAMjH5F0ctMmNCb1jZr3PoAYlElhglwvntrHY5BWilg==
X-Received: by 2002:aca:1b11:: with SMTP id b17mr1881530oib.41.1623187444101; 
 Tue, 08 Jun 2021 14:24:04 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:03 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 01/11] dt-bindings: fpga: fpga-region: change FPGA indirect
 article to an
Date: Tue,  8 Jun 2021 14:23:40 -0700
Message-Id: <20210608212350.3029742-3-trix@redhat.com>
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
 .../devicetree/bindings/fpga/fpga-region.txt  | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
index d787d57491a1c..7d35152648387 100644
--- a/Documentation/devicetree/bindings/fpga/fpga-region.txt
+++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
@@ -38,7 +38,7 @@ Partial Reconfiguration (PR)
 
 Partial Reconfiguration Region (PRR)
  * Also called a "reconfigurable partition"
- * A PRR is a specific section of a FPGA reserved for reconfiguration.
+ * A PRR is a specific section of an FPGA reserved for reconfiguration.
  * A base (or static) FPGA image may create a set of PRR's that later may
    be independently reprogrammed many times.
  * The size and specific location of each PRR is fixed.
@@ -105,7 +105,7 @@ reprogrammed independently while the rest of the system continues to function.
 Sequence
 ========
 
-When a DT overlay that targets a FPGA Region is applied, the FPGA Region will
+When a DT overlay that targets an FPGA Region is applied, the FPGA Region will
 do the following:
 
  1. Disable appropriate FPGA bridges.
@@ -134,8 +134,8 @@ The intended use is that a Device Tree overlay (DTO) can be used to reprogram an
 FPGA while an operating system is running.
 
 An FPGA Region that exists in the live Device Tree reflects the current state.
-If the live tree shows a "firmware-name" property or child nodes under a FPGA
-Region, the FPGA already has been programmed.  A DTO that targets a FPGA Region
+If the live tree shows a "firmware-name" property or child nodes under an FPGA
+Region, the FPGA already has been programmed.  A DTO that targets an FPGA Region
 and adds the "firmware-name" property is taken as a request to reprogram the
 FPGA.  After reprogramming is successful, the overlay is accepted into the live
 tree.
@@ -152,9 +152,9 @@ These FPGA regions are children of FPGA bridges which are then children of the
 base FPGA region.  The "Full Reconfiguration to add PRR's" example below shows
 this.
 
-If an FPGA Region does not specify a FPGA Manager, it will inherit the FPGA
+If an FPGA Region does not specify an FPGA Manager, it will inherit the FPGA
 Manager specified by its ancestor FPGA Region.  This supports both the case
-where the same FPGA Manager is used for all of a FPGA as well the case where
+where the same FPGA Manager is used for all of an FPGA as well the case where
 a different FPGA Manager is used for each region.
 
 FPGA Regions do not inherit their ancestor FPGA regions' bridges.  This prevents
@@ -166,7 +166,7 @@ within the static image of the FPGA.
 Required properties:
 - compatible : should contain "fpga-region"
 - fpga-mgr : should contain a phandle to an FPGA Manager.  Child FPGA Regions
-	inherit this property from their ancestor regions.  A fpga-mgr property
+	inherit this property from their ancestor regions.  An fpga-mgr property
 	in a region will override any inherited FPGA manager.
 - #address-cells, #size-cells, ranges : must be present to handle address space
 	mapping for child nodes.
@@ -175,12 +175,12 @@ Optional properties:
 - firmware-name : should contain the name of an FPGA image file located on the
 	firmware search path.  If this property shows up in a live device tree
 	it indicates that the FPGA has already been programmed with this image.
-	If this property is in an overlay targeting a FPGA region, it is a
+	If this property is in an overlay targeting an FPGA region, it is a
 	request to program the FPGA with that image.
 - fpga-bridges : should contain a list of phandles to FPGA Bridges that must be
 	controlled during FPGA programming along with the parent FPGA bridge.
 	This property is optional if the FPGA Manager handles the bridges.
-        If the fpga-region is  the child of a fpga-bridge, the list should not
+        If the fpga-region is  the child of an fpga-bridge, the list should not
         contain the parent bridge.
 - partial-fpga-config : boolean, set if partial reconfiguration is to be done,
 	otherwise full reconfiguration is done.
@@ -279,7 +279,7 @@ Supported Use Models
 
 In all cases the live DT must have the FPGA Manager, FPGA Bridges (if any), and
 a FPGA Region.  The target of the Device Tree Overlay is the FPGA Region.  Some
-uses are specific to a FPGA device.
+uses are specific to an FPGA device.
 
  * No FPGA Bridges
    In this case, the FPGA Manager which programs the FPGA also handles the
@@ -300,7 +300,7 @@ uses are specific to a FPGA device.
    bridges need to exist in the FPGA that can gate the buses going to each FPGA
    region while the buses are enabled for other sections.  Before any partial
    reconfiguration can be done, a base FPGA image must be loaded which includes
-   PRR's with FPGA bridges.  The device tree should have a FPGA region for each
+   PRR's with FPGA bridges.  The device tree should have an FPGA region for each
    PRR.
 
 Device Tree Examples
-- 
2.26.3

