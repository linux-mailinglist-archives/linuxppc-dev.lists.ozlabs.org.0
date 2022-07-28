Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D082C5838C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgmD5V6Xz3c6p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:31:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nFvySBVT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nFvySBVT;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltgln6HXfz2xGk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:32 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id p1so951344plr.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYkz6bD1HsvWBCYK323ouOZgcMZJdTFqMjemxUcDmWE=;
        b=nFvySBVTPsdaKHuucEnoL3OxqZgNYny9tDUes2rFhVaKXsw6IYVN6Wiq92yJ/qmayQ
         RaC14egyTl+TyoXuTsvTsblkDysz22bL0Z7uUUNbOyoJwLv7JousiQ8qbt1v3zXosMOd
         0Y4rpbybea9kydgM4g3RLstvglwHnNYL9BT2vF/xHwHS9d80YCV5h3NZmD5b5j/BZenp
         PHTOdkp04cRc1DLC41NZbWOK+DmHEHDx2Z5u5jaJHP+JlDze4Uj0ZPQu3Ih/IJ1OqlLh
         qkYWwjTWCBrV7vylsCls/qjwQmfSLyxckcIwIE26DBm5PvlpjFdIiUPl17+n+5IrAwaH
         fRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYkz6bD1HsvWBCYK323ouOZgcMZJdTFqMjemxUcDmWE=;
        b=ogvR6ELoSuaeHvOhDz6oJ6acZKUVbZY2O+R6+VO7ulKcwSald1xwSJFjNxrzzSPTAn
         dXXHQMYzkwvS/9iuNU4v6hYmi4sYbV6AP6bWn1ZvaRtGOHm6WiMd16wmJTvhaLvGj/7v
         wiMTP7IuVE0O97ByJyHlL0FdtNocDiozORpDEqypoV4icg1cp5y3/r65TLw8AyrDzY1s
         uu1Gn971kmj+42VjTrH5daUW6cu5G6RKtxVHUQkZzSkfkKJWDSl6e5kad+bu14S5k5MM
         mRrVwY6zWOQTYc8skofYEHe0zM8onQ9VRQZ29NxS73Zk0avARRcvNcpHx8L6mYqInrsT
         B7uA==
X-Gm-Message-State: AJIora+9MdAH4ivNGLmwvcY5zPwlvckhSt+Fqx5iMW3QAZEmfj6CablJ
	F0vsa5ASqfOKGfGYSeu+Xav2nAa205w=
X-Google-Smtp-Source: AGRyM1uctAmcyvsblc4rTsVJBVBbzZ5odK54q85Z9739ve1J6fRgmsmyeVmGOYZy6D8cJT5qOQyDMw==
X-Received: by 2002:a17:902:f54e:b0:16c:5119:d4a8 with SMTP id h14-20020a170902f54e00b0016c5119d4a8mr24215965plf.22.1658989889209;
        Wed, 27 Jul 2022 23:31:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/17] powerpc: alternate queued spinlock implementation
Date: Thu, 28 Jul 2022 16:31:02 +1000
Message-Id: <20220728063120.2867508-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces the generic queued spinlock code (like s390 does) with
our own implementation. There is an extra shim patch 1a here to get the
series to apply.

So far the microbenchmarks look okay, haven't really had time to write
up a good set of results. I hope to get some significant bigger
workloads some testing time in the next week or so so if those turn
out positive I may resubmit with any tweaks and some more details of
numbers.

Thanks,
Nick

Nicholas Piggin (17):
  powerpc/qspinlock: powerpc qspinlock implementation
  powerpc/qspinlock: add mcs queueing for contended waiters
  powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
  powerpc/qspinlock: convert atomic operations to assembly
  powerpc/qspinlock: allow new waiters to steal the lock before queueing
  powerpc/qspinlock: theft prevention to control latency
  powerpc/qspinlock: store owner CPU in lock word
  powerpc/qspinlock: paravirt yield to lock owner
  powerpc/qspinlock: implement option to yield to previous node
  powerpc/qspinlock: allow stealing when head of queue yields
  powerpc/qspinlock: allow propagation of yield CPU down the queue
  powerpc/qspinlock: add ability to prod new queue head CPU
  powerpc/qspinlock: trylock and initial lock attempt may steal
  powerpc/qspinlock: use spin_begin/end API
  powerpc/qspinlock: reduce remote node steal spins
  powerpc/qspinlock: allow indefinite spinning on a preempted owner
  powerpc/qspinlock: provide accounting and options for sleepy locks

 arch/powerpc/Kconfig                       |    1 -
 arch/powerpc/include/asm/qspinlock.h       |  130 ++-
 arch/powerpc/include/asm/qspinlock_types.h |   70 ++
 arch/powerpc/include/asm/spinlock_types.h  |    2 +-
 arch/powerpc/lib/Makefile                  |    4 +-
 arch/powerpc/lib/qspinlock.c               | 1009 ++++++++++++++++++++
 6 files changed, 1172 insertions(+), 44 deletions(-)
 create mode 100644 arch/powerpc/include/asm/qspinlock_types.h
 create mode 100644 arch/powerpc/lib/qspinlock.c

-- 
2.35.1

