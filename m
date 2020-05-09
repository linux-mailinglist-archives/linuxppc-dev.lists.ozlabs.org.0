Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D51CC418
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 21:22:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KHC43j5vzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 05:22:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KGh35MmXzDr5g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 04:58:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DMI7XyHRUVD9GYMLW/DPQbUxgUgdFJbJY72UQWXWpIY=; b=z1x0RfFmjfyBoZL1SjL5Meh98I
 YcxtZPiP9vOP+xb9/UVptvGvV2AhR4/6onuMtmST+gnTu1ofKnHXMu+Fr8f1ywJfWh6kmZFJs29Dw
 9+U/UkN5kVPB8AD6LEJ7sTMgqqBu59u5p8Xr+QgNdRL0oRr1uClrH5jw3yl2oNu72SKT6s+FclnwL
 FRVGuzmJuQE9E8Shh6uo6AOwV7Sn/HWVfb0ZWoh+9O7ozp096Dvc4c4AeBEGrpUeWCC2IQhP9Bip1
 sIg+DOzBtW5ooaDUSZOZ9Llb7zc0JD9N1sQxbPU7qaj8b0GplbvDqQNZcLHcZU4dlke/11ULO+vkb
 ycpfhexA==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jXUgB-0003De-Ls; Sat, 09 May 2020 18:58:31 +0000
Message-Id: <1ae1aed811ba6760af2e46d331285dd6a4de5b80.1589049250.git.geoff@infradead.org>
In-Reply-To: <cover.1589049250.git.geoff@infradead.org>
References: <cover.1589049250.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 09:41:41 -0700
Subject: [PATCH v2 1/9] powerpc/head_check: Automatic verbosity
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 09 May 2020 18:58:31 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
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


