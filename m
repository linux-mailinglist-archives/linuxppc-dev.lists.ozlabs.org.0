Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8B707D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:49:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45spy03LspzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:48:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ANQ1ydPC"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spw50B6tzDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:47:16 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id i2so19512966plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ZwHlsHd4FlehijXf915Xc4syzX1qr2GCQGGHndMMk8=;
 b=ANQ1ydPCiZ/y8OQSc2CG4O3GRrteMuomYfYL6oLtcSL8DghDPnCrIWvzja8Hceu3ve
 YqAAre5wPbRaEOSxOwyGq46wNgpZkRmnKgjZSgVKGJEWblh47GYJuU0vUdqlyr0t05h5
 n+Sgcg4vuH5i4nZ3uGnJ2st57vkcwzR1QdAMEhDJk992xtaTLrwnnEBP6WqOsUACVBoF
 rLfYU2v12croayEcx12HFUJkrMBaLecfmQMmo5HVWAQZYLZQwO0/fUa0LI+Jr5btyvau
 /w+2w6962eONe05B+3K5n7vr2nDGZ49p0aqbRw9rcXj3/RbgQvEahj2aGwM0Zr/TJDlJ
 XtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ZwHlsHd4FlehijXf915Xc4syzX1qr2GCQGGHndMMk8=;
 b=b4gmdGWNypOzXx8eaXcnaVTUoWyGpc8acLFZHWLYOFo6gV/Kny0F+cMtA3sMz/BRe2
 vjbkV0qGD5o6bXDfuhtfD5wtW0GqOn4U26q4jJnLJaPFOPo2D3r0J7NGiV/MjR+/Daj9
 sDvccZMeHA+hV/bK32GKFQ9Xn768LANRolnU0zjNP8l3e8m14hv9q7C1fOSr9V38HVWJ
 ZE18y79JWecLH2T0sDyKkzdgIlVD8dWLo8jUO15YUyHm1v9BemeT/UyLWv1LfiSn3Pm5
 VcZFiIkXW0XkTfq8C5ZHirSt65qJ3hjjYnapBwJEhZuEAbXaYFK+/sQCOMeNiUCdR0V8
 UhEw==
X-Gm-Message-State: APjAAAU8fD5UjqTgMGnwGh8sJ2jQ69KvLY+pn11UkJVavA9M0el+Cp5Z
 0KqcKkjJ4zytye8QIhtC0OW8Eg/9
X-Google-Smtp-Source: APXvYqzjnJbNrcbub25HEtLCmxj46RsjSGc0fY0DzJcsLL6hWDSfYYPZM5+ThHuHufaFlyLmtzVcfA==
X-Received: by 2002:a17:902:8509:: with SMTP id
 bj9mr77169415plb.79.1563817632768; 
 Mon, 22 Jul 2019 10:47:12 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id z24sm69170057pfr.51.2019.07.22.10.47.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:47:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/4] assorted virtual / physical address fixes
Date: Tue, 23 Jul 2019 03:46:56 +1000
Message-Id: <20190722174700.11483-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implementing VIRTUAL_BUG_ON to catch incorrect usage of __va and __pa
showed up a few possible issues. Actually patch 1 was found by
inspection (I will check whether I may attribute the reporter).

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64s/radix: Fix memory hotplug section page table creation
  powerpc/64s/radix: Fix memory hot-unplug page table split
  powerpc/perf: fix imc allocation failure
  powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa addresses

 arch/powerpc/include/asm/page.h          | 14 ++++++++++--
 arch/powerpc/mm/book3s64/radix_pgtable.c |  6 ++---
 arch/powerpc/perf/imc-pmu.c              | 29 +++++++++++++++---------
 3 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.20.1

