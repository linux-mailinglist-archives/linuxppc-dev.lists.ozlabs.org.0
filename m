Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCDF1FA362
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:19:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m5Mt6FL0zDqf2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:19:06 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=Xse9mJ22; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xse9mJ22; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m5KJ650KzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 08:16:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592259401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1JGrcb4VtJwhM/mfk1pWvCfErRPSyrjF6khDNDw6Ls=;
 b=Xse9mJ22M8i8eHweml37+qoebyT8ZhSXgbgUtc4VkvXXu3g5+m2mOGin2UgL5ipCrSrkcT
 MKjshfnBYPjG9xFdaRO+qeu3oJXyWisYW9Rlsc7wMSR84+/s+HVbgJbICm3Q+KhLaVxSQ1
 9kVMoPgPJJj4zdWLW04C4XNp60SlpuQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592259401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1JGrcb4VtJwhM/mfk1pWvCfErRPSyrjF6khDNDw6Ls=;
 b=Xse9mJ22M8i8eHweml37+qoebyT8ZhSXgbgUtc4VkvXXu3g5+m2mOGin2UgL5ipCrSrkcT
 MKjshfnBYPjG9xFdaRO+qeu3oJXyWisYW9Rlsc7wMSR84+/s+HVbgJbICm3Q+KhLaVxSQ1
 9kVMoPgPJJj4zdWLW04C4XNp60SlpuQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Mejiy-FRNeqM5jkuNcW9nw-1; Mon, 15 Jun 2020 18:16:39 -0400
X-MC-Unique: Mejiy-FRNeqM5jkuNcW9nw-1
Received: by mail-qk1-f197.google.com with SMTP id t18so15365932qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 15:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D1JGrcb4VtJwhM/mfk1pWvCfErRPSyrjF6khDNDw6Ls=;
 b=Qaosf2NxPVbIg5Tmf6LxYRZ/AHc8HXrOPUfIEXbw/DX/zxU+aHfnScO7LfQYZxeydJ
 m4q4dG0DSZo58lvzUSJXJ4YxkdS7hbIZ5QkSBaIl/s9eG7dS8AJnDlji6fYsS6iAHr2k
 /TptKZUJGFR4UG1h2rJQE2JOb1jwX6ndZ0RWEMiDKQvQR8ugVs+fLLRWp6bym75xFQCA
 k9dGBenImaW+8FQQWJu9ydKL515gJa8XnTRyQQpurdVHvnJdTkOWAN4r16/PT4T2tJk2
 krRghg6G28woXKQINdg1DTpX8Y7rQYVF10zXVD6aHnEUf8wa4e/c/Ti6TxIXHHA/FTc6
 pAwA==
X-Gm-Message-State: AOAM532Ld2pJ7148G1Qg3Yve3H4g8Po5EwRHS/K3A/I/z1VeSQ4TRX4G
 N+Y6FZRDEgHb8ZF7MkSrHceyeUicj+KeBQ8SA3LcaYUpZD3drRvs5SabmHvVrzC8381Wpbl7qFO
 zQ6slTLN5IyfMt0xr09EboLHqsQ==
X-Received: by 2002:ac8:4742:: with SMTP id k2mr18393745qtp.304.1592259399139; 
 Mon, 15 Jun 2020 15:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwis4xPglPp7o+FOHT5OI+c4AKHHUO1bfH47AyrkUm4D6BUmGSmwgXfC3cp9GJLELgwIXDa2g==
X-Received: by 2002:ac8:4742:: with SMTP id k2mr18393717qtp.304.1592259398932; 
 Mon, 15 Jun 2020 15:16:38 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 15:16:38 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/25] mm/powerpc: Use mm_fault_accounting()
Date: Mon, 15 Jun 2020 18:15:59 -0400
Message-Id: <20200615221607.7764-18-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
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
 peterx@redhat.com, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the new mm_fault_accounting() helper for page fault accounting.

cmo_account_page_fault() is special.  Keep that.

CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/mm/fault.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 84af6c8eecf7..6043b639ae42 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -481,8 +481,6 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (!arch_irq_disabled_regs(regs))
 		local_irq_enable();
 
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-
 	if (error_code & DSISR_KEYFAULT)
 		return bad_key_fault_exception(regs, address,
 					       get_mm_addr_key(mm, address));
@@ -604,14 +602,11 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
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
+	mm_fault_accounting(current, regs, address, major);
+
 	return 0;
 }
 NOKPROBE_SYMBOL(__do_page_fault);
-- 
2.26.2

