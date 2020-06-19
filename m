Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B89052019A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 19:44:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pR5P0PsRzDrTK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 03:44:41 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=RxnCyb0c; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=h502I52O; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pP4R3FV7zDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 02:13:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592583215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qSToaPYAxy41TNCcRoZVJZv9P7/HBXlbwWJ2Rk2g+I=;
 b=RxnCyb0cqqovNroxZowRnZrqnHfJ69C7sV+Wx2KIml8xgKKvpR8TNoU6WUweFMKeasWt7m
 QSLKUYuFgmiq1A72M4/4GEvmBbPOBnzGp5tRtaHHqECkyEhzfU2Mv+u0fzII2QQRRPFiYL
 miseAivrL5YU7YSiDRhfGhmpsmDC8hg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592583216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qSToaPYAxy41TNCcRoZVJZv9P7/HBXlbwWJ2Rk2g+I=;
 b=h502I52Ob6dJcZk19XsOyNxL5mHDRheGu5/KsfCjFybmWN4VP7+S6XDnz5sXWuTcDLcB86
 vqUUF6i87gO3pWepzGHssLRKKHMNl5RkoaUzcxjR5eWBaDWkEB69NBNRlODQUfWdWJW+2r
 WppoLo3ldsSs8JF7G7puwvqaqunn4lE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-drCx8dBZMs61b2c5DuwV7Q-1; Fri, 19 Jun 2020 12:13:31 -0400
X-MC-Unique: drCx8dBZMs61b2c5DuwV7Q-1
Received: by mail-qt1-f200.google.com with SMTP id y5so7503089qtd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 09:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qSToaPYAxy41TNCcRoZVJZv9P7/HBXlbwWJ2Rk2g+I=;
 b=WEPiTPjRICv9zOcqZK++KkBJzCOHrneJNvjwhHQShtck+Zkl7eA+ADLzTCThDzIEP8
 LaUXpG5mTQNwcZVxe5B/lu6UMb3aiBisIPda/wyClVHVBD6TLhfkBng1+iDr5zZZtTuX
 ZM/0enx9/LOW/2AA8DY+Ca98/jxC8fQrxK1gpRIPysPtuDEyDUVSw4KAXBmrv4la5LNi
 nHfs2StG3vzYXB9cVZXFgkDXgogW2uo6LFPyQMF2TIwLkNRZhrh84Ipuc2iXqx7vPDQ4
 Ve+tTIKMgXZeZN3HL0kEEvI01KHDEfyK/qQJRYCAol6/bjsvyebu28QE8ZO1fhSYs/Ds
 Mr4A==
X-Gm-Message-State: AOAM531x+wjcCQogomamaaVJKJ0kVdxyvMr3T0gntPXc3MFk88f/2boj
 N6MUjTVuS1rfyQinGT8VWAvxjABq1bRhRD04PBij1FQ9jjPUYz6cd8nK7n1XXSFsnWkeSN5zFwP
 +hnQ5VE+Cwioq2BTbXwLuW88haQ==
X-Received: by 2002:ac8:46d6:: with SMTP id h22mr4171908qto.145.1592583211232; 
 Fri, 19 Jun 2020 09:13:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPf3L9dwnzhcKrCo1xqDr8zLwbACSJhy9YaZ+W+WiIy3zkGSSlH37gZSMbp9D62VN2NzGxsA==
X-Received: by 2002:ac8:46d6:: with SMTP id h22mr4171872qto.145.1592583210896; 
 Fri, 19 Jun 2020 09:13:30 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id s52sm7597075qtb.3.2020.06.19.09.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 09:13:30 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 16/26] mm/powerpc: Use general page fault accounting
Date: Fri, 19 Jun 2020 12:13:27 -0400
Message-Id: <20200619161327.9564-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
MIME-Version: 1.0
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Xu <peterx@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>
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
index 992b10c3761c..e325d13efaf5 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -563,7 +563,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 #ifdef CONFIG_PPC_MEM_KEYS
 	/*
@@ -604,14 +604,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
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

