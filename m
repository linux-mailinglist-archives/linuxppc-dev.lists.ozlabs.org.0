Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7E718056
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 14:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWTfL5K7nz3fD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 22:51:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=px5prZxp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWTdW2KWxz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 22:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=px5prZxp;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWTdV59njz4x2c;
	Wed, 31 May 2023 22:50:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685537439;
	bh=j993mWpcfEw/pN/dpCaki/QxS9X2laWYNvX3gAG5ZXg=;
	h=From:To:Cc:Subject:Date:From;
	b=px5prZxpmwU7UYPlYYLFYX9F76c2aM3QB+KxSg+t1HCWiYC9uFDA8rbvKY2EfM7gX
	 7XKKZy7zstG0BPpu/aKAN1Mn/GxYHEb+jaO370oKN75C01T49CmEEGNQYqTxigpLz4
	 NKR449A+SZixJcN/gKihAW+oHCnPqxG0TCWL18ZI0+sDtPX7jgGnS7ZRaTPWnPAYHQ
	 QPrF1Qydntlub/+o3Fcli85CPF6PFMmTyYEVpIG/ahPCLszswqM++XnHnQpR9n9CbE
	 ST3VE4kLiJhSARwuplQwn2pRRZikabmOFCDEpv6LAl3JU4N1KVkgEzq5xtU4WerJgh
	 NqY3H52akGKZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
Date: Wed, 31 May 2023 22:50:23 +1000
Message-Id: <20230531125023.1121060-1-mpe@ellerman.id.au>
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
Cc: linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc section has a "F:" entry for drivers/macintosh, matching all
files in or below drivers/macintosh. That is correct for the most part,
but there are a couple of m68k-only drivers in the directory, so exclude
those.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 250518fc70ff..9bbb613d386a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11916,6 +11916,8 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Odd Fixes
 F:	arch/powerpc/platforms/powermac/
 F:	drivers/macintosh/
+X:	drivers/macintosh/adb-iop.c
+X:	drivers/macintosh/via-macii.c
 
 LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
-- 
2.40.1

