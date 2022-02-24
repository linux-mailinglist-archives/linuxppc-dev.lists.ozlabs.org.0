Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE64C34AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Lsd0hzrz3bV6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 05:24:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lo2RALd2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lo2RALd2; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Lrd3GNDz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 05:23:43 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id s5so4001156oic.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8chPCpGql9rm1M/MaO99/TV9ACMf+xBUOWP1T3JeCA=;
 b=lo2RALd2vdMgjkacsa6casAqaXuGH91D3GUcNS/55ISrW4GdRvui1jxcLQrHyetneb
 fvpAOPfyZLAiyiGQt4/QGmIqA1OSt94fVOe2ezi/nfAzjLgtoFZvtyNWLVEcoh6jQTrS
 I+EJq9Q5Xsv+9kZWiSgdEq6x22GCF6gjbQq5g2TCQltWrytKLgL119AreBmpa7zrscQ3
 3UclkHoyl2opIXSsxJXPgtfdtTdnWluCJtpyx0uqqzW2a0cLb98A5jLMcE1q5vK2SaHI
 tBTVU5HheRkf40P9xnYD5NPXfNx4tgs0kFcZkjj1NBwO36i31ZV+2Z2SqfA+I/O/LGLg
 go1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8chPCpGql9rm1M/MaO99/TV9ACMf+xBUOWP1T3JeCA=;
 b=dMfr5uxVr2LX89lRE70rI/bkFzkxp5xX6CB8LuOaNwmpgCvZrj93PQx7LrIbhtifNI
 48He89Q1Bf6/QJK5d+O6RVmtC42Pn+g76AzmaW2UwnUmoL3/WRLmFJ2a7S4kG15i6IIO
 mIVQRFgCRFEVLVtKs+JxL1L6ZEcjLFpZELKVlDRuyb8OF9ALDHm7rtlA2Hr1I+hMlOfg
 r0gYkg9ZR7tCIxNoa70y8A5Sv9uKWVHpAm1biClsSoJxgEmPLgQzJP7H7SIqr2k6McZ0
 OFkk8kjk6m5cojZTEd1RqMlEwYiW1qpo6jO55+ZVTCiNF26AkarCuV3JcoJvXliMm+Ty
 hXsQ==
X-Gm-Message-State: AOAM53015TTNLX3X8WjoMckdQVRMa2Vr2z3rKlsyGxBx2z1qR9ARB4Tz
 51znJ2omsvMSRAESEO7Y8G7M6JMZnnA=
X-Google-Smtp-Source: ABdhPJyLSvxzuFlhJqkp2qN11u8FSvYdy7Wh9C0Qx0/n1QE6KdSHvnYKjmBzbxio5nCp7dHVSVBTzA==
X-Received: by 2002:a05:6808:1149:b0:2d5:f225:64c5 with SMTP id
 u9-20020a056808114900b002d5f22564c5mr2129157oiu.72.1645727021136; 
 Thu, 24 Feb 2022 10:23:41 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056808056900b002d3ebd30b3esm50918oig.41.2022.02.24.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:23:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm/numa: skip NUMA_NO_NODE onlining in
 parse_numa_properties()
Date: Thu, 24 Feb 2022 15:23:12 -0300
Message-Id: <20220224182312.1012527-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Ping Fang <pifang@redhat.com>,
 Diego Domingos <diegodo@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Executing node_set_online() when nid = NUMA_NO_NODE results in an
undefined behavior. node_set_online() will call node_set_state(), into
__node_set(), into set_bit(), and since NUMA_NO_NODE is -1 we'll end up
doing a negative shift operation inside
arch/powerpc/include/asm/bitops.h. This potential UB was detected
running a kernel with CONFIG_UBSAN.

The behavior was introduced by commit 10f78fd0dabb ("powerpc/numa: Fix a
regression on memoryless node 0"), where the check for nid > 0 was
removed to fix a problem that was happening with nid = 0, but the result
is that now we're trying to online NUMA_NO_NODE nids as well.

Checking for nid >= 0 will allow node 0 to be onlined while avoiding
this UB with NUMA_NO_NODE.

Reported-by: Ping Fang <pifang@redhat.com>
Cc: Diego Domingos <diegodo@linux.vnet.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Fixes: 10f78fd0dabb ("powerpc/numa: Fix a regression on memoryless node 0")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/mm/numa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9d5f710d2c20..b9b7fefbb64b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -956,7 +956,9 @@ static int __init parse_numa_properties(void)
 			of_node_put(cpu);
 		}
 
-		node_set_online(nid);
+		/* node_set_online() is an UB if 'nid' is negative */
+		if (likely(nid >= 0))
+			node_set_online(nid);
 	}
 
 	get_n_mem_cells(&n_mem_addr_cells, &n_mem_size_cells);
-- 
2.35.1

