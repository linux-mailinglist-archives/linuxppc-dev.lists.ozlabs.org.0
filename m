Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC18AD08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 05:12:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466yS44HdZzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 13:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466yPn3ml9zDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:10:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 466yPm3bfdz8wMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:10:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 466yPm38M7z9sP7; Tue, 13 Aug 2019 13:10:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=131.153.2.43; helo=h2.fbrelay.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 466yPl4s4tz9sP6
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 13:10:03 +1000 (AEST)
Received: from MTA-06-3.privateemail.com (mta-06.privateemail.com
 [68.65.122.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 25249813C3
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 23:09:59 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 0CAF760058
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 23:09:53 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.206])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id C6E796004F
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 03:09:52 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 0/3] Fix oops in shared-processor spinlocks
Date: Mon, 12 Aug 2019 22:13:11 -0500
Message-Id: <20190813031314.1828-1-cmr@informatik.wtf>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes an oops when calling the shared-processor spinlock implementation
from a non-SP LPAR. Also take this opportunity to refactor
SHARED_PROCESSOR a bit.

Reference:  https://github.com/linuxppc/issues/issues/229

Changes since v3:
 - Replace CONFIG_BOOK3S #ifdef with CONFIG_PPC_PSERIES in
   is_shared_processor() to fix compile error reported by 0day-ci

Changes since v2:
 - Directly call splpar_*_yield() to avoid duplicate call to
   is_shared_processor() in some cases

Changes since v1:
 - Improve comment wording to make it clear why the BOOK3S #ifdef is
   required in is_shared_processor() in spinlock.h
 - Replace empty #define of splpar_*_yield() with actual functions with
   empty bodies

Christopher M. Riedl (3):
  powerpc/spinlocks: Refactor SHARED_PROCESSOR
  powerpc/spinlocks: Rename SPLPAR-only spinlocks
  powerpc/spinlocks: Fix oops in shared-processor spinlocks

 arch/powerpc/include/asm/spinlock.h | 62 +++++++++++++++++++++--------
 arch/powerpc/lib/locks.c            |  6 +--
 2 files changed, 48 insertions(+), 20 deletions(-)

-- 
2.22.0

