Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F260369368F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 09:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PF1Ld5pMlz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 19:47:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MT3LIRf8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MT3LIRf8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PF1Kf5Cclz3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Feb 2023 19:46:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEECD60C4B;
	Sun, 12 Feb 2023 08:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FB0C433EF;
	Sun, 12 Feb 2023 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676191586;
	bh=ah2GfV04TNaeo9p4bKcxyFBZTnmc5HbVuYgTsk1ZZFQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MT3LIRf8bJTXYDiK3G1TVA1CKbwwEe0DllUzU7AH1ati2qxAOPPjau6Q9V+1qD712
	 9phIFR2qApBCOCf907VbVd1Vzgi8Kkvymd8e38sooTWXCnTAtIO84w+/+6hlc/B6lp
	 Vs5cDzwUxMsjjH4ii6tmr6lQu5fAuwTpgoYB+9Li1kyMTuxy7KqTk8M0RXCVTqlXNd
	 8MpWrajJGzrj03wUITE461o00r7HJBYuEU1MCW+665ubHQF9TFoiVdlzQjftA9EIyk
	 MG5uK31epum7kES7DHzqtYo8SozcgREgID6KFZbc+HSs8IRssKkUVoY0KoNb82sniK
	 kpwrKzPXcN5Uw==
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/2] char/agp: consolidate asm/agp.h
Date: Sun, 12 Feb 2023 10:46:09 +0200
Message-Id: <20230212084611.1311177-1-rppt@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, David Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

asm/agp.h is duplicated in several architectures, with x86 being the
only instance that differs from the rest.

Introduce asm-generic/agp.h and use it instead of per-architecture
headers for the most cases.

I believe that asm-generic is the best tree to pick up this patches.

Mike Rapoport (IBM) (2):
  char/agp: consolidate {alloc,free}_gatt_pages()
  char/agp: introduce asm-generic/agp.h

 arch/alpha/include/asm/Kbuild   |  1 +
 arch/alpha/include/asm/agp.h    | 19 -------------------
 arch/ia64/include/asm/Kbuild    |  1 +
 arch/ia64/include/asm/agp.h     | 27 ---------------------------
 arch/parisc/include/asm/Kbuild  |  1 +
 arch/parisc/include/asm/agp.h   | 21 ---------------------
 arch/powerpc/include/asm/Kbuild |  1 +
 arch/powerpc/include/asm/agp.h  | 19 -------------------
 arch/sparc/include/asm/Kbuild   |  1 +
 arch/sparc/include/asm/agp.h    | 17 -----------------
 arch/x86/include/asm/agp.h      |  6 ------
 drivers/char/agp/agp.h          |  6 ++++++
 include/asm-generic/agp.h       | 11 +++++++++++
 13 files changed, 22 insertions(+), 109 deletions(-)
 delete mode 100644 arch/alpha/include/asm/agp.h
 delete mode 100644 arch/ia64/include/asm/agp.h
 delete mode 100644 arch/parisc/include/asm/agp.h
 delete mode 100644 arch/powerpc/include/asm/agp.h
 delete mode 100644 arch/sparc/include/asm/agp.h
 create mode 100644 include/asm-generic/agp.h


base-commit: 2241ab53cbb5cdb08a6b2d4688feb13971058f65
-- 
2.35.1

