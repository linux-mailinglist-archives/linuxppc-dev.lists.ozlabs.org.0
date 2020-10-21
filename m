Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65E29551B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 01:27:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGmqt6M6MzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 10:27:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u+R02rUg; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGmp96QyvzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 10:26:09 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id h2so2012603pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 16:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/YlRIGUDw0sbUairDpiWe0TrBQOAqb1qM3ElVI35/U=;
 b=u+R02rUg5hyO9QE29Oxc6gfVuvjTbDqLhod03pYFxRWoN1A5LYSssTGDn9FF998u6x
 /k3qCry3tM9Rf08tKZ/MjTD9cwdV/LdlPC0OnrCJv02HvgOzpFiF3HF4mUPfL1F/ipPQ
 JKw4iQxx00IQAQZM23AquOdHXjlvRFc2SRkxx+FUVlGeLc3edx2OM4mem84lwctmkATI
 G4Xnf5xQSTJJ+ApDo4v618x3KbBHnZSpe3G1EEKamnCdW/WVuIAsAQCt9yA9pYhmVSMF
 dJxGwEbqhNWbQ/z+a1bzXHzN5vCyRJRIu3gFtx3wVNWm6ysRlx8tphbb4gABWx758oER
 Z6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/YlRIGUDw0sbUairDpiWe0TrBQOAqb1qM3ElVI35/U=;
 b=EMUGU3jJFwRK4ERUj6Y0Y5GDUh1Yn35s6sbSqO+vsuYok7OQ8AhZ4+7PkUTcWhUeA6
 1oE8zMwVkHq8QNn/3FeMQnnXQ2yX6qLj+VHXnOdqyUAQj7ZJ3AsyZif2afQSrEov60pI
 98EPWGjHHfhj6uOG9ZiERU6CeqVo6wvOiHswqg+9UFEWMM8l1zgJHti21HIZ1KWr+lgN
 g/PXF01My2lAlQe8jDCDUKBXFKm8OSwfAs85xu8re4kiyfB5mPVnYaIUhRcDNLAnptu2
 bbTDEMmeIFOPKoWXr8By5s58C7O6wHRqhLxpMPECr7DKU1rRcuOo8ZSiOh7jT9IRy4gN
 2ljg==
X-Gm-Message-State: AOAM5308PH3WcnX+K7o4a0gVEDQwpLFB0obIijjmTwB0ZEftMDAeMVeU
 3a5vUXZMvpueukA7xFKJucvW/D+dFkg=
X-Google-Smtp-Source: ABdhPJyEPJ+ZlwIavcCr2ic9zp9IOObocv0gLw/mPIl3BdvOe/3qRuTpC4O0qOEOxjS3I3TclIIrOQ==
X-Received: by 2002:a17:902:d392:b029:d3:dd95:d89a with SMTP id
 e18-20020a170902d392b02900d3dd95d89amr5548968pld.41.1603322766023; 
 Wed, 21 Oct 2020 16:26:06 -0700 (PDT)
Received: from localhost.ibm.com (14-200-206-90.tpgi.com.au. [14.200.206.90])
 by smtp.gmail.com with ESMTPSA id
 z21sm3407016pfr.43.2020.10.21.16.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 16:26:05 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/eeh: Fix eeh_dev_check_failure() for PE#0
Date: Thu, 22 Oct 2020 10:25:54 +1100
Message-Id: <20201021232554.1434687-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 269e583357df ("powerpc/eeh: Delete eeh_pe->config_addr") the
following simplification was made:

-       if (!pe->addr && !pe->config_addr) {
+       if (!pe->addr) {
                eeh_stats.no_cfg_addr++;
                return 0;
        }

This introduced a bug which causes EEH checking to be skipped for devices
in PE#0.

Before the change above the check would always pass since atleast one of
the two PE addresses would be non-zero in all circumstances. On PowerNV
pe->config_addr was the be the BDFN of the first device added to the PE.
The zero BDFN is reserved for the PHB's root port, but this is fine since
for obscure platform reasons the root port is never assigned to PE#0.

Similarly, on pseries pe->addr has always been non-zero for the reasons
outlined in commit 42de19d5ef71 ("powerpc/pseries/eeh: Allow zero to be a
valid PE configuration address").

We can fix the problem by deleting the block entirely The original
purpose of this test was to avoid performing EEH checks on devices there
were not on an EEH capable bus. In modern Linux the edev->pe pointer will
be NULL for devices that are not on an EEH capable bus. The code block
immediately above this one already checks for the edev->pe == NULL case
so this test (new and old) is entirely redundant.

Ideally we'd delete eeh_stats.no_cfg_addr too since nothing increments it
any more. Unfortunately, that information is exposed via /proc/powerpc/eeh
which means it's technically ABI. We could make it hard-coded, but that's
a change for another patch.

Fixes: 269e583357df ("powerpc/eeh: Delete eeh_pe->config_addr")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 4da880759a8b..7dd03d47693f 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -470,11 +470,6 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 		return 0;
 	}
 
-	if (!pe->addr) {
-		eeh_stats.no_cfg_addr++;
-		return 0;
-	}
-
 	/*
 	 * On PowerNV platform, we might already have fenced PHB
 	 * there and we need take care of that firstly.
-- 
2.26.2

