Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60C4FB01
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 11:47:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WndX24dwzDqXW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 19:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YVFZcHHR"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Wnbg4NnzzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 19:45:33 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id m7so5175210pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGbjyf75c99S79YkNwkfWRcRA4lvd4Chuhz40PQahwQ=;
 b=YVFZcHHRNu+26snpxjow4PoPX3ej9w1hIhawqEAsLMcTCFID9VPgiJtIlfYY9I8ekU
 JHhCB/zPJAvezYn3+jBFu0jrKfoqfzKhqna855JLQGx61EWHs2G5OMlEx/F/HaXmqXxN
 uMqOC5FXfnnNAOI0hJ4vmhyOxsws4Dg0ROZovq00OX8kRtNeLxpcvzwvX24PKb5kFiI3
 NPSR927rYsfiApkiSg+JNTDLoCtfPdmnH3wB8TsvcQIU6Osdax+YeVE6+Hu7gbi9cIg7
 p3/Hd6FeQKKDDPFhvpfDMmiJQWFcL7m8XNy2VKJvSUMmUIRM1LpX9Ih3FSs/aqAQYOwf
 3y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGbjyf75c99S79YkNwkfWRcRA4lvd4Chuhz40PQahwQ=;
 b=POuqA/pgBZbr7v6fzVgrq7FJc/qX5nETxZ2O/ERBq626rhxYMcnzWpvqNymwllfT1w
 6dfngNT2RB0cKYBbSMsAKKukssGq/qxKjTzu5dUsfrqC/y9aIgwLHqEOdWk2aQYuir5b
 teDIoNNZDC+/PBODTlqG6Yo+ilnQ0Bh6ef+mtHDI4+QBfGUe/eMpncb8hZzC3oFIV1/I
 EsH1/N4yyMLIDUtQXm5/RraX5YlZKmLTIir4vynK/9MNiwwaUl0fAZLB5CKfxIDRBdDd
 gwylI+3sbJnvMHDTWSLfXf42hrYxYcSgXtBdpepqLs/mOAAZQ/0ThE0S7XMgS+AUAF94
 uKbg==
X-Gm-Message-State: APjAAAUzJ/2oDHiPaDhk8t/WtSnJ5vprEPk4zME8HqcriB85GCEdbAEW
 wDhKJT6bbwiOZ82jGbKhn+E=
X-Google-Smtp-Source: APXvYqzi0wlf2RThtnnqN1XRmfWGl8V2A0Rdx29HeMZt12F8AiiBvwFVo8ATHxQq1XcX9A2BGcBKqQ==
X-Received: by 2002:a17:902:be10:: with SMTP id
 r16mr78309008pls.294.1561283129539; 
 Sun, 23 Jun 2019 02:45:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.129.156.141])
 by smtp.gmail.com with ESMTPSA id d26sm6181062pfn.29.2019.06.23.02.45.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 02:45:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH 0/3] fix vmalloc_to_page for huge vmap mappings
Date: Sun, 23 Jun 2019 19:44:43 +1000
Message-Id: <20190623094446.28722-1-npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a change broken out from the huge vmap vmalloc series as
requested. There is a little bit of dependency juggling across
trees, but patches are pretty trivial. Ideally if Andrew accepts
this patch and queues it up for next, then the arch patches would
be merged through those trees then patch 3 gets sent by Andrew.

I've tested this with other powerpc and vmalloc patches, with code
that explicitly tests vmalloc_to_page on vmalloced memory and
results look fine.

Thanks,
Nick

Nicholas Piggin (3):
  arm64: mm: Add p?d_large() definitions
  powerpc/64s: Add p?d_large definitions
  mm/vmalloc: fix vmalloc_to_page for huge vmap mappings

 arch/arm64/include/asm/pgtable.h             |  2 ++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 24 ++++++++-----
 include/asm-generic/4level-fixup.h           |  1 +
 include/asm-generic/5level-fixup.h           |  1 +
 mm/vmalloc.c                                 | 37 +++++++++++++-------
 5 files changed, 43 insertions(+), 22 deletions(-)

-- 
2.20.1

