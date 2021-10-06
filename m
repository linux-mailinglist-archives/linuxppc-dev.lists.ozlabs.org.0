Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4054248E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnYS3Dj8z2yNC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ooQmfINl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f;
 helo=mail-wr1-x42f.google.com; envelope-from=sohaib.amhmd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ooQmfINl; dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPZpj56TQz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 00:21:16 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id s15so8784230wrv.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0GVxKKDaAwLgKY5s+A/pUoCd/nugZfzI2EHKjl1wVo=;
 b=ooQmfINl1i9PS00o+DMf5SMHvZvnme4PETOUREHu5DlcHrCFjtbtVzFP9cl56qqhXE
 d4DE1YindQWJ+pQ9r5Ns7k5VNXG1BMZnY3gtYOv9BipYDO+rov/izwviucmwEWA/9yiC
 XkG5HgKybK5IqEN2+IN+2/UPs6MfgqgfNrMpTuaY2bS1OC0q7VyoEOufZhmJF1HpM0Yf
 4An7MOACINsqNEsKX5EZHLQcZuRc0tAa5FzjkZ18V0R3HCr2aKzKJyHCbAjUeenuM4DJ
 pPeFX1wReLhmPD485W689qK2XgkmcQQhGoUAVMCub5Gn300LnFEJzh0+N1aS7GYIKEZO
 j8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0GVxKKDaAwLgKY5s+A/pUoCd/nugZfzI2EHKjl1wVo=;
 b=q3fn6CFw2ro+KvIymrs02cgMp1mZPj1ORjegkm3ZuAU7sFXh/qGhnt2HpQXRfA40of
 bI5UVbV3X+gPnKXaR+l9WKSyfhkdys6bQ+VsG/feO+0HsABGfXid9AHz8rGmVlTDlcAd
 i2fZJDRnQy9Fn3IzPnN7TqCBiTOPX9eK/x0c9NpVfTmQId8MMRMarkF4XCgdqOEcSt02
 AuamEFdDTBrep0jbq3r7hC3eYwccacz9aCwmQroX60xqW7P+PFES1b0GJUFbu4LABn5B
 62uMthjBqAMYRpr8x75nGrnlZ5E99JtDh4JjG7w6Y5R9RjFGRTKGmkJVsWSs65OvTK2T
 eAug==
X-Gm-Message-State: AOAM531dkkGJO6Tfe4i56ilRZ3wW0w4nOJRWsJcJAGA2yAvpzO5vpgYM
 29TS9WkZfMk5jQMxAjD55+s=
X-Google-Smtp-Source: ABdhPJyOi0/FWXiz+dwYsjrDksb+UU7DZgNZujUhjbKd9KFD/17C/vwR3923FlrTw8NF5vlTXQ5iJA==
X-Received: by 2002:adf:ba03:: with SMTP id o3mr8271934wrg.242.1633526468366; 
 Wed, 06 Oct 2021 06:21:08 -0700 (PDT)
Received: from localhost.localdomain ([197.49.35.129])
 by smtp.gmail.com with ESMTPSA id k23sm2027066wrh.93.2021.10.06.06.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 06:21:07 -0700 (PDT)
From: Sohaib Mohamed <sohaib.amhmd@gmail.com>
To: sohaib.amhmd@gmail.com
Subject: [PATCH] docs: typo fixes in Documentation/ABI/
Date: Wed,  6 Oct 2021 15:20:56 +0200
Message-Id: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
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
Cc: Daejun Park <daejun7.park@samsung.com>, Gioh Kim <gi-oh.kim@ionos.com>,
 Can Guo <cang@codeaurora.org>, Bean Huo <beanhuo@micron.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Carlos Bilbao <bilbao@vt.edu>,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All these changes are about to remove repeated words from severals place in the Documentation/ABI/ directory:

- In file stable/sysfs-module:41: "the the source"

- In file testing/sysfs-bus-rapidio:98: "that that owns"

- In file testing/sysfs-class-cxl:106: "the the lowest"

- In file testing/sysfs-class-cxl:107: "this this kernel"

- In file testing/sysfs-class-rnbd-client:131: "as as the"

- In file testing/sysfs-class-rtrs-client:81: "the the name"

- In file testing/sysfs-class-rtrs-server:27: "the the name"

- In file testing/sysfs-devices-platform-ACPI-TAD:77: "the the status"

- In file testing/sysfs-devices-power:306: "the the children"

- In file testing/sysfs-driver-ufs:986: "the The amount"

- In file testing/sysfs-firmware-acpi:115: "send send a Notify"

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

