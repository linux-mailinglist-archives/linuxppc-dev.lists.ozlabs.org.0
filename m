Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174040B0F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 16:35:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H85VQ1Stbz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 00:35:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HJ03/l+7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HJ03/l+7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H85RV1r8bz3c4Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 00:32:54 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA76861211;
 Tue, 14 Sep 2021 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631629970;
 bh=FL//ARyKpVZvvzBsfsKotKPtQwCMgGn355bElMoK46s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJ03/l+7VPxsuHZGMwOG5NTszRWIyNHPKXAi2qFi1S7ozrWncMovti01/qK3iQIl7
 G17X9pGqNohvpQB14/ORTmDc/kD0WN72y5+3CozxFFH7fxy1ydhH/drproEdJIzH+E
 ogGWZuAVFPVeLkNgzdG67TA5o1z5YKTrbi7+BxdX/8FQZFZyqJh+NtED9Day820eb2
 e4MLOTDys66ZOOM/kaeBDSDPOMqjAUt0n4EwzHzOAFB4g+75Vtiz/ugH5sNb/9Yy+g
 j7UmeHErsELX2iFFT2hP5kOmyvXrQXdvUR7dWLUfs0G7fZHKJaMM7yT4MR60zT248h
 7hSqh9n3JYbdA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQ9UN-000Kke-Kx; Tue, 14 Sep 2021 16:32:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 07/29] ABI: sysfs-class-cxl: place "not in a guest" at
 description
Date: Tue, 14 Sep 2021 16:32:22 +0200
Message-Id: <88ce67c9eed1ae08af3d3992415032723184af9e.1631629496.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631629496.git.mchehab+huawei@kernel.org>
References: <cover.1631629496.git.mchehab+huawei@kernel.org>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The What: field should have just the location of the ABI.
Anything else should be inside the description.

This fixes its parsing by get_abi.pl script.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-class-cxl | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
index 818f55970efb..3c77677e0ca7 100644
--- a/Documentation/ABI/testing/sysfs-class-cxl
+++ b/Documentation/ABI/testing/sysfs-class-cxl
@@ -166,10 +166,11 @@ Description:    read only
                 Decimal value of the Per Process MMIO space length.
 Users:		https://github.com/ibm-capi/libcxl
 
-What:           /sys/class/cxl/<afu>m/pp_mmio_off (not in a guest)
+What:           /sys/class/cxl/<afu>m/pp_mmio_off
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
+                (not in a guest)
                 Decimal value of the Per Process MMIO space offset.
 Users:		https://github.com/ibm-capi/libcxl
 
@@ -190,28 +191,31 @@ Description:    read only
                 Identifies the revision level of the PSL.
 Users:		https://github.com/ibm-capi/libcxl
 
-What:           /sys/class/cxl/<card>/base_image (not in a guest)
+What:           /sys/class/cxl/<card>/base_image
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
+                (not in a guest)
                 Identifies the revision level of the base image for devices
                 that support loadable PSLs. For FPGAs this field identifies
                 the image contained in the on-adapter flash which is loaded
                 during the initial program load.
 Users:		https://github.com/ibm-capi/libcxl
 
-What:           /sys/class/cxl/<card>/image_loaded (not in a guest)
+What:           /sys/class/cxl/<card>/image_loaded
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
+                (not in a guest)
                 Will return "user" or "factory" depending on the image loaded
                 onto the card.
 Users:		https://github.com/ibm-capi/libcxl
 
-What:           /sys/class/cxl/<card>/load_image_on_perst (not in a guest)
+What:           /sys/class/cxl/<card>/load_image_on_perst
 Date:           December 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read/write
+                (not in a guest)
                 Valid entries are "none", "user", and "factory".
                 "none" means PERST will not cause image to be loaded to the
                 card.  A power cycle is required to load the image.
@@ -235,10 +239,11 @@ Description:    write only
                 contexts on the card AFUs.
 Users:		https://github.com/ibm-capi/libcxl
 
-What:		/sys/class/cxl/<card>/perst_reloads_same_image (not in a guest)
+What:		/sys/class/cxl/<card>/perst_reloads_same_image
 Date:		July 2015
 Contact:	linuxppc-dev@lists.ozlabs.org
 Description:	read/write
+                (not in a guest)
 		Trust that when an image is reloaded via PERST, it will not
 		have changed.
 
-- 
2.31.1

