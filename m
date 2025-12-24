Return-Path: <linuxppc-dev+bounces-14995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8606CDC1AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqFV0GdJz2yFy;
	Wed, 24 Dec 2025 22:21:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575277;
	cv=none; b=QcBzy7lbJ9+rwzQMwFJsHsnFslFoJXPiJiW+T+Rn4/IXkPwX5CZGRR8FerszW1/BI/8XvCKO5EkbuaP537wKAiU6f2TKuO6+IPtZWZWVggtTGM3meAmM3dBFlxh+oAdB/LSM/zPOS4XoPR88ACigCB2EDlrSk2VZYqgUIe6Y+GvDiCnejELtI8pnMGBKTObUEfEklMd/0kcgC6KJgnwJb418dLJo8bBUqW7g8uCtYvefH1GCOQf3imj65ielqSJd6cZsb3kmFH4qeFhJXqeBEw14WRZeZsAKnp6SpVJdbIL6sZGXefcpIIoNVQ7qoy9a/LrUtSBANZftMfKbR7c13w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575277; c=relaxed/relaxed;
	bh=1fJgGxesbP1yQnFYKS+UIjTlY0El9OKpyVjFyyoZRdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwFkpnVhAz+58JcC7y/411U8EMC09LMeiiZa8bD6w48dGw/Z5SmVrgVDjBkYubgqp+eq2fBnPZ9Tm1USwUXs98Iw4a7cGaBpdX+TGn+IrAPmZONW6wiSjzvjCs5SzhfRq/wl5DzxWuEMeo1LWFmxNYgyMziFC1XmhrjFqwcZnnbu1N++MSghNkg4U2YvaUbcVQoPm9OUH6I5R7MqkOIBKQ9AZPo1wWaX8gbn4XJTryhb1PTc0PRXwtfmWchuVl71sLp9CZF+ZvQr+NJviDLR0o+jKpEXm/BzOL4bM039LSp4a+EZdwKqACw4xVhkoRrcn4FJX1bg1TxxCH2eWKD4+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JR7Yf017; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JR7Yf017;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqFT0BPNz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADEC44078B;
	Wed, 24 Dec 2025 11:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0960C4CEFB;
	Wed, 24 Dec 2025 11:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575274;
	bh=czYnyqW5vOx92dzdp8DFFDYKApgOA3ZWQWWsjqbuAHc=;
	h=From:To:Cc:Subject:Date:From;
	b=JR7Yf017PjZkkdOL5RBOdatu0ZXq7AsiIZbL2tc9d5Hs0to9KtrInRT2mgMNhWOh2
	 ipDwnySd/+YQCSluSa/97iT3She+Vsr6Odl8UDkyk7U6zO5cuoN7bdQBoY5MLrDsHr
	 2lJ14gJ3iYdfg64UqgNgpkZKJ0VLrPk6FajEx5WAN43mc3UkB/LVOVEo+iw3hHZUY5
	 4pTF2f0+4am20+spqz1aSQSYeMGTQel0/l8iNp2l9UYdEdlcd8wKKD13d37jIB/uMR
	 kExPzQFpvydO7i2bF/sGWllOyOBbSth9eqU9M3B8VrT4tNUyMy4207vqQnSHCHIbzN
	 1VNihUbLVkXfA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/7] powerpc: Implement masked user access
Date: Wed, 24 Dec 2025 12:20:48 +0100
Message-ID: <cover.1766574657.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3527; i=chleroy@kernel.org; h=from:subject:message-id; bh=czYnyqW5vOx92dzdp8DFFDYKApgOA3ZWQWWsjqbuAHc=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5l2ab3fpOPNzvO+2xcdnhyppmj170qlH+dEre21V 00XhNdod5SyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJZAsyMhyxsbkXaVYqf2TR 8fnpL2/rlHKUHvr19OMlqfToiMN/rWMY/selafKv/Cpt/d2OfQpr1/VT79KnfTwh6W1ad9+e6/w jNjYA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a rebase on top of v6.19-rc2

Masked user access avoids the address/size verification by access_ok().
Allthough its main purpose is to skip the speculation in the
verification of user address and size hence avoid the need of spec
mitigation, it also has the advantage to reduce the amount of
instructions needed so it also benefits to platforms that don't
need speculation mitigation, especially when the size of the copy is
not know at build time.

Patch 1 removes some redundant barrier_nospec()
introduced by commit 74e19ef0ff80 ("uaccess: Add speculation barrier
to copy_from_user()") by removing the barrier in raw_copy_from_user()
which is redundant with the one in copy_from_user().

Patches 2,3,4 are cleaning up powerpc uaccess functions.

Patches 5 and 6 prepare powerpc/32 for the necessary gap at the top
of userspace.

Last patch implements masked user access.

Changes in v5:
- Remove first 3 patches as they were merged in v6.19-rc1
- Rebase on top of v6.19-rc2

Changes in v4:
- Rebased on top of commit 6ec821f050e2 (tag: core-scoped-uaccess) from tip tree
- Patch 3: Simplified as masked_user_read_access_begin() and masked_user_write_access_begin() are already there.
- Patch 10: Simplified mask_user_address_simple() as suggested by Gabriel.

Changes in v3:
- Rebased on top of v6.18-rc1
- Patch 3: Impact on recently modified net/core/scm.c
- Patch 10: Rewrite mask_user_address_simple() for a smaller result on powerpc64, suggested by Gabriel

Changes in v2:
- Converted copy_from_user_iter() to using masked user access.
- Cleaned up powerpc uaccess function to minimise code duplication
when adding masked user access
- Automated TASK_SIZE calculation to minimise use of BUILD_BUG_ON()
- Tried to make some commit messages more clean based on feedback from
version 1 of the series.



Christophe Leroy (7):
  powerpc/uaccess: Move barrier_nospec() out of
    allow_read_{from/write}_user()
  powerpc/uaccess: Remove unused size and from parameters from
    allow_access_user()
  powerpc/uaccess: Remove
    {allow/prevent}_{read/write/read_write}_{from/to/}_user()
  powerpc/uaccess: Refactor user_{read/write/}_access_begin()
  powerpc/32s: Fix segments setup when TASK_SIZE is not a multiple of
    256M
  powerpc/32: Automatically adapt TASK_SIZE based on constraints
  powerpc/uaccess: Implement masked user access

 arch/powerpc/Kconfig                          |   3 +-
 arch/powerpc/include/asm/barrier.h            |   2 +-
 arch/powerpc/include/asm/book3s/32/kup.h      |   3 +-
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |   5 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h  |   4 -
 arch/powerpc/include/asm/book3s/64/kup.h      |   6 +-
 arch/powerpc/include/asm/kup.h                |  52 +------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   3 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  |   4 -
 arch/powerpc/include/asm/nohash/kup-booke.h   |   3 +-
 arch/powerpc/include/asm/task_size_32.h       |  28 +++-
 arch/powerpc/include/asm/uaccess.h            | 132 +++++++++++++-----
 arch/powerpc/kernel/asm-offsets.c             |   2 +-
 arch/powerpc/kernel/head_book3s_32.S          |   6 +-
 arch/powerpc/mm/book3s32/mmu.c                |   4 +-
 arch/powerpc/mm/mem.c                         |   2 -
 arch/powerpc/mm/nohash/8xx.c                  |   2 -
 arch/powerpc/mm/ptdump/segment_regs.c         |   2 +-
 18 files changed, 141 insertions(+), 122 deletions(-)

-- 
2.49.0


