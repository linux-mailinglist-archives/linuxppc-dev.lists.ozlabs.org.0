Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E404F712E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 03:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYkGs6mCLz2yXs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 11:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=XBXAd+sp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=q9TTJqyd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=XBXAd+sp; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=q9TTJqyd; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYkG51qtKz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 11:25:16 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236JxCjd014737; 
 Thu, 7 Apr 2022 00:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=mk3bST2LdEJgJrwU5hj0qhsWCMln+w9W1TSOlBEcxF8=;
 b=XBXAd+spGjebDMqS5XyPYAgXMLKiMfggoodVjjQTn+71Z732/t/9tbgz9VVzsT/a7uGL
 kwIxlCESf5BUy+bVM5eBP9ffuwDr8EJWldp0dmlwOnBOYbexzYf1Vbu6Gjb6prNkYIcO
 teczSIzg/lbSEXLLYATOgM2Q+BZWKp3ZeVesHT738sZw8nOaG2NPdwnclYBgYVu0uzoB
 5fWVDa028g+VLpQsvB2cEoUMgY6dXuekL5hzixy3l/cM18UcSUyL8C+dhTijlP3uJr62
 nl+kVsma4bjhgyb1fVxQqqlonAXaMZhdd0BZ3wEEofI98Agj1B8dWrM57eOgLLqz/o8o +Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6ec9t711-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 00:20:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2370Gvp6035271; Thu, 7 Apr 2022 00:20:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f974dghn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 00:20:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdXsHIK+9dNPHCZ9ukamixyte5t+lvXscpq1mkD7UGAgTZJzFi4lkj/Rkk3qeXU20QjqeVcPoLmdQawnA6M+LReZmn81S3rQatGbRRfUxVcU9kksytl0tACwMY0LVZYCQuPk9gOac5M0qS/E+qzwPzdh15zYXdkQog5B1OozlSOWSN74OmTspj5Ria1a5YWbzP2ZSLafz7w6SVAQf45rgykEeQwekIJF0NmmsCf2KmDeFa1OQHIDxmNbBO9rP4cHOXkNDuLED+gvnyt7ukIxiJcGpXHeOmiT6bZKbybsra/Xh1k4RGzSAxAQchhKQcjYsrx2z0Pmo/obAEQglgDMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk3bST2LdEJgJrwU5hj0qhsWCMln+w9W1TSOlBEcxF8=;
 b=c/JjNXvVu5w3nrms15vOpSOPWfBmRIF14aXo0dQZwGoolbnmwthm3vVUKEfEJcIjghcxe2qUmSz+Drii0ZYyWnSQZHbi1/WZ73vWy4iKXe3sr0H3O9yo5KR3N08TsbT2OXRxom4ye8idJCC+hMPf3Nxu4xZK8NGQtMuB/YBfv4vAD3J8XD8z+vPfACvpxV8OLXSegvGogWzjhcNjBXWr9N8K0444PjbCwOx1Pt5Oz0zB1uLu0O466f3/cVXeu7TDGL6z7J+JTymk24y5XXrJT9glQCMVUOp7AMrZDOzUttqh3xUsygM/WoFXztMlw1FgLqUzmLbS3ioR29eIuMDa1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk3bST2LdEJgJrwU5hj0qhsWCMln+w9W1TSOlBEcxF8=;
 b=q9TTJqydGvKnUbnxO5da9v1U4OGoUF7Cey3boFSvrnYXpAdl9MRBz+hVWw+MOVSpSOc/PnDkdwVJeoby0NhTlP4hm+GroPjofbmquFctTRpHgoAgW92Rg7zBdzA8lZzm0ybqA6yhY96hVk8cOFjTz4IPPAiob4mqvwu9r5Q2JQI=
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by DM6PR10MB2956.namprd10.prod.outlook.com (2603:10b6:5:69::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 00:20:20 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::b180:d8da:faa9:f897]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::b180:d8da:faa9:f897%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 00:20:19 +0000
Date: Wed, 6 Apr 2022 20:20:14 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/15] x86: remove the IOMMU table infrastructure
Message-ID: <Yk4uPrrtCxwl3hPX@char.us.oracle.com>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-8-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404050559.132378-8-hch@lst.de>
X-ClientProxiedBy: MN2PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:208:120::24) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16e19221-5996-4e90-6829-08da182c65e9
X-MS-TrafficTypeDiagnostic: DM6PR10MB2956:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB29566279EE03FA489A2606AE89E69@DM6PR10MB2956.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HxxlzuPrRhbu0pN1jQy4U+yleqQxwuezNafnkZSqyB9Uvt6+a9JiUutoBnqH7wWyR0NqLXAL/NfuqnIGxrELdf4VVS3fO8C/SlhI2x1wgm+0IPJno2D6aSH/DqGXvf5my/y7crRWshVbbIykmdn27jkSCQS52OSE8xnhJvvlNq1p7lJzHO7dlwrNJlotd/9Yh/7rBxk7e365iaiLMwuUi2z3kuqDaC/9Jvq+zIgnZXOSnwdVcg6t5mwKwer2feb2CE3cJ06r7T9HbWyjeY8VS/YnVaYcLTucTQepuFIXbwBi2XohzzfxDLP0kk3WUzmwgea1Nig35MYUMevjWE1fKPSKipHCDIwLxCXBemGEr8I6P+k6AD2rbiRa/uTulwzIsYtyg/xEJY8BzN/C+AYAsn3zQ0NlyYXYk7K5INICt65qmaGP42T98EjYeye80+GoSH0z2/VKQpwIot4eJerfDlHu/DSELMn5qVhKaN9+Zzde/eowh+t1R0IS4/KPUxIKxXjONNFjNvISpl2cgCNH2hJH9n8HWm7Yag4HlUXupkHLycCrT/HvFfy5BpGkZjrQRwTHI3l3jtlJd/QmSoIbvtUNsE3PALQGO4lM0/DQIP394Rsvfwta3kXkrx2ZSdQcaW4K/4muQwJjDrCns0MmayxLFxvpVWfYL/TAX3fuMGzs+qLWiPcpoFzvTh/rbWe0AjRfx0LxWwMG92hMFeI9jgjp0Acu1pUzDIx54f/R28c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(38350700002)(54906003)(6486002)(508600001)(6916009)(6666004)(7416002)(52116002)(30864003)(316002)(5660300002)(6506007)(6512007)(2906002)(83380400001)(8936002)(186003)(86362001)(4326008)(26005)(66946007)(66476007)(66556008)(8676002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QPDHV93eg3AbCwOHVDnv01iCH1wgK0tQUZ9lCSO6xiMJ63+8EO8NqBGc+WMc?=
 =?us-ascii?Q?musMoEpd8Nux+iMUNqkSZwA4voJcz9FkY6x3oSsIlDLF44XE7nQ2OlPPyhNv?=
 =?us-ascii?Q?7/LhdLv0focGt7W9v5QXAECOiuQwpH7jM7R6Azzp/KW8rdNX6ZN7fDcMsaVr?=
 =?us-ascii?Q?Uw1f8thndQvHjthLwD9FeEgKCbbVf2ogHnr2zzdauTPM9+B405aqU5exWUnE?=
 =?us-ascii?Q?FBF202IiSrrBb+ICnkvbXzRCPG52r+UzU/AVPNNosAXh+ZUgFUaUK3qdTyaT?=
 =?us-ascii?Q?AVThwAuqw8o7ko6qa84NY0+YIVhiWrK/h1Plv12AxXocc7kA3iZBtmrTImvK?=
 =?us-ascii?Q?kn663siaJJb4KhSTHv/SvuTP6QQ25Zk3uVG1KUCAvQHev75nR6Wwvjp19TNI?=
 =?us-ascii?Q?+riI5gaJqvlhSG+7xm4O2wSWbpx3hdicVbGjtl1f5+i4nBDvxus5EfjGpurw?=
 =?us-ascii?Q?gKvLrEJ2X5JZuOyraW0y62Qtpqe8NB4K+Etbex+VrCPTNXwK2ylhFbLwKL5O?=
 =?us-ascii?Q?wg+PUkIdJ0/oxrdAnlQoKtyurus0bvlhio0nhVmgBQrDqmyLEqNd1n5rFeDz?=
 =?us-ascii?Q?XQcI/e80BXPTTXrZ4UYp5dif+NAjn31aPDXvyk4d01WETLB+9uXLV3N7rGoN?=
 =?us-ascii?Q?Y2QBUia8kOUes+G2sztGOSfE6iV7gJmJounNvYLrvo1Yv8fu4NJQZDTAfZc1?=
 =?us-ascii?Q?zA0VR7HaTqor7v7BCmX6TfG5iFhDlbK3ULKhurrCwdWuY+NVCn/BefmZWJDz?=
 =?us-ascii?Q?bAlcCIXYSn8vxvFRX+UbStNJ+QoUzlIf51R1c2Jd5CfB2A+s1AcbZOkCFsvz?=
 =?us-ascii?Q?M2OCFa+y/GvzNZNU32p5uRq4h9uqCSfpwy2OkseoXvWzmcu0GTsljqF+K/1G?=
 =?us-ascii?Q?m4998MWZSzZluA5B2wVNewN/4WC6hlY4RFmPXZsA4Y6PgWJ9UM9bBMi1uho9?=
 =?us-ascii?Q?Qc3BszX2m5vxHw9UJ1kYkPh+WVDVnrjBYLiJd3Uwm2xE8nXC1sytul04jxwq?=
 =?us-ascii?Q?umqYlWUgvn6EUHGhpnXPQSga5q/j5DuBVUbdnHmMQjgAauLCQ/mObk3zd3es?=
 =?us-ascii?Q?H/sBXnBTyaiOQ5rpqGp5YXOO8pR/NW6bgpSNQ7ACLarnR/L+LDyu5eQxOU68?=
 =?us-ascii?Q?HJp7xYTjop6GcSzwvu2P7OWGYaDGTa9CU+0tQUOZT6hU6BEkxh5wW48W1Rt5?=
 =?us-ascii?Q?Pj5nB+UfCbyjNBKAUV94YorrsA4UORIlHHhWHSkZvy80j0EP2EMh+0FdE/FM?=
 =?us-ascii?Q?T2lUbSHVZPXjBhhVokGAQpU6jTlFxFtYdxGcTqH4It21kXj/KqcB3enuG1qC?=
 =?us-ascii?Q?B4MoDaX6UJhTRiewvPdn46FvRuTHoMo//P4g8HbIe2vJq1dgH/CZLnJ4HnsD?=
 =?us-ascii?Q?98AMtIc5MTBLMCXyl7eEKf89zoRt9FgP8prJE3AdseXBEx7oqajwidbquA+u?=
 =?us-ascii?Q?IZ+Cxp3aRvG42oSTR9IPzxe1JlIuESAvzmMu3XHf/yrRtf2qtMXok/7COL5k?=
 =?us-ascii?Q?WbrwKoJwEQ2y4RuqgBF07J6ERRmadzn6Z+LsWbV9I2joXBtf+JMZuOgEIhjH?=
 =?us-ascii?Q?EMJgp+1w0M/zbntufN+ZO9ecmabyCazIn5CYkPygJQIzVTJhrUnUI1SsGSsn?=
 =?us-ascii?Q?0eUumQfxicX2svTQm/9E63K41TuPk7jH29uIpktO8rQM74Q320VEUOLcQA4W?=
 =?us-ascii?Q?qcMhBTQz6IY+NO25DwM2EoAb+UOB3B7JrJT0moheiH5EE5PWzDGjMbYCnWB5?=
 =?us-ascii?Q?d/Bd/feo49hZVVcxTRCyh2Go7r7P4DE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e19221-5996-4e90-6829-08da182c65e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 00:20:19.6425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj9PJLDf/UBSfpVnelsQIZAiIsS3Ecw0CDgVWH/Ibvwm9VkvK3xOO+/vorLEIfj2zZ82wLoiuJ1UaeefEBc7Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2956
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070000
X-Proofpoint-GUID: ytAdH73P7jBCZtsat6az2JD-IJ9dJFDh
X-Proofpoint-ORIG-GUID: ytAdH73P7jBCZtsat6az2JD-IJ9dJFDh
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, linux-hyperv@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 04, 2022 at 07:05:51AM +0200, Christoph Hellwig wrote:
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
> 
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Hey Christoph,

There is a bit of background behind this - this whole IOMMU table
dynamic was done as at that point of time the pci_iommu_alloc was getting
way to unwieldy - and there needed to be a more 'structured' way with
dependencies.

Hence this creation... But as Christoph points out - it has gotten out
of hand. So smashing it back to a more simplistic mechanism is good.

Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Thank you!

> ---
>  arch/ia64/include/asm/iommu_table.h    |   7 --
>  arch/x86/include/asm/dma-mapping.h     |   1 -
>  arch/x86/include/asm/gart.h            |   5 +-
>  arch/x86/include/asm/iommu.h           |   6 ++
>  arch/x86/include/asm/iommu_table.h     | 102 -----------------------
>  arch/x86/include/asm/swiotlb.h         |  30 -------
>  arch/x86/include/asm/xen/swiotlb-xen.h |   2 -
>  arch/x86/kernel/Makefile               |   2 -
>  arch/x86/kernel/amd_gart_64.c          |   5 +-
>  arch/x86/kernel/aperture_64.c          |  14 ++--
>  arch/x86/kernel/pci-dma.c              | 107 ++++++++++++++++++++-----
>  arch/x86/kernel/pci-iommu_table.c      |  77 ------------------
>  arch/x86/kernel/pci-swiotlb.c          |  77 ------------------
>  arch/x86/kernel/tboot.c                |   1 -
>  arch/x86/kernel/vmlinux.lds.S          |  12 ---
>  arch/x86/xen/Makefile                  |   2 -
>  arch/x86/xen/pci-swiotlb-xen.c         |  96 ----------------------
>  drivers/iommu/amd/init.c               |   6 --
>  drivers/iommu/amd/iommu.c              |   5 +-
>  drivers/iommu/intel/dmar.c             |   6 +-
>  include/linux/dmar.h                   |   6 +-
>  21 files changed, 110 insertions(+), 459 deletions(-)
>  delete mode 100644 arch/ia64/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/swiotlb.h
>  delete mode 100644 arch/x86/kernel/pci-iommu_table.c
>  delete mode 100644 arch/x86/kernel/pci-swiotlb.c
>  delete mode 100644 arch/x86/xen/pci-swiotlb-xen.c
> 
> diff --git a/arch/ia64/include/asm/iommu_table.h b/arch/ia64/include/asm/iommu_table.h
> deleted file mode 100644
> index cc96116ac276a..0000000000000
> --- a/arch/ia64/include/asm/iommu_table.h
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_IA64_IOMMU_TABLE_H
> -#define _ASM_IA64_IOMMU_TABLE_H
> -
> -#define IOMMU_INIT_POST(_detect)
> -
> -#endif /* _ASM_IA64_IOMMU_TABLE_H */
> diff --git a/arch/x86/include/asm/dma-mapping.h b/arch/x86/include/asm/dma-mapping.h
> index bb1654fe0ce74..256fd8115223d 100644
> --- a/arch/x86/include/asm/dma-mapping.h
> +++ b/arch/x86/include/asm/dma-mapping.h
> @@ -9,7 +9,6 @@
>  
>  #include <linux/scatterlist.h>
>  #include <asm/io.h>
> -#include <asm/swiotlb.h>
>  
>  extern int iommu_merge;
>  extern int panic_on_overflow;
> diff --git a/arch/x86/include/asm/gart.h b/arch/x86/include/asm/gart.h
> index 3185565743459..5af8088a10df6 100644
> --- a/arch/x86/include/asm/gart.h
> +++ b/arch/x86/include/asm/gart.h
> @@ -38,7 +38,7 @@ extern int gart_iommu_aperture_disabled;
>  extern void early_gart_iommu_check(void);
>  extern int gart_iommu_init(void);
>  extern void __init gart_parse_options(char *);
> -extern int gart_iommu_hole_init(void);
> +void gart_iommu_hole_init(void);
>  
>  #else
>  #define gart_iommu_aperture            0
> @@ -51,9 +51,8 @@ static inline void early_gart_iommu_check(void)
>  static inline void gart_parse_options(char *options)
>  {
>  }
> -static inline int gart_iommu_hole_init(void)
> +static inline void gart_iommu_hole_init(void)
>  {
> -	return -ENODEV;
>  }
>  #endif
>  
> diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
> index bf1ed2ddc74bd..dba89ed40d38d 100644
> --- a/arch/x86/include/asm/iommu.h
> +++ b/arch/x86/include/asm/iommu.h
> @@ -9,6 +9,12 @@
>  extern int force_iommu, no_iommu;
>  extern int iommu_detected;
>  
> +#ifdef CONFIG_SWIOTLB
> +extern bool x86_swiotlb_enable;
> +#else
> +#define x86_swiotlb_enable false
> +#endif
> +
>  /* 10 seconds */
>  #define DMAR_OPERATION_TIMEOUT ((cycles_t) tsc_khz*10*1000)
>  
> diff --git a/arch/x86/include/asm/iommu_table.h b/arch/x86/include/asm/iommu_table.h
> deleted file mode 100644
> index 1fb3fd1a83c25..0000000000000
> --- a/arch/x86/include/asm/iommu_table.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_IOMMU_TABLE_H
> -#define _ASM_X86_IOMMU_TABLE_H
> -
> -#include <asm/swiotlb.h>
> -
> -/*
> - * History lesson:
> - * The execution chain of IOMMUs in 2.6.36 looks as so:
> - *
> - *            [xen-swiotlb]
> - *                 |
> - *         +----[swiotlb *]--+
> - *        /         |         \
> - *       /          |          \
> - *    [GART]     [Calgary]  [Intel VT-d]
> - *     /
> - *    /
> - * [AMD-Vi]
> - *
> - * *: if SWIOTLB detected 'iommu=soft'/'swiotlb=force' it would skip
> - * over the rest of IOMMUs and unconditionally initialize the SWIOTLB.
> - * Also it would surreptitiously initialize set the swiotlb=1 if there were
> - * more than 4GB and if the user did not pass in 'iommu=off'. The swiotlb
> - * flag would be turned off by all IOMMUs except the Calgary one.
> - *
> - * The IOMMU_INIT* macros allow a similar tree (or more complex if desired)
> - * to be built by defining who we depend on.
> - *
> - * And all that needs to be done is to use one of the macros in the IOMMU
> - * and the pci-dma.c will take care of the rest.
> - */
> -
> -struct iommu_table_entry {
> -	initcall_t	detect;
> -	initcall_t	depend;
> -	void		(*early_init)(void); /* No memory allocate available. */
> -	void		(*late_init)(void); /* Yes, can allocate memory. */
> -#define IOMMU_FINISH_IF_DETECTED (1<<0)
> -#define IOMMU_DETECTED		 (1<<1)
> -	int		flags;
> -};
> -/*
> - * Macro fills out an entry in the .iommu_table that is equivalent
> - * to the fields that 'struct iommu_table_entry' has. The entries
> - * that are put in the .iommu_table section are not put in any order
> - * hence during boot-time we will have to resort them based on
> - * dependency. */
> -
> -
> -#define __IOMMU_INIT(_detect, _depend, _early_init, _late_init, _finish)\
> -	static const struct iommu_table_entry				\
> -		__iommu_entry_##_detect __used				\
> -	__attribute__ ((unused, __section__(".iommu_table"),		\
> -			aligned((sizeof(void *)))))	\
> -	= {_detect, _depend, _early_init, _late_init,			\
> -	   _finish ? IOMMU_FINISH_IF_DETECTED : 0}
> -/*
> - * The simplest IOMMU definition. Provide the detection routine
> - * and it will be run after the SWIOTLB and the other IOMMUs
> - * that utilize this macro. If the IOMMU is detected (ie, the
> - * detect routine returns a positive value), the other IOMMUs
> - * are also checked. You can use IOMMU_INIT_POST_FINISH if you prefer
> - * to stop detecting the other IOMMUs after yours has been detected.
> - */
> -#define IOMMU_INIT_POST(_detect)					\
> -	__IOMMU_INIT(_detect, pci_swiotlb_detect_4gb,  NULL, NULL, 0)
> -
> -#define IOMMU_INIT_POST_FINISH(detect)					\
> -	__IOMMU_INIT(_detect, pci_swiotlb_detect_4gb,  NULL, NULL, 1)
> -
> -/*
> - * A more sophisticated version of IOMMU_INIT. This variant requires:
> - *  a). A detection routine function.
> - *  b). The name of the detection routine we depend on to get called
> - *      before us.
> - *  c). The init routine which gets called if the detection routine
> - *      returns a positive value from the pci_iommu_alloc. This means
> - *      no presence of a memory allocator.
> - *  d). Similar to the 'init', except that this gets called from pci_iommu_init
> - *      where we do have a memory allocator.
> - *
> - * The standard IOMMU_INIT differs from the IOMMU_INIT_FINISH variant
> - * in that the former will continue detecting other IOMMUs in the call
> - * list after the detection routine returns a positive number, while the
> - * latter will stop the execution chain upon first successful detection.
> - * Both variants will still call the 'init' and 'late_init' functions if
> - * they are set.
> - */
> -#define IOMMU_INIT_FINISH(_detect, _depend, _init, _late_init)		\
> -	__IOMMU_INIT(_detect, _depend, _init, _late_init, 1)
> -
> -#define IOMMU_INIT(_detect, _depend, _init, _late_init)			\
> -	__IOMMU_INIT(_detect, _depend, _init, _late_init, 0)
> -
> -void sort_iommu_table(struct iommu_table_entry *start,
> -		      struct iommu_table_entry *finish);
> -
> -void check_iommu_entries(struct iommu_table_entry *start,
> -			 struct iommu_table_entry *finish);
> -
> -#endif /* _ASM_X86_IOMMU_TABLE_H */
> diff --git a/arch/x86/include/asm/swiotlb.h b/arch/x86/include/asm/swiotlb.h
> deleted file mode 100644
> index ff6c92eff035a..0000000000000
> --- a/arch/x86/include/asm/swiotlb.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_SWIOTLB_H
> -#define _ASM_X86_SWIOTLB_H
> -
> -#include <linux/swiotlb.h>
> -
> -#ifdef CONFIG_SWIOTLB
> -extern int swiotlb;
> -extern int __init pci_swiotlb_detect_override(void);
> -extern int __init pci_swiotlb_detect_4gb(void);
> -extern void __init pci_swiotlb_init(void);
> -extern void __init pci_swiotlb_late_init(void);
> -#else
> -#define swiotlb 0
> -static inline int pci_swiotlb_detect_override(void)
> -{
> -	return 0;
> -}
> -static inline int pci_swiotlb_detect_4gb(void)
> -{
> -	return 0;
> -}
> -static inline void pci_swiotlb_init(void)
> -{
> -}
> -static inline void pci_swiotlb_late_init(void)
> -{
> -}
> -#endif
> -#endif /* _ASM_X86_SWIOTLB_H */
> diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
> index 66b4ddde77430..e5a90b42e4dde 100644
> --- a/arch/x86/include/asm/xen/swiotlb-xen.h
> +++ b/arch/x86/include/asm/xen/swiotlb-xen.h
> @@ -3,10 +3,8 @@
>  #define _ASM_X86_SWIOTLB_XEN_H
>  
>  #ifdef CONFIG_SWIOTLB_XEN
> -extern int __init pci_xen_swiotlb_detect(void);
>  extern int pci_xen_swiotlb_init_late(void);
>  #else
> -#define pci_xen_swiotlb_detect NULL
>  static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
>  #endif
>  
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index c41ef42adbe8a..e17b7e92a3fa3 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -68,7 +68,6 @@ obj-y			+= bootflag.o e820.o
>  obj-y			+= pci-dma.o quirks.o topology.o kdebugfs.o
>  obj-y			+= alternative.o i8253.o hw_breakpoint.o
>  obj-y			+= tsc.o tsc_msr.o io_delay.o rtc.o
> -obj-y			+= pci-iommu_table.o
>  obj-y			+= resource.o
>  obj-y			+= irqflags.o
>  obj-y			+= static_call.o
> @@ -134,7 +133,6 @@ obj-$(CONFIG_PCSPKR_PLATFORM)	+= pcspeaker.o
>  
>  obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
>  
> -obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
>  obj-$(CONFIG_OF)			+= devicetree.o
>  obj-$(CONFIG_UPROBES)			+= uprobes.o
>  
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index ed837383de5c8..194d54eed5376 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -38,11 +38,9 @@
>  #include <asm/iommu.h>
>  #include <asm/gart.h>
>  #include <asm/set_memory.h>
> -#include <asm/swiotlb.h>
>  #include <asm/dma.h>
>  #include <asm/amd_nb.h>
>  #include <asm/x86_init.h>
> -#include <asm/iommu_table.h>
>  
>  static unsigned long iommu_bus_base;	/* GART remapping area (physical) */
>  static unsigned long iommu_size;	/* size of remapping area bytes */
> @@ -808,7 +806,7 @@ int __init gart_iommu_init(void)
>  	flush_gart();
>  	dma_ops = &gart_dma_ops;
>  	x86_platform.iommu_shutdown = gart_iommu_shutdown;
> -	swiotlb = 0;
> +	x86_swiotlb_enable = false;
>  
>  	return 0;
>  }
> @@ -842,4 +840,3 @@ void __init gart_parse_options(char *p)
>  		}
>  	}
>  }
> -IOMMU_INIT_POST(gart_iommu_hole_init);
> diff --git a/arch/x86/kernel/aperture_64.c b/arch/x86/kernel/aperture_64.c
> index af3ba08b684b5..7a5630d904b23 100644
> --- a/arch/x86/kernel/aperture_64.c
> +++ b/arch/x86/kernel/aperture_64.c
> @@ -392,7 +392,7 @@ void __init early_gart_iommu_check(void)
>  
>  static int __initdata printed_gart_size_msg;
>  
> -int __init gart_iommu_hole_init(void)
> +void __init gart_iommu_hole_init(void)
>  {
>  	u32 agp_aper_base = 0, agp_aper_order = 0;
>  	u32 aper_size, aper_alloc = 0, aper_order = 0, last_aper_order = 0;
> @@ -401,11 +401,11 @@ int __init gart_iommu_hole_init(void)
>  	int i, node;
>  
>  	if (!amd_gart_present())
> -		return -ENODEV;
> +		return;
>  
>  	if (gart_iommu_aperture_disabled || !fix_aperture ||
>  	    !early_pci_allowed())
> -		return -ENODEV;
> +		return;
>  
>  	pr_info("Checking aperture...\n");
>  
> @@ -491,10 +491,8 @@ int __init gart_iommu_hole_init(void)
>  			 * and fixed up the northbridge
>  			 */
>  			exclude_from_core(last_aper_base, last_aper_order);
> -
> -			return 1;
>  		}
> -		return 0;
> +		return;
>  	}
>  
>  	if (!fallback_aper_force) {
> @@ -527,7 +525,7 @@ int __init gart_iommu_hole_init(void)
>  			panic("Not enough memory for aperture");
>  		}
>  	} else {
> -		return 0;
> +		return;
>  	}
>  
>  	/*
> @@ -561,6 +559,4 @@ int __init gart_iommu_hole_init(void)
>  	}
>  
>  	set_up_gart_resume(aper_order, aper_alloc);
> -
> -	return 1;
>  }
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index de234e7a8962e..df96926421be0 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -7,13 +7,16 @@
>  #include <linux/memblock.h>
>  #include <linux/gfp.h>
>  #include <linux/pci.h>
> +#include <linux/amd-iommu.h>
>  
>  #include <asm/proto.h>
>  #include <asm/dma.h>
>  #include <asm/iommu.h>
>  #include <asm/gart.h>
>  #include <asm/x86_init.h>
> -#include <asm/iommu_table.h>
> +
> +#include <xen/xen.h>
> +#include <xen/swiotlb-xen.h>
>  
>  static bool disable_dac_quirk __read_mostly;
>  
> @@ -34,24 +37,83 @@ int no_iommu __read_mostly;
>  /* Set this to 1 if there is a HW IOMMU in the system */
>  int iommu_detected __read_mostly = 0;
>  
> -extern struct iommu_table_entry __iommu_table[], __iommu_table_end[];
> +#ifdef CONFIG_SWIOTLB
> +bool x86_swiotlb_enable;
> +
> +static void __init pci_swiotlb_detect(void)
> +{
> +	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
> +	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
> +		x86_swiotlb_enable = true;
> +
> +	/*
> +	 * Set swiotlb to 1 so that bounce buffers are allocated and used for
> +	 * devices that can't support DMA to encrypted memory.
> +	 */
> +	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
> +		x86_swiotlb_enable = true;
> +
> +	if (swiotlb_force == SWIOTLB_FORCE)
> +		x86_swiotlb_enable = true;
> +}
> +#else
> +static inline void __init pci_swiotlb_detect(void)
> +{
> +}
> +#endif /* CONFIG_SWIOTLB */
> +
> +#ifdef CONFIG_SWIOTLB_XEN
> +static bool xen_swiotlb;
> +
> +static void __init pci_xen_swiotlb_init(void)
> +{
> +	if (!xen_initial_domain() && !x86_swiotlb_enable &&
> +	    swiotlb_force != SWIOTLB_FORCE)
> +		return;
> +	x86_swiotlb_enable = true;
> +	xen_swiotlb = true;
> +	xen_swiotlb_init_early();
> +	dma_ops = &xen_swiotlb_dma_ops;
> +	if (IS_ENABLED(CONFIG_PCI))
> +		pci_request_acs();
> +}
> +
> +int pci_xen_swiotlb_init_late(void)
> +{
> +	int rc;
> +
> +	if (xen_swiotlb)
> +		return 0;
> +
> +	rc = xen_swiotlb_init();
> +	if (rc)
> +		return rc;
> +
> +	/* XXX: this switches the dma ops under live devices! */
> +	dma_ops = &xen_swiotlb_dma_ops;
> +	if (IS_ENABLED(CONFIG_PCI))
> +		pci_request_acs();
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
> +#else
> +static inline void __init pci_xen_swiotlb_init(void)
> +{
> +}
> +#endif /* CONFIG_SWIOTLB_XEN */
>  
>  void __init pci_iommu_alloc(void)
>  {
> -	struct iommu_table_entry *p;
> -
> -	sort_iommu_table(__iommu_table, __iommu_table_end);
> -	check_iommu_entries(__iommu_table, __iommu_table_end);
> -
> -	for (p = __iommu_table; p < __iommu_table_end; p++) {
> -		if (p && p->detect && p->detect() > 0) {
> -			p->flags |= IOMMU_DETECTED;
> -			if (p->early_init)
> -				p->early_init();
> -			if (p->flags & IOMMU_FINISH_IF_DETECTED)
> -				break;
> -		}
> +	if (xen_pv_domain()) {
> +		pci_xen_swiotlb_init();
> +		return;
>  	}
> +	pci_swiotlb_detect();
> +	gart_iommu_hole_init();
> +	amd_iommu_detect();
> +	detect_intel_iommu();
> +	if (x86_swiotlb_enable)
> +		swiotlb_init(0);
>  }
>  
>  /*
> @@ -102,7 +164,7 @@ static __init int iommu_setup(char *p)
>  		}
>  #ifdef CONFIG_SWIOTLB
>  		if (!strncmp(p, "soft", 4))
> -			swiotlb = 1;
> +			x86_swiotlb_enable = true;
>  #endif
>  		if (!strncmp(p, "pt", 2))
>  			iommu_set_default_passthrough(true);
> @@ -121,14 +183,17 @@ early_param("iommu", iommu_setup);
>  
>  static int __init pci_iommu_init(void)
>  {
> -	struct iommu_table_entry *p;
> -
>  	x86_init.iommu.iommu_init();
>  
> -	for (p = __iommu_table; p < __iommu_table_end; p++) {
> -		if (p && (p->flags & IOMMU_DETECTED) && p->late_init)
> -			p->late_init();
> +#ifdef CONFIG_SWIOTLB
> +	/* An IOMMU turned us off. */
> +	if (x86_swiotlb_enable) {
> +		pr_info("PCI-DMA: Using software bounce buffering for IO (SWIOTLB)\n");
> +		swiotlb_print_info();
> +	} else {
> +		swiotlb_exit();
>  	}
> +#endif
>  
>  	return 0;
>  }
> diff --git a/arch/x86/kernel/pci-iommu_table.c b/arch/x86/kernel/pci-iommu_table.c
> deleted file mode 100644
> index 42e92ec62973b..0000000000000
> --- a/arch/x86/kernel/pci-iommu_table.c
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/dma-mapping.h>
> -#include <asm/iommu_table.h>
> -#include <linux/string.h>
> -#include <linux/kallsyms.h>
> -
> -static struct iommu_table_entry * __init
> -find_dependents_of(struct iommu_table_entry *start,
> -		   struct iommu_table_entry *finish,
> -		   struct iommu_table_entry *q)
> -{
> -	struct iommu_table_entry *p;
> -
> -	if (!q)
> -		return NULL;
> -
> -	for (p = start; p < finish; p++)
> -		if (p->detect == q->depend)
> -			return p;
> -
> -	return NULL;
> -}
> -
> -
> -void __init sort_iommu_table(struct iommu_table_entry *start,
> -			     struct iommu_table_entry *finish) {
> -
> -	struct iommu_table_entry *p, *q, tmp;
> -
> -	for (p = start; p < finish; p++) {
> -again:
> -		q = find_dependents_of(start, finish, p);
> -		/* We are bit sneaky here. We use the memory address to figure
> -		 * out if the node we depend on is past our point, if so, swap.
> -		 */
> -		if (q > p) {
> -			tmp = *p;
> -			memmove(p, q, sizeof(*p));
> -			*q = tmp;
> -			goto again;
> -		}
> -	}
> -
> -}
> -
> -#ifdef DEBUG
> -void __init check_iommu_entries(struct iommu_table_entry *start,
> -				struct iommu_table_entry *finish)
> -{
> -	struct iommu_table_entry *p, *q, *x;
> -
> -	/* Simple cyclic dependency checker. */
> -	for (p = start; p < finish; p++) {
> -		q = find_dependents_of(start, finish, p);
> -		x = find_dependents_of(start, finish, q);
> -		if (p == x) {
> -			printk(KERN_ERR "CYCLIC DEPENDENCY FOUND! %pS depends on %pS and vice-versa. BREAKING IT.\n",
> -			       p->detect, q->detect);
> -			/* Heavy handed way..*/
> -			x->depend = NULL;
> -		}
> -	}
> -
> -	for (p = start; p < finish; p++) {
> -		q = find_dependents_of(p, finish, p);
> -		if (q && q > p) {
> -			printk(KERN_ERR "EXECUTION ORDER INVALID! %pS should be called before %pS!\n",
> -			       p->detect, q->detect);
> -		}
> -	}
> -}
> -#else
> -void __init check_iommu_entries(struct iommu_table_entry *start,
> -				       struct iommu_table_entry *finish)
> -{
> -}
> -#endif
> diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
> deleted file mode 100644
> index 814ab46a0dada..0000000000000
> --- a/arch/x86/kernel/pci-swiotlb.c
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -#include <linux/pci.h>
> -#include <linux/cache.h>
> -#include <linux/init.h>
> -#include <linux/swiotlb.h>
> -#include <linux/memblock.h>
> -#include <linux/dma-direct.h>
> -#include <linux/cc_platform.h>
> -
> -#include <asm/iommu.h>
> -#include <asm/swiotlb.h>
> -#include <asm/dma.h>
> -#include <asm/xen/swiotlb-xen.h>
> -#include <asm/iommu_table.h>
> -
> -int swiotlb __read_mostly;
> -
> -/*
> - * pci_swiotlb_detect_override - set swiotlb to 1 if necessary
> - *
> - * This returns non-zero if we are forced to use swiotlb (by the boot
> - * option).
> - */
> -int __init pci_swiotlb_detect_override(void)
> -{
> -	if (swiotlb_force == SWIOTLB_FORCE)
> -		swiotlb = 1;
> -
> -	return swiotlb;
> -}
> -IOMMU_INIT_FINISH(pci_swiotlb_detect_override,
> -		  pci_xen_swiotlb_detect,
> -		  pci_swiotlb_init,
> -		  pci_swiotlb_late_init);
> -
> -/*
> - * If 4GB or more detected (and iommu=off not set) or if SME is active
> - * then set swiotlb to 1 and return 1.
> - */
> -int __init pci_swiotlb_detect_4gb(void)
> -{
> -	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
> -	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
> -		swiotlb = 1;
> -
> -	/*
> -	 * Set swiotlb to 1 so that bounce buffers are allocated and used for
> -	 * devices that can't support DMA to encrypted memory.
> -	 */
> -	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
> -		swiotlb = 1;
> -
> -	return swiotlb;
> -}
> -IOMMU_INIT(pci_swiotlb_detect_4gb,
> -	   pci_swiotlb_detect_override,
> -	   pci_swiotlb_init,
> -	   pci_swiotlb_late_init);
> -
> -void __init pci_swiotlb_init(void)
> -{
> -	if (swiotlb)
> -		swiotlb_init(0);
> -}
> -
> -void __init pci_swiotlb_late_init(void)
> -{
> -	/* An IOMMU turned us off. */
> -	if (!swiotlb)
> -		swiotlb_exit();
> -	else {
> -		printk(KERN_INFO "PCI-DMA: "
> -		       "Using software bounce buffering for IO (SWIOTLB)\n");
> -		swiotlb_print_info();
> -	}
> -}
> diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
> index f9af561c3cd4f..0c1154a1c4032 100644
> --- a/arch/x86/kernel/tboot.c
> +++ b/arch/x86/kernel/tboot.c
> @@ -24,7 +24,6 @@
>  #include <asm/processor.h>
>  #include <asm/bootparam.h>
>  #include <asm/pgalloc.h>
> -#include <asm/swiotlb.h>
>  #include <asm/fixmap.h>
>  #include <asm/proto.h>
>  #include <asm/setup.h>
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 7fda7f27e7620..f5f6dc2e80072 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -315,18 +315,6 @@ SECTIONS
>  		*(.altinstr_replacement)
>  	}
>  
> -	/*
> -	 * struct iommu_table_entry entries are injected in this section.
> -	 * It is an array of IOMMUs which during run time gets sorted depending
> -	 * on its dependency order. After rootfs_initcall is complete
> -	 * this section can be safely removed.
> -	 */
> -	.iommu_table : AT(ADDR(.iommu_table) - LOAD_OFFSET) {
> -		__iommu_table = .;
> -		*(.iommu_table)
> -		__iommu_table_end = .;
> -	}
> -
>  	. = ALIGN(8);
>  	.apicdrivers : AT(ADDR(.apicdrivers) - LOAD_OFFSET) {
>  		__apicdrivers = .;
> diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
> index 4953260e281c3..3c5b52fbe4a7f 100644
> --- a/arch/x86/xen/Makefile
> +++ b/arch/x86/xen/Makefile
> @@ -47,6 +47,4 @@ obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
>  
>  obj-$(CONFIG_XEN_PV_DOM0)	+= vga.o
>  
> -obj-$(CONFIG_SWIOTLB_XEN)	+= pci-swiotlb-xen.o
> -
>  obj-$(CONFIG_XEN_EFI)		+= efi.o
> diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
> deleted file mode 100644
> index 46df59aeaa06a..0000000000000
> --- a/arch/x86/xen/pci-swiotlb-xen.c
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -/* Glue code to lib/swiotlb-xen.c */
> -
> -#include <linux/dma-map-ops.h>
> -#include <linux/pci.h>
> -#include <xen/swiotlb-xen.h>
> -
> -#include <asm/xen/hypervisor.h>
> -#include <xen/xen.h>
> -#include <asm/iommu_table.h>
> -
> -
> -#include <asm/xen/swiotlb-xen.h>
> -#ifdef CONFIG_X86_64
> -#include <asm/iommu.h>
> -#include <asm/dma.h>
> -#endif
> -#include <linux/export.h>
> -
> -static int xen_swiotlb __read_mostly;
> -
> -/*
> - * pci_xen_swiotlb_detect - set xen_swiotlb to 1 if necessary
> - *
> - * This returns non-zero if we are forced to use xen_swiotlb (by the boot
> - * option).
> - */
> -int __init pci_xen_swiotlb_detect(void)
> -{
> -
> -	if (!xen_pv_domain())
> -		return 0;
> -
> -	/* If running as PV guest, either iommu=soft, or swiotlb=force will
> -	 * activate this IOMMU. If running as PV privileged, activate it
> -	 * irregardless.
> -	 */
> -	if (xen_initial_domain() || swiotlb || swiotlb_force == SWIOTLB_FORCE)
> -		xen_swiotlb = 1;
> -
> -	/* If we are running under Xen, we MUST disable the native SWIOTLB.
> -	 * Don't worry about swiotlb_force flag activating the native, as
> -	 * the 'swiotlb' flag is the only one turning it on. */
> -	swiotlb = 0;
> -
> -#ifdef CONFIG_X86_64
> -	/* pci_swiotlb_detect_4gb turns on native SWIOTLB if no_iommu == 0
> -	 * (so no iommu=X command line over-writes).
> -	 * Considering that PV guests do not want the *native SWIOTLB* but
> -	 * only Xen SWIOTLB it is not useful to us so set no_iommu=1 here.
> -	 */
> -	if (max_pfn > MAX_DMA32_PFN)
> -		no_iommu = 1;
> -#endif
> -	return xen_swiotlb;
> -}
> -
> -static void __init pci_xen_swiotlb_init(void)
> -{
> -	if (xen_swiotlb) {
> -		xen_swiotlb_init_early();
> -		dma_ops = &xen_swiotlb_dma_ops;
> -
> -#ifdef CONFIG_PCI
> -		/* Make sure ACS will be enabled */
> -		pci_request_acs();
> -#endif
> -	}
> -}
> -
> -int pci_xen_swiotlb_init_late(void)
> -{
> -	int rc;
> -
> -	if (xen_swiotlb)
> -		return 0;
> -
> -	rc = xen_swiotlb_init();
> -	if (rc)
> -		return rc;
> -
> -	dma_ops = &xen_swiotlb_dma_ops;
> -#ifdef CONFIG_PCI
> -	/* Make sure ACS will be enabled */
> -	pci_request_acs();
> -#endif
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
> -
> -IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
> -		  NULL,
> -		  pci_xen_swiotlb_init,
> -		  NULL);
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index b4a798c7b347f..1a3ad58ba8465 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -27,7 +27,6 @@
>  #include <asm/apic.h>
>  #include <asm/gart.h>
>  #include <asm/x86_init.h>
> -#include <asm/iommu_table.h>
>  #include <asm/io_apic.h>
>  #include <asm/irq_remapping.h>
>  #include <asm/set_memory.h>
> @@ -3257,11 +3256,6 @@ __setup("ivrs_ioapic",		parse_ivrs_ioapic);
>  __setup("ivrs_hpet",		parse_ivrs_hpet);
>  __setup("ivrs_acpihid",		parse_ivrs_acpihid);
>  
> -IOMMU_INIT_FINISH(amd_iommu_detect,
> -		  gart_iommu_hole_init,
> -		  NULL,
> -		  NULL);
> -
>  bool amd_iommu_v2_supported(void)
>  {
>  	return amd_iommu_v2_present;
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index a1ada7bff44e6..b47220ac09eaa 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -1840,7 +1840,10 @@ void amd_iommu_domain_update(struct protection_domain *domain)
>  
>  static void __init amd_iommu_init_dma_ops(void)
>  {
> -	swiotlb = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
> +	if (iommu_default_passthrough() || sme_me_mask)
> +		x86_swiotlb_enable = true;
> +	else
> +		x86_swiotlb_enable = false;
>  }
>  
>  int __init amd_iommu_init_api(void)
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index 4de960834a1b2..592c1e1a5d4b9 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -30,7 +30,6 @@
>  #include <linux/numa.h>
>  #include <linux/limits.h>
>  #include <asm/irq_remapping.h>
> -#include <asm/iommu_table.h>
>  #include <trace/events/intel_iommu.h>
>  
>  #include "../irq_remapping.h"
> @@ -912,7 +911,7 @@ dmar_validate_one_drhd(struct acpi_dmar_header *entry, void *arg)
>  	return 0;
>  }
>  
> -int __init detect_intel_iommu(void)
> +void __init detect_intel_iommu(void)
>  {
>  	int ret;
>  	struct dmar_res_callback validate_drhd_cb = {
> @@ -945,8 +944,6 @@ int __init detect_intel_iommu(void)
>  		dmar_tbl = NULL;
>  	}
>  	up_write(&dmar_global_lock);
> -
> -	return ret ? ret : 1;
>  }
>  
>  static void unmap_iommu(struct intel_iommu *iommu)
> @@ -2164,7 +2161,6 @@ static int __init dmar_free_unused_resources(void)
>  }
>  
>  late_initcall(dmar_free_unused_resources);
> -IOMMU_INIT_POST(detect_intel_iommu);
>  
>  /*
>   * DMAR Hotplug Support
> diff --git a/include/linux/dmar.h b/include/linux/dmar.h
> index 45e903d847335..cbd714a198a0a 100644
> --- a/include/linux/dmar.h
> +++ b/include/linux/dmar.h
> @@ -121,7 +121,7 @@ extern int dmar_remove_dev_scope(struct dmar_pci_notify_info *info,
>  				 u16 segment, struct dmar_dev_scope *devices,
>  				 int count);
>  /* Intel IOMMU detection */
> -extern int detect_intel_iommu(void);
> +void detect_intel_iommu(void);
>  extern int enable_drhd_fault_handling(void);
>  extern int dmar_device_add(acpi_handle handle);
>  extern int dmar_device_remove(acpi_handle handle);
> @@ -197,6 +197,10 @@ static inline bool dmar_platform_optin(void)
>  	return false;
>  }
>  
> +static inline void detect_intel_iommu(void)
> +{
> +}
> +
>  #endif /* CONFIG_DMAR_TABLE */
>  
>  struct irte {
> -- 
> 2.30.2
> 
