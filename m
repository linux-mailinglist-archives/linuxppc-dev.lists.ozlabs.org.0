Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AD72D03A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:11:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=k2EAwBJK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=axZzRujs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2r80z1cz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=k2EAwBJK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=axZzRujs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg1KD2NSlz306x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 05:02:39 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNlh7000479;
	Mon, 12 Jun 2023 17:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=Syrqcnv2JGPBKYmlsni9YspFfSQWa+CoqBR2kYmHDyA=;
 b=k2EAwBJKmDJgvNzogrMKUMkQkNlNH4NLTCd1AWXkeBmaAmnUOg+Ndn87PjlSmIhI3NqZ
 SmzO2NWsrlj2TtK8rtXO/a3MuqtLitPJhEWVvgiph6m6mhIPRYit2Ws1JA/sOkLS6bcP
 2FItuHsdYTZuwuxTHvl8lqn+4+KURKpTtK3aKIyrwd61caouqzwxhzlfCxm+yUkfHVOX
 agC1zi7BbW1vo52ThZ2hlwVPqhQ4TqrcfwyBXg08uc81GD8Ed0xyDqIEKEYKKcK75+qy
 3SvMrsCNaRcqPCtMHhtfSVsF3gdYwClPLHP5/BpPcgKNhMk6eBNS4W3OXszrFDf/7Y0B kg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4gstue6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:41 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CH4Ml3016344;
	Mon, 12 Jun 2023 17:28:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y0u-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBV6shkd4ETKfXUxa+FruuLjo0Tv+oWgzVkaPOSByQk4UpEsH8Q/A0eS9fb7dJJf0cyDE4wmgO0RFwbpTvJBTZDa30mRcnh3Q2egFBfSYFjSZRnrHleEkcwYlnMd9mK8sQVVP7VK7AUQhyvdSaOOlNYdpVdW1upeg6lUvS+PtCoU1QdUvfMJIG2DvN8h2s8a8ypTS7x+1kpLfZPor3SewB7zrHu3QGoAgDE6pne4gtLXfTfceE8i6TR/3xbO3rhRcf41FD470qaPeLHFhPebrNBVhPAL9k9Cq9y1hlQPD5laEKuvOHlpIp6ZC1L0Tq1P0ON9mG/B1hMqYz75OciDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Syrqcnv2JGPBKYmlsni9YspFfSQWa+CoqBR2kYmHDyA=;
 b=RKMdK+AuBAf665cXOJsTb9ovGmQXCDUtWUyX5o4FSLrIASBUZukMoUKvDoS6tMwISm1JfP1StvX5HAwIgEmmAzN5BEFqD5Ok1LNZWIKUARqrQ6cMRmOcZSvJ4W7IqLk2+ww/aysGMQFQ2ulvK9i3n84c75ho0ZOxZxXJbydw1HeVXOuABdh+zYaO/X8QMIqBfG275RgqHgXcfVjR9D1uLx4Anp30XYSgiCUykR0He8dzQ59CDsiWaq4E7ZHtIDdQnu1ct3Ff1Zkws8nHHd5/Qf9TBdeBHyWUlRulNk5Rxdj5aXUaOc+RI48vT1smo5b3BrfZJjWtuolIVB6KC/AR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Syrqcnv2JGPBKYmlsni9YspFfSQWa+CoqBR2kYmHDyA=;
 b=axZzRujsQF/6wLQvrAhQMnRkrKT8OzqlMuq5GFz0aoCoGfbWFCRRcXW4mq09KwKKz58hIYPZI5m7UTm5Xgg4R8gHWtg+Ok83QMQT+G8bwVjtOe9F17kBoRix/XGZ2Si1CCJ2GQKFvrtd4diJSbLQtTr/XApVJLVauX2lPxdg2mQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:18 +0000
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
Subject: [PATCH v1 01/21] kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:53 -0400
Message-Id: <20230612172805.681179-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:805:de::46) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: dfba2a43-5c5b-4b63-e039-08db6b6a6935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xv+KBBIqZ/OlpoU/SH9FY+eKVpHa6Z6ghCzjJyr6Ul0mqBP/i+oq55gRjhcm7c4HF4kZWC298WSkpavQSx5ZUysSig2453bxRGBqTw4ezpTzlBizmqe1KFqfd5s0NH5+kmP83dVNvBME2DMA5CXJFBme6AhDa9XKQXi1HPbGSIaa6M/0etiv1lMPQZvojFxvIe9k4wBDjfNk/PWpJIFsVvF9eiGNGoFbMyPYnPZaWpAGMP4rdIf6X8ZcVfpi5JZ8PiEZfg0KOtHDBeWQiOnIuArqPKAfHGUR+sZQbTFgRTIbEFQYIh4JdFrTTY+MtQoR2QLZaCD81NMq1dxjfu0vHS/u3eP3I1UpgDIgcjILZ66A5eI1gNSOIBk3EfFVj4V8xNqaKXcNUd8hUGMKWSRFGG43A5Rdwjrh4HEBjS5RE7ZRThVZQjIuiMtQy3RGk2zCnuQv7pvijQo/1EuJSFl0xCjwHSAFZxV2XlSRqsApO3EpMaODlY0UO9M/UTnqfE2yAYfpQaNqOxqyBsG90LaxA1usNCni2rnbKE1MoBQuwPBZ9hWHtVtw0v2cB+BqNnEU3FfEItAoT2iBT8w7oKIi13B/W7dfguIvX/fjzBRvasQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?L6y454z7QqyWngS7ujTGM4IbW0Wvfq1ujjYVn6QIt+a3/XAwWMw2kewxRe5k?=
 =?us-ascii?Q?lQqZeYnR/zXu2KqMBl4pZZVGDO9+4lhLFnFwxWof0I0woBkLyd5z4BnPLKQa?=
 =?us-ascii?Q?dhNVVfbkTYR0DSV1t7yooJvfxjrBcLrLAcFKSj+8288ptl024p/jMuwvNdRr?=
 =?us-ascii?Q?aE6VUr8oi4NWRiOwHBZNQB9UNooEJv00HFN2nBTOZzqbrKFFlKr4o9n9tjjK?=
 =?us-ascii?Q?81p+VbZPevSmQq0ahJT1GJbuyA4fog10wcsGb9bLWFsU9cArprmB3NGepGlq?=
 =?us-ascii?Q?r+XPQmnRFT70ReTwE1HsKy+KWQ1oFBqp+z8oITkaGJ9+P5nnzwWGhe492VNL?=
 =?us-ascii?Q?Sbjs/nakFPlcHk4higG88gszXALkUgPFC+W5vLsMu42VG8CcSrBHEBGLHMzb?=
 =?us-ascii?Q?6AudhmJW5YklQ13VfAzVRdS2tstiIIvLCcMLLWayWassOYjwZy0+E3tSHkmX?=
 =?us-ascii?Q?rzxtAmrhKHKCY49bq9w9Ulj7QN7/QE82mBBso6s9RTUk7DkhVRVwmMcZKaSi?=
 =?us-ascii?Q?oR/eAqupb4wypNHyPQUaka/o9L5iXrGyxtxAGs+xVN5DLOFIGcuLCOEOKGWs?=
 =?us-ascii?Q?sWSPdneMq6Pd/TeJpgbsVGt2MWcO7JIMc7Wqgo/9pGO6mPKXM39YaW/9d6oF?=
 =?us-ascii?Q?ooIYMIZ5Cp94FzhRQPFIsmbGBwYmm0mh5Nj1S0RV4sAtzfNASzsxzTPgu965?=
 =?us-ascii?Q?Nws8voCV3VERRenOY0nCLaiVvlOYQOST1O5delG6RYEM11epB9MSloVQSS38?=
 =?us-ascii?Q?YaFP8IPlzgF3XMvLYIm+3l5SwkmsP57uU08+ZLLs8zcQSz4mTvt4URfsYXXJ?=
 =?us-ascii?Q?dd+jJiV7U5WZOEyOOGbGGWKLmEnquH+ngKnBvLi3cVrvVpUaEao7ia7R5tE+?=
 =?us-ascii?Q?g5jbK8VAi4B4w+34qXq2rMv0Y6yl2Ahtjmj1zFb7zDC+4lGqc685dfhVbJeN?=
 =?us-ascii?Q?5avjU7SB/Bpa1flKLcFO8Fzn1ldDBPPqWY3kVZDaO2jM16vAec5MExLdJP8a?=
 =?us-ascii?Q?mMW1wgIuR01GAVRFEUa2JIEzThekYoVMRwWtmirFwF8o4CerFlEQimqwXHpo?=
 =?us-ascii?Q?VRGFGS72oJ9scnuc1el2Qn27iKSsVGdxck/IeCQK/yvzF4xkACQHYv4V9R49?=
 =?us-ascii?Q?dVSUP/PqWHKMzz6a3b8wIpVVn5Tl4yYWHJ2wPIywNkX1Cx0AJRBHyZZMsvz9?=
 =?us-ascii?Q?+cVgME+Ji5Rf2djzwS5qn0xC7nWL5U6eqJKIamYp6+Rqa/0tBAlLzIiPnIA8?=
 =?us-ascii?Q?8B9LIVAGAkvGBmlFOnwpsDb56GhwhnNzUO7eeP75n94MeswOrMi/zW73J2m0?=
 =?us-ascii?Q?33unouWa6JsviYe3bfagZE8KIZG3Z5J+0p0KTRXveEI4EeNiqWsNVNl5IGUh?=
 =?us-ascii?Q?4pIryn1MkSVxeS8YRCqxDvfosAMLeQ415IxJGLTZBFCN7a6C+CBOiTDcRIrW?=
 =?us-ascii?Q?By4b8IYAbNkHMqKhZz2jzqIR+/QQQwSryna+6YOOABm6SvhCtSzMKbhX4Fu5?=
 =?us-ascii?Q?2Df+1JyTPl0AQjoSA65TqYkR1Kp0/A4BjNMFFLmGGez/fhHunlvXliGkq00F?=
 =?us-ascii?Q?4zgnQjeQUWuZFuPDkUGtwkMP9thHGa+zjK6T4akwP3OT2AURWz34FJK1rluN?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?MU4tTSGfYKuV+4/Zf503CDijS1bQVfTV1mb7KlEc+oJEmmR/J7ZsE5kVRQHt?=
 =?us-ascii?Q?mbWf05Zl0zrYpM8xVX9PdDHxj2SP26yb9UFzYnCKoov8dRTsFzV7YjiGc1c+?=
 =?us-ascii?Q?p4pq/XCJTY/chmukPTxZiWznR70ELji7hmum7v28gPPOCEnU7tUs6EWXYnMh?=
 =?us-ascii?Q?47ImFtw4guczSfwhSSbKPMArSrJZoQ9fz5RUOL5aOdffYUSu5KwNkja/TqaA?=
 =?us-ascii?Q?CLhDiSodYA3WgT/uFMrH4AfRlHNQWj26P1f8hU+Wyf6+20NWVuGWONIh7Ucr?=
 =?us-ascii?Q?EPwT4E7NgYhshpedgB+sIttsM1P4zOl9dLaCiEmNtiq/vBFtwvhLwoGiQZ9W?=
 =?us-ascii?Q?AJ9h8o1faiLhSh4lZbkHUTV5a3Cr9UHbZS7k83wzZ0yuQPTc62CW8/sMdEUX?=
 =?us-ascii?Q?yqmW10qyUSuVw4SipVwD5+MZcElS6RwCWDvYiWUIW2U+xfqjaSoxaKnIodjn?=
 =?us-ascii?Q?XWkE9C6Ov4i1w0b18odpg1gNkk81yKRppmL/7ceFRWa/kcWsxO/hZ1VJ/BEu?=
 =?us-ascii?Q?hpBYkHz13vf+tnrjOcKlDkMJjt8RFM8Q3inpYJTtbM5IJt/c2okpWyWTjFTz?=
 =?us-ascii?Q?Z0IC6ZpOP86axowSW3SuuCwpfpXmY7Ifyp03Lf6WnKx5LM2JGtltoNKFziBe?=
 =?us-ascii?Q?D2zcGDhcOG6PLATHByK+h5H9HrpWtf/hJpa5MKq3VgXcjxVRgz2LDG9PZqrK?=
 =?us-ascii?Q?1AzSUsbQwXeQxCNihnxjhetvT1cRJfrbRmfX0U35U2yhU9Twhc6x0BRR2Eze?=
 =?us-ascii?Q?E4PyHPjuMoqCHD9qM05zSAZOJSVMDWIAZwsQ7H8C1ckYMxkYUXLIKhWYd04x?=
 =?us-ascii?Q?kB1Z4HF3cl2Ibg1pXBgOzlkhx2c3A2hZC7bqHBfxNPuakwM6ldog5us1ZUIz?=
 =?us-ascii?Q?4ZAdHx/dvu8fs0dld1CXcbkEuOcIt5bRT+4NfhdJmlVqH3Z1qk/CLtpTkkc3?=
 =?us-ascii?Q?DSK0MBCrN6+/yBxcV7u8MiJ+Ev8lcGhPBUEaCDfjLwomJywJkHb3lPEi6l65?=
 =?us-ascii?Q?ywzHoreRImtUl+yqAX3qwUZLAEWOs8HIk2u5eGOwICb1+qIKyNW5Y4Zb5zsL?=
 =?us-ascii?Q?aiIrS4WwGl0z20huMZapSjkkEfngfQLQVt1RUnNXx1JxQWxKBG2GKZJjAKOb?=
 =?us-ascii?Q?cksz3K5X6zVzl1dju65lsyZg3CpWIa0/zCGhYtJxHrIOhYDiA1x0zv41ImO5?=
 =?us-ascii?Q?cer2qrXGKQqfdfO72DBXotZ+51kJi0SBDh1rIEN94JsvxgnNxAM0lGGMpWFY?=
 =?us-ascii?Q?VB3seaEWTqXCFLL0UKm3Yl5KEvaPLQoGXYqv/uYPiJbg8qTP+4ho7/ZRdt7b?=
 =?us-ascii?Q?fqkHQnPG5FkBhXJhAd/ZxKT3yd+ZirYl2hyjYeuDERCtE9ShAGKw5IhzlzK0?=
 =?us-ascii?Q?DZHAbRdaWEjob+zRtq8E+qlB1gjtiyYkLx3o8YbFWqlVsivW619nHk0+e2zL?=
 =?us-ascii?Q?g/PtJaERhVK6IaGYyzGh3aHB1YVTryt76r6pJOZJaoV/PGJ6fWSP9Y6sV1Zr?=
 =?us-ascii?Q?nO1lUf9rqhLfw/aWBayjVMZZ6Spv5rcArTuYDJNDAfyqWeVNmWuBJZCvbiEC?=
 =?us-ascii?Q?1P1YUkynJypfSnunVPE7KU2h+XXhrR5jfqwtgo4acWEPKij9WZwXTEjkS5Ll?=
 =?us-ascii?Q?TYwTylweidRV0coGSh1NSpXz2ETupCru/gyazrqD/+Sa45ByPmNVsQs0iChJ?=
 =?us-ascii?Q?fTWhFtQvw5YdUl1Cqk8FnVPxFZIYejv1G4Owhsce5P3ncLLgiI5ZofA164rz?=
 =?us-ascii?Q?Ifl9Yoj0gXPgVDCLUaZcWSn/Luh8a2ikOryayWh7bKB6p5QmAF/IlvERu3Ab?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	5o9UqdbGRqBl1agG2enfkcokYHvBjumcJ7W9iPccKXxbJVvhqGQbqph2IxV4WsuT2oO+CGAJDHSKpCbCN2ym00OgDUEPsgvqxPNb+MgW1I0doMxdEJx7tppu90WkkMZMVH3lZsDIna5kY+oN5qxcmz3V2smcb7LdVRv3pClJfEalUJNEAK1HdzgpR9po9FCdGnIChGhQZzcaX0NxKNvOCUpiZDsmJK9o2q3CrVxZYcsCpsuLHhwZg/udtL3BBA5hG43UpA69oe7P0tB81CYMz+Y3BjU5uxj1CaXu5ePez7t9rXRuJIofqKcgx4GnCEJgjW9iPqsFH2lBc99rROUoh50rsgfTwRzOFeqcDIxJoy/ouiM22y4kTb05s5tWfatq7jHEaS3yjP2upJPIWgII4bck8UWP37KxvlTgKdseMM/+P/MkWtjUvQJzK/liK1d2vh8ZwuXxcDJ1QA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfba2a43-5c5b-4b63-e039-08db6b6a6935
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:18.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsy+YhxEkUA3yw2UZcV66MG1vgFh+g3GVjgbl2VNDseIgCv1DuvOpyiKtNkEhcmCC61YA/8yGE5CGkQcHrZWUoCYi+PbfKhw+kBhXZ1DOiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-GUID: lHNec3d-usDyhsImEnvfSl4ssCLjO0n2
X-Proofpoint-ORIG-GUID: lHNec3d-usDyhsImEnvfSl4ssCLjO0n2
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

The config options for kexec and crash features are consolidated
into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
is a new submenu "Kexec and crash handling" where all the kexec and
crash options that were once in the arch-dependent submenu "Processor
type and features" are now consolidated.

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.

Architectures specify support of certain KEXEC and CRASH features with
similarly named new ARCH_HAS_<option> config options.

Architectures can utilize the new ARCH_SUPPORTS_<option> config
options to specify additional components when <option> is enabled.

To summarize, the ARCH_HAS_<option> permits the <option> to be
enabled, and the ARCH_SUPPORTS_<option> handles side effects (ie.
select statements).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/Kconfig         |  13 ------
 init/Kconfig         |   2 +
 kernel/Kconfig.kexec | 103 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+), 13 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

diff --git a/arch/Kconfig b/arch/Kconfig
index 205fd23e0cad..a37730679730 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
 
 menu "General architecture-dependent options"
 
-config CRASH_CORE
-	bool
-
-config KEXEC_CORE
-	select CRASH_CORE
-	bool
-
-config KEXEC_ELF
-	bool
-
-config HAVE_IMA_KEXEC
-	bool
-
 config ARCH_HAS_SUBPAGE_FAULTS
 	bool
 	help
diff --git a/init/Kconfig b/init/Kconfig
index 32c24950c4ce..4424447e23a5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1917,6 +1917,8 @@ config BINDGEN_VERSION_TEXT
 config TRACEPOINTS
 	bool
 
+source "kernel/Kconfig.kexec"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
new file mode 100644
index 000000000000..660048099865
--- /dev/null
+++ b/kernel/Kconfig.kexec
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Kexec and crash features"
+
+config CRASH_CORE
+	bool
+
+config KEXEC_CORE
+	select CRASH_CORE
+	bool
+
+config KEXEC_ELF
+	bool
+
+config HAVE_IMA_KEXEC
+	bool
+
+config KEXEC
+	bool "Enable kexec system call"
+	default ARCH_DEFAULT_KEXEC
+	depends on ARCH_HAS_KEXEC
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel.  It is like a reboot
+	  but it is independent of the system firmware.   And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  The name comes from the similarity to the exec system call.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  is properly shutdown, so do not be surprised if this code does not
+	  initially work for you.  As of this writing the exact hardware
+	  interface is strongly in flux, so no good recommendation can be
+	  made.
+
+config KEXEC_FILE
+	bool "Enable kexec file based system call"
+	depends on ARCH_HAS_KEXEC_FILE
+	select KEXEC_CORE
+	help
+	  This is new version of kexec system call. This system call is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by previous system call.
+
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on KEXEC_FILE && MODULE_SIG_FORMAT
+	help
+
+	  This option makes the kexec_file_load() syscall check for a valid
+	  signature of the kernel image.  The image can still be loaded without
+	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
+	  there's a signature that we can check, then it must be valid.
+
+	  In addition to this option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
+config KEXEC_SIG_FORCE
+	bool "Require a valid signature in kexec_file_load() syscall"
+	depends on KEXEC_SIG
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+config KEXEC_BZIMAGE_VERIFY_SIG
+	bool "Enable bzImage signature verification support"
+	depends on KEXEC_SIG
+	depends on SIGNED_PE_FILE_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
+	help
+	  Enable bzImage signature verification support.
+
+config KEXEC_JUMP
+	bool "kexec jump"
+	depends on KEXEC && HIBERNATION
+	depends on ARCH_HAS_KEXEC_JUMP
+	help
+	  Jump between original kernel and kexeced kernel and invoke
+	  code in physical address mode via KEXEC
+
+config CRASH_DUMP
+	bool "kernel crash dumps"
+	depends on ARCH_HAS_CRASH_DUMP
+	select KEXEC_CORE
+	select CRASH_CORE
+	help
+	  Generate crash dump after being started by kexec.
+	  This should be normally only set in special crash dump kernels
+	  which are loaded in the main kernel with kexec-tools into
+	  a specially reserved region and then later executed after
+	  a crash by kdump/kexec. The crash dump kernel must be compiled
+	  to a memory address not used by the main kernel or BIOS using
+	  PHYSICAL_START, or it must be built as a relocatable image
+	  (CONFIG_RELOCATABLE=y).
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
+
+	  For s390, this option also enables zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
+endmenu
-- 
2.31.1

