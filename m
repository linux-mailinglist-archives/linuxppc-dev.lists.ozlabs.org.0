Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036050567C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:37:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khnzp3MJbz3bfC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:37:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=mmqtdAiS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=mmqtdAiS; 
 dkim-atps=neutral
X-Greylist: delayed 748 seconds by postgrey-1.36 at boromir;
 Mon, 18 Apr 2022 23:36:01 AEST
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khny95pYZz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:00 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23IDCPFP019859;
 Mon, 18 Apr 2022 06:22:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xcVf/tshGNvkkpxR7Pvh+P+nL3qZp/fr2Jfx7bsaVNA=;
 b=mmqtdAiS/aPzpm6mYvwix/zk/yGaaerlq0kEXRchIz0yaPCNYy86FyoIopyLxdFmFzr6
 dpZrT6FVLJqf35Q1gTqtw/51OWvPqIj3tG4euRQ+2BPQm6th/swCWFZHaxyWj8MKNsnV
 poFgURMpHTC1n6dB43nHosX7AJTIkam+Iq37uxqzEfYlLpshhEimnf95QUpbannn3qXW
 c3YtIkjViSd6UsU0ifVU7K0OzEWtjaWNrt8+e9pPMEhqNmx9Tm6hzdM+dXcurBlTV86e
 v6TS8UsiH39N3Ozsxll/rsqSC2irALJHRoONdibHKcM4O+HkGr7WyzctyMr3M+WZMRGL Zg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffwah150g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5pHMDZmH6LL6tCOxu8Nm8PkISEGJDEfNk83iLPhU5UTaD4TeoGB9pRRpWP1GEcrYyIF0brJwU6rdCykAQL8QHu9g2QW2p6/2RQp0UKpd5ELZh76b/MUK4NNxtvzsPG6YutiGv1WE+Pk/TaWU9J9x4/JlFhT5OtQLgUa9qU4jZHvfUOr37lepzbGAN6/ux7pSBtV4+ligHTdRQ7po2FJHZO9VADXZidk9yeIeaDv25bVNEh4LwVyRa0LHAtHa0/iQvwLPSZivzmqPQf19uoxmRT0FfExnelsCbZAUAQkYqDn/qjMSeBwvh97Gd4y0DxuUsAlA45tMZ9vT453Mngr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcVf/tshGNvkkpxR7Pvh+P+nL3qZp/fr2Jfx7bsaVNA=;
 b=dWwFla4SV/XSHPDQChB4Ljx5SZXwg43Wu9nqjln0Ih3M3NmGcIuAa/J638uvWhZcOVwMQ11eyEnYv1/mc0O/x3JJ2ICpIzOuVUJZ36dRJfJpA258m8ph8ZqVu0nqa/3MIs+97lki7TtGUPgqofXtvNQ/COg8svJrbN78PmUPkgrS1QpBQik9JoNt8SBy3sz6ZgoJre7TCPr2pAj529ovJJcRuujWRMa3rriz4az3Jam7kNSSGZmXOzFu0RfKmZWnzn3gCdtsu0hnYj7T1DQIE72kaEQNZbmVfd32L5bHv5djVdCyEgEUEBubN5qx1OIziOTa3bnHuwj84UWqq6WjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB2857.namprd11.prod.outlook.com (2603:10b6:5:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 13:22:36 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:22:36 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 0/8] hardened usercopy and stacktrace improvement
Date: Mon, 18 Apr 2022 21:22:09 +0800
Message-Id: <20220418132217.1573072-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8381d4bd-4e4b-4e7a-dbdc-08da213e80ef
X-MS-TrafficTypeDiagnostic: DM6PR11MB2857:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB2857B727AD3B43970BF5D48A8FF39@DM6PR11MB2857.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tt9RUO5obMpwN+Zd/EA/TZVNF/8xeaob7d3xary3RR2UT5VdkhsCjpY9B7lAWFuSTPju0p3551Ic7MMkB+jsaJYFRrPgB/eLfxd5Jd9ovIVWfPgTPjBtcfLb7vX9DF0L62ZfaAndarK5iE9TxKkMoQYInPcCbeg2CTfTDuCPTucwneIEiySr13m8iiAisy/ix+tpTIDgj12l54ykjau3D5AZ/xwTpAQLyvJh3+tpVb4ULyzHguVAbtE1MSkP+Khg2XNrzh8N197JyLo36wJFY7XYOCVbb5qKRyLLPS/tjv770ngH/yrInGm0uv9DkJcgciyVfXESQPBGaLcBMaAxVObDuIi1fZjtvRj7wy3RBd4mETtnjzARO2hvQ4o9IFfr40CeuaxrIcb3eXb8BSIz/9pb3vPBUkhGmcOtZaAjmMVegPtJiWX0lQI7H+E1L8B9Yw76afsj7wiiQHNzWs+XDIdyFxsWNMHrqsWAhGcHsBrW+qYoJ5/CGfsbfvJKJQk/MFfwinkztQKrvReOtqrYwOdpU80M99Iwjxbom1qYLnZHIutqV8rbTV6OEH4DV7o2CzSIbw0GM3H/e2u1kvMgCf3dHhstxro96De60vsCxCvEj+03duI2lCjeEQ1092L9KIDJ8M/eBxFkERACof6rBXN2FPV87bXE1VRWrWQfik82bTkO930223OR9tLc236CoFoaPWkfOtyW/yN82pLcAdOcybH8PmiGoHYXMEYHp2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2616005)(186003)(86362001)(83380400001)(1076003)(38100700002)(66946007)(316002)(66476007)(7416002)(107886003)(8936002)(2906002)(4326008)(6506007)(38350700002)(5660300002)(508600001)(36756003)(52116002)(8676002)(26005)(6486002)(921005)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7+T7/VOuOhLWViCWrbM4Ro98WVFQpcDROo169zHxbH2NtsM+wD/MAOSZr6d?=
 =?us-ascii?Q?HY8yJlH9N1kU45jkUVRq/XgUL30WGMpKUWebfe+RqQ5WbvNIp8amxIhkUvfr?=
 =?us-ascii?Q?b8G1YwbMx5llKSPqu9PEzjgIaoQTOVugtMEVyEsZiWqWNS7MrfsXAZWYWcrO?=
 =?us-ascii?Q?KQuGarMow6w2mKrYSww6uJqNkTmNbyP00L+1xJwVnlNMMh+J8P0No92GDGKT?=
 =?us-ascii?Q?mn417eaR16fr0aL/t5g8lSJfZxyh83ud1T2Wr17XwgJQJ0BcZfg7wo52kbkB?=
 =?us-ascii?Q?DNX69CTWlwrVY4qgGrL5/tO9DObK9L8RNDMILxilHC7oSTdN9ww7A7Zzv+O7?=
 =?us-ascii?Q?iEGUrXJ9j7wlwMlX62LT6QXzX1YjrUnagssMXc4Ysk/oe0RQAeDTaU6Gem2r?=
 =?us-ascii?Q?SSthr1WxR/o8Rb3a2OoaHbaYmmQXYdnV5YEtX/jla/BQHj7DurUSZ0CX+z+I?=
 =?us-ascii?Q?oyThTnH29Nd4POQLlo1HQ+xMzrNmRX/mCuU/KW7vKzJLDi5TWFu3DsWfX/tY?=
 =?us-ascii?Q?rsxoXGGCttOO/5ZIROIkqOfNExLEfpmR/SIPJ7cCoNAhob5kZ2PPkugB9WWz?=
 =?us-ascii?Q?0OjsgJtcTltI3oIMesdAtbiy/6P0eedI6skYye+g1vQCH8UXCtPHgfXYzYpJ?=
 =?us-ascii?Q?TdiEz5ImiiSW/4p2fdrze+31vHrwZSy0NcLk04nxYIV0aT00B38AfL1GE3dh?=
 =?us-ascii?Q?qXFFsftt8RRTHExZr6pL90DDpquajZuwYEhlmHV+iYN7sPuMI7pyixUhK29y?=
 =?us-ascii?Q?RfwN+U4U1Xx/GElkLt/Yy41HLZSCKsJIr41D74GGpwSU+bk8u2ffclicaTvA?=
 =?us-ascii?Q?JHzvAHvaVTx5Sg/cR96FxALH1Z5DmEqdoG1KzthDrEJY6dSOpS/7UKvUCimd?=
 =?us-ascii?Q?Cb2bB0UPrE9FqB/rIyQt8Idg1WfirYPtxXkv3479G7wORko2imDhR1WlOH0I?=
 =?us-ascii?Q?lvtyVbYEh6LY+R4U6F3Dm4TlQoiNSEcYdEduyHQ3F4O6DASfMc/sd0NGSwjf?=
 =?us-ascii?Q?yK1wi+TQ7WXpInM+1Dvc5R1E9LnVyoZzGx5ZAgqjq5QUDNNjl7sgp0E4I7e7?=
 =?us-ascii?Q?Zl4ijD3WZ/l4CJLUoMcpzTxM3wt4FfKbFLldPWmwoMkZif9xZbTeNvplGybF?=
 =?us-ascii?Q?x9sRIygRetsxk1XIQIp3T9nf6hT+EmqfOdsC8OzjolDM9DcKJqjvVp3+uw0y?=
 =?us-ascii?Q?W9XhCOJ9OzP/b6w+NpGTC86dBcdh/oqVbnugWfR+LkKiunfLtgWl/bG/p2c4?=
 =?us-ascii?Q?+vvIBsJEG54zOWcCO86ztYWwlZvL0/pK60SYJH3ts+S9iBZxq7UB2RD+yHTz?=
 =?us-ascii?Q?v8PBx+Ci8DJOl46+g7ZTUZkN9fithfmKsXzAExt8GjWNauWc9oUdcB68PXIN?=
 =?us-ascii?Q?+QAdITX9j4MIXil1iWZ0U3FLPnlUrmHV1KYPgNk4oH8b6bUYpLRKo+k5DbN7?=
 =?us-ascii?Q?mrtU3V0Kqj3LPmbxsJ9sSgdbVv+SJCgth6GOxd9NuIB/eCh384LJMz+UHNYA?=
 =?us-ascii?Q?Bn/ohkuHDZW23mjhgWrTgeR07HOsVCxfwx4HCwfUWxHJTO+O+x9nIKDlSwM8?=
 =?us-ascii?Q?5k0YSoD2O6RwmuRVXMueMtzaYaesmIZgJ5gZwlLsBHufDGSESKoXQQNbTw+c?=
 =?us-ascii?Q?ZoK8bx+yE7oFLkGApVTFqF0h3OgZ03sIaYuPMKx9Rcabcpvqk0/zbYD1ieez?=
 =?us-ascii?Q?gLPlp/21vQYQYBX3didx9PdSrvEdTXQFW0ay798yfApwnP0L1k4qrZNB1Mz2?=
 =?us-ascii?Q?kuqmYAyqbw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8381d4bd-4e4b-4e7a-dbdc-08da213e80ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:22:36.2488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GktaFGgGGENtFi7SkGbIJNO2WFbR1VKGaiqwn1422Tyq4lLANl6JbqoiJI3idJZ17ufb5IxrYQ/SFdQvSQg17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2857
X-Proofpoint-ORIG-GUID: L92afs33CCEvUXDtHwxOnx65_ITv67TP
X-Proofpoint-GUID: L92afs33CCEvUXDtHwxOnx65_ITv67TP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 mlxlogscore=471 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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

This series is to add copy-beyond-the-frame detection for hardened usercopy
for arm64 by adding more arguments to callbacks of stackstrace and by the way
more potential checks in the future can be done. This is done by:

- Change stacktrace callback prototype to pass more information which currently
  includes pc, current stack's fp and previous frame's fp, so copying beyond the
  frame can be detected.
- Add arch_within_stack_frames for arm64 based on existing x86 algorithm, but
  via stacktrace.
- Make other arch_stack_walk callbacks use the new prototype.
- Tune lkdtm usercopy stack frame case. Currently the way to generate bad frame
  use depends on stack layout of the architecture and compiler. It happens to
  work with x86 but does not work for arm64 and it ruins the stack in
  USERCOPY_STACK_FRAME_FROM and thus causes the call chain to return to NULL
  address.

He Zhe (8):
  stacktrace: Change callback prototype to pass more information
  arm64: stacktrace: Add arch_within_stack_frames
  arm64: stacktrace: Make callbacks use new prototype with frame info
  powerpc: stacktrace: Make callbacks use new prototype with frame info
  riscv: stacktrace: Make callbacks use new prototype with frame info
  s390: stacktrace: Make callbacks use new prototype with frame info
  x86: stacktrace: Make callbacks use new prototype with frame info
  lkdtm: usercopy: Make USERCOPY_STACK_FRAME_x able to work for all
    archs

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/thread_info.h | 12 +++++
 arch/arm64/kernel/perf_callchain.c   |  4 +-
 arch/arm64/kernel/process.c          |  6 +--
 arch/arm64/kernel/return_address.c   |  4 +-
 arch/arm64/kernel/stacktrace.c       | 76 ++++++++++++++++++++++++++--
 arch/arm64/kernel/time.c             |  6 +--
 arch/powerpc/kernel/stacktrace.c     | 18 ++++---
 arch/riscv/include/asm/stacktrace.h  |  2 +-
 arch/riscv/kernel/perf_callchain.c   |  4 +-
 arch/riscv/kernel/stacktrace.c       | 22 ++++----
 arch/s390/kernel/stacktrace.c        | 14 ++---
 arch/x86/kernel/stacktrace.c         | 28 ++++++----
 drivers/misc/lkdtm/usercopy.c        | 24 +--------
 include/linux/stacktrace.h           |  9 +++-
 kernel/stacktrace.c                  | 10 ++--
 16 files changed, 161 insertions(+), 79 deletions(-)

-- 
2.25.1

