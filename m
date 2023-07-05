Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05817490D2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:09:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=0WOFAvdR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HLO1w41e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDNh4ppcz3c8Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=0WOFAvdR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HLO1w41e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zV26QJz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:54 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDk41027824;
	Wed, 5 Jul 2023 14:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=EEsMn/OLS5R4o9RijfnPxOP5gXUAhLJTmbMdN3T72C4=;
 b=0WOFAvdR1EG13TKH5sj88dGdknA2FAhWIOcmQt+EmZkqgdXHwagsgjADJ5u+qZm/FVXe
 WhnwCvKmjRuwm1Kl6fJP77tfnaUcLik2x7XRk5W8KwzxzNSd5XdtZ5pKLiAqmKpjQiTy
 VMzCSmy4xFJQsaU3hsMfYeg1ShexuezkZMZEhEhB1Jg8MsMWMyX2cffFlF19+yCHI9jB
 FsuWQ/OSqikte7lkF0o72WX4QHsitsdm5bj03HTmblXycUI+RPyt5f6QOV5vCW5D4lww
 6FHiJz3kd8EtY2AzxgqkYO/9KXiVgFxnwQZhh06NLARqLYZRP3b1TitNE2eFt/OzvOC+ ew== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjbrtehsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:38 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsG9033370;
	Wed, 5 Jul 2023 14:20:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5wker-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipJMGsDMyYstTktEniOvLDW/kmpG1Zscj//a5i+LRTEXZhF3h4HyE0LHZgPilhfRpIeUqEsqaayElEiD9cL/BpS+tvfoQBk8DtGHB9K4i2lGg9v28Llkm1LIdSQL7BbzmoR95VK9zZd9bTpyN05Qrqbcu3FmmlKLx+P0/5mM+cuy1Ak3eoI+UUkQGkiUIojbM7vKVeqfW0SauWtGQP2wuvyaO+j8k5pLRP3bmlFE+dMvXj0b966N7KBwxJG/bJkPqjb8PRxk/LD0e51dbVHVP8sqhLpCtA66GST6hWC3h7tpyRzm/MHYMGaBaijjFk1caMNio/I5VVHLbL8fuyupKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEsMn/OLS5R4o9RijfnPxOP5gXUAhLJTmbMdN3T72C4=;
 b=f+gQNrDWcz7opzGjfTweEQsfe7buSqL19l6hwQYz7k6gQ/yeQBwAg/L6aYcjok/haOneN1KQQldZFosBEBRHeiPrpUWuvSiMz4T4D8t4L+1CRyXXROqrKSMtXHqFZ8pCiYSDvoQSY0zyDdd6wM+HdWIACmpFouhvkhbojuc/MAvTW4xTdB+mfzaB81eRvMnFAw1VoxxRknJYz1diMYPnR4FrTm13QrPdnthVKQJhvil+GicA66MfwHH1LJL1cIH5q5miMunINNQ49jcUqEhharfk71FNbtwcQrYvUL2XIv+cK5mzctY+Hvv0ZstYrZZM7PFUuMMmA7YR8PuvmK7pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEsMn/OLS5R4o9RijfnPxOP5gXUAhLJTmbMdN3T72C4=;
 b=HLO1w41ean6SoS/x1PodU5M/D/WYxSSsLqNz9SUjBQ55iwo6dT9+FmwGyE4NUbQUrsl0nhmVt3Y9uwgC6lyN8jfa3AybR1s8sTCgzM1DNewBH3CMP0AATPO0KOLp/WQvxmqfFeIcRnG/pV+rkkU2Adhryp+DGFJ9pRk129ZluBs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:30 +0000
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
Subject: [PATCH v4 05/13] arm64/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:56 -0400
Message-Id: <20230705142004.3605799-6-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: c1474983-3770-446b-5e81-08db7d62fcc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PBXvHXCfVtQu23pwDImCnOLnjXHnRuSFi19DFL/Mo+YuAOLG5X/t+0IDww6nCFwvfj+YaChRyjRlMcxwyGPYyO0VeoHG13HpQWob3v8ztkC3r8l2+u5LJpn8lhkIKPrLlZHO5MNbD3ErLHKUpwR/rwTs9/xhwab520uRy2+67bQQz4hmn7jXIC+wsYb+UCh8TWg7ZFwpSeVxxkCbl3XwLFUqpYHrUXb25/lELhWeJfGLtEksulOR8xRuURixXz82hbC8R/xpy/vB8PjNKJ5PeBQOj7bR2rZJueYGkZRmlOfr3zru6WSRzb1PMHrdhVFONwsOwf5/WgMFeIkiqQfv2sbZKGxiFipTlEo1Y0yT9vltKkA6deUbfBjS1XrEx4gytTAoWBVp46kfaA42RTp02+FWMFeKHf/Fz5MPATv4BvBEWbMZb6tdtFKLDuWGh6ooFyEBbg/LXJvvuw0tvGmmaSbJ4gO59efKqEq1FbW/+vhH9u1eWXE8nRDzOT2fzl66BVSG4KgjE+d46FAgSTl0i5AhrnZOkWpn5ByEnW952bOBiMzdXNdHdWvApNtONrkzcJRZsSdwRfmiq4WGbAsPzXcFhAXxw9LH/MqfXChkp/M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?NvcNRGhi12yKua4MSTq/3UlRhjpkq02btvXonY39LREbjK6hN7DSNciVpdrn?=
 =?us-ascii?Q?7dyItFmFfMdu/qbIotEAgJe8ROykV3tfNIHmDz0wMEqR2WLEJAhBQg4HrqEc?=
 =?us-ascii?Q?la5AuE+rAWda17XBJdXp0EhM897gJzMiiJfJ81V/cTcu/mHOEUS+7UqVFNP2?=
 =?us-ascii?Q?qUGM9V0c5e5LvP278QbnJYtpAw/R3tDYoKNoYfsJFOVE24mQTAMQJUeMAB+N?=
 =?us-ascii?Q?JMoMN16iErNtTjsrfPeIQWVlswBf8jvdK/pP/Oga73lLcs1PO3n2XNgusN4q?=
 =?us-ascii?Q?3sAYXKJEzW926grPniusppjoM/1LJuRuNyNhmZu/MeQxlcByfItFMdrZ6z+M?=
 =?us-ascii?Q?EFXj88eCuBWpYzJUUUIO445LRaYTrfVf2j324vsdrU0ZTjbY8nQnTIlv7x7J?=
 =?us-ascii?Q?FodvvTYf+dGZry3KY9VS12vvmLtwVcno5ndxbDGbozSuq+v+Sy3suNV91OWR?=
 =?us-ascii?Q?H5RJfJ92GyYt7JA7VTz0d9bGOw79VN28Im5UzOvDEKg4qGvTVyORk6TtFk6O?=
 =?us-ascii?Q?gwTIFaythEprMKgdT7ciQIv8DBKCXXsmZIF6qczKC7e9HZyNpHsBoKQVqLx2?=
 =?us-ascii?Q?h9n+8DGpkFbn/YFnVFd7w37NqK4Wh4TFqaD/vDoDxEeW3Kh8wrMXGTq3Hu3w?=
 =?us-ascii?Q?ReGskOWPdwSpD1pG+MrT3FfH5jeXonrx6HmVoHPV4L0AK21rXUTUDA7tou3s?=
 =?us-ascii?Q?5OCgdcOlO3+bq8m/646rV+OgDbzFIvR65tHnYVqsI4GtoK3Vxr1gkVUXeokR?=
 =?us-ascii?Q?lLMzM5fTJBlNvp7RVJX1LvomvoJSgpz8pAUtUeawGedXthn5t9Q7akfgIIHv?=
 =?us-ascii?Q?zoyB8ut9tWLlGJM41Cu0n7T4c0CLcLoRSTLf90IGEt9Z0EYFHIt+6EQ5bYyy?=
 =?us-ascii?Q?nWaZxQcMCyKWnZEUno+yz3x78N8j7upuwiIjhIKBgOrwmwTmjWFdypW+hZRa?=
 =?us-ascii?Q?kj3ascmQzMn9NWovwH7tlCgZQJ6j3SiHMBvQSy3gSWRKd59sZ8wLRjqpa/eW?=
 =?us-ascii?Q?HpiTjRadVnfcZG0eufRq1v4ykQkSTCaEphEYQfkuAM6zsmhqHLpBTMAhNhmp?=
 =?us-ascii?Q?pZFByxbxYEpFS5zZbjmtN3ilngAc89enUadncijgPxaQcvJBY1Hsih3CD71A?=
 =?us-ascii?Q?fzFgRg3RzENKKBnZFdAzrm5IxJAqFblLC+2x25SBN7Ddiw3NnLxZzKcQHSO6?=
 =?us-ascii?Q?Sv7Xwz7SPyKU7CJuDZTnEYQK+jT6JXwHBPbPoINbThH3dEdwxsU+FlkDrZrO?=
 =?us-ascii?Q?0A9Xxky/j/sDUn5x9VUu0hyFz9byGHNZwaK8YAMnvH1uAtfbB94EQdcIFMYa?=
 =?us-ascii?Q?22HNroKXxhdawZt49jsWyL0EY5gE7wgQ1HWIe7kG6idqN41ypLVFSxTiy9/h?=
 =?us-ascii?Q?Km3UFA0ssRbPosdtxa2oHf4VB6bJC+525aiUomHQhL1rBxBQd4OLhky9zqDb?=
 =?us-ascii?Q?1zKv8a/3qfqTxUf2UdO0S5LOE5gDx3i8jIU8nFa2DIGAPVEyStVKqe/MKaf2?=
 =?us-ascii?Q?+f5HTThKb6Acfm8y9vBKJoaJALnzGy1Xh6cSSZ/cQoU2g9tORGTemCwNauKD?=
 =?us-ascii?Q?bJG8W1mRWpJfVo9rxBjrovAOL/mPhL5hiDt0rM8eiM6TvJ2lJAXrn2RejOG1?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?fBIO2YbWZH7dB25PD7+ppr/vtvBPsHiFnzvMUSpRbB+Wclc/Lldz0lIC9U4O?=
 =?us-ascii?Q?0Y1mybDP6KIbIbyS3U7yGV/UhCr5r97qUM8+9V+D51W74abBZ9ms9RoY8VCJ?=
 =?us-ascii?Q?lCXYJSftjeplG/4YuHJLl/5tY6bY4fIt3D9YOvLqYpEC4yBjaA8uQDdFCrmh?=
 =?us-ascii?Q?LcnakoIeU5Oim6lIFE8vgahORAJrpAoa+D+ZPT9wRENgGvcDUVgmrxLGFETV?=
 =?us-ascii?Q?jLZDPEZ46WRNcWLG8esoGkyzQmdu3rRzjB/jR//to+EfkF+G9Dnui74SjgEx?=
 =?us-ascii?Q?vBbGsVyQssJqh6QAC5MzV846npNG4pXy6Ofcml1p8x9krQY5V53byCVbIIwt?=
 =?us-ascii?Q?ciuk2ACVe92GI2Bu26AF4vGP3zySlIzSrh7HB8Y47Nr6Y8gZzp4le3WlSxOc?=
 =?us-ascii?Q?jPRQ1u5LuIK7Uhyv65M+6cunk3wnc/FzyAYhsiXXkTnMkAlNzsOUE2+rskBy?=
 =?us-ascii?Q?uQh+MFx0niE4JaFi1snyg6PktBcB0h/Joi7ai8BfL1Uk2dQWBROIEHdjPz2v?=
 =?us-ascii?Q?BmyRbDmkBsHCDVTfOvDOdsR7FzjD3XcYWYqSd/jLvPGcdeBCe22Fm9ZlqH8G?=
 =?us-ascii?Q?NxM2IH46GIHM5Jq2cEiPmKCPbbGCZOLJHBU33uNceLPh1AgP9+M9emXO7m36?=
 =?us-ascii?Q?hrp5XsfPI+DrpXM60tefFoKnGL6KJEQQMtmjOSUhypSKnLJz0mBJVrdEIsn4?=
 =?us-ascii?Q?GCEZ9bJAIxddyib3wzFqfKyoN7Ctl61pYU5G9XRAkEFMszy1z0PC9S8zscx9?=
 =?us-ascii?Q?I/CgFmEg1BQy0MkEorhub1z91tiHD7hShknDDir5goNGEhYBS4v6KghukiPL?=
 =?us-ascii?Q?eRubJSm7yfQyox1fdgsF2bTBHTTsjGCq7if+pYPhONhsqr7Aqg1Y0kvNdb6U?=
 =?us-ascii?Q?AMb0dK3E4JT4heaKNjN/46Eqgf9tr7XATwL752GGV7DKvMi7EFChJkDTB7gW?=
 =?us-ascii?Q?DJr908z9bXGli891heAnOgQux7BIDejViEaQlF5qzluID/ozjVV8Mzg3y6om?=
 =?us-ascii?Q?XQdqj7nqkwr61g0sGlXD6sy3QEXDoeBYojnTHrd6uvP0qrvMEvEcIbULW8o+?=
 =?us-ascii?Q?D0dfZMYGh6dVyHSv8yQjnw6sV9Vfp31tS9FjDT5IK0yXVg7AEWXY42FkcILz?=
 =?us-ascii?Q?/dYBOEdG/xHS4M6QUf/c8cUpllefo8ri5VOZlu4q6oXj6dOOjdEpXIplNCuK?=
 =?us-ascii?Q?UJc0qvWYE3XASq4uJsmyjHvCvtJxgWdwR4xyEdF8uU2tMN1xlqzkEezaqaoq?=
 =?us-ascii?Q?e3N/U6XRHvrvcpIkrRCy8aN/zWRcFbXmC5vKWL735g4y9C/EvW4g0kIQslh1?=
 =?us-ascii?Q?8pPisXtbkDWHWQUGd6KgKNPvqD6DciqohbRnfZ21dX0DCTZp4yJGBbBW9N5U?=
 =?us-ascii?Q?IwuvEj0QFO4TKsaWLLhLc+voD4GU1Dgc/D2rcK3Xrd1lZpQq9byCx6DiPwbv?=
 =?us-ascii?Q?RNUsE9mbNspfKqfh5xbJlUzSRN2W6Neo9n+C00yDVtp9HQ679n5lBeHUsC6v?=
 =?us-ascii?Q?YnE0zx2gAd/KDI403/ZBgUd0nMZRJdc1DLH5eIgkWRDQtOFC+ztk7djHz7nS?=
 =?us-ascii?Q?DQZUEVJpTLP732QccBr9U9JhSW+WcJfwJ56owcMA1Vw8SMHyjEMnIohvxBhT?=
 =?us-ascii?Q?ZMkBS1rTlIO0++OvB5kvTHzsRItjSn5ZcuP5EmN1jYtFUOPpG7uYlJ7bT9oy?=
 =?us-ascii?Q?d3Ovzq9BNWYLupxCu0kH8rkY7b2jNpuTdMK+nK1/j4Sl1s0KG+5LL10+FUBv?=
 =?us-ascii?Q?gawmQ0ZIBQOTx/hIDcuB74264H006AwjpBJB0VJ0n927f0PmfE/x9RgmF3TW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	wcaezO/0oW4mQNIacnKi8aZ5bF6K+WrqP6eeXlWZBjcDyBhPlDq+ewXHQxBuFbyO0QSESl9i4y9JngQJaYl0oT5icXwiCfDLhI7LwZ9xdmcY27LVD3xBO32nFP147esX5/yGamXkJ0I66vBSjhDxZM2N6sn6wQZrVZKcVbEGQgtzS/mbozJjC4JLaBkseuVop1AL5+rG+0e/qI4JxHMyiWYoFK79CaZW/YfiyC1VoK+oCvuk0HBcHbbRfyV/fgjyxSpk7WSLTLglcB37/FCq6FMJ/94qySbtbLePfgwsdWpkYQhHcdOgt41R0vHDnhVSpIlCn8i7/n5+/I8f3oYpCii3tuVSNvfdVjF7fPjwDU6rdfBnoC5hEVNF3GbSKgRGpYDOs8tJ/M8reWzOYrRlI6QlYGpdDDQ6212NW8GlyuGetwGDGqzsDISamQ5Yxga6udXtEwc6qEO+Cw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1474983-3770-446b-5e81-08db7d62fcc0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:30.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7h1mXCHiAUdEr+t7Plz04gmLTqZMc2X66y66EFnw/OsKZMnQm9GbsiP/BrLdqRq1un3fB2irT8bIwmUYV4n56w5Tf9doNhMSZ+DLRf/21E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-GUID: bjp0Xn0-Hk30xs7HeAiuynybUsVwc1MZ
X-Proofpoint-ORIG-GUID: bjp0Xn0-Hk30xs7HeAiuynybUsVwc1MZ
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
 arch/arm64/Kconfig | 62 +++++++++-------------------------------------
 1 file changed, 12 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7856c3a3e35a..bc6c9ff85a77 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1459,60 +1459,22 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
-config KEXEC
-	depends on PM_SLEEP_SMP
-	select KEXEC_CORE
-	bool "kexec system call"
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE
-	help
-	  Select this option to verify a signature with loaded kernel
-	  image. If configured, any attempt of loading a image without
-	  valid signature will fail.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
+config ARCH_SUPPORTS_KEXEC
+	def_bool PM_SLEEP_SMP
 
-config KEXEC_IMAGE_VERIFY_SIG
-	bool "Enable Image signature verification support"
-	default y
-	depends on KEXEC_SIG
-	depends on EFI && SIGNED_PE_FILE_VERIFICATION
-	help
-	  Enable Image signature verification support.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
 
-comment "Support for PE file signature verification disabled"
-	depends on KEXEC_SIG
-	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select HAVE_IMA_KEXEC if IMA
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
+config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
 
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config TRANS_TABLE
 	def_bool y
-- 
2.31.1

