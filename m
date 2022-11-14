Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E56284B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:12:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9vTc0QJsz3cHl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HQSXXTYd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HQSXXTYd;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9vSj0TQvz3c7J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:11:32 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 130so10633167pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 08:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFTjOkciAGcU2Xl9Oi2qWBnyuqd5AbVgZoUUEc9uRX0=;
        b=HQSXXTYdX9Uf4O5ZeruxfwppCCYfgKjqAqEZc7EZyZnuFrg0ToADu1wpPaatyNbP/7
         1fI1AgVbdxqoSMSa41ht9P2KYH4bXyxrQyZXPY64iKxyoxYRro7UAwydJvXYhNOVVfCC
         WeMPVgVP+KStkR2r2PyUewjvHOjxcVewPaUr18nxmH7eI0vTRhWJMusPYFXkGs/5mxT1
         4Cb1gvWFUOZLfUPv1bMU24rMc+cDnb7beUbo01o/Dlx++Jrvn1PGoV1gnTgUsRKqHAsE
         cLD1SDicGbgFbmQJA4wlm9u8EsCqkUjPs8ryS/H3t6OcButb2a3D+RT1wv1oJAMMFEiM
         naPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFTjOkciAGcU2Xl9Oi2qWBnyuqd5AbVgZoUUEc9uRX0=;
        b=WnKG28nfmmO3ZtE4a8AHs4OScNiC9r9k/QP7Bb7FF/rUzXtcM3h700yeU1wJHhC61j
         za/Z/XTf2bnKui/Xelkp5eI/IgSBIRX509dOl+sRL3NUwh1FSMgbTgu8viN2DiOQv2+d
         pLA++sKyWeNXXP9WmJwUAcUteykoDIqB3d9Q6lF/umwb79eYVBukCfo7iSGRTJpcat7z
         8c6yHK3SrNK2ELSafUTW/0jc6AUrY2S0lWU5IKsIiWovJDp7V4tHYHl7fdJsu6d5i/YO
         k6M1g/RyQLFjNWyZbPn7RRP/4RlvRInVSanTwJm3l8G+LpJlXbQPXAwS7++5GR7ilUAn
         IeoA==
X-Gm-Message-State: ANoB5pmX6z9fWEtrOikKvZ4bpGukXmeGfF/kNu0NWiO/+2IJeGwmN08f
	9mMgi66r/1maH7MTGidobjuWVThncJ1Nyw==
X-Google-Smtp-Source: AA0mqf7gAKFuzzbq1nHHu7FU0b4/pj5rhtaXR5NGKt/JUQOlN/VIpTf1a8vwdknKIUAgeBzPPCr8Ow==
X-Received: by 2002:a63:205e:0:b0:440:4ad7:cde9 with SMTP id r30-20020a63205e000000b004404ad7cde9mr12144141pgm.308.1668442289403;
        Mon, 14 Nov 2022 08:11:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-22-7.tpgi.com.au. [27.32.22.7])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b00186e2b3e12fsm7635883pld.261.2022.11.14.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 08:11:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/4] powerpc/qspinlock: make slowpath accesses more efficient
Date: Tue, 15 Nov 2022 02:11:15 +1000
Message-Id: <20221114161119.2883620-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series (at least the first 3 patches) will get folded into the main
series, but I will to post incremental changes first to make it easier
to see the change.

The 3rd patch is now quite an ugly mess, but once it is folded in then
everything should become simpler because that special case will never be
added in the first place. So don't review it with a fine comb, all it
really does is remove that branch.

There were a couple of cases where I tried to make things a bit simpler
but less efficient in contended paths. It turns out some microbenchmarks
or pathological cases might be limited by this so I'm trying to find
improvements. In one case there is already a better primitive available,
in another case the end result allows a much bigger simplification so it
should be worth the more complicated asm primitive.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/qspinlock: Avoid cmpxchg pattern in lock stealing
  powerpc/qspinlock: Avoid cmpxchg style patterns in queue head locking
  powerpc/qspinlock: Remove !maybe_waiters special case queue head
    locking
  powerpc/qspinlock: add compile-time tuning adjustments

 arch/powerpc/include/asm/qspinlock.h |  61 ++++++-
 arch/powerpc/lib/qspinlock.c         | 237 ++++++++++++---------------
 2 files changed, 167 insertions(+), 131 deletions(-)

-- 
2.37.2

