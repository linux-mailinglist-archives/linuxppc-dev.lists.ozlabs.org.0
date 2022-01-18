Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760E3491F35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 06:59:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdJ5H2R7Gz2ypK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 16:59:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NrMMQfdJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NrMMQfdJ; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdJ3w0qWGz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 16:58:34 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id a7so20670791plh.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 21:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOvS9A6qOyMEh9Y1mE2jozmNxS98EAE2x+Cdxt8ja2M=;
 b=NrMMQfdJZPrbGGiX6RqBsq+QWv3b2OPDt/jNi8A5WSoqEGVcY/jAT4HQ5ZrVoxkPpS
 lR3tmatqkzMFmhhJJikfIHD1FfYpN6h1bLzfQzW5m9uIZBbmb444rJHPAt2XC5v7F3uj
 wQ0Yz3hn6Rh5hamYM/fS3sx1A0DJpclyHe927bK3vvEKvwmW7MOQTHC7XKmsDgiBSs2b
 /soOLoEZRBG9qVEbArBSxIkd3GJeCldQH8aHbMhPTItXcGM50fIMNb/EVaxhBP+cxidy
 eG/LOZgYD/ytQ1wCXKMyoHrNNZ9Jw59iWj12Ioa8OP9e8p2p2ge1JYt9jUcSURQNAh2X
 0oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOvS9A6qOyMEh9Y1mE2jozmNxS98EAE2x+Cdxt8ja2M=;
 b=POZe+HrcYEQ7psuReH3bWoX4hLh44AVDGWm7hyxk61IYUuXO6QQ3iu74YBkfHnHZ/f
 527KMvdnmhD14Pix1LiFX8T/tzicgPJR9D/4MihxF6D0XBro8mpCCighvmYzx55XnpKp
 pz+T2TrreJ+FGVXe20ObvRysQBb7Lgz8vMhCfhlzV3Y8PmGtzEv/GTIIZOyUtCJWhqX3
 vkgb09oTFyEMNdFA6hnhwWv+5JSe0YeEU4YW4i6JuzU5sgt+wDHJ2jbejHI+b/YjYEnf
 YacnQLmisi6NYmpWIWx83F8j3+jfQ2OaFiGbv0T02uYHxoOwwFWSLINvyB7Kq4E9wDdl
 GaEg==
X-Gm-Message-State: AOAM532qcEZ0aZ2NCpW0SdZHvlsxO0NQCxbTtwlmwXLg9/SRLy6sxL/n
 KEkF9FIssQaoyxB3eXWZ5TEkliccA7Y=
X-Google-Smtp-Source: ABdhPJwaTBey9bpZ9AmC/SQpbQ2Mo2XG0wfBs2qFZCQEpcglsg18izme7dqw50u8nC+qIeW4gggpbA==
X-Received: by 2002:a17:90b:38c1:: with SMTP id
 nn1mr14304015pjb.224.1642485507614; 
 Mon, 17 Jan 2022 21:58:27 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id h2sm1141137pjc.31.2022.01.17.21.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 21:58:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/2] 2nd attempt at PR KVM + SCV and syscall
Date: Tue, 18 Jan 2022 15:58:19 +1000
Message-Id: <20220118055821.3065241-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The more I looked into system call emulation, the harder it seems to
get.

Second proposal is remove it entirely because it's already broken, and
just boot-time restrict SCV support if we run with PR possible, in hash
mode, on pseries. Unfortunately that catches Power9 PowerVM, but at
least OpenPOWER and Power10 by default is okay.

We probably have to do this as a minimal backport at first even if we
did later decide we need to fix things in a better way because it looks
like it would take a lot of work.

Any comments? mpe helped with looking at the tracing logic and history
of the code (thanks) but any mistakes are mine, Naveen are we on the
right track here?

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/64: remove system call instruction emulation
  KVM: PPC: Book3S PR: Disable SCV when running AIL is disabled

 arch/powerpc/kernel/exceptions-64s.S |  4 ++++
 arch/powerpc/kernel/setup_64.c       | 15 ++++++++++++
 arch/powerpc/kvm/book3s_pr.c         | 20 +++++++++++-----
 arch/powerpc/lib/sstep.c             | 36 ----------------------------
 4 files changed, 33 insertions(+), 42 deletions(-)

-- 
2.23.0

