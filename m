Return-Path: <linuxppc-dev+bounces-17628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKtcCAVAp2kNgAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:09:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 230411F6A17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:09:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQRj94TLnz3c5c;
	Wed, 04 Mar 2026 07:09:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772568573;
	cv=pass; b=jdafjjdPr0maHzDqUziJKxkHoia0IwZdbw1RSB5aOu0uft8tL1gLvuunOQys/Lv9HeIA8FFTNK541j9ihTVx2xmYclY3pukDmN1j7gxHxFLjiyxDBokQA1EiEBVd6IiPO298hiCQ0HFTwncnWlWjQiXRWbd5JpGXj0bXCH3WZ8fOKiB4fg8onTh1U5xbWB42dku9N0GEpfDx3xndjCViZJdbADiQGs6nCWlxblDR9AaS2uvb/V1aH+y0zfkcZyHfxxE2OC8XLTvnPv3/4aTCcMkMhR7m0UBuoDXmdf0YNiUIQecMinXerBpGEB8MniSrEenZNlOb+2B9EfJECbFSxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772568573; c=relaxed/relaxed;
	bh=KNqqN498IDW5eyfcUD1vMMmrinlWyRwOjiSQNUbO5d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QRdYo+sdgqPNzWzsBnZ94mTl7vkuJWKQaapIoNHo44vh+xwr8SZlOa5e+mwAHAecV1kZwZPHi6Ij+GJrVWxapUvAgRmB3QClmEkiA5ho8kjtT3mEw1ORrMefvL9l276szD1hDZ0dqK6Ha+kPgw8W947FMhmtWAgB/7HP+CHIbvl1mZ34PnDlGH+QpcJ5x9V6xqVWAnFZVcXUgSgp3G8jKjBmQf0j6FS7oA70sPhy+gu4GSeTgOvYzrXj/5cCPC0LLsgwmksAl4nwyrs9y4SVW2aD4ml8C5kXUWSb+KmeQUVlbX02xwBYYNDwU0LRr+taTgKJdUU9UJgYrntDgZA6OQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lw2o7OJ8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lw2o7OJ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQRj86wqMz3btf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:09:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukOExiw564ZmifRIW1zX07r43RCn6F28K2pWRv5Qznt0xm9ZhbecrkEBmFe73uGmVxlxYNLL/fKczvKw2rlhUtxeabsWTChwCfqkYHL0RKWm1bTOu1P8nWrs/gpcHWFx2ZOhzhRFDqoR/Upw+uSWJN1571VgdGXs9BVADnz/MhdCv+TYXQgZDeWMG96UAONAIW+4XGf8QtA3UkFAUXqzTxn/f6hpAeDVGOp/0+HJ2t7i8kuKS38gtmI7C9KHNhVVLQOEApprriWgzTOp7FlJpPqXGT4Ln4OgLbg/LjddblhugK20/+YownTzhztHYYBthK14lZ0yqNPXI8iv57cyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNqqN498IDW5eyfcUD1vMMmrinlWyRwOjiSQNUbO5d4=;
 b=woZwJYDccvBp0o5SmxZl7eDwgC9vAogNXcPM7lNZF9M3TWAE/q+gc+gMkJkOt15tfUBYZCfEaqu9T2qD4G1Ium6aq68fBWJBaJGavl6/NhnG6D+VLtZDdUGfUV6hSAEZJlWA2aSJSGnveS8CbLz+eVmoPlhScfVl3qK2Lv7MEEq1hIzYTZmvjsdDJkQKcp9dRjYrRjE9NFx2KX0qbQdxeEFBUWLnwxiau8aAm+Tu8eDiBKQ3lBPrfHetIkGMAMW5p4XYtTX5fHOaWWxK6o0t4HwhvnUfidT6l8U4cWpJrZxuTgvpZxAMc4UJWO0jmfRURC2qc6Yn9ay6T7vCMFdY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNqqN498IDW5eyfcUD1vMMmrinlWyRwOjiSQNUbO5d4=;
 b=lw2o7OJ8JNC3T4qn5EQNE9zdqZI4WvC6hH8K58SR1yWMt5kc6o95A3SLg3Cz1t3eHMUCHZsKnOPnZKzUf3WQFeK4xGeVOzsdboNvy06abJzfdejsPTKqSfqaRZTuEs6GQoDG/8OzY+ywP8d+NkmtY1af4aYPZ4BDir5WSksC4ytCFHHiHeFWIPc2Cfn5a0Sh1DDZXL/ncL/S7kb25shMbwz3YS0BLVpdALm6GC10JNQ7ppuE5Pccdd8KoXknNI83tFxmYvvDuD2YTt4ogHkYfBedVOB/jKOWeFL5Mu704j6jksmU9hbRh9I8efFMPAEy/aNgUMJT2NfDiUqqY7H+uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 20:08:51 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:08:51 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Yury Norov <ynorov@nvidia.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 2/5] thermal: intel: switch cpumask_get() to using cpumask_print_to_pagebuf()
Date: Tue,  3 Mar 2026 15:08:38 -0500
Message-ID: <20260303200842.124996-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303200842.124996-1-ynorov@nvidia.com>
References: <20260303200842.124996-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:408:e6::22) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 25863316-a59f-4fc1-b004-08de7960aefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|921020;
X-Microsoft-Antispam-Message-Info:
	clNOo8hegF2DI1JTY2VGuCIe5yBGL5U0FL3YLYQ7tDICwlfyLNaZtpWJAvmntLYoU0eyPzBF0z7Wt7eb9L+7eHMWo3x1SuAODNFSwLfsurBiBfdmSLCfZABm55i5sLrg0cKMlbgxz/2VZD1G8j2ud8cUUtjnmPs/MLb2F8bCg4VeN3GRaycKj3sKxI8xgrSmn24e3sDXo7hkUN3GINDyVoSG0DjyIV05AFDIc/2/u6Iro6RNpMnm9IT5i8pqGxTCwTdQ5GlFkNvyK+15JCZmOm7GTMMYvIrEcDnfJCCgBFyzar1KTiMIRMhVM5/cFqIt3SjM10WluJVADzpdC6QGSfKePWDZYpEfHDZioJG/MH1NPVXElPKClSZD5Igm42asA8r6n4yYrqd6yTs0N7ZtM+lBXRDXAAz0Nm4xNKxrxa2ZJVvXvggZA40IwdKo/8i9dcqj0MxMl3DXzy62Vto+g999JMCTZUhGWBHUtScPp/9YXzet5t2J03LIR4DrRIqWkW4dh0K+hoSesr+FYqxJIKndDw+rWX+K8K+groNC0SDLLOJF/+EZPhox5jHwGEfmJPelbmz3vmlW3HJQkt5LniwzCG98uNL3dYLL3rxmM1QBIfksE9pEtQzPIGzpJo1NVbQpdH+3b7bRWBhRxzSWevwXSEJZDnPq/LR2zJw9/4g6NAWpA3d2TLQBLGRfvMjs4SWMIT2TZNnf/1lHlPW/AKQcrXAKXWMHkdJ2rq6CmoVgDfetJ5M0sgOMIQR8rZ1bY6agBKg0qvqGc+gKmmz9qQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SfqSAYUJZaJ3qgFuFbYq9gVkoAhDQnlxGIzisGkLlYNpkMDM/hurKD2NS+Ou?=
 =?us-ascii?Q?rJEAGkzFA81ssoBqD5trN9eJsH1MTO8czTRvuy3mJpr/GxdJeqsjZwUcV+IW?=
 =?us-ascii?Q?pY9w8w3pT9iJLIx4yF/k2Y7K5JIAsZaiRI9ylK7+EFuRrCdjdyphC4ShT0yA?=
 =?us-ascii?Q?QNluYsFvomK6FSQY7Yit8NXnvbVooAfbNPjo0aIec+rFeacFTGRsM169TNqC?=
 =?us-ascii?Q?fecXGI+S9wMlYIrNuGuJNYvsvyY2jM/3FRe+YVjxXTvyWDp0AVQ8jFL950TF?=
 =?us-ascii?Q?c3SAWZwJzh+VFB/9NfZGV1T5PBC1Lk3bwSO1IDoYIgl5T+205D/vhb0UMLzX?=
 =?us-ascii?Q?c2gQz9FNqod66/muvGT/J2nDBJLiwl4WKFVbC1ehJeCecdWWHcgzYtfU0iIu?=
 =?us-ascii?Q?ZBk01udhdfkyxGWtw1PQAHku/hubKYj64tF4b9TLUQp6Xm+AbrRqI3t/ImQo?=
 =?us-ascii?Q?q/iHJ7WHrA5Nzr3KR5JWEo/SkZlQIBIs2m9iTQxMgSeJhqnrpG+TzEo7D0Re?=
 =?us-ascii?Q?CQwwdl4ZpTGKxi14k2/d8Nlmonsz000Z3d+d/MXYapBc9MMCutnYVv9NM/Hr?=
 =?us-ascii?Q?TdCJWd37Q6VWysyBkZ5B11Q6C8pyhLHOtVFxaFkq04pzM4Kv311rDmjbGqmo?=
 =?us-ascii?Q?/mzdHATOJg+AVeCKqJRBvmHEXqgrmHHVOLUdweLA8eeYyDeNvQQDMllXMqNL?=
 =?us-ascii?Q?nZfqebvYubSF6MRYl+mWdUz63BYQFngSNOCO9qJ3UBqOqDfpcIGdlJrzfv7M?=
 =?us-ascii?Q?dQ9KPOHGI4a+QJ+ymbSucxjDeeES8UanZ2rBaQkTuGJSBGec+chXhT0CQYWq?=
 =?us-ascii?Q?VzfnJ44i0CXcQRVhaGU0a/UkH0A9Ny/tLy8ywHV+y8qDKM5h/YR2nLyW7FXf?=
 =?us-ascii?Q?T0CexWYtiJI61p1wHsvmeTk096uq4sRrDG/yye2H+UXU1RKkGS+dmde6Dpiy?=
 =?us-ascii?Q?s10RBb79rzN+GuAg0y310L/OJ1bSZ7JC4VVxk5XcoFI+ToK80zbqV/mhpMbD?=
 =?us-ascii?Q?Z53O2ms+k4A6WzpMWOwYmljAzrwyn03lpoiV0qnTot0U0IOcNY+Rw1eCCSf5?=
 =?us-ascii?Q?haGB1X8Urdxx616RGV40VFYk52+9OaErpVVJh+vN7tOOZxpAFX4TylPbmHJw?=
 =?us-ascii?Q?4S25dtFSHZtUjqhT4i010PWSiJKybxV5wHVFbpJIlTLsQYIT9CjoU+j5ul/z?=
 =?us-ascii?Q?coW+DD3kvvBzIEhA+L3ifGN9LboQp+/tPYon7B46sP2lM8IDOrtMlz25gdiJ?=
 =?us-ascii?Q?qGtTH838ThJBVC8Op3N/pYiIywv/WJoo7o0RuY6fH98rRk5uy0rWqx/hPxZO?=
 =?us-ascii?Q?oD3TYGvWP14r2ReIx4jTptdXQlYY13Exau15K0VsTGz/rvbAHnqyYodGQ76d?=
 =?us-ascii?Q?8xxCV9vPWMjK6pSuZqYfeP36I9Dz89DGxGWFNcFdw/KGd8fyOBx7vJQvXCQz?=
 =?us-ascii?Q?ofUivBfMbGL5jyVbbLio87yK/0WFSswJZ4/mSAZTcKCQsCN5LzGSfzKmBAC7?=
 =?us-ascii?Q?20cQKYArPay6yZq18Gy9OsIIFvTH88rnSDFrd3L+XOs8wgdhvhAmxEswIwp9?=
 =?us-ascii?Q?DhV8VGmhBQdpD8IVlOmbdps1QUCBJXplEMyRYg8V7gmbshT2olT7H7DIbufP?=
 =?us-ascii?Q?D7+yNvuWq/oWNIjxv7AYjZP504LBURjdSe0LE0jgAk/DYrDruvH+p6RvF+0W?=
 =?us-ascii?Q?PAO9drohwEPw6XasPQnuRiq/dxQZA1ba/dKvHO7B/0VQh1dXlD3ebuKkNOuT?=
 =?us-ascii?Q?cAfHnltO1mLbn+hfpov5jaZi9Mtk8aQVgvHk33hKht+bo/gNMEL3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25863316-a59f-4fc1-b004-08de7960aefd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:08:49.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRTT2x5TxX3dUtdXi2u8tOXW2KxRUzbBAgXs+tTQmt0GTX5Os2AcPuAApi85oiyyRcPVayf3XIau1yEPDgGESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 230411F6A17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,infradead.org,linux.intel.com,linaro.org,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.dev,redhat.com,weissschuh.net,intel.com,lists.linaro.org,lists.infradead.org,lists.ozlabs.org,nvidia.com];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:daniel.lezcano@kernel.org,m:mingo@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:russ.weight@linux.dev,m:sshegde@linux.ibm.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:linux@weissschuh.net,m:yilun.xu@intel.com,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:ynorov@nvidia.com,m:kuba@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17628-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

The function opencodes cpumask_print_to_pagebuf() with more generic
bitmap_print_to_pagebuf(). Switch to using the proper API.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/thermal/intel/intel_powerclamp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/intel/intel_powerclamp.c
index 9a4cec000910..ccf380da12f2 100644
--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -200,8 +200,7 @@ static int cpumask_get(char *buf, const struct kernel_param *kp)
 	if (!cpumask_available(idle_injection_cpu_mask))
 		return -ENODEV;
 
-	return bitmap_print_to_pagebuf(false, buf, cpumask_bits(idle_injection_cpu_mask),
-				       nr_cpumask_bits);
+	return cpumap_print_to_pagebuf(false, buf, idle_injection_cpu_mask);
 }
 
 static const struct kernel_param_ops cpumask_ops = {
-- 
2.43.0


