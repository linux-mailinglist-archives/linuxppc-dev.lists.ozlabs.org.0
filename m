Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F675139F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:35:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=l/jhYUxV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Y6gjg25F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XdH1Gzzz3dJL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:35:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=l/jhYUxV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Y6gjg25F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCt0TGCz3c1Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:41 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiFBO015946;
	Wed, 12 Jul 2023 16:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=l/jhYUxVIAQ7eKpuM0NiehaymhMm5ql/iXHb8uXhS4y4tmNm5OC0vrjYAarZpE9jM04D
 l1NEQA0dMxDWEB+l0OHzSZimoB+lp6cAY10nTHr0Uc3Zo8nCbv8iYPOajLKTDNjcsXZS
 KHF2G7ktaQq9L70dFacb78VMAnRfXJh1msNftYpSxCubnCRLT5UR1opBH0eQw8tJ1EYE
 K8Uyoujbxe3MvGR4sx55e3RopHP1JbHAnA9XLs/qOo27KFNrwsKmiszY0H5QHrXHN7x/
 CORPqaCgGXZy3RiGROz160lfwqJ8JmvfzMN8FhWxuF/+ln5WwZZGgmhI0K/DXd87aLK0 rA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpyud7sxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:26 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEpr6M004237;
	Wed, 12 Jul 2023 16:16:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx8d4kwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJhtR9cpyKJ5W6a2Eh4HeB+g/Aj6zFlVO5tTfTc34hwW8apjEna3qpqGpcgQqnxZ/WQ8HhOkBS5BkOJk/pOQKSlJUcLNxkVOrZLdUxULKhm9gDCHtNfujZUQxH2F3yhJq+7KcLx5S7DSqRn2T/De2UodZwxj3OSBQMOc13pSaQjc9Dia8o5Fhgx/d8IK2h4sWf32pjPUEpYibabFnVTXbOZL3YhRcVRaS89BS4OcxZcUaBFZCUT5rMMMJqJzTnpDEbSXA/62rum8kEdxmN4YYhI5AtibWICBYE1VJLqZijJDYsXUlWsfPmW3gHkNmBQ/H29H4tkoEw/iI1Vd55k4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=A8VrjQvsgOmtt+2vcl8t9O9T0LmdiosXsz84RaOpsRspBFSshi6L9+vvS168KKp7HLVZ0iCqVui9p3s/l+OglaSAolrSRXdVifNgPEvuhz5ERdkm5GtjOLEPTDeW5rGwhBJtlJsWUQw/1pcpYX0ltROyM1KSIeO5JUg4dkj3cIJOCLNabInOe5EdB87zeXUZc/MXAqDp+pOdmOGPVP33Lrz4wPZLbhCkxr219F6LbU27J/zPnJFIGsXHej41MfP304yzFb6jCNb54ms4zpCpUcdNuNmcVlD5iMeC2DWTFymVw9mISxaZjXdDybh13Pte7g9ARN+qtlNBSQjDJR2ndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=Y6gjg25FkooZeIDpRMU6iU8DMTTXXUO8rp95e2I/aalnd7n9x74SSMnwqgUfsoGyDnxCCx36omQ01FZYVVF3+lHQrz3oUoh+TQXVOILjsyt7rTeWHS7oxuOgEL1t4sEX+8hz4V0mKcu614EVUuOJADb7V987q7xLeB5onoHEjPo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:22 +0000
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
Subject: [PATCH v6 10/14] powerpc/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:41 -0400
Message-Id: <20230712161545.87870-11-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::26)
 To CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: a5513c73-6c5c-4cfb-c88b-08db82f35518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MHPEbrO4XPT8/ckWtfnWLRN69XHtCd4IbUr3JqP2a1tUU2PwUUpQhuIAQbjWrKd3k+NxUdaqabk5M0YOZY7g4OBj1bAiB0WqQWwo4CinlDT1i/KjFdMBqlvnew+Oi08Tm3dAwIKsZlNulkU5UzzxSZ4FDQDYMnsAkRDLGt9KHBXwRQe31p6SXuWoZ4StiaU4m/sjro4Bi5tVmKNwpmOaUnq/bvgxbLg+u2IsXu+FjZX2OXUpuwvYGWIhL2u8tdrWj5OFO9pYYosLG+hZ2LBC/n/AiWRlVVs2d46+zygFqoCfwrlciX/X0CjqZn5yvk7T1QdzD517RgWbi28QczO9aJ6hksladfHBOxT5NJYH8ZYQtxHhFhnb7JaPGCzshdp0kPNDbIXpr5/7amlmVGpw8ZqWdm1e2TrJ1p4wJE5O9PSCchXLd4coG0ol3jOf68FNGArorr6iTgQZkKXiD8nuWfcD1WUHxtUtO+D2OJGFwGR0gz7oULVOfL9uKmyopLhQTW2iqkZQMNQT2z6HIHEUEVLP0VVW9ZWdSktIpktrLG/TB+KMXLTVS8eh9rrOca4oviwZ19h3d+QUbZLFyjg1sY2RYlA1u7zZJ9PUN161HRU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TvyAE8WzdZVc0uUl25V+j/iKcBTtwFnbT+Y0/ZYYyqdKnWc3Dl35Npi5EFf3?=
 =?us-ascii?Q?rBt3UhgrJwtJeJRwA0Rt0l6ZwzFXVv9vBW23OC4r5ALb7urLpSf5TfkrZphE?=
 =?us-ascii?Q?PCqKllcFwMSK40fHPUIjSFNfbPMiOSC9MWv3g5Giyrssjhyw8fqMXi7HcBIF?=
 =?us-ascii?Q?wL5PLbAiDwqazoyvWtMMTL2/bf7M3pu5TtTYalsylBinm9KLtwbiTf9ThR+H?=
 =?us-ascii?Q?fD/eKxCqbo7TzTerGuBALvyuezzJUDAHS8CkxnATqhcQYTDb1QF9XyO1J4rn?=
 =?us-ascii?Q?JLTmn8M30YBLwKv5LJiWBLVZ2lTp3nYvzXzVcl2W6rbvatkjy9oKIkpDvA0h?=
 =?us-ascii?Q?sqa8dwX80daxV5AWSQpizNnggZoVOw+0jqkgf4woNkVAXjdvJspUeIga1ZjH?=
 =?us-ascii?Q?HZ3Ddf6bo0Tr0SpE72Lo/1wEVSefoCauJKT5QN2HzrjddF66K6CYoLr5PsjH?=
 =?us-ascii?Q?xqJOFS6MvSo+F/ardWaO6bTKSenKWq9sA6vRu8GgXg1DDapzTHk3qJmOd4bf?=
 =?us-ascii?Q?yY5KKwtSHXIWvK0kApJL82EZtYY0xBgzXzijL0s2zshWT02npYw0+abekoc5?=
 =?us-ascii?Q?Gu9btarT1yei4y7xR6LifoJPzllfmn/myvZx+IaH0WNDWr+OV15KgSZl5B85?=
 =?us-ascii?Q?ktoJwdqMVN1YuY80uRMyn5KvVmB9gJQnlgTwWlemEb+MkjXZDuB4/VLlvfbF?=
 =?us-ascii?Q?w2vfewsKgsg1daegdFTpkhXcyw1yLijyKHBGxYs7x6/gqUD9b2/nOchEkDRL?=
 =?us-ascii?Q?Kiv+mrDqU1LcEtfIMmP53Z4w0LDpjrFabElWfYFmlOVU6gjZAyVvrZW8tHbT?=
 =?us-ascii?Q?4SgOTuQwQplswt1ZaN4ApBhFg52uzK3X/xdoFJ44mHCu79bg6Upj9pNyBAo3?=
 =?us-ascii?Q?RaG2XRqxwLcQ9oARE/WNzR/gSXWCgmoI7eC4sN00eorSjha6Og6vhn5D/SOX?=
 =?us-ascii?Q?ApiIyD+5hBOt6uI23AEQ5d+X6QVxkOPzof2f5DfAQMDQ9Buy3Nic8iKireaM?=
 =?us-ascii?Q?EW7nJqMgrJE3GAQsHu1L7MLou7wOxIgXkAj3Ew7rutoyUEkFw78VL7iv3LE0?=
 =?us-ascii?Q?wsa5/nVWO6jezVbcn49gwmZWYS3QIeMERRcGH9wYlKrY020XvhYZUb3QAYx0?=
 =?us-ascii?Q?sOgRiRhrGF90A2qQS07kHvzlH3auvDen/FparEOcse5VYLe+Pql+dt2t/JPX?=
 =?us-ascii?Q?0XHXu8v3XLznBDMMFTmMoPfGUI5tk6RIObQLsTOcoGyTYQMFDJFnpfLrm4o4?=
 =?us-ascii?Q?I+Y25PcQ49ZK1XQr431m+iFNDfP5Sf6PtpllbcTSyR4xUWzWIdmYzvXIprE8?=
 =?us-ascii?Q?+38WkwxIAFX+bKVRUn1nBEas9f0acOIF0mw/UoP1RQK7PmThSdsJxD3ERapR?=
 =?us-ascii?Q?FqL/SaTGu88V7sXsvQlFw6Kyg4nHN+gxnYc0vxHUbUhpXUbRnaTNOyoTxOX6?=
 =?us-ascii?Q?6sFK3TetMQaWTi7YATGIHIaYfU74jng807Rt1pjpDOiO87rQgcFdceILVheK?=
 =?us-ascii?Q?DqUEtdchUD9ZREtrdJ5vDqtRcOsaakzk8qvJurCc1fJSEtiD3JWyAgTIx67O?=
 =?us-ascii?Q?A0A91rEr+walPp1OXYPJfqp1swTgM8hWe8wP7q+tIkeygbQfGmBPcHsZBPaP?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?nab7f7QRulPAyfYFsU8cEiAD1hxT/ltAfCMUITMCSl1J6hd8D0ACUFkhiuoQ?=
 =?us-ascii?Q?lGZbOl5FwEWmPy7ZEDhofuJCVvK9DBzmDCSmY83FKaTe7CmVJffwa5u8akQF?=
 =?us-ascii?Q?OSkWfdtOQcYrPW0nk4pJoOGE86p7K/Br0eO2xTvqsNfQmPO11VwDpdYCR+5v?=
 =?us-ascii?Q?pQ3XpeBfNtFa2BxAZkvAzbLqsqi0/f15ei1rxRRUTncRj07l7zTncLi2quMU?=
 =?us-ascii?Q?v38l5aDwHIHJ4Ec2Ki9gWmgU+6d6NKT5x+I5bQgu7dLUhOQjpV0R28rYPqlo?=
 =?us-ascii?Q?19y6EtOAUGUX9AOx9q13y0voiXyLYdPJXGNC23T7gcmg0FKBugEoVLbFcFWU?=
 =?us-ascii?Q?IcoaxEaR9UY7wWdAYj3IPNn5qNeu5+MHN31DUktAxSoY5jiehdxB/bun3CyI?=
 =?us-ascii?Q?/dXSZRj95arBZzq5ugxBfyAVXFugJonfJAyy0H+OqPyiGm5l9C9nSQz9pSK7?=
 =?us-ascii?Q?rDBHYHBvrEhcryT3yM5rGvqUN2kiyFt5rDOAaPcQPihXAMAhTfSdBgvFwtO/?=
 =?us-ascii?Q?7wzO0tpgCrNkBYq3LYmErKo1GZAE5ioHGUoJ94Tfu5VWXDEgpGtWaFA/EtfK?=
 =?us-ascii?Q?mnZmiLDLd1/m+Le7JfY3ICrBN06XYs9BTdhE7/r2KBJvZRr0m9ViGNdRL1w0?=
 =?us-ascii?Q?A0qYJm4MphF2HGS3565eI91W4X2IumWiaP9gK857UmXHG7k5K0g58hzKnOwx?=
 =?us-ascii?Q?Ubd7RXV+z+qpMkDVquTqnZFIiO3F+1YqwRDvemi/Q8j8d1HfU+U14OK/Qnnw?=
 =?us-ascii?Q?dkfumCQwkwQpkDBd7/r1eh3yFdskU2VchSIjx73sFzZHydvxPy/I4acQxZz2?=
 =?us-ascii?Q?NUgkdZT2nxDc3WsDye5GkgvXpWzkK8IX5GlTd9jcmK6TSuGnMyCpkE9wFgRg?=
 =?us-ascii?Q?7remI3pwTwHRouZ/EclgBIRMBoTmcud6yaZBqi7ZzTWu6KzhueV2Q1oIVQdR?=
 =?us-ascii?Q?k553rO7kphRgQfz2P2Y7pcBp1zSGdULuom0X3VtF6JqJMeje51IENj9zAhT3?=
 =?us-ascii?Q?LdrodP352ioVsu8tZtA3kFhXLK3x2wa46eiGf8AAZsJlkGoH5L1vhM5BGTOD?=
 =?us-ascii?Q?0FmayaE2tUw/3+Pgng63LdMRbLLb372pCILKEFIUjTRrIE3QpBRaSUYMo0fe?=
 =?us-ascii?Q?L2rP0COYkStFeXVhZQsoVeoWamuqGKCeRGL9ttlwT53QZLRAwcaUR4F2m8Ad?=
 =?us-ascii?Q?ZzYREm3bUKBpokGnZNjZd2vZsE/nfF8hLv0PKESueWqwdXjnwhm5NPSB3kMO?=
 =?us-ascii?Q?fFxSnNdjSC6IWA9Fzuz1cM6ScA+liRsO5+yDZyYAX4zKjCT53LbviRP2l+Zm?=
 =?us-ascii?Q?ku38ubUDyQa3FgH+TEAbZIiAtfiLMjziVUe/UdZJ6hlccIEpa4woXJQyuUNU?=
 =?us-ascii?Q?o/qs305CLlU/LcHVnKdlG7F6AtXGltylAgKeC7OoP/3wSaL5CzwsF4cTWMBr?=
 =?us-ascii?Q?idOEWHG5OO3HMQjcru+1MuFX+brf/bQXoqPSOXk/GKAkbrWlBAIl/VcbihZx?=
 =?us-ascii?Q?vf2vM+pMrzd37nuOyGHlgAnuTFLuYaMlNHSWtL6+c3j4bBX8SAwi+/LU0Jln?=
 =?us-ascii?Q?PnuUBoyViubRTH4tU3KDCuM7IXjNmKKybhANW8Rn08abnkZh+uR79Qg65AhI?=
 =?us-ascii?Q?Boyp3cPlfuGJHO3U10537Boe9N28meUR+la3EGLyvJ9Dee63lDe6rRsezGmD?=
 =?us-ascii?Q?OaaxlFevYxJSIGyyxytDwlSCNeBFWV92tm5KcanWkvJFkGsEAS97MIqODwLv?=
 =?us-ascii?Q?eVOeQ9+CXpUhk03Sca7Ei96PpVcjDMazoyQ+VXp90nqiG/dmKu3zUwAMbUBf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	eKg6bB03aZZ4m7woN7ny2Cu5zhn3fhgzRT1oDHGXacCTZT5qdjAdMRolSfPcErAYEjYf+7oqsXBS1bsfbfDJPdDkiElaUEFMNjl+W3lVVoPqsHwna7X9FU9/i0IytCMRpGkb1rXnCl6fd6J7Q3evfIK9VuqGIgjZDArZ+qm8ktEkTA0wjgCI0p6CoafIGcbkuironAzBQeCzB30ky1YOo+lqJ98XDBIigcFoYTSigDs0fJUsaM6f/E8je95cLHOBJw28Kz1hJjVuk264hOWwzJ+AQwTqZdpvjOAeTYqaCXFB9ezEf0SofFnnoh5I7+TLYQW+VN4g1aQje/wT7yzoiuDdRnII9ZgTMfvetAr287lOnuR5eerPbKBVNLFp8INWKWd1NNqx+bf9X89MiU16lIff16i1Rv/HzK+zSSWF2i/GZ5MCyxW80J/Csds4lrFurxNg3ZoQpTIJSw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5513c73-6c5c-4cfb-c88b-08db82f35518
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:22.1497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Chb1KhglIPAXG1jhgfNA2in9nigSATtRvU5a6IT+LFxgqRFWY6V1D9NIlQ2w9uGHmALWF/pbNZgVIzeVBhxh9lVSXwYPggu0Ed+Xb9U2B44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: 6L0w1yq9VGzhucFe-JrUS5ES5e2I9s5Q
X-Proofpoint-GUID: 6L0w1yq9VGzhucFe-JrUS5ES5e2I9s5Q
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b1172cbeccb..1695a71777f0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -589,41 +589,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 	default "y" if PPC_POWERNV
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 
-config KEXEC
-	bool "kexec system call"
-	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
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
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_ELF
-	depends on PPC64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is a new version of the kexec system call. This call is
-	  file based and takes in file descriptors as system call arguments
-	  for kernel and initramfs as opposed to a list of segments as is the
-	  case for the older kexec call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+	select HAVE_IMA_KEXEC if IMA
+
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	# Option is available to BFD, but LLD does not support ELFv1 so this is
 	# always true there.
@@ -683,14 +663,13 @@ config RELOCATABLE_TEST
 	  loaded at, which tends to be non-zero and therefore test the
 	  relocation code.
 
-config CRASH_DUMP
-	bool "Build a dump capture kernel"
-	depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE if PPC64 || 44x || PPC_85xx
-	help
-	  Build a kernel suitable for use as a dump capture kernel.
-	  The same kernel binary can be used as production kernel and dump
-	  capture kernel.
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-- 
2.31.1

