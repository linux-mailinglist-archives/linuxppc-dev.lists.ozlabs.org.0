Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82B7E76BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:41:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=mqE7+9FF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRM4g3Q0Rz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=mqE7+9FF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRM1t5FGHz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:39:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1933; q=dns/txt; s=iport;
  t=1699580371; x=1700789971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c/Q35i8hpBkyhFgxIzufstblbWRm7GVHZuKP0zbOYiw=;
  b=mqE7+9FFx4Kw+7kPEVtS4NafQP8+fhoCwF8rIEbgthyCL9VtOvBMsugL
   aWiATMVU06I89bvgFMhFh2Z4bh3gYWphRyKrP4xtTSi9C+Ma0sYGocwR4
   xG4e7YWqC/V6nOnVeVNRt9hfAgDHiC+a1lavdbg7GCSrds7koar1i2nZ5
   M=;
X-CSE-ConnectionGUID: AFTc024tQGuMjV+1t9ZQ5w==
X-CSE-MsgGUID: eo+cn697Sr+idbU1lrqE9A==
X-IPAS-Result: =?us-ascii?q?A0APAABsiE1lmJtdJa1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBhAdASIxvp0OBJQNWDwEBAQ9EBAEBghKCdAKHJgImNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQECAQEFAQEBAgEHBBQBAQEBAQEBAR4ZBRAOJ4V1hk0DAzIBR?=
 =?us-ascii?q?hBRVwYBEoJ+gl8DrViCLIEBsyiBaBiBMAGMQ4EehDUnG4FJRIQHdosGBIklB?=
 =?us-ascii?q?zIJghmDUoI5A4sPf0daFh0DBwNWKRArBwQtIgYJFC0jBlEEFxEkCRMSPgSBY?=
 =?us-ascii?q?4FRCn8/Dw4Rgj8iAj02GUiCWxVABEZ2ECoEFBeBEm4bFR43ERIXDQMIdB0CE?=
 =?us-ascii?q?SM8AwUDBDMKEg0LIQUUQgNCBkkLAwIaBQMDBIE2BQ0eAhAtJwMDE00CEBQDO?=
 =?us-ascii?q?wMDBgMLMQMwVUQMUQNvHxocCTwPDB8CGx4NJygCNUMDEQUSAhYDJBkERQMJA?=
 =?us-ascii?q?wcFSUADCxgNSBEsNQYOGwY/cwehVAGBDgGlHoIdoEeEF4FfnyoaM4QBpgKYP?=
 =?us-ascii?q?yCCL6YCgWM6gVszGggbFYMiUhkPjjmTGwFdIzI7AgcLAQEDCYtKAQE?=
IronPort-Data: A9a23:YhR/LK6v4m6WYqedano87wxRtKPAchMFZxGqfqrLsTDasY5as4F+v
 mUWCmDQafaMamP3ed8iYNjlp0hTu8TQztBjHVdtrXszZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa/lH1dOG58RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq+KUzBHf/g2QvaztNs/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fuD0S06ZbP03Tpbl7u/bY3EBAEBNAHr7Mf7WFmr
 ZT0KRgXZRyFwumx2r/+Fq9nh98oK4/gO4Z3VnNIlG6CS615B8GYBfyXuLe03x9o7ixKNfrXY
 csUbSVmRB/BeBZIfFwQDfrSmc/x3SSnKmMD9wz9Sawf7m+QxwovgefWKpnUdta3HMFPh2vJj
 zeTl4j+KkhKaIPAodafyVqoh+nSjWb4VZgUGbmQ6PFnmhuQy3YVBRlQUkG0ydG9i0ijS5dcI
 VEV/iYGs6c/7gqoQ8P7Uhn+p2SL1jYaWtFXF+QhwA+Pw7HQ7kCUGwAsSDJMc9U7sMk3SCYx/
 lCOmNztCHpkt7j9YXSU6redqxuxNDITIGtEYjULJSMA6sLqoIApiQPnTdt5FqOxyNrvFlnYx
 zGMsTgmn75WgcMV/6G65kzcxTW+opHDVUgy/Aq/dmak6B5pIYukf5eA91fW97BDIZyfQ13Hu
 2IL8+COvL4mDpyXkiGJBuIXE9mB/PuMNnvVh1JiBYIm8Ry29nWkO4tX5VlWOEBsO91CfCLle
 lLVugp565paPX/sZqhyC6qoFsUh+rDqD93lU/n8d8dPaZl3f0mM+yQGTUeTx2XFlEkqjLF6N
 5CGd8qlEXcdD+Jg1jXeb+sU174mwggxxGbLSJT20RWs0fyFbXjQR60MNlCPdes+qqiN5hjOm
 /5FMMGK4xZSSuvzZm/Q64F7BVsKN3kgGZfuq8ERcuOZJRtOE3ouEfjM2fUsZuRNgKVRks/L8
 2u7V0sez0Dw7UArMi2QYXxlLbjoR5s68TQwPDcnOhCj3H1LjZuTALk3XrULduF9qPBa4uNRT
 cdGItnRMM0SVWGSk9gCVqXVoItnfRWtoAuBOSu5fTQyF6KMoSSUpLcImSOyqUEz4jqLWdgW+
 OL/i1uKKXYXb0EzU5aMMaPHI0aZ5CBFwIpPs130zs6/kXgAHaBwICD3y/QwOcxJdVPIxyCR0
 ECdBhJwSQjxT20droWhaUOs9trB/w5C8qxyQzWzAVGeaXGyw4Zb6dUcONtkhBiEPI8OxI2sZ
 P9O09b3O+AdkVBBvuJUSug6nP9ju4Wz9+QFkmyI+UkniXz1U9uMxVHYhaFyWlFlmte1RCPvA
 BvUo4kGUVl3EJm5SgB5yPUZghSrjKFIxWa6AQUdK0Th7yg/56ucTUhXJHGxZN91ctNI3Hce6
 b554qY+slXn4jJza4bupn4PrQykcCdfO5jLQ7lHWucHfCJxlAEbCXEdYweriKyyhyJkaxJ6e
 mPE2/qe19yxBCPqKhIOKJQE5sIF7bxmhfyA5AZqy4ih8jYdusIK4Q==
IronPort-HdrOrdr: A9a23:6Sa77K7YPMw8nKU2rQPXwPPXdLJyesId70hD6qm+c3Bom6uj5q
 STdZsguyMc5Ax6ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGMhILrFvAB0WKI+VLd8kPFm9K1/J
 0QFJSWcOeRMbC/5vyKmTVR1L0bsb+6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3AJiU6l2lHMvS7/y1q5Sbg/y54HMvXOVTz8HyIeRO?=
 =?us-ascii?q?kMEl0bb+rCgaMqZFdztU7zg=3D=3D?=
X-Talos-MUID: 9a23:82mMYwZLviHIteBTujivjzc8ZZhT+eevBEowyJEcouTVHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="135016376"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:38:24 +0000
Received: from goliath.lan ([10.25.128.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 3AA1cHVJ011466;
	Fri, 10 Nov 2023 01:38:23 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Tomas Mudrunka <tomas.mudrunka@gmail.com>,
        Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 3/8] scripts: insert-sys-cert: change name to insert-symbol
Date: Thu,  9 Nov 2023 17:38:07 -0800
Message-Id: <20231110013817.2378507-4-danielwa@cisco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110013817.2378507-1-danielwa@cisco.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.25.128.169, [10.25.128.169]
X-Outbound-Node: rcdn-core-4.cisco.com
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
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the tool is used to update the command line and/or
to update the certificates, I think it makes sense to
changes the name of this tool.

Update the name of the tool to better reflect it's new use.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 scripts/Makefile                               | 2 +-
 scripts/{insert-sys-cert.c => insert-symbol.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename scripts/{insert-sys-cert.c => insert-symbol.c} (99%)

diff --git a/scripts/Makefile b/scripts/Makefile
index 576cf64be667..2d7618fa5d6b 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -8,10 +8,10 @@ hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
 hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
-hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
 always-$(CONFIG_RUST)					+= target.json
+hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-symbol
 
 filechk_rust_target = $< < include/config/auto.conf
 
diff --git a/scripts/insert-sys-cert.c b/scripts/insert-symbol.c
similarity index 99%
rename from scripts/insert-sys-cert.c
rename to scripts/insert-symbol.c
index 77d3306cfbfb..6866e3a84974 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-symbol.c
@@ -7,7 +7,7 @@
  * This software may be used and distributed according to the terms
  * of the GNU General Public License, incorporated herein by reference.
  *
- * Usage: insert-sys-cert [-s <System.map> -b <vmlinux> -c <certfile>
+ * Usage: insert-symbol [-s <System.map> -b <vmlinux> -c <certfile>
  */
 
 #define _GNU_SOURCE
-- 
2.39.2

