Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0320FE16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 22:48:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xGdv72Z6zDrHF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 06:48:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XAnxaTq3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XAnxaTq3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xGbN23rGzDr69
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 06:45:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593549949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ynnJMHDkmLB1gpQYI5LlP8bTNHn29Vusf9IRRJFn7yI=;
 b=XAnxaTq3AEqE7wbXoQS1Db6VqijL4CDmhdI4Lp/2UA6/2Hh9CfFC9bySAhTWUOwOVd/98j
 OD+X4WrfDHOXVKHegkPXGW9YFZcphpd+fyIGRlBZs9jHREgJrlIBHfIuVDWn/hMZMP9+sT
 fpb/UzLe278OWi9FAYzJuwWBK98SlXw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593549949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ynnJMHDkmLB1gpQYI5LlP8bTNHn29Vusf9IRRJFn7yI=;
 b=XAnxaTq3AEqE7wbXoQS1Db6VqijL4CDmhdI4Lp/2UA6/2Hh9CfFC9bySAhTWUOwOVd/98j
 OD+X4WrfDHOXVKHegkPXGW9YFZcphpd+fyIGRlBZs9jHREgJrlIBHfIuVDWn/hMZMP9+sT
 fpb/UzLe278OWi9FAYzJuwWBK98SlXw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-IYXgREuXPoKm20lZAsll2Q-1; Tue, 30 Jun 2020 16:45:47 -0400
X-MC-Unique: IYXgREuXPoKm20lZAsll2Q-1
Received: by mail-qt1-f199.google.com with SMTP id m25so10740322qtk.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 13:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ynnJMHDkmLB1gpQYI5LlP8bTNHn29Vusf9IRRJFn7yI=;
 b=JUzXc5aRPuVtUABOsacCZL/zOFIVA4FdyVBbQ34Mat4M3z36Bm4EB40Zdf2PaqjGYx
 ZNasIgtcF9AoxQhpsKA42/ZJ8fnT/etxGyjpghGBRsh7Z5+Qoxxhcy3KouE+GJGc3Bw3
 mN3dn5kmUD2kodtgjSeg96UuFvj6/Ca0i4fpl5+kYZPPCkS6TTh7VxgZOX6K+wymcZXu
 pnr1FyNcl2zlSSWgCdSl0PdbgcwSsSmKf9iBYFX1f+OtDJVghGbgMcaHMNovsTOgXN3G
 PcOWQsmmJsMi8eq3ggfyztcioyCSouuMgf+PDYkpNlJxJf/0ANbkJFTOzrwNP5KOdXiS
 lYVQ==
X-Gm-Message-State: AOAM531v1hy351a8CRBSJEjqTqUhiYXo7hn3P0tnCh42s9PT2oB7czfS
 E0c5sTvim+fWQXfED8eSzcCcIUkOMa+iYj62/9UDwwomOwZrTwHQGgL1tvnVwFQTo4A1DAALRNu
 xEVkS7QGonu8n4NngCD4EG/D55A==
X-Received: by 2002:a37:6382:: with SMTP id x124mr19156403qkb.13.1593549946779; 
 Tue, 30 Jun 2020 13:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYJzOveTh/zHsoqWyRhvWa6nes5qts8kYD9+VOymtjnIw0C/lNBXFLIHdqm4iSlLEtMxrrcQ==
X-Received: by 2002:a37:6382:: with SMTP id x124mr19156332qkb.13.1593549945576; 
 Tue, 30 Jun 2020 13:45:45 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id y40sm4291853qtc.29.2020.06.30.13.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:45:44 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/26] mm/powerpc: Use general page fault accounting
Date: Tue, 30 Jun 2020 16:45:43 -0400
Message-Id: <20200630204543.39245-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Will Deacon <will@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 peterx@redhat.com, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the general page fault accounting by passing regs into handle_mm_fault().

CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/mm/fault.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 25dee001d8e1..00259e9b452d 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -607,7 +607,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	major |= fault & VM_FAULT_MAJOR;
 
@@ -633,14 +633,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	/*
 	 * Major/minor page fault accounting.
 	 */
-	if (major) {
-		current->maj_flt++;
-		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1, regs, address);
+	if (major)
 		cmo_account_page_fault();
-	} else {
-		current->min_flt++;
-		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
-	}
+
 	return 0;
 }
 NOKPROBE_SYMBOL(__do_page_fault);
-- 
2.26.2

