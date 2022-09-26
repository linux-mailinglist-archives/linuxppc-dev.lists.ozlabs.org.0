Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF75E9909
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbX8t5lkCz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:57:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DcywYWL6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DcywYWL6;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7f3X9Lz3bhQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:29 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id s206so5638556pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YcVcOO94rG0dOUZlOvzalIdxyQNM30WrX5rCc4RR/YQ=;
        b=DcywYWL6GPMKBCkqbYSpEwyLA5weV+92/16N+ns0XThoYdVyplqmhHK4f5V40PbQoU
         y+GMbqIUVGIiBlWmSGqMwg4L8YCE8ghUTzpGYdhMoLU1W/pIN4wEt+7cZIquvR+Xjcxb
         esvSTZSxyLUdrtESmoNrVad/v2uXtAbf2QrriR6eSkAe7Un9cNucWklW6FpOXwWpQHCY
         QZcbfL5xjWzt4ZREHKTHFdDVodUC2brmQ8KhQSaBndwNrCO2TKYKFAxVkKMuxAqYVHK5
         USmhy+KqXsCdTgLj7an5EKsI/iQ7IB+LtZjXFpRdF9RiIgLJE6Esd2G+iz6HBNspF1Gx
         1UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YcVcOO94rG0dOUZlOvzalIdxyQNM30WrX5rCc4RR/YQ=;
        b=xSjnydedWWBovZERBIaQ+XN6rTHHEeOstYxc/PJjQiaRjPx8b7q/X3TJE+1fiRScXA
         BiUMINNwgays5fNAmMy7JUT/3FFz5aHHX7Bma4SFqhYdN68k28SGBbQIof1erCK82HN0
         UXIhYtjRX/CrihdrukxgWmEm5Km7COmPPkDsJEbK70aVP/r9dmcJB+rUdr2Lor3lmipX
         5PrmY5BvDNfZPA+ZKxuFP85LLExIE4i7voGM3/jnyP9KYwhKrOe5qCdpP3ccGMayBotn
         g+2hJzVBtX5LE4TkOxrX5ooAnahe/AkZc5ccx7B+KlgXRuceSDrSPaKdbiLrKFCW8V2W
         bwGQ==
X-Gm-Message-State: ACrzQf3oRsxeVM/oTBGupLDdg6wtMvl3bn9P4Lqa8Kl4vGJRCvWloVxC
	YVedHuprzzvBdyG1lUu2bCdA8yR8dXLiGg==
X-Google-Smtp-Source: AMsMyM4SUrykCaBXhChIhtZXBiyB88GkzoIVqr10jO0oswejLIeM3gfm7HI0K9ihR4pLNDfZ6s0Lug==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id l13-20020a056a00140d00b0052ad561d991mr21983824pfu.46.1664171786443;
        Sun, 25 Sep 2022 22:56:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id pv7-20020a17090b3c8700b00203a4f70b90sm5628075pjb.45.2022.09.25.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:56:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/5] powerpc/64s: improve boot debugging
Date: Mon, 26 Sep 2022 15:56:15 +1000
Message-Id: <20220926055620.2676869-1-npiggin@gmail.com>
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

This series provides a machine check handler to catch out of
bounds memory accesses in early boot before the MMU is enabled.

Since v1:
- 64e compile fix

Nicholas Piggin (5):
  powerpc/64s/interrupt: move early boot ILE fixup into a macro
  powerpc/64s: early boot machine check handler
  powerpc/64: avoid using r13 in relocate
  powerpc/64: don't set boot CPU's r13 to paca until the structure is
    set up
  powerpc/64s/interrupt: halt early boot interrupts if paca is not set
    up

 arch/powerpc/include/asm/asm-prototypes.h |   1 +
 arch/powerpc/kernel/exceptions-64s.S      | 117 +++++++++++++---------
 arch/powerpc/kernel/head_64.S             |   3 +
 arch/powerpc/kernel/reloc_64.S            |  14 +--
 arch/powerpc/kernel/setup_64.c            |  33 ++++--
 arch/powerpc/kernel/traps.c               |  14 +++
 6 files changed, 120 insertions(+), 62 deletions(-)

-- 
2.37.2

