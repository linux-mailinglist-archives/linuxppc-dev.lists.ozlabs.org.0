Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884C7C7774
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 21:55:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FF4MctXi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S60jX31GCz3dF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 06:55:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FF4MctXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S60hc3w6tz3cPK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 06:54:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ctit0g3xmBxqIlEE5heLhfikUMFekXqmU9Lrzt91HNc=; b=FF4MctXiCN19+WdsrcaqnDJjY7
	q7kfn9N9cNxkAnbt6SSwHCHaaaT814w/gMu0ManCBR6ur6Ow3wnKbodDFWPUMm/DIJOp1v7e7WppC
	EGbQILu1QwUXE7C9Ddeg6W8EjP5O1CL00M2EWB5Pi4pXyXG4gI/7KIz3mUvCdME6bbfbEhoPobSz/
	pxNwKSQpdsNE2XoXlyHgaYewbOf2tL6Rj7ZMgwIyMMVwkO7NKWX2xxijpI1eJbLtxuZ9DLm+0Xol4
	Ju/yceufWyjpBoJ83wKe+vfPoOHVccvEtt8rDBfP4A4pYw1/+Ng2kcZWGqEohJHzhJvmNtWUYgt33
	/j4PdAKA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qr1lA-001BSV-AV; Thu, 12 Oct 2023 19:54:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Allow nesting of lazy MMU mode
Date: Thu, 12 Oct 2023 20:54:13 +0100
Message-Id: <20231012195415.282357-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
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
Cc: Juergen Gross <jgross@suse.com>, Erhard Furtner <erhard_f@mailbox.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-sparc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dave Woodhouse reported that we now nest calls to
arch_enter_lazy_mmu_mode().  That was inadvertent, but in principle we
should allow it.  On further investigation, Juergen already fixed it
for Xen, but didn't tell anyone.  Fix it for Sparc & PowerPC too.
This may or may not help fix the problem that Erhard reported.

Matthew Wilcox (Oracle) (2):
  powerpc: Allow nesting of lazy MMU mode
  sparc: Allow nesting of lazy MMU mode

 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 ++---
 arch/sparc/mm/tlb.c                                | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.40.1

