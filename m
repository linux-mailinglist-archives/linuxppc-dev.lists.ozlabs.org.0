Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD4713883
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 09:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTW4S3pH0z3f8h
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 17:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=rwfhdSQK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:fe5a::816; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=mirimmad@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=rwfhdSQK;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn20816.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::816])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTW3W0KVMz3bkk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 17:47:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYBFPhL4figCJY/15HO7+jBb591Gtr5tEIAc1vrV3chqN5S3dh6NpiGR1ph0YoV3Zv6SoYd69IgWJa9bRvXhwusPhqhhztaUICs433l0pD8jPOJIndHi4fVDfUa9eIuF8lCe3U0ey3TisavrEFEXVTc516DsjaDyofFA/BCBX+bl3ZYZeFdMtKgeD5Qe25UvvTm5+Lj2VZH4kjw8S17FzcAMvAhQ4RcK3agluNK0yOQ25aV3/wL3UcXdxIGEtf1ojxATkiIo7RzXzK77FbJN1TxA75AwUQiXrhoFVilcL5Yux2gyMSBaA8b0dghorxI5SNeYvVf+DZ3blTlwFPFcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjS1N65ZDmqs57j1FSHtVm24YWtFdEP1MdFyJtzlQ10=;
 b=BGKFq3eTViqYvXgOLDQv+WA5YYzjEzRkEwOFu+rDBif6hQUlZO+oA0ILLbaV5eUT8ir3ZLvfkFD7yaZD/xwOd62mN17jtoqL9TyJFQ0FND38JPRadNl0IG0uN0fbwRDbSV7qDtTnIPVye1cVT2sLQvFklvdbpohMdoIKMc5cnWagdAGOaP3Wfx99alNlo5TPH91cHfb9QfebEDzsK8NyPXV4Jd+H0GavL29E8YliN8bI7WjQHeNp8FBTVtVJylcwi5lNZdQx2zchiJrYUj1/plrP4fKzjuBQV3JP4CgVAYFYEa9ys3OtoYSoni4u07Ena3ltiFqi3/ASV0X8dynDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjS1N65ZDmqs57j1FSHtVm24YWtFdEP1MdFyJtzlQ10=;
 b=rwfhdSQKHzyOIfnrg/lE/9zc8z4LBz+9amIvVPDFmokMw0/pL6FiV4eom1Ksr4lMcENw7aKa6ujCbRVGHKVrRiQEeIUyVA7FxKIBznVLqCsYA7aRCTtTsdOGwOjpfVSqluUaI11Vxwu8/nppxm5XZIsoduBLx0BiOU4o/ObprG45J3TiBKsvaNquZ5Bp1FMrnBh0thxm0PcNdwhfo1X2zxhmQ1nnqnQB53GE4Z3LEq9Chg+l0qSEJXOuPPjYyIWUsmYyJlcBASEespH1/hMue/3+w9CvvhVkFQ9HGt9vQFE8a8x8AErYz2gpx+xDVsjC0iAxJXJ3zk4tYKeDTXv+6g==
Received: from CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Sun, 28 May
 2023 07:47:25 +0000
Received: from CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::a39e:3607:29f5:9cdc]) by CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::a39e:3607:29f5:9cdc%4]) with mapi id 15.20.6433.020; Sun, 28 May 2023
 07:47:25 +0000
From: mirimmad@outlook.com
To: gregkh@linuxfoundation.org
Subject: [PATCH] powerpc: fix debugfs_create_dir error checking
Date: Sun, 28 May 2023 13:16:44 +0530
Message-ID:  <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [+FmfwTNis240XJa9jRjfrAgn15I/UnxMPfjBZ4sScovoqifeSgsVwmM591l1eM8q]
X-ClientProxiedBy: BM1P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::33) To CY5PR12MB6455.namprd12.prod.outlook.com
 (2603:10b6:930:35::10)
X-Microsoft-Original-Message-ID: <20230528074644.4693-1-mirimmad@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3f02a5-fc02-4bca-6bc0-08db5f4fc6fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8lpoaBXq7EYViZfOVTqgnP+WRXOrz9OCwatIpUWbX+xy6upcLAdUgjMZNRJxFypEoT6PD2vErYBdQE9ngoavhqxjKFi9KIJbpmmtAveqww2/ym49L9GidDAC+KiVxorGwoSS8R7wWWnzJZWV/mfG701cNNft/JK7Gk4VxzoCjE1KdoFAzy/i3xNSFYuh4wRDTjVfOA30sS74Vy7P9HSlNkbmFKY5CYqc1cAdbUotEy8DMWYqH7nspRNuJXKxWGonzWtNnDu4CKUY5O1/SnUqRbi3BObapQUsj+lSQw1jdDDuCJgYI4bMkii/QIHLv6ghCFIAcodAHDYa9Eep1SHMiblyQrPJbnEAzjCfQq5JafKE4fZYRa1RQKespWk7qu9GMoaf8rDnNPextQVpmCi+iV26W2rAZz5mB47luyn+0wuLFDSQnrA81UB/HRBJbkPhlFX3RyTFKHzCM/ZZ3qNLjNZ2FpEZH/HgsMKJ5bUD5l2z8uRVY9MEp1BPbzhTawblSlrDxCulHR4+J6ZrHOKd/Djo0J8enYPRajO+14oPbot4FmN3ApGICsB6mOdWIN2L
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ALtumnEaDhCjiloC6P6lqY6dJrXaKh9nX7uI/mhI5/hFve45qL7GDnPDxNn8?=
 =?us-ascii?Q?NctpbwvVg9X4OX+7Y5M7ROWFFe4fyY88QcXe0YcGmXaV/PFkeQU74yKHNUO6?=
 =?us-ascii?Q?6NRVyJnVVHMPzB8622LbkytvPxvi+6vST8ESXpSoEEMzK4KltpB984XFyGVR?=
 =?us-ascii?Q?NP2bp742Ukya4slfahr4ZMgJJJhGv6mmtHg3vRUGfCDa8+agwoLsyh6Os9P1?=
 =?us-ascii?Q?kimM9NqgzyK4hbGefTTZnD6cgziNWG6yurS7NKRiRjtUj7A6vbqwGgsFbSZY?=
 =?us-ascii?Q?n5ICP0rzJq5LJiX/uNK8MZHsLTlPAm+tB3AAIVJdhgQNJ2V5H5Uw1PVT0j2q?=
 =?us-ascii?Q?q4CcPx29qJ4tCr2/aHPdJccXrMSqcYO/C4LpfwrCpTx7m/cI8ZlxjAHoymkS?=
 =?us-ascii?Q?l8bqEwjQx+lx35zkWwrjFiTCwfMVZPghpGvz3E3LA3tM5hPP9ACtAVsr/5zu?=
 =?us-ascii?Q?Z2G0Hn8N9/J5k98TcsZUezHRRcVGyCpcvauYL68VE6B/Z7LIToDFgzxqlrR/?=
 =?us-ascii?Q?fB+pWFJjDbdji1SzUWJ5BpDqm4DlnWADr+E7jYUjQl1BxR4Uv66t+KfblBux?=
 =?us-ascii?Q?HJlUI8wwF/itlsVsrpXwI81BQmHgMKYlFelddRfpfVmZO9fyAVGPga5pMCZH?=
 =?us-ascii?Q?AIef3cVwwVp0cc9rOPHbYTF6AB9aG2EYk46aMEcm2fjTtz2PhXG4Y3KCx88z?=
 =?us-ascii?Q?fXhmk60R5jTv1ipa+aOHwd0Vw9YIp3je+6EAxZqpSGs7UknKQ9ONRcyZpHd3?=
 =?us-ascii?Q?JFt+/QzA4DMc2W3unx2ZwiFd8hdFp3lxCma8T6Ar5E5aEtIR6XzeUKT+2s2J?=
 =?us-ascii?Q?uvn8/+1VTwT/SH3LwYxK7DrKLwunKeCo4tp7Tqf8qBEY7YA+pFjyM4GxErVy?=
 =?us-ascii?Q?r7jff8yPgxSnufyGGp00jcL22hLUxH00IvahlPKCRCudTlPZg34N4dGyg/2/?=
 =?us-ascii?Q?AfBJ0Jq1JPVoChvOnX2wTeWxLMBMP1PKxzyPpcI+spl4nkv5XRXk3OTvK+fW?=
 =?us-ascii?Q?jp7g+BQiRE3EtTiuEwr3uyX+lb9YyHpyJvtsumIMmeLWj/WuvDw0Jv+IsuGC?=
 =?us-ascii?Q?XOLWJpZaZ0SmIsCs467Pph1s6sAB77cUemAGSWw0HWd053G9D8z2/DZir49M?=
 =?us-ascii?Q?pEyz6KhHkE0I8eCqBdGdbny2DFADzKv6HZcdaNDGFTYEQLWwZJAgnRVoARE/?=
 =?us-ascii?Q?mp2gmjd4o+uils1zpNzKjTaEWfEmEstoVOVmlBzyi+RsAkZrsaMg1zSuq291?=
 =?us-ascii?Q?P6R+bOikC4dSvWElkG1RzjMVCoELBGUXX7Jw1EwFwg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3f02a5-fc02-4bca-6bc0-08db5f4fc6fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6455.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2023 07:47:25.4767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
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
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Immad Mir <mirimmad17@gmail.com>

The debugfs_create_dir returns ERR_PTR incase of an error and the
correct way of checking it by using the IS_ERR inline function, and
not the simple null comparision. This patch fixes this.

Suggested-By: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Immad Mir <mirimmad17@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index 6b4eed2ef..262cd6fac 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
 	ent->path.size = strlen((char *)ent->path.data);

 	dir = debugfs_create_dir(ent->name, root);
-	if (!dir) {
+	if (IS_ERR(dir)) {
 		kfree(ent->path.data);
 		kfree(ent);
 		return -1;
@@ -190,7 +190,7 @@ static int scom_debug_init(void)
 		return 0;

 	root = debugfs_create_dir("scom", arch_debugfs_dir);
-	if (!root)
+	if (IS_ERR(root))
 		return -1;

 	rc = 0;
--
2.40.0

