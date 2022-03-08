Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0E4D19A2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcFl3WkCz3brx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:52:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L2oxsHXR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L2oxsHXR; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDQ496pz3bNx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:00 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id t5so17396403pfg.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u44ClPB/a5LtsTY3VUu+Bap5k5f5ROUorVM32+qN7BU=;
 b=L2oxsHXRTOGXfHJiuu/lZccr+//GvwNTieJFRa5HvJxfF9KWr0KZ7fn/8RWDKWyKPz
 x5DVYYPmj/189m+pUSRNIUlzDpReAyNY5DcarCFCBEgxRmL0x8tuA/vDQIBEDpgLbx/l
 QT0xzuMpCznhnrO0M+6LCjieRm9LNam4B1OHkYN8bTJhnk7mUFEuqQwR+Un3ZYO8Nwh8
 EtPG3+dHxY7bXRQNN8JHeeMTETw3a5b3IlUVN8OQoGfZ53f3WRu2V2M8mlEzIsdJf7vV
 HcbgSb5XZoguzjHbusBxn4EEzYNjGX5cnk6i0yWcnyekxRfzeg97g/xObweKVyTXtpCS
 GuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u44ClPB/a5LtsTY3VUu+Bap5k5f5ROUorVM32+qN7BU=;
 b=XuP9tPtQgPWz3oF0bSPP/nAykvJ0Td4amy4J+73OUjR8jChYMpXDZoYZxT8x1uenp7
 uIUYLMDIOBlrbqSMlEIQdV4DI5j6hFzrC4gb355APc81X4C6e7VqEEwazozuDh3jDXEh
 RRIgRj0Qr/Qv/DPoIWiQFyoGBkuTzfRiKA84mHm7t6BASsG3UyUYc4BsftzPa+DcVjfI
 kP529Vwc53MRc8uz9c+Jmw1AfisyPVLLQueewmU3BTjWPVcxEkIAOrkXK/pozH7lHKSM
 xseun/6npwPKPOXpDJzCJ27Zz0S3sMneMQw5XGhmn0vuIhLFnLBvwoesvAZDSUPJY0Tl
 xUxA==
X-Gm-Message-State: AOAM530FJc9V28yUWmDJwP29L6ekLkKdTbKr8X1RKC8jA5PdTB5voabc
 qBDN6cIzwKNLYOQK4XvtqiHXjmvpgOc=
X-Google-Smtp-Source: ABdhPJwGMmUc6V7ANa/UJiZojEMDeNxc/qBha9yQweYfJ77oPUZtRkUClD0AcmOz5Ku5sa9Lmmxg1w==
X-Received: by 2002:a05:6a00:10cf:b0:4f6:5834:aefb with SMTP id
 d15-20020a056a0010cf00b004f65834aefbmr18451503pfu.77.1646747456860; 
 Tue, 08 Mar 2022 05:50:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:50:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/14] powerpc/rtas: various cleanups and improvements
Date: Tue,  8 Mar 2022 23:50:33 +1000
Message-Id: <20220308135047.478297-1-npiggin@gmail.com>
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

I had a bunch of random little fixes and cleanups around and
was prompted to put them together and make a change to call
RTAS with MSR[RI] enabled because of a report of the hard
lockup watchdog NMI IPI hitting in an rtas call which then
crashed because it's unrecoverable.

Could possibly move patch 9 earlier if it would help with
backporting.

Thanks,
Nick

Nicholas Piggin (14):
  powerpc/rtas: Move rtas entry assembly into its own file
  powerpc/rtas: Make enter_rtas a nokprobe symbol on 64-bit
  powerpc/rtas: Fix whitespace in rtas_entry.S
  powerpc/rtas: Call enter_rtas with MSR[EE] disabled
  powerpc/rtas: Modernise RI clearing on 64-bit
  powerpc/rtas: Load rtas entry MSR explicitly
  powerpc/rtas: PACA can be restored directly from SPRG
  powerpc/rtas: call enter_rtas in real-mode on 64-bit
  powerpc/rtas: Leave MSR[RI] enabled over RTAS call
  powerpc/rtas: replace rtas_call_unlocked with raw_rtas_call
  powerpc/rtas: tidy __fetch_rtas_last_error
  powerpc/rtas: Close theoretical memory leak
  powerpc/rtas: enture rtas_call is called with MMU enabled
  powerpc/rtas: Consolidate and improve checking for rtas callers

 arch/powerpc/include/asm/rtas.h              |   4 +-
 arch/powerpc/kernel/Makefile                 |   2 +-
 arch/powerpc/kernel/entry_32.S               |  49 ------
 arch/powerpc/kernel/entry_64.S               | 150 -------------------
 arch/powerpc/kernel/rtas.c                   | 132 +++++++++-------
 arch/powerpc/kernel/rtas_entry.S             | 144 ++++++++++++++++++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |   2 +-
 arch/powerpc/platforms/pseries/ras.c         |   7 +-
 arch/powerpc/xmon/xmon.c                     |   2 +-
 9 files changed, 227 insertions(+), 265 deletions(-)
 create mode 100644 arch/powerpc/kernel/rtas_entry.S

-- 
2.23.0

