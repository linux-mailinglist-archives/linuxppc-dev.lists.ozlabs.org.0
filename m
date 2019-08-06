Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FF829DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 05:05:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462fdP5Tz2zDqJg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 13:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462fT969yCzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 12:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 462fT93BmGz8x7j
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 12:58:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 462fT92g6fz9sDB; Tue,  6 Aug 2019 12:58:05 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 462fT85S4Rz9sN6
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Aug 2019 12:58:04 +1000 (AEST)
Received: from MTA-10-4.privateemail.com (mta-10.privateemail.com
 [68.65.122.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 0FE8180A2D
 for <linuxppc-dev@ozlabs.org>; Mon,  5 Aug 2019 22:58:00 -0400 (EDT)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 434D460038
 for <linuxppc-dev@ozlabs.org>; Mon,  5 Aug 2019 22:57:53 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.240])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 067EE60033
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Aug 2019 02:57:52 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 0/3] Fix oops in shared-processor spinlocks
Date: Mon,  5 Aug 2019 22:01:09 -0500
Message-Id: <20190806030112.15232-1-cmr@informatik.wtf>
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

