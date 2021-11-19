Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A3456E3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZJx0PRdz2yw7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tqr3XnrY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Tqr3XnrY; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZJH0s4gz2ynp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:31:56 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso10847986pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMRtIHh1DN7Ea6L9bxNXzN1ChzaKkzkAGpZY5LdLUGI=;
 b=Tqr3XnrYRSqiv4BLg1lL7gcvmazzoeBvDOum8PI9N7Fyj1IGFHIVjVWMElMrWTFJFh
 4DsMyojj0DfugBYtf21EW5VozLvGke7xl4LIbzQsJCexeLjphH/jNSrgEocMYVCFKjwk
 2jiWgJXwPkhDBWMCMzuiE3h04SMCHZvnzhA5eoA/5oHFZgksj6rmOFAbqPKp669Kt+Ni
 hujd0NQNE+V9FNz9ILD571Dbr/czm2IuxI8+qvsj2CuLlgUSMzGHr9usxTSezia/X36l
 FuNEcAZG0VXDERdsrgto9jsS6duQOhoUSCAgQW315peLc98EjoRQ0QYrAStRlsldr0O2
 B3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMRtIHh1DN7Ea6L9bxNXzN1ChzaKkzkAGpZY5LdLUGI=;
 b=IXcwhd60Vn7LR7Sz+filkqVKrylZDUqLT6vxYmvcM1y1Z6cQnAzY3GL0ScyzTtaPIb
 LNkLN7jPv+aprMvzsocTxc3c8vIyghkJ2z3jPuhl2ULC4GwSyWIQdbyFCjOuEfyB1t+Q
 jPekrERdlyhF9PYoDzsl5IFiYeAqKt2TdjN7ViHlrXXTjCfhP8R4VaHXzQv4CoTnNQ5q
 Da8Jh9UO4yRgONVDF5ImVm4mGKVTPl79Qv1tP/yOET6D61Txq0l+pnDqxJl1TiGfyxBg
 MksOYvcLp78dBRuBdRhfbBvlwJtPCMwZXzvz6On3WOoNFCGUAgX9L+CIZUsGbdGaSWeR
 1BTg==
X-Gm-Message-State: AOAM530ICr+K2i4gXHtIhULOJFmxrB0u0EcFc/+XagsHzQVu9O1y5w9H
 OGUjMu4oma0huY1HKYLJXi7gLEL5HsE=
X-Google-Smtp-Source: ABdhPJwHSCROhpJ7BGnN/0Xk+G9Lv+CAeLef4gZ/+usAScDxmGcqd3MVdnA+7AyTmcbLF+gjEjiIfA==
X-Received: by 2002:a17:90a:1283:: with SMTP id
 g3mr3860897pja.174.1637321513509; 
 Fri, 19 Nov 2021 03:31:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm2632626pfv.136.2021.11.19.03.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:31:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/5] powerpc: watchdog fixes
Date: Fri, 19 Nov 2021 21:31:41 +1000
Message-Id: <20211119113146.752759-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are some watchdog fixes and improvements, in particular a
deadlock between the wd_smp_lock and console lock when the watchdog
fires, found by Laurent.

Thanks,
Nick

Since v3:
- Rebased on upstream.
- Brought patch 5 into the series.
- Fix bug with SMP watchdog last heartbeat time reporting.

Since v2:
- Fix a false positive warning in patch 1 found by Laurent.
- Move a comment change hunk to the correct patch.
- Drop the patch that removed the unstuck backtrace which is considered
  useful.

Since v1:
- Fixes noticed by Laurent in v1.
- Correct the description of the ABBA deadlock I wrote incorrectly in
  v1.
- Made several other improvements (patches 2,4,5).

Nicholas Piggin (5):
  powerpc/watchdog: Fix missed watchdog reset due to memory ordering
    race
  powerpc/watchdog: tighten non-atomic read-modify-write access
  powerpc/watchdog: Avoid holding wd_smp_lock over printk and
    smp_send_nmi_ipi
  powerpc/watchdog: read TB close to where it is used
  powerpc/watchdog: help remote CPUs to flush NMI printk output

 arch/powerpc/kernel/watchdog.c | 223 ++++++++++++++++++++++++++-------
 1 file changed, 180 insertions(+), 43 deletions(-)

-- 
2.23.0

