Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A973601A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Qlq8xrqF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fZSTBfS/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQnL2qKmz3bTV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Qlq8xrqF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fZSTBfS/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCbD5RF8z30Xd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:20 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nI6j004668;
	Mon, 19 Jun 2023 14:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=weTe/zj6qCcqr2n1pZp7KYmVv/5qNJe870g9rhdNFcw=;
 b=Qlq8xrqFQksyHOR5+8eyHXNXmxGhiTIEDAWv4cWtgie7L66X684UEICCBB5FXv7QuCzA
 0+39+kHK1V/K3pQJ/nZnyCNv3FdNZHdkfuq136jvZn5+oNRVjhSSF5DZeaEZTk88XY3O
 xmQqjrRsIpNsOjrSOmj/5r4gI+MbS0xwtQEqdNmqF9CDRtNLOzsg0a1YXiHEUjN/1Yw8
 wjJEB43p7/0vbwZXbOfjeuXk8nwK1lzK0cHnRBcMLHMr570F24C6eavQ+oXvMefWJzvm
 CHQHb3leii0T7ln9KeLCwZwMMuCVrEmWZw0KLObYZSA1o3DeY8q0hydZZsuyTKSYjePN YQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r938djwbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:59 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JEwpwH008306;
	Mon, 19 Jun 2023 14:58:53 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393sphj-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkzxqOPRPEK6hVgDhPgqgZx1dCbrrZ6JKlEzaHotzvZWOI4CyCnZ9KlbJeK9jvuRf+38t8ZsO5JcKoMW6xI7vBsmCA1fo6+OaYYZ8Be2G5Ur580ziqpVBMfkKEAbXJMZZNHh0ToFNkFEA370DTWC+KWvglBCAtM0unh6WqwEE/TwDVg7UInzNGC7atTMgzzfvWDXtLS+ZNnUbTmbSfUmHr2dHgsEYH2Io8S7u0Qubmohc2CjAIFN7NS2OdUaNqjHFYuJLzKXi6WVSydMmnFRUGiW2QDY0Pr7JQtDyGDkEINyQJDs9wKXXRQHVIY1zn+IBJTCJbopMNlbJf4UJVMOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weTe/zj6qCcqr2n1pZp7KYmVv/5qNJe870g9rhdNFcw=;
 b=HbEwdcA0s2l+LR44Ds20aGEp3n1mC9D7LLWbM4LHIRr4zf9ePmN/f41fYabEcU7cnjJDkUJSsuSOR8Q2nwuf7u1sNvtdMKgK3Z/UDxcTGuU3yloOl36+0Oi/uqgatfBuiiNtjv/foj1+ni3uUg2N4GZhcQYGOAZNmjVs3qUdvWjIBfM9GhV5ryRjjDJ1k1MbYHfNQX9M2rF9ydDX2pA6D0H01FMFO1Gv13MqmjWOAlwTGx4uig45VnMd74WVOL0gZFweYuvPnWyoBQD+ekcg7mlflDPLZx25Xz6BXuDyU45n47NdkzAnKz6U5qymCzdxdn+fQV6Eu5shbT/6Pk94ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weTe/zj6qCcqr2n1pZp7KYmVv/5qNJe870g9rhdNFcw=;
 b=fZSTBfS/qM4Tw7w6S1Df55o4/njTO0xDTdwKDDF1KXxWqG9K7p7QbPz1YUIW7WkWwHjyzQtIQd4qc/PM9F/f8N/rdAHUXbTKdBBI3pRkBSqsyYOt7bl2PMEEbj8tDWdujrfAmnkiPMPIDntdnLIVGG4/g07ShC+SEAVGEPFpiMY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:43 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:39 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v2 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:59 -0400
Message-Id: <20230619145801.1064716-12-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e25706-74d2-4a5a-9cd5-08db70d5aa92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	m8PwBJCin9i3Wd73Ze3G94ptWtx+J2GQlDqKjdeL8Du9iajvfP0cOLLJkwbv2qHSYxGCkPUHGpYv88CRRVe3c3lX+uU/Lqm36yHttLjbMeMM5QXIOA6Z78VICY0dMIpGnxznSvF784hd8lW2fX7oj0MjD1zdoEuWEiUEJm/ZCfcOIQCyOsTw+ET4n92nFCkLb7o+yc2Hey+bgbTD0l75pKchhf02Odxt3JVC+3rUiFOQTvg4Zdr3FXB5URySfV4dujvLl1Ne9KqjSre4DH3xexCFv/9Th2jJgl5sJk0XNGkGp2HzlpwpPmjPkZEQlBd2+p6Q6rBOQ9oyfzB9bf9wfS5DLpxsvoQUmr5yRVkY6+mt1libJyuARAiybkZBRAIHdbvTri05ljCun2F5CRcMJ4BPTNXe1+XnrMUzD9RTzjgY0L8jnf45Z/i5SxQ+uvb5vchlBtmwn2SQmWVMCRo80vm4wFbwakcNyNPvvYfu1ZLrnncmMACeTdi3W54LZLlFY8VaZY3Th1Dqj6WWjC6j6WqCBtd/AHFTqXBjuHXtSnIlI6RkAIQPsMCS5E4vR80iK2rsJF/6XhKtQQ+lHLu6sC2bqd1EoB72oPRuWL34nck=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6UCXkk4afD2n+s9evn4T1O6VdZs8k0wNISebcNE6tdXCBLUiB9dkBC09aDan?=
 =?us-ascii?Q?xxQP8t68L89GT3bpOneOjtOXig5d7fQEHq3M2RxSIX35pWQ7HGx9FpNCBpUC?=
 =?us-ascii?Q?B87pmoysMzsMRyNtS94w6B35EaLnP7YJkV0u971RflgyYkEHbaEYZ5LlGyDP?=
 =?us-ascii?Q?IYjnDQWGAf+yOmfoN4xrCcFTrFMSWBznGqFEqYY2OMKZRZ/R0UvjUWtETq4j?=
 =?us-ascii?Q?CUU/oFs2W11/uqMY0Uf9ttqgJ8PMc/733f2oXbzZIT/f9xbugqs46UBD0YZ8?=
 =?us-ascii?Q?chO5u7xRGipa5EmDJM2VzWJG9Jr5QvbodXCXf1hFIY+KFR8duhod4gZg08Kw?=
 =?us-ascii?Q?nLepJKtDfsuPJxA9/lpmWBntmIyOdimYNMqFParmwds1XJoigB2/8mN4wlww?=
 =?us-ascii?Q?bDc8dVWYtrZVL1sY0gcFUfC32aJPL1zEDfuujYtRFNSHUBB0GdwL20wk1eA8?=
 =?us-ascii?Q?vlAoMOg8D4PXvsKa3YKdL8W72GMsJNhQAfE78TscLMRQSJN3G6rBFzMwSmQL?=
 =?us-ascii?Q?ObRcQwVkmEx6eqTke742jmQ2uLN71A6xWBW79JkE7xXcle1n+uGkJFfLabn3?=
 =?us-ascii?Q?/0C3mrD1hNzf9eK4lrLnr5FMIAD6L3Qitf57uACbL3kThLdtJPdgY7168G9t?=
 =?us-ascii?Q?krJKE+hjlH5EjbCUrWF8SSAmpZGknikKKgbJ5DnR0l2ovCCkzrOGs1jt9h7E?=
 =?us-ascii?Q?ZdDir33wso7RHCjoDp59yr9KGZhUFOTQFP23P86kger8z/AFue9kzuKP58XD?=
 =?us-ascii?Q?1O7+uLmjvEsnFDMK2RJlkBIEMfO1GArE4opdIosFrJo2SrswmyAV9Lqly2vG?=
 =?us-ascii?Q?jvzDI/fuTKBnh1G2x2UQJWYfOmLzNXWgPKbmoLTBkhN3/ZPiiZyx3wf3Jjx/?=
 =?us-ascii?Q?rfumzPAf3WR7haCM9lJEvz3NwR0J2YiFMz2w6Q/Qv5qOU+69DlDg8KUOEENw?=
 =?us-ascii?Q?U2rNwiMXOAdldBx6VqdGdULDBTdC5oEBypyfeOLKyfAU6hCNr49yU18xyLqg?=
 =?us-ascii?Q?9LnU/6A/6bEgNHZju9lm+RMY4QGREMSjtF3/JN8NgnyHjcvWbqd9GQtGig+W?=
 =?us-ascii?Q?YYi34j+7p3NEMOqsVybdyeCzw3LecTsHJG/4ylFzi9cxS/7pn5+axpraGX7Q?=
 =?us-ascii?Q?iFqAS+6fBxtAIW7bIB2lWm1zcijDB5BUU5D01LitFWvhkZsEc9CEy+d06MY2?=
 =?us-ascii?Q?IpLtDgq51YzuIXbPAmBp71jLiGT/0P8a6891lZyZ6oM17h9tPIY/GthQHtLh?=
 =?us-ascii?Q?eSI0oqT/MP8uOEhAj3cVHAt7+N+9wKvr+y9U/ekg4mjd30BPTis5B7iODNvW?=
 =?us-ascii?Q?qSixUn9bwW3iVrQ7dySoWZ8D2gGh0pWyLjzgLW4et+yxuy0jODZQUozcNSdQ?=
 =?us-ascii?Q?xdM2YTOdfxNFCOJJzCXyyyC7pulgvPxDU6rnwD43QQTS0PFRZ2SI5BYm2rLS?=
 =?us-ascii?Q?/gs5VkJS4jN5ykyHGnLBZcqDLzXGoSH5RHibZ+3aNMQd9uRsxJ2MoS1+hFzi?=
 =?us-ascii?Q?Rmsjy22lDfZW3k2Ro1wlr2E7mlEyY8P+D2x2Bi1qg4XuVg1GQBjaM8nej2Zr?=
 =?us-ascii?Q?CTqcADfpZK2aFHOSRwDoTJNj7jK3NDYDiqbb/b+fsn0P0tEDyh3pjXuGGEoX?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?ohgwcN6Ey/Pc0mKaf0EukWo1jA8ohW+wa61jKhjYKvAJyDgsRePbeBo93QEb?=
 =?us-ascii?Q?3Seuv1PWN7NLcLGdOQsdn0eAn7MBRzpBcPjQVKNujaL/MKTFr7PUFudR2kua?=
 =?us-ascii?Q?6idRsdx67j2e4UidN2ZcE0J+0Yle7ZECuzlN837WP1nvCfq7jwN1uFBdRvd8?=
 =?us-ascii?Q?ggHV12WkiB0ob/aW3Ap+0UF3qqpqvx4Z6xhljtkyvQDyz1v6y6HOOhPuJXME?=
 =?us-ascii?Q?WuzWbUcB0kKZAU2sW2TBLK/gQVyGUVmzIVJtwClC/V451MGyUkLS3JT1oh7l?=
 =?us-ascii?Q?75AgiN3ycm6/OXzCZPzS/e9/6XAawRIii9lK5+xx7haeJD2lE6XMR2GQNLyk?=
 =?us-ascii?Q?V3kRCux6EDOpT/mvYWF3Dl4Ik3/bNQw/k4MmxPRLiSvW9IUvjP8OiUta8Gl3?=
 =?us-ascii?Q?M/fsInuSVTgFRNQW4t5LxQEyZSX02DvJFajB4AsWIJdiJ5Rhcqyi7FAJTBgq?=
 =?us-ascii?Q?K2qEZTMOSkFIaEzjC8N6HsMmiPPyQzt3k1ep3ZvQOsr40sYsMsEEZh+bcrv7?=
 =?us-ascii?Q?Ns6/8FWZhRm9p/diBbTciRzOcOpJ642n9WBm1Cft2QBhIu+Q+nltdWqwu8UI?=
 =?us-ascii?Q?dn4i67U6TuZ9Eph51agXMiEw6b9ByIvRgLt616Q9ojOYDuvf/4swwB5gycGf?=
 =?us-ascii?Q?wBmiC8CgVGbn9hXul9F96lhe6gzL6LBp/XyKl0N1D4weami0QCCmgTSkSiYS?=
 =?us-ascii?Q?gXIDL5ZviIdTao8dekxVCGJYOFqQgP//jVdH3aLt6q1tIQxVPKeSCGH7KVK3?=
 =?us-ascii?Q?FPAtpa9Ex+JoDScGRT4Yanx3zPnC2LxCebLsi2N0ySVmG/7WaJr4yvUpAlWT?=
 =?us-ascii?Q?z+xOXoZsXSn3aTT4+9pB1jzv4lB7EmwVNM5vneKFVqwhHxt69hYtJ1yVJ5Kw?=
 =?us-ascii?Q?HT8cBj5Sw8Ww+vnI7OlqZrfWrfOx2fwSbtEADP7AOTBFXBHvbS1wchOoEtbK?=
 =?us-ascii?Q?G2JAOV/AkRo2nWHR0heY36yLLLelV3HZ1rB1OyfzPtgZwM0YrX8gzD0bRCnC?=
 =?us-ascii?Q?cRCxNscWi/9nxF2c+6vqaZmL2GplWACmTrhnJ5DQcLIYvbngZDNXt6vKVDHJ?=
 =?us-ascii?Q?VuDkE+pnWz8gj3v0wU34+9AqpYT9g5yFwicbImJDhrB2HFEQRZ3qg5A5rnFz?=
 =?us-ascii?Q?gTYudJNFSi58niEglwUaFXdN4yOV8wOFFpwWTDuLqwbPRBK0wUZyrdia7W0q?=
 =?us-ascii?Q?6FglEi5zJlgnxVQPclpMQyUehO9qI2BqNRHModIfew0yjbVbwUEGP1x4+F6f?=
 =?us-ascii?Q?/dzPom8Nm3SFwNe8nmTxhENtcFeufjBIiWjFOo0/N/Vd4J2OQiTWWgEI7X3i?=
 =?us-ascii?Q?oe6uew4IPspLTF3hCCh7lSCKvw+7Ill6KhIwZcpQwfNHAIbmZ+gSLOLquqGs?=
 =?us-ascii?Q?ybH2QYstyYqOgv18n/iLPvNvXg4oyfRHTub859bu1kc+L9wDW/ytZbrnDiNO?=
 =?us-ascii?Q?G5XiR2rAjvC6Vj/6ZTXzlgUK5li24MWWlGDo3Zm87xz+sAac7z41XGPYgdCF?=
 =?us-ascii?Q?3N7RX4o8Vs6WjC2W1x5qOGT6EzDh8+UnDUjP+IY2nasJWni9mJBjVBKxBToN?=
 =?us-ascii?Q?Z+GGtIoectt22Nl76XoBhteO20gUoNLypQfjco9AMAC6gpG284egH+OI42ii?=
 =?us-ascii?Q?Ie68fUDkwi7e+SgrsRs0+ZogLt26Yr7l1uPxQwc7MjnOWCT4k8W1wQF35NS5?=
 =?us-ascii?Q?BFglnm4RVV3fTQ2VUDK//zsTwGZsG9D4o9r2rZ7YAYsPkzqDSmnKyxmPh5hf?=
 =?us-ascii?Q?Ib/tOs/Moq3tPJ7QDat+uoZI9A6vAFdSnrH4nVgsDRYTI+RWpnWtehhHbag5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	REaYX1OUX847VxuHDMold52nnHFM5Fr+Q6LyDhmxW8dgxETDLliRQ+79GmIR+ro9hv7NF7R7TO9XafjB9ZKpmOAl4JsR7uNjlyhWlwOXV9XmXUdBkOUduglJZjHvbqZDkCsii9NIty5KTDw2897rbfFmaNvnqQT/rgSieHy9w3ykiU8zRQEMigkPhvdFhDbVHXG2sNqZ28StNK67JCMy6pXmKt9HoclhJUyilbmNkNxwkZI4s68D5S4xkHY2I9LO1QAIhSd50t44R6uyFelh7S5BtxK+780WhOOljWK23sT25fRGg68vB2pb8dkI4wPakn59zpaVXuJYBIt7c77Jqn+fCDaqHr7aV+v880xUzxA7O2wom8DCnZloD1i9KGO5sgguXrZZ37UdteBnZ1b6lS1/CfbMBF2tSJbwFDcWVNpeWNw0xH5Ehrvo53nT6RiSlm7hl8s8vMt+mQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e25706-74d2-4a5a-9cd5-08db70d5aa92
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:39.6683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I925z2WbWvbw5A/kh4iFYZeFb/QjfWA+xIgm1QREINeW3xJMSU5Ap6+ec5W6Oenz3X1Ozo/HULDyDroaKbVuyBBTGDz9pG7q69FeuuLb7A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: QwLOIiGxrxUYLOuDNlNS5zDXiS7bMrkZ
X-Proofpoint-ORIG-GUID: QwLOIiGxrxUYLOuDNlNS5zDXiS7bMrkZ
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/riscv/Kconfig | 48 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c..c484abd9bbfd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -585,48 +585,28 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
-config KEXEC
-	bool "Kexec system call"
-	depends on MMU
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	depends on KEXEC
 	select HOTPLUG_CPU if SMP
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel. It is like a reboot
-	  but it is independent of the system firmware. And like a reboot
-	  you can start any kernel with it, not just Linux.
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool 64BIT && MMU && CRYPTO=y && CRYPTO_SHA256=y
 
-config KEXEC_FILE
-	bool "kexec file based systmem call"
-	depends on 64BIT && MMU
-	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_CORE
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
 	select KEXEC_ELF
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-	  If you don't know what to do here, say Y.
+	select HAVE_IMA_KEXEC if IMA
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
-- 
2.31.1

