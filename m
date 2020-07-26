Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F122DB96
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 05:53:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDpvb5C2FzDrdT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 13:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JxQpDO4s; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDpsm4NTJzF0QP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 13:52:12 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id j19so7518438pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 20:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SX3waSOwvWtbt+qxV9rfiwGFPf3TjuzEFNm2XiZC97k=;
 b=JxQpDO4sXaL0H2Y086nSrR/yZLDTlovI1PalJRgKsHrkkFCozRBzrp/M4b61ECkQ1X
 EK2klsT7w3EZZX+WfFtK2yc+HDkN4Sh4/C0p86KA0xxia6N0jKoYB3SpRxDfBFyz9yx5
 0d1qQwR2LHw+IuE9y6OKs1rFDK675578lX4OyW0hjm9ouHhljN4VySR2JIqCuVD7lMCg
 llgi+STum88sZ9g0zbttirvyBQoNI/r7PBDQxOvcTv3W9tO0vHSStpD0c69FO3HtKFbN
 J6aFK5E+pvT3giwX2ROBi4uyTUbY8TBm5puKXimxbqGmTQ0r3KT6Fcl1CNQVHNQ+UFGv
 y8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SX3waSOwvWtbt+qxV9rfiwGFPf3TjuzEFNm2XiZC97k=;
 b=PkosFJUROdgKwEbBRbHrMaoBorl3Lr0GLnOAmMnDpenJFZCLCGs8fmeJh8leg1a5tW
 dnZe97C0GU+rGSUa3Enzh4U9X4SxQjh8VNCehHEcH5MBLHIY3N9Pn6vfiKDxCaSzs+1E
 DOURueehfs/E1qN1d2VXiMV/zhARQQ/9Bon3Iq6rbYkc72HI5qYEtbUAn0Na5e68MmxY
 uldkweFfRiImEjcQwmUCV3uitLFFtd0lzZdymj9bx/g9YTpIHq1J9EYbWgQT+RnuTiyZ
 80NBFzk+jD2s3JCKOITUMtVYH45uAu3KxLX1RhNBdPPHkbbZIlsJyoCyHl4znMoVrXIC
 8f/w==
X-Gm-Message-State: AOAM530+1OUF6UT7WnF+vhsFNkd/W7foWl6jRO2UKAl+32dtoB2sjhfm
 fD5p8WjiitjniN4lHGDja+qJ/D21
X-Google-Smtp-Source: ABdhPJw7sKVaB5XsX4EFRVYUpFw8L8U00v6SelmOIRTuyaS2qGaZjYzkcRozLB105R3VTvJQ9sw3nQ==
X-Received: by 2002:a63:8949:: with SMTP id v70mr14345804pgd.256.1595735528747; 
 Sat, 25 Jul 2020 20:52:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id p1sm3638860pjp.10.2020.07.25.20.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 20:52:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/3] powerpc/pseries: IPI doorbell improvements
Date: Sun, 26 Jul 2020 13:51:52 +1000
Message-Id: <20200726035155.1424103-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Anton Blanchard <anton@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since v2:
- Fixed ppc32 compile error
- Tested-by from Cedric

Nicholas Piggin (3):
  powerpc: inline doorbell sending functions
  powerpc/pseries: Use doorbells even if XIVE is available
  powerpc/pseries: Add KVM guest doorbell restrictions

 arch/powerpc/include/asm/dbell.h     | 67 ++++++++++++++++++++++++++--
 arch/powerpc/include/asm/firmware.h  |  6 +++
 arch/powerpc/include/asm/kvm_para.h  | 26 ++---------
 arch/powerpc/kernel/Makefile         |  5 +--
 arch/powerpc/kernel/dbell.c          | 55 -----------------------
 arch/powerpc/kernel/firmware.c       | 19 ++++++++
 arch/powerpc/platforms/pseries/smp.c | 62 +++++++++++++++++--------
 7 files changed, 138 insertions(+), 102 deletions(-)

-- 
2.23.0

