Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F743618A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 06:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM2p41rgtz3cN5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=me8JUFwL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.95; helo=alln-iport-8.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=me8JUFwL; dkim-atps=neutral
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM2m00RWtz302y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:09:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1801; q=dns/txt; s=iport;
 t=1618546176; x=1619755776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQ58imMeiHXePvYFGI+pFKOj7B4LzLzc7QXDrbdED60=;
 b=me8JUFwLeqHDmWdQiWQ80msvkwJ25FdoOsolIphABopcmT7iRgjX/gil
 wJp9zW5FOLgc6p3/lll7HSQvz+S7bId6MEv0LW5rZJEi7qDIOfBwQjWhd
 MmPBRwErKPPwEowwcqgz7rJZUA1CTdfnVVw0XsgHxiwBGisejqlwYr64N 0=;
X-IPAS-Result: =?us-ascii?q?A0AIAACODHlgmIsNJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF+BgEBAQsBAYN2ATkxjGekPIF8CwEBAQ80BAEBgVuCdQKBcwIlNAkOA?=
 =?us-ascii?q?gMBAQEDAgMBAQEBAQUBAQECAQYEFAEBAQEBAQEBaIVdQxYBhWsGMgFGEFFXB?=
 =?us-ascii?q?gESgnGDCKwGgiuBAYg2gUQUgSUBiGt0g3UnHIFJQoN/dIo5BIJGAYEOAZ9Mg?=
 =?us-ascii?q?X+cLYMWgSabUQ8jg06hLpUYghKhUIFUOIFbMxoIGxWDJFAZDo44jXQBWyEDL?=
 =?us-ascii?q?zgCBgoBAQMJiU6DQAEB?=
IronPort-HdrOrdr: A9a23:xoYOGKEi9RQH0BH6pLqFtZHXdLJzesId70hD6mlaQ3VuHvCwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkO0sFJqrQQWOggWVBa5464+K+VfdMg34stVQzK
 JxN5V5YeeAbmRSqebfzE2GH807wN+BmZrY4Nv263t2VwllZ+VB4m5CazqzKUF9SAlYCZdRLv
 P1jfZvnDaudW8aac62HBA+Lor+jufWn5HrawNuPXEawTSJ5AnE1JfKVzCFwxFbaD9U2LEk62
 SAqRDh/76uqevT8G6660bjq7BfmN7s0bJ4ZPCku4wyNijmjBquacBHXbCP1QpF2d2H2RINjM
 TGpQsmMoBIz07pOkuxoRfrxmDboVAT10M=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; d="scan'208";a="695927056"
Received: from alln-core-6.cisco.com ([173.36.13.139])
 by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 16 Apr 2021 04:09:32 +0000
Received: from zorba.cisco.com ([10.24.7.67])
 by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHi016753;
 Fri, 16 Apr 2021 04:09:30 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/8] scripts: insert-sys-cert: change name to insert-symbol
Date: Thu, 15 Apr 2021 21:09:14 -0700
Message-Id: <20210416040924.2882771-4-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416040924.2882771-1-danielwa@cisco.com>
References: <20210416040924.2882771-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
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
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index c36106bce80e..ed6b9f8f91fa 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -13,7 +13,7 @@ hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
-hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
+hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-symbol
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
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
2.25.1

