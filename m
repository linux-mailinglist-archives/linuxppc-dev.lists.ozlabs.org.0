Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D539235E052
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 15:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKRcw5BQ7z3byW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 23:42:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oMUUSP7M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oMUUSP7M; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKRcX2S9kz304D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 23:42:36 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d8so8226088plh.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7MSTQsSZSicQObTfMfxpXsyE7yOosfcVZRQwmQUgIs=;
 b=oMUUSP7MZ/V4s0ShLsOp/gj2vQ+9ZQPfdogQBa9yGRKwbxdMJ80JTRhVF3wIRV9/qc
 uBdvjDLGrfCk/qpt0NiSritJ8Bs6aAt8PkhdPNYLyRAlBxbCGQLB+yI7qOZA3dLKth68
 xlzwjyZaoAaHNaS2l2jzJRP9tXQNTYtHoPEw8XMLxdFplhXheCc3dqpF4VA58fS3F7ow
 VhC5jRsPG4+MvMuWmxlYfPTuv/dFJsQnpnk9aXmTsoqqsSqFPUkY3KSjXmw11NBN7pdd
 Mv1WFphsbS9AzYj8oTv/4Y7/UdQ3fcptxlE8i/dZ30l4zPSQE96La1dG9TaAnFGcfYJm
 39hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7MSTQsSZSicQObTfMfxpXsyE7yOosfcVZRQwmQUgIs=;
 b=lEYLFIaA/D60xiLZgytpLs+e7/pHEHzRj2JYjbKz1QkHvPIBKvGdpxQbzP1Ajm6zbp
 Z1bfRUSvwKYhiU3TRx5Ks/g/aCkayWXxOajof8Lwvv5FHXJBLlhh/4kQyCcJsDpQTLB3
 8ak+WEeDfNo84doW5pYznNPnk/zyXil9kJs+LpKQieSUI0G3niA/P8kcGzQZQLsytWUd
 ms4WA1ThTD7Kh98Z+sUVKNjo5muXQp1FvteJK9MbyVRUz3Qpy6jUbnbQf9TSgRFB9Ph5
 LMfFvXdH+xToIxCFaeW+nql7JtOTJLDflxk1nw5oRQ9DyLDeyx7V1nHIeVolrA1dZxpQ
 uLxw==
X-Gm-Message-State: AOAM531pK3HGWglDmeM8fcgFjGAzQRrLuyLtgX4Chm2p6Yc7oQ/V8Nwx
 nzWDVWnPoqosp0E571ihhy4=
X-Google-Smtp-Source: ABdhPJyPCtlLPGatTTz1M/YhH2KN+c6H0kIdYGVwtChIG0vvaZUrVhMyLKcjx1nAS5xxd0Yt7YipMQ==
X-Received: by 2002:a17:902:ac98:b029:ea:b3c2:53da with SMTP id
 h24-20020a170902ac98b02900eab3c253damr19358722plr.23.1618321352371; 
 Tue, 13 Apr 2021 06:42:32 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id l22sm100465pjc.13.2021.04.13.06.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 06:42:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 0/2] KVM: PPC: timer improvements
Date: Tue, 13 Apr 2021 23:42:21 +1000
Message-Id: <20210413134223.1691892-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are small timer improvement and buglet fix, taken from the
KVM Cify series.

This is the last one for the upcoming merge window.

Thanks,
Nick

Nicholas Piggin (2):
  KVM: PPC: Book3S HV P9: Move setting HDEC after switching to guest
    LPCR
  KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races

 arch/powerpc/include/asm/time.h | 12 ++++++++++++
 arch/powerpc/kernel/time.c      | 10 ----------
 arch/powerpc/kvm/book3s_hv.c    | 34 +++++++++++++++++++++------------
 3 files changed, 34 insertions(+), 22 deletions(-)

-- 
2.23.0

