Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A9187BC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:11:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hS8l55TxzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:11:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dxXu2SEW; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7L4fPkzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:19 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id t24so11371154pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCgBXPg5neRXZucrm/QDwj0TV10SU6CmirS+BOgUbLw=;
 b=dxXu2SEWGUMXprpAT3hFbeqWj1BbFNyfClGAiSiAXg6gnKciAWaBTT0MhsBEeXh5gk
 ilr7gUYvXaMyru9zD55Pv0pspNTZwvqXjoQt55O1CijRCQ5KwzD7yD/6+YzyAvX/D6NZ
 SmLR9GlsM4wSoCZzQCf1FaairYbBKFigTy2AXVyUKQBqzBqt3Tp+GRy/GKvC8KTwrwFo
 D6EZoj5LMjbOhZ58bq2kWcjqwzYBPXzCx6IQfYBIj8MBDpg299gmYERK1JJ/xzmr8d0l
 VIsJY121kRSz5jxDLHFma5aioyjMp2w47E7av0xY2yf9AFZaaPt3mc4+rmEbijPGVt3P
 k5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCgBXPg5neRXZucrm/QDwj0TV10SU6CmirS+BOgUbLw=;
 b=BKwZFDmod8VHeq0aE9ACPd+HKTdTMMeL8S8dZIF0Do6KglZWcAafPsQKvsZkeCj3Qs
 SVsLXsOMgSaKBltYZUke7fy3yNebxe9RtYgiM2TckvXUbpATJd6xQDpIC1BrVQyfl6OH
 5LYcxbUokrNFypLDygj7s6LenivaoJwgXyqu/65lH/o+BBM2ASG3DNL22NvOsydALRQv
 JhxrUUFXMeBJ/vLJtycj6ISaSHreETnhewtMjI7BuUelf4ZJ15lFXh8Gw78/vT3NoJvC
 AH0jxeHmFG1b2COTvj6kn5s02GOMmRFgZ4ZShupWE9pCga2NHsyEmk0OnCHusteXbD88
 ckbw==
X-Gm-Message-State: ANhLgQ2QtHSx/t8pwiS5Z4ATNhWr2fUJhafv93CuDQ5t9hcOvwXUvP6c
 V4S28/9j5dW4CmzJbGKP2/Nk5dhC
X-Google-Smtp-Source: ADFU+vv9HJLymHc3lsuVoJtRcoIaDkNFreOTKsEf8Fxkj89eCviqELImS/Y2SJaq8VtfTXe2HoXciQ==
X-Received: by 2002:a62:1c4c:: with SMTP id c73mr3961921pfc.64.1584436215173; 
 Tue, 17 Mar 2020 02:10:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/7] powerpc/64: machine check and other RAS fixes
Date: Tue, 17 Mar 2020 19:09:06 +1000
Message-Id: <20200317090913.343097-1-npiggin@gmail.com>
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

There's a bunch of problems we hit bringing up fwnmi sreset and
mces on QEMU, these apply to PowerVM as well, but I haven't done
much testing there and it's much harder.

This series of fixes applies on top of next-test, the machine
check reconcile patch won't apply cleanly to previous kernels but
it might want to be backported. We can do that after upstreaming.

This doesn't solve Ganesh's machine check RMO problem, but at
least the reconciling should help squash some warnings.

Thanks,
Nick

Nicholas Piggin (7):
  powerpc/64: mark emergency stacks valid to unwind
  powerpc/pseries/ras: avoid calling rtas_token in NMI paths
  powerpc/64s: Change irq reconcile for NMIs from reusing _DAR to RESULT
  powerpc/64s: machine check reconcile irq state
  powerpc/pseries/ras: FWNMI_VALID off by one
  powerpc/pseries/ras: fwnmi avoid modifying r3 in error case
  powerpc/pseries/ras: fwnmi sreset should not interlock

 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/kernel/exceptions-64s.S   | 29 +++++++++++---
 arch/powerpc/kernel/process.c          | 31 ++++++++++++++-
 arch/powerpc/platforms/pseries/ras.c   | 54 ++++++++++++++++++--------
 arch/powerpc/platforms/pseries/setup.c | 13 +++++--
 5 files changed, 103 insertions(+), 25 deletions(-)

-- 
2.23.0

