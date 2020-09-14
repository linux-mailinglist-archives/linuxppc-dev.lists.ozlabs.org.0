Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F58269791
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 23:17:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqzhy6hMvzDqRS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 07:17:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqzXV66XgzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 07:10:18 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 751555B1318B;
 Mon, 14 Sep 2020 23:10:13 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 14 Sep
 2020 23:10:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00661ad5da6-87ea-45f7-a2d9-ea6cbb76bc25,
 D669A8CAADBA69FE96853FFB68FF36F34E8DD5E5) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/7] powerpc/sstep: Remove empty if statement checking for
 invalid form
Date: Mon, 14 Sep 2020 23:10:03 +0200
Message-ID: <20200914211007.2285999-4-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914211007.2285999-1-clg@kaod.org>
References: <20200914211007.2285999-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b6dbbc6a-c586-4abe-a0b3-d32dbd45bdc7
X-Ovh-Tracer-Id: 15867588866209713059
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The check should be performed by the caller. This fixes a compile
error with W=1.

../arch/powerpc/lib/sstep.c: In function ‘mlsd_8lsd_ea’:
../arch/powerpc/lib/sstep.c:225:3: error: suggest braces around empty body in an ‘if’ statement [-Werror=empty-body]
   ; /* Invalid form. Should already be checked for by caller! */
   ^

Cc: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/lib/sstep.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index caee8cc77e19..e9dcaba9a4f8 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -219,10 +219,13 @@ static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
 		ea += regs->gpr[ra];
 	else if (!prefix_r && !ra)
 		; /* Leave ea as is */
-	else if (prefix_r && !ra)
+	else if (prefix_r)
 		ea += regs->nip;
-	else if (prefix_r && ra)
-		; /* Invalid form. Should already be checked for by caller! */
+
+	/*
+	 * (prefix_r && ra) is an invalid form. Should already be
+	 * checked for by caller!
+	 */
 
 	return ea;
 }
-- 
2.25.4

