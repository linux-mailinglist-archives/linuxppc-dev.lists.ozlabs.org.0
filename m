Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02513B9D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 07:39:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yHjh22tbzDqK3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 17:39:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Osp9npf9; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yHgg0qgyzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 17:37:34 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id w62so8024609pfw.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 22:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZL5+wtQV8L4I+t/B21mqCEwpOPwMzNG/NjS3uxYK18=;
 b=Osp9npf9DMbWRL/vufgokGg2WptMrjKk3OPeCm/0ik25WiMSpPAb4kujwVnvH7fOil
 oU+ORo+jZAMiq5H28oyIZLUvOcanWtdUkJ1mlpumXIg2C+EfGVsiU2cpuQimXlNAFfD2
 CVNZ4fDwlbPddmZWH/mpOH9zJsOU7fOaymLRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZL5+wtQV8L4I+t/B21mqCEwpOPwMzNG/NjS3uxYK18=;
 b=jt/3sk4Nb0WswpbXRivPBfodalgmSmnooNFvoUxYlqKLNXkthygzHupZskpxBccEsy
 6jjVdJq3/sL4ec3/+SyqfbpMLecb45v7ozMNHdsh65/AtQz9sNojde5KkESUipuE4yRk
 iCRjjT4j8fFQMl5YmJnjjQal45SUorLKpn14J5kJh6yajZOYHjdTrOX3OJkDz5l8kd2K
 DyOJtW5zpZn7g3C5NxzXGPtbOYI9jM3POE8/qVA+eOhya+lfqtI5Riybqqx4MzXPKF4p
 gGXD0CjefW9KTtX2/DHJGFV2+0uno0DhmbAc88A2H9Jkf6cRK3L9h28GxO79PLxm/pvR
 bA/w==
X-Gm-Message-State: APjAAAVNHFHoaAlOPOjF5daBE3HnCPy+C+6uS0AX1+sOPv4vPJeQQrXJ
 EIHzBQVgSuSKfY9Tu+BxACcjZQ==
X-Google-Smtp-Source: APXvYqz6twM/JSD4CFgc2SQAuWMMi7JwPofxcZnEA5RSwS0BHmT29NIEpqvWOQK7nIn36loT9ArrVg==
X-Received: by 2002:a63:2949:: with SMTP id p70mr31822201pgp.191.1579070251356; 
 Tue, 14 Jan 2020 22:37:31 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-8d73-bc9d-5592-cfd7.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:8d73:bc9d:5592:cfd7])
 by smtp.gmail.com with ESMTPSA id k12sm18720866pgm.65.2020.01.14.22.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 22:37:30 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: [PATCH 0/2] Fix some incompatibilites between KASAN and FORTIFY_SOURCE
Date: Wed, 15 Jan 2020 17:37:08 +1100
Message-Id: <20200115063710.15796-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

3 KASAN self-tests fail on a kernel with both KASAN and FORTIFY_SOURCE:
memchr, memcmp and strlen. I have observed this on x86 and powerpc.

When FORTIFY_SOURCE is on, a number of functions are replaced with
fortified versions, which attempt to check the sizes of the
operands. However, these functions often directly invoke __builtin_foo()
once they have performed the fortify check.

This breaks things in 2 ways:

 - the three function calls are technically dead code, and can be
   eliminated. When __builtin_ versions are used, the compiler can detect
   this.

 - Using __builtins may bypass KASAN checks if the compiler decides to
   inline it's own implementation as sequence of instructions, rather than
   emit a function call that goes out to a KASAN-instrumented
   implementation.

The patches address each reason in turn.

As a result, we're also able to remove a snippet of code copy-pasted
between every KASAN implementation that tries (largely unsuccessfully) to
disable FORTIFY_SOURCE under KASAN.

Daniel Axtens (2):
  kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE
  string.h: fix incompatibility between FORTIFY_SOURCE and KASAN

 arch/arm64/include/asm/string.h   |  4 ---
 arch/powerpc/include/asm/string.h |  4 ---
 arch/s390/include/asm/string.h    |  4 ---
 arch/x86/include/asm/string_64.h  |  4 ---
 arch/xtensa/include/asm/string.h  |  3 --
 include/linux/string.h            | 49 +++++++++++++++++++++++--------
 lib/test_kasan.c                  | 30 ++++++++++++-------
 7 files changed, 56 insertions(+), 42 deletions(-)

-- 
2.20.1

