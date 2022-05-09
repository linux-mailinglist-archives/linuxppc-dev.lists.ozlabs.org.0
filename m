Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8351F854
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:38:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxbhf42Jlz3bww
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:38:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fGFmP3bW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fGFmP3bW; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxbdz0M1dz2yp5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 19:36:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088983; x=1683624983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JULdTGBTfThIZcRLutbTwErm+tkVZJR7XHUyFQtfHus=;
 b=fGFmP3bWFW6EF9qQxec9A7BdEmbeoJOFonypeJl/d3x+ATXBmaV3qHd8
 1MV19RZbDW6m3maYdtdmROp78qb2sqffWMD4MdsukiXmxG/xOMmZa28j7
 pU7vRgFb9QeHWVQ1LCCbnsP/J7SBieVFYvA/QtfB/2A9f5z8V6H95MFbx
 l767yFj2NYSYNU1QL7FXfntpYKs9rnGwgHYjmZ8j2PVDobt9dB1W6YPQh
 k81MVw/D+W3hpe4wsfeclxQ9VLYsGS3qjFxxwnED6/GAv17dRpEfsmt4I
 M7aQVPAG91sTvCmbJOSTZZT9zXOo8GOgQe0aJC4MHdyFVNjCf3SWM1TNf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="248898678"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="248898678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:35:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="564969629"
Received: from mfuent2x-mobl1.amr.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.251.220.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:35:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: [PATCH 3/3] termbits.h: Remove posix_types.h include
Date: Mon,  9 May 2022 12:34:46 +0300
Message-Id: <20220509093446.6677-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
References: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nothing in termbits seems to require anything from linux/posix_types.h.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/include/uapi/asm/termbits.h  | 2 --
 arch/mips/include/uapi/asm/termbits.h   | 2 --
 arch/parisc/include/uapi/asm/termbits.h | 2 --
 arch/sparc/include/uapi/asm/termbits.h  | 2 --
 include/uapi/asm-generic/termbits.h     | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
index 735e9ffe2795..f1290b22072b 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -2,8 +2,6 @@
 #ifndef _ALPHA_TERMBITS_H
 #define _ALPHA_TERMBITS_H
 
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
 
 typedef unsigned int	tcflag_t;
diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
index 8fa3e79d4f94..1eb60903d6f0 100644
--- a/arch/mips/include/uapi/asm/termbits.h
+++ b/arch/mips/include/uapi/asm/termbits.h
@@ -11,8 +11,6 @@
 #ifndef _ASM_TERMBITS_H
 #define _ASM_TERMBITS_H
 
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
 
 typedef unsigned int	tcflag_t;
diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/uapi/asm/termbits.h
index d72c5ebf3a3a..3a8938d26fb4 100644
--- a/arch/parisc/include/uapi/asm/termbits.h
+++ b/arch/parisc/include/uapi/asm/termbits.h
@@ -2,8 +2,6 @@
 #ifndef __ARCH_PARISC_TERMBITS_H__
 #define __ARCH_PARISC_TERMBITS_H__
 
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
 
 typedef unsigned int	tcflag_t;
diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/uapi/asm/termbits.h
index cfcc4e07ce51..4321322701fc 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -2,8 +2,6 @@
 #ifndef _UAPI_SPARC_TERMBITS_H
 #define _UAPI_SPARC_TERMBITS_H
 
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
 
 #if defined(__sparc__) && defined(__arch64__)
diff --git a/include/uapi/asm-generic/termbits.h b/include/uapi/asm-generic/termbits.h
index c92179563289..890ef29053e2 100644
--- a/include/uapi/asm-generic/termbits.h
+++ b/include/uapi/asm-generic/termbits.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_GENERIC_TERMBITS_H
 #define __ASM_GENERIC_TERMBITS_H
 
-#include <linux/posix_types.h>
-
 #include <asm-generic/termbits-common.h>
 
 typedef unsigned int	tcflag_t;
-- 
2.30.2

