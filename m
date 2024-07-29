Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3794012E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:37:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nnbAnMun;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXtXp5kj8z3cfm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 08:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nnbAnMun;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXtX75ClPz3c03
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 08:37:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2F5FCE0E74;
	Mon, 29 Jul 2024 22:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C9EC32786;
	Mon, 29 Jul 2024 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722292629;
	bh=kYEpslrw3qv91f7QU65Rqm8td8PbyA3ZDp2nZ1DY0Es=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nnbAnMunqog+UAW2lrJNZaTfBP1tOWpXRfTIgWEstN8hJzVXU/2Sa/tHy9RpKMnK6
	 GA+VRXR/rQeEzdn7cnGg04nEec6+VLH5DJ5mRC3NGrpcgMFOlGxgi5/eDQlOvQSZYy
	 s2Tfqtdy7+RpGPsSgIxx5NLZzaSndiIMgg4SHBEwUg1C/++hqunxnbKlufew8Z7jij
	 K1BK6ZO5o546qcKA58lPb9IPVyXpI1M3JniWe7P3epxKghPYGQUbh+04s9aUVvh4zI
	 xUsLZkloLwz4CVlUgkJH2UoplRY9ZlIniQFc4aI829zddsfoWe2Uv2LKxsZ5AvO6ek
	 ZKQa2u6x1boKg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 29 Jul 2024 16:36:43 -0600
Subject: [PATCH 1/2] cxl: Drop printing of DT properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-dt-cxl-cleanup-v1-1-a75eea80d231@kernel.org>
References: <20240729-dt-cxl-cleanup-v1-0-a75eea80d231@kernel.org>
In-Reply-To: <20240729-dt-cxl-cleanup-v1-0-a75eea80d231@kernel.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.15-dev
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's little reason to dump DT property values when they can be read
at any time from the DT in /proc/device-tree. If such a feature is
needed, then it really should be implemented in the DT core such that
any module/driver can use it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/misc/cxl/of.c | 101 ++------------------------------------------------
 1 file changed, 3 insertions(+), 98 deletions(-)

diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index bcc005dff1c0..21ecce0f9403 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -19,8 +19,6 @@ static const __be32 *read_prop_string(const struct device_node *np,
 	const __be32 *prop;
 
 	prop = of_get_property(np, prop_name, NULL);
-	if (cxl_verbose && prop)
-		pr_info("%s: %s\n", prop_name, (char *) prop);
 	return prop;
 }
 
@@ -32,8 +30,6 @@ static const __be32 *read_prop_dword(const struct device_node *np,
 	prop = of_get_property(np, prop_name, NULL);
 	if (prop)
 		*val = be32_to_cpu(prop[0]);
-	if (cxl_verbose && prop)
-		pr_info("%s: %#x (%u)\n", prop_name, *val, *val);
 	return prop;
 }
 
@@ -45,8 +41,6 @@ static const __be64 *read_prop64_dword(const struct device_node *np,
 	prop = of_get_property(np, prop_name, NULL);
 	if (prop)
 		*val = be64_to_cpu(prop[0]);
-	if (cxl_verbose && prop)
-		pr_info("%s: %#llx (%llu)\n", prop_name, *val, *val);
 	return prop;
 }
 
@@ -100,9 +94,6 @@ static int read_phys_addr(struct device_node *np, char *prop_name,
 					type, prop_name);
 				return -EINVAL;
 			}
-			if (cxl_verbose)
-				pr_info("%s: %#x %#llx (size %#llx)\n",
-					prop_name, type, addr, size);
 		}
 	}
 	return 0;
@@ -139,27 +130,13 @@ int cxl_of_read_afu_handle(struct cxl_afu *afu, struct device_node *afu_np)
 
 int cxl_of_read_afu_properties(struct cxl_afu *afu, struct device_node *np)
 {
-	int i, len, rc;
-	char *p;
+	int i, rc;
 	const __be32 *prop;
 	u16 device_id, vendor_id;
 	u32 val = 0, class_code;
 
 	/* Properties are read in the same order as listed in PAPR */
 
-	if (cxl_verbose) {
-		pr_info("Dump of the 'ibm,coherent-platform-function' node properties:\n");
-
-		prop = of_get_property(np, "compatible", &len);
-		i = 0;
-		while (i < len) {
-			p = (char *) prop + i;
-			pr_info("compatible: %s\n", p);
-			i += strlen(p) + 1;
-		}
-		read_prop_string(np, "name");
-	}
-
 	rc = read_phys_addr(np, "reg", afu);
 	if (rc)
 		return rc;
@@ -173,19 +150,10 @@ int cxl_of_read_afu_properties(struct cxl_afu *afu, struct device_node *np)
 	else
 		afu->psa = true;
 
-	if (cxl_verbose) {
-		read_prop_string(np, "ibm,loc-code");
-		read_prop_string(np, "device_type");
-	}
-
 	read_prop_dword(np, "ibm,#processes", &afu->max_procs_virtualised);
 
-	if (cxl_verbose) {
-		read_prop_dword(np, "ibm,scratchpad-size", &val);
-		read_prop_dword(np, "ibm,programmable", &val);
-		read_prop_string(np, "ibm,phandle");
+	if (cxl_verbose)
 		read_vpd(NULL, afu);
-	}
 
 	read_prop_dword(np, "ibm,max-ints-per-process", &afu->guest->max_ints);
 	afu->irqs_max = afu->guest->max_ints;
@@ -199,17 +167,9 @@ int cxl_of_read_afu_properties(struct cxl_afu *afu, struct device_node *np)
 		afu->pp_irqs--;
 	}
 
-	if (cxl_verbose) {
-		read_prop_dword(np, "ibm,max-ints", &val);
-		read_prop_dword(np, "ibm,vpd-size", &val);
-	}
-
 	read_prop64_dword(np, "ibm,error-buffer-size", &afu->eb_len);
 	afu->eb_offset = 0;
 
-	if (cxl_verbose)
-		read_prop_dword(np, "ibm,config-record-type", &val);
-
 	read_prop64_dword(np, "ibm,config-record-size", &afu->crs_len);
 	afu->crs_offset = 0;
 
@@ -235,15 +195,6 @@ int cxl_of_read_afu_properties(struct cxl_afu *afu, struct device_node *np)
 					i, class_code);
 			}
 		}
-
-		read_prop_dword(np, "ibm,function-number", &val);
-		read_prop_dword(np, "ibm,privileged-function", &val);
-		read_prop_dword(np, "vendor-id", &val);
-		read_prop_dword(np, "device-id", &val);
-		read_prop_dword(np, "revision-id", &val);
-		read_prop_dword(np, "class-code", &val);
-		read_prop_dword(np, "subsystem-vendor-id", &val);
-		read_prop_dword(np, "subsystem-id", &val);
 	}
 	/*
 	 * if "ibm,process-mmio" doesn't exist then per-process mmio is
@@ -256,12 +207,6 @@ int cxl_of_read_afu_properties(struct cxl_afu *afu, struct device_node *np)
 	else
 		afu->pp_psa = false;
 
-	if (cxl_verbose) {
-		read_prop_dword(np, "ibm,supports-aur", &val);
-		read_prop_dword(np, "ibm,supports-csrp", &val);
-		read_prop_dword(np, "ibm,supports-prr", &val);
-	}
-
 	prop = read_prop_dword(np, "ibm,function-error-interrupt", &val);
 	if (prop)
 		afu->serr_hwirq = val;
@@ -343,49 +288,15 @@ int cxl_of_read_adapter_handle(struct cxl *adapter, struct device_node *np)
 
 int cxl_of_read_adapter_properties(struct cxl *adapter, struct device_node *np)
 {
-	int rc, len, naddr, i;
-	char *p;
+	int rc;
 	const __be32 *prop;
 	u32 val = 0;
 
 	/* Properties are read in the same order as listed in PAPR */
 
-	naddr = of_n_addr_cells(np);
-
-	if (cxl_verbose) {
-		pr_info("Dump of the 'ibm,coherent-platform-facility' node properties:\n");
-
-		read_prop_dword(np, "#address-cells", &val);
-		read_prop_dword(np, "#size-cells", &val);
-
-		prop = of_get_property(np, "compatible", &len);
-		i = 0;
-		while (i < len) {
-			p = (char *) prop + i;
-			pr_info("compatible: %s\n", p);
-			i += strlen(p) + 1;
-		}
-		read_prop_string(np, "name");
-		read_prop_string(np, "model");
-
-		prop = of_get_property(np, "reg", NULL);
-		if (prop) {
-			pr_info("reg: addr:%#llx size:%#x\n",
-				of_read_number(prop, naddr),
-				be32_to_cpu(prop[naddr]));
-		}
-
-		read_prop_string(np, "ibm,loc-code");
-	}
-
 	if ((rc = read_adapter_irq_config(adapter, np)))
 		return rc;
 
-	if (cxl_verbose) {
-		read_prop_string(np, "device_type");
-		read_prop_string(np, "ibm,phandle");
-	}
-
 	prop = read_prop_dword(np, "ibm,caia-version", &val);
 	if (prop) {
 		adapter->caia_major = (val & 0xFF00) >> 8;
@@ -411,12 +322,6 @@ int cxl_of_read_adapter_properties(struct cxl *adapter, struct device_node *np)
 	if (prop)
 		adapter->guest->device = val;
 
-	if (cxl_verbose) {
-		read_prop_dword(np, "ibm,privileged-facility", &val);
-		read_prop_dword(np, "revision-id", &val);
-		read_prop_dword(np, "class-code", &val);
-	}
-
 	prop = read_prop_dword(np, "subsystem-vendor-id", &val);
 	if (prop)
 		adapter->guest->subsystem_vendor = val;

-- 
2.43.0

