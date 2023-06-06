Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5352723DE2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb5674FkZz3f0P
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:39:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I+XZ3olF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I+XZ3olF;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb55G1JJqz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:38:41 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so3626831b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044319; x=1688636319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlkUX5KqMcFkcDmdYWKAONNwKL2X/r+19Kk68Sxm8YE=;
        b=I+XZ3olFaTE5YC/1V1nhbNsd92T1ATwTuDgekDsqMdlfYUCn4yWrTPBeuDx16Nz+Xf
         7c6x4NInV3utBNhz4R19bBcp6tOLF6ToMcs0qPWzy0I0qesyjICDndAlSfm+29nj+D6h
         WLn0he3WAt1oH6s8XGWAQERknI1BnPUZe53n3kLrHk9uPJPGDxp6gM3O3nSE5U6SNmUS
         achY7pglvo9ohE3gUmsy76208izjeuDbNmpyVGiERzKidNUWp2p2YJ49OLN6K82Yksda
         0x+WOCIX9UdwbHn6RCoi49d2SHy0W3q7U76a0AnvvgF5IQFXpgHB6wQ7Ogy16shywPZH
         zYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044319; x=1688636319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlkUX5KqMcFkcDmdYWKAONNwKL2X/r+19Kk68Sxm8YE=;
        b=OB9nZndmEYtJ1wBouAW64dy1TnPLZLitb1VCuICDjhL3wKryAOR6EO10iKdVa4mBZr
         IgBbhCoSDSp8hJKCm7wifb/JEAlcSzp7Khyq8HHCmEDNxnvY3fjPo/ry5VMfLnbscZEN
         9Hw0RVRIbw/c3cmUuuOdoLInJ/qZMWcTTIezlBfaQm5sLxhqF7eGACa7+o5fJLa3VU8b
         wKZPnxaEEbjJhXoFFqnOruNq/xMfHY2Cu0BwL8IvPDCU0N18R7Y/++6EYEWnwznjADmv
         Agkmic3hPw104z+nm3QQtNYCgiV35cWFCzBBqKt6S8Ttu9ZG71qwCQ/S+t7uSvjOW7/5
         5Z5Q==
X-Gm-Message-State: AC+VfDycCUTd+9SX+DwLyaFbyDtO/oDE/43zRYhpt/YWFn1jov6pRmLo
	UhKoZy+MGXcEj7nhtcwuCAyPfihgW5bdIw==
X-Google-Smtp-Source: ACHHUZ7H9OLRb1nefMYQfRQ0q4Ov8YVT/SEOp/lLq3Isx7WBIsNcYFFOKynCVsfilEpMmYnBENZq+Q==
X-Received: by 2002:a05:6a20:8e08:b0:10c:1b38:c89d with SMTP id y8-20020a056a208e0800b0010c1b38c89dmr1287230pzj.2.1686044318872;
        Tue, 06 Jun 2023 02:38:38 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001ac8218ddb7sm8048442plg.84.2023.06.06.02.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:38:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] powerpc/64: ELFv2 conversion
Date: Tue,  6 Jun 2023 19:38:28 +1000
Message-Id: <20230606093832.199712-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a follow on from the series here

https://lore.kernel.org/linuxppc-dev/20230505071850.228734-1-npiggin@gmail.com/

With feedback addressed and Christophe's -mprofile-kernel for BE added,

https://lore.kernel.org/linuxppc-dev/20230506011814.8766-1-npiggin@gmail.com/

And dropped the last RFC patch that removes ELFv1 entirely. Maybe we can
wait one or two releases after this before doing that.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64: Force ELFv2 when building with LLVM linker
  powerpc/64: Make ELFv2 the default for big-endian builds
  powerpc/64: Use -mprofile-kernel for big endian ELFv2 kernels
  powerpc/64s: Remove support for ELFv1 little endian userspace

 arch/powerpc/Kconfig                            | 13 +++++++------
 arch/powerpc/include/asm/elf.h                  |  6 ++++++
 arch/powerpc/include/asm/thread_info.h          |  6 +++++-
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh | 11 ++++++-----
 4 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.40.1

