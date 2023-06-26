Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9273EF79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:50:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fbJKy0ku;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=RXPITDUw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qql3K6WBlz3cPl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:50:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fbJKy0ku;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=RXPITDUw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXx53vSJz2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:49 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QDJRZf015711;
	Mon, 26 Jun 2023 16:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=+EoLSdrCUOEmJ6oU0MuFsiNJ2XmYltb/OuIQysG5eCA=;
 b=fbJKy0kua5Bz/PdDkxvdjbSoxr+rwPdUSNozPjlhUHwHtMptlnR/nmOn5cdgYap1+t5o
 MQa9BdDL4eig/EFBG8QD6BqhtNjPSME27TnoQ7sFe5tg5amsBSHzEeJx71O7B2J0qXtK
 ASRkt7ik0x6b4HpgFsl2UDR6TEVOa5tHK9fiYnyPt4C102ahFBxU2sN2NxmeU7UaRi7V
 NS9O78g1hfWSlFFuZFCyC7HWnDXSe9w/x32nU3r30Qa9t/9+LFHecCAVsfKTtExtylcq
 uYIykSzEnxyGV1CZBsVqSeXdtjkyNCB+G2poFxVn2PABmXjMBMSisqBEsK3H0VzaBlyM JQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdrca2xd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:32 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QF0wV9011110;
	Mon, 26 Jun 2023 16:14:32 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx39waw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFJGmqtz7Yrq7S7Y2OVb3O8PST7g4s+WvjbeO4hX2epMJOrWkmdcwwRhxaH9ShXyMa69IgES5Ot1NHcKwrvFsLERlBVxCo72Gw3/OYoG8C5UIPiWQ8d3X5VI32IXtaIMMCpfs3QI9jnUw4yIcSClFsoOLuHVOAg12GwnKkLe+moNiuj7ohTQEJKBUT2nQbRfNJne6rxs0cRVUbkbZcNpu9zNW0856kns7Ur2fVkc99G4e1uGqrS5AG7JlOMah0PB+I2ShNKaK3Pa7LzdZvqbT6giliWOz+KZp368MFNJne06U9njTCzyK74nIqjmVIIxCwBDvR//dmrCUFrZNCdtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EoLSdrCUOEmJ6oU0MuFsiNJ2XmYltb/OuIQysG5eCA=;
 b=g+VttjErEiaSLE36pNEMdN9uXR90rfFBLKNox5XNgXfLbM0Bwd8ZtmVv+krCPElgL9PrlyrPSuKVV0L67MyEAsERCSkv0deVZeYj2eVI6MJczTTZqXMtsooehdEKKXSBbJ79XTwkVphI222iBDINhkCPJCkoqdMzkh7NarzGBbN+Bn6j6l5eWM4Yl7logEb089q6loHRA16QwvRPlw7IhthtFnPkBDKlmftJt9J/ncGh7hB+/hC1KQqXADYu9WipddyJQL3qPEoap5AvCVkEZC5FblAgyyHB96rbusH/HEZsbqAWZgFPJWSPA6ZEXTRRqKQOJGWb8nmLoBXmwr1FsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EoLSdrCUOEmJ6oU0MuFsiNJ2XmYltb/OuIQysG5eCA=;
 b=RXPITDUwsDtUFk6BSrXNcZPm5OOiuD/ZwewX6PCeHp1uxbzVOVmS8nc2W/8rP/fKJnDbSdCxUevvzvjkxPzozMK8tZLAz7Tvl27nx0nxhssC3VrHB1wSPqsSfWg46EHljH1kncutjAInIXMbULgQBiTBJm8tEJ1wEexaBYhODmo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:20 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:18 +0000
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
Subject: [PATCH v3 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:32 -0400
Message-Id: <20230626161332.183214-14-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2155ff-920c-491f-7dd5-08db76606500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SNb5EtjZxKQslgIwoQqpFvuSo3M/LoJA44u2prmCkyIui2pDN0GLESuB9m7hbcpO1pEoflHOp9L9ufI3hx35XWE4sRDSanupFolIycjEKh0ZivmeRBMrp3CmOhbc99XQB/nGjzvrMlZtMSGOZ5L+a15EXremOan1X4lJ1iBtLbE7Eu8l3GYa+mwIqxuNDUwaM63xD/m0s63dfGw/v1/tvfrp8uVPfF3iWPE6L1iVZohSbUGiqNvWFmnRyrfeU2HER1HtTHrh5f8KXMs2I5RgDhvOWuYRaqGjbDJYORrwvuqehNeJ4ZrcbQAk+RmwGNpl2jcMRh2P/xF4KYUjx8xTqFIMgkNCnqMeLFuSymumCoss996fIbywrbjVda1UhNsMnOE7YFIo4a537JDTTQLweicCI48pznoml+D94i+wJMmTlw1kfMTHPy1bifQam4klTvo7fyGXukrNHv/gbKn/Nz9eRFdWpcx6OidgfsG9mreDo7bOnSmmjrx7cyv/IzV1QsvEOCAVqpYRTvXztA4KiDrW1iDW4bY6dzW2OU/ZAUcYP8umIMMhNZtG299/tydpUigEJaMAOtjOX5KN86ujBjnuxLrFixCdD1XRDOMtWZk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(2616005)(86362001)(66476007)(107886003)(1076003)(6506007)(26005)(186003)(2906002)(6512007)(66556008)(921005)(36756003)(4326008)(7366002)(66946007)(7416002)(316002)(8936002)(7406005)(38100700002)(8676002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GegGTzeTGDYaKxDkLmYJRrkUR2lmKonYw1H/fZGTNm0Visj1YVl+X/xAv2Ab?=
 =?us-ascii?Q?BAmRbjUbHQiKJYlFPDpzRof5KBcsqlEVe/IAUrykQ3nkrRwrsoiYFJ/NkhCG?=
 =?us-ascii?Q?Kaf7FlKzA0wwdoHTHumQCAChV3EaEocaH2RhuPgkeU/hHamuz/M4nlHbuvNF?=
 =?us-ascii?Q?LRXCaLuXnx9kkLy8h/TtfT9BZpl+uYd0fzIcxiPSEWeo89i8VD/8GZyqZ1pl?=
 =?us-ascii?Q?ga/bHL3aqBreZr5vVUIl4LxvjUaeZmtXmhDh29/JcSYUEpsEc1WKbgKDSAb8?=
 =?us-ascii?Q?CWLxEr7xZWY5GTaM66R+pWXQvpEAOZMnY7XgHRaX4hx8qKZbhV2jBSG5ofoj?=
 =?us-ascii?Q?W0z7kefwN5qr6LfOAS3WHdqsYv6DsKTEAsrzlGiP0AqE1MI+fYj2wha75foS?=
 =?us-ascii?Q?jpC8ml6fmnqqxmuBKFZ6KiTt4fSMjo8sT83chvCyuJ/ux1HsHaACaOKlMnrQ?=
 =?us-ascii?Q?XiHLeQ8SvxYt4Mt+NCxwhGoHyKSi7hLtQiSvcVdv9Up3nuGLUL58ARsVk1bE?=
 =?us-ascii?Q?viD3PBw55NNquTrDj8kLlHMEG7PFLQTDoSCRsRILiYSMxzCPWsycBEbn5FEK?=
 =?us-ascii?Q?JTyIYAypRbSKqoK9A/nt0vKCd7001ItGzhSd1EpLgQSO/Scbxm1BwmHz2/ql?=
 =?us-ascii?Q?eNrUGulmbUTs83irMYOtB5XwLAJiSv5M1gf+/CAtQu1OtTqVE+yMmum2jgTY?=
 =?us-ascii?Q?f/nk9sbbCCrmBE2WW5tiD0NmkAAgflvAqNmIzj+anHdLaNxQdGarKeRDF22P?=
 =?us-ascii?Q?3bGx+L3oonWlRVfjv3zL3+h6PqPZ9zTtWKjE4h5cqrUwGaa3dvTuOssItMgm?=
 =?us-ascii?Q?wC1JUaytJmvta0n/jpiyYqSyJbqomW8RmtZ1g6tU2RKyMgc/bcBP6tlOo6H6?=
 =?us-ascii?Q?kBHd65MQEvmG1L50ZyizS5xmq7ikC39OzJzHEUBEn9fDuYhG9xHPX+SnGFcj?=
 =?us-ascii?Q?joZ3fic+kcVX+HpeYiqtDVjeY6qwAmXeEnlS506JGfINEBQ6jsJb52HOprr6?=
 =?us-ascii?Q?cFCkZ8gudSrsuAZI3iQ8UhAVHfRIbNKsg7kWjua6h8AnI8jOWLhUjaKXRlrJ?=
 =?us-ascii?Q?sJ8ewFXMt9YxzWJd8pc2I1maA3y9tTqgoDeDK2I+7oQcrObqPW8IWJwTekY/?=
 =?us-ascii?Q?47dTqKC4xAmAZf78mjG+5LowFH9lQovtcmyHuMkpYBG0F3TGFzU58OpKxrb7?=
 =?us-ascii?Q?b2eccERUPqXZv0aYIScRStJUwhbXqF+wvsTVi3uhKwB7/j2XuH3oKU1/Mbmi?=
 =?us-ascii?Q?qRAvbNPvoD86qpSW4KWCz+WwCgjnqfUw1zfael4uOeGMDE30jEqWJR5VikW+?=
 =?us-ascii?Q?BGP9ZxlGK+fUtMnHIvUdOcTPGjh8mXtHVT0JYmC6BKqAkIzDlWYCASggHqkw?=
 =?us-ascii?Q?f81FtdbiMuGtJUE7gyvGAxJwfqW1YBlNyoKm/55Brq8BHlUw7lP5W2VUsSXC?=
 =?us-ascii?Q?IN0USFUmEkiGnoZ8Dj31q2BvMYsqZcK0o7EWF/CdIUznf6vTV0NtbLoEc/9i?=
 =?us-ascii?Q?7KVJB8AxqLXADDR1AIeQqumX9TSzXE16zZFx5MLV/iSEZcJWR7UxjBACC26G?=
 =?us-ascii?Q?DTNYsS/xEhSWcSAcJNb3MHGnmsmSd3LYTPYVXHdE5bk4rzUzJGiCIUhxSF6L?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?r3Gdpd6Mur3ALafs9XgZo4iUOE2w8cKrnjzLzCceanp4JY3sVBPJOpQRDc1l?=
 =?us-ascii?Q?AT7b+ODE+8PJmp5ymbaOWZJ8jviATkzsLo8aaytb1HZNdx/nWEGwG51ekole?=
 =?us-ascii?Q?pYUXAwikNwzHWOh2LhkrmXZhg0/4AkL5wFFqgTqZJ5Vf4DSUMm5rPz1MiZHn?=
 =?us-ascii?Q?wR0sWG8snQCz67AgvWRhLHj3eX1eatTISigSdm2QmKprXUl9pLJPfsqNnPs4?=
 =?us-ascii?Q?10+OPh0KNkxN2+BoQkoH3Nee34cgRFPnaT2lE8OUHAoy5eNYTphtCRl77k7n?=
 =?us-ascii?Q?+sw0XqVViXHaclHeWvzasxXacLPeBF80vI83viAFGWsaOXqjre+yrWQK13Lr?=
 =?us-ascii?Q?pH+Mq7dixzbpEVQo6HPZ0VW/4KuUbw9RAaFNOAMh3HPrWtsnjrtHpZSw8APz?=
 =?us-ascii?Q?crVcg66R2bQSTd2ZpLWaxqVbRx7YYnNc565MtHRRwNd9/0PCwZIrf/raABuX?=
 =?us-ascii?Q?OrswIgF2UVHdB5XNXqCam5yWlQnhiQ6bqT1hY0VdAlA2tSQBbnC6pYbDCEfB?=
 =?us-ascii?Q?L7KInW1dhZ/aZUTc5Wj9PzV1Aix8gncIRybKYA10rvJoIrQA/uWXvPzS+29Z?=
 =?us-ascii?Q?PAMM789Nw+tHMek3WXB1ESwMTzp3a5j4xx/6kgK54gu+4wI1NEuhwHCYrqoI?=
 =?us-ascii?Q?XFEdlHh54V+L5YfIqEic1EZTfUSLEU98B0RUIh7LSLRrzByXTcbXZfSDWgGX?=
 =?us-ascii?Q?h7e2OGG/h0oK3406tuHrO2xXe5enk6nxOn8ZWcDnEZd+jTvg2rQJOWhTLmeU?=
 =?us-ascii?Q?Z1qw3BM/Ps8YMofyfDvFbLH6K4TJ/w1ZS6lo5clUq3doN7ooUe9pg24fTAE8?=
 =?us-ascii?Q?aRiNwtisp5q5JoUn0YVFSHxxMVb3koR8VTXWIr1Zqdgz9aWbBjG5of7qFwuO?=
 =?us-ascii?Q?OR9Fn1V7BhK4blZM2vPIn9Ae8UD6ljnZEolj0kHHhlKaI1GBfRrR6ZJElZcC?=
 =?us-ascii?Q?SMeiqDu5O4iYb19ZnTzWpCfFUiFZAq5NbvbEm8aOiyGPsMGPB7KLZAKLoCtU?=
 =?us-ascii?Q?9wCyegzIuQPB5Zr26+5l2Kn/njrMDcoZAmMRMJy3AsWwcX3uH/1i3q4oYoZv?=
 =?us-ascii?Q?hHtd5uUJIqEvAsB3oy5rJO22CjvT0puBGDDuHhB2Jc7lCxKFJrLPBqkAn33h?=
 =?us-ascii?Q?GJ+z/R50+0027QPVvmm4ySAOFtVryDv7YcBCzZwRiMbzChwk7zVMmGCSxq9c?=
 =?us-ascii?Q?c46dwA4dBcXxNG5V5FBxZyY2///yisrg5SOIqDmEBbb2zItUfjgOgI6XwQ/V?=
 =?us-ascii?Q?FRXF5RLASsNu6bbMsvH5eLjVN7MyiXIAN3z4hWFPR21NQX1bq2KWt8f2dk9q?=
 =?us-ascii?Q?i6GnJn28NViVgo3ZYjzsN0q9FM9vLnO9c7POxXHhd2SU5TRNb/5TAeNSPwdP?=
 =?us-ascii?Q?jZbjJWlQqwAXquySX8eicdv/GIbU7JRxgqhzS0CnmWh1WH7t9mfR9VYl0XTF?=
 =?us-ascii?Q?9wxSZK89sHbcSemhYwLSpwTU/0RG9hY6oR0Vaf5NQm4NslKdfnL7v5FQiGKK?=
 =?us-ascii?Q?WeN8QkEfZb39iz0Jju+JNfC4xepgmJLdaZ3xIl/GoKLpSsrDmbqj+RjKCyAc?=
 =?us-ascii?Q?48Be7/7Dkv9yWtmY2/m1iM+YuOT9DehSjEcAF2eWaB8ZvQSmEZfGlGQ8FG9P?=
 =?us-ascii?Q?VO2/0/0X9oLyqVCq0HKaXpvbF5fV7L9jfbwzGANzih10kpO+H+hsUc7KNmik?=
 =?us-ascii?Q?PDEj68qD7JkdPOasrmTVGDluh2fVCGwVaBjlj5/MobA7sKe8l9rM43ePXHz1?=
 =?us-ascii?Q?JM9HdorL0gbeT3Ncm8kL2ayum0ItF2hu16E6qM/l9TridJ9h1ohqt2A+lwxv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	juYlw0aSU66lZ7ZIAGrS/k0sDDLdI/hHllA+4TkfvaU65YHPmvO341hlNmv0Ho1an0HGpz2UXR9RqK9att4J2o8Ekc4kE5yr8+ftJQ7DUiE7Mv0GViBshltPTcI0SXueziMZef9odFZjCAxyFBXr9aINmULUMtJyoq2two6sS928/Zz2BUSbwhSH1/06WIcsatTc5esb4oUdqA5pbq6RevvcYY3I5FhJPu04OyiUzuzqTM/WqZsEHYGNWuSMokFUYtEnYplDie9HKuCQ0vzW0bC5BFTWWcG2A48qK44FON97uE9VtDVbjVPd46vHWqavluoPJCs2PUyCNehPm6lrPXlMDbuWFGZrskJdV0q8s0RRlSHi6dWIJLV9BZuox/GdWJ5t+IkpENhv58FBq2swaE14ZcfbdmHxZ1Pe5vmsYRig0NfGA7P7tI/upx0TCfAc9Tp8wwehGcBFJw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2155ff-920c-491f-7dd5-08db76606500
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:18.8261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RpXQWH62VKnKKEiqoqwLvqMjLRENvX0gzvIe16+qYt7TUiqd8RmSVZDtvHHCNXm58tDMTi3irbWuFcqs5T3gAdebjoldH5E59wDUNz5VYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260148
X-Proofpoint-ORIG-GUID: OekVQBxGcFjyvrnbcB-JoTtvAw_cwUJD
X-Proofpoint-GUID: OekVQBxGcFjyvrnbcB-JoTtvAw_cwUJD
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:38:37 +1000
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
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/Kconfig | 46 ++++++++--------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 9652d367fc37..d52e0beed7e9 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -546,44 +546,14 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call (EXPERIMENTAL)"
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.  And like a reboot
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
-config CRASH_DUMP
-	bool "kernel crash dumps (EXPERIMENTAL)"
-	depends on BROKEN_ON_SMP
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel using
-	  PHYSICAL_START.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
-
-config KEXEC_JUMP
-	bool "kexec jump (EXPERIMENTAL)"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code via KEXEC
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool BROKEN_ON_SMP
+
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

