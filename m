Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F20161C73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 21:51:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Lx3l71lrzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=jIpukE23; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Lq3Z1s0MzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 03:20:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=qG7uZEs5ZQjxVvahtWw+edjEtqyiOL4CWOMINZp7934=; b=jIpukE231DX1ILjjBvfd6tvqr2
 yXSoHBSg+66L1BXbQwLVh8VK/gkUrNrN35dJWko/hQhq45EOE57xjrRAnYzrULG4oGjyvRkftYwzH
 AVgRRSj2fTJ0xnhIjI8hKnVTWIhp7nNVkl55P5VwNEuulYWeIw/DM/yRV7fW6ZIAQrkYHYNF0Iuke
 mtRctHzbTU3+pjj4oY6JZqgEdgonzrC8ygar/Mu+ua+vBIh9yPxkc6VDeIGjh4LFml3q+a8TR7HNJ
 KdmuObk0U2ZQHAE2frmR8ouoFZXKVapzAWDvJ6mrlLNmPfPDCmEQpOA1JIH4NGjbWVU/3P7XY+Abf
 BoqHDKGQ==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3j8Y-00042K-De; Mon, 17 Feb 2020 16:20:51 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j3j8W-000fqF-Fd; Mon, 17 Feb 2020 17:20:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 21/24] docs: powerpc: convert vcpudispatch_stats.txt to ReST
Date: Mon, 17 Feb 2020 17:20:39 +0100
Message-Id: <73b1f05f20281a423718a4d3996a6f34d66e4622.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:50:00 +1100
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- Add a SPDX header;
- Use standard markup for document title;
- Adjust identation on lists and add blank lines where
  needed;
- Add it to the powerpc index.rst file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/powerpc/index.rst                 |  1 +
 ...ispatch_stats.txt => vcpudispatch_stats.rst} | 17 ++++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename Documentation/powerpc/{vcpudispatch_stats.txt => vcpudispatch_stats.rst} (94%)

diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 0d45f0fc8e57..29b90b1b6f20 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -30,6 +30,7 @@ powerpc
     syscall64-abi
     transactional_memory
     ultravisor
+    vcpudispatch_stats
 
 .. only::  subproject and html
 
diff --git a/Documentation/powerpc/vcpudispatch_stats.txt b/Documentation/powerpc/vcpudispatch_stats.rst
similarity index 94%
rename from Documentation/powerpc/vcpudispatch_stats.txt
rename to Documentation/powerpc/vcpudispatch_stats.rst
index e21476bfd78c..5704657a5987 100644
--- a/Documentation/powerpc/vcpudispatch_stats.txt
+++ b/Documentation/powerpc/vcpudispatch_stats.rst
@@ -1,5 +1,8 @@
-VCPU Dispatch Statistics:
-=========================
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+VCPU Dispatch Statistics
+========================
 
 For Shared Processor LPARs, the POWER Hypervisor maintains a relatively
 static mapping of the LPAR processors (vcpus) to physical processor
@@ -20,25 +23,29 @@ The statistics themselves are available by reading the procfs file
 a vcpu as represented by the first field, followed by 8 numbers.
 
 The first number corresponds to:
+
 1. total vcpu dispatches since the beginning of statistics collection
 
 The next 4 numbers represent vcpu dispatch dispersions:
+
 2. number of times this vcpu was dispatched on the same processor as last
    time
 3. number of times this vcpu was dispatched on a different processor core
    as last time, but within the same chip
 4. number of times this vcpu was dispatched on a different chip
 5. number of times this vcpu was dispatches on a different socket/drawer
-(next numa boundary)
+   (next numa boundary)
 
 The final 3 numbers represent statistics in relation to the home node of
 the vcpu:
+
 6. number of times this vcpu was dispatched in its home node (chip)
 7. number of times this vcpu was dispatched in a different node
 8. number of times this vcpu was dispatched in a node further away (numa
-distance)
+   distance)
+
+An example output::
 
-An example output:
     $ sudo cat /proc/powerpc/vcpudispatch_stats
     cpu0 6839 4126 2683 30 0 6821 18 0
     cpu1 2515 1274 1229 12 0 2509 6 0
-- 
2.24.1

