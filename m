Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F265B6FA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 20:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nm5s51D10z3c7N
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 06:43:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=tjlHdGFV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=tjlHdGFV;
	dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nm5p50b7Rz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 06:41:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fb+CTdcMfnl1GUATy3wz2VNcRuEaacxbb3hMDn9nQvg=; b=tjlHdGFVIsGG7fRdqCmRs6z8kY
	NMJnkpILWMoOBDW0VbtiTsQPn1PgtLqDruxe5ftumwsimYCqQUtPbQfCxm2WiyyKnWB0FjgxgApMs
	hinV1lIm1PDWjZyOiN9no0cg3Zc3SMhJfOmGEXIcWjEXEzrbyUUMs4B7AUGBdZOS99IESLtV2j4PL
	O3dXeBHcqhf49f9Vg6VGEbgSX++XKWPCRZaa1JnFzcGIaCN4C820HoyB7AGjrWee4sD8FcwomG5J6
	xC/inqekPO2zJbXUE66PY36Lm1I79CVQRQ/O7jm0T/VNFqiqZamhoveOuHCXuaGkGVmv0V2gNgw9H
	e/grumfQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCQgE-007Ra4-Qj; Mon, 02 Jan 2023 19:41:06 +0000
Message-Id: <cover.1672687924.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Mon, 2 Jan 2023 11:32:04 -0800
Subject: [PATCH v1 0/3] PS3 patches
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 02 Jan 2023 19:41:06 +0000
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Here are three patches.  One is a general powerpc fix for a change commited in
v6.2-rc1.  I didn't see anything on the mail list related to this.  The other
two patches are updates for PS3.

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-powerpc-1

for you to fetch changes up to 760a803c300cb2d10548633fc13ed37a5703b026:

  powerpc/ps3: Refresh ps3_defconfig (2023-01-02 11:24:20 -0800)

----------------------------------------------------------------
Geoff Levand (3):
      powerpc: Fix processing of CONFIG_CMDLINE
      powerpc/ps3: Change updateboltedpp panic to info
      powerpc/ps3: Refresh ps3_defconfig

 arch/powerpc/configs/ps3_defconfig | 39 +++++++++++++++++---------------------
 arch/powerpc/kernel/prom.c         |  2 +-
 arch/powerpc/platforms/ps3/htab.c  |  2 +-
 3 files changed, 19 insertions(+), 24 deletions(-)

-- 
2.34.1

