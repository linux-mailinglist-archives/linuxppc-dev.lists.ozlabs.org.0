Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E425B8C47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:52:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPwL4gKCz3dQy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:52:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MzKC7oj6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MzKC7oj6;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqt58qbz3c21
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:48:10 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id iw17so15581502plb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PrQdAFxtxeR17FgsDPQHKNAvtnlHEj0ZyhwQvUbpnik=;
        b=MzKC7oj6klE0/NzCLCVjeJI1b1+nUjolhzK28UDWGP6j+4V5NhJnODoLVqvxlvTriu
         VPrdTKyrkSto2QxyOVmXmI3uAMdHdXmOGBg2OY6E0WquMUsVU1bslexxh5mvJ05I1x6c
         VJl69SZSatrghXAXKKzLrg2umhcRaamozhbhyA73KHA6mTU2B0wtcPzVQaySAjrt6DnB
         saw6653Kj3Wym7/BZyaSJroWdvMkJwQ5Fu/9Rpq8ZT39EX+5vwQKsDY/lMfBbPMhrshD
         wIleS2uMRbjR2gHuW6ufHzOb1rvqh74B7UjBjoxhugizDayoWvJcrgDjVR9mu24zvBoT
         Qb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PrQdAFxtxeR17FgsDPQHKNAvtnlHEj0ZyhwQvUbpnik=;
        b=c04AD7tP9y+S+xTxqDTFnwYmFAOuru2vI/Ru8raTxsl+jN5NAShLTJBNkowoT3csxJ
         XbvOAC55PtkWf91S9+sZ4XNwH7RIPS97e8RPJFIJHO2/TkUolUqMaLLqd998rlkLAS3M
         0zrUnV6AXT9qRH7CkFoNSb1Q/P0caK89dS62JKmf9K7LW5qOdW2vvu0VdLjjAxg1nSFZ
         5gjcZBo4BOnm9rBtEQ3cCB4dnxmmzNUPRev6a6aEoP1+fJYTPnmvg/4cPvOCXvxBVoZ5
         ONOSHvFMi0Rd9VyCClIZWbT1m8JNa63NJzGXljzwjUlNxEEHeqKE527ylCzuFXs6GUiQ
         yeDA==
X-Gm-Message-State: ACgBeo3iqb1eioLI0z20r8p1pGCsVttuTm8DE0mgnqfAYx4+Zzc4UJe1
	k5QeCpRzW+Lnh3/WGUTI+Pi2UGxmbeM=
X-Google-Smtp-Source: AA6agR6NswyIPay5sG+3BaxXwJ+N0g8WLb56K9snex4D/PKIPYvzRqGHxtDsTlYYE5W0CJ4oKIo75w==
X-Received: by 2002:a17:902:f546:b0:177:ed6b:4696 with SMTP id h6-20020a170902f54600b00177ed6b4696mr32601612plf.171.1663170488081;
        Wed, 14 Sep 2022 08:48:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:48:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] powerpc/64/build: only include .opd with ELFv1
Date: Thu, 15 Sep 2022 01:47:45 +1000
Message-Id: <20220914154746.1122482-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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

ELFv2 does not use function descriptors so .opd is not required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 44050863032e..404944263db8 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -181,11 +181,13 @@ SECTIONS
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
 		__start_opd = .;
 		KEEP(*(.opd))
 		__end_opd = .;
 	}
+#endif
 
 	. = ALIGN(8);
 	__stf_entry_barrier_fixup : AT(ADDR(__stf_entry_barrier_fixup) - LOAD_OFFSET) {
-- 
2.37.2

