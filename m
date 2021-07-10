Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EC83C3568
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 18:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMZW23hl4z3c4D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 02:00:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=ByTH60bA;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UJdth1Yh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=ByTH60bA; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=UJdth1Yh; dkim-atps=neutral
X-Greylist: delayed 3816 seconds by postgrey-1.36 at boromir;
 Sun, 11 Jul 2021 01:59:53 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMZVK0Kc8z30BJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 01:59:51 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16AD3WL8015891; Sat, 10 Jul 2021 14:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=xVnjX1GVeq+Z5vKqehmp+nRxFp3HU3RmMBsy54Nujrg=;
 b=ByTH60bAa/yZCnAcBJVt6B+V5OtMfn97COBnf7/oBNS0+JRcC7UITze11vCQafmH8IuB
 5iHPtckb6qcVq4Rm9MdYwulFreK2QP+fzkGGHBIOSG08eEVrbUmzZ0mfQ5oSlcwSjz2r
 FSkTMyDspTtBdqvV7ivssaEtjA5ErLRsj94kGOpaQ7qI4YoWZivBLkXtAcTfbuZTul1t
 5OueUfQma8+f0ZHGYEjf0el6UguJXxAtEdXzBCbcEDXuNRgkvViEw0MswWr+hBvGgdtJ
 jpRAe1NvYABgyKWOWTUh6SNnSF7qagxojo7CKaUZgmJXKOR5p9jOmlYBoVcFs2MzzXAw Rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q3eagfm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Jul 2021 14:55:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16AC7gEQ094739;
 Sat, 10 Jul 2021 14:55:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 39q1kaxrb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Jul 2021 14:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ivg6pZyWjQaF8M2OYxxJD0/UA9CyeMs2Bh5FWbIGlKVmDRThN3+CaN52yCAMJ/r8kA3VE1FskttFeSasd+L0ST1DBnTkxFI9EPKMLLrXvYxdsgwWoaAdSdhwbqpNXLwoJuwnVcqtyshSiMtudZlfw4uR/OHHR9QH1SmhcdYnRMzCdTnTqeJruBKzBPEvWqmRHgO5qZW+8a7blOVzHqMe1IpftuG98ju8r/swZxGesco8NB6g2aSh5ExMNTfyAiehpwo8vHR7Ro7m8+OpCjsnIuRIc6kaQRF5Nmtup7rh5SaR/Ob3FazxkUu4os73ul3X9okNO8K1LUCJZjZO5WB2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVnjX1GVeq+Z5vKqehmp+nRxFp3HU3RmMBsy54Nujrg=;
 b=J53HAXqw0pFlPR1Qiqi9dqleEKT9cdB5fTgtmQRzoXOf4bXRumTIGve5BdLPiyOT45brwvix75lSDtQ8UC1/tEg26neknttOLiXTcQ0kVKmlChuAj10oOKzgC+Bagy8GMELPSSH6UWI5LTjxfrcqUJl6yp6xRwTxLHb6aZTXIMtz68SX/shPcvOJN+lp9dUDElF7NEi3hmeNPe+kPmcWlechnzgooO87vQK8N/GiETPL6RTiBK0ATsdrmHyvpKCxYid1A36FX0uYzdufIBRuj2AkSNACXhI5nH+HcpYgP3AIpwzpw+FaxOhpU2dMHSY7ZbP/XkwOZYPMubxCIH1t1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVnjX1GVeq+Z5vKqehmp+nRxFp3HU3RmMBsy54Nujrg=;
 b=UJdth1YhJmI8GbM5k3Fp8vkHpVEPB48Ixo5yMQRfBAs5TTtjWScy2V8i5Ip6I+ud/Y3/JXkqys6SLAZDKsuJLf1buXrpjYy7HD9iacvs8VZR3zuxqcNdg0aH8gKn56dQUb2qe2DWZW+67+/c/fkXyt9MQil7awKUMNsx2w+IDmE=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1486.namprd10.prod.outlook.com
 (2603:10b6:300:24::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Sat, 10 Jul
 2021 14:55:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Sat, 10 Jul 2021
 14:55:55 +0000
Date: Sat, 10 Jul 2021 17:55:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Maxim Kochetkov <fido_max@inbox.ru>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Message-ID: <202107100655.2aRikOP4-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705111250.1513634-1-fido_max@inbox.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0064.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNAP275CA0064.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23 via Frontend Transport; Sat, 10 Jul 2021 14:55:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a455a18-7a4d-4aeb-a2db-08d943b2d14f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1486555A00062CB3FF137EEE8E179@MWHPR10MB1486.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJv08PkXxv5xhmYqoGqN8oubFHRCV4wdxkFmFwWO8FOfbKwEs4elwJxX3pgpMlKX322TbTIwpsbZxpCL0CXH69wernuDhR5Dd7vw/vXGOauf4kwso4uqC5SABuRQktBpDxB3clVjWicNvb0PFspMQDnSe4GEtSoHudfla+ZVKQyL6E9q0uNjPEutCSiI+4g07PwAsZ30bY0w5C9ZSCG2U1VttPGkU/mZ9PUcuf/1SNmrPlP47doyzTM6RVNni9pSkE+1Mmb0c9tunb95apeT559G5TbQ/r4PhEnBeDCbD742aRl18l5HkVxac7Njlbo0oGrOIvuV81JYrdbg0EIXC8GWdKUw9nRhBWXwxC8wgPRlyqjtKnwhBFfYmEuKSHt+n2hqnFSlgPOkkMYw1MFWOifeKj/8Lk5fT5zInley5g9CbfcCNbER0u3zuGEjdtxnqeyGU7+t823ZDmY1Odfdws1nnhl5WUIPPX3OqEak9eltX/W82A5d4U1vCO+SS+pDFtlnElxinFBNi1n7MSEekVgKCyJmiXcUPuPP7UY/TUsMwepiSixlmlOInsCvmavkIXbM9CKiPtYtBrFVdzUwRcOdsgeNN1l/9mPDJVvDvqxDv/2HKbixmsNHwws0FqO5f9lurSQMWiEL7ZE6xXpSfoZjjIjE8Ls+eR7spBQviflB3XadfR7vLCuLdan2glXWcUAcIlG1lYCB0SWpmSqxSF2SrU8ywTbxW9A/jZL+bWPNKXT4cSOPstFL0iUKLeXdF66N3Ew6Z6TC2xr2ZWXUzaznPjWcpnImieE5v35gbviiRJoDfTc+95TKisyPW2px
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(346002)(366004)(376002)(83380400001)(956004)(7416002)(186003)(26005)(36756003)(316002)(6486002)(2906002)(8936002)(52116002)(4326008)(6496006)(6666004)(86362001)(1076003)(44832011)(38350700002)(66556008)(66476007)(66946007)(966005)(8676002)(38100700002)(4001150100001)(5660300002)(9686003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lCdC7zG7kVV38boHnMJdyrKNpNVvgAlNuOPuymUkhaKQ1uiV9uvJVzvLmig3?=
 =?us-ascii?Q?ijny7Sp8FqBhwcMwfkioCNZNMeTWlwW2aXrveVDRYv4nngAhVNC8Go5yjj4j?=
 =?us-ascii?Q?iyu7syhLSqi25HmgdeTYTBxntPlDpMEXDpbMnQwLwrQxub7T1XIfY3YPAT+R?=
 =?us-ascii?Q?UUwmiFJo/jsO3WFZSkJnA4sehwnBlD0QT4DcIco+KdaRjti3QEF0ycspMtqe?=
 =?us-ascii?Q?izKl7NYvdP/IKrHo+BPez+bP+XBhmbw5X2PAu86WLiVvSAmUeqsNpqcSvppM?=
 =?us-ascii?Q?iXbelL7ttQpxWNKGkSaws52BC4FSvqkGgGuyGVakhfGSUzi2beKnwpakuCBl?=
 =?us-ascii?Q?/Gg5uXaBp+CahOqCBNwiSq96A7bvlnN8MQx5kcLgygr8zscBsZkWy2T/iSpH?=
 =?us-ascii?Q?yTPN19MIwWh25JY4eo9N+4nOniJRCC0T0odVEOO8iIt07955bRe+mgCOY94T?=
 =?us-ascii?Q?UINAhaG0WeW4qPqemj1BDZ99PUWZdjF6+0qAJaGfJht4AgCDzROFstuOdI1N?=
 =?us-ascii?Q?wo8R15j92be3Y0ipg4fujXJeh+trOOM8Id9bZPpNPZ8Oo1NdVqv4bAD6jCyp?=
 =?us-ascii?Q?pOlQTlfYbm7b8yV4sRF2TqBYnb4k2Dm4JM7Wi/5GVrNU6IW9k/F5rxW4W90x?=
 =?us-ascii?Q?dad2aoxC9drmUD/QDAsFMb6v/MNGYo6augX+RdC5qtDPduvHAo+1feAY5l5M?=
 =?us-ascii?Q?cZca7W3REy2YbliJ7WkI9KVStGZQLMeC75MUGw9G1J+1PmsMZA4e9Y0x/NHP?=
 =?us-ascii?Q?ePTtAxkm/7qTfoo28JCgwmPz29nw8F2sAcg0KrEMzxGizME1eax6bPp2JJZZ?=
 =?us-ascii?Q?HLhvJbD00B8KluubqB4zHZ03rgNOjRtvfqsR6XYZKA9mG0pQMB5CvWnM/5Qs?=
 =?us-ascii?Q?fnDw0LpQ6cmEQWiB6nW/TjhJFVZctdYnmoS30GzapQLhFTjSsVEOA6PeEn4S?=
 =?us-ascii?Q?J/8kE7olfW+ERnWYV+6ZAgVLBrZJINgy2m12igBoiJITuAfpXb3B6JSJLalD?=
 =?us-ascii?Q?nRRHUaicT1TzpzIq+Rb4JXCL7Ok53/cLTD3t9Lu/IFm4DkCVbjSASClFZl3m?=
 =?us-ascii?Q?UgueEHmFpAPAP30IclCwwXgpjdVvuQhZW4HXPItHjs+GQD4rAYXYQshmpuF/?=
 =?us-ascii?Q?TWyYqAptUYlafuhaIlsz/u/rQP61Pt1shy69W/wFLi5+XmU6K4JJbNbtbjkZ?=
 =?us-ascii?Q?GZz5IPpNIG+nie8T55l7L9LUXaGa06fYa+CfeLRxkC2STx+E3Vny8Clszevj?=
 =?us-ascii?Q?Oip6IDarwNHwEZbAj99wSfuGvw0mqboKWfEyVYnTEpVqyhu9WwfBBzdNxhgv?=
 =?us-ascii?Q?WbL23+LsaMvBx+csxU1Rv8l3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a455a18-7a4d-4aeb-a2db-08d943b2d14f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2021 14:55:54.9190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93sM1MZ2mO9vOxZDuvfSjXBM39mhnv3zv4LXGjzDSSmKjMJD27gpVP+LLC/f3ELGUdjysAX85nD2X/ivj1Hd7cDabZnYy/tYgGdS0jl1rng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1486
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10040
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107100024
X-Proofpoint-GUID: _y1pVKxSYaZQg1oSBYZvETCIP1iybr51
X-Proofpoint-ORIG-GUID: _y1pVKxSYaZQg1oSBYZvETCIP1iybr51
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, saravanak@google.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-kernel@lists.infradead.org,
 qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Maxim,

url:    https://github.com/0day-ci/linux/commits/Maxim-Kochetkov/soc-fsl-qe-convert-QE-interrupt-controller-to-platform_device/20210705-191227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: openrisc-randconfig-m031-20210709 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/soc/fsl/qe/qe_ic.c:461 qe_ic_init() warn: 'qe_ic->regs' not released on lines: 442.

vim +461 drivers/soc/fsl/qe/qe_ic.c

43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05  408  static int qe_ic_init(struct platform_device *pdev)
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  409  {
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  410  	void (*low_handler)(struct irq_desc *desc);
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  411  	void (*high_handler)(struct irq_desc *desc);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  412  	struct qe_ic *qe_ic;
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  413  	struct resource res;
43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05  414  	struct device_node *node = pdev->dev.of_node;
882c626d1d4650 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  415  	u32 ret;
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  416  
2272a55f16c998 arch/powerpc/sysdev/qe_lib/qe_ic.c Michael Ellerman 2008-05-26  417  	ret = of_address_to_resource(node, 0, &res);
2272a55f16c998 arch/powerpc/sysdev/qe_lib/qe_ic.c Michael Ellerman 2008-05-26  418  	if (ret)
43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05  419  		return -ENODEV;
2272a55f16c998 arch/powerpc/sysdev/qe_lib/qe_ic.c Michael Ellerman 2008-05-26  420  
ea96025a26ab89 arch/powerpc/sysdev/qe_lib/qe_ic.c Anton Vorontsov  2009-07-01  421  	qe_ic = kzalloc(sizeof(*qe_ic), GFP_KERNEL);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  422  	if (qe_ic == NULL)
43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05  423  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  424  
a8db8cf0d894df arch/powerpc/sysdev/qe_lib/qe_ic.c Grant Likely     2012-02-14  425  	qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
a8db8cf0d894df arch/powerpc/sysdev/qe_lib/qe_ic.c Grant Likely     2012-02-14  426  					       &qe_ic_host_ops, qe_ic);
3475dd8a68a7c7 arch/powerpc/sysdev/qe_lib/qe_ic.c Julia Lawall     2009-08-01  427  	if (qe_ic->irqhost == NULL) {
                                                                                            ^^^^^^^^^^^^^^
Does this need to be cleaned up?

3475dd8a68a7c7 arch/powerpc/sysdev/qe_lib/qe_ic.c Julia Lawall     2009-08-01  428  		kfree(qe_ic);
43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05  429  		return -ENODEV;
3475dd8a68a7c7 arch/powerpc/sysdev/qe_lib/qe_ic.c Julia Lawall     2009-08-01  430  	}
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  431  
28f65c11f2ffb3 arch/powerpc/sysdev/qe_lib/qe_ic.c Joe Perches      2011-06-09  432  	qe_ic->regs = ioremap(res.start, resource_size(&res));
                                                                                        ^^^^^^^^^^^^^^^^^^^^^

9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  433  
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  434  	qe_ic->hc_irq = qe_ic_irq_chip;
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  435  
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  436  	qe_ic->virq_high = irq_of_parse_and_map(node, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  437  	qe_ic->virq_low = irq_of_parse_and_map(node, 1);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  438  
10d7930dbb51a8 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  439  	if (!qe_ic->virq_low) {
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  440  		printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
3475dd8a68a7c7 arch/powerpc/sysdev/qe_lib/qe_ic.c Julia Lawall     2009-08-01  441  		kfree(qe_ic);
43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05  442  		return -ENODEV;

Call iounmap() before returning?

9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  443  	}
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  444  	if (qe_ic->virq_high != qe_ic->virq_low) {
523eef1d206a67 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  445  		low_handler = qe_ic_cascade_low;
523eef1d206a67 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  446  		high_handler = qe_ic_cascade_high;
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  447  	} else {
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  448  		low_handler = qe_ic_cascade_muxed_mpic;
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  449  		high_handler = NULL;
4e0e161d3cc403 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  450  	}
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  451  
882c626d1d4650 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  452  	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  453  
ec775d0e70eb6b arch/powerpc/sysdev/qe_lib/qe_ic.c Thomas Gleixner  2011-03-25  454  	irq_set_handler_data(qe_ic->virq_low, qe_ic);
ec775d0e70eb6b arch/powerpc/sysdev/qe_lib/qe_ic.c Thomas Gleixner  2011-03-25  455  	irq_set_chained_handler(qe_ic->virq_low, low_handler);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  456  
10d7930dbb51a8 drivers/soc/fsl/qe/qe_ic.c         Rasmus Villemoes 2019-11-28  457  	if (qe_ic->virq_high && qe_ic->virq_high != qe_ic->virq_low) {
ec775d0e70eb6b arch/powerpc/sysdev/qe_lib/qe_ic.c Thomas Gleixner  2011-03-25  458  		irq_set_handler_data(qe_ic->virq_high, qe_ic);
ec775d0e70eb6b arch/powerpc/sysdev/qe_lib/qe_ic.c Thomas Gleixner  2011-03-25  459  		irq_set_chained_handler(qe_ic->virq_high, high_handler);
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  460  	}
43f09464f68dbb drivers/soc/fsl/qe/qe_ic.c         Maxim Kochetkov  2021-07-05 @461  	return 0;
9865853851313e arch/powerpc/sysdev/qe_lib/qe_ic.c Li Yang          2006-10-03  462  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

