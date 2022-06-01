Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF053AC9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 20:21:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCyBs6dGSz3bpX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 04:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=sDGsn6ME;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.74; helo=conuserg-07.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=sDGsn6ME;
	dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCyBG5tLDz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 04:20:38 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-07.nifty.com with ESMTP id 251IJkAS014364;
	Thu, 2 Jun 2022 03:19:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 251IJkAS014364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654107589;
	bh=tMDyL0rhu7Lqq/KCehxyT1DbD+leBMoEySfqxZD7ygQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sDGsn6MEry3DL/7zDaFzQ2QZabJwFxfQ6mpizg+eOuNIRBtdbJ15ceBfgtQ//brQH
	 C3Q5eGNxQ0LksIrSZf1e2eNInc+GtM6eFsCVl6/hF2Mq1pThTUORjMmQN9mjCubPKy
	 47b7vxX+yXHt5OdijhmwhmpRa/umFL1PGMcI5NedbEx7g5reM3v6NDomzyiAtBawvS
	 4CYFTabJoLGXJba0xqScxZ9MiLUHucMH/xjk9X23i5zpe6BQDLVBtxu7Jr7JK5AN9b
	 NDWvn5tvA/DOV7zQ4oKXD2ZnWUWwHDDToVFJ83wFsb8hLBVHcYvoQ4BiJgpNwCuDSR
	 YycShFfIOMI5A==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/3] powerpc: use __kernel_{uid,gid}32_t in uapi/asm/stat.h
Date: Thu,  2 Jun 2022 03:19:40 +0900
Message-Id: <20220601181941.3706832-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220601181941.3706832-1-masahiroy@kernel.org>
References: <20220601181941.3706832-1-masahiroy@kernel.org>
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
Cc: Todd Kjos <tkjos@android.com>, Masahiro Yamada <masahiroy@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Christopher Ferris <cferris@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit c01013a2f8dd ("powerpc: add asm/stat.h to UAPI compile-test
coverage") converted as follows:

  uid_t  -->  __kernel_uid_t
  gid_t  -->  __kernel_gid_t

The bit width of __kernel_{uid,gid}_t is 16 or 32-bits depending on
architectures.

PPC uses 32-bits for them as in include/uapi/asm-generic/posix_types.h,
so the previous conversion is probably fine, but let's stick to the
arch-independent conversion just in case.

The safe replacements across all architectures are:

  uid_t  -->  __kernel_uid32_t
  gid_t  -->  __kernel_gid32_t

as defined in include/linux/types.h.

A similar issue was reported for the android binder. [1]

[1]: https://lore.kernel.org/all/20220601010017.2639048-1-cmllamas@google.com/

Fixes: c01013a2f8dd ("powerpc: add asm/stat.h to UAPI compile-test coverage")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/include/uapi/asm/stat.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/stat.h b/arch/powerpc/include/uapi/asm/stat.h
index a28c9a1201fa..d50901664239 100644
--- a/arch/powerpc/include/uapi/asm/stat.h
+++ b/arch/powerpc/include/uapi/asm/stat.h
@@ -37,8 +37,8 @@ struct stat {
 	__kernel_mode_t	st_mode;
 	unsigned short	st_nlink;
 #endif
-	__kernel_uid_t	st_uid;
-	__kernel_gid_t	st_gid;
+	__kernel_uid32_t st_uid;
+	__kernel_gid32_t st_gid;
 	unsigned long	st_rdev;
 	long		st_size;
 	unsigned long	st_blksize;
-- 
2.32.0

