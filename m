Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC163A05F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:26:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03FP5wtBz3bvP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijHjNt8U;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijHjNt8U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ijHjNt8U; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijHjNt8U; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03CM6Nf3z2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
 b=ijHjNt8UAuMRZ78kobFo60+mtAX6S75sv+M5iH6/rBuKEZAoZTn9nyTffRe/zh+J/WBd8q
 unVeiMhBAIgHCqnRy8oUmoZOCduR3QgVpm0A3+eeag8hEMFCoEdNAC6e8YHzchMVCsCEIP
 nP28KI00Qbs83e7JiDSWoh0TB405y7Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
 b=ijHjNt8UAuMRZ78kobFo60+mtAX6S75sv+M5iH6/rBuKEZAoZTn9nyTffRe/zh+J/WBd8q
 unVeiMhBAIgHCqnRy8oUmoZOCduR3QgVpm0A3+eeag8hEMFCoEdNAC6e8YHzchMVCsCEIP
 nP28KI00Qbs83e7JiDSWoh0TB405y7Y=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-8NpAZ7cxPmi3LsBWnyggCA-1; Tue, 08 Jun 2021 17:24:07 -0400
X-MC-Unique: 8NpAZ7cxPmi3LsBWnyggCA-1
Received: by mail-oo1-f70.google.com with SMTP id
 d12-20020a4aeb8c0000b029023bbaaddcbbso14061240ooj.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
 b=QCbH7nkLdKsXBPhFSjVwruRqXY5bEUiOuKSnP8CgLI9JOG8IoWqCLpdNaOF8Y89egs
 0VQ71u2fbb53MrUM+owPeYVRs4xxH0hECSs67pu1XL6LpXzGFlLlU9zN8U5XYT5kHdtZ
 QtCzLnSh/Q6kpUWed4WYI/Udr2tD0XTnSu3V0z4oidtTcvCg/Ie08AIrZDPPH3o2gOE3
 698dEofHBEMrQn2f2Uocv2bEs5k+TQWZAkSkbkixmeK8HpUc+C6DYz1kiAaZ+A/nV22G
 k4+3iPSLYxJUHRF9ybJZVdks+BVTydFcXk2z1pzZPkd9AqmprX9/wi0InXTY8Op/7815
 0Ecw==
X-Gm-Message-State: AOAM531pqCRYlhm4Rwe/c7ey3ETqrGL2MJWqTxPzBv9oiSGeQ80vJTUw
 mEGsBaDt7v4QLGVNu6SO8R01PW+DEr7npZIhVy0+YkQP6YxYiZLZcSKtOE7elmihuYPzD+uxFU3
 yWvGpNogGc8wLOv9eWqjvZEw/NA==
X-Received: by 2002:a05:6808:14e:: with SMTP id
 h14mr586225oie.151.1623187446580; 
 Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRUvOvqRt0/CJtj2o0VyI4iVXsRLiR3szXaZyy3Js2xLbhN+wrCnNP4FBaFz2E4YlbUaXjZQ==
X-Received: by 2002:a05:6808:14e:: with SMTP id
 h14mr586213oie.151.1623187446440; 
 Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 02/11] Documentation: fpga: dfl: change FPGA indirect article
 to an
Date: Tue,  8 Jun 2021 14:23:41 -0700
Message-Id: <20210608212350.3029742-4-trix@redhat.com>
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
 Documentation/fpga/dfl.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
index ccc33f199df2a..ef9eec71f6f3a 100644
--- a/Documentation/fpga/dfl.rst
+++ b/Documentation/fpga/dfl.rst
@@ -57,7 +57,7 @@ FPGA Interface Unit (FIU) represents a standalone functional unit for the
 interface to FPGA, e.g. the FPGA Management Engine (FME) and Port (more
 descriptions on FME and Port in later sections).
 
-Accelerated Function Unit (AFU) represents a FPGA programmable region and
+Accelerated Function Unit (AFU) represents an FPGA programmable region and
 always connects to a FIU (e.g. a Port) as its child as illustrated above.
 
 Private Features represent sub features of the FIU and AFU. They could be
@@ -311,7 +311,7 @@ The driver organization in virtualization case is illustrated below:
              | PCI PF Device |            |          | PCI VF Device |
              +---------------+            |          +---------------+
 
-FPGA PCIe device driver is always loaded first once a FPGA PCIe PF or VF device
+FPGA PCIe device driver is always loaded first once an FPGA PCIe PF or VF device
 is detected. It:
 
 * Finishes enumeration on both FPGA PCIe PF and VF device using common
-- 
2.26.3

