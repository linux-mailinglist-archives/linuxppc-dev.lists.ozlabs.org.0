Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5E870EDA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR13Y705jz3f8L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:09:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KvdOqEDV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KvdOqEDV;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR12l4ty8z3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:08:31 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so517620a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908508; x=1687500508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2uEwnmXQmyRNi21sEXKuJ/riClDNNGx18hhCLXD7ycE=;
        b=KvdOqEDVhPAFT5hDPHvZMLJsUjlxq1G1GoXN+DsnMgPe63ZJnrZIjNHjOjx4N9fRIR
         DS2Ztm5Djpjm3wSx/lBhv51w1jYk63r4WpkR0e1kGcKBgxx1jXZ3T89mfq6xrthrNaJK
         5ea21BVIsTwBd40Dia5DpiLG6L55SyVjJ6JS5diceo/i6rw//JJZtl5dpKjHqAfK7To1
         KzKeMCbBF8LZ/UP7Sx9FmLZGDfrKddGmHAz09PqyLyXM4gbldSvS/4XFyd0GhdzGWvAa
         ulYQacxnCOkmn+raCDYgyIyUW/zwBrUureKRaLZnSXgUSiy1ECjX3jJ3kA4NLuZDTRRh
         0I3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908508; x=1687500508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uEwnmXQmyRNi21sEXKuJ/riClDNNGx18hhCLXD7ycE=;
        b=Xk8TKTDe4fQwNumBGHEd1k6C1skgKs6mt4SEUTAyQdvxQYV4VXxmjfcefLEriiUQYd
         8DfCa8K1kl5Df8eThjSSxzsW6d7e++lDGcPvT+o5EO7TsWgI9tMLXXz/EoN59gFQG//x
         LbJ7aunXVb1Dq2RaIJEPfWSwSGcyVvyD9lrbaz1wPrI3GppDbu6QJX1mnjnUiIlkXWcY
         wj13bunnimVnWHTSpKflyb6AEt0ktjCnkbMDSq18StbMNIyUo0ID3uDn92UPL/de5JRa
         HoCUG53eiU9tDYex04ZxGMa26z7vEQCqtQRLCk2LDi/+/HWY9Tzq/UMTtHxOaC++OnWp
         o/zQ==
X-Gm-Message-State: AC+VfDxRxoX+OeO3fypBgs7V2f9btScdmvxGOxE4r27j7A6VVbcOTxvl
	j0y9ogZxpkp+Dy3SWG7getA3PUgUpz0=
X-Google-Smtp-Source: ACHHUZ4r2DOz8w+fQB0+2z6jVus/uWBfeUbr0K8m/jAfmBiZbntnrNBy3OtDJIfyW4yKqchJaiBVgQ==
X-Received: by 2002:a17:902:daca:b0:1ad:dbea:6e09 with SMTP id q10-20020a170902daca00b001addbea6e09mr19574540plx.66.1684908508122;
        Tue, 23 May 2023 23:08:28 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c14900b001aaecb74f82sm7793019plj.72.2023.05.23.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:08:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc: mm_cpumask cleanups and lazy tlb mm
Date: Wed, 24 May 2023 16:08:17 +1000
Message-Id: <20230524060821.148015-1-npiggin@gmail.com>
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

In the process of doing patch 4, I found a few things we could improve
and tighten up with mm_cpumask handling, so added those first. They're
mostly just debugging, no real fixes or dependency on patch 4 there.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc: Account mm_cpumask and active_cpus in init_mm
  powerpc/64s: Use dec_mm_active_cpus helper
  powerpc: Add mm_cpumask warning when context switching
  powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown
    IPIs

 arch/powerpc/include/asm/book3s/64/mmu.h |  2 +-
 arch/powerpc/include/asm/mmu_context.h   |  1 +
 arch/powerpc/kernel/setup-common.c       |  6 ++++-
 arch/powerpc/kernel/smp.c                | 12 ++++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c     | 28 ++++++++++++++++++++++--
 arch/powerpc/mm/mmu_context.c            |  8 +++++--
 6 files changed, 51 insertions(+), 6 deletions(-)

-- 
2.40.1

