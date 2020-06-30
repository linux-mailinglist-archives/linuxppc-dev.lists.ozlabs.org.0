Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A425420F3D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 13:52:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x2m62MQzzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 21:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sv5METmc; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x2k60gFXzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 21:50:51 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id j18so18519677wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 04:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2kaWfnNvd2hN2fmZl/iANXKvq3Zrz+qKXWCTOlr4ZQ=;
 b=sv5METmcUNlVPL/aF13yHN3RqTEDxyG7/q2ECvPsTEirhsBYrD8bvvnpPRSjeGjFB8
 JmWn5L5WpSXZW+e8A7oIxPlEngvk5HSJt3GaoLlrHHDCjxuSGGtqy12ELnDPgvHF+Xoo
 GCPbEn37jqhnTSCSVN6rQ8PA5enmiryKt9xjLw0Rw1QcTaKlknuZjGdd+QEOdbckgKJm
 CfEFyNn3f/SbCi7AF2mgOMvzBO72r2mQRoXHHDw6JncweKSnEZZkXAuWH/8VQbJPagj1
 QC5DEACTyIuIPgj11L5cdGLCKpNW/Wo1GHFtY7pQTL/v88z3c9ArhH1JBaWJY+fdDHHK
 GCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2kaWfnNvd2hN2fmZl/iANXKvq3Zrz+qKXWCTOlr4ZQ=;
 b=uWalKQ2ROmvxYZ6EAgqCeQouleS4DupSgwnwVLZQYBYlhnmqcXx8kvvlq5cZeVXJtD
 m0OW1hOwsRw8VVAInbrYmwJvtkQ+GytB6ORvy55uQzWFOcOGRGAMoTRma4HZweeovAC8
 OhXyC57ULn1Cl/PrLdah23aI5lsn02H/B730sd8peYkGYO1HCNUDkL8g3yuaJYwt6v4G
 GJ9g+wmCiwGJP8F/FoGXdngMfutJzHUqUeQWfZS9ynCTFuQT5MNoeiO+1n0mDue2znvP
 9AhjQM+7sRr0FuabdW9PjE3dXW6OAmkEL8JAfaXGsstxdP0UwkPKm/gA41l6Ah5uBxja
 Xj6Q==
X-Gm-Message-State: AOAM5324gxch0ZiKg1sRJgjYHJtmtmtn0akpmpUFsyPWK6SnOCBGzEtc
 z3WRWZ7/fiwmBjAg9TFpfUGUS+2r
X-Google-Smtp-Source: ABdhPJy4nPCZZHjQR/ImHJv5iiYOplIlPtzwEscgSm2rMCey7bQHLnriQSfQbHJg8/bFfHmIs+IqoA==
X-Received: by 2002:a05:600c:294a:: with SMTP id
 n10mr20315557wmd.38.1593517848074; 
 Tue, 30 Jun 2020 04:50:48 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id c25sm3133673wml.46.2020.06.30.04.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 04:50:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] powerpc/pseries: IPI doorbell improvements
Date: Tue, 30 Jun 2020 21:50:30 +1000
Message-Id: <20200630115034.137050-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Anton Blanchard <anton@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since v1:
- Fixed SMP compile error.
- Fixed EPAPR / KVM_GUEST breakage.
- Expanded patch 3 changelog a bit.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc: inline doorbell sending functions
  powerpc/pseries: Use doorbells even if XIVE is available
  powerpc/pseries: Add KVM guest doorbell restrictions

 arch/powerpc/include/asm/dbell.h     | 63 ++++++++++++++++++++++++++--
 arch/powerpc/include/asm/firmware.h  |  6 +++
 arch/powerpc/include/asm/kvm_para.h  | 26 ++----------
 arch/powerpc/kernel/Makefile         |  5 +--
 arch/powerpc/kernel/dbell.c          | 55 ------------------------
 arch/powerpc/kernel/firmware.c       | 19 +++++++++
 arch/powerpc/platforms/pseries/smp.c | 62 +++++++++++++++++++--------
 7 files changed, 134 insertions(+), 102 deletions(-)

-- 
2.23.0

