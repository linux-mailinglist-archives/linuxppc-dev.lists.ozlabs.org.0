Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1A1CF385
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 13:41:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LwqH4WmjzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 21:40:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Lwl873s3zDqcL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 21:37:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lwl82xdbz9sRY;
 Tue, 12 May 2020 21:37:24 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: mpe@ellerman.id.au
Subject: [PATCH 0/4] Base support for POWER10
Date: Tue, 12 May 2020 21:36:10 +1000
Message-Id: <20200512113614.28169-1-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: mikey@neuling.org, aneesh.kumar@linux.ibm.com, clg@kaod.org,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series brings together three previously posted patches required for
POWER10 support and introduces a new patch enabling POWER10 architected
mode.

Alistair Popple (4):
  powerpc: Add new HWCAP bits
  powerpc: Add base support for ISA v3.1
  powerpc/dt_cpu_ftrs: Advertise support for ISA v3.1 if selected
  powerpc: Add POWER10 architected mode

 arch/powerpc/include/asm/cputable.h      | 17 +++++++++++++++--
 arch/powerpc/include/asm/mmu.h           |  1 +
 arch/powerpc/include/asm/prom.h          |  1 +
 arch/powerpc/include/asm/reg.h           |  3 ++-
 arch/powerpc/include/uapi/asm/cputable.h |  2 ++
 arch/powerpc/kernel/cpu_setup_power.S    |  2 ++
 arch/powerpc/kernel/cputable.c           | 21 +++++++++++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c        |  6 ++++++
 arch/powerpc/kernel/prom_init.c          | 12 ++++++++++--
 9 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.20.1

