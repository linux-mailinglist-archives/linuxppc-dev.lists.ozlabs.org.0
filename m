Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D813095A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:58:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbQq4ySdzDqMt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:58:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B/gaf9ZJ; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLc5Tq6zDrTg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:00 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id h15so7084349pli.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WNfGjxSfl6+DWbtEHnP5pYvU5ocON/GTjNbxGrwiXQ=;
 b=B/gaf9ZJaCMEVUoKEfscnCNFpPLc0MLEQM05gVmKnzbyCnEy2GGkpP9VAR3BsK8WIg
 KTKGN/wDMgfP0x7WIPWF/o2sF4zUcpSuoDcEeKGsze3R0Fc2aF73eQn5xfLaWnt8VfQb
 t01/GPPip4Kq1Q+9/f+KyHZ/bXL/xJwBWgmPYmUkBE7zi0dTpsblnfsFUXR8yzWqNi0/
 H2s4gOZpo3yt7YRFhYyBR7rcaZ9NAxXaiXOoH2ZCyrNEzjHCW1IIgjRzL60jANRimFo0
 sm5eZEswOYuBb0e2HaGgfhdx9I7CvcmPiMCHMygtHFhXfubt9hX+IXG88CBsrUiPnfEI
 +Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WNfGjxSfl6+DWbtEHnP5pYvU5ocON/GTjNbxGrwiXQ=;
 b=NqyAZ+T731jt0KH5wZoqbwcVvjNyJQIXTX9tmJYhC/+MdeBUaoxWcEdhBN4dAYgy90
 AHepfDpLC5swi6wr2q8MXwbyWg0RiPCgX5mVCJhIWj0GcCc4m8VVy0xIwRW6K6DsDoN/
 Oi2L0Gv9AjKjW58eSJH3omoCloB+0w3lx/LCMTSXgw00u3bH6r6FY7EZ1ceCbbmyihko
 i+At09QMNIr3qh0ydSOtsAC7iFIypBOsWdZh22/EtawadEEdfDmKCxsOuv5893fuXN4u
 gkuDj+MKjoF6no/Yaj3h7X3JiTPzPZhIFwSuGJ3CRjOvMnU7seGv16oDVBWLRALblBS3
 9e2Q==
X-Gm-Message-State: AOAM532c7HDGPp06TbU/5k17s8Wa7ElNumMZqek9wY1dUOnV/pAqdiso
 2H+FskFp06uQfzPngbVmYO3+9lgQ6qQ=
X-Google-Smtp-Source: ABdhPJzJaQ/N/HkyDKNephCKjSypfEOiXSMiy412ciokWm3Huqo9hQmlsHUNFQEt/JOBBuz7ENogLg==
X-Received: by 2002:a17:90a:7887:: with SMTP id
 x7mr9156189pjk.69.1612012198657; 
 Sat, 30 Jan 2021 05:09:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 16/42] powerpc/mm: Remove stale do_page_fault comment
 referring to SLB faults
Date: Sat, 30 Jan 2021 23:08:26 +1000
Message-Id: <20210130130852.2952424-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SLB faults no longer call do_page_fault, this was removed somewhere
between 2.6.0 and 2.6.12.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/fault.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index fc2d9a27c649..fef92efad733 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -377,13 +377,11 @@ static void sanity_check_fault(bool is_write, bool is_user,
 
 /*
  * For 600- and 800-family processors, the error_code parameter is DSISR
- * for a data fault, SRR1 for an instruction fault. For 400-family processors
- * the error_code parameter is ESR for a data fault, 0 for an instruction
- * fault.
- * For 64-bit processors, the error_code parameter is
- *  - DSISR for a non-SLB data access fault,
- *  - SRR1 & 0x08000000 for a non-SLB instruction access fault
- *  - 0 any SLB fault.
+ * for a data fault, SRR1 for an instruction fault.
+ * For 400-family processors the error_code parameter is ESR for a data fault,
+ * 0 for an instruction fault.
+ * For 64-bit processors, the error_code parameter is DSISR for a data access
+ * fault, SRR1 & 0x08000000 for an instruction access fault.
  *
  * The return value is 0 if the fault was handled, or the signal
  * number if this is a kernel fault that can't be handled here.
-- 
2.23.0

