Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BE23B217
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:05:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGlD0B2xzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n9Xitv8Y; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGVj4hmvzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 10:54:37 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y206so8976969pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNwAgRS2T9QG6C7q2tNzunePdKUgTtVz+OuWMgOTKaI=;
 b=n9Xitv8YwDK4zuOryomHPbPJkNXM0f5kZArHrYWmCU6x5JizJqt1d376UpTOm4CzRc
 YIrX+BTUhAyyMAKC7bywBROYcZSy3QDqVGxYz2mXDvPpk3Yvovaf9sjO8FdE3vas3NkY
 eBVv8HgDKsXfCAPlNAA5WnVpFXEwSvN02ID5d2JLmhvGcy7xuggKT8qFDnhsqxRjQGw1
 EwBRppjS2uakoOLe2FQAHGjcNgVlrMgYG0LY/FWFP/EoUCi8RoXKZTySX3sXoK/tHB+k
 bNXBOAPVYFUDReSuDNFCXIFToC/slVCy0NfYNp3o9JrXqsfWUeHCEjLCoWE16pPYsW/O
 ElAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kNwAgRS2T9QG6C7q2tNzunePdKUgTtVz+OuWMgOTKaI=;
 b=LOBrvDDnSA4hwwbtdkOZmtU4lPtTgMJoY7QL1FFOU1K1IyYGmyulws/LitB7uBOe0Z
 qvf12IG44yfkoxBhAd4rCUAfGsoBnFREH9qZ6zvn+gxG5urqPFtLoeD2vmDkUTbvjPqr
 SbKFZS2X0/ueGBjwM9leI+fucQBEAj8ihS0KdB1y1zY2tEc1kYJk3vmqIGmAE4/4Qj7M
 qS94Xut/KELYAK8QDIcPWl0WmpcY748AbFbLTetv5QLgTcnBsJhPjw4v688NwOkrvJe1
 w+8+iZSay2PBIzNAN4vtdM8xYDc8afyy6CWanHgQINSMUOfkyY3B/a82me+rZu/VCTQa
 lfag==
X-Gm-Message-State: AOAM533y/w0BOnQzqU9R3fLaWJttFlxvwKApjE91XAyT17r1q/479KNg
 M17jJgTBEBFmav0LitSYdlBA2V7/
X-Google-Smtp-Source: ABdhPJzBwaqING7JeV98mUXrLrlSFiZPXsGkvwzdhRWpqgOGap+0QrR1fH7s0VFThncVyCA6ddAI+g==
X-Received: by 2002:aa7:9904:: with SMTP id z4mr10926030pff.32.1596502475534; 
 Mon, 03 Aug 2020 17:54:35 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.110.210])
 by smtp.gmail.com with ESMTPSA id 80sm10381327pfy.147.2020.08.03.17.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:54:35 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/powernv: Fix spurious kerneldoc warnings in
 opal-prd.c
Date: Tue,  4 Aug 2020 10:54:08 +1000
Message-Id: <20200804005410.146094-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804005410.146094-1-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Comments opening with /** are parsed by kerneldoc and this causes the
following warning to be printed:

	arch/powerpc/platforms/powernv/opal-prd.c:31: warning: cannot understand
	function prototype: 'struct opal_prd_msg_queue_item '

opal_prd_mesg_queue_item is an internal data structure so there's no real
need for it to be documented at all. Fix up the comment to squash the
warning.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 45f4223a790f..deddaebf8c14 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -24,7 +24,7 @@
 #include <linux/uaccess.h>
 
 
-/**
+/*
  * The msg member must be at the end of the struct, as it's followed by the
  * message data.
  */
-- 
2.26.2

