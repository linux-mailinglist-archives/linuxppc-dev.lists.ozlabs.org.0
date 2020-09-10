Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF70265262
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:16:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnWsY3j14zDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnWYx3NpzzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:02:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 8EB0C603F5F7;
 Thu, 10 Sep 2020 23:02:54 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Sep
 2020 23:02:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00582a6ca76-552f-4f24-8d9d-4a6d9cd2c6a5,
 8FE11AEDAF16247B821E16C08928A26F58BE1972) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/7] powerpc/sysfs: Fix W=1 compile warning
Date: Thu, 10 Sep 2020 23:02:44 +0200
Message-ID: <20200910210250.1962595-2-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200910210250.1962595-1-clg@kaod.org>
References: <20200910210250.1962595-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b86afc33-0238-42e2-97db-cbc0ee34007c
X-Ovh-Tracer-Id: 10699708289922272224
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/kernel/sysfs.c: In function ‘sysfs_create_dscr_default’:
arch/powerpc/kernel/sysfs.c:228:7: error: variable ‘err’ set but not used [-Werror=unused-but-set-variable]
   int err = 0;
       ^~~
cc1: all warnings being treated as errors

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kernel/sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 46b4ebc33db7..821a3dc4c924 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -225,14 +225,13 @@ static DEVICE_ATTR(dscr_default, 0600,
 static void sysfs_create_dscr_default(void)
 {
 	if (cpu_has_feature(CPU_FTR_DSCR)) {
-		int err = 0;
 		int cpu;
 
 		dscr_default = spr_default_dscr;
 		for_each_possible_cpu(cpu)
 			paca_ptrs[cpu]->dscr_default = dscr_default;
 
-		err = device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
+		device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
 	}
 }
 #endif /* CONFIG_PPC64 */
-- 
2.25.4

