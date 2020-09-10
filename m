Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776482652AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:22:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnX0X47yDzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:22:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnWYy2fBVzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:03:01 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8175159C2E5A;
 Thu, 10 Sep 2020 23:02:56 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Sep
 2020 23:02:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057910f823-83a3-445b-ae53-fb78f4407a58,
 8FE11AEDAF16247B821E16C08928A26F58BE1972) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 7/7] powerpc/32: Fix W=1 compile warning
Date: Thu, 10 Sep 2020 23:02:50 +0200
Message-ID: <20200910210250.1962595-8-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200910210250.1962595-1-clg@kaod.org>
References: <20200910210250.1962595-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0ed2223c-7869-4428-85fd-33e27f63f04b
X-Ovh-Tracer-Id: 10700552716531436512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CC      arch/powerpc/kernel/traps.o
../arch/powerpc/kernel/traps.c:1663:6: error: no previous prototype for ‘stack_overflow_exception’ [-Werror=missing-prototypes]
 void stack_overflow_exception(struct pt_regs *regs)
      ^~~~~~~~~~~~~~~~~~~~~~~~

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 3978eb78517c ("powerpc/32: Add early stack overflow detection with VMAP stack.")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/asm-prototypes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index de14b1a34d56..4957119604c7 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -67,6 +67,7 @@ void single_step_exception(struct pt_regs *regs);
 void program_check_exception(struct pt_regs *regs);
 void alignment_exception(struct pt_regs *regs);
 void StackOverflow(struct pt_regs *regs);
+void stack_overflow_exception(struct pt_regs *regs);
 void kernel_fp_unavailable_exception(struct pt_regs *regs);
 void altivec_unavailable_exception(struct pt_regs *regs);
 void vsx_unavailable_exception(struct pt_regs *regs);
-- 
2.25.4

