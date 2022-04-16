Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D574503212
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 02:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KgDsT3r8Xz3bdL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 10:41:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N1gzaNMp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N1gzaNMp; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KgDrp6bvFz3bVN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 10:40:57 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id t13so9103570pgn.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 17:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWFJae0wB3i/+AjUHp0kgcY6gHCBjSvEexFbtOZL7cw=;
 b=N1gzaNMpjSVHF43xt8VTC6Pq6l2GGjFsGQ2QmCg0hWKpuUjwH6vK2ITiQVZ/tbemQ6
 qTh57IrnV2xB7nCCB1+4ZkXhgIjGuXRLEAc7THqwNOEjvZGrbASW0kHxuNjZqxNE1dys
 9BJc/J77Ux1wsq0Y6ot5Ue0Nhymb+lTik1oXUfm6SRUKGu9FvUny3MNn5TXgmQbLlgQw
 cUHoYnw/bOS0YKjN9PTgYjtVl1DedARYXGIVXk0OYIZGJm4EIw2LP3n60vQaBcQJodmD
 FoOjiZdxyr/vyroCOZRG8JtnGDIKfP44EVw/uKWZXBA+EPPv9krPQ5Jq4nggSsYucc4N
 +dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UWFJae0wB3i/+AjUHp0kgcY6gHCBjSvEexFbtOZL7cw=;
 b=cve32mvkizmDb0W6+f6Jt3sff79RpBBz/uDTAhyR4MYNKwJbA6vlzdtu5pVPFZA2A6
 Re9GMDV/3NK/BofQKmAJhm3Xcq3ZBBYuE+vZ6TVUtOuMNYeKilwnqHu6rktUeYQfyDIG
 zoRNBQ2/+q4Zx+fybp1ZuLHcA2+22pM3bxRQzdVQ+LA5qqqrRUB+Ha8zv6qvm+dBOWgK
 LHgEzsDQw8h0pgmKOQsFiwyCrs8pmcq+o92sF/HM3SVQXDcEda+en/pkMLsA1ihL9Jtp
 EWofuaybGlWbqzIeRtNrm30g2aqd9P2ztdSCjpMcx3UKoGtxeNPkkuM8VESLjqKclqbs
 s4Iw==
X-Gm-Message-State: AOAM531iL/u+3hbIjElZ38ywJSG8DFDn9+uYLrnZKxei6MGmVxMkeXlu
 ebVaHa3vhuANQNTP5zapjlo=
X-Google-Smtp-Source: ABdhPJy7+O0d1TAWEptQEO1FaQlgJslFZTjGjF/ZuzHuNoQrVP6vRz/HM02MSWZFO67NeYN6B+T6Aw==
X-Received: by 2002:a05:6a00:14d2:b0:50a:48f0:881a with SMTP id
 w18-20020a056a0014d200b0050a48f0881amr1390703pfu.36.1650069653526; 
 Fri, 15 Apr 2022 17:40:53 -0700 (PDT)
Received: from balhae.roam.corp.google.com
 ([2607:fb90:461:36d2:dba1:7530:2cda:19b1])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm3913537pfu.82.2022.04.15.17.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:40:52 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>
Subject: [PATCH 0/3] perf tools: Tidy up symbol end fixup (v3)
Date: Fri, 15 Apr 2022 17:40:45 -0700
Message-Id: <20220416004048.1514900-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This work is a follow-up of Ian's previous one at
  https://lore.kernel.org/all/20220412154817.2728324-1-irogers@google.com/

Fixing up more symbol ends as introduced in:
  https://lore.kernel.org/lkml/20220317135536.805-1-mpetlan@redhat.com/

it caused perf annotate to run into memory limits - every symbol holds
all the disassembled code in the annotation, and so making symbols
ends further away dramatically increased memory usage (40MB to >1GB).

Modify the symbol end fixup logic so that special kernel cases aren't
applied in the common case.

v3 changes)
 * rename is_kernel to is_kallsyms
 * move the logic to generic function
 * remove arch-specific functions

Thanks,
Namhyung


Namhyung Kim (3):
  perf symbol: Pass is_kallsyms to symbols__fixup_end()
  perf symbol: Update symbols__fixup_end()
  perf symbol: Remove arch__symbols__fixup_end()

 tools/perf/arch/arm64/util/machine.c   | 21 ---------------
 tools/perf/arch/powerpc/util/Build     |  1 -
 tools/perf/arch/powerpc/util/machine.c | 25 -----------------
 tools/perf/arch/s390/util/machine.c    | 16 -----------
 tools/perf/util/symbol-elf.c           |  2 +-
 tools/perf/util/symbol.c               | 37 +++++++++++++++++++-------
 tools/perf/util/symbol.h               |  3 +--
 7 files changed, 29 insertions(+), 76 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/machine.c


base-commit: 41204da4c16071be9090940b18f566832d46becc
-- 
2.36.0.rc0.470.gd361397f0d-goog

