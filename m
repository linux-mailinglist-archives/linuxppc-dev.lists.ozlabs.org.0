Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 652677490D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:10:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=J+96w5NF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OBzLSg96;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDPh28pgz3cC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=J+96w5NF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OBzLSg96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zX2nNNz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:56 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDeMX022535;
	Wed, 5 Jul 2023 14:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=J+96w5NFOVqvJ1Hwm4pK4F7tm820eU7t5xFdsdF4dacRSi8L7EZPvu1Ie5u61Q6JE1gG
 aQCvp0I5UPHsX0tkYOMV5hRP/ZTseL+Wqbxtj4lwOWnPbEHlZVYjlbksWN1OuhYXzWFh
 TAx7hN0BukrmwBkwhGLT0ioNeJmAShV6kEsrvX7TCNpc4Pm+ABhikwQ6uZ6yrxSDQ1xy
 t1+0wvvtQIL58nV9V7YQ7JPQksXbYRlMmE1rhEe0xx8wVxhD9XtnGaWM7cPq3fkY6379
 ObhxePCKfC9jBZaUnbV6UGMliqmQL7fjf2ubxt9dmvQ+3tsxXjjPuOJDxnduTjMOzRUb Og== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rn9ybr1b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:41 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsGD033370;
	Wed, 5 Jul 2023 14:20:40 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5wker-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEL5cL/EaoWfkIBjzErR3nxpD20BpOk8LLVNqr9t/r2+eJ1JJ+HQXE/XOUrdyCP1MpglHjSOSi/1g2d3G6EsxqbZ/5Um5JuEpd85hu2XxVQ5IS98CzWCzwqnn5o6Hok5pjZNJ0gDc20uTSFuqfy1Dj2VBT8c4ebVLp54fWVMV7YErPO/T0WwCE8S48MGB/HWfqXGpU1p7092Jz1CHa6LDzC64QNZyVqol97PFJW/yKHPAjh4bq3LFRpz3vL7dV/qbaaOjUYENvrbCOm9IpntG8svbtEND9rzTcAXS//s/D6PqFqrFHKDow6qPVES546acoYWD9nIU79c6K1Kl+Oc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=Ik9PqClzkJ647zhvTHWK1AFIJpChzGx2Y/aF+fuL9rO/zUx2bmkRGdyZxi5htQJzLmAcqquKIf9EG6Pfa4HW9ub/KYobLEM1hB0jB6iyyaEk8qaSLbE2A1D2TlyR3ySLaJtZJqb7uCpnTP1gR9XEYbq+KNrSnjfBJr8EJfmMWCGHvdzm8pC/nw+ItM9goPOpE+X9DO7yi6A3s6XUw2kf+5A13Ln+gtweB8/12kWiDfpmWSyhpvmGvosMBNS9wpHIWB9zdF1MxAd9x6dRn+M+3QDMDZfxKlbCFutol8fnKFxK5kaIjhqMMcXOeETmZJRAcOh6rGmZ1iAaeun0PUSdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=OBzLSg96AbtB/vEevTVQxqriDqlo3Tt+OFqIfUmZto+Y/o+PGNUPX/xqSfA0FHl2nuD0nAIrZlb8svs77pe2qLfvVh3yVx71TnQx+RwtzxR07YHh6isuiMBYhfyFl90oNvQPi1QXvSaq1GeTnbG2AbBu0JK/Jf2CBAGue+yfgVs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:36 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:36 +0000
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
Subject: [PATCH v4 07/13] m68k/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:58 -0400
Message-Id: <20230705142004.3605799-8-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: dffd632c-3b47-4dc3-4854-08db7d63001f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	x0lqTW4LsQcqO2845GDsXd/IJSa3FJ1xoqeHMmMgZwrRQuS71YECL04+FEMSIrFN1QQ73YYrdmHOooR64BEfnd7jJCn9CkI/PXNXoTPlh6YSDKjrpY7/Q+YgoJ23puGFs8MFa6ykFRGC06UKmEkenSJCki/EP/kXt0Tc7pVWXAXWiaFyvmCBiMGNqwmGv5VW3Vv/KC9DxHFz0KAfl2thiDifBxTiCdiHDozO1XHNIQpIt2XGoXbfgPV9JP5SWzG77+WUL7s9qTvjoC42cduEQVH0nWh3o3aelybObpyAjrbXWsGuLl8Qlev+1M2VyD6YpvbTzmrQlrwJozEtZYBHx1JjGOzRmjlfEYwvH/mHSaFWXhrNCGUM9bpFgJ+uMzTMKH1Bbgl39w3qpqWLR6O/0RQ/l/iQWku8yNVdbngEdrL5hLOcKXdSdf+h5x75JeMyVF+o/dYMx3Hw1UraBOxHcQSKwvxAbjvBwoEYywiEhTJWQuBAJ9Cu18V69B10k7KdnORoV3u/Mx0y2NZiMGhFv96rVnodjkgJ7cYVXAzF0VvM7VuN6fpqmj0pS1yg2TBLpMHvNsAB/BWy6NRly8rK0LzJ9UNlfufz2QEP/zBTqP4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MkJDhP9V1oki0OTqViERxLd15jRqx0FhxUAzQeN0z1nBZb5ebB5xDg/d3Wq9?=
 =?us-ascii?Q?U9AfvF71g03VEfZHr6GS1o1AbiZhYHy3ZChiNlwNSdGe6i475pj6qI9wYV7q?=
 =?us-ascii?Q?iO6a1Xk2nBrRg7x6JA7I2S95feVmqHDiSEpPDSNHG4T0PtkHJPh5p6GXB0u7?=
 =?us-ascii?Q?GNvWDesSMnHzkIlrYWq2xjxhFEI77ztCDYQNBZp6O8wUsnBBOp3fey1bi3YJ?=
 =?us-ascii?Q?++0hAFxnwVulFOTqKXuFOF7Yy94+0v6r4WWhUURsMD2t9oCJylw6iU05cIgd?=
 =?us-ascii?Q?a3bq5QFKMUp6OsgPEgaqbQzqLTm3Sw+UoZcTiPwXtJMeOlPA2V7DePhfJQGu?=
 =?us-ascii?Q?ZwRBwvOrv+q5Pi7LBa2M+bJw6sbvUm8p32B3JCJdZJ//wVQ/JLbtPGwiyu/9?=
 =?us-ascii?Q?DH9dbvByLqEPWi7mDQb7CyBs32WQx7cZluNfUAs652u1vmGnjnaePQ5+3j9F?=
 =?us-ascii?Q?S8+LycJNPj+cRTgfpm/d5+4cIOmGy2bAH7xo+ET9VJ5hGPYPyvHFzSWG8Mtp?=
 =?us-ascii?Q?wuLv4/HNytdMLOugZJsKPFuvsV9Gno7TCf2XAEEAhhj6Psj8r8fbZL4br0Mu?=
 =?us-ascii?Q?IV31pOjPMhxvBbmfJd1ro1e8ukkFOM4mU8cija08rqOUxRAP1q+EDQg/tTRb?=
 =?us-ascii?Q?aut0vtow85gBtmfbFCukV3DtAHyJDEB8vtW2dMKvpKx5qgTDTVeImaguIUEa?=
 =?us-ascii?Q?bZsRDkS/DBD/afhZC6Xn4fWhQwaDsrwDLM/zf3GrMk/BHZt44nZ0iaZy1M/W?=
 =?us-ascii?Q?k2WFQ7RAHSjRp0EtpXlLnt+usgqMQgpfZGT8QrDa2KuWbatGLhIaTK2KwVNN?=
 =?us-ascii?Q?mCSeociPCGjjm46qPRrT98ChpPSVZwka3KHJ0t/0kZPelxgjgCVvMw9XT8fI?=
 =?us-ascii?Q?FfyksNIb1/i6/b7AqrdpwLKI/vrJy7IUrKOf7TmeM2gNuET3+21WMh10od7M?=
 =?us-ascii?Q?GdzmDFDMr8hFhmpQyUY0KcuHTogtjHgV7Aq81EJ8NuW8Blq8FhNEQh7ARuca?=
 =?us-ascii?Q?Y9F2TxWIQb6l0twZz6NYa3ljuf7qKWlGfTN2T5t1NVWjO+Me5oB67kakSR17?=
 =?us-ascii?Q?SUVtKIYIMnhiCyEkXCA7zJd4p64wY9L9LBByV+u96db7vFUAnGZ/mLBvkRxu?=
 =?us-ascii?Q?VzEQbBNoniIf9TvnLKGoumZfbXWoECAiWxD9DLsIb2oW5R/pAcNcQQacY3fy?=
 =?us-ascii?Q?Gv3xLkWZ4XSD09rYWOrNYSW2wdgMpixCz6iwqESQc7M+ujwn7KRxud5IEJSu?=
 =?us-ascii?Q?V3CjdkRDrt598y6C7B1JwFmMmhBLyRdoFsZuJ+pRjB4ivKs86yYKMt8Ybgh6?=
 =?us-ascii?Q?WHKgSuHqNFPchO8mdLCyTvtRhRCsGpafJQ9A8OQmhLJL4BpzkNepZ3C6a5KN?=
 =?us-ascii?Q?B4yz7EOWVpqbEEA9MbFLkoqBJiHyCgWFx0CpKpH8FPpsdwEWMmQ854RhkHoI?=
 =?us-ascii?Q?RWeEl8vMYGH+q/7vkT/4lnngNKHc15MaS2r8VMzSmh4+2MQs7C5rJctzw/98?=
 =?us-ascii?Q?/9XIHf/M8OiAxq1tACU9PSB+20+yW7l3N1kAewP+TU+b0ZJ11WdveSVrCp8Y?=
 =?us-ascii?Q?rkA5Wdm6dOwCdAh/+Cu8d6Tc8w5JBsjoXFPHoKv9NQjOuq7Qx55XRGwijKt4?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?o0sKAg0RXhGwunXeJdnHtqsw7OJLhx/PEWeXw21hu/ayO+Ut+Nhtv9i7JK6o?=
 =?us-ascii?Q?F7cH0PqIWvaPlBra3Gg8jf9s1rRllmjkeYgp3lBpIkpajueyzK+03RUK0eQT?=
 =?us-ascii?Q?Ksgz9fQ31aBRbs+a/D4TXzEgjMIS04JfgPrCYbf42jlgbsxaCT/xRLMV3323?=
 =?us-ascii?Q?jHgDSxPPns3JFom+9YHSICmzWGTCygsEhLg2ZTKn3NQgz6bpgRlHGTDumWmX?=
 =?us-ascii?Q?C2ZIhYzINVD4eRf+L+XUuzPZ7irdU06Vp47YP5eDwhC8cNJiklTuymF5UzGv?=
 =?us-ascii?Q?O2rRQWYK58MXI3oOAQ/8a+2TE0gO2RQuiRXW5DjT4nnxt2p6PScGNUia544V?=
 =?us-ascii?Q?+BUwwXOdzoY7or6i+PUlPLl7N0oLJEbSHZ5mZ4A2f3nZnrGQ1AZYvCizdXEY?=
 =?us-ascii?Q?3hnhT2zWBqLqWEK0GYryHhmKhYnJKd61eSMTnTiJTwqH69SM3iWwmeAc87kc?=
 =?us-ascii?Q?GWWyNUuC0Sj5H5//6Bx23UnCJPkWU+QLsTn6IiH/E0QfUhMyoaKbrsHAmGMG?=
 =?us-ascii?Q?Zsd097XXIZUxHXdwIklPrqCkRn1oahMrpSpI+bvW8jd2oZEPZZrC6m/iHjpo?=
 =?us-ascii?Q?e30yirRVizAe7AuhsPtgNPazBs03+fnBQi8RcGndg02VJAJHRbvhxDMX3lRw?=
 =?us-ascii?Q?w/ABg6jTG0DN7MVoxf9uS45JWJOO8HEXZSu1ZNKktHDMYsjQ48q7ztnQB4V3?=
 =?us-ascii?Q?SWJBM34HXW1YOmUTWpvTVbA1B2SY2UTkYfaBicY+8rbmWBeysmPp0UgvArjP?=
 =?us-ascii?Q?GJ8PRklbVVqrHGWz+V45lSixJ+7XhFgjFWhDfHNRX8j4kab6wHlfkneC9EVy?=
 =?us-ascii?Q?MEawDyJBlgD87rcwv0zGLh34C3OAUZyfjrnO0L8QBv7wLYR9UGOtBrLraKaw?=
 =?us-ascii?Q?FWB9RI1kOz3RTMKBB/+o2ixsolFB4DnKMR/qCb6Zi0KCle/5poSxjdNgqfRh?=
 =?us-ascii?Q?4DrflZ+5DUmugv209aCl3IKodQqKBIvZcL0epOlnudxtLHXkJJ65lvMD36of?=
 =?us-ascii?Q?JO8llAHk2P12qoxvsFw7exPLhtk4RMZ9OGJvizyVcE19kra99/20Vvfs/JAC?=
 =?us-ascii?Q?MeNQkRCoA88M37XzCdj1OBSOtZeTrRCRSMuIBAwyp3FdV2qgoV4jwUxp152h?=
 =?us-ascii?Q?AlhDgTLchHsM8PaxR2+D8WA021KCNDmU78jIdmO+qTB19wooogbISbUjHPpJ?=
 =?us-ascii?Q?nHTckCvWSTFpsmp5BcB7FxpNnyjEPj5egFDsJRyutZoIGIv7xa/RDyO4VnnS?=
 =?us-ascii?Q?30kHtjv4uBab22sltt1Y73Jr0agw2YVRJWwM8uXwvlKlhVWDyX5A4658vegN?=
 =?us-ascii?Q?M84D8gGkPVMu3AJHfiRDB7UzY9JPFVvD2F4tVISvtgutS4zMJxpLJf9re3tu?=
 =?us-ascii?Q?P3hC6lkiQQKGYQo3KDAY80NTb9ym4fwJpCa7vlBvobskwkENddBDsUh+DU/+?=
 =?us-ascii?Q?GHqVvlm86Fibhf14Iw+U2NPxPFD2ZWWILDBND8ZOWXLe8bjDBkRCt+zpLbcJ?=
 =?us-ascii?Q?dPtBugqRBNjCZFM84eXyGwMj87PeQulJywlQtwpL4V7T302ZRDOUyegu+lYk?=
 =?us-ascii?Q?6OOYu8GQsFzDBkOY5s/sY5ivJDMgMXhpVYBPWUWXQggobAP3ik1w+Kahtlfe?=
 =?us-ascii?Q?r5Frnaz5oH1pKjBWeTdnBc/wCNy0yWvOtjHJScLVXFwmiKXTOiFDaeFwIt4R?=
 =?us-ascii?Q?MvdaO2iQ5gt/iY6kWXa66yux1vj/t9N4OWUdT/f09wtLHnAmCap+p68PFlCb?=
 =?us-ascii?Q?EDTElNvhHi0CcULNGFUGKc1JtEKJJjHmZweLmyBefB0IL6AABGiZJK4qidiB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	nSVvV1Rx/dzGqei/mUV59HwbTd5w2UtXo7lPsCVZykMv/Vaax8boy3aaxXhBrShUrM0jR/wk+EfYFfJiAwgWVoprAN0+givRQqwJMEUBkqwNGJU2iadZL54UAkbhttRbXYF4giG/1C29LYfu0RSKwjypHacI6I0RvfEeliSmnV2e3CyWuXEhru/kuBgHRtQFhnmpXpNvYiYvxyNmlRxdIln5LqoPTQFmzPwG/pUyxSAd/rV9M5Eb5zZJRDakSAwBp1A6dQZnNToD91oH87rRugM9Z9rHsg+jZcEa2uB+wTFMRvp+9amXK+LdNE+KTP1Tc1pW5pTqGb8sINxTUZ1XZaqNg4gQx4V6aASLXbgaiRcfLuEFaOUhXLt+vp5RCcQbhhQfobNFmBJUTzgDMpslT/LpQkSfaUVDyNdOQjTK1/Y77cKHLz3Vi1IQK/c/7BTk/7d1OAPuVsdqOg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffd632c-3b47-4dc3-4854-08db7d63001f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:36.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kupRB4sWucNcVe3XjgLdAWwdkFpxe2I0/72BzlVs4Cn2ALx7lx9lk2WTvq65n1qUE6Q0OtdGW+Xhd8yhfw97kSjmH8uUDuTd3CJzazNE2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-GUID: ciaQK8KfW0X_vmcpvIxOzGtfwFw9_ehP
X-Proofpoint-ORIG-GUID: ciaQK8KfW0X_vmcpvIxOzGtfwFw9_ehP
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index dc792b321f1e..3e318bf9504c 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -89,23 +89,8 @@ config MMU_SUN3
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool M68KCLASSIC && MMU
 
 config BOOTINFO_PROC
 	bool "Export bootinfo in procfs"
-- 
2.31.1

