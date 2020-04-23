Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A5F1B53C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 06:44:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4974Tk5k9gzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 14:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4974Q82RY6zDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 14:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4974Q644Tkz9sP7;
 Thu, 23 Apr 2020 14:41:34 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: Enable Prefixed Instructions
Date: Thu, 23 Apr 2020 14:40:57 +1000
Message-Id: <20200423044057.5517-2-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423044057.5517-1-alistair@popple.id.au>
References: <20200423044057.5517-1-alistair@popple.id.au>
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
Cc: mikey@neuling.org, oohall@gmail.com, npiggin@gmail.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prefix instructions have their own FSCR bit which needs to enabled via
a CPU feature. The kernel will save the FSCR for problem state but it
needs to be enabled initially.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index dede8f0b678f..e4caa4456869 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -627,6 +627,7 @@ static struct dt_cpu_feature_match __initdata
 	{"vector-binary128", feat_enable, 0},
 	{"vector-binary16", feat_enable, 0},
 	{"wait-v3", feat_enable, 0},
+	{"prefix-instructions", feat_enable, 0},
 };
 
 static bool __initdata using_dt_cpu_ftrs;
-- 
2.20.1

