Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEF327AD07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 13:43:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0LHt6n65zDqQX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 21:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=147.11.146.13; helo=mail1.windriver.com;
 envelope-from=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
X-Greylist: delayed 7107 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Sep 2020 21:00:07 AEST
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0KKz1MJVzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 21:00:04 +1000 (AEST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
 [147.11.189.41])
 by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08S91MsO013707
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
 Mon, 28 Sep 2020 02:01:22 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 02:01:15 -0700
From: <zhe.he@windriver.com>
To: <gustavo@embeddedor.com>, <netdev@vger.kernel.org>, <bpf@vger.kernel.org>, 
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <zhe.he@windriver.com>
Subject: [PATCH] powerpc: net: bpf_jit_comp: Fix misuse of fallthrough
Date: Mon, 28 Sep 2020 17:00:23 +0800
Message-ID: <20200928090023.38117-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 28 Sep 2020 21:41:54 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: He Zhe <zhe.he@windriver.com>

The user defined label following "fallthrough" is not considered by GCC
and causes build failure.

kernel-source/include/linux/compiler_attributes.h:208:41: error: attribute
'fallthrough' not preceding a case label or default label [-Werror]
 208   define fallthrough _attribute((fallthrough_))
                          ^~~~~~~~~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 78d61f97371e..e809cb5a1631 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -475,7 +475,6 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_JMP | BPF_JSET | BPF_K:
 		case BPF_JMP | BPF_JSET | BPF_X:
 			true_cond = COND_NE;
-			fallthrough;
 		cond_branch:
 			/* same targets, can avoid doing the test :) */
 			if (filter[i].jt == filter[i].jf) {
-- 
2.26.2

