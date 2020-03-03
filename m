Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC31917781A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 15:02:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WzGl5L9DzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 01:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yPujjbEv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WzCf17QzzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 00:59:41 +1100 (AEDT)
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com
 [80.187.101.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8E0920863;
 Tue,  3 Mar 2020 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583243978;
 bh=ZxaefBKyKeSkKD4GBmwPevYPRyvImqVY0fhEFDK7rp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yPujjbEv/gbBCwML2PhX9hEm+KvD2fbRz/tFylkWH5w1UQvfePR+QXMCmZa/dBfh+
 OHQkSXwXXh4ICfOIAlRlUu4AqKGx6jHG6KEx32NaRdq9Bl09UuEglbx7YiozQqqr9K
 S/JeEg6dNnY8z79tz1TgaG6x4raEtVRwO7zui7OE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1j9850-001Ydp-Hs; Tue, 03 Mar 2020 14:59:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Subject: [PATCH v3 14/18] docs: powerpc: convert vcpudispatch_stats.txt to ReST
Date: Tue,  3 Mar 2020 14:59:21 +0100
Message-Id: <b85d594912818721b84b3c9a0aafa472d6d4af44.1583243826.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org,
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

