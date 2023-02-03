Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0B06897F4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:42:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Yfz2rSrz3fF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:42:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l7xrIlOp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l7xrIlOp;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Yb51rNJz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:39:13 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u9so672302plf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnMiVTD741omx7hmBiiezop4Htb8xxqKLHF8EW8IS4A=;
        b=l7xrIlOpvcJyGWla9ECP9y3nvtoP0PjzkHTpL2Uhh6eCJp/mCBJi0Vny0zIkXW7XS/
         +oRIIGSOPr3S8RP6+L6jV+LD4pZo1a9GRrNNNFyBrGhKFMkCaLiVyO9hoVOR9NN5IfRp
         4V+BhLG1mdYsMhJKCJPRI6h40siGwOQMj93e8AOhTe8uoz2ZtQpLBUZDp2tv70RoJWjn
         +bRQp8DSRiwz4lvp1QUJXb9dra0tUs8XWAAWO8xWnDmLhYi06xGegCzoDdeULzaGWNZH
         CrxleP+28P3oca0SrI8EDJphy5QHhQyusQq/v0OvEYjGvgm6jyul79T59zkfopQYPD+J
         VSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnMiVTD741omx7hmBiiezop4Htb8xxqKLHF8EW8IS4A=;
        b=bmBTjA6NlIRdy2UZf8a4wDfvAuirlwUl1Mwd5sHDR0i1NcZi17/+tar1Dbm5WWJpQ8
         pmWgDdxkUbCR8VunrJxDCkMeeq5zl0aU0vmD9lUAVTLkWS2BL209QzbtvHv1qHCXXumf
         lvDwvauA/JgYlWkMdovr4ac86RnoxAnrQUDDaxzIKl+5UMkiPaW+l6naRIjEJ/KkureN
         3EXdsc1yeycZLy/8PPWV2C0+iY4cZLuNX1FHctB4JOLvHltZui6RKTF4zZpIeZx+IwZd
         ZfF5ECMkxfknK8Y43pJH7XjDR6K27ou3BNm6QnC0P7COdNJwK9JI8kdBsHRVnPrPXHF6
         ij2Q==
X-Gm-Message-State: AO0yUKWHqtLq9ooV3N+FUjmdGlxx1qXApXsrruCzmjYRn/3mGg0o6cIz
	ZImk11RDf2Y4ecpniTRAYphkeMwCA5U=
X-Google-Smtp-Source: AK7set9fzjKQ1av4cV4CKhH7hKqqiNGBGZPzv9qJTDq722+LplkhsCrHetoz3oioTJEhwpnVt9JChw==
X-Received: by 2002:a17:90b:4ac5:b0:22c:9794:206c with SMTP id mh5-20020a17090b4ac500b0022c9794206cmr10553465pjb.6.1675424352542;
        Fri, 03 Feb 2023 03:39:12 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b0022bf4d0f912sm4792964pjh.22.2023.02.03.03.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:39:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64e: Simplify address calculation in secondary hold loop
Date: Fri,  3 Feb 2023 21:38:58 +1000
Message-Id: <20230203113858.1152093-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203113858.1152093-1-npiggin@gmail.com>
References: <20230203113858.1152093-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the earlier comment explains, __secondary_hold_spinloop does not have
to be accessed at its virtual address, slightly simplifying code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 5af2e473b195..3a7266fa8a18 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -160,12 +160,8 @@ __secondary_hold:
 	std	r24,(ABS_ADDR(__secondary_hold_acknowledge, first_256B))(0)
 	sync
 
-	li	r26,0
-#ifdef CONFIG_PPC_BOOK3E_64
-	tovirt(r26,r26)
-#endif
 	/* All secondary cpus wait here until told to start. */
-100:	ld	r12,(ABS_ADDR(__secondary_hold_spinloop, first_256B))(r26)
+100:	ld	r12,(ABS_ADDR(__secondary_hold_spinloop, first_256B))(0)
 	cmpdi	0,r12,0
 	beq	100b
 
-- 
2.37.2

