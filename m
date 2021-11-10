Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE0F44BA73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpqB64KHkz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 13:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=drBfUuzT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=drBfUuzT; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpq9T1cW2z2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 13:51:07 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id y1so1744543plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 18:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scKLEwKqV4wympFCawVQAQOhtM0wRY+/QoytdFX1QlM=;
 b=drBfUuzT82/q/88y2c7NYDWT1sy02ozX4ZGxyJbmhfwsVfWRwMiP0nX23nrsJ7o8T3
 up0VMltese2HAB9cUz0yCBtMqr4t6H0dl7CWuzip65Lu+M8y+uPRlx9GILXgMxc5Fh4i
 3cDmbvB51Xfx8jkUCjLdAlK6GFG1PGjF15ZRB2q8RLWr11R1HrlcSp8GuWOn4S9UcQJi
 8Csk6LKcSG0O3UUPq1/oC6W9uSnSBdKkbOyNKNBCCP/1+7Eda2MtZPsEqUNYd/0+D6Nd
 LJVJH0QkV67pQ8pigc6H8L0BxRmR0fIzSXvzNmVl0nLG0hSRBQd2z+xVIEJcaxDZfFV+
 cOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scKLEwKqV4wympFCawVQAQOhtM0wRY+/QoytdFX1QlM=;
 b=pXPseriVHJRmYT5Q+T+XV6lHZGnVB0thlWfuS6LG/oaGN4zRNxjEQaPHYV23wSX5X7
 kPgNX+PXRD2veyElG3Nl8RBn9xMWyjr0EXZhdD4u2PLcE7/w6cQ123As1ZpfMQWgC7Lh
 raUrGM2Zgm0rEIX8MsAH84Hgf0oUSDvUIbfPuY/FFOtuZilN2qL7wyebWpgkA3uTLQMd
 q9M/l3vwQAeXecxibyekDYoIksNzqoTZfEeSt7IqH3fNAJg8TzWRhq73SyKBJAUFLeXK
 Op9DgeE2lKWaUrbr7Zw3KrM4ybbpFEBImVG2rnRq8Bzzex36D/b1uG4UK6xtzT14mKvD
 HV6g==
X-Gm-Message-State: AOAM533OoKm2IIcjIjYhoo2CtTHR3eOnsCVS5X3T4Mwoyu64vs6fVra2
 hZ/qBEmIFGNooqImSi80AVSGx1+25b2o3Q==
X-Google-Smtp-Source: ABdhPJy3vN1Yk0LbagYkxjpgjtnmgcjLEHC4NkYpHRoPUtQiT8dvcinse4pcBBzD+zy7N4O9xzDNQw==
X-Received: by 2002:a17:90b:3849:: with SMTP id
 nl9mr13064969pjb.145.1636512663851; 
 Tue, 09 Nov 2021 18:51:03 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.146.48.179])
 by smtp.gmail.com with ESMTPSA id b4sm21604406pfl.60.2021.11.09.18.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:51:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/4] powerpc: watchdog fixes
Date: Wed, 10 Nov 2021 12:50:52 +1000
Message-Id: <20211110025056.2084347-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are some watchdog fixes and improvements, in particular a
deadlock between the wd_smp_lock and console lock when the watchdog
fires, found by Laurent.

Thanks,
Nick

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

Nicholas Piggin (4):
  powerpc/watchdog: Fix missed watchdog reset due to memory ordering
    race
  powerpc/watchdog: tighten non-atomic read-modify-write access
  powerpc/watchdog: Avoid holding wd_smp_lock over printk and
    smp_send_nmi_ipi
  powerpc/watchdog: read TB close to where it is used

 arch/powerpc/kernel/watchdog.c | 182 ++++++++++++++++++++++++++-------
 1 file changed, 147 insertions(+), 35 deletions(-)

-- 
2.23.0

