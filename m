Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1C59540E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 09:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6NPk3vdgz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 17:41:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ukn13oGD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.93.65; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ukn13oGD;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6NND06NPz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 17:40:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5rSWxO2yHy8xvtbznFuxlsE2axDd6/qjwRBif/aacEqv0huPeP7py5r14wlxI0R5313Fwuple/8fEAvoX58pnSVC+FPBuQRbcrF+4eSUAmj0sALsK8ygdcDUvWTpcU+ps7KTX6fIGjgBk46F4uFB8NNe/MyscqCsXqnG3F3dw9ZjmXqJdo5BjruaPZZy+1ZZuublpO6xnYPD8HnHvu/jjvqcl3ejL7IztXIlfiDvD2TjMxH1mvG6QOy/yXF80KZT0N2SVqPetntakRmwOrBE5+RC/jioMD2ZncdLhkJ/GGo9ZrEMo9nSe9T/v6Q40O2HKSKOaUcp3BSIiZi0DkfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snVPulbAKBAi9Wd3KFPYZ5rYVHb8mY3ptG8l5yLntdE=;
 b=TjzSA/yWn6ITEwwxauQ4jKH4OIgdJwtpxyjoSsVWZyASh+O9yDsqa1zyUnrTe9ekWd1uFtfl6UVxPvSiql4sM/pP20ESe+l73N2KqjqVaSCEL3QLPLEpbzZg15blJTEV/u1VtLlAy/YDmay0dWASxFAupwN4kZd2ChzZO7LpMLCWYGdjEj29G5wn6WYX1moCrjJItoiRUu3vj9AvF1FxN4+p+ovg3YgVG8Z0fF1Fdll+fOubgKNfoeUmD8J+pLczKnMM349qhTYIcTPwIs79hOOUkalgyh8rYRHK2kQKXeS8ZGLfnt+vX63Wo/zfTIFHlP7ZHzCG+KFgK8MA/tanlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snVPulbAKBAi9Wd3KFPYZ5rYVHb8mY3ptG8l5yLntdE=;
 b=Ukn13oGD6XT1Pj2CEOvffqEeSEUb1PfBMsuGVa+Bc8NvDHpDWYmgolVnnoEb2d9Vr3ONaeZx0CMX8EcAaX6sYffRbqNOAQqoqtp428Pl9jGgH6YSeh/fdIe5LyghtX5VHcObTvdLcO8Lwb7MeMrH8+YEiC7VfUuKncGQ9dOR/VDrOG1djNUtqImwhx5PQ6c1bI8sazI7XMKfYeNuuHXnmzRJ9mwRWfZaaTFSOT2YfWcMpZ30ML14KDsDdmun8M7kjKNqqssmapyhoaxeofITOgNqLYqbLWA/dOpaGGZfMBULF3okmqcYVy5ugHTD38h5Sj2aMD4v77xKz2HAIV01rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL0PR12MB4722.namprd12.prod.outlook.com (2603:10b6:208:8c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 07:39:51 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5504.027; Tue, 16 Aug 2022
 07:39:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH v2 2/2] selftests/hmm-tests: Add test for dirty bits
Date: Tue, 16 Aug 2022 17:39:25 +1000
Message-Id: <23069a5c6e07d16d4c4f0951ff003591ffc4f656.1660635033.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0063.namprd17.prod.outlook.com
 (2603:10b6:a03:167::40) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6b695a1-c7bf-405a-a4be-08da7f5a80e7
X-MS-TrafficTypeDiagnostic: BL0PR12MB4722:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aeRCfS3/Fo7zMGzT1qwnStcgepWwWirClaNG4MP+07vo+kzB3+fJHqFRF7hALlyEs6JEf63gG4DEZRQKm9Wi5OVtFk8sU1rOtnR7PfRwNEJLhHx/ycUliALt1zQykT7HvfpaqvvFULeYH2OOfMw9uD9BpIqC5p3w0S0tLZ8VFE/sXkdtCu1Dg+f7CSduuKKUkrrvcaWIHRKxI99uZueZPkwtfodvzqvyrhlWddxteBhipbzrsTWJXfF5mBdDH/3ivqKC0NEJAO1wOumufM5AipCdqRXY1PF5HOWLy5yx/x7kHHmJs6+qU6qgdnNDrkXZ/qVwiGXYPuz3+mJapsjk+3XcibYfte2bP87THEG3+drua9isK/7qTg3J2SqvSseJhNES87ioEvM3jaIR9v3ae2JTegc7aXYejkXyOtTwyx12hXoH/veASA0OAFmzourRBRhXZ0xO6E0sw8id51rLNd2OJgEVLQRcC4f+PJhcf0KSdSCyTEStlASsJK2RhGIcCB4KITv6WmFWQvYMD47HKANpeas3hKPNhLKtpQbM61TV+iU8rXH8GNMo/I2NN/m0X2aJFfZt5brjBHJjCO8BTnkRgbRfo9a6WIo7Zw2HcN2n02PevXzBjvabRu+kWuLcfq+0ScAFjO/mZMIujyeKC3iqxpI1LCTh9p7UI/SJmAklckA5bWthkT9LFNEL1TJw80LK+6jALbZy3vhkxuap2KOeXl6Flj4hYNh0vKvmiPItJa1xKLLBXo7szgQmGAokp/lGl+Yq6d1JSnoekuh8otmVKC2Yi3/xX4vX4dgxT/U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(186003)(38100700002)(2616005)(5660300002)(8936002)(7416002)(66946007)(4326008)(6486002)(8676002)(66476007)(66556008)(478600001)(83380400001)(6512007)(6666004)(26005)(2906002)(41300700001)(316002)(86362001)(54906003)(6506007)(36756003)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5A0ThBR+SXjUEvKbOPLsKloUcxy4Bk/QaTjnlts5Vi+x+YfFB3/wsJmYMDGM?=
 =?us-ascii?Q?jKKmd735PF5qq5nF+vwB+qbLlEM9TTSMOhdyQ0ceRgHjlf09YFQ+YxkbeM7F?=
 =?us-ascii?Q?EnmWHyHHBHu2dPukAODCMoAxgMyNTMk2efLkvEPdequluHHrIIKAvlTzwClt?=
 =?us-ascii?Q?KQ4FCjZGrWzmBxALMZdmMCg3DrOYFtuxnIdW2sfgPlCTzdTXkt4EjsIHohHa?=
 =?us-ascii?Q?lAwU7kSQ4cjEFWK6BRXPcD4johAr5XtEU7FDdVITO3AXpKNf+ivA9TeQLX6D?=
 =?us-ascii?Q?/FhCRb1QFAZqICKYaBMEG0gPCwgW1z149+PDDGYntj1aU/h3rzQjE8h7FZeC?=
 =?us-ascii?Q?5rICIWmoU/Nrj7ePU/4j97amJsvsfoROuvt4kbIW66bgT8r94hXhRZnB2q6H?=
 =?us-ascii?Q?CAuTS8T4M49YshwWrpPKt9vo92RffLzhdqRBb5MMwpFSn9xsvws95wXt9jCg?=
 =?us-ascii?Q?UfjskDfmrydP0v+eV7ANqFvLCzlX+Ro3eLSelJItc1/lOe3/l+mb0HldSPjw?=
 =?us-ascii?Q?GZ+lZ4/Rposs5yur474pmxMnv8UmC5rLN2m+8+xWQ9TJwBtOAYZWgRIPWZXj?=
 =?us-ascii?Q?taUtwXzZaAJFumlwdx88poPZUhH9eys4CRfpdvfqsktxfrBRubXqx+kqpvin?=
 =?us-ascii?Q?3csyTS8QcDPr3uwiebNQOyHkKeq6wTZsrekQ984DJzk+q3/YV8/XbT/L0tFl?=
 =?us-ascii?Q?5pFvD4jWwyz/+seRlR68iifn/iTfo2+HHof0r9T85Ij2jiN/4gHBi9sZjGaR?=
 =?us-ascii?Q?y2HTDgKSY5PV3feLu1xeLoHOK4a7fHws2OHioM9jUD1ZfArY5+MTI+Gd7uPx?=
 =?us-ascii?Q?sjxQoMTgdDAuEWX1i4QI9d+IJ73JIfVCgh/f/EB21T15aqoRgZtktKcz/kbN?=
 =?us-ascii?Q?tnt25aVHPapGOikj/gTBBcoVdg5E/zgF9xK4h7rBIqHrKMYMF/vqBGcDBZA9?=
 =?us-ascii?Q?XFyxdwIV/kFi1LDsqFsl7EH1oc1uazamF2HtzWdPPn6Xf44NdAQOuEXQBN8F?=
 =?us-ascii?Q?yPh6nLkE+kdMVurdYTTOq3IdPWxEK64a91rb9WfZzhHRqKe4G0f1tocrVGwZ?=
 =?us-ascii?Q?PG/bOSS/D+77+Tk6RtmavFdI48eut2xt/c8vjnSEl1xTxjgKx2QKUi8QQNYu?=
 =?us-ascii?Q?1t3blgfIPC62OAcSzovk1+H4fsjR/cRUiqvyBPSBdVB6gVeYE/89/t52PJYJ?=
 =?us-ascii?Q?pHjHZSiWgxGso3Tz+mHo1Oy9Q42+lN85AsiFJys4J4Z1Cv/oX/J31Uxggyyl?=
 =?us-ascii?Q?bAt9uS5GsZOjT89n2ynk8/swSk56BFszrv7LC8ESfm52vgWAS2ZrGfNvekkb?=
 =?us-ascii?Q?SyJX/bl7FvENP4SUveQ4BTLUhD0l6JkSfWit36UglC1g/JlsuFjhfgTcFdD/?=
 =?us-ascii?Q?JPSx/Z45+QuqSF9dthfjps67huuj6MbtlTtWlROOe6S66HYJAfC4LOIouML3?=
 =?us-ascii?Q?k6djns11nes7W/4X4Xsirq0m97R3mdvwSVSIbYGcUFQFwReizQ7n1FlfW3Y7?=
 =?us-ascii?Q?dya/Qfk0r75Nb1HQ9LKMMgSUeO3jwmJzm1qIj8i4rMGWYkPb9DJWe7ENOQdt?=
 =?us-ascii?Q?1V7VvGuS+KXj6sPctNeROfhQhnFsYromQPhzhng4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b695a1-c7bf-405a-a4be-08da7f5a80e7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 07:39:51.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtyzWbZ3RnM4dueQ8RNGaevVlXVy9QXVAAZz0P7KBJlzfqhrZUKYhXaV/fYdqjz7V5HCNdRKVXUg9ctfU/4Jpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4722
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We were not correctly copying PTE dirty bits to pages during
migrate_vma_setup() calls. This could potentially lead to data loss, so
add a test for this.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 124 ++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 529f53b..70fdb49 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1200,6 +1200,130 @@ TEST_F(hmm, migrate_multiple)
 	}
 }
 
+static char cgroup[] = "/sys/fs/cgroup/hmm-test-XXXXXX";
+static int write_cgroup_param(char *cgroup_path, char *param, long value)
+{
+	int ret;
+	FILE *f;
+	char *filename;
+
+	if (asprintf(&filename, "%s/%s", cgroup_path, param) < 0)
+		return -1;
+
+	f = fopen(filename, "w");
+	if (!f) {
+		ret = -1;
+		goto out;
+	}
+
+	ret = fprintf(f, "%ld\n", value);
+	if (ret < 0)
+		goto out1;
+
+	ret = 0;
+
+out1:
+	fclose(f);
+out:
+	free(filename);
+
+	return ret;
+}
+
+static int setup_cgroup(void)
+{
+	pid_t pid = getpid();
+	int ret;
+
+	if (!mkdtemp(cgroup))
+		return -1;
+
+	ret = write_cgroup_param(cgroup, "cgroup.procs", pid);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int destroy_cgroup(void)
+{
+	pid_t pid = getpid();
+	int ret;
+
+	ret = write_cgroup_param("/sys/fs/cgroup/cgroup.procs",
+				"cgroup.proc", pid);
+	if (ret)
+		return ret;
+
+	if (rmdir(cgroup))
+		return -1;
+
+	return 0;
+}
+
+/*
+ * Try and migrate a dirty page that has previously been swapped to disk. This
+ * checks that we don't loose dirty bits.
+ */
+TEST_F(hmm, migrate_dirty_page)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int tmp = 0;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	ASSERT_EQ(setup_cgroup(), 0);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = 0;
+
+	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
+
+	/* Fault pages back in from swap as clean pages */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		tmp += ptr[i];
+
+	/* Dirty the pte */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/*
+	 * Attempt to migrate memory to device, which should fail because
+	 * hopefully some pages are backed by swap storage.
+	 */
+	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));
+
+	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
+
+	/* Check we still see the updated data after restoring from swap. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+	destroy_cgroup();
+}
+
 /*
  * Read anonymous memory multiple times.
  */
-- 
git-series 0.9.1
