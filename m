Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71503217B69
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:54:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1d6M34vFzDqC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 08:54:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fAM/Wzsj; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fAM/Wzsj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1d2R73DmzDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 08:50:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594162252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmLZf6AJOqhj6CgptEYub+5PD04MI0cndAP6UETZVFY=;
 b=fAM/Wzsj93eChTz1FpqgzKwfvmtc4jqsGSSxJeVXr74LD24tARcOenEolPeTbc/DD0x87q
 oWydYYogwjFCZtmb4i3Oy0ZdWM515f8FIH/OrisBBj1NFF3v7E2V4PGLmQ41LjVuXKP2Ql
 i1vlyo34LxZ+pR0Zeb8/WBbdjhz1nJo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594162252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmLZf6AJOqhj6CgptEYub+5PD04MI0cndAP6UETZVFY=;
 b=fAM/Wzsj93eChTz1FpqgzKwfvmtc4jqsGSSxJeVXr74LD24tARcOenEolPeTbc/DD0x87q
 oWydYYogwjFCZtmb4i3Oy0ZdWM515f8FIH/OrisBBj1NFF3v7E2V4PGLmQ41LjVuXKP2Ql
 i1vlyo34LxZ+pR0Zeb8/WBbdjhz1nJo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-3564hbHyP2iW2wBbcgKwmQ-1; Tue, 07 Jul 2020 18:50:50 -0400
X-MC-Unique: 3564hbHyP2iW2wBbcgKwmQ-1
Received: by mail-qk1-f199.google.com with SMTP id s5so10848179qkj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 15:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmLZf6AJOqhj6CgptEYub+5PD04MI0cndAP6UETZVFY=;
 b=WvxijTxo2NdYzm5LI6v+0b4r5PgLTyrSB6AAEJ0+aoKwI4ZqTLYfepPQLVpv3OOwEX
 SWBNC/RV3/1VByouhq/Exd9T4YtTn+CLlmo7nktZ61Y+FON6q/LOjd6fT64ErDV53DB5
 NV/EmajPQr5hBhJaPWk039kPraJNCEWrBGL14paDIN44/KLYKAWJCdb+8yRmCQ1UlYcn
 CUF1sb1qn/ILwe00trtbrSRYvkRD7waRRaeyc+XgjMW/9icx/d4/SkGE6fKmj6ICTRxR
 tQjr5ooFSjesmvyxI639vv4Ct6vhYXmL4fkRO6uOoHYquXdpQLVrLitCgeozCIY9ZRHY
 I9fg==
X-Gm-Message-State: AOAM531QTSbauvRVXAmIny6Gx/qZFEZ0rK0HeTvOCebUEhSqIBkAeU56
 QqyCyNuqZ+ufo5pLWg6EGT2oPewFMAtg1eCVSKS1lhK7ebCB6dbp+9MLZ5Jx+VJmJH9rilN+Ol4
 WL8nkUVANMdot4hzZ+BmAXvQtqg==
X-Received: by 2002:a0c:b88d:: with SMTP id y13mr48924496qvf.82.1594162250482; 
 Tue, 07 Jul 2020 15:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiL/ertHlMtVAwiEgBsckzbOTj5OmrrUyC7CcF266qmLzt4w9AsKT415R55VH7drOKCUmHHA==
X-Received: by 2002:a0c:b88d:: with SMTP id y13mr48924470qvf.82.1594162250236; 
 Tue, 07 Jul 2020 15:50:50 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 15:50:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v5 16/25] mm/powerpc: Use general page fault accounting
Date: Tue,  7 Jul 2020 18:50:12 -0400
Message-Id: <20200707225021.200906-17-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 peterx@redhat.com, Paul Mackerras <paulus@samba.org>,
 David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the general page fault accounting by passing regs into handle_mm_fault().

CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
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

