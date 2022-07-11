Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4356D38C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:48:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8xN0GThz3dpD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:48:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ePx9tw2q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ePx9tw2q;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh8vX5cqqz3c1t
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:46:48 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso3804089pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zH1rOKwt+eppc4uRJ3wzEb3jlVxvSJQcRh3p/hoLlMo=;
        b=ePx9tw2qDorWxYzPWcGRLOvGkwfDV4WFpjno1bzwsIkpBxrJHAnbnXDd+9TSQPIZWc
         rB8vctJmdtvbZmL7h6HXuBkhUVLcRj4hr5D8Xao8ADv5y3VOodNZydMQYF/4GMGusm5B
         AITvvCsvM4Fymc4mIY+V5NWWdLdN5dTrkn7xmybz4zKiKBZrzDwmWdMdWUAOQVASHsYU
         cWoYrJVQQwEh8W4X1CL7RJ+zQhdG9+qfpNmkK52I5z3wiRZLGNEEimJp5XIALeYrky8b
         md0dtPDDjYyabBKb/WuxSnQ+6lF4nSZ8gZYRptwvwsM03yDen/D8SIE11lqmoUisCWjs
         XneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zH1rOKwt+eppc4uRJ3wzEb3jlVxvSJQcRh3p/hoLlMo=;
        b=S5JzkLKe68uxDCpUqS/akWa3/+GcDHrm+SMjmXxZ23cTm3WfzlzQev+2ISD7qk6kxO
         ZBSyBEmbYQE4XGJVBILDEfq1ARDsoQsleWNAey/JWY8aDscmBls0+PHAXCdsbYykYgCY
         Mtibr+3MBssJ01C7DPQa8rpYwAu39T1rEOh9896NKxM3zuRbR6v5C1f7Q41RlUAIsLZ6
         bFpez2DK5L7bl9yi4mbhhnUibfrrDttSBJOAdeIPslbF1Vx7WOQkxarwSdE0+gWXlaR7
         dDF8cpYPPk9UjsHViAEy+qw9uLCq1fiN8fk1BjHlD4sxmkh3rRUw/qgjMDIRiAlUv78+
         yO4g==
X-Gm-Message-State: AJIora8v081WaZ2vkGfHh9koHJi6LVYu/qLLLVEwvT8LgSkpNq4GU+U3
	jdwwjbkWM+jtnzawOBrckjw=
X-Google-Smtp-Source: AGRyM1t+IjLE84wZXwipeZB/XUo7NKGO7BarDvcoewmact2teddnhHzQthXl8IiBONeN1GAjHbnetA==
X-Received: by 2002:a17:90b:4b4a:b0:1ef:fc95:3c4f with SMTP id mi10-20020a17090b4b4a00b001effc953c4fmr15058701pjb.138.1657511206386;
        Sun, 10 Jul 2022 20:46:46 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz. [47.72.206.164])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:46:45 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/4] Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
Date: Mon, 11 Jul 2022 15:46:12 +1200
Message-Id: <20220711034615.482895-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711034615.482895-1-21cnbao@gmail.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
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
Cc: linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, arnd@arndb.de, corbet@lwn.net, realmz6@gmail.com, linux-kernel@vger.kernel.org, yangyicong@hisilicon.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Barry Song <v-songbaohua@oppo.com>

This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.

I was wrong. Though ARM64 has hardware TLB flush, but it is not free
and it is still expensive.
We still have a good chance to enable batched and deferred TLB flush
on ARM64 for memory reclamation. A possible way is that we only queue
tlbi instructions in hardware's queue. When we have to broadcast TLB,
we broadcast it by dsb. We just need to get adapted the existing
BATCHED_UNMAP_TLB_FLUSH.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 Documentation/features/arch-support.txt        | 1 -
 Documentation/features/vm/TLB/arch-support.txt | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
index 118ae031840b..d22a1095e661 100644
--- a/Documentation/features/arch-support.txt
+++ b/Documentation/features/arch-support.txt
@@ -8,5 +8,4 @@ The meaning of entries in the tables is:
     | ok |  # feature supported by the architecture
     |TODO|  # feature not yet supported by the architecture
     | .. |  # feature cannot be supported by the hardware
-    | N/A|  # feature doesn't apply to the architecture
 
diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 039e4e91ada3..1c009312b9c1 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | N/A  |
+    |       arm64: | TODO |
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-- 
2.25.1

