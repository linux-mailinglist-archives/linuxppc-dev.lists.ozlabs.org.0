Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1284A52B6A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:11:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L380j6Hcgz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:11:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=E29m3+0M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37wv0fGBz3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:08:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=E29m3+0M; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L37ws3g6Hz4xbr; Wed, 18 May 2022 20:08:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L37ws3b5zz4xbt; Wed, 18 May 2022 20:08:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652868509;
 bh=BEpcwMm4tEDwvsUVe5PO9Ws/NyOuN64AEiZjiUI8eEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E29m3+0Mga/MWUgJUQWMvNuQax4VqVnO8Qq7UsizPUSs1NBtIuxEMgIREDWxb371E
 tKMriNcF/Idyt7GfPjtZmey1l2zn9cdUHfJvzhLdxxGx/aRAYy6u0XAi6d0RR4z3hF
 6K7NVJCEv+Pw3PowpGR5oHB679xlk/r3VheM1UMi57FOcWffeVygAwAjRW8KIKs0v8
 T1CS1C0LwdSOXgGOOyPrTinYj8G3bXZiv8AkNwcNO7BSDMfHtJziFPtQv5yuo+yZto
 mhfb5VbeaRU583/KwPvmg2t1ux8rpvz7+eG/AM+VM6iGTt2hcsNNc4hje18C9Npu5j
 +3Et3CqEI/0GA==
Date: Wed, 18 May 2022 20:04:12 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 1/6] kasan: Document support on 32-bit powerpc
Message-ID: <YoTEnMLrnd64j0w5@cleo>
References: <YoTEb2BaH3MDkH+2@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoTEb2BaH3MDkH+2@cleo>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

KASAN is supported on 32-bit powerpc and the docs should reflect this.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 Documentation/powerpc/kasan.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..26bb0e8bb18c
--- /dev/null
+++ b/Documentation/powerpc/kasan.txt
@@ -0,0 +1,12 @@
+KASAN is supported on powerpc on 32-bit only.
+
+32 bit support
+==============
+
+KASAN is supported on both hash and nohash MMUs on 32-bit.
+
+The shadow area sits at the top of the kernel virtual memory space above the
+fixmap area and occupies one eighth of the total kernel virtual memory space.
+
+Instrumentation of the vmalloc area is optional, unless built with modules,
+in which case it is required.
-- 
2.35.3

