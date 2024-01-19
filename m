Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C88327A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 11:28:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=EBr3DBT9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGbSJ2lNmz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:28:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=EBr3DBT9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGbRP5G7Lz3br3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 21:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:To:Subject:From:Message-Id:Sender:
	Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=izVHNTruKOO5a73FHruP4Jb+1x1kABQh10pCGRlLuzo=; b=EBr3DBT91Jz4t+bVCIInUFB63K
	XwaxTcd/oB1/BZHe7CeT7eb3GUBd9IRNlLoi+uRHcwh0+BlBxM5kdry+wNvnjxZmrP38RvFs2iBNG
	6sRf9AKjyXeddMK+OsAVA5HdRUCszUpcGwkW/uNFkPLbPA2ZAMkCuoIfW423Pk6q7Oa4UdrVBs0hP
	IRlq0tRsSf2LcOu3JJNtFBOre6vC1tCQ9aV4fR1X/MN8PVq+nMyb+XxQshZ3P9SSAhg5HoAVHxH+E
	FY2LEAFI9duGawgQZE86q6ADsD38NKseA+WmzRl4UMopO7NJAXKfGSFSQkck7a/99CCAlfpriOtSv
	uCdfwJMQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQm6J-00000000F9r-1F7H;
	Fri, 19 Jan 2024 10:27:51 +0000
Message-Id: <cover.1705654669.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 19 Jan 2024 17:57:49 +0900
Subject: [PATCH 0/4] powerpc/ps3 Add ELFv2 support
To: Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    linuxppc-dev@lists.ozlabs.org
Date: Fri, 19 Jan 2024 10:27:51 +0000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following changes since commit 44a1aad2fe6c10bfe0589d8047057b10a4c18a19:

  Merge branch 'topic/ppc-kvm' into next (2023-12-29 15:30:45 +1100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-elfv2

for you to fetch changes up to 983836405df1b6001a2262972fb32d1aee97d6f5:

  Revert "powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2" (2024-01-19 17:53:48 +0900)

----------------------------------------------------------------
Geoff Levand (1):
      Revert "powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2"

Nicholas Piggin (3):
      powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
      powerpc/ps3: lv1 hcall code use symbolic constant for LR save offset
      powerpc/ps3: Make real stack frames for LV1 hcalls

 arch/powerpc/configs/ps3_defconfig  |   1 -
 arch/powerpc/include/asm/ppc_asm.h  |   6 +-
 arch/powerpc/platforms/ps3/hvcall.S | 298 ++++++++++++++++++++----------------
 3 files changed, 171 insertions(+), 134 deletions(-)

-- 
2.34.1

