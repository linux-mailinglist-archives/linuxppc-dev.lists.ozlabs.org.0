Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC1178CE3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 09:55:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XSQ91Hc2zDqNp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 19:55:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bs+piawu; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XSJQ3DBvzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 19:50:30 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id n7so633989pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 00:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TiIql+hW6vhy0nku7tSxH1zd1ke9Ma9eE04Z6saZ0pI=;
 b=Bs+piawutlma6+60B2UgAJv10zwf7Erndy8kh5SNp+Gf7/k9vbgZ/T94ITGhbxCZip
 vytj8bE59j/lzS8CxKPckuGDcJo0VDvDuQrLCkX3IEQclOuPfHByyeqontuS222iowv0
 TK+ewVwE8m1+dn1G+npFk169BQ5+UR2OxvbFVoA4GVUc4kpDeZpCgVRcaP6ISN6BS/5w
 Wty0RppaocpgFv6woqCYIVNo8u0rVVDUm9WkXNWivt/HlLTYq1mGVg3bpJhgTcn69G5C
 Cc8Bd/5vECbIh3vpcRLxttQToYsdKA0q7WxDG3Gz4PI1zwgWdS6gGeJS2DJTX92tPKMN
 OW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TiIql+hW6vhy0nku7tSxH1zd1ke9Ma9eE04Z6saZ0pI=;
 b=SOcaEcz8HKe0y52oYu/bUgo7aTqY6eaMk3xhxQ2nIo3WIWo5Q056NXBaUrj/e+YuKo
 GxTJeGd8Ve78vhF/qJOe/tc8y8QBpxNNoWp8ZUu8RooA5QsegW8AB2f1S+PUoU3b8iUN
 PaD63Sz6yucYQwtc+yNnSRT5d1XViD6F/MYql1ezdC5l2MNFYV9OBxyUMg9htr+o4Kjt
 9Zo3Bkc9UhNLg5NQSLPZnbq4K0ILLRKXw51y4hdVzCInBHJRA0/Ol2XU/RC2XfHHUYh3
 HfEjuVMTMKqFVW8dEVz4xz34BnhS9QVKe8siwZ9Po0JGw06z/84QvZLvlNt7aQ7dw/xp
 NeYw==
X-Gm-Message-State: ANhLgQ0QUs8FtxqLlKWFhrvclEZ1dd8n6oQC4S90tjM8eN5U0PUSBA68
 Lwzs07HIcAomHlEsfsQ8JGRUafM=
X-Google-Smtp-Source: ADFU+vth/c3FMVXP227g9RnMbHBW7Dm4LTTbiytp5WE1VmF47AAiylu4k1WqHrEUK9kBj5dgmHDpWA==
X-Received: by 2002:a62:6807:: with SMTP id d7mr2043056pfc.230.1583311827109; 
 Wed, 04 Mar 2020 00:50:27 -0800 (PST)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v123sm463085pfb.85.2020.03.04.00.50.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Mar 2020 00:50:26 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv3 2/2] pseries/scm: buffer pmem's bound addr in dt for kexec
 kernel
Date: Wed,  4 Mar 2020 16:47:30 +0800
Message-Id: <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
References: <1582882895-3142-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, kexec@lists.infradead.org,
 Pingfan Liu <kernelfans@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
if dumping to fsdax, it will take a very long time.

Take a closer look, during the papr_scm initialization, the only
configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
...), which helps to set up the bound address.

On pseries, for kexec -l/-p kernel, there is no reset of hardware, and this
step can be stepped around to save times.  So the pmem bound address can be
passed to the 2nd kernel through a dynamic added property "bound-addr" in
dt node 'ibm,pmemory'.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: kexec@lists.infradead.org
---
note: This patch has not been tested since I can not get such a pseries with pmem.
      Please kindly to give some suggestion, thanks.
---
 arch/powerpc/platforms/pseries/of_helpers.c |  1 +
 arch/powerpc/platforms/pseries/papr_scm.c   | 33 ++++++++++++++++++++---------
 drivers/of/base.c                           |  1 +
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/of_helpers.c b/arch/powerpc/platforms/pseries/of_helpers.c
index 1022e0f..2c7bab4 100644
--- a/arch/powerpc/platforms/pseries/of_helpers.c
+++ b/arch/powerpc/platforms/pseries/of_helpers.c
@@ -34,6 +34,7 @@ struct property *new_property(const char *name, const int length,
 	kfree(new);
 	return NULL;
 }
+EXPORT_SYMBOL(new_property);
 
 /**
  * pseries_of_derive_parent - basically like dirname(1)
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0b4467e..54ae903 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 
 #include <asm/plpar_wrappers.h>
+#include "of_helpers.h"
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -383,7 +384,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
 	u32 drc_index, metadata_size;
-	u64 blocks, block_size;
+	u64 blocks, block_size, bound_addr = 0;
 	struct papr_scm_priv *p;
 	const char *uuid_str;
 	u64 uuid[2];
@@ -440,17 +441,29 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->metadata_size = metadata_size;
 	p->pdev = pdev;
 
-	/* request the hypervisor to bind this region to somewhere in memory */
-	rc = drc_pmem_bind(p);
+	of_property_read_u64(dn, "bound-addr", &bound_addr);
+	if (bound_addr) {
+		p->bound_addr = bound_addr;
+	} else {
+		struct property *property;
+		u64 big;
 
-	/* If phyp says drc memory still bound then force unbound and retry */
-	if (rc == H_OVERLAP)
-		rc = drc_pmem_query_n_bind(p);
+		/* request the hypervisor to bind this region to somewhere in memory */
+		rc = drc_pmem_bind(p);
 
-	if (rc != H_SUCCESS) {
-		dev_err(&p->pdev->dev, "bind err: %d\n", rc);
-		rc = -ENXIO;
-		goto err;
+		/* If phyp says drc memory still bound then force unbound and retry */
+		if (rc == H_OVERLAP)
+			rc = drc_pmem_query_n_bind(p);
+
+		if (rc != H_SUCCESS) {
+			dev_err(&p->pdev->dev, "bind err: %d\n", rc);
+			rc = -ENXIO;
+			goto err;
+		}
+		big = cpu_to_be64(p->bound_addr);
+		property = new_property("bound-addr", sizeof(u64), (const unsigned char *)&big,
+			NULL);
+		of_add_property(dn, property);
 	}
 
 	/* setup the resource for the newly bound range */
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ae03b12..602d2a9 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1817,6 +1817,7 @@ int of_add_property(struct device_node *np, struct property *prop)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(of_add_property);
 
 int __of_remove_property(struct device_node *np, struct property *prop)
 {
-- 
2.7.5

