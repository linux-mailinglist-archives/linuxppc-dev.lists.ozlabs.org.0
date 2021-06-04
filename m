Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C839BC69
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 17:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxSBM5S5Hz3byb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 01:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=R0rL+aFU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=R0rL+aFU; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxS9R65Mdz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 01:58:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yseJ9abQcTP9X+xb/zgeBROEQlgQAJLCVjgDaQrF+Wc=; b=R0rL+aFUA5qjvyEJZFfCNSv6mo
 KDFB84T0NRruJydDbktk1Txu6cCGLsEN7eZYzLxyRPhRcN4pVHa+2tyskIeGVMibgpswymnOOH4ne
 ATJPZPN/kgQBtxFK7RplZOY8Pbwy61U/F0ynhVpyYMkQqYhz/s+T/1nsIvlSjnLvh8yQjkfRWDPRw
 sMwQRa3oDCXD3mOIwQUC0bDyQlwBsFbxJMFnAlEM0iBdjjNuq4SdUsJ2iBntwOaBGD8ZA6nVCpwCF
 c30ozqcEioeHLa/SQN1NU1/vJ5WYZ8MitKIxm78ca7dllvh2EGXyHau/qIerPon2+VMkPpE9v9ZoA
 w98ccB2Q==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1lpCDJ-001R9I-Ck; Fri, 04 Jun 2021 15:58:25 +0000
Message-Id: <cover.1622822173.git.geoff@infradead.org>
In-Reply-To: <cover.1615916650.git.geoff@infradead.org>
References: <cover.1615916650.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 4 Jun 2021 08:56:13 -0700
Subject: [PATCH v2 0/2] PS3 Updates
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 04 Jun 2021 15:58:25 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

I've rebased the V1 patches to v5.13-rc4, and moved the firmware version export
from procfs to sysfs/firmware.

Please consider.

-Geoff

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-powerpc

for you to fetch changes up to 245897ed65e402686a4b114ba618e935cb5c6506:

  powerpc/ps3: Re-align DTB in image (2021-06-04 08:35:45 -0700)

----------------------------------------------------------------
Geoff Levand (2):
      powerpc/ps3: Add firmware version to sysfs
      powerpc/ps3: Re-align DTB in image

 arch/powerpc/boot/zImage.ps3.lds.S |  2 +-
 arch/powerpc/platforms/ps3/setup.c | 43 +++++++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.25.1

