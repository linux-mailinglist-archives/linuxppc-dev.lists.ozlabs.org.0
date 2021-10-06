Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559474248D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnXk1znZz304m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:24:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jBenZXUZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=sohaib.amhmd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jBenZXUZ; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPYJp3J4sz2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:13:45 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id v17so8166311wrv.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 05:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWb6QO2dk53VJpatF/6HpWWfRgGh/rHvbHxrfaDOD6Y=;
 b=jBenZXUZ8Eqy0u+yOnO/zxN2XluxouS2yWWfwuIgBIFxWDNCKT3EMfe3vg1yVpkIwS
 ou1btCttCrZB8c6q291HAqtAnEUt7CP5iZ3u4jsQDkbZud4ESCV9tFka95trjhmXR8yP
 b6h4TEoFVtrVCUr9XaYaoUAWtcewXu6gS5lZXtp69zTgSRQyigQqcDJWOVgaVbee9YCm
 0pRa2TCpKYh7F6Y3U9JxO+Yhk0RupeVzHCWWGlxmNvS94EQVb/tTIlTmoloGm4qClNP+
 Y0BjBgFo8lEvXE5xKadInSyZ7rc3QRKxK0qKRfxX8sOLC5adFduIYTEa4/NnmQncPS8x
 8NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWb6QO2dk53VJpatF/6HpWWfRgGh/rHvbHxrfaDOD6Y=;
 b=7RBgNwqTm47+78yIQ7Yc4e406XkPJtQfsrWjhhNtir1tSugJilTjCPQMdFL0Cp0EeH
 RPxTpwWd8p0YbYNKPa0hS8dU4XPwyyqyvNhVSx/Djqg1V3aYcWcPD66rK6LU6M7AezO0
 NjB89vEGwIwF1KQYo8b39C0E+sPJvlt7nPnsspYCeivTgD0VZ/LXMhjsw7ZLT4u5joL7
 z4N8IHuzlwUS0AqTBbS6/gIloPH5tATXokRBoiHn1qF3hJbR4Lr/+TuVGdBE5JTbohxS
 33DHnASXZPkI4/M6b9UuLrs5qLt+skw9Fe1LWXSZpwQYDuym56ZLWCuXkKw5iPkJLTyC
 QEWQ==
X-Gm-Message-State: AOAM5332e+a1yaGafVID6aba86btYFRn3bsUe74suGUmlF9jIthowxxJ
 lUgNO0KO1sqwEvTcF6Z+D4U=
X-Google-Smtp-Source: ABdhPJzM0Ws1dunA2tWgej9k+D+yRPqCThuklsEawvkn9fLvPfJ5WzNgYvDbYRwAWfbkOhasxmDBaA==
X-Received: by 2002:adf:9cd2:: with SMTP id h18mr6752731wre.258.1633522417574; 
 Wed, 06 Oct 2021 05:13:37 -0700 (PDT)
Received: from localhost.localdomain ([197.49.35.129])
 by smtp.gmail.com with ESMTPSA id o13sm1411306wmh.30.2021.10.06.05.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 05:13:36 -0700 (PDT)
From: Sohaib Mohamed <sohaib.amhmd@gmail.com>
To: sohaib.amhmd@gmail.com
Subject: [PATCH] docs: typo fixes in Documentation/ABI/
Date: Wed,  6 Oct 2021 14:13:25 +0200
Message-Id: <20211006121333.75799-1-sohaib.amhmd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Oct 2021 08:24:18 +1100
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
Cc: Daejun Park <daejun7.park@samsung.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Can Guo <cang@codeaurora.org>,
 Bean Huo <beanhuo@micron.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Zhang Rui <rui.zhang@intel.com>,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gioh Kim <gi-oh.kim@ionos.com>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sohaib Mohamed <sohaib.amhmd@gmail.com>
---
 Documentation/ABI/stable/sysfs-module                     | 2 +-
 Documentation/ABI/testing/sysfs-bus-rapidio               | 2 +-
 Documentation/ABI/testing/sysfs-class-cxl                 | 4 ++--
 Documentation/ABI/testing/sysfs-class-rnbd-client         | 2 +-
 Documentation/ABI/testing/sysfs-class-rtrs-client         | 2 +-
 Documentation/ABI/testing/sysfs-class-rtrs-server         | 2 +-
 Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD | 2 +-
 Documentation/ABI/testing/sysfs-devices-power             | 2 +-
 Documentation/ABI/testing/sysfs-driver-ufs                | 2 +-
 Documentation/ABI/testing/sysfs-firmware-acpi             | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
index 560b4a3278df..41b1f16e8795 100644
--- a/Documentation/ABI/stable/sysfs-module
+++ b/Documentation/ABI/stable/sysfs-module
@@ -38,7 +38,7 @@ What:		/sys/module/<MODULENAME>/srcversion
 Date:		Jun 2005
 Description:
 		If the module source has MODULE_VERSION, this file will contain
-		the checksum of the the source code.
+		the checksum of the source code.
 
 What:		/sys/module/<MODULENAME>/version
 Date:		Jun 2005
diff --git a/Documentation/ABI/testing/sysfs-bus-rapidio b/Documentation/ABI/testing/sysfs-bus-rapidio
index f8b6728dac10..9e8fbff99b75 100644
--- a/Documentation/ABI/testing/sysfs-bus-rapidio
+++ b/Documentation/ABI/testing/sysfs-bus-rapidio
@@ -95,7 +95,7 @@ Contact:	Matt Porter <mporter@kernel.crashing.org>,
 		Alexandre Bounine <alexandre.bounine@idt.com>
 Description:
 		(RO) returns name of previous device (switch) on the path to the
-		device that that owns this attribute
+		device that owns this attribute
 
 What:		/sys/bus/rapidio/devices/<nn>:<d>:<iiii>/modalias
 Date:		Jul, 2013
diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
index 3c77677e0ca7..594fda254130 100644
--- a/Documentation/ABI/testing/sysfs-class-cxl
+++ b/Documentation/ABI/testing/sysfs-class-cxl
@@ -103,8 +103,8 @@ What:           /sys/class/cxl/<afu>/api_version_compatible
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
-                Decimal value of the the lowest version of the userspace API
-                this this kernel supports.
+                Decimal value of the lowest version of the userspace API
+                this kernel supports.
 Users:		https://github.com/ibm-capi/libcxl
 
 
diff --git a/Documentation/ABI/testing/sysfs-class-rnbd-client b/Documentation/ABI/testing/sysfs-class-rnbd-client
index 0b5997ab3365..e6cdc851952c 100644
--- a/Documentation/ABI/testing/sysfs-class-rnbd-client
+++ b/Documentation/ABI/testing/sysfs-class-rnbd-client
@@ -128,6 +128,6 @@ Description:	For each device mapped on the client a new symbolic link is created
 		The <device_id> of each device is created as follows:
 
 		- If the 'device_path' provided during mapping contains slashes ("/"),
-		  they are replaced by exclamation mark ("!") and used as as the
+		  they are replaced by exclamation mark ("!") and used as the
 		  <device_id>. Otherwise, the <device_id> will be the same as the
 		  "device_path" provided.
diff --git a/Documentation/ABI/testing/sysfs-class-rtrs-client b/Documentation/ABI/testing/sysfs-class-rtrs-client
index 49a4157c7bf1..fecc59d1b96f 100644
--- a/Documentation/ABI/testing/sysfs-class-rtrs-client
+++ b/Documentation/ABI/testing/sysfs-class-rtrs-client
@@ -78,7 +78,7 @@ What:		/sys/class/rtrs-client/<session-name>/paths/<src@dst>/hca_name
 Date:		Feb 2020
 KernelVersion:	5.7
 Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
-Description:	RO, Contains the the name of HCA the connection established on.
+Description:	RO, Contains the name of HCA the connection established on.
 
 What:		/sys/class/rtrs-client/<session-name>/paths/<src@dst>/hca_port
 Date:		Feb 2020
diff --git a/Documentation/ABI/testing/sysfs-class-rtrs-server b/Documentation/ABI/testing/sysfs-class-rtrs-server
index 3b6d5b067df0..b08601d80409 100644
--- a/Documentation/ABI/testing/sysfs-class-rtrs-server
+++ b/Documentation/ABI/testing/sysfs-class-rtrs-server
@@ -24,7 +24,7 @@ What:		/sys/class/rtrs-server/<session-name>/paths/<src@dst>/hca_name
 Date:		Feb 2020
 KernelVersion:	5.7
 Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
-Description:	RO, Contains the the name of HCA the connection established on.
+Description:	RO, Contains the name of HCA the connection established on.
 
 What:		/sys/class/rtrs-server/<session-name>/paths/<src@dst>/hca_port
 Date:		Feb 2020
diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD b/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
index f7b360a61b21..bc44bc903bc8 100644
--- a/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
+++ b/Documentation/ABI/testing/sysfs-devices-platform-ACPI-TAD
@@ -74,7 +74,7 @@ Description:
 
 		Reads also cause the AC alarm timer status to be reset.
 
-		Another way to reset the the status of the AC alarm timer is to
+		Another way to reset the status of the AC alarm timer is to
 		write (the number) 0 to this file.
 
 		If the status return value indicates that the timer has expired,
diff --git a/Documentation/ABI/testing/sysfs-devices-power b/Documentation/ABI/testing/sysfs-devices-power
index 1b2a2d41ff80..54195530e97a 100644
--- a/Documentation/ABI/testing/sysfs-devices-power
+++ b/Documentation/ABI/testing/sysfs-devices-power
@@ -303,5 +303,5 @@ Date:		Apr 2010
 Contact:	Dominik Brodowski <linux@dominikbrodowski.net>
 Description:
 		Reports the runtime PM children usage count of a device, or
-		0 if the the children will be ignored.
+		0 if the children will be ignored.
 
diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
index 863cc4897277..57aec11a573f 100644
--- a/Documentation/ABI/testing/sysfs-driver-ufs
+++ b/Documentation/ABI/testing/sysfs-driver-ufs
@@ -983,7 +983,7 @@ Description:	This file shows the amount of data that the host plans to
 What:		/sys/class/scsi_device/*/device/dyn_cap_needed
 Date:		February 2018
 Contact:	Stanislav Nijnikov <stanislav.nijnikov@wdc.com>
-Description:	This file shows the The amount of physical memory needed
+Description:	This file shows The amount of physical memory needed
 		to be removed from the physical memory resources pool of
 		the particular logical unit. The full information about
 		the attribute could be found at UFS specifications 2.1.
diff --git a/Documentation/ABI/testing/sysfs-firmware-acpi b/Documentation/ABI/testing/sysfs-firmware-acpi
index 819939d858c9..39173375c53a 100644
--- a/Documentation/ABI/testing/sysfs-firmware-acpi
+++ b/Documentation/ABI/testing/sysfs-firmware-acpi
@@ -112,7 +112,7 @@ Description:
 		OS context.  GPE 0x12, for example, would vector
 		to a level or edge handler called _L12 or _E12.
 		The handler may do its business and return.
-		Or the handler may send send a Notify event
+		Or the handler may send a Notify event
 		to a Linux device driver registered on an ACPI device,
 		such as a battery, or a processor.
 
-- 
2.25.1

