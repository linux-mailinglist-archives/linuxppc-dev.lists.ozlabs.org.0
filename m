Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FA6A0327
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 08:05:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMkZX13zMz3fCJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:05:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HeEIYWG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HeEIYWG+;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMkTs2nGHz3cKm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 18:01:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=poG+9Vm8M0etfF6J8ee7t7i/YsHBs9LeiglyiBclwqI=; b=HeEIYWG+IktEw+xG+xN6elwm6P
	sMIc/dhbkU7QadGMbeCliJQJaqf1yNxRx5/Otiy7xPmZweGlbgKUTaizVptYqSRH9TXCU+EVKt0Cn
	GFAdp44TrUQTLKHa6Xt64Pq7NtINWFlL6PkCLWaZOX5OJXuOCA6s8urSB4FRI6LTYBf6K4miQ+y4l
	SshabeYRnUtV+XzzLSUpV9nLtorGjwKtdgKEHztk2S3Hn5eGFgvknle9Nff93iQYAyeaqnai9lxjd
	5b3eFPuyTFxBwqxBZMP0RGg9lGJ4hkM6AZysi3Alg02GpDt9MRQ956Qk1Pk1suVAfDQEVIX3hYqiQ
	1wfWkrDA==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5bS-00FMG2-FG; Thu, 23 Feb 2023 07:01:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] POWERPC: several build fixes
Date: Wed, 22 Feb 2023 23:01:12 -0800
Message-Id: <20230223070116.660-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gerhard Sittig <gsi@denx.de>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, Alexandre Bounine <alexandreb@tundra.com>, Anatolij Gustschin <agust@denx.de>, Roy Zang <tie-fei.zang@freescale.com>, Albert Herranz <albert_herranz@yahoo.es>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix multiple build errors or warnings for POWERPC.
These are mostly fixes for resource_size_t printk format warnings.
One patch is for RTAS, which requires GENERIC_ALLOCATOR.

Subject: [PATCH 1/4] clk: mpc512x: fix resource printk format warning
Subject: [PATCH 2/4] powerpc: wii: fix resource printk format warnings
Subject: [PATCH 3/4] powerpc/pseries: RTAS work area requires GENERIC_ALLOCATOR
Subject: [PATCH 4/4] POWERPC: sysdev/tsi108: fix resource printk format warnings

diffstat:
 arch/powerpc/platforms/512x/clock-commonclk.c    |    2 +-
 arch/powerpc/platforms/embedded6xx/flipper-pic.c |    2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c    |    2 +-
 arch/powerpc/platforms/embedded6xx/wii.c         |    4 ++--
 arch/powerpc/platforms/pseries/Kconfig           |    1 +
 arch/powerpc/sysdev/tsi108_pci.c                 |    4 ++--
 6 files changed, 8 insertions(+), 7 deletions(-)

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Roy Zang <tie-fei.zang@freescale.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Alexandre Bounine <alexandreb@tundra.com>
Cc: Gerhard Sittig <gsi@denx.de>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Albert Herranz <albert_herranz@yahoo.es>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
