Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1399E72D023
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:06:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=YRSjnglt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pCoYy2g5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2kx6tsqz3bYg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=YRSjnglt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pCoYy2g5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0db3pzRz30KG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:31:46 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNkYF000455;
	Mon, 12 Jun 2023 17:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=WzIr+AO0MEEFI4UGecvm0eXCPJzw526+O5WN+swaedY=;
 b=YRSjngltwaqHocy1oK/3hUNCi6orUqeJ5kDDBa02M7MoMxfs+QkJTgqUIcsG179nmiZR
 SlAF85+YjlawmDH79w7RXR38yqerGR61S9EZIH42E0mQJ8N6PJXrBUiHpJZpqjA2PhAZ
 0RqKRjYfza0U8OVSenB5PsmB5ckYW0urfVmJdSjbqG8ci60gZsPJKP5kCufGrOZCFh0Y
 1hk7kZZ5tswgCfWaWl5zYi2EYyIdLd3Ys8aH4F9FWNRc9TXhsRJYXpxKsPmPILdD1jmX
 d9I7uuEAOgbNULK4Gt93EUfKrTCOF7ddAGdIw5W9VAs9jGR9WLIZ46jZT1Kwo5IVkelq 8g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4gstue6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGJxdm016254;
	Mon, 12 Jun 2023 17:28:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y8j-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PunNrTtsQui2Z9mzM/pSBD+kO8D3nBhUO2mFMYhIYQAYcVXtFS4J8MfxbAAjYGaEFDxx01aPzGLOcROCrnIVqbIRRABRUJy+pmcsA1r531PMddRrsWRrpZHMvlG0L7lsdYtqrpzlxCUeK6VrWuAAXG48GCgLURdY8/Cx2M/NEe+OgB5UvhinabLlVvVlb0axLYKtvw/YTVCtIWb2jYsNhzjQZytTkJcuZdbutZxKHaWCPnxJw9aA6rrbWGKsMFcfvC0CtWtayGuqadIwr02xgCvGxfPAFy8yQ8DGlyKqGY9+zPmDjenZMKgwbWCLcPhpoaqglQduq0X9+lZUnJRFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzIr+AO0MEEFI4UGecvm0eXCPJzw526+O5WN+swaedY=;
 b=MbPNBvpVKhqiesUFOwF6DFpAEr/rCb9Z7sxiZyFAB3y5zEO7EH6H8/fXR9mLpgtPmtRD/9SBQeaf/h2appb8WKtpckOUQM0kbHUMMKCJSpTF6TjTSoaqOZi2CLB6BWP9jayxKfXAfxWpf7RgQ2B/yrNJ8QIKP3+eCIUOzAHo5wDPhMukpAgsVdbgkeQk8ntf4qx/JW6qNxb1bC8i3Ug3WSR3HI+5C6sVJsLp7VNXGeZou9mat7C2D1p6/42XoCnf9OLYwrzPkgnqVm2XVQ8Frr5kDbT9j/Dz4yOfjD7+K0Jf7kWkWnIKvrtaTjxeAhLcXsAurjxJ9eQn8KqftOOj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzIr+AO0MEEFI4UGecvm0eXCPJzw526+O5WN+swaedY=;
 b=pCoYy2g5B5ZtIzfJDNtbeewWnHox65mrA9CJ0hRZR+V8f9mD9r6d9kjjlE/WmS/sJWpZyzP35okOBIbvw025Lgjx8qCNuOEjyde77RlPQzid2E+a++1U5AtdOplKBH5LoR0+d0ycd+Hopg+aQz06lbOCPUxR3BmtTBo1MHwIexU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:28:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:34 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 07/21] m68k/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:59 -0400
Message-Id: <20230612172805.681179-8-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 490e2584-dd6c-4dfb-e774-08db6b6a72b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CldfznozbSTjtr5JAHDnVbknUGtO6JdAqtERKKYao9uNZRTQOu8E7K74eTGlwxofEUryNkvm9MBSQHK2xEi1oIlYYtVGxBPmbbVL6OZhJqpf/aFNe3MSgWXMtTw9OOC4RjAvqDoAyCWWSvwZYFli9fGGDNkQElr36oww7jI7yuX+6EHJ092iVshC8vh95h19m7VPzxva2+Wo+ga4U8SrKLtrnLgspHziB4OTTYmT4/OqwLRVavUL9bKQr+FxrIrF9TLi1WeCYupfbZUQ00LWcemOFLj7NZPAV2RtipoC1LVSCvzZaa6E8dlhwSTbPDC2Uh3rNDEdft5xl7Q23+mfoSjpCpHhCBssvZhRjmCRI0ENKsKyfl43Qsi2xV4+ciC5e41qkewYIARSRiA1gsfv5WfQmIJdmEPkloRTixAZp5R7VY9g/FH2uNIdchIssnSmymgWvgyHS5cG1tgatoqiW4Zc/o9aYWbrVIzH+X0y0focNOns9tj34ZGc5E2YfixpcryWOt5wgA/tTa2DqHLKB99YSOzua9dZumuQqbvaM+iKyKWTt3rxYVJo2QFmNf1UEeoZaj+y0Z/q1UfzjbEGep+ANq2cEp9Vf+rE9ZgzgSo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(316002)(41300700001)(2616005)(83380400001)(86362001)(186003)(6512007)(6506007)(1076003)(7366002)(7406005)(7416002)(26005)(2906002)(107886003)(921005)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ipRpKlbkOvWd+zHzFpjydXIxyqYwBlGjeUN4x7KxVfbEPv9xY84hUJujTp8k?=
 =?us-ascii?Q?Skk2j+AUtkI0Ya7Ly0cKXq1G9WvgTGRUBnTfEZhbEjew1fvqWZ20wDTeL/cf?=
 =?us-ascii?Q?EtPCKg89jp3lN+EzMyJy+RkU3w8rbCgIPO+132EsjFhKRUd1unEEkbhWtGed?=
 =?us-ascii?Q?b/mzH3sxWG2Si1uxQmUroM66fTO5JKPyQ0Kf4uOOji6AwgM0PB4JKAndvXuk?=
 =?us-ascii?Q?rKvzWydtdkeE11uN2gPGqdvwill/IUd6ncpjO9Hl612bAPDAR5z/isrICxxK?=
 =?us-ascii?Q?G+yhIL0TIe4PurNZVBGP9ImWQzk5phC4OGQ31umZZAEjephiL47y7Iehe5OY?=
 =?us-ascii?Q?vwzcnrInAUzuE/m4/TDWtG6yCiLOHFHVXKROyu/lPjuS9E2ph2fgIrAbc0dF?=
 =?us-ascii?Q?R+EMiW0eAlwOFnq4gP2NeTxsqy/Lgh5ilY6QzwMyhcZ1S7H8gZzd445IP1jF?=
 =?us-ascii?Q?rIKMdH4Jc9hXxrG/Mu8ilhQffU01KRs6AlYSZBA0F7FyYpMrDDoWrL2ByHME?=
 =?us-ascii?Q?azGpFxSn0u1KAxu06KitjwtigDN8IBMyTvvctlmGIS57HwfivcfbFo4MGjUW?=
 =?us-ascii?Q?J5v8fGJB4ZMkHbsFF3pdtfd5aMN1vHP8ZK4eA8ozoWEqmJkQYieoETtP2nCK?=
 =?us-ascii?Q?tr4SgqW2EO8g7JrjS4JERHVELihwHR1B8SkVIskVLx64doqlrHzB4GXT36ks?=
 =?us-ascii?Q?Mfh/XQx4DLiZr/Ji7dHWPZPJqqB6LnTzMOuFL6DGrqai0BMcJ7eUzadfTW1n?=
 =?us-ascii?Q?1XOiryWivwsqkL9XMtLPpxvLDUnjNj0th0gzO0z+BXKV9YISJ4cn+HRFM2sB?=
 =?us-ascii?Q?Jd1G9zva/4Ke3KM7I9YQTkNmzzOfJUFKO4eQnUFxxjtefUYjRM0GOQuxDYMx?=
 =?us-ascii?Q?NttefSHxq+FONLa5TG+cFlFSw3fs6oOQtCMNs48Rs2bNjLOfxe5iKtrVafcW?=
 =?us-ascii?Q?pznKm2tM+QkL+DUVJ30fjqrn9r6s8uK1KTGaAgskwPaaB+bzszdeJoMEhnqA?=
 =?us-ascii?Q?PlxEqfFjGdHDJNdyxDzpHo2c+hSu4ND5f/zpTFXqusJmzGvXEl5qqHjxeshY?=
 =?us-ascii?Q?ET0rilUe5dDdgnGBElRsIUIpoD5kbl7+OOov99b3zIPWo5VQA2GO+DGZ4JCo?=
 =?us-ascii?Q?2LEZTC7Yf0JT6rcDQkg3q9gXfKPRMhKzfR/gK0LxzX9ELzW6sx2an1RQOCVG?=
 =?us-ascii?Q?HHmgub1CfWGOldGg7oCNb5f/pCryyfZbYDqr2EmbDEcO2vK1ZYMuiF4oeWWw?=
 =?us-ascii?Q?1gUZbI5Z14gQfiUk41V1SscCX+K5AmP4OxBaH4Gdsnnz43d9AM14XxEspLl9?=
 =?us-ascii?Q?CQaIcZPjZmU7FsvqdL4tBgJz90vWLNQ3H0KrG32jgbVvIhcIyX89JjNF6Bfb?=
 =?us-ascii?Q?LtaTDiuJTgAeCDseJavwfB4LYCKA7hIjrmHhaRsbO2tMPynEkyR3VR+dbg1Z?=
 =?us-ascii?Q?XbHahsDJ/gRq2LSeFubddHvr6t1zlPsDSGv20B2GeWHYQIOZmXEsBQx7IYJn?=
 =?us-ascii?Q?y4be+qUZ2KG/Gm1IzB0QV+TKHahZO52LjbvrqdsMJmQw0MU9H9CBqS64FetM?=
 =?us-ascii?Q?XT8KqQzBybKP8iBsVYX5IzontpkNclKXAALAXqB5Hoknzb0Pq54S3kq4/ED/?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?ohj7vfuKTJgeUTARpGEn/GoBYfwhPZpI1S9y45dxpmymqTnmYRoRrrv99YA3?=
 =?us-ascii?Q?eDhefRxzt60WiGGLoXgWdmhGM2J98PFdYeWpcaHJ9S/CHzFSRKBMVY326Hcn?=
 =?us-ascii?Q?P2aCyBgp9Ql+RU5g1VMJJAKr9a5oWKCaqrsRC2B5qGIre6ACB3ykcCTCfiDZ?=
 =?us-ascii?Q?HY2aIH23bq9p1JQhSXLCTcS/sTvXdRysqX3ViEw5IYoNoJ4OnI7MCsn6EE51?=
 =?us-ascii?Q?GGoQG+8L6E3YuIQHgZ0vaDICg1lU0cswPe5XLHDnLYxSr2jWDjbw3FL39569?=
 =?us-ascii?Q?4X3v8LHnHwzpsML+RQjWQ73j8OW8XdG69BxYS1MSXMNxwe5cHT/MeWsbuA50?=
 =?us-ascii?Q?7xWb6iyY6WAqeQ0ZUof95KIfm+Ra0QlSb/il3+I45cMNjHRsu+cFHAkuiIXU?=
 =?us-ascii?Q?A4CE8t2ADkLDXpvspnERvh/o1s8MGZpAcn1XD6WskeqwbUx2wRlKsIFyX1QG?=
 =?us-ascii?Q?PCjkZIubdQqlmSSIzXF0lc3QQSPsnOPLF3aKR13UflFaQWAMqZKrgof/pyHl?=
 =?us-ascii?Q?UXI8QXu/kTVFtSKhrFXqWk970uGTGZ12lFFogM5QmdrWtkPgMw1PMtMTPv0A?=
 =?us-ascii?Q?yVewEUetllLVnnHftSqcX0QZxzrsLL3vAq1enQcHM4eKJmHkeY2k3tFvoGcS?=
 =?us-ascii?Q?+eVkG/CSnQktR0g4miC/EsmL26pi9DY8hkw53p7Qex0kwloD887zOZFJboqF?=
 =?us-ascii?Q?0sIb4EtuRX+vTXywLWmChSkmK2wDb/JXK1kxnjd7KySUDbEOlY8BVUnJ5a3Q?=
 =?us-ascii?Q?n7jxeep42KEAjLB3jJQixOtowzNtPfqB8hyg6fmKfFwW0LGWV/R7uPrr6Ee8?=
 =?us-ascii?Q?zhXHQe0NVdvcH6cXkYeScLXJvvhGxaWOvM/RN/UumCbaBqhW4htbIBlhfQ38?=
 =?us-ascii?Q?cGXM4KaltpLlnnj28SPaYCPNKlUF6IOOoaouHwJ/IRwjE93VCz1qXGlblM4Y?=
 =?us-ascii?Q?g4QrLp0taAoxlLsVIM2Mp3Yjg1f4iYEHI2sWVCi/XibjLmCnuiXdJy1XfIC9?=
 =?us-ascii?Q?rI/YnQIc9EKXZpl4Ftt51E0m8RL0Hy3I9GZ6MD/OyzHYCcwnVEtitvu2eWe2?=
 =?us-ascii?Q?tG+vXOU3u0FNZimV4KKUmqSoTEeDowV3SZ89h/UfIXlNQ6hsvXKIL+wQd1tk?=
 =?us-ascii?Q?j9BIvcDP0l6/FPt1C5imY4H0bhxrNrHBoIfDihkMLzJMGxxw8ITGBMSkojiO?=
 =?us-ascii?Q?OqDgOvSQ9Fp+TyK02cKBL+pQPUnH5fC1xaQkDhLVN2KZlNTPinjCxR3qYb8h?=
 =?us-ascii?Q?z762a5nko0pASH7g5P9DyDJb3BSPK6xn3YWod6aaGEeZqH1QyK7XgRDoRDfn?=
 =?us-ascii?Q?lITIwno19B5/c2hkJ9C6X5uQzL6Z5Kv7Bz4O2zRAAq1eIDzwjX+FV1nACWVE?=
 =?us-ascii?Q?QAbiURlsjjpebVeLs4zNnw0zXd2DQHox8z2YbiVEOpPDNKDNuVjbU/mXCyhL?=
 =?us-ascii?Q?r8fIwaV2NenD1ecNe60xFss39IMFcK59ocYB0lD9rWkfNSsMnmFAh/VKQ4Gn?=
 =?us-ascii?Q?gS7qq9FvHZlH7hZtqh8G6hBQFGdW/BD3/dRR0ZVbfUk6hmFAxdXThpIgH+yo?=
 =?us-ascii?Q?cpY7pSN/mU0seDKP2CN8Pc5uMdvk6xPliz0LAJShHdjPPrPaQPpCNa/M9JaL?=
 =?us-ascii?Q?jBDahHFMtq9/nxer8Zmt84R1UHRuq8RFyujuXB6c6/XVYg1WKRkckbR4CE90?=
 =?us-ascii?Q?LgnMnM6KP0Uwqj6GNStMaBAgzuK10irJ/L4sm6kTzsTbbWrHy9jGGd/BSTbY?=
 =?us-ascii?Q?nR9zq2D1JHUpdQeixITbSxgZVQDASaC83lcl2zUMqvnl3qHKV9ugwkMvP/WP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	PwVz2t2Axc6XfisBSpIkT2t3h/zNxLS9dzuELM6iXgRDibrvBc/3Qn8HWUlCKBJsnZELmoA2K1kxr22RjTcMPIQI7hu2YZN+ydPwIfSwrjZhEPWwXJBl/lLLVmN0DsMjRGEVx75z9Q34f/sKBEDn56dbb5xm22XYSOTfOMvJ9qwiTaJ5Plvn4/jtImaQAirkT7qNBJHnVoeNIwhBHXoBDdHiM2b8pHlXmT0k0hwtL689rJ8FAW4YDZS6qYRNbRQKI0FqyXXORmeZGv/+QlK7ZpnZ4ZowSXQ7j1wFXKfr9AuRpmK03xjm7FdKFOW1uSHa2CyWxwpNfvEzKfT06o3iryl/nj+NQRDe/YGc+7UlMNXWiBKUt03ScJcB+vNHiCVMMFwX4w24k8BC6BUcSal5rqTXdi5PprhlXgeV/aFeW0E1TQQfIYc4djdHJY/Tuh5tXel8PwoaJQSn2A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490e2584-dd6c-4dfb-e774-08db6b6a72b2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:33.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drhbAvj9FFLj8x39dJVBKiq01ZiLpe9WUer9U5mGP7dHFd3zFAzxmuL8RMiF8CltLFMWMhVtQLx6SeSkOjMESVJ32rHie0o1k2Z40i5EL7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-GUID: jRQxv27x0hfN3yLd0XsG7WdbbJTiUjhh
X-Proofpoint-ORIG-GUID: jRQxv27x0hfN3yLd0XsG7WdbbJTiUjhh
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/m68k/Kconfig | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 40198a1ebe27..ec71199e75b4 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -88,23 +88,8 @@ config MMU_SUN3
 	bool
 	depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
 
-config KEXEC
-	bool "kexec system call"
-	depends on M68KCLASSIC && MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
+config ARCH_HAS_KEXEC
+	def_bool M68KCLASSIC && MMU
 
 config BOOTINFO_PROC
 	bool "Export bootinfo in procfs"
-- 
2.31.1

