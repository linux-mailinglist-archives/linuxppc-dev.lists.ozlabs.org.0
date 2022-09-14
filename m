Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5A5B848C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 11:13:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSF4W1mN5z3c45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 19:13:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jQlm5UOI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.54; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jQlm5UOI;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSF3l4Sq5z2y6N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 19:12:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ks6kwu3jLh1rKRLd0O4YWhhaNsb1CKhpUnZyUXTiA6y0ip6ZFP+1pUxkLP5rIl7u0yJNFzVHBdR94jgqEEFbOAaQgFvbpsfEZ+aAb7nyWnTymqjNFKO5k5uCcykJccpi6j3s/moK9EYIZKiguw5Bze2TD5mdJCEXLaRPx9i/77AV75nl2Y93J41t9M+oFkRozDCijFu7fIPTPAwM0l2tDflfzMPHkxpDn9qn7AhYou+bdg+QsLX/1yB0fMI9ps746EkJXNoeAmRulbbjL2IYt9sdjWZ3g7oe1wNsYnndRClS4ISHH3LrCSDz6N1Bo65bW82GM69WX5R5nwHXyLmseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcBz27dx0k6tZLhoNzFfz1l1Z+o3ywvQ68rCVs+p9UM=;
 b=EoSjocsXKRlEQ7KTzhjzRNs3YbhE84v6sBPk+TCAxuE58zQcoGL8kOUhdETxuHTDbVnO05iwQaQH9rtAQI28D/UDUlgWa6KQLJ8OOcd+JaDQQvyTAAH6MLeUQzQk3SZkg/+D9y7RQ5ywTsnHq8/OZ2KCbjfnQ8TUpzuGAsr5x6zc2EhgjqHA0PTFLbGRgTQuPAmjaLL5//Uin5bZicD8JU/TqX4edop53RVif41aoxWqNtA6JKhtQBqjsNhpdbOZ54jCIIycOVCZfnjXz3Sss767rqLlHWovkMoxceTYP6h7qLPbStVFImxB+oNoygW80nKNgnvQwuq4T3Cd9vfwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcBz27dx0k6tZLhoNzFfz1l1Z+o3ywvQ68rCVs+p9UM=;
 b=jQlm5UOI2YgCiWTUiucS04yEMKDuddu+cz0Tq/oauFYGbqZxhSduYaimHbAOEZMvTf6XOUaAE/5kz1Qvk9f8zUHftQiznUR+AzhsUCA45djXztdlei4LbYhcl+LkGdgRQshT01J8Bq7JPZLJ8Id6T7RVUKvvvRcqth/G71oTQSjlCCYB4lT6thO4L7USP7rqfz9Vd01NRIg/0tgOrf6yv6ylzJdGmDuxZnX8VoRy6hBTQA55nqx9XQnD/HRGjlWaqR2a2md0cYk2RricL4UGkxIZWcjylnmTYIgJ/d5qzdB922NhaR1Q178i/3eMjE8+n/pT7SlBuexTllmKiDneWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4894.namprd12.prod.outlook.com (2603:10b6:5:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 09:12:28 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 09:12:28 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH v2] hmm-tests: Fix migrate_dirty_page test
Date: Wed, 14 Sep 2022 19:12:05 +1000
Message-Id: <20220914091205.557676-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0075.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::11) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM6PR12MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e82983c-b49a-4333-c9b6-08da96313f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A6J0mOkAZnyILdNuznvGKatngcgWPB9PWVgGO76gPFDQtC8jGRqKdPZD4q3AqHFyrHZgoAHdyLTgHBwB/jPHlBrRCwo+MYGckIDDyFsU5ch8Q4hc8exfgRBu1v/7r26etmlvDazZbDHNf6AJtxVr+VXAqgUjBfvjIaO72zUm03cKs9/9tNrpqK1h6I0WeFhtuwCIBxX8bIz7YinRxURCQ9ISg8ULBROoA3roRvjBNPhRI3cTE6wDB2IkmXJsWdTH9zTuJJSXqxseZSooZ6xp+IVfNabVFmy4b9Kx7vxQD1PhTnujgmqrfQqR9F38hZHzHfSP/F22Jxu/XD03xIzUCJ5MzdNEFAe5yE1+aKF6Zt7FDpsfObhRfIi73zbi75DMRcK/02JCKKjg0orIgEwWS4WntqGqqaoLnikLqTFv82oL71Ouw24pGww9Bdss0B0qqzAI6TD4dTgBeZj+9YbpHNFIi9lBPzA2lg4eF5QA8EeBbRnF3keuGLmAVlf0D7GjZ7Cf0XI8LXZ8radjRJTSFDRSAieDg+Dor1PETOLCFRryloKfi1Go9gz6Dszix1F15a5SxENod95zFo+o3JK1nbgRU+YAIwr39TF4UWgf7lzclOZeez2ANvwSeB4Ezl3ks8743yS5IuCLeifAcfqTvba6IXV66Hkgx2hzhF15Z3YFqGiHhK944hMKvclTjDcDJ2vQFEzyR6bQf0RyEIoqBryG5kooecyI/cIqwQM/CCfo8lt5dLTfQ3yVLrfHInRa
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199015)(5660300002)(4326008)(8936002)(1076003)(2616005)(6666004)(2906002)(8676002)(36756003)(66946007)(316002)(38100700002)(41300700001)(6512007)(86362001)(54906003)(66556008)(6506007)(66476007)(6486002)(7416002)(186003)(83380400001)(478600001)(26005)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TlM0eXFGMDVyY2NOYTI4MDBJVmpudkY0Y1NJN3RKWEk2Si9YajczVDVBWXp1?=
 =?utf-8?B?RlIxWUxwbVYwQkJnWU9COWhqa3lBSHBUMGh5dTRuQlFydFhLejZ4cWlZdVh2?=
 =?utf-8?B?c002ZXdEa1YzQ0dxSTg1TXRWKzJVUmlEL3hqZG9WL0IrUzVTQ3ZpUGlkdWlV?=
 =?utf-8?B?c0RqalJ2bzEzd0hXMzJKL2ZvendsajlwZCtJMk1SQ1o3V2hnM25uaDV0U29v?=
 =?utf-8?B?aE9mMG9XZWZWNFhCdHcwdnZKVTFaM2JHUmZDT2dqclhsay9Ray9oVFVkbWlk?=
 =?utf-8?B?QXRnU2xDQy9TNElCN0pibjV4T3YrRUtxTVNsTHAyMk9leTh4V1V1RXY3WU50?=
 =?utf-8?B?RUxadnpZalk4d2doSlhPaThCSUk2OGFOUWlVY0NqVFFvZWhZTXdxTUlHTzBm?=
 =?utf-8?B?SmNWUldaaERhSnNjUlMxY1hjOVFsYlNuVjc0ZFdjWVR3UFhvWS82c3c3OE5a?=
 =?utf-8?B?QzRBR2M5c2NobG9oQnh6bXRIWmlDbjFUT2h5YkQwMWJwdjk1M3MwYUU1eUtm?=
 =?utf-8?B?YTVOeHdyaGdDQzRubERGNjBBSzhKWk9RRzM4dEM3dTBpOUhadVgxTXdBYzM4?=
 =?utf-8?B?eTZqYmNtNHphRDBFcWJUemNXeldqSDFIVTNNMzdXYWFnaURuT1gyQU0yckZi?=
 =?utf-8?B?bktIdDlBS0ZCV0tmRkQ4MUU1V2pHNkFFSFRoUjhPWER6dzNudW05OW8zR1VG?=
 =?utf-8?B?Z0hZMWE5eEF1VzNZSGluVWxQMVIxcjlpc0FNZ2pLMTB0VEVrWnRCN2ttNTJU?=
 =?utf-8?B?emF3eTJHZnZtK0hvczdBMllicXRoQWY5MWh1dEhEbGVtY3ZSNFE2S1ZHVlIv?=
 =?utf-8?B?WVpJN0RzaWo2bjJVcVZSNnlNWWFXM2dnbWdMU2JnMjI3NUpqMS81YUFUK1o2?=
 =?utf-8?B?V1pJeTkwRE1YTHlLb09hUVpkRnBZZWlUaUZkNlkzZlpaRUNiT0ZjUStBc0xK?=
 =?utf-8?B?czlFaWdMTWc1aGRWUUhIUVQxUjRyVTRPUVYxU3dMRXJpSmxTbDVmYWVPbVZq?=
 =?utf-8?B?VTFkQXUycDhnbDFTd29NWE9oK3NTUXY5aUFzb2gvcC9McnQ5LzEvVzBqSndP?=
 =?utf-8?B?S2p2OUtJazlQUXkzQkpDd3BCWWlRb0VHVkNZMXhmSmQvaWNGT1hzbk4wTnMv?=
 =?utf-8?B?T2pncWN4OHNYdUpRNnZmT1psY05BU1NkZkNYcVVMeXRtSTlDUnc2RjluV1Q4?=
 =?utf-8?B?cDB5cjFBVzBUR0EycGZISjNiVXQzdWI5OW5vcnhyNitpTURGRkVjQUNXNE1B?=
 =?utf-8?B?Qkc4VWdWRmNNdlU1d3M4SWppMWZvT1VxVTUzY2thWG5VZTVxYTlLRHVxbTMz?=
 =?utf-8?B?S1pZaWY3QVZVaW05cCtpaGxXaCt1TmdoQXdOZG96WjV1ekpqcHduMDNuK0tW?=
 =?utf-8?B?cFpRTTU2bXF2ZUVvUkpVYlZ2cDcrWnA0akZMUEFMNHd4K01HeUc4cW5NVEdD?=
 =?utf-8?B?MTFsRkJWVFQzRFBuV1RDbGIyNWJ6Mjl3T2RsQy9jcWRQbEZDU294SzQ5d2Fh?=
 =?utf-8?B?OGE3NmFRZVVzTmlPR2NZMXpNOENTclk3bjZSbkliWEpxWUptR0RGcXhvWHJD?=
 =?utf-8?B?VkRMTW03T3BwanZIYXBIcEZXWG9ibWg1Q1VYSldxQWY4bWhrWktPc3ZEMzNr?=
 =?utf-8?B?L3dmM0x0ZjFjbkdncXhRUE8zdmJuNjBKQU8xNlhpcFRMdmMzT0FQZWFmeG5N?=
 =?utf-8?B?Y2VqSjdsWEt6ZG5zTkpFclJua2hnN0FUSitRV2UrY0pJT2dFeEhKZ3hMSHZk?=
 =?utf-8?B?NmFhckx2blcycEtpTm50UWIyKzJZeWdJZWh6T1l6RWNlSnl3YkxPNUFUWUZT?=
 =?utf-8?B?T0tGelZ3NUtYTWdrYjRwZ0FnWFR2dFRIVG1weTB0TGpNSWJuOU12MHpKdFBq?=
 =?utf-8?B?b2o5cDZNZ3VkUmZHbVZlRkY4WHJhWUVNTUtqUUtIa2gyRTFGTzhLaSs0UDlT?=
 =?utf-8?B?THppUGliMGpxemdRWVFTUWVrS3dOeFkzaEJxdjNGc3o2V3NKSDJVRWR5aS9N?=
 =?utf-8?B?TkJDTlRuSTMvY0diQVBPODMwNGtndHpQM2ZZdFFMcndqUURyUmxvdTdIMVB3?=
 =?utf-8?B?QS9XSGhpWENpcmtHWlJCanF3eHVSc2ZVYk5Od2w2YVpIM3hkcXYzejdzM2lz?=
 =?utf-8?Q?QvyGJ2DR0BUusMp+rd31eYki5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e82983c-b49a-4333-c9b6-08da96313f32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 09:12:28.5140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lokocAU/u/Fcw++SXbSifRWfXD2CN2BPSUH5hha1YAhFW4ObrMZki2veBuOd2r0NsvSxiKQ72Ejmdoiwuq0nHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4894
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Ralph Campbell <rcampbell@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As noted by John Hubbard the original test relied on side effects of the
implementation of migrate_vma_setup() to detect if pages had been
swapped to disk or not. This is subject to change in future so
explicitly check for swap entries via pagemap instead. Fix a spelling
mistake while we're at it.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Fixes: 5cc88e844e87 ("selftests/hmm-tests: add test for dirty bits")
Reviewed-by: Mika Penttilä <mpenttil@redhat.com>

---

Changes for v2:

 - Added Mika's Reviewed-by (Thanks!)
 - Moved pagemap checks into vm_util.c as suggested by David H.
---
 tools/testing/selftests/vm/Makefile    |  1 +
 tools/testing/selftests/vm/hmm-tests.c | 28 ++++++++++++++++++++++----
 tools/testing/selftests/vm/vm_util.c   | 22 ++++++++++++++++++++
 tools/testing/selftests/vm/vm_util.h   |  2 ++
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index d9fa6a9ea584..17e36129efd2 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -100,6 +100,7 @@ include ../lib.mk
 $(OUTPUT)/madv_populate: vm_util.c
 $(OUTPUT)/soft-dirty: vm_util.c
 $(OUTPUT)/split_huge_page_test: vm_util.c
+$(OUTPUT)/hmm-tests: vm_util.c
 
 ifeq ($(MACHINE),x86_64)
 BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 70fdb49b59ed..509fe8c5158e 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -37,6 +37,7 @@
  */
 #include "../../../../lib/test_hmm_uapi.h"
 #include "../../../../mm/gup_test.h"
+#include "vm_util.h"
 
 struct hmm_buffer {
 	void		*ptr;
@@ -1261,9 +1262,24 @@ static int destroy_cgroup(void)
 	return 0;
 }
 
+/* Returns true if at least one page in the range is on swap */
+static bool pages_swapped(void *ptr, size_t size)
+{
+	int fd = open("/proc/self/pagemap", O_RDONLY);
+	bool ret;
+
+	if (fd < 0)
+		return false;
+
+	ret = pagemap_range_some_swapped(fd, ptr, size);
+	close(fd);
+
+	return ret;
+}
+
 /*
  * Try and migrate a dirty page that has previously been swapped to disk. This
- * checks that we don't loose dirty bits.
+ * checks that we don't lose dirty bits.
  */
 TEST_F(hmm, migrate_dirty_page)
 {
@@ -1300,6 +1316,10 @@ TEST_F(hmm, migrate_dirty_page)
 
 	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
 
+	/* Make sure at least some pages got paged to disk. */
+	if (!pages_swapped(buffer->ptr, size))
+		SKIP(return, "Pages weren't swapped when they should have been");
+
 	/* Fault pages back in from swap as clean pages */
 	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 		tmp += ptr[i];
@@ -1309,10 +1329,10 @@ TEST_F(hmm, migrate_dirty_page)
 		ptr[i] = i;
 
 	/*
-	 * Attempt to migrate memory to device, which should fail because
-	 * hopefully some pages are backed by swap storage.
+	 * Attempt to migrate memory to device. This might fail if some pages
+	 * are/were backed by swap but that's ok.
 	 */
-	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));
+	hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 
 	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
 
diff --git a/tools/testing/selftests/vm/vm_util.c b/tools/testing/selftests/vm/vm_util.c
index b58ab11a7a30..2768d4f3de4c 100644
--- a/tools/testing/selftests/vm/vm_util.c
+++ b/tools/testing/selftests/vm/vm_util.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <unistd.h>
 #include <string.h>
 #include <fcntl.h>
 #include "../kselftest.h"
@@ -20,6 +21,14 @@ uint64_t pagemap_get_entry(int fd, char *start)
 	return entry;
 }
 
+bool pagemap_is_swapped(int fd, char *start)
+{
+	uint64_t entry = pagemap_get_entry(fd, start);
+
+	// Check if swap entry bit (62nd bit) is set
+	return entry & 0x4000000000000000ull;
+}
+
 bool pagemap_is_softdirty(int fd, char *start)
 {
 	uint64_t entry = pagemap_get_entry(fd, start);
@@ -28,6 +37,19 @@ bool pagemap_is_softdirty(int fd, char *start)
 	return entry & 0x0080000000000000ull;
 }
 
+/* Returns true if at least one page in the range is in swap */
+bool pagemap_range_some_swapped(int fd, char *start, size_t len)
+{
+	unsigned long i;
+	unsigned long npages = len / getpagesize();
+
+	for (i = 0; i < npages; i++)
+		if (pagemap_is_swapped(fd, start + i * getpagesize()))
+			return true;
+
+	return false;
+}
+
 void clear_softdirty(void)
 {
 	int ret;
diff --git a/tools/testing/selftests/vm/vm_util.h b/tools/testing/selftests/vm/vm_util.h
index 2e512bd57ae1..307e11f72341 100644
--- a/tools/testing/selftests/vm/vm_util.h
+++ b/tools/testing/selftests/vm/vm_util.h
@@ -4,6 +4,8 @@
 
 uint64_t pagemap_get_entry(int fd, char *start);
 bool pagemap_is_softdirty(int fd, char *start);
+bool pagemap_is_swapped(int fd, char *start);
+bool pagemap_range_some_swapped(int fd, char *start, size_t len);
 void clear_softdirty(void);
 uint64_t read_pmd_pagesize(void);
 uint64_t check_huge(void *addr);
-- 
2.35.1

