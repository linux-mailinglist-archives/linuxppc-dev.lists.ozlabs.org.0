Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C81F34A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:10:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1Td3J1kzDqZq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:09:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zz5xcnnL; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JJ03N4zDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:16:47 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s10so9898905pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw3hijgKGm5uqDQXakaFslKK6j/104d/Ed/V5q80OGM=;
 b=Zz5xcnnLH+4JSO7ke5lpVl05P36bH8PwtFhbupTLuWczCg78oqGDM3Mck08tMWSnxL
 PLlGlylNHb2Lg0gLafkGm1/Uou5dhkeCJogoCIr7/CNMnn3Sv2sZpW0aZC98VxQpJWZl
 VDhcl1Ex4yfCdmUvizCEWhjbdYRQMG02yzDh8Ad6PnJ5sMAq2RbyCJmMemehSmw9OqAE
 krkbSuk8VUOL3O++79VZrHZYnVsSWmtvK0/i/0H5wHvqapWAF31D16KrWTz6Xamy/d9k
 fB7XWY3Bpw9Qw+V6LbMHcOaHSmiRfh9bjCPCWinxFvv42O59NqUJHCK0jMlGPEn/ICli
 T/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw3hijgKGm5uqDQXakaFslKK6j/104d/Ed/V5q80OGM=;
 b=i40sNwAztMohiQ0Fh/bz1TIUL/DRpRi91EvZA9+TFGRARbt8hOdsbTGz0ZV06cKQ/P
 mSLX7x4sTwIwXJvQXAn9Iyde+okYjMoPD8gGzzwN+ZOkgMQxczpMqYExeOG4M8Np0prB
 cjE443iTiVoWzSsG+lMUHPOLrE0idXsTV6SC9n2jyCE5Dbq4D0Td1rxWjef5XncJdKbq
 O5JWPj50MJpVxOrE2ZZqymGD7zzUOx9CS4xqa09WBCVsj/M4jTHo3MID/mNTslHLPicO
 vpW0/yLtdgpNGGM8PzGModfebtw8Mc/txK7s2ZwuIFKaDUOwXInB6gOysPL02KMZ20YV
 eV+w==
X-Gm-Message-State: AOAM533MZK9+88FhDsVo3KTsL49NzFnUwM5B6brVafkF2XcydzJcD/7n
 z1EUJuC7QC+ostcxn8jkClc=
X-Google-Smtp-Source: ABdhPJxOrGKxYFUlX+n/JlkqfUfJCQxIJJQxVj3BqeRAasIYOyYntmAieNtSgyCjtEaTSwkj4D+IXQ==
X-Received: by 2002:a05:6a00:14d4:: with SMTP id
 w20mr24722547pfu.279.1591683402831; 
 Mon, 08 Jun 2020 23:16:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 0/7] powerpc: branch cache flush changes
Date: Tue,  9 Jun 2020 16:16:24 +1000
Message-Id: <20200609061631.844390-1-npiggin@gmail.com>
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

This series allows the link stack to be flushed with the speical
bcctr 2,0,0 flush instruction that also flushes the count cache if
the processor supports it.

Firmware does not support this at the moment, but I've tested it in
simulator with a patched firmware to advertise support.

Thanks,
Nick

Nicholas Piggin (7):
  powerpc/security: re-name count cache flush to branch cache flush
  powerpc/security: change link stack flush state to the flush type enum
  powerpc/security: make display of branch cache flush more consistent
  powerpc/security: split branch cache flush toggle from code patching
  powerpc/64s: Move branch cache flushing bcctr variant to ppc-ops.h
  powerpc/security: Allow for processors that flush the link stack using
    the special bcctr
  powerpc/64s: advertise hardware link stack flush

 arch/powerpc/include/asm/asm-prototypes.h    |   4 +-
 arch/powerpc/include/asm/hvcall.h            |   1 +
 arch/powerpc/include/asm/ppc-opcode.h        |   2 +
 arch/powerpc/include/asm/security_features.h |   2 +
 arch/powerpc/include/uapi/asm/kvm.h          |   1 +
 arch/powerpc/kernel/entry_64.S               |  13 +-
 arch/powerpc/kernel/security.c               | 139 +++++++++++--------
 arch/powerpc/kvm/powerpc.c                   |   9 +-
 arch/powerpc/platforms/powernv/setup.c       |   3 +
 arch/powerpc/platforms/pseries/setup.c       |   3 +
 tools/arch/powerpc/include/uapi/asm/kvm.h    |   1 +
 11 files changed, 106 insertions(+), 72 deletions(-)

-- 
2.23.0

