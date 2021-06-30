Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6483B7E5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD5y02nCz3dfn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QrhUZLPQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QrhUZLPQ; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD202KrZz2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:48 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id b12so529469pfv.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtk2aPbv4+dn1lWIaSlYx2LeqZpx/y8TrScJdVbl7aU=;
 b=QrhUZLPQ3I90rwFxk14UNNQCSAnaj55zH3SgZ+widQB+sQ9Hdo7ia+XZz5LK2qrVMf
 VUW2x0kOZYUSX+ow0DjsXCAfZGsJXV35wqbmCFRi+wHHEp/7IRIlzJsP1QyYwzbarwIr
 /9ZUX9YuIC/FmfVIttg1pNGxv8kulm3+H4p2kMmInc+N5/vXm+ULiRPmYAcm4DDi99Bq
 hia0Q5UhryF0KcYrdUrYXgH0lr+JAc+oe7M5CIqAEXdvIj/pJiRGzFvZOtGnmQ8T2mTc
 Uwk5RKB6QFsaW1XwZJMDiB8Etu/RWetRk7kChVTRS9cNUs+k2epZrBu0PfnBxm6sMfcZ
 VzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtk2aPbv4+dn1lWIaSlYx2LeqZpx/y8TrScJdVbl7aU=;
 b=tq4F0W9P/9XHvitOHiJy0QdU+UbuqkkKWRVemDLxJhfSLpzkfdGq3lvG307x+L7Dj4
 1cUXGzkL9SAD1gK0pNvgeDhW8ltchA5m0uJun/fkIu50oAPnHm8DvsmbK5t3ORoRsSOC
 jTa6Ms+YdJghgKUDe+0+uWsm09lLtjydodk1i8dko+RsxD7cSAR1UmIG+CJrhk9jatu3
 MSPOldI7TDvzb+bpceMjtDnsHe++YcylDCBKl6ABPQIN4U46wuWzoTNTZWc4ow4wiEpF
 1M+kLVzljl+dD7xLkya4V0B36NZVt4eQvwXBULjF/c/ZIEt6d8YEkvZFomC3HSHaA9cZ
 e4bA==
X-Gm-Message-State: AOAM531JDnNwhk13O5A6lt5LsWur4KrTjUG+3B7iQyp+8t3HhbMcXbn6
 3w5VgGNUReGhqI/GXkQXy/NkIenK82U=
X-Google-Smtp-Source: ABdhPJxVLTsVJ1uTLdfZsSRs2GjfhG6cxiSi3EYMlL6l3GoigJmCxiKLnugubjINUgzQNCRLB5+Wlg==
X-Received: by 2002:a63:7217:: with SMTP id n23mr32852188pgc.437.1625039206071; 
 Wed, 30 Jun 2021 00:46:46 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 8/9] powerpc/64s/interrupt: clean up interrupt return labels
Date: Wed, 30 Jun 2021 17:46:20 +1000
Message-Id: <20210630074621.2109197-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Normal kernel-interrupt exits can get interrupt_return_srr_user_restart
in their backtrace, which is an unusual and notable function, and it is
part of the user-interrupt exit path, which is doubly confusing.

Add non-local labels for both user and kernel interrupt exit cases to
address this and make the user and kernel cases more symmetric. Also get
rid of an unused label.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 5c18362693fe..c4336e2e2ce8 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -509,7 +509,9 @@ interrupt_return_\srr\():
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
-	beq	.Lkernel_interrupt_return_\srr
+	beq	interrupt_return_\srr\()_kernel
+interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
@@ -623,8 +625,8 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 #endif
 
 	.balign IFETCH_ALIGN_BYTES
-.Lkernel_interrupt_return_\srr\():
-.Linterrupt_return_\srr\()_kernel:
+interrupt_return_\srr\()_kernel:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_kernel_prepare
 
-- 
2.23.0

