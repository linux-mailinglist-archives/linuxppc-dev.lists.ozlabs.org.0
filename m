Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89C7CA847
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:44:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ktOQxYKD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8GyD5S9Xz3cLV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:44:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ktOQxYKD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8GxL1ZKMz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:43:16 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-694ed847889so3440361b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460192; x=1698064992; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvUX8oITss4LQENjpBOIKSFgOgOEsRng47N5dLPfe5M=;
        b=ktOQxYKDYH9kLRvt8IrfAK9MI134hcuJp69Uql70J07ZMa6lj3JTH7yPaEQho9oGnS
         iTjGAQASp+j4SnP9lD1VYIedclY1qo2gv2HQOJWZypyFVKiIRfXz3+B7IDQgdoyQMPeg
         vydR8Z346W9xMEEisnxSlNdtjCDBEdNjBNLQCABJoMbDtUJLwJvzP7p67JtWZEL31y4n
         g+yYuROnCoaTFyPSa2bc/+Jv9bCHuwo28AR6QydJCf4mg3pAkyzfX3oqKwM8trNaRhOJ
         YDCe3L1LxaOXMCIDtt027vETCDoEkEp+08MN3/Q8gAMiBsbYhUrs71PICoSYav2JgXNQ
         OfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460192; x=1698064992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvUX8oITss4LQENjpBOIKSFgOgOEsRng47N5dLPfe5M=;
        b=UoTn6o4rEtnJv5RXt6LGh3Ha2jRURN5o2WBRAsP3bHl38K1iJ3Rva4qKPpB2JXokoH
         kYgISUtQGfg/UWh9WEij69l7Q1sc/z+fGzhbv5y1NHcDilc5BM6gojnNHV8/dCsxuT6v
         iQUWHX47H1k5WhjiWelcE/7Vdug+cQ3rKFvMIenkmzHjrjty6vGBl1ycTkv9yP64W43t
         UxgL4IFvnBVJjSi1tE2CqHROj/q76Rl2yI5J1xOB2DvX2aA6KCg77V7+GEncWFW58BBY
         9t1LhtbBYzs5BCynDPXVKbBxcGUxANIHbUkUvi9C7Jmv5YCIr1ciHf0F9jvuPpTWEcu4
         Bufw==
X-Gm-Message-State: AOJu0YyDY3A9Yu2H6zI+uOS6c3uqg9+ByI996uhETQ/+UEdAe/snwUSA
	3KlPS+HDtfpp5jYehe0E69rJG/0E8Kc=
X-Google-Smtp-Source: AGHT+IEL04Q+FfBelPUWa5twxQZhctEoP7+Kt9C3Tl2cIlbkh6WoRfijEbasWWWbqr6YabdUAMP9nQ==
X-Received: by 2002:a05:6a00:a8e:b0:6b1:704f:2078 with SMTP id b14-20020a056a000a8e00b006b1704f2078mr9570862pfl.33.1697460192243;
        Mon, 16 Oct 2023 05:43:12 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:43:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] powerpc/qspinlock: Fix yield latency bug and other
Date: Mon, 16 Oct 2023 22:42:59 +1000
Message-ID: <20231016124305.139923-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a long-standing latency bug in the powerpc qspinlock
implementation that quite a few people have reported and helped
out with debugging.

The first patch is a minimal fix that avoids the problem. The
other patches are streamlining and improvements after the fix.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/qspinlock: Fix stale propagated yield_cpu
  powerpc/qspinlock: stop queued waiters trying to set lock sleepy
  powerpc/qspinlock: propagate owner preemptedness rather than CPU
    number
  powerpc/qspinlock: don't propagate the not-sleepy state
  powerpc/qspinlock: Propagate sleepy if previous waiter is preempted
  powerpc/qspinlock: Rename yield_propagate_owner tunable

 arch/powerpc/lib/qspinlock.c | 119 +++++++++++++++--------------------
 1 file changed, 52 insertions(+), 67 deletions(-)

-- 
2.42.0

