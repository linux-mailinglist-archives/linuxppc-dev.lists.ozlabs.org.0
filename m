Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7786972380E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb1JF1kVmz3f8V
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:47:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=p2mLvfL6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=p2mLvfL6;
	dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb1HN3Hwnz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:47:10 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6b2041315a5so1177522a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686034025; x=1688626025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpS+7Y45j46Pn0A0Vwj2taJ0XM2ZW9Br3yi/49LLWqo=;
        b=p2mLvfL67Uh7IORNJ/w5kOyJ71XGhQqUNGf8h1V8elYjKvNR6O+CPy7kufKtzy8FZa
         9ZuphV2Sf0cy8+f+wjwoGgd1fkqpDOwtB7L4cdXoJLw70VInSA32Nuv3+CXijTs1xFee
         jf9OCjyc/4cdGrMXo/NazaRphXAWhP1/TpbNLQ1V65GrUJak/Dd3eLxzb+ZU+E4IYzNR
         W+un9xMZW28aVYAEkRaCztMkXV402ugz0NTvDYKmSYEITKPtMwhhMDMo0ISIFedgz7F3
         0WqClKKzotSvludI6Dh/kvCI9el3stOJHUhEZb1MrBwT/eVK8tHuObkc94hwyPnh3LDU
         YYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686034025; x=1688626025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpS+7Y45j46Pn0A0Vwj2taJ0XM2ZW9Br3yi/49LLWqo=;
        b=Q6Lk9BtT9fd867h6CjFim8+hU1oGdpPfRKpaRUkH5Gx0xtOG9rp/vLM4fq7ZEH1jzn
         r8USrkxME8TOMzXbJi7pHq4s1+qAdhzPyJ+pfP2TjCrfN1dBK2s48GUjdpx/0uqCpUE3
         2EgL+2GbLp1OLd/WhXwdW4HceGtdZr90Ptk1XtJx6f7cVdVaBJJ7RWaw1719l5TimqkQ
         tUqa8uHkh6mALs4S4d3rx2BBNn5oElqo+F8BzvI18EwmOR65+LGv1+PA/wgIqygDCeC7
         rMtjjdHG7gCFZkwOUKdWmreqkcdsJa8pCtWHiuDYilcNJ3Kl8ZXVNmFxqv/tnT3UpuDC
         QU9A==
X-Gm-Message-State: AC+VfDyGwzFRZNG8Gyu0P/dPv6SCx3ABNwqK7sRxisHhmJ4CQoKS9sH4
	omluJFXjPBDuJ8EODZH4zttsPtj1Tns=
X-Google-Smtp-Source: ACHHUZ5bHvn09zgpXCCMeRANZIvt1BqulKPJYmG8y7dCYAiYwG+huEgKqo5jjAFxna+a9rEU2DMOHw==
X-Received: by 2002:a9d:7cc3:0:b0:6b1:593d:539 with SMTP id r3-20020a9d7cc3000000b006b1593d0539mr1221012otn.21.1686034025155;
        Mon, 05 Jun 2023 23:47:05 -0700 (PDT)
Received: from wheely.local0.net ([1.146.61.5])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78e0e000000b0063d24fcc2besm6130449pfr.125.2023.06.05.23.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:47:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] powerpc/boot: build flags refactoring
Date: Tue,  6 Jun 2023 16:46:53 +1000
Message-Id: <20230606064657.183969-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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

This is a rebase of the series here. It's no longer a fix because
the clang build issue got a minimal fix. A couple were merged, and
I pulled the rest of the boot specific ones into this series.

https://lore.kernel.org/linuxppc-dev/20230426055848.402993-1-npiggin@gmail.com/

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/boot: Separate target flags from BOOTCFLAGS
  powerpc/boot: Separate CPP flags from BOOTCFLAGS
  powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
  powerpc/boot: Clean up Makefile after cflags and asflags separation

 arch/powerpc/boot/Makefile | 66 ++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

-- 
2.40.1

