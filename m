Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB807490E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:15:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=QEoTv2Lw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=g8ony7zs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDWd3D9fz3cnR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=QEoTv2Lw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=g8ony7zs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx20l74Tyz30g1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:21:59 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDxTY014207;
	Wed, 5 Jul 2023 14:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=QEoTv2LwZJw/IoE6hAuKbzpZDLJwC7QxBrzJSw+fEnywfgj3zn42KkOLFOgjf8dMQvF7
 /NywAue1CFFrUGtpmVsRA8tONcdXjXtuUASgL8Sw6o5Q/1HObNSZyTSfgk7OIuhJ2QYO
 6BszsBfMHuFIypRr+yX6spwiWi8+TKWu1o0bdvC8EOOL2cyTKIIl0FmKS4Scaee8WGye
 142aDftCekh1ifZY70XjFVoSSDGYWsMI57fhG5Wyx5TiIEPBFSjapAkhJU12pEM/CjMZ
 vxNtl6f5JX92oC7n6FvsZMGiVWO/BJMdMGdUZd7shfbRTwbzTtEUb0avTdCPJ1zYd1cq xw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjajdejuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:11 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsr6033366;
	Wed, 5 Jul 2023 14:21:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5wmaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h08cwzRkj4MxD8/JIX1TWouHhh+3sziwtKox2sCRiXP9NAaDBj6MwDpC2PsTkmR2Sa5+e2ublJ2vRXy2en+uqIFQd6ypwm6JIGypVMFFj9gZKDvrJfL0ou3v6ZW+77AqnWhOnVGo0LTukqU8TBmaMxvC68Hp7e+qQMqROzrxhsHFUpK16/TcsgWBdYpl7DOzHuN0/W1rv4pRHt02uh37Yfi8qe6LVN3HTLW5ywRRLAl9WXY1OjwklpIy8Am7KgeBL5dOtqpcYHSneUyACnzW8u1rIsWlq3EyhzXBO5PHuArW0Q4Y7oXPPLVFnAM9e+1mvEjJaE4E5FQcwxEREJwuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=A223VrxUNom1ww0nLE+gweE5F5cfhBsLXxr0HH7TpIc8sOCjET/zob1aSyRgpJjBQh30lE97r+W1eUkgHD9K4uLe6aUriypV0jEpv94Uy3yxC8hPwqN6WrytEUM1J08zisq17LfRTBwyAA3R8SCCMw8rnN5nq/OMMT/Q9VDXh6PKdx73xp+rNlgAQ2eXd+m39RxjsTH48FFNNwNOICzOkPLk9GEM5/99prnEBWxAH+0IZ4jWJGo9W3FKvrgtusrJo3sQAVEs40LwcfxWg6WXj4Zs1748lU750iorlRXaEoIaevT8bQ+KZNv48BR9Xew112VkjHwQcwvylLUiVYkL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=g8ony7zsvLcCmZG5md6Ne+dONzxRWd35MWfFSL4/uERVhQMAwc6muSL7SWfZ9Zj6yFxkU7l4FRrxGefltUA8fAtncmiMLO7RKSUgvKc/RbO8hugKCBHbpZg4fHxpDGGgdagMkM8b2lbd9lz6kc12he9yFKtXxQwcc2c+ztqzaJY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:21:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:21:05 +0000
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
Subject: [PATCH v4 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:20:04 -0400
Message-Id: <20230705142004.3605799-14-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfc7b2b-3007-45b6-b898-08db7d631181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nAWzC3YM4SwcWanJGNRPLlbsPbMFL0+NvT4Z/h6yiGlKKzeJ/JANVGqyBMUR1Z3QIP8GssVGnWHu+kFcsshW9stSWIb0/5vMSSg9TE0evVJLvBzEnPlypTgJP7e53MkYLZ/vEDvgZTVHLmq00+qMrgdFFYBFU5+bdqb67KGv6wv+Jg+Qm7W593alsFe79BmIwxQ2s6mTo0u2967tIewY0kjRVLulgt6QdyrrST81sJQ9G6L+bBDx2xPaHwr5xCZXmokJjFIQnoHIKg1AUOBK4LjiR9d+ZWf5LDcO0c7oPVuEOu0Z8hiSaWexV+9ZR6kAhYwnKU6rz2tazxrqwBlZXYs87CdGDKAoLMpuyQM+Ccp+avddgSY2o0p1HMdCGwwCbm9M9IhzbenLieOZCdHoXakFiNOnqXLj1XApmFh+OE1vrRX0KwLLnUyskFzRgBtCAtkOxRh3oAm9JcwJeuOWnsU09G76KCY7KzeooIGH3PUN58zQgZkBdXfX6/eMDHaPzHY0NUTWO+n1ks1abh85ipcDvPzHEVFE2Vs7zb45xFsfB7f6Oktwcjs9Kvu/kVLD8GBz2WjEz4EVNx7XeGBdgkL04I9wHt/4NmLFr85wMF8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(41300700001)(107886003)(921005)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oYFaORGpLWauwuCHrqXZ202BVQ9b/e11K+LOnSL5YlBMr43wFpi22oo5FCru?=
 =?us-ascii?Q?FSKrGrJSJhFDmN8DY28XvnLx3KliJwPgJqA5XT2SDWDgZllm2qV4ykA72ibk?=
 =?us-ascii?Q?dzKadPcaeopq+4BlQxacoaudHhbxfOUN8reDbpCp+/XRewJwhGgisq9Qzrcq?=
 =?us-ascii?Q?UUa3va/dqMUgt+Ez/tYFiO43RD+Z4Ympp6qCzQcwPbO7SpxW8JpbX0dCj1dK?=
 =?us-ascii?Q?N9LTvyvzldDQufeFW/hxVwpBiAf86UV1LuvPTSgYFVKVaLXfu4/4iqyQx3xV?=
 =?us-ascii?Q?hRIEERDVT9G9hdNm258IIC76hxjNMWU9kt6OUL34NOZTmvjNcOydYPxMnMxu?=
 =?us-ascii?Q?WUaz55oekVi3B21n+U/s+q9Q6ywtQV57mre1K+notgNoRLszj0WchSlxnUch?=
 =?us-ascii?Q?yV2I54uoa1OlBFEBKUsEncvOm8+VpzfImEdqzXE+kR4RkMdBg5EZmNLHnPmV?=
 =?us-ascii?Q?KWJ6DyuIvrZ5ejGpATVcl/eVk+tmCrpEFBtW3EpwRT0MzpI2JHXZ63dMU9Uy?=
 =?us-ascii?Q?aYzPg5H7W0jnMXhdPg8zSzbq06NuxoEKtj0M/cCCAfm7diSQnPwTFnPX49bf?=
 =?us-ascii?Q?eGfheVhIudfJ2ZeLqNnWhEJMT4nqTEJayr1RO0HE76HAQUvOCUgGGbXjLPOC?=
 =?us-ascii?Q?/GPujhgCjJ4yu8r/GS2TOvlimoNj0q8vOhKAXlt9gR0C10IEWM3XqP0TBxRf?=
 =?us-ascii?Q?p1YB7yHPjb8RHxsbACewWcK2797tQ5Yj1n9Xxrl7KNz7u/RZvSt0tijoFnfk?=
 =?us-ascii?Q?p6zeD9yIjR5qN2NfffNStS0qRmid3Gy5Tsewm4HHttSBTztgLz6Id0nr1UPh?=
 =?us-ascii?Q?+Y0JcyQEqIJ3IpViqrjLXWVPf7CjCw7GE7n+fG+qkZImP5wQ9lxLCZliFRL/?=
 =?us-ascii?Q?hfiEwIkIcXe7qD0jJhv7PQflku5XF0TpsSgVuMG+OmSIX5AbNpZnvGtqds/T?=
 =?us-ascii?Q?hCKKBH/jHwH61bAwHQ8UkwGkPKEIFxsc+sXiJRXK8G/tU0QGhJIFJWz41lgW?=
 =?us-ascii?Q?HRFgGnGP4NKF6jolvyXZoVlCFsfcJmrtcJ3U/tpqVWTDhlD+uwwDJ49Ni9jY?=
 =?us-ascii?Q?Pc0s3zCdD6GCgVnbXS2YACc3oXvL6lBnvyzbyM1kbhVzDr07s82NkQEuax3y?=
 =?us-ascii?Q?WcPK4LNvGhOf63oo2YgaK23TqNNrVWlOmLZAzfvr9qZdaI1lHRzg1LtkOrF6?=
 =?us-ascii?Q?SkBgstgxhqDIQ8WQfqvN2nu/KqfljEB90MRh8DgnaYp9x0KXxrICvfBqjGxZ?=
 =?us-ascii?Q?NqJaKAFeGMSg3wu2erLEqCcbQHaPnFgmw4fCEtOyF0vJyqT8eHWzS27pP5VI?=
 =?us-ascii?Q?vjnMQqqURhAus2jBxGGNqf9etORxP64uatFKNqw1cVuWkg5KLdjpejQiz2hS?=
 =?us-ascii?Q?M/PozeCkJGsEfcy/9wDkMJNa7hU+jyqAxRkQlhip0szbU8BJeZOctWhhvr0q?=
 =?us-ascii?Q?96vUcGniwFIJHTZQdVI7NId/Dd3Y1tBoHbnPE/4W1BX7+Coj1KTPb+FvOK+p?=
 =?us-ascii?Q?Y8D774/fdMoVBPaSsNXCBKgaNcBOmThHGqKx8wrgWsv61DRdDOpKWDKziFR6?=
 =?us-ascii?Q?ZQBJHvH4WnClLTNxjPRgAxTaU21PSKTCZsqFMBtdVio5Fv8NweREIDsmX8XD?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?mO6/RZL34ARG5bvjMX1/trjMdTDmuXj2jhdFK/AfnHX71D7NwHj8DerSSJd8?=
 =?us-ascii?Q?ImQt2wV1mwU1jroSPBIXOv5kafoycp9Jw2WH0DqKwxMp5lS8qGkA1qnjbv3T?=
 =?us-ascii?Q?CYHB+hooae2cgBqJpMNsbUqcaMjjA9bLgssLWlM8NTjWfrvH8JvOa6STIbYl?=
 =?us-ascii?Q?Uz54yqkIAGYxF8mJXOQDg4XmG3lWMtDvXKSGZZ49ci8Crbq9nU7+dkotgPtX?=
 =?us-ascii?Q?Y36hb2Tpj9P4XCPZ1Jr0m9xcWJhXCkh7+na6rJqS0fu+YrwN6hTFILq0xIJx?=
 =?us-ascii?Q?UJZyjxEhJv567Za9ED7ruGg4Yv5tF6HzXqMIod/dZMTlZhdplRZPCocJLTGl?=
 =?us-ascii?Q?nTkmeG/6TIJ+Ht1gAxlr6iDYBFr+urWaV4I+6t5rdeQAFli4tKlMDIHeKSAA?=
 =?us-ascii?Q?SIjon46m+ee6wHvDVm0J011gXG3BrJzDokhPYg6Rds6X6KJ9A9/boGWP00ZD?=
 =?us-ascii?Q?7evJqhBbW+b+nle9SRv5ZVIYK1ltqHY868M8GL+pK15cJw/Ik/qTWsXnlon3?=
 =?us-ascii?Q?Ppg8Shi9Bam0hjo3c/eqjSEV2aJCZ9mVPiXMYpJFDXik7tgGPtzqvlPM1PAI?=
 =?us-ascii?Q?SY73fWiiwTF55iSAcivvcCgNg1MlM9JsLpdUmWdLb21dWlmVzI7i25PPPo5u?=
 =?us-ascii?Q?oHqPTAykscXoU4bQaHxs5Z9jJgUmu5iqVv8xGcjv2ETAUa16NVchZ1y7CPWF?=
 =?us-ascii?Q?JD7nKuQagt52Yl2f/Jqq+/mmQp5bCC+xXcbNb+iP+fYM/SVNzN8YrvVr9zH2?=
 =?us-ascii?Q?aux62rSfkO5WXTAHr0oW6kZfRtTPdZYoBkGZIBEsodE9d4hefKRuACq2/JeY?=
 =?us-ascii?Q?eSgLUQSlMkArOqosnQ0vfo0q/hpJnVtcOwRI1x4oEtZCHqIc965HnLcV4LD/?=
 =?us-ascii?Q?4JBXss4/1cgBZmdvfcoFBi0YfJZuZDIc7XgpscSTW+vcU25Tvk4/3+MmjKSc?=
 =?us-ascii?Q?IGGTBEh5GiAzB03eoi1mru7lCJKm+f2XWsNgivKzMWw1f/IOPSWTl5Dxs8c8?=
 =?us-ascii?Q?nnvvm3V65dvNrB1MdY9Kpi7LFQGoeSgWKOVVpt7L8Ye98pTbq5oU1BpMyvBY?=
 =?us-ascii?Q?ZD1OPzd27kvYQMQKkDrNpddQR+IO/g5uArw0KC/U5epGW8AnEqgIPqi8LAwP?=
 =?us-ascii?Q?UkMGiki/EONMufmEk8+zFIxuHegBHHqHmAehKso9UAnKL2Ci4Cq49elCQ6uF?=
 =?us-ascii?Q?qbvF38Z2G+vVtMc6lZqGwVhEu7n64zJNL3lEbnNI4lA+Z5C/jByUupThUdL9?=
 =?us-ascii?Q?xjLqwGcYYgVGEyhXHl9gucQXf6/xCuekd2KcYhje9ZDOdK81CQpH4YDEFlTg?=
 =?us-ascii?Q?Ynnl6OQZAgD9rQ5nL86BWtOankn0fAzeK3Rc2u6qqHRdwZ0LImhvh+UvZ9ON?=
 =?us-ascii?Q?d1Xm3zIMNHOThlycaw2KCKiYoZkCj6EdO3QwOcUsztwG9Vb7MAIG4L36IHPU?=
 =?us-ascii?Q?7KGCX3b2Y3zLR0mXOTsOrozAbEkDkwR3hajyce7JPmedoZGM4OdNMDtsjtvy?=
 =?us-ascii?Q?uoBLENhK1nTYrBgH98Gsn419+Zd2n3n+sHxna5VFecWIhNQhtjV/LwblLed9?=
 =?us-ascii?Q?vIGu8uNg5v9dXxVsORks54I/szU4nXxh6uoRLeQ6EPg13FXmSdsLe2UEfoJd?=
 =?us-ascii?Q?JdmVMigajom62rDJJ/gSYuxzK9JrQAgO0JDhPlR51QabIcf8KEuxiUsk3Pin?=
 =?us-ascii?Q?K6qjOjUzL+WJZiY92UgHChkM/DnlMWvqQ0Lf3ZOiHOPDObk76AsWGrKnk8z7?=
 =?us-ascii?Q?ehpbTNScSU8dK/qdU6vxt8lmcjUirSWoAKY/y88SJ3h+08E/pmMc1HHjkREC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	dO/KgaDUpXsQmjMjKGm52NEVjOFObB6l4ac2f6z4FwNNuH7I2ETF4iFDsPyyEYtV00wFPRo66Dyrm/6yPsT+m2mBTQS2lOMuimoqrXHoaskURvtYIyMoC4TtHhjiJmjbPVPE6jXIpexUs2MK0mVSXjmgpoej5TGKohWAVU8yRFuPT27gjfxfEmnpjsH67QqU2/Xsa3X5tnuNGlC/xrLgCC3mZPY4luFA64YoZTtXjLHjzaTLQkZyzdjEq5fUVXiT1EX5EI+rYRKjdzH4Bkj6ZUE48FUCl+xwnXc1B8isVTvYvzJU4RVfNhkC8DRQU3Q3a35t2ypr1C6LNppS+yea+dE3vcPsR5H9T/zn959vxPLKGvZL/AH+/NL1L1yhDqlgQrZgL2fRGsePpt3Q4/uOxkSIRG/YOULeAeVEBzJfsnaleJOEmvO54RypqoNcNdIGbD3+y354xQlZKw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfc7b2b-3007-45b6-b898-08db7d631181
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:21:05.4228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwP581bmLo5UWqXTn36dhX/3pcvFriH22c2/XdvaLqdGiCF4PK21q3EkS0HJtigVHRDAavQritPjJyljyA+JRaUCnABq1Mq9aktd7u/UDXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-ORIG-GUID: OYTaOrU2P3GVcSeY8EPrMrUMSXx96MBl
X-Proofpoint-GUID: OYTaOrU2P3GVcSeY8EPrMrUMSXx96MBl
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
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/Kconfig | 46 ++++++++--------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2b3ce4fd3956..1cf6603781c7 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -548,44 +548,14 @@ menu "Kernel features"
 
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

