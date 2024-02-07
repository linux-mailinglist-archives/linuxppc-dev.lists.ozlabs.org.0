Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791684C760
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 10:31:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sysgo.com header.i=@sysgo.com header.a=rsa-sha256 header.s=k1 header.b=CskoReOt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVFHs1BgTz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 20:31:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sysgo.com header.i=@sysgo.com header.a=rsa-sha256 header.s=k1 header.b=CskoReOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sysgo.com (client-ip=159.69.174.51; helo=mail.sysgo.com; envelope-from=david.engraf@sysgo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 183 seconds by postgrey-1.37 at boromir; Wed, 07 Feb 2024 20:31:12 AEDT
Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVFH41qXXz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 20:31:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sysgo.com;
	s=k1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=KR8loywrqe549dMcInpZZOzBTyI3NtTgoQfmDmuVi9I=; b=C
	skoReOtyGYZ/FpsY+JQS4sSZ2rN2xFwmOajdkGm6fMN+/W4Clv+d2oM5d7JYj5AsTMIMOPewKFMOd
	IU1rCukrBiqVBwgHkTl0poeprDw8i9sBI7m8e+nleBhh8qb3KFVUmiIa5lRmVMgUcu7Xwf+25gutb
	uBecXo58W5ZPmIhW5NcStxxnv0P9/39/3fZwq4iqYUVwjbg7WmozkCbOVwi/loctMHVC/5e3lBrm4
	OnWStqSKonITFjCzgFFppYKHQFtMXw6H40+bzT3E2MIh4bxQB7beiq3pOONgvgbDiW6DNqVFE9T/C
	mcAESjSM3cRgJjHs8O558cyJ6/qd0nA2g==;
Received: from lantia.sysgo.com ([172.20.1.5]:47800)
	by mail.sysgo.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <david.engraf@sysgo.com>)
	id 1rXeDp-0002N2-2b;
	Wed, 07 Feb 2024 10:28:01 +0100
From: David Engraf <david.engraf@sysgo.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH] powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64 Book-E
Date: Wed,  7 Feb 2024 10:27:58 +0100
Message-Id: <20240207092758.1058893-1-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.40.1
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
Cc: linuxppc-dev@lists.ozlabs.org, david.engraf@sysgo.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e320a76db4b0 ("powerpc/cputable: Split cpu_specs[] out of cputable.h")
moved the cpu_specs to separate header files. Previously PPC_FEATURE_BOOKE
was enabled by CONFIG_PPC_BOOK3E_64. The definition in cpu_specs_e500mc.h
for PPC64 no longer enables PPC_FEATURE_BOOKE.

This breaks user space reading the ELF hwcaps and expect PPC_FEATURE_BOOKE.
Debugging an application with gdb is no longer working on e5500/e6500
because the 64-bit detection relies on PPC_FEATURE_BOOKE for Book-E.

Fixes: e320a76db4b0 ("powerpc/cputable: Split cpu_specs[] out of cputable.h")
Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 arch/powerpc/kernel/cpu_specs_e500mc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/cpu_specs_e500mc.h b/arch/powerpc/kernel/cpu_specs_e500mc.h
index ceb06b109f831..2ae8e9a7b461c 100644
--- a/arch/powerpc/kernel/cpu_specs_e500mc.h
+++ b/arch/powerpc/kernel/cpu_specs_e500mc.h
@@ -8,7 +8,8 @@
 
 #ifdef CONFIG_PPC64
 #define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
-				 PPC_FEATURE_HAS_FPU | PPC_FEATURE_64)
+				 PPC_FEATURE_HAS_FPU | PPC_FEATURE_64 | \
+				 PPC_FEATURE_BOOKE)
 #else
 #define COMMON_USER_BOOKE	(PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU | \
 				 PPC_FEATURE_BOOKE)
-- 
2.40.1

