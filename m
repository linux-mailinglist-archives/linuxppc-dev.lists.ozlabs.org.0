Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF537159E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:03:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYjp04TBHz30Gb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 23:03:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VcsGOPeW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VcsGOPeW; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYjnX1Pszz2yQq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 23:02:53 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id y30so3524221pgl.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5MoALY1xrhNG4EhyRfiTojMzytneQQ0UwGMNVmCBthc=;
 b=VcsGOPeWugXHkdyuMKClEoc41yG/qXl6LcZOekWrUlqkDDqaMXbkzF5COVgoz9mPfP
 PjtpeKValYQLjqYBGkCY+a2Y1tm94vGWyc0EXcg771liE5tyzyomB5RyPgAqaTLcKtT0
 nRMjHUb01Z1ulXKXNWpLn/q/z9V2Pv9TgFGqxtvVGpwa6ygTLuQ70owfkk7ndx1deeVF
 CQm1ulVDNXr65t67cB7H8KHUegJeM5GP4A5aaAXgHLxcCBSnsxT7HafhaEXDxTa060Uw
 d1bTfJFK+JpP/aqJYZhwDBsOpu8YsrKld5yvUnzglmziqARxA4qFa1wwb2wlnp7KHScP
 y1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5MoALY1xrhNG4EhyRfiTojMzytneQQ0UwGMNVmCBthc=;
 b=ajAFuRSDx174+erb7ndaVeMn3L4X0y8W/L9M2BuwlD59/TpBTGuVSB64h53bkgkHMQ
 zKMERnbCe6MTlyHRsWNEjZrQCuTr/DpNaCxSfDEJikfymRADxbdp6O3G3RH7UrqZNt8e
 fZX1pbHJ0JzGd+L28bmkl8Z/1dMiOHPM6i02DrDMoQKQiYbyZ6/NSgZhb3GgqmAdyU1F
 6fnhfB9MXRfGqw+3x/19pkobwy6PlB7XwkOcyuQ96fi74D19tWMnbvZm8+yNYzsxJ9h+
 bhfmjAWDJssRZPnEbUhyAg8rZeBjCjYUF2ombJSWvqTM7SxmhC4yqqMQG/Bhdgu9pwRU
 4i4A==
X-Gm-Message-State: AOAM532XCcGc9munNhsISiR4cPrHQLY0Ns+sb2TeY8IUGhA+7mNwGPOj
 BTUteCnydPL5nHelAH7JZ1rp1Lam2qs=
X-Google-Smtp-Source: ABdhPJwV+AmKPxeO+dkQ9cjX5La4OKN2NjDl6/X7tGa90dwJckje+rCsRyajZmDQ5+LIMp4OHZd9wQ==
X-Received: by 2002:a65:4c8e:: with SMTP id m14mr17625891pgt.377.1620046969253; 
 Mon, 03 May 2021 06:02:49 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id f1sm18069053pjt.50.2021.05.03.06.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:02:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc/security mitigation updates
Date: Mon,  3 May 2021 23:02:39 +1000
Message-Id: <20210503130243.891868-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds a few missing bits added to recent pseries
H_GET_CPU_CHARACTERISTICS and implements them, also removes
a restriction from powernv for some of the flushes.

This is tested mianly in qemu where I just submitted a patch
that adds support for these bits (not upstream yet).

Nicholas Piggin (4):
  powerpc/pseries: Get entry and uaccess flush required bits from
    H_GET_CPU_CHARACTERISTICS
  powerpc/security: Add a security feature for STF barrier
  powerpc/pesries: Get STF barrier requirement from
    H_GET_CPU_CHARACTERISTICS
  powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess
    flushes

 arch/powerpc/include/asm/hvcall.h            | 3 +++
 arch/powerpc/include/asm/security_features.h | 4 ++++
 arch/powerpc/kernel/security.c               | 7 ++-----
 arch/powerpc/platforms/powernv/setup.c       | 9 ---------
 arch/powerpc/platforms/pseries/setup.c       | 9 +++++++++
 5 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.23.0

