Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B6C1730B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:00:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TJmb1wC1zDrLv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 17:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CoxK1KT9; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TJgD4vRzzDrFp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 16:55:52 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id q4so813631pls.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L8rGUYxhbypjgSuuIwwUeSExzDpL04oqm+fwGUs0R9U=;
 b=CoxK1KT9bOnSWt7BQrt75JH8qlI42ZG3ynJfTwsJ8hCmNHdFuFQZSSo9Zsoj1Yf9pP
 rS4lxpNkwnLyaUT7XALzYuoo3qYeCbNy+1EfFBEYOmOx30d95+TfRP3A0Y/EJ2tdKjgD
 5iVxXAK6MSTXT2oZg9jKz7imssMhL174KPDECBPlo8payhOpWvudvGvh6MMtwV3L7CiH
 fOpNQVjfakykF/Mr1dexK0M3nMj7kiW031L9GGCvJrR+STvt1ldyXrB5sJHw1kowGxr7
 omNTsNZY1IxdK1uI0oj7al70eoMYdalx6h67jcloiv89j9+cn/d/H0s8+lioW5JThhbL
 9hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L8rGUYxhbypjgSuuIwwUeSExzDpL04oqm+fwGUs0R9U=;
 b=HllwUZkf6Fy9tFS9B6t5alGRU4n2r66wzg4Q4xm5THfBHYB410LDsJj4wJ6dv7tJEZ
 c3W3cxdrHG/ZIKSdiB6hu3DU9/idUpOhKWhjHM3EWt/RzWS4id4vCg9Dkk72japjtFqD
 3KMszcZPIZpYWcJQhpCkC+e2staLIbvAZf185ycyvKFhfGk7QTGIgWcg+HF34AoNDRt+
 e5AZS3o8Gij07JgI/bhslkziG4zFYkxMjxV4gfx00HRqGwrevsC/XsFc9FaXgjFKpuBf
 iQml04q7Bnek6VN9iNHDvuD1bYYt4WugZ88ijVpcU2Vd90WeHcd9+ulSVr6ytNQy6nsu
 LvQw==
X-Gm-Message-State: APjAAAVKcrmtESM38pZzPTfxylVmoBFf6+Nniv8h5mhJGTOScfmchvSf
 a/Oz5OowGb+r+NCrl/XRuv9Ujqc=
X-Google-Smtp-Source: APXvYqzwcXYAp67+/xKPPogA1TY3PSVtYXrYxv0yFYHgKcieO9TGH6hdxAOH4xIdhwPLO43S1+o6ow==
X-Received: by 2002:a17:902:db83:: with SMTP id
 m3mr2633318pld.166.1582869350518; 
 Thu, 27 Feb 2020 21:55:50 -0800 (PST)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h4sm4350370pgq.20.2020.02.27.21.55.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Feb 2020 21:55:50 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] pseries/scm: buffer pmem's bound addr in dt for kexec
 kernel
Date: Fri, 28 Feb 2020 13:53:12 +0800
Message-Id: <1582869192-9284-3-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
References: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
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
Cc: kexec@lists.infradead.org, Pingfan Liu <kernelfans@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>
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
Cc: kexec@lists.infradead.org
---
note: I can not find such a pseries machine, and not finish it yet.
---
 arch/powerpc/platforms/pseries/papr_scm.c | 32 +++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index c2ef320..555e746 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -382,7 +382,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
 	u32 drc_index, metadata_size;
-	u64 blocks, block_size;
+	u64 blocks, block_size, bound_addr = 0;
 	struct papr_scm_priv *p;
 	const char *uuid_str;
 	u64 uuid[2];
@@ -439,17 +439,29 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->metadata_size = metadata_size;
 	p->pdev = pdev;
 
-	/* request the hypervisor to bind this region to somewhere in memory */
-	rc = drc_pmem_bind(p);
+	of_property_read_u64(dn, "bound-addr", &bound_addr);
+	if (bound_addr)
+		p->bound_addr = bound_addr;
+	else {
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
+		property = new_property("bound-addr", sizeof(u64), &big,
+			NULL);
+		of_add_property(dn, property);
 	}
 
 	/* setup the resource for the newly bound range */
-- 
2.7.5

