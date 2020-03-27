Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC820195D99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:26:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pqzp4zbZzDrHl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:25:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pqhC4ngMzDrF2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:12:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DMI7XyHRUVD9GYMLW/DPQbUxgUgdFJbJY72UQWXWpIY=; b=ZtC3cNkwieQ5WActJkeCEJ0l0o
 pzpA3jeR00IRwZp9i6ZS0KH/Gh10euVM2mKF+MyeOoXmFp4UwhTbD78qZewizlt5vHm9UEr4PjP2Q
 nSIHd76Z4Zvej+LWASVq4lcUe8F3Iv53EKQWjtjk6DbXH06xSQNU8qkT/X0hvLuovP93cdhiWr2wn
 np5r+i7EcggapPhCmDnyi4VIKfg33/qV3QbsD6iekQLfUnmUHnAS+1+PEYCzlhxa76FsXyX2/UGlm
 wijJPAvOvmYWvUPlszxuPz63UucfzZwFFfGBJq50KvPjoLrzQ0385wMh2YbxYJEoNmIhc2T4HWyWs
 J5L3UsGQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHtSu-0000z4-8W; Fri, 27 Mar 2020 18:12:20 +0000
Message-Id: <f7ad1faea5ad9e777941e30cbf51bc831f4004cc.1585332596.git.geoff@infradead.org>
In-Reply-To: <cover.1585332596.git.geoff@infradead.org>
References: <cover.1585332596.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 09:41:41 -0700
Subject: [PATCH 1/3] powerpc/head_check: Automatic verbosity
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 18:12:20 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To aid debugging build problems turn on shell tracing for the
head_check script when the build is verbose.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/tools/head_check.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_check.sh
index ad9e57209aa4..37061fb9b58e 100644
--- a/arch/powerpc/tools/head_check.sh
+++ b/arch/powerpc/tools/head_check.sh
@@ -31,8 +31,10 @@
 # level entry code (boot, interrupt vectors, etc) until r2 is set up. This
 # could cause the kernel to die in early boot.
 
-# Turn this on if you want more debug output:
-# set -x
+# Allow for verbose output
+if [ "$V" = "1" ]; then
+	set -x
+fi
 
 if [ $# -lt 2 ]; then
 	echo "$0 [path to nm] [path to vmlinux]" 1>&2
-- 
2.20.1


