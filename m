Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A4676589
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 10:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzWzW2Kwhz3fJy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 20:59:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gUXVQTtN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gUXVQTtN;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzWyc0VDMz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 20:58:14 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id d8so7735041pjc.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anCC94x6wcBcPkIHGgLnD0bxahRz/lKhrYIpcZ/2b0s=;
        b=gUXVQTtNvzzv3dO6ZDDwNOmq6+E7//2jUXPBtAHIdoN4H4B9LreW9tPTQn5im1DO6v
         abdUoAF1FIS2v/AygifVbmzWMbhtmkM5zW3BHrE2KMNcLRaoRwBRXznwFy+l7XOKUbeA
         lM02G4HdVf7Ney+N1hS3oddTLwDXODqmkTvAu1Ux5i6z9EWgpvjADDIVXVTxdowwkd2z
         xMwPFAUF5BsFC9oNhfzLwfE7u12qwpbtv6OJ4D+wRyHlHeyG7+R2KiaJRK2iL6AjGz5U
         NzH876uD47IYH2slGt6fovS5vbSU9fj4m4NBdl7g2WZ8M3ZMvZr4uThcQQw+Dx3z6lzt
         pXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anCC94x6wcBcPkIHGgLnD0bxahRz/lKhrYIpcZ/2b0s=;
        b=1uj6bpNey4wpOAT1DkcJiR04bNAXpgKc1DSj9TJbfRsdVMmEo0ruQtW0NNR/8pww2M
         96xdKlRCp3wrij+GEaPEYd4gUExQXtak4y7Fitqls4zl1bKSXEZuie6kWFr+tLf5vzxz
         mySaZ8Oy8Ec/KhRDjF4NIHkwL7Aiyy10ZIGU4pIlaBKV6GLRScbdk1EJ4Tn14pGMktYE
         N4JF9/84sYhWGDXbqM4IsvVrLfw7I2uWMH25UN4nZfAmvMGmGCiS/0zx72aeYlwvW3bt
         FeDiPJIj87PJUbyFeIvQp5yUhaKIztp99t9GTgLR85OpcGExApUyKune4dqAUP3qkxnb
         Y6AA==
X-Gm-Message-State: AFqh2koIilvk28ltaH9AwxNijDAWjuWP3XaxwUFlzpceeGny/q+0TYME
	ZeKoRQl15QdhZuNLP5wH5Zcf2Ub3CmM=
X-Google-Smtp-Source: AMrXdXtZCxJKNyIS7qo/gEQn4T+z4Bh9QBenGonY/2HY53L1imyzvf51mXLIsPwZ8F66/SmbG9IQvA==
X-Received: by 2002:a05:6a20:3956:b0:b6:386c:d53c with SMTP id r22-20020a056a20395600b000b6386cd53cmr23957964pzg.59.1674295091489;
        Sat, 21 Jan 2023 01:58:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id r33-20020a635161000000b0046f56534d9fsm23733539pgl.21.2023.01.21.01.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 01:58:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] powerpc/32: nohz full support
Date: Sat, 21 Jan 2023 19:58:02 +1000
Message-Id: <20230121095805.2823731-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

I'd like to try get this series merged. If Christophe isn't comfortable 
with patch 2/3 yet then maybe we could at least get the first one in
which shares more code and makes it tidier.

Since v1 I just split the first patch out so it's not introducing a
significant functional change.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc: Consolidate 32-bit and 64-bit interrupt_enter_prepare
  powerpc/32: implement HAVE_CONTEXT_TRACKING_USER support
  powerpc/32: select HAVE_VIRT_CPU_ACCOUNTING_GEN

 arch/powerpc/Kconfig                 |  3 ++-
 arch/powerpc/include/asm/interrupt.h | 35 +++++++---------------------
 2 files changed, 10 insertions(+), 28 deletions(-)

-- 
2.37.2

