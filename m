Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D26568DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:29:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8WQ1BVkz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:29:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hVNfSCev;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hVNfSCev;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8RT5S6Hz2xdx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:29 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id jn22so12701050plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnMiVTD741omx7hmBiiezop4Htb8xxqKLHF8EW8IS4A=;
        b=hVNfSCev0oP2W3EY4dV3pN4vxq72d82vdRrBCR7oyvf+6hbXNzGZl9DI58sm4sLkLL
         +jfPPkyjl+AqZ9vd3PC1ul/opaGz417uuIIaiVh/YQBU3vjFCE2oy4H9D5FSlJrQu+iF
         xlcu8QCfrXERwUBcYGe6pdrP1+2iLFid+bRVoBP8SygJEwO86Wtrc16Fgpi7FIOf1p4+
         QZFZjbbEEZWENNukex56w/Z/7qp9oA1wOKX7lWdvDUMfb0jGgwF7p4BtpKmuEzOulzk3
         3oUhDTJp6bE/XVfBA3LTUy8nF6/QjmXUnWjHJEqx0UQ63X2tjyWR9/YI5BmAcVywLzCD
         Quug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnMiVTD741omx7hmBiiezop4Htb8xxqKLHF8EW8IS4A=;
        b=kmijxC4ewM+8K9co/jSaT4V0cmLgYLIukx57hjWIXGgHQXFTYCXLheu2GX7tKzo55a
         2ZYEGO1EEf9aiTEqwhkmRpnW/e9NY9JTLzSMfM0R38zfmDpazAXgMBuJba6cT7YvEs2y
         1jfzlM6VclxNrR4+nX/Hd1R5XZ9T1Ghs19POqhJkGOK5L1mIoKZJ0F0f5LOYKviuKDp3
         NlYEofA6cA7aUr6wX6FoFQVSnzgSAk3V/uDqBooH+2C31H8nDSfAJ84QGyCneTGMKDGZ
         LEY4jzOkFux8q7Mb/Nfqwts1odAn/NxYxqVNy3o5maFXlhpUc4GqoTW/VBXs6OsBVkgg
         LQ8Q==
X-Gm-Message-State: AFqh2kpKfSjl73j7IiMp95MmF8/3+9kudyN00Kb3i/Ssha5IV5h2qXru
	G2FbAk7LvcdWyHIuAuY0jc2NXU4wT3g=
X-Google-Smtp-Source: AMrXdXsUcFbNvODb17P6hcdK8SPmBVD5B74ptOr27IWYUkYjg+vnqSF5hLmLB2Bpb0ZTno4IQqwzDg==
X-Received: by 2002:a17:902:6b4c:b0:18f:9cfb:42aa with SMTP id g12-20020a1709026b4c00b0018f9cfb42aamr22459604plt.10.1672133187227;
        Tue, 27 Dec 2022 01:26:27 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/9] powerpc/64e: Simplify address calculation in secondary hold loop
Date: Tue, 27 Dec 2022 19:26:03 +1000
Message-Id: <20221227092609.2078908-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221227092609.2078908-1-npiggin@gmail.com>
References: <20221227092609.2078908-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
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

