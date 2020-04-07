Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424171A067B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:19:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xG1c3CqXzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:19:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qU9jp6lI; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xFzr1nYbzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id r4so1172108pgg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUKXyZrzM6TjI4jTzruvTYiG/HLvu1CJR5iV3Iga9C4=;
 b=qU9jp6lI3eoOJoEX5NRbT7O10ue4iTfNrQ/AwKGj9jSldt4i4Sf4i7PB/0VsG1Ryd+
 4h0h+s/ADmXa1MpHZ7mqhhArmtkkU/56gpMKk5X/N1jbRbDlib07B5rmjewcE5bOViSL
 c6kKL6YsQRft/bo0gRN8Bwyg4TV0YNZ+XeUslAMfqV4tAzJ3iOdY0nIy/qK4+hx2pIbi
 DyhgSVLA23JfyX4FNVjogt2szPGFm8p3l2XsAniFq4WUJV0773HzUJs+kSez9JL0pd4N
 dUW5b8td3whQB9pXy3tZHfMfH+JkQlN0DhwrXhkapetRdqcxBxmggtQa5hg9fDpZrd0f
 ctFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUKXyZrzM6TjI4jTzruvTYiG/HLvu1CJR5iV3Iga9C4=;
 b=AXHrYrcATgdcyR/sKCcFpoD2hcixwpyK14AFVhK8VZDIm+Pik0mLz5GaM1X1BAsTij
 ffRwrP2YSl7yvUPiPJ/NK8HcHl0Tep8NC0xI3jT30xjBWAQgrqV02ZOv7Jzt3x5z1Ojt
 xfprao9gPrkkw1AnmxpeMPhP9rIeonSriKgCXS7pHbjfnkiaIzMjvW0sRRIMN1fBM+vX
 sGjjFcbQdILSYFKf1R7z5IpbjO8J8VZJc4gN9WEPn09b+nTNxXhQ2yAo5kQMHh6DvytZ
 /2JqPBGd6j5qoagx+dCDmVBob42DabT1SYmSmOEhT2nqUB63blvdlEZvNmUNw9xXu/A+
 0WTw==
X-Gm-Message-State: AGi0PuZCeEfsKzDlyZV/pZ31576mVnsAAPQ+cztkD2cIVD+FX/PGGsB5
 YOi+/pwfmk5XFtN6PqJyJctte7ge
X-Google-Smtp-Source: APiQypJBZUawaQrHIISwfarNgMmesE07idpUTr4oxHw6/ZwKyRbScvYNMoZwYkwaVg4KeLRlZB5D0A==
X-Received: by 2002:a62:e315:: with SMTP id g21mr909250pfh.302.1586236691144; 
 Mon, 06 Apr 2020 22:18:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/15] powerpc/64: machine check and system reset fixes
Date: Tue,  7 Apr 2020 15:16:21 +1000
Message-Id: <20200407051636.648369-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a bunch of problems we hit bringing up fwnmi sreset and testing
with mce injection on QEMU. Mostly pseries issues.

This series of fixes applies on top of next-test, the machine
check reconcile patch won't apply cleanly to previous kernels but
it might want to be backported. We can do that after upstreaming.

This doesn't solve all known problems yet, but fwnmi machine check
and system reset injection in QEMU is significantly better. There
will be more to come but these should be ready for review now.

Thanks,
Nick

v3:
- Addressed comments and fixed compile bugs.
- Didn't convert to pr_err because it's an existing printk that was
  moved. A cleanup to convert printks could go afterward.

v2:
- Added a couple more fixes
- Review comments and tags
- Re-tested with some fixes to my qemu machine check injection patches


Nicholas Piggin (15):
  powerpc/64s/exception: Fix machine check no-loss idle wakeup
  powerpc/64s/exceptions: Fix in_mce accounting in unrecoverable path
  powerpc/64s/exceptions: Change irq reconcile for NMIs from reusing
    _DAR to RESULT
  powerpc/64s/exceptions: machine check reconcile irq state
  powerpc/pseries/ras: avoid calling rtas_token in NMI paths
  powerpc/pseries/ras: FWNMI_VALID off by one
  powerpc/pseries/ras: fwnmi avoid modifying r3 in error case
  powerpc/pseries/ras: fwnmi sreset should not interlock
  powerpc/pseries: limit machine check stack to 4GB
  powerpc/pseries: machine check use rtas_call_unlocked with args on
    stack
  powerpc/64s: machine check interrupt update NMI accounting
  powerpc: ftrace_enabled helper
  powerpc/64s: machine check do not trace real-mode handler
  powerpc/64s: system reset do not trace
  powerpc: make unrecoverable NMIs die instead of panic

 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/include/asm/ftrace.h      | 14 ++++++
 arch/powerpc/kernel/exceptions-64s.S   | 47 +++++++++++++++-----
 arch/powerpc/kernel/mce.c              | 16 ++++++-
 arch/powerpc/kernel/process.c          |  2 +-
 arch/powerpc/kernel/setup_64.c         | 15 +++++--
 arch/powerpc/kernel/traps.c            | 24 ++++-------
 arch/powerpc/platforms/pseries/ras.c   | 60 +++++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c | 14 ++++--
 9 files changed, 142 insertions(+), 51 deletions(-)

-- 
2.23.0

