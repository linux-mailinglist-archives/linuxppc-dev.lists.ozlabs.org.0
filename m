Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E655056D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp2G5pcFz2ypn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:39:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=IHTcGntl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=IHTcGntl; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyH2QzPz2yfZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:07 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23ICp82j006460;
 Mon, 18 Apr 2022 06:23:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ug0HQU3Kvh0LBBEJuxPqFxupe6g38RAI5corIgOKzi0=;
 b=IHTcGntlqccwUXMmWr6U3AE3rcvvyMzMFTQ6TkZU3kW+la9ediKWnj4RTJf8g+dV3/Rz
 ASkd/l5rO2DVBD0axCHPBoo9U9m5tMQzMh0zChDMCeEeRdcEyNtMCWOkvSeYYbrsvilU
 MYpZska4PWorSBPv7ZTnaArEc1yE0jYme3ICAkSdZRCTvQlPQHRWn+CWoyMq+35iCDen
 JAr3KUaTI/O2ChDb/I8sXj3k7Rv/D3fLodcjz+GNv3ADjaD+Fsrhi21jT1FrscnNNrdy
 sUdwVVsO6lgD1YOKfjgLjc/eswUGSqVqH8eXJbitNa1pbn4ynYMz0Ai6Wmfq7HiyD3Fo XQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffwah150v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:23:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6udojAcfC6uOBRZvHNpijVh4uC1mhHVMTj7NpC75uPfrtpHIuU3FqYIlGfRzWPDhIhjKqm/yVVGVUwyy8ghExox6EymrLSbskX8CkhJmVjShVvd72HzfIr0ZqabBqrIvt3ZvFmubH3UkIXyPhgldaFxF7gyehwPRvvfNhGLNeBSclfzveG9Etd6Rby+Ls5VfOhaYghQkvTbbUDVmsaqxjcuHvFYxAaKoaIiwpe3EZy0R8Yk/iiGrj8dxanK/SDxasGbdoZoygKNXFeaq+wKYIuLBGsAf1i2rIpSHkr+o6mwy5OX5xchQiW5uAAcSaBZT/8S8xgdAEtNraoQwhI8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug0HQU3Kvh0LBBEJuxPqFxupe6g38RAI5corIgOKzi0=;
 b=h5yoa2RR0SZfhFVA9P3NornbSdwk2/QegcBGWmqtOwoVEjAc3QIlcGIj3l6Tjyksdey0HgHIVLfTnNwTWr4PTmHJPVbxAJnpqlbukCy2JhJKm/ZpqVCNJ7+x2jzG2M1rOnMddDEc/tuwfQheXfMvFOV7snt4XKWwZlkeEKuWb1uRvzKQjGJWz/1ekfEm2ct5kEwRt9VvpxZS3ZC44YN+JQMPo4Z37C7RYZn8mTuAnOKkr9SIDLjH4Cc8e7Dk9nktUo+TEKmA69vpFztWXsnp6uafzSAXNg72G9BhKp960nt+WPJUYnHBZ1x01r2t4SndcAdjTu/tunw2Ped46iNRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN6PR11MB1473.namprd11.prod.outlook.com (2603:10b6:405:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 13:23:16 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:23:16 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 8/8] lkdtm: usercopy: Make USERCOPY_STACK_FRAME_x able to
 work for all archs
Date: Mon, 18 Apr 2022 21:22:17 +0800
Message-Id: <20220418132217.1573072-9-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418132217.1573072-1-zhe.he@windriver.com>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42be3c65-3b61-45a3-fc99-08da213e9917
X-MS-TrafficTypeDiagnostic: BN6PR11MB1473:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1473E5CB3CA4CC424768D0D78FF39@BN6PR11MB1473.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nsrNGr3SCouLebJu/jKF1Nrkg21TzYarT94HKK+YVTYal2goe9u+EJHOZtqWwepcMOn3QvDOlvv5xtaLZOlFVKan4hhV0pV/pvRCAKypLNt9ZovLGgkA2On7qgGSkyUIXOrZxU5QGi09Fg1i+rZA8sypBIdCtV/LYVEfASr0TXzqfUAirsRF6z/zGCzPzF0cT3XE8P3dfwlyQjp85MhAzDCyQ1jwM8AHCd8QIUC/bgW5ahFQJBByDuatOr7zGul4/Z2uJfrYJCM2Kcy3V8N8igw1ZOY03KQIJKtHoRX45QFI49UfraA82Cd3XUU2BJdtQ20X0OuGtr0JLKU4vqkb75gZ/9BzY9lz/Pl3OHijBUmUZtk2reklTP16O2wVX8qNTJ95xB1YXbJA/1eDI1SM9aiISwHnnJlP2g/FeqwPBLv5zhhn+2gWKpkRWfA1VEhPKb4GZYoLlj5U5HfKuIPC4/40lNU2VnFy+PH2Y1sYn1QsNYgI/CQJckJKX3Twh1rK+oYB9z6N4Y8a+lc/7Jr+UwnkCOH5yDK8W3Tep26YCe6JJwgc17B8NQQ0LvOBQ2B5F0oZxro76hkUXCevBGCKTmb9ZuBSe9ULm7kCTQ1uSCEH25Ucc+736CuyV7h0zfkaH3Nx78kAGszSpXY5IEuKQm62+J5Ddc43RJQvHqCs97pbZoEPlV4OaoVF9IDDuTlrbS9QIcrxMIi2AkmTV+8nGJqFTGPdpGrjevrPre9Su+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(83380400001)(52116002)(26005)(6506007)(6512007)(8936002)(1076003)(107886003)(2616005)(38350700002)(38100700002)(186003)(2906002)(7416002)(508600001)(36756003)(921005)(6486002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I67i49faRicY7KH8Z2bAniN5bMQg2ZOTPyfA3LZVoHQ65SNxRPY9eFA8Tzyv?=
 =?us-ascii?Q?sCDapEVCsOcHSlLXdEmrx+LjYjv+R8ui2f6KrkNqrKNI4xSG7r3VSzM9ZePj?=
 =?us-ascii?Q?osXgLd5CvXBWxs+LwsvzOVlZL8AfwKWF4fdJJL7m7bR0viUktd64g7G2lxpl?=
 =?us-ascii?Q?+ELxAxOwDjkcgxcN9E1OKnJTRsgZjI3m+Jem/nup+1CJMhIcxCJ01jOV1jem?=
 =?us-ascii?Q?a+5e+7jbpEN/B4UV5OXabImLI6T74wgufutpmISQVDpeWg2LymUVhFmt2Kz6?=
 =?us-ascii?Q?Ti/XGQRrmgweW8cauBFr0V/PLExTuVtSJcEhiYD1HPKXiZh4NJvrSQwbpeuK?=
 =?us-ascii?Q?AN44SZ0F7IFHMIhnZytR6Icec6Nt/98fvJNFFey5SgIWAMMf3qCkTyM56Xaa?=
 =?us-ascii?Q?4TekVWtgkuYI5Pzv1vNw2THBXcGKRdRRI3rl46XLH8iqM7Q6ZX7QutgFWbfn?=
 =?us-ascii?Q?TP3qNtz5vcNjRVi9VD9lO73JaKmNSraftjVi7Bk/fazXMGvFir6cI/7tXyPl?=
 =?us-ascii?Q?dAtWit11ouo4eH/vqXJhvCcedACK1CKcGu3jRAmxYKr1e8eE1/W7JguIn7fE?=
 =?us-ascii?Q?rCfZckBuvXJJ0jhupfboVWgySvk7Uy59QWNNN4goHuGL2Sr2ChEPgewKnWDM?=
 =?us-ascii?Q?IoKYRAQNl1KgK3tuhEYmok39+fRwCNLjWPpgmkRUad8W11Tffs6v/tCEuGUb?=
 =?us-ascii?Q?Snbl5ZTNlFhc4/yp4AWSyqSRwIeeD70D0/FIAzFmTr+fOPYLvibkOk4RkSEv?=
 =?us-ascii?Q?35mzRwK0kkOI6JaeB0MmRQDZKIAMbTk3TPkdjesqcQ+xwRpYS9JDivejV3AJ?=
 =?us-ascii?Q?y3dq7HrxtChzmIQGlG2GwzNVxoMtqjIZQ6qmJl97AQqcbjibUbJzCrzd+bWp?=
 =?us-ascii?Q?1kQB9XIw4l9MDrXPtU5XWf0aU06zgS+Aaw128pyGkcpZnK4lwdoGPpi10gYY?=
 =?us-ascii?Q?vjAVonSBZLYtThxgJ/Dy5ueuPQJu0vYNjBT+To35rI8EfDNxnj/sK6MICTtG?=
 =?us-ascii?Q?ywdxet5o0bHtBbpK75lSySWV4u0MdY2aSIv/8p/rsRGZuVfvcfeBImx71CWx?=
 =?us-ascii?Q?y7UtN3PtfPnyyV8WH1jCXAmK6pve6TyHTi4KX7sfUxmxBOGzVCt+yWR2OZSs?=
 =?us-ascii?Q?UKb/xrtAko/H3HB57mBWcvqxKEGYUYnNnWwwKf9AnStcTQmXgEI/ShLunAc6?=
 =?us-ascii?Q?Xu/vcUvIIxjHU48fv3OClh0S6g1c1Fkw6dWMlm5XbIw1uAF4lGcF/l68GjSu?=
 =?us-ascii?Q?5V8wuA6g2neLxR/zu9EAix2uk4bNpVo6tJ0yIR/xW5ICIV0ujcwsRs/ob2B0?=
 =?us-ascii?Q?l+PF5qJRihpA8WmwQUHLf7Row5nsFegEPo2YV5PE3jkBc7tu7dCSTN0fNttN?=
 =?us-ascii?Q?0XcTZDH+IIpV3c92Tsk8SbL/MRlBv2N4Z02NjaUeceUDuYf/VzYZU6Q5w5lg?=
 =?us-ascii?Q?kk2jXKCbU4caHJ47obqJs5i6cmr9OOuFax18c41jIPYRQ+vGsVy92XDoMwuf?=
 =?us-ascii?Q?G7Jt10PZxemPIisLELc2S638NgKm4/c7GblQc/AQC90brZOJWiqyeDyVKZPl?=
 =?us-ascii?Q?zUo7u0co6YM1UD4HpOOcToBry+cugNycWavjw4hph5QRcDlbDXxYQCgkTman?=
 =?us-ascii?Q?DH9j9LAyotlifxfjAKPsYQjEsJx492jn2omx6CptyNRy9f0pjEC/3kWdU6j6?=
 =?us-ascii?Q?15oRaTEk2JPUzMcrxxAGsx5Bw7rgS2xy/+syWRmDLdV/SYSFE0LlgWj9EmQk?=
 =?us-ascii?Q?R66gldcgow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42be3c65-3b61-45a3-fc99-08da213e9917
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:23:16.7615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EYttejDG/fzP0CMKXiqS3f4PPnoe9CdjA11GRZ8pStjZT1ACsBSp3hsZ273Y2U7GmCn8XgD0IzadJqCOnZyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1473
X-Proofpoint-ORIG-GUID: rGlnIKPyJRpc8SVfH1iCUMo_VJfQbid8
X-Proofpoint-GUID: rGlnIKPyJRpc8SVfH1iCUMo_VJfQbid8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204180078
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
Cc: linux-s390@vger.kernel.org, zhe.he@windriver.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the way to generate bad frame use depends on stack layout of the
architecture and compiler. It happens to work with x86 but does not work
with arm64 since it ruins the stack.

On x86, the original do_usercopy_stack_callee returns the start address of
its local buffer which is located deeply enough in the stack, so that the
following arch_within_stack_frames finds that the address is out of the
frame under check and gives the warning.

While on arm64, the local buffer of do_usercopy_stack_callee is just not
deep enough and happens to lands in the range of a frame so that
arch_within_stack_frames cannot detect it with current algorithm. And worse
in USERCOPY_STACK_FRAME_FROM, the following writing 0 to the formed buffer
just overwrites the return address of the call chain.

$ echo USERCOPY_STACK_FRAME_FROM > /sys/kernel/debug/provoke-crash/DIRECT
lkdtm: Performing direct entry USERCOPY_STACK_FRAME_FROM
lkdtm: attempting good copy_from_user of local stack
lkdtm: attempting bad copy_from_user of distant stack
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000

The detection algorithm may be improved in the future, but before that
let's tune the test case to validate current one. We can simply use
__builtin_frame_address(0) as a bad start address that can be detected for
all architectures.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 drivers/misc/lkdtm/usercopy.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/misc/lkdtm/usercopy.c b/drivers/misc/lkdtm/usercopy.c
index 9161ce7ed47a..000a1be15200 100644
--- a/drivers/misc/lkdtm/usercopy.c
+++ b/drivers/misc/lkdtm/usercopy.c
@@ -24,28 +24,6 @@ static struct kmem_cache *whitelist_cache;
 
 static const unsigned char test_text[] = "This is a test.\n";
 
-/*
- * Instead of adding -Wno-return-local-addr, just pass the stack address
- * through a function to obfuscate it from the compiler.
- */
-static noinline unsigned char *trick_compiler(unsigned char *stack)
-{
-	return stack + 0;
-}
-
-static noinline unsigned char *do_usercopy_stack_callee(int value)
-{
-	unsigned char buf[32];
-	int i;
-
-	/* Exercise stack to avoid everything living in registers. */
-	for (i = 0; i < sizeof(buf); i++) {
-		buf[i] = value & 0xff;
-	}
-
-	return trick_compiler(buf);
-}
-
 static noinline void do_usercopy_stack(bool to_user, bool bad_frame)
 {
 	unsigned long user_addr;
@@ -59,7 +37,7 @@ static noinline void do_usercopy_stack(bool to_user, bool bad_frame)
 
 	/* This is a pointer to outside our current stack frame. */
 	if (bad_frame) {
-		bad_stack = do_usercopy_stack_callee((uintptr_t)&bad_stack);
+		bad_stack = __builtin_frame_address(0);
 	} else {
 		/* Put start address just inside stack. */
 		bad_stack = task_stack_page(current) + THREAD_SIZE;
-- 
2.25.1

