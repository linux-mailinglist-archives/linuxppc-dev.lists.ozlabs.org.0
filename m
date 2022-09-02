Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8795AA48B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 02:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJfF23yMnz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:39:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qc00d6dq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.60; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qc00d6dq;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJf9r6yjJz2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 10:36:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMsyD7ngCN3BrhFkJ8tl374RBgeRfLe6jz90lKRzU3FDpToiPRj7Hi/+DGpCd27D0zZniLzy4kqI/S9DwzuCC/hUYbMQ2uw2gsx5Xo8Ystn9jn+d60FhSVyfyOGqsW5o1JTV3gSDPII+jJMN7wgK3D3dxAbUEFbTuBgoYjCry5EGhWscXKyPLhvQAzX+eLrMZXMKGCDgAa+AvO9fZm++0o2M+VyPpgTSEMxJtHHMZImkkWac0Yoh6itpD4flAHIvyZi+EbQcKAxgZcv7IkCpxoxD9tFlmi+k1Zg7PKmQEiV2f3EIBEPnaSe1x7bPLEN/J9abbJqKXlL+q3bfjBrPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snVPulbAKBAi9Wd3KFPYZ5rYVHb8mY3ptG8l5yLntdE=;
 b=V3aN3DwnIXe4uCgL1JSY01lX5L47V+76Uqtv+qv5MGWum30lddKjByjmEhMArVlDyTLrEnjV8KTj7ZP7fokP0WeWPVUXNfuLpxxTaLVKrUemuLAVRWYYNlpy+QDM6DXn/MBxTiUolOp5EwVVKICeSwtnAm3p1IXr4k+tFZX1tbz/Zvkxv2cFL+Q+uaCJjVMGAULWod867Y++C4kBPShXuyVPXZ/lObnaONS1JijX1M2UOdm8x4tw145DDZFJ2qs+Oim1KUbIRTwnV5GXTlCL/u2kgp9OTIJrpXDfxaWza75meJ6PamZzNQReJlmFRIULYPnpr7LU8MQHsple6ljlQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snVPulbAKBAi9Wd3KFPYZ5rYVHb8mY3ptG8l5yLntdE=;
 b=qc00d6dqsqh2LWhNxJ2wfkXPT/E4iU2KHg4k17NoLOmphShVV5ttd6pBnz42XD2hXxx9L1NIvDC0a+RH7hR8DlRFQltyU1tZsW83nKT4rh6SwkWWHhvjl5qsqFEUEoOUp9GvqznZvN5jHKLtTyyhCxi1PprGcNcFo64hZH+z/UoNTZeXYYM6Obo+6UYFExiJB8+Ppype+WpXSRqdluJzISMDZW3j+mfnYRCXlwkr2lsTFJwSkyFhY1u/GrzIyCEvgeI2YCE953M5UjGrM1DDODgz8JDdrfVXFBM8Z/WOOCF8RyNRv4YZQOWbc09pXSDG4qApSPGFeY0y/IMZ5wA2Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 00:36:34 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::7432:2749:aa27:722c]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::7432:2749:aa27:722c%7]) with mapi id 15.20.5566.021; Fri, 2 Sep 2022
 00:36:34 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH v4 4/4] selftests/hmm-tests: Add test for dirty bits
Date: Fri,  2 Sep 2022 10:35:54 +1000
Message-Id: <68cf1d70f3fb8ce4e3c1a4899c19df4f6c382a13.1662078528.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bebedc6f-f861-4f5b-f099-08da8c7b302e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5086:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ExQ4mvJ50R4yZIKt9jjMPLnK/J4AOA0LaVyJLdW3R3kjLulbtzUCQwT+ghiFcxZTFBuKJWtnXrZ5u6LvhNtTXfy6S8vR4zM90uZxAzmDYHkH0h4w6/z87zSZVNBU1assEwr1fqvgZ+3iAZevC+v8ig2q08sDQpMA8UXXG+zyKuRoRF2WN5ZHuvphVreRJ+foDt7hhDHkTb/rpBr4BLDAZjBEiVP0FqsVsUKF3E0t9jpCVN3c5z/dIPIjrHMAMGoVk86yMaTajzN3NrSY5lYZ+g/HGAhXWdYOOiCLG8F5jm4zJXLVykgN2Wbk3uG/Tz1/GozwZnKhS7HbaDmVim1xPauBlfnUaji2bGlMl36QMRgLxw6gnuJf6x6TwNjCK1CThGg0ZtxWzxn4ThG9kH3YQ1GWz5RFMTj10sbv6U+mSqTIFmwNAyw0fQiT29mh/eSPwF7MjJwpMJfUHCR6c6u+QH8HNNVk+L72vd66CK+iDrBn0Y6yP7I5/Qx+UwfkwWQyzzcK0mJPP41+ipD0W8ehRV1YZYwLB6Z5ED+knOdLwIEt+w9TC0YCacuIaB2N0L5VI7rLR4eHDg1SyJrzbDNnJqVhZR/MoEHlbh2NB/5EJ2sVLZnrTeiW6YLtwy7BupiCUA/BZ7AucGJqXGB2MxZKjKTJUxVlhoYbOtsHJbBoI033aaxwa9s8R3HqxffbFWh+LeLTzKoqC2akYxScPLNPsmELQl2tszvyZ8Pk60Mw22ueFJnxiE1oO8i9lC8ZyKR006Ba4GqDwvbEW8/qRShlkQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(83380400001)(38100700002)(66556008)(66946007)(66476007)(8676002)(4326008)(54906003)(316002)(2906002)(7416002)(8936002)(5660300002)(6506007)(6512007)(26005)(186003)(2616005)(478600001)(41300700001)(6666004)(6486002)(86362001)(36756003)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VmGNANBEa1Fw+xmhL5w6HEE+x+BnF7luHiubRg4xZ0DbPj3T9onpqv6cN1A7?=
 =?us-ascii?Q?BKbr/psl0jqZDvwdYblXFGVGcyHoyQW7ITwBq9RwZ0wLxlf78fV7PK7Cd3xI?=
 =?us-ascii?Q?wr3M+ws8Yit5lJ94qkP+gdBqNkKJJW2M3eurlWkvUBdEsC9PVg86Bjv0AQbd?=
 =?us-ascii?Q?/54uNZpY68+NSfTnHGrMjar8IErMzJoinb/Ja6VIeL9NFrMXeQvEiIdNkHhW?=
 =?us-ascii?Q?QHX656ih1oWbFCgZLhvitFw5ps7Rsw5S9m/O+uils/nuSN9Oi7qvtWWnK1c2?=
 =?us-ascii?Q?L9zxznwfgHkqUhq4AZLhzobFdj9tc47Mab6Sotqz+kVsZ7LI80bfelCOkp1W?=
 =?us-ascii?Q?eBOfE45yrMQGPL01bYAzxw4PVF5XoYgjZ015gAHrl69QHQkLSHGp7ATlcEDq?=
 =?us-ascii?Q?hlvxrzXoivpRWrMf0NGRYbZIgco8oooeKmTJPGjk4fm+Nu/NVW1QF0mPFtdd?=
 =?us-ascii?Q?1vaCV+m0CTzCV1Pwr07S42iux8Q+wMRveXdJwKUQuesM0u12NHgDyRMAq3Uy?=
 =?us-ascii?Q?TTkL4Vm1ZeEGV6yex/19FdCIQCBCokibqmWFUmM6j76KpxqeXe0ODVEI9s44?=
 =?us-ascii?Q?OOiE8ZRBUMXFFv8YDUXAeg+Xy3mVzdI+WKvRW1u7Gr6LBg8FOcPttQ/IvfkV?=
 =?us-ascii?Q?ZkjqRyCVmByrFg1prcwreIXh45VKn9bi7AIcoht9BM5Irakjr9YYeMqgz77y?=
 =?us-ascii?Q?0DAIiBv/tqBUDozEzUTfm6ZP34h7JuCZz3imrC1mSGbFBNyw/5N6O7OT3/ER?=
 =?us-ascii?Q?uCfbX+tIf10gCu+mVZnsw5UkwlMP+g/zZh0OQ7xS7/avAeECkMaoMANZ7/Ly?=
 =?us-ascii?Q?gbVnmhsI6SfeVu5fk/ki2vixsTJiwzED5dOHzBWq9GCQoLp+UpyPWQeye83j?=
 =?us-ascii?Q?cv1xkmoVGUTAD1B1tO1WRPcXEL5zWgrBgkewLhRu5J4eejR1jdp1L6UkWhr9?=
 =?us-ascii?Q?0O9/DR3H0gLBMgqTN4wl7ThlhDCy1uEJJTxzNucwMRtjpdL1YpEVLVRHB3Nw?=
 =?us-ascii?Q?ppjibQHk3LBiL4wIz3rhP3s72oiG0fP6skxOa9oIGmTVcnFch/UUn5UCpRmv?=
 =?us-ascii?Q?YQJkpmv7NVHwASfPIJjErXxo21QmwpBcqhpXaRgjzc2FKDfII7ilsT0tW7sm?=
 =?us-ascii?Q?EM3h/55+H/dzd6oNsZLLkkPX/17dqkTVThH+7HLIvkqfU6ir7nkg7n9M3hOx?=
 =?us-ascii?Q?U381m9M2qegjjzEL99hBsp4J8k6FyYcEHlAyisaHbJIjYaOwvgClx7rBXfrI?=
 =?us-ascii?Q?RfwbyruQnbSXE/fK2doVts8UrUdRv5i529SuP8FKb1KD1PoWh8GzFwVerxzJ?=
 =?us-ascii?Q?RzI3tLYYls7ULigJpN2mjAOv0Q4TP9O3kpOeH7yvKO+Jzwf5S4t4t0TIDhiw?=
 =?us-ascii?Q?kFYhDfrkBF9TrUWlOUwMDyL8aGhXFMDJxuUmPbUTSXtyGzhMiJsXvq3fubqs?=
 =?us-ascii?Q?oPvimKuKUVFZut/6TbsnUY2TcLweB1Vn4FkLXBwwaeFfQcWSvwgsR/gwf2yL?=
 =?us-ascii?Q?OEvbPQZVw4Hv+F7pBHCRBj5nxQ4a/2+lOWY3QzBqA5BISVFSZJnYbHcJtk4j?=
 =?us-ascii?Q?tQ3/9wAnlPZSB9zsNhkoy6PwixgQv4k+8ydomnKf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebedc6f-f861-4f5b-f099-08da8c7b302e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 00:36:34.4688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd30vTZIZeGkZpOBB5j0BGtlRcEvo31xweQ/x/lyWbhPEyAUNC2EoP2mX9lM8aLk/3E+9aD446N/WqV/uwc8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5086
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
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
