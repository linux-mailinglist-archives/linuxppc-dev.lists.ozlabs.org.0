Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF337490D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:11:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=McIj12la;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PJ3ZkPMw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDQh0ssGz3cW5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=McIj12la;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PJ3ZkPMw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zk1Xssz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:21:06 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EJwwm025706;
	Wed, 5 Jul 2023 14:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=McIj12laH33yIN9Gc7frCajISM90bHntrbrokebzowEP2CdGMMDrmsvG1GWBb8BxN6+0
 Jl/UnhO/FqgptIzJoM8mwCxH6ZYC/DyH3EBDPMxmv1ApzU9X8v3d2dVG5yY83/vNHnip
 YalN1ghZ/J8c+iBGH4XHdmNoBRCYHx2J26dKX4NzGndRlGOqvhnb3LQr3u7m/tlOhtBS
 fhsi6/xrgkeRgCaOsHMoHkgYzpvCdUdYxYQkUgF+BzPG17TBK36K5YnqGe86TpbcFWgM
 TNJ1THhR+uIMQLn3wlYePq6uk9W+1KQDg01Kr5apejxsE11+6zDAAsATKK/+3FIj/Y/S XA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rna6a801j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:50 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DN1bj010152;
	Wed, 5 Jul 2023 14:20:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5nng9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id7IO3DnsAwOjGbeVrtvE+C6ACIaJPqhtmmKxhOyDzec3fklmrN0c37JZb1wAIbSgquFU9qxbZUmRrMXKVjsQhlI+ni4EAO3Rs2TIDj0hPkCszHRZ+umhIcHyPtl52PRZI+ByhJm0oJpee0DVgKcURbUNbMY6s1oY5EfHJam5HnskGi/uzmuKHNIO7sicgEyCEWISpJS2b55duvZAm8NgKjCKA6RNZQUYgtCGmyfXeY6QTlxWUfCROzL2FsOEFP7Idxd1Ph9kPBe7ybH1w54Bu/WlkXEq/DD/CAbBKBUmi+G7IsTefB+0QJP7Z2en4uX/nVhy2AyDRSBThA1FP9KvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=al6YGJBzBPqZgRQlnzdshe8Ak1bkm4qWs4fhPwuPo5K7/sK6yjuGEJxkBbDGuaRdV8xFfURz99N0B+J2hsS18t67OuJNgdOKAWQvsBr3yFfJR4ptuJPnPxWLUpQXUBrjVL/LNXfzlzQwJqeZrLr4jZ7zI110hb5baqsZv1gxKTqmL5M0LTdeeidUZqIHfTTi6TkQJYHAEpm64nK8WonY6LO1AAaix0FJN1NaqSpoPfDu8G6U/0NPAtQo/SzM5K7pKWsyFiXSaFTHDHIJ/7qHIGDsYJz/f6f6O73Y5Ylf26bZjBvm+7jFHBxl00P50wQsNz/jIvNMeXwxjtHt8NH95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=PJ3ZkPMwLtmwa0pZO1ovyWGHzRiItl3MhJr5WR1QgMV7x4F7pEm/zfmlJ67m44iI7EHOZotRFIjEK5RyHT3A6Xcx7UuWRdBHnHlHHPu4FGz66e2wLf3CJbTO7ftO0kCu7jM919jRuY8LzUar/P2h31TLK+mS5vKS0E//gz6BAEU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:46 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:45 +0000
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
Subject: [PATCH v4 09/13] parisc/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:20:00 -0400
Message-Id: <20230705142004.3605799-10-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0304.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::21) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b30fd5-f7a3-4f2d-2154-08db7d6305d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l7LXq6c0lUdbMYwG4sz/dNGasS8+tVOHxIbiR7EL6aMT1FYsEaPyvdrH4VFCu6KrhpHxmOg2tsL8LrbbsKNK6mx9TR6uLRSetaJJTdnScSARbmMKt0XYeLdMzYAndVpoeESqdoJKr755B7XYcfJyryHXscXHBefrbm31WN4uYeQtek4uwlXZFQojG0Wr35rR6/cT7/xxvQVzHTqCa7bIsdIue5fgJG6iZxh/DQUQQNsQJN36Pn2ID8e4WC08uvIo/Zfh3jENUfgSr8ceLG0r83iVOfOyOb7k0oV4kvHQ1/mkCMxoisgB44Kx8B/K/DlGIwXQ+QJn3xIhBiE4GHYS7lA0uxY7GJ+qjt4OKMpcvTv5l6ftN2HmYfeblii+fX4424NcgbTMcOn88nAQ9sXoMhr1Qm3KW4BU6SIoomreaWMEOIqGTqSAGT2Kq+jw/gIvTX1nYwivSFOdJtTL855Fv1DKY5hoGu+vervb7O0e1ywQTzJi2HEqe/aCx60yQSdkjXuhOSIDPSeIVqmcBFa5YREPSBlQ5AV+TZ7VfB0iO6aHdihRd2tYYS6orBYaFfUB8JB+nBAxXJYS7vUaVJEAx1NqbP7071XBfHy+0M4RD+U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(41300700001)(107886003)(921005)(6666004)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zLGZCl66YxQJMjTGm0wnIyB09K4ZoM+PzT39Z9xg1gAJXXuDMMW7Y2WbHAYO?=
 =?us-ascii?Q?7AMV0gScqFJOxpmpTa3zYrPHENHeMxphNrF1s3AceBQ72n/VaASK3Ir7cQQe?=
 =?us-ascii?Q?rBec9o+e0b/5Vp4J+Trt5tKr2qeOQasnaiF7x9k8Ggi99bSiIQ9TzcrLv00B?=
 =?us-ascii?Q?37UjcwEAkt0W184PO63fi5n6QTwE5oXy3DOEjN/5Y4J3FxunMX1n9q2Kyyss?=
 =?us-ascii?Q?HVeBFvmS3p7mrfyTD+sbq/gQT8MdFJoK4ofwJ2FlJsy+3o3+XLz9F8+GXg6t?=
 =?us-ascii?Q?HSX09BEoQSgT2+o+DDf0ersviGbvAk2167XmFhYf7PeZ5Cwvn2h8Xm1Z4HRT?=
 =?us-ascii?Q?YvTkgeizb3q1vrEz0hRb6nPnXd7wYZVeMifWFdzFBdyeVUQNecJqS8SJIM5h?=
 =?us-ascii?Q?KObcRKVRwmeSBU5H8t43RuIb2Xfv2r1BKH7KcZQ8+XVm4DHdHqAfwalbv6Un?=
 =?us-ascii?Q?uNwxpmtCQeAoDOpmnRFEJAK1lzUPTCBKyLDj2KHnZASc3+nx16/SngrP764s?=
 =?us-ascii?Q?WohmKI74AHqFuj3xHhwMvlkdU2ycEPFSos+JiFwo/Lfs3J5ovBvWSMwZT0+S?=
 =?us-ascii?Q?g2kfLg64DG9FHbk5IuOsDiaKpGLO+B+HXnMZCyej1Tin/3/6PoBsKj1x1rm7?=
 =?us-ascii?Q?usPTq0H0jHwX/RQgTs8Hk4zhfEBoIE2UBxeIpNYPcMzQsHY5rM0i+p+buBa3?=
 =?us-ascii?Q?2JVL1a6WU0r7DSJddnV+/FWVl2PchrvuRGRwdyMNWPB99nmXWLeBlRy5buRY?=
 =?us-ascii?Q?qJShQUwA41m2w00YuOEDzsS2D1JwpwkLCIfEnd2xm6jhIsGpSSrTzb2EGTLC?=
 =?us-ascii?Q?Dlod8BMEK5fC7Lq9g+3HtJ86MWayq7Or9lb4U7P0rBmQgIAB32F/rW5uqeb9?=
 =?us-ascii?Q?ar1frBkSW29616frw+IW/sQhozYNkP03w66FP3bKw1eGaNRxifJKi9A2R/o4?=
 =?us-ascii?Q?0kBktqHvmjq3ww2c2oTLm/2t2URJCkS6ssyIghhZvuIz7gd7Hxme1a6JBhC7?=
 =?us-ascii?Q?9e3cP2vK669ZHBFvQS/e150nqiz0hT7Js21pS3xqk1jpgFoxj1+AtlHOIWab?=
 =?us-ascii?Q?G5PNMpFzGhsfREg+atXlp4OgJZAomX1q7KqXdDcj41pKbGZ911JKUutGEpFt?=
 =?us-ascii?Q?WEyrdI/cAFOddgFu+8mpWbWBMcu8es4mhp4EP+2OrI+cyfDpsbR0eMhzWk4v?=
 =?us-ascii?Q?RR2/ZNRFFbfLZNMzCSxJTRmXxWfjjvBCYDuABKQx7JsoqtZii/TGD4HCwJL2?=
 =?us-ascii?Q?yzVwQ40PNWkdtUVloiBO7wM7FwHMxeJHrSvW703gE4AOTUXgskiywdldWdqf?=
 =?us-ascii?Q?n1wNcRi6O4MKI6/y3JPT5jKjoD+JHGYOVTi1xd6JTyCfWv5aBnoD6aEiQFtZ?=
 =?us-ascii?Q?C8Vo50W8M56XdMGykMzbynp84CRpQJx0xHI4OUWl2HIx84Jd/WM4nuH/8h/k?=
 =?us-ascii?Q?tw0ftAs9h6XagprwTp5c4ssMKcdL3fsk722xvDw6xFzAm+8R8jf12lYUNLoe?=
 =?us-ascii?Q?TSkNXVPRs7gdAXxdw3LN0QkiHZZq0Nf8HGuR3oEeS9Il1p5Y+9u5s1Dlxqr7?=
 =?us-ascii?Q?kMKiIBNlzY9uKKfBG3JcofwZJU39W0R6w/TV6U+KeCkhfDPQm/jmz0QVV1Ba?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?jCb0r+zn8lksviczmVP309yw+Rp5maXhI7s4gDBVIYvqupvCkjQ700A/QclK?=
 =?us-ascii?Q?XaJVyY5xWEb0aAyvgyVaoxsX3jGF5HTe//7AxzXM1t0NC6S40gSACCwO9IE8?=
 =?us-ascii?Q?QENqMnBUwu3jtcNFHbLkYZWkwFcZLZ3cKZ7p90slBRQdbNTWG3VrfEL6vxvo?=
 =?us-ascii?Q?rnQFfWCPrkou0SaHz1PSTuPW6JSDvuYNeigsxNXxzfFD2Xf8Ba3cdYxMQBsb?=
 =?us-ascii?Q?R03F56Cklb64qqIuvz8iLXPaD2Sn7f86juaOEM/SrDbAbmaCvTP6DnYaAPQA?=
 =?us-ascii?Q?3n2ibLGuONrlpja/jTldDAYo02mH0aRSwXZ35jGW4FLq4BiC++X2Zy4cx0EW?=
 =?us-ascii?Q?w5knqV/yvBOLLgNfpJOmIAxwNKrQkhY7RcAQh2eofh6ir9+fp+Y5m0bUn70n?=
 =?us-ascii?Q?Ncgd/WVi5fZy2FDKsUvNfbosiaaUV7/OZyuUGXO8SCbUN6UgERUWpj6Zv9t0?=
 =?us-ascii?Q?2CXvyJjcXabWHuRcW0sfDgfDEmdr/WyEHzzkVt+EGAcAZfQB1ne52BlEWqnu?=
 =?us-ascii?Q?2znoITeRDBqKxezutC1DvEZmM1DPa5s3CV+WrMhWaljn2LizL71EUOcOJ5L4?=
 =?us-ascii?Q?GRuUjgGH0gMxrNixfQusyew+lh+O37L1ft3SSvmjTvmOb9Ss02q7OknavE00?=
 =?us-ascii?Q?pQY1+VvnqLYlaroDx7Gd9ujZQPxzZzU5wKHpqYnqW7+BIEwy56ILtzjUeunU?=
 =?us-ascii?Q?Yc0SOFCt/qPcYGwVQrsyGBvk6/2QMNcdyMuW/n/PC26RufzinBk+ygOckHmD?=
 =?us-ascii?Q?Z1lelIh85nuwazafGhGSnz34yOooS1xGd5FglcRpPz2GhEoyvDvWmx1dNy6h?=
 =?us-ascii?Q?dYl0iBseMR0KLt6fJszr0u6bOn2e6nartTrUYZ+YOSqn7mlSvfVaBlVhICT8?=
 =?us-ascii?Q?VvaRrVabJFSlGqgsk9Jz1i2jNLN4MZvG7jtDHvTV0Mz//3y7mV0JdBwP8Bvg?=
 =?us-ascii?Q?bDV2QEZfp7z3NRSmhJYpi0xWfhQH54FMddGLvTZeBN66sKk4ye6HTmK4ps8a?=
 =?us-ascii?Q?aVJRQ8BngHZpSh/AENM/e8fOSKPo+hWPFvasqH2c8yKudoZjfG+a+zEDOcew?=
 =?us-ascii?Q?c5tzVGF8S8tXk22Uhp+bxPb/+p8ymtTtmuIh4nr09h4Mqh6AvOZEQpuvUSzB?=
 =?us-ascii?Q?OU4ddLNj9+jIyLkS95x4dfU/d2ScskjmaQELbNJ6uq7mbOjmoJmN1+I3U3g9?=
 =?us-ascii?Q?pzC5Goz9FSfmYYawGrd9sBTIo4fGhqkdIyKVrBpykECzaxFY3Y9TZ7acIstE?=
 =?us-ascii?Q?ysxja/pnQcrFVDDqP51eV4Z3r5bvJjWIPt9582jIzEQHOoRZRFH274uw8NXD?=
 =?us-ascii?Q?6kpVThpCJpqC282d+1AzlMLG4WhhGfmV/UhQE4T9GCPry2AIpXImDHpBT5WG?=
 =?us-ascii?Q?S/62qlXemsgxbUStpRm9rlk9nCFEDIseONtLjoOjZEEpzMIj+UG/QCSGGEgR?=
 =?us-ascii?Q?LnotiDL/M6TU7gOPsLUJH7M04u4MLlKK4LKb/2KUJiQNcPQAb304LuT+omsc?=
 =?us-ascii?Q?4YzrRvPSEoG5V86E0aYnCpY1C9qY+tSWsVmNTBY1ThkGBkflUjd6fn6gHo7Z?=
 =?us-ascii?Q?zeG6nju/xWrApL6kCvKaGhiH5esjeGO0+CWffI29IdZFXww5F4e0ictfNdkc?=
 =?us-ascii?Q?TqiAOZNXrxo+jBUcoTrOfwpinPBhILaPzUTpUOWGz9Vrc5zn44y1BAHU1J1I?=
 =?us-ascii?Q?62we8NYujQiyOGObAj7GPpdEwBo/+/4gsq5JmTOpy9d18lNSxLABi467A4YY?=
 =?us-ascii?Q?lBOBZtkjBxiqhnBYveUCMBfOucbh6CIZ8gslR6h7UAE5Z7Vm/8SGKYk7qB9v?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	sWk7dLoeqmQEYQINQbxCaPEfXwEMPS3Iam8uor3s3CcWBNphCQvXf0HRjPlJEBkGwYknlFy1qBZ/bj/SflztheFLcuEV8oEWSYWICLV1GiP8P+Sl0vGo9UOWAPiiWDDQFs1pu2dAlURW2+Ys3UKM7uqq5EGCcC+dPPAWVMpNN1QGL8eQNSVnIF4BGUXNYO4fbh+ebJj2F2c/RPFdsATfscIEho07ADerzDJkpPbuuVrf3UV87rWgRC5MpmwedZjls6rLSWyINNCeXjJS1f2LRLh/bRFQEzJXp2Y2k1pVFZ+aOQkMzcQKRjKOvD4MyQVLHwbhFIe/cUZXEQUn9FoWkNMib/0maPQBwegEKKgH0+cpK8UkHZRYatirLOmPyPwPi/hSRZl34GA8FDj6u/HSPPWKjrmYeligCrVOVhlDphUyo+HzRpfKHWl2k+3pPObLszcWAg/E1XoHQg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b30fd5-f7a3-4f2d-2154-08db7d6305d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:45.8156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFkEIkIjSDa1DTFlG0R5lW+AFP/8V8INcWcLTdI6+NsT3wq00BjBQXx8EyOVcYQWuLUQZXIhFQkIkE+gBBSyb+hiz5c5FksEOzIdtZ34u7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-GUID: Hi-HzJ1OiO8ZDyTP2rRobUZiQzDamI9Q
X-Proofpoint-ORIG-GUID: Hi-HzJ1OiO8ZDyTP2rRobUZiQzDamI9Q
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
 arch/parisc/Kconfig | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4cb46d5c64a2..2ef6843aae60 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -339,29 +339,17 @@ config NR_CPUS
 	default "8" if 64BIT
 	default "16"
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  shutdown, so do not be surprised if this code does not
-	  initially work for you.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select KEXEC_ELF
-	help
-	  This enables the kexec_file_load() System call. This is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
 endmenu
 
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+
 source "drivers/parisc/Kconfig"
-- 
2.31.1

