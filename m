Return-Path: <linuxppc-dev+bounces-6499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C73EAA45ED0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 13:25:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2tw71lYHz3bn0;
	Wed, 26 Feb 2025 23:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740572711;
	cv=none; b=kvMv7upq+MPizvtFp5iLa/sXfWEr/6qzfx2z0Jvw7gJby8jJwzdAinncHZMjpPPNbj35NiSI5ukGVB+De4TyEFpLI+aOT1jRMk+/VLcPqS6xINyT/5com2fKEgFPye4ZT0EnyXtpXgm77SOvGZbReH58uBil9nIfQMrHJysOKP8sS233ZG+vWwwwNRc8509hvrtBvmt+HyGeVagFCoPKqAtxscFEUtHzSmB8RaXGWRQSWR74adDjU2uvosdA0zT7vQvCIlNY3Zykc+jqxSJl+GWqh+0YPstsCuY4oFv5A4BP2Bnxv4KYw8CQDG8iDEk6pJRgnyVjwO6wO1P0wDg42A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740572711; c=relaxed/relaxed;
	bh=9mxtOTKYXM9++EznKJFw0LH+ZQbbA0koCKCRQD8Qu+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJy/ir9z3VUrWLyn0ufR9DaaiykEXIsDpnfy8L+GG2FNirsn51eNHw7VvmERXi3C382xdaS9HpaF7Os3cf/4O0cchKFrj1YAdkFKS/D+PNTHD1E3SF2+3so4YhC87V5wHYnv80kajcDcwFDqoZin2rKYXSWeoCcblzzSyQ2uM7oSRMoDzvwuMqVY84j4RO9JI3tOI6Yuv6cHgaLJ8gqFs1pdgP76Mo9zsJKSDQwqhkmO6LUw4KWRU7WOt/e3Dmmo73llMF9+EqBGAbjdm5Yq0BgSaeklM6hVW2XRLqjNuPPCGb/Y/Hix5Uoj/b/MwW1GYJM0fgSud8+Y+VAVrW02dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2tw646lrz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 23:25:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77DF42308;
	Wed, 26 Feb 2025 04:24:55 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.40.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 300E63F5A1;
	Wed, 26 Feb 2025 04:24:33 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH V3 3/5] docs: arm64: Drop PTDUMP config options from ptdump.rst
Date: Wed, 26 Feb 2025 17:54:02 +0530
Message-Id: <20250226122404.1927473-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226122404.1927473-1-anshuman.khandual@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both GENERIC_PTDUMP and PTDUMP_CORE are not user selectable config options.
Just drop these from documentation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Steven Price <steven.price@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/arch/arm64/ptdump.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
index 5dcfc5d7cddf..51eb902ba41a 100644
--- a/Documentation/arch/arm64/ptdump.rst
+++ b/Documentation/arch/arm64/ptdump.rst
@@ -22,8 +22,6 @@ offlining of memory being accessed by the ptdump code.
 In order to dump the kernel page tables, enable the following
 configurations and mount debugfs::
 
- CONFIG_GENERIC_PTDUMP=y
- CONFIG_PTDUMP_CORE=y
  CONFIG_PTDUMP_DEBUGFS=y
 
  mount -t debugfs nodev /sys/kernel/debug
-- 
2.25.1


