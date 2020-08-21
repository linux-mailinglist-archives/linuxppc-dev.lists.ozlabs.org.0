Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D624E035
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 20:59:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY9mP0qwFzDrK5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 04:59:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=anastas.io (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.a=rsa-sha256
 header.s=mail header.b=UryH8jvs; dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY9hj0ckKzDrH6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 04:56:04 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id B3E167EC09;
 Fri, 21 Aug 2020 13:56:02 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1598036163; bh=xA0mm6NPFMrcszqwEO3AkZw2UQRCjKyu8EhvnHTSX6g=;
 h=From:To:Cc:Subject:Date:From;
 b=UryH8jvsi750sSqvu5+xvxVnt969zQzXFFLTpyLWC9dnhWfk3SUz9wBhG5Y/b2fZP
 CcjNqAlJbZpC1cKdggwtVHtBf/pwm+BHY3UmrgITG1aOfCTuOhUNm0zuLhWlxv0QaC
 RJPe7RpWnllVRZsFUfGlc8lofy5++18C92GybFPQxTHtXxIDus5fNCBFyy/7O9cjDE
 TRqOmlI1MNpzC3YWE5JQHlMrVAh8PL1byvmpWFYF1Dusx/uDI/em7ZuyfROZtsSok5
 VX69+/67s+KHTJsPFwUh5jTI2pjna6cl6FwurB0ig2lKdO/WLEFSSBaxRTwBxIGHew
 6sIGKa7bblxcA==
From: Shawn Anastasio <shawn@anastas.io>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] Reintroduce PROT_SAO
Date: Fri, 21 Aug 2020 13:55:55 -0500
Message-Id: <20200821185558.35561-1-shawn@anastas.io>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes in v2:
    - Update prot_sao selftest to skip ISA 3.1

This set re-introduces the PROT_SAO prot flag removed in
Commit 5c9fa16e8abd ("powerpc/64s: Remove PROT_SAO support").

To address concerns regarding live migration of guests using SAO
to P10 hosts without SAO support, the flag is disabled by default
in LPARs. A new config option, PPC_PROT_SAO_LPAR was added to
allow users to explicitly enable it if they will not be running
in an environment where this is a conern.

Shawn Anastasio (3):
  Revert "powerpc/64s: Remove PROT_SAO support"
  powerpc/64s: Disallow PROT_SAO in LPARs by default
  selftests/powerpc: Update PROT_SAO test to skip ISA 3.1

 arch/powerpc/Kconfig                          | 12 ++++++
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  8 ++--
 arch/powerpc/include/asm/cputable.h           | 10 ++---
 arch/powerpc/include/asm/mman.h               | 31 +++++++++++--
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  2 +
 arch/powerpc/include/uapi/asm/mman.h          |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  2 +
 include/linux/mm.h                            |  2 +
 include/trace/events/mmflags.h                |  2 +
 mm/ksm.c                                      |  4 ++
 tools/testing/selftests/powerpc/mm/.gitignore |  1 +
 tools/testing/selftests/powerpc/mm/Makefile   |  4 +-
 tools/testing/selftests/powerpc/mm/prot_sao.c | 43 +++++++++++++++++++
 14 files changed, 108 insertions(+), 17 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/prot_sao.c

-- 
2.28.0

