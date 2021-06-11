Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B43A3F3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 11:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1bS33bd1z3bwS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 19:40:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=K6l4dDzX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K6l4dDzX; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1bRZ6SQHz3033
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 19:40:09 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id 69so2560206plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DG/MZpO/hjtRvZGvdauW0MMB98XC9pxZIIemqr9D2mA=;
 b=K6l4dDzXLv2kRPUWY+K+kCWFOxlkADsmtqAMwlZC8uBxi/kMiKxvPWGvDZuQyOPmEj
 U0M+oAk6szrx/Hjyua7kTrCnQjbm9jT9OrD6OTFpcA3hP9GOZhnTLh32K/bb/s0HUEHN
 QDKYMwkjMCj9Znapr6ItdpAjCpc72EKiQTrcvigX8TJ45XRNRwfHw2tjNNrnGnwWuHcR
 NSwXrONKzknwFGiQjvo3zKuTnFbnjCtNVnNWg+erbFCYZlSKrOLx+NrFhe7Ri9Y5TpJP
 p5E3Gkp18DeYOuDqHU1NeZXSF1rvZGsC4l4dSdYe3bi1ZA52sx9PxyVk7CcsoK3Tv3q8
 Qp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DG/MZpO/hjtRvZGvdauW0MMB98XC9pxZIIemqr9D2mA=;
 b=JASIK/PHeZUMM7kvmw0xdbxPRzaWgTXy/9AK5mLDqTwVqW4a3Sd5KaZlWF6UmzNSl2
 glrX2YzS50IFicg6Nc4shKw9BzT9P0ChGAn9tDj7ukizgQtDGqLSmh/eB45x14oLEa83
 NXSBJgnhz0Pd/v9pH5Xb7rlt7lhCdIciKYqofYxOqe5jWu1PHSLxNH/VtZ5o7Pp5L6jZ
 czJBaqGy3pciROKsaWfLJ7DVleWFM1CxZCsm2WB3ZkP31gruFVZUDlQYVFPDNFS/IXFY
 9ZA0OIqrETaLuiEl6hmeT8hwhkEK8MDK62XiJ1fRVE7rVR1+KRQasge+wnYGjBIofIU2
 pBsg==
X-Gm-Message-State: AOAM532ukq6rosU4x8EDiP0mugYzW2A7wMkaXOOuYjg689puf8AUjvGx
 BW9F5p/p77g6jUdrWlbgpQHzF32L4eU=
X-Google-Smtp-Source: ABdhPJyEwqk0A+dK/0pGaDhp/W57VGpZrx4ClsHT1p6EcCGweSbpc4HRj2nQw5wGt7SiWKInHbF0aw==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id
 y18-20020a1709027c92b02901112ca83d8emr3093148pll.77.1623404406142; 
 Fri, 11 Jun 2021 02:40:06 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id o139sm4981655pfd.96.2021.06.11.02.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:40:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/2] powerpc/64: Option to use ELF V2 ABI for big-endian
Date: Fri, 11 Jun 2021 19:39:57 +1000
Message-Id: <20210611093959.821525-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since v3 I added Michael's module check for ELF ABI level. This requires
a change to core module code. If Jessica is happy with it it could go
via the powerpc tree.

Thanks,
Nick

Nicholas Piggin (2):
  module: add elf_check_module_arch for module specific elf arch checks
  powerpc/64: Option to use ELF V2 ABI for big-endian kernels

 arch/powerpc/Kconfig                | 22 ++++++++++++++++++++++
 arch/powerpc/Makefile               | 18 ++++++++++++------
 arch/powerpc/boot/Makefile          |  4 +++-
 arch/powerpc/include/asm/module.h   | 24 ++++++++++++++++++++++++
 arch/powerpc/kernel/vdso64/Makefile | 13 +++++++++++++
 drivers/crypto/vmx/Makefile         |  8 ++++++--
 drivers/crypto/vmx/ppc-xlate.pl     | 10 ++++++----
 include/linux/moduleloader.h        |  5 +++++
 kernel/module.c                     |  2 +-
 9 files changed, 92 insertions(+), 14 deletions(-)

-- 
2.23.0

