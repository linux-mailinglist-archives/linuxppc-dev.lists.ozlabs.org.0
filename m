Return-Path: <linuxppc-dev+bounces-10562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6BB19F72
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 12:07:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwXLF3dNNz3bkL;
	Mon,  4 Aug 2025 20:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754302069;
	cv=none; b=kAml32XCGOdF2KXKtkL7F0ZJGRiiFT2nELmRAm10G/v4tNJqaAyoayLchTIvgmvHHvnOtE8mVOp3/TCOGHQx+C4PbAbhggFtoUH+a+bOoZoKC+p46jqHkC/YYVv28YmsxRV3YhKTD2Es3IO5CAuHPSchFCIZFkUT5VMMJe2tgMinhhBB3DE9AX7lM/B1Ff18U4++6sI7tFx+9x3zYIDwhtKwXWZH75p2YOmBsAcfBjhEwyuCbxuU8Aj7TTBaNTcyMTTOW+PdNZg0oZI1TqDSWeOWsMxS0v3JQg9j15woIf2AMNTw5q1keKxmknvxM9vT05IHT1K8lVOvMuAju9qa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754302069; c=relaxed/relaxed;
	bh=ZTnQxU/+fvPQHh07xXw/q8Ljo18bwpIP+5p0y/uzJuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lTn7pktbanFabVGK9uWkyAoyVzeD6M92afEWafnFQ3WBCWqhSMEr9SyG4S8ryoQ25WKT7/diPS9/3blH2dtwswrKRfT+k6iabus2i2E4oJ8brHhGWeaP1A4kYHsVyWYOVbktSrZr8Ui/fkS1bMqBvvKEtCnxbokjd2jM29l+mJPYxrkmuH4M1J2BsZsDt3OK3POtS794rERFAL2uQmsE0n5IwkBwF4GpRtMTo6/ElwomLQA3vw8eCOHdlaRL5gN5N6CYDU/x5RnElzGCw+edMKNaNLDVuO6DXuLt3YgIA6H5zN5KWQHuwigAre/yWXCDQu5Q3SixcfeZC5etprvfdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1YOH862l; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R/iaxWir; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1YOH862l;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R/iaxWir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwXLD5xpFz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 20:07:48 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754302056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZTnQxU/+fvPQHh07xXw/q8Ljo18bwpIP+5p0y/uzJuQ=;
	b=1YOH862lXgJ6Yzd9uzj36Y2Y0n4NQKFOjKq5h9CQIYcl/wYh/PpUr04G3RwN6C6JujYU3S
	yf8Xp3T++slKeXJCIZJb1PC21DQk2yc6TlNfu9c5T9nColNoo4WfaZD/Ekou31yXxsPteG
	fpuvp3SAiJyNYvyo+6IT289R6udGLubncd4Jean0DWqQZ3SNH5yPj2BGo1E3HKJ98LIOpm
	eSgN2qgMUrgb8/kdh+Mi3MJ/K7FyWHz7mpdOvQY4KYuJUHfvUQ/A6qalkjOVcrRwXmN4l8
	NuxI2s6kAZ/13tZ7kHBlJFGLWp/+c9QsAQLhZcOegmZ9RGMtNlm/6czALLFcSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754302056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZTnQxU/+fvPQHh07xXw/q8Ljo18bwpIP+5p0y/uzJuQ=;
	b=R/iaxWirDxFx2wC6QCKPGIhK9e7WNMAb+vv/5GOz0izYZcCnxH2kgdaDG94iHyZBNfe9vV
	n2ZUTX8XceR4dLAQ==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gautam Menghani <gautam@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/2] powerpc: Fix integer underflow & leak
Date: Mon,  4 Aug 2025 12:07:26 +0200
Message-Id: <cover.1754300646.git.namcao@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

This series fixes integer overflow & leak problem. I noticed this problem
when Gautam reported a kernel bug with another patch series of mine:
https://lore.kernel.org/linuxppc-dev/aH9Na8ZqrI0jPhtl@li-c6426e4c-27cf-11b2=
-a85c-95d65bc0de0e.ibm.com/

The root cause of that report is a bug in that series. However, that bug
triggered another existing bug, causing the reported end results.

Nam Cao (2):
  powerpc/pseries/msi: Fix potential underflow and leak issue
  powerpc/powernv/pci: Fix underflow and leak issue

 arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
 arch/powerpc/platforms/pseries/msi.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.39.5


