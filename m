Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001941E1C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 20:52:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL2Rj0zGTz3cG8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 04:52:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c2tPiDJe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c2tPiDJe; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL2Pt0TGrz30Qr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 04:50:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8841861209;
 Thu, 30 Sep 2021 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633027856;
 bh=UhBCHbOj9Jl5ZEx32c+R0M1PnzpsDKyF6CtjxvFScPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c2tPiDJenxyQCvMzIY4Em8nsDs+rtaeSgB5mPhO6rdWaZxL8dx3plalQIb93rr+g7
 VQ8cGTHdyEbFp89BNk1xmo9SM+kleGvnBNuMMGt+h3NC2iEs3mimxx37p8Rh1Q49I1
 dICy9rhz40FtM07iwqUokDQc+WAsE9WW38PuHUYN59W32pQcFuBqF49AW2YbxvUmMe
 aml+AvUr5+hgysic8DOhS2c2vDqm1VwkFyfbPUhqrlF8CS9WEcfvcWhLGpQ9MtlfVo
 xwgzIBOzSTgMKLsybKBHHglY8ZfOkRoMe48nKFLqWW35isec2qKzGOkfCDbTRn1Osu
 LXpN7CWI+EqJw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] xen/x86: free_p2m_page: use memblock_free_ptr() to
 free a virtual pointer
Date: Thu, 30 Sep 2021 21:50:27 +0300
Message-Id: <20210930185031.18648-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
References: <20210930185031.18648-1-rppt@kernel.org>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, xen-devel@lists.xenproject.org,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-um@lists.infradead.org, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

free_p2m_page() wrongly passes a virtual pointer to memblock_free() that
treats it as a physical address.

Call memblock_free_ptr() instead that gets a virtual address to free the
memory.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 5e6e236977c7..141bb9dbd2fb 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -197,7 +197,7 @@ static void * __ref alloc_p2m_page(void)
 static void __ref free_p2m_page(void *p)
 {
 	if (unlikely(!slab_is_available())) {
-		memblock_free((unsigned long)p, PAGE_SIZE);
+		memblock_free_ptr(p, PAGE_SIZE);
 		return;
 	}
 
-- 
2.28.0

