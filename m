Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF32F0E32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 09:32:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDn5T4vwXzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 19:32:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=40.107.220.48;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=windriversystems.onmicrosoft.com
 header.i=@windriversystems.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-windriversystems-onmicrosoft-com header.b=e+5M1fxT; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDn1726mpzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 19:28:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq1KftOJbkhw92VAVnc6HYyfvm5R/EqKFAYnwDSL5G2FYd0o6hTM7O2DzJ37/OsNQyjAT+icugSrOdg9f2JO2AoL/KPQGcLrTU4Nfr/TegE4uQ4LBhF/7fh/aTpFFVm2qNT01armd2aK2U9xv7p+YmqHDT+YnS906YB+imJn0jlze6FqWJz/1aGdcfuG3z3MkbqAvwPZOWcJnXjliy9HE0CDhSAiqH9QvYYyNz2B0XT5x2Qgas2zmYfXRmp6YfSVseFVg2M8gsKr+fD/TFTSThc56bI545UkDCvKl4YVc05T8SNWcvnFHPXXyI69nPfldFVUgGX7doPKFlq5ScwKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RfPmekk1bGWvDKiEJAa33Se06KjXQI71ovevjxo9Yw=;
 b=Ge5KPINyX0ePYQGnQWz25lfDkX+zEFXEf1fhU7z9R6e5kFxs+c3jXiSzHrYRdFeo/5VNuRK6m/d8fw7W0MB1oOAniU8s1XcK/IOZIZla9OZJW7IVxI36sUn5wPFT5gnb+nmC0/O/5QAvJMVf2v0XuAM0/iDjP/UBvO0cO73TMmfV1Jay1mVfQu9sggVPWtCvbYE1mcadp93rNltD12w5nYavrLn9vUBjcsz3UvFORLW7tr81+bJEXVFW3ITAB6S1RZ4zt4nliaH7EEP4krKKj6vS8JTXf0S+kWRrA1jp+TXbWpUoiB3Gop1hKJDGcWR6i3E5s1wm/HB3cT2ej+oRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RfPmekk1bGWvDKiEJAa33Se06KjXQI71ovevjxo9Yw=;
 b=e+5M1fxTnKy9xiCJzWG2usDdGKFlQk+O13cbEdaArk9ZxRoi1g6EWVjZCju7kdpK1NCdgnP1MRuWPSWlPPrY+IeYo4x31yRZPFx4mKGQIDU0m8T8r0MmRVTIvSps9ZjYchV2tk6HJWCf9cv1EBrGrOt+Ozwef+OladMAiorv79M=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 08:28:51 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 08:28:51 +0000
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] MAINTAINERS: update for Paul Gortmaker
Date: Mon, 11 Jan 2021 03:28:23 -0500
Message-Id: <20210111082823.99562-4-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111082823.99562-1-paul.gortmaker@windriver.com>
References: <20210111082823.99562-1-paul.gortmaker@windriver.com>
Content-Type: text/plain
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-pgortmak-lx2.corp.ad.wrs.com (128.224.252.2) by
 YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 08:28:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 775ce56b-9271-457e-bf46-08d8b60aed09
X-MS-TrafficTypeDiagnostic: DM6PR11MB4740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB4740C356DB60F357F7D5E69983AB0@DM6PR11MB4740.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TWhMz/HMDyB4v9qRMXs2oyc/o6cSu8KlKqvZsle98BVc+9ss59kiLctrdr13fc3Xe3StSUBq2IwSxWgFnXcZEg6eMeBcNmTaiklZgP8nxUrQz/ih65hj42bFe4+gtLzagQTKC9aqTtYgSzrNRvp2Ar8xEIYxF+wzHv/TouF6GfZOHgBYQ8eMNxyRGbDHRLj0VzT2jcuBKmQ4qigJJd9k+GPQnmpmf3fo/fOZXvprBHtb63hTtjLTzeFxHsUHNhL5Q7AIx7A+QM0huMe71iYQl1Gu4hv47xfMzh1G7Xwol2W3FFc8AGnLDTtbTdWW5uXj9eIvEqA1DutW+rE9rlVaaY9HGGfFpOs90PtfkEP959ly8n3cFsSqn99hANGyTak53oEpG/n4Js76PBqTa2cQeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(366004)(396003)(136003)(26005)(186003)(2616005)(6506007)(16526019)(6916009)(44832011)(86362001)(956004)(478600001)(83380400001)(6512007)(36756003)(6486002)(66476007)(66556008)(1076003)(4326008)(5660300002)(107886003)(8936002)(52116002)(66946007)(8676002)(2906002)(6666004)(316002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yiegjbKdE1PHeTLt4E12SyLSP4UQjPf+6Ew2UYHflyMDAn3JCajHKn1cMC1N?=
 =?us-ascii?Q?bP9T6QfAD09I+eQ6dE0xpODzz9Zr022wUd453WDuFR5Kdbp0hTtNx0pZEP1w?=
 =?us-ascii?Q?EGPvxvUUQ5DQZYw8a6C97Sn6IzvGaz3iVt9KwRTr3L7FgjB9ChGuj6GnUN4v?=
 =?us-ascii?Q?i6TFjUMaVUyTR9dKfj5Kdz+Mi/PY8hpdtn26s8KNJ9605BUU79aDW4sg0knw?=
 =?us-ascii?Q?wnYwFYlTvhPITtZPEHthij/YUIBrkpP9/bD/2gOPw45mM2FbsLKql0Btpad5?=
 =?us-ascii?Q?WT5eNR6FVOfk7iG1n6EH3quqWfcXrgcBbQeUdG1Tl+4LWu/A41gc2hbo8kqj?=
 =?us-ascii?Q?s5acihrgMBsFSgxTi1xbbBV1KzZh9srRXECUNzdFruuuEtj7jrLyQeeRjei4?=
 =?us-ascii?Q?0AD39y/ybvJcSfkJnDJyWonYR1csqRlfxtDihVtk89TZa+Vn5FlnMw60Wlds?=
 =?us-ascii?Q?3NwzRukTeWZwGinQd4D/TDpr33Dco06N9nawi2hMUGTpZ+pP8fysqErNBkg7?=
 =?us-ascii?Q?4/kLWkoIr5rShaKiTq6Kts7w07kzF8xLlQPVzdTz8HoXhg/NaqBjQoi73Xk3?=
 =?us-ascii?Q?PnWA5hxPWvWIYG892H9u6b0UfUdCQXwDU1hY3CmmfLo0Ojc/xA17wVDPfomT?=
 =?us-ascii?Q?dAQeTBTL6yPWwqOPm8t4LOhczfblGV8G4AEDFnLS94L1BWuzDEI1YcJ9pV4X?=
 =?us-ascii?Q?xM5C4y7V0/295N5BpmpO4H2TRU2lVgMqvMrt4ApZvLyQPc0C5qLM6a52sCXa?=
 =?us-ascii?Q?ELTklfAY+RlGm0yjLcv0mSOTAmfdVGIzBEtSJnV/yZHPig08FyciTzBBUC1F?=
 =?us-ascii?Q?tQXr/DNNvHtVG+U6wWV3DUtGQIYMtfFdl1/ElnLc6wCPK7kUxZly1TGNRRXy?=
 =?us-ascii?Q?qux9JL8qgL+/xQoTn1NVm0KqITydG7SrY2hvXUDM52oS/5ZfqZq5WIO3uifm?=
 =?us-ascii?Q?nRdBeohkgvNmeutPbrLr96cZMcdoW4ONoF/G0CT3Rga69jrIANSyf7S/r2N6?=
 =?us-ascii?Q?nSFY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 08:28:51.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 775ce56b-9271-457e-bf46-08d8b60aed09
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLTdFhynG2i+nEyiSpyEKDoMPpxVlkmRTai/MpzkD2bBu6r+76quNCMBkL8pc9FYn/qnTjj+DtuAD7Jq/TJGyXwChy51lPhDJTycJ0VzI0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1e6a5ee6e6..c5f5cdb24674 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6529,7 +6529,6 @@ F:	Documentation/admin-guide/media/em28xx*
 F:	drivers/media/usb/em28xx/
 
 EMBEDDED LINUX
-M:	Paul Gortmaker <paul.gortmaker@windriver.com>
 M:	Matt Mackall <mpm@selenic.com>
 M:	David Woodhouse <dwmw2@infradead.org>
 L:	linux-embedded@vger.kernel.org
-- 
2.17.1

