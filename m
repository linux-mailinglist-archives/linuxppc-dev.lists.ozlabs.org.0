Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 660175943C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:34:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zn7B69S9zDql5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:34:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XX5h5Naj"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zn5V2gkKzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:33:17 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j2so2448424pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1dXvzrefoIpcW9SqkwaNtlwD+cS0A+IF7woUE3ULj7M=;
 b=XX5h5NajbW141m7KZujC4Nik2hDCNww3jWrB9c+lgJgHlUT+rHkl6wd4jW8KkrS0oq
 mJEL8aV0IcU9VD9Cuporg0eWzpD0DDHBLV9M/P/A9rmAUAhXt0qcRcFV0tQM3y6BKciD
 2kArlQ4o/xTwGHA5iRE7uXb3iDaLxI9KdVv6cmF54wcf4xBLOckXmHFTDPhl9hYEos+7
 0O0N4jZEGHLHFtP9HU1OkEEtS6ab7xq8JfKwGp/Of5QJ44s2x76RzMU+HpnPjxqtFrr5
 vVrR/FmEYDiPpc2lYrNYooVz12J8d/M7ni6+M/QzxiOqpCn8Rlb5jIBOywue2AsNXdpH
 a0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1dXvzrefoIpcW9SqkwaNtlwD+cS0A+IF7woUE3ULj7M=;
 b=jTF8EUwlGYirjwWFPnar54LeGfq18iaVoFhNH7rN4RHOgZZeMR6w6fPvYu0QvlE5bw
 crqhclDEiaS0NdJGUq/SA8JEQHgye5yP7uHYqpHGbaTVfRedUVz2h2CzvbR1FqvHslAh
 wPzAkhgWGHitU8CfHgESJ/j0viMcmZWJpj5WYnB2WdOH62r6p7L8Hyjfuv2s1elVspXV
 FljpitKdDBCMhRGShIsnKquLj0ByHwl/MvUUQ7Hw2ydKuyH/dUxcfuUOGg9OaVCrTk+M
 58+v4Rw0QhVP3DTCxUxnwjQtms0X24EYMf3doZN0P58k93IXPDQSES6Ky2r4kv2ojsgu
 gnLg==
X-Gm-Message-State: APjAAAWuGKcmWcgiHKEgxhZT1QVb9aJiE6U3x52j7fIPhjNyG0rc9Fs4
 HRJ7MpNlnRzAqmerKu1Gj74Z5WfN
X-Google-Smtp-Source: APXvYqyo7bcO/fYbrEskDS/o8dcpBIjZAPoFmVYVanyhQRiGgwv719nRiWQLJmDgT73RyT1VPWKXCw==
X-Received: by 2002:a63:607:: with SMTP id 7mr5298092pgg.240.1561703595548;
 Thu, 27 Jun 2019 23:33:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h14sm1071500pfq.22.2019.06.27.23.33.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 23:33:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] rework bad stack, sreset, hmi handling
Date: Fri, 28 Jun 2019 16:33:17 +1000
Message-Id: <20190628063322.11628-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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

These are some significant changes to generated code here, again
with the aim of simplifying and improving code sharing.

Patches 1, 2-3, and 4-5 are independent in case any run into problems.

Last big thing to do is machine check I'll try to send out tonight.
After that we can start more unwinding of macros.

[ BTW, the end game here is that each handler should be able to more or
  less specify _what_ it wants to do in macro flags, and the generation
  that takes care of _how_ will mostly be in a single place. e.g.,
  Rather than some magic combination of EXCEPTION_<number>, it will just
  specify that it wants an early realmode handler with an alternate stack. ]

Nicholas Piggin (5):
  powerpc/64s/exception: remove bad stack branch
  powerpc/64s/exception: optimise system_reset for idle, clean up
    non-idle case
  powerpc/64s/exception: sreset move trampoline ahead of common code
  powerpc/64s/exception: hmi remove special case macro
  powerpc/64s/exception: simplify hmi control flow

 arch/powerpc/include/asm/exception-64s.h |   7 -
 arch/powerpc/include/asm/paca.h          |   2 +
 arch/powerpc/kernel/asm-offsets.c        |   2 +
 arch/powerpc/kernel/exceptions-64s.S     | 231 ++++++++---------------
 arch/powerpc/xmon/xmon.c                 |   2 +
 5 files changed, 86 insertions(+), 158 deletions(-)

-- 
2.20.1

