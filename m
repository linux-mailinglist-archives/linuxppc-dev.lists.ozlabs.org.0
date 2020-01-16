Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24D13E62E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:19:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z9sv1XK5zDqV8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 04:19:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Yo1evpO9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9LT5TsFzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 03:55:45 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1FFF21D56;
 Thu, 16 Jan 2020 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193743;
 bh=DZkziBpfqckwNkeg7jDD1qzOPOfp/MLw+qLK75gTTdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yo1evpO9gbTWjj++VsyQPLPlRzWWUivmxMNKEuV6aOhuvBUnFRY884JYwrgZobw1j
 v7q4QrqWb6yPI8l21zX8OmatSkA/bXEIs34R3uTJhqEBOCboi+4wVg6yn3znciKuZx
 QNzJ7xiLEsfMwY8icM2q4KEq6BF6YsC4b+LSJTD8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 034/671] powerpc/pseries/memory-hotplug: Fix
 return value type of find_aa_index
Date: Thu, 16 Jan 2020 11:44:25 -0500
Message-Id: <20200116165502.8838-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: YueHaibing <yuehaibing@huawei.com>

[ Upstream commit b45e9d761ba2d60044b610297e3ef9f947ac157f ]

The variable 'aa_index' is defined as an unsigned value in
update_lmb_associativity_index(), but find_aa_index() may return -1
when dlpar_clone_property() fails. So change find_aa_index() to return
a bool, which indicates whether 'aa_index' was found or not.

Fixes: c05a5a40969e ("powerpc/pseries: Dynamic add entires to associativity lookup array")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Nathan Fontenot nfont@linux.vnet.ibm.com>
[mpe: Tweak changelog, rename is_found to just found]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../platforms/pseries/hotplug-memory.c        | 61 +++++++++----------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 7f86bc3eaade..62d3c72cd931 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -101,11 +101,12 @@ static struct property *dlpar_clone_property(struct property *prop,
 	return new_prop;
 }
 
-static u32 find_aa_index(struct device_node *dr_node,
-			 struct property *ala_prop, const u32 *lmb_assoc)
+static bool find_aa_index(struct device_node *dr_node,
+			 struct property *ala_prop,
+			 const u32 *lmb_assoc, u32 *aa_index)
 {
-	u32 *assoc_arrays;
-	u32 aa_index;
+	u32 *assoc_arrays, new_prop_size;
+	struct property *new_prop;
 	int aa_arrays, aa_array_entries, aa_array_sz;
 	int i, index;
 
@@ -121,46 +122,39 @@ static u32 find_aa_index(struct device_node *dr_node,
 	aa_array_entries = be32_to_cpu(assoc_arrays[1]);
 	aa_array_sz = aa_array_entries * sizeof(u32);
 
-	aa_index = -1;
 	for (i = 0; i < aa_arrays; i++) {
 		index = (i * aa_array_entries) + 2;
 
 		if (memcmp(&assoc_arrays[index], &lmb_assoc[1], aa_array_sz))
 			continue;
 
-		aa_index = i;
-		break;
+		*aa_index = i;
+		return true;
 	}
 
-	if (aa_index == -1) {
-		struct property *new_prop;
-		u32 new_prop_size;
-
-		new_prop_size = ala_prop->length + aa_array_sz;
-		new_prop = dlpar_clone_property(ala_prop, new_prop_size);
-		if (!new_prop)
-			return -1;
-
-		assoc_arrays = new_prop->value;
+	new_prop_size = ala_prop->length + aa_array_sz;
+	new_prop = dlpar_clone_property(ala_prop, new_prop_size);
+	if (!new_prop)
+		return false;
 
-		/* increment the number of entries in the lookup array */
-		assoc_arrays[0] = cpu_to_be32(aa_arrays + 1);
+	assoc_arrays = new_prop->value;
 
-		/* copy the new associativity into the lookup array */
-		index = aa_arrays * aa_array_entries + 2;
-		memcpy(&assoc_arrays[index], &lmb_assoc[1], aa_array_sz);
+	/* increment the number of entries in the lookup array */
+	assoc_arrays[0] = cpu_to_be32(aa_arrays + 1);
 
-		of_update_property(dr_node, new_prop);
+	/* copy the new associativity into the lookup array */
+	index = aa_arrays * aa_array_entries + 2;
+	memcpy(&assoc_arrays[index], &lmb_assoc[1], aa_array_sz);
 
-		/*
-		 * The associativity lookup array index for this lmb is
-		 * number of entries - 1 since we added its associativity
-		 * to the end of the lookup array.
-		 */
-		aa_index = be32_to_cpu(assoc_arrays[0]) - 1;
-	}
+	of_update_property(dr_node, new_prop);
 
-	return aa_index;
+	/*
+	 * The associativity lookup array index for this lmb is
+	 * number of entries - 1 since we added its associativity
+	 * to the end of the lookup array.
+	 */
+	*aa_index = be32_to_cpu(assoc_arrays[0]) - 1;
+	return true;
 }
 
 static int update_lmb_associativity_index(struct drmem_lmb *lmb)
@@ -169,6 +163,7 @@ static int update_lmb_associativity_index(struct drmem_lmb *lmb)
 	struct property *ala_prop;
 	const u32 *lmb_assoc;
 	u32 aa_index;
+	bool found;
 
 	parent = of_find_node_by_path("/");
 	if (!parent)
@@ -200,12 +195,12 @@ static int update_lmb_associativity_index(struct drmem_lmb *lmb)
 		return -ENODEV;
 	}
 
-	aa_index = find_aa_index(dr_node, ala_prop, lmb_assoc);
+	found = find_aa_index(dr_node, ala_prop, lmb_assoc, &aa_index);
 
 	of_node_put(dr_node);
 	dlpar_free_cc_nodes(lmb_node);
 
-	if (aa_index < 0) {
+	if (!found) {
 		pr_err("Could not find LMB associativity\n");
 		return -1;
 	}
-- 
2.20.1

