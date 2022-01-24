Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092E4978C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 06:59:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhznn0LtQz3cR3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 16:59:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mlet655/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mlet655/; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhzmK2t76z302S
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 16:57:51 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so11066680pjt.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 21:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=572/iUmfMQMeK36G8Oj2d3ZOwWGO8dIfeilXEcFAr4M=;
 b=mlet655/2Smm9Vkf/pJ21luVZ1nF0VNnIrUj5NYQ1VmWHwK5k4dZ0eA+YKEd11zGqH
 BuGa1VofDo4H2We2Pie2tmWlm46QNEbbzV0L+NNdPahrZ82LyOnJDoAUZomgCHB+GtSR
 BAisWKQh9po+XQ7tdkjHRIQCbqzt31UytxCFK/StJ4zNj7YbgDSH+2TRiewvuCCjzk9y
 5K33h2VPFhowu18w5D0924ZeTow0CbpAlL/wCdBoDr7PM+iroid4BtpLFbiC3VMYRv4d
 oPd3J6+3EQcUHAXqsxeVxFJZ9158jBSDAEENtum/ts0Oz0Z4wAHxfSx15aToCyzsme9Z
 X1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=572/iUmfMQMeK36G8Oj2d3ZOwWGO8dIfeilXEcFAr4M=;
 b=MANrf3hW+oFXeMTNR4bYkRNzf+bniauLPNH1lOfz6RQ2qAGycGMdP2gGJLVsOBYQLe
 YkJmkg8JfuCbuH7kFQZIRSd9Yav26NKjwmOeMoG2cV5PTM+LYeJwkhqSwBe//wC0M/BN
 DRrylN5rtAp4D17FE/AFvNdgKGOwTUmNoh+czjuRlaavuZPjrLCBCT6IKgvPbp/w5e1N
 reuByiowHW3k1EUM6mV/F5Jcw0B3/wWNLpmpGYK/owffZdGq9e8Zc1JIHwOEqngZ9MJo
 MKcv1bKZP5e1O4xL6a/lL8+40Wd41fMVz0k8EJkzvjLjq65HOWkxLGsCcsPgw1yOzA1Y
 zuGw==
X-Gm-Message-State: AOAM533zcmg4zUqRA/iIcqdD4DgDvo/7KwjwAeF1v+ovhNpk4jK4eFTs
 2wk/GG24S3TzJQivgn5mNu6rvHmYJ8E=
X-Google-Smtp-Source: ABdhPJz8X5Tf0jzhfpIRQx6JnrPN+oNK0e4FDdqGURjMRGj4k92cxnymI8Y+8QyKa2EvNDjAJ2CkoA==
X-Received: by 2002:a17:90b:2351:: with SMTP id
 ms17mr438314pjb.186.1643003867836; 
 Sun, 23 Jan 2022 21:57:47 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id f8sm15045859pfe.67.2022.01.23.21.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 21:57:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
Date: Mon, 24 Jan 2022 15:57:39 +1000
Message-Id: <20220124055741.3686496-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As discussed previously

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/238946.html

I'm wondering whether PPC32 should be returning -1 for syscall
instructions too here? That could be done in another patch anyway.

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/64: remove system call instruction emulation
  powerpc/uprobes: Reject uprobe on a system call instruction

 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/kernel/interrupt_64.S    | 10 -------
 arch/powerpc/kernel/uprobes.c         |  6 ++++
 arch/powerpc/lib/sstep.c              | 42 +++++++--------------------
 4 files changed, 18 insertions(+), 41 deletions(-)

-- 
2.23.0

