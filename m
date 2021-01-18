Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD12F99F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 07:33:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK26M3bM6zDrCH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 17:33:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fh1OGZ6V; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK20k6wR1zDq63
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 17:28:19 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id be12so8088315plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 22:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRAgrTksAYQNvbWip9py1mZp/2xK3ua+1beJBsrSWMM=;
 b=fh1OGZ6VmilFB3O12ZNGshOCyehK0ITYFspIAXC1hXp/hoAIhIl5H27AInOt70YjqP
 KBqiiUyHzpeKFT2Y8uU7WPLCaOFpXReYXsnx0OnBA0to8xezy5fgek1FAieTXkdDfBcZ
 Hpt8ESzHtTVyZsZIsXOURGGweKg5L4QG4JVivmfKPNJzvTHv4DhKKp6aEGIb0WSfe6RN
 19o4W2xLUo/mulrPsOZTEtuxR2vwGtYjh7SPu03sixVYtJ3S2XcMcPhqXqlyKF7nin51
 AnjAuy+OXrkzUdMLXXb6RZQc2As8NFNNYw/0ZETLOjzxG8qXWI0WHfWxa0elDbtn0dUQ
 h8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRAgrTksAYQNvbWip9py1mZp/2xK3ua+1beJBsrSWMM=;
 b=OjbCkcX77h9gkzpQmXkink4xOCm0ilid/+CoHgRGbdLe6mrCCY1XDDhB+kD1zzlDNo
 v6ye3kWWEuAWrLM8zSF9Q8t7U642+zHWSFbNU1+qOjTybhPNMxYUgvRBWH/13BBxgbby
 0F024JL+xmbJMxdT82WQLzWZasEhmXJ671Jy8wbYw14VDs0bZcmsnGOJELzdxWcAAsyT
 r+T4AngY4vO9u6CV40a3iIeVOH6FkttoRsM6VAbiJYSLSwLC5Nf76NV7uXEeJAJcx20S
 PbPSHpa5sI2VyJptOmd+t5chuKFrUBCAVslKTtOTSK3qiGiv1GIoYQ6X6WtCBFtJbcJs
 9FWQ==
X-Gm-Message-State: AOAM531SfF63h6zBs0uhs7lTt6sCUgSDtQ4fK2GTP9JU6+sEGV1/JNQO
 FTfB0zVUIJFA5qh/6QVM31c=
X-Google-Smtp-Source: ABdhPJzxZHvytwO8Dl/Gzy5h94PZV0SxmXUn6Gnqaz7IBSnjEoCKtf25iuBJfak7AWpSDtCp3sAEOg==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr25191330pjb.199.1610951296056; 
 Sun, 17 Jan 2021 22:28:16 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id w25sm8502318pfg.103.2021.01.17.22.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 22:28:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 0/4] a few KVM patches
Date: Mon, 18 Jan 2021 16:28:05 +1000
Message-Id: <20210118062809.1430920-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These patches are unrelated except touching some of the same code.
The first two fix actual guest exploitable issues, the other two try
to tidy up SLB management slightly.

Thanks,
Nick

Nicholas Piggin (4):
  KVM: PPC: Book3S HV: Remove support for running HPT guest on RPT host
    without mixed mode support
  KVM: PPC: Book3S HV: Fix radix guest SLB side channel
  KVM: PPC: Book3S HV: No need to clear radix host SLB before loading
    guest
  KVM: PPC: Book3S HV: Use POWER9 SLBIA IH=6 variant to clear SLB

 arch/powerpc/include/asm/kvm_book3s_asm.h |  11 --
 arch/powerpc/kernel/asm-offsets.c         |   3 -
 arch/powerpc/kvm/book3s_hv.c              |  56 ++--------
 arch/powerpc/kvm/book3s_hv_builtin.c      | 108 +-----------------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 129 ++++++++++------------
 5 files changed, 70 insertions(+), 237 deletions(-)

-- 
2.23.0

