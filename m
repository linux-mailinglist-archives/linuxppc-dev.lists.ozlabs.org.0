Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97549F8E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 05:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JBY34kqVzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 13:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JBQj3DVfzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:42:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JBQh3WVJz8t11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JBQh31g9z9sNF; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.29; helo=mta-09-4.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-09-4.privateemail.com (mta-09-4.privateemail.com
 [68.65.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46JBQg4yfrz9sDQ
 for <linuxppc-dev@ozlabs.org>; Wed, 28 Aug 2019 13:42:50 +1000 (AEST)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id A6DA360041;
 Tue, 27 Aug 2019 23:42:46 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.235])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 4397160034;
 Wed, 28 Aug 2019 03:42:46 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [PATCH v5 0/2] Restrict xmon when kernel is locked down
Date: Tue, 27 Aug 2019 22:46:11 -0500
Message-Id: <20190828034613.14750-1-cmr@informatik.wtf>
X-Mailer: git-send-email 2.23.0
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xmon should be either fully or partially disabled depending on the
kernel lockdown state.

Put xmon into read-only mode for lockdown=integrity and completely
disable xmon when lockdown=confidentiality. Since this can occur
dynamically, there may be pre-existing, active breakpoints in xmon when
transitioning into read-only mode. These breakpoints will still trigger,
so allow them to be listed, but not cleared or altered, using xmon.

Changes since v4:
 - Move lockdown state checks into xmon_core
 - Allow clearing of breakpoints in xmon read-only mode
 - Test simple scenarios (combinations of xmon and lockdown cmdline
   options, setting breakpoints and changing lockdown state, etc) in
   QEMU and on an actual POWER8 VM
 - Rebase onto security/next-lockdown
   b602614a81078bf29c82b2671bb96a63488f68d6

Changes since v3:
 - Allow active breakpoints to be shown/listed in read-only mode

Changes since v2:
 - Rebased onto v36 of https://patchwork.kernel.org/cover/11049461/
   (based on: f632a8170a6b667ee4e3f552087588f0fe13c4bb)
 - Do not clear existing breakpoints when transitioning from
   lockdown=none to lockdown=integrity
 - Remove line continuation and dangling quote (confuses checkpatch.pl)
   from the xmon command help/usage string

Christopher M. Riedl (2):
  powerpc/xmon: Allow listing active breakpoints in read-only mode
  powerpc/xmon: Restrict when kernel is locked down

 arch/powerpc/xmon/xmon.c     | 104 +++++++++++++++++++++++++++--------
 include/linux/security.h     |   2 +
 security/lockdown/lockdown.c |   2 +
 3 files changed, 86 insertions(+), 22 deletions(-)

-- 
2.23.0

