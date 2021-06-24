Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AE3B36C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9qkG6J1fz3br2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 05:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=ka4uO+w+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Jx9PG0C1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=ka4uO+w+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Jx9PG0C1; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9qjg0QB9z2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 05:20:52 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OJBmri025165; Thu, 24 Jun 2021 19:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=P8+6fQKt1GcJiNjuEjUVT8DwDaU9l6qyoErT2/2fhEo=;
 b=ka4uO+w+HngPAlAlcvgVQkkZRUykFcqf4Wu4LLsIczBlUd9+Zr5u8u3Ez0oc7X0geuor
 NBnMkH8lTH5cH7Nisz9W4sdd/zSB8dlSuy3OuvmdLF8Oc7s/wwN/Fv0dpLseQu3bdK7Z
 8wAYkg3ilAXxVIAui6DqWxa+spw0uny2hoar3/sW6hLatzWZNfkDtYHhjydp8A4Dz1yK
 GiXznXL3JrmlRiC7nrEgrJPCqHuLUkxkwkvq/iCKDaooi2WJW6N0x6uixsHWWfFPAAKc
 gswRROCllkfB1ApiO/vA4vIcprZIkyFi/x5gUAkuecntkqUc3lqadkY4GOxgsTJQ65SP VA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c634ufgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 19:20:09 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15OJK8hE035087;
 Thu, 24 Jun 2021 19:20:08 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by userp3030.oracle.com with ESMTP id 3995q18276-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 19:20:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpXMUxGbaQ9Xui1oyOBNhR0FlQrJsdrtDWMytIAHuioZMgW6zJlsv0RQ7Zyy0ipuGwV0EUoaBtpPPrGQUVhU1CLMwCc9Bm8NqLTCV7tGBbpMKTFW5SUdcmi3ileOSoHTnlrahWvP/PpcvPQ/WFhlq+5wfRP9HRB/tNFpZ4AODVejGA9Qxl8rH6/fmzV648vSQp0wun865YcsPwpsymd8TQBbwmJi20B1Pp7gt0UP1UXNTYXU7rhhoYl5uLLKeSQFQQBZV1J8tjezI7kk2zII34EuwGHr/4/yuq293og361XsZByELl0pIX7r0XIXUGcPXoH8mQvOFxB7+8kh/lDqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8+6fQKt1GcJiNjuEjUVT8DwDaU9l6qyoErT2/2fhEo=;
 b=Cshqzkx1kSkYTdieScYtwuU9XYvSgltLRPgvqkm3ZBoVSbGYTAYM5qdWlrwvkT/mspLR05MBNFoGz90ikfF/o/uoaF0/Eesq/Xm5Puf03B/hjAot7s6Lge/vvuFHHqTa2s4illm5NLGJ+NLAFv7nzjkfJt1GA5mL1y5yCNmODo8AKrfZMMgzjG2iCOB2Kt70LnEPvNLJHbxqic952W1o6t7HGBjryKCAJD6yiJ/KAftlNRXLHAYBbQwU6GEyt1I+QLhfOZkDdVHwKGSfrYx6g3uNXjLWyM6BREfD6BHHy6s7qtMPkL3Opw/zDHY1RHzRrLCo4BJRtF9YLXheO5/4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8+6fQKt1GcJiNjuEjUVT8DwDaU9l6qyoErT2/2fhEo=;
 b=Jx9PG0C124tyZswmT6sJXGulr9UexRz4ZOBu9TDsfCCLOqUNHQ+2JT25KlFEKD+cGDZa3h/55BGXNVLxWyk0I9RTPjP/mauOKH1Q6kDRxZw8D/8pJee/Gpp3ZW0YskPauNAsJcHC8NUtNeVPFg82SXUhFRLKJmuFn41INbG7puM=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 19:20:04 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 19:20:04 +0000
Date: Thu, 24 Jun 2021 15:19:48 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v15 00/12] Restricted DMA
Message-ID: <YNTa1C5uvz+qWryf@char.us.oracle.com>
References: <20210624155526.2775863-1-tientzu@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SN7P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::27) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.25) by
 SN7P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 19:19:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e32a325a-d0c9-45f4-bf49-08d93745119f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB31602652C7EC6BB6F81C1EC689079@BYAPR10MB3160.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0tzwxIw/4elx5hgGO6B8CjrGZlYNudIrNxhhnBv2AEVGAu3qOEccTjmeVw/yPlpMcjJ+bDbBhjn2+hfLQmHvardT7U8dwR+IEbO7gNAHn2Z40GzLkt2Djw00klfkLLAHCILKIC9zOgcorAPVDMjXkKbIlTliv3wNg24lL7EqRJMotYkuff7S6PZqVUXbXzc//pNHEPio2z2Eo1mRtTbf3fbGtVHMdIfhSgIJ296IsKDCmAgGn5GEtoon3Z+v46kv+INIkWfCgzMcbBsVx4lKMzLE8QmpVn9X7BSPKqfM3zFeze7TuQTiNVgq768IO4blRwz+2U/w9Cj/H228oFeO3kwMlesgS2ci9DK+bc80GeW8fBEaNLRbfu0pTbG4Nkp62ywr+Psrcn1FwwVSlEUzu0RwicBeIgVIFR8EyFHPo03bhK7p9MS+DYJkd51RB/nv1JVOxXc4pGAoLz9viAev2WgTXqjTOSwvxbiBt9uLFMJ91UdTyqUQS/j4OivQHGYSZ87uFWSAWq3GKoPdu0oUpDnelPvYoE1tSfPQXbt2hN3tRPNnZIIZjKLMsCL8OrMTf+g4sXDuRRlgKfSafBgs8YmmBmEHzgjpGhodv/ZU6sR0Q9ixbnl9+dmmVdG5UO2nMOaOBQZeDV32rZA8g4BGBS6ESeLgdNda4Z+LkxoauheVOYquI/kgI8/85XfvvZrZG9+Tzf95XXXFs8C2y4JE74r8pc42U7e/6Go8i7RRPUGbTxkN+nz7UlMN9ZoIsXrVSX+8cUweb8l+SAdXpkX8gOfrk2Md+ongBUv9oRB94xn/X4PMchHzLipHqlELFr4ywVw9ywqe4tu2UAb9+J7cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(39860400002)(376002)(366004)(54906003)(8676002)(5660300002)(316002)(86362001)(6916009)(478600001)(186003)(7406005)(2906002)(55016002)(966005)(16526019)(7416002)(26005)(6666004)(7366002)(38100700002)(52116002)(66476007)(7696005)(956004)(83380400001)(66556008)(4326008)(38350700002)(66946007)(8936002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bvJ7q3CIhSDXU5AEz5Lo5jbUWTmD3cx8rMWsToDHYRSYX63S2y8cG2e1rYk2?=
 =?us-ascii?Q?eErzOJrygXEY8O1Y/n1U2p6iY1ReaLDVmCYe4vz5cWjRIHDU5CMCmVOl8Bcz?=
 =?us-ascii?Q?xMmC8BvlazQ72+db6pe6YdvGFp5Qopzgw6ji6oq8s6ENqjEe+LrA188CgOVY?=
 =?us-ascii?Q?FggWwijeLR8ekpCFnbsjOEaZRkjsxZD46BgCPJLfmSgk6z6e81cAZInUIF0p?=
 =?us-ascii?Q?iuRYgKmhuI+wJ8VpgKyshIsdIxZTz/mIbVkXTkjO0ho3OT3wCJJsAEEv7s+8?=
 =?us-ascii?Q?TIa6UwGP7uu6IyNz7WM1z/6K1mrBHONs7YO31I6J/Q+U2y/AnhENtMbc7313?=
 =?us-ascii?Q?gcycAGPLkyxzVtE6hG6Aypbh0cgAnalSfvg2GOlA7Ia3tCpSS8XGsK0a6mfP?=
 =?us-ascii?Q?9qlsq2UaTVrGTEZIsl40V2DBVUGkEkEU6jo42bXwraARhocJU5ki5J86gGw8?=
 =?us-ascii?Q?ZOK1ghIKDsWW6c5hOjKBkXIq5Q4g3IcgftRSrYV2iZXgJ+XquJ2HIYdIcE6v?=
 =?us-ascii?Q?B9sSLXP5DHB7dYUuPzI8EeMBKVBv4A+n1L9KFX/cX+4dfhTi5q+gjYoflut/?=
 =?us-ascii?Q?f/DliTbrcQ2lHj7hgQvkfaYX32T+5CYDB5DyAra4EVdfei5/Jc9T6k7kiVxB?=
 =?us-ascii?Q?sZctc0fLIREF6B1VGnF1YRj4eOeep8xT1L8OdL2o2rheBbEZDWXP2X3r5z/T?=
 =?us-ascii?Q?ifZUwFkcrFhjrzbcZfiqgSDJ9KHF63Yt9zPnKv8Z5QGaTiqWVDARBIoonOEZ?=
 =?us-ascii?Q?vJj+fZRore8OtRvlbRRxmiS7DocoHqdwjKa5nTteojR48eb5qKwEq/O0Ur6F?=
 =?us-ascii?Q?KK/aC62a7rGONpgH5LjXC/o5izoP+hEPlTBqqSOnmJb7G4rQ+Oj8Akj6ijiK?=
 =?us-ascii?Q?ROsj4gvLWimdelviji7rwTQ+JNbMKWJ2yJ1YfhZu5pmTUINuaYk0miM7t1Zd?=
 =?us-ascii?Q?Og0aJ5QTriX3Lc6I3dmPmemfRZBGAI9b2NSt5L+2nHVgHQostGwVXMSn21Iq?=
 =?us-ascii?Q?W8EoQo5Jc8LgRX2EhDJKGtYHGOeqeV+iV14voRiubW5rWI7jkzYLX29RGcHL?=
 =?us-ascii?Q?txctobWYht7yescW1LhNXeTjBSrYNeea81RBXT0vtNPp1dQkjcgbIlnKfy3u?=
 =?us-ascii?Q?7k1B6kQITgUefQ6ez/oj5hn6Xk044IdQtV3wl2NbUYHbzFE0xVs2Q3dvVbg6?=
 =?us-ascii?Q?5C9UORHyjqNrPPFfPf4bvIBlt6+EJ4D15blYHjoo8k7AlUVxAOF/I6W4CSqs?=
 =?us-ascii?Q?cYZzsOgcLSPISaMKyIk2Rzp1Grqnz0+XcGTd6Kza4oLRHo+4JDdQitYPRs7k?=
 =?us-ascii?Q?oUYwqFmElmXOYx+cMilA4Egb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32a325a-d0c9-45f4-bf49-08d93745119f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 19:20:04.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBncePuLzykfxJ7flQwRuVznf5ZATSXtneYvTgwW4c5iJ1PYAWB6YsZWdW9JYVICQZytQCiZHGX3C+dIcjwY8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3160
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10025
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240106
X-Proofpoint-ORIG-GUID: HVGSeOE_AI_2-cWDVJ4zX0pPBMurpisx
X-Proofpoint-GUID: HVGSeOE_AI_2-cWDVJ4zX0pPBMurpisx
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, quic_qiancai@quicinc.com,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 11:55:14PM +0800, Claire Chang wrote:
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
> 
> For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> not behind an IOMMU. As PCI-e, by design, gives the device full access to
> system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> full chain of exploits; [2], [3]).
> 
> To mitigate the security concerns, we introduce restricted DMA. Restricted
> DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> specially allocated region and does memory allocation from the same region.
> The feature on its own provides a basic level of protection against the DMA
> overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system needs
> to provide a way to restrict the DMA to a predefined memory region (this is
> usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> 
> [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> [2] https://blade.tencent.com/en/advisories/qualpwn/
> [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> 
> v15:
> - Apply Will's diff (https://lore.kernel.org/patchwork/patch/1448957/#1647521)
>   to fix the crash reported by Qian.
> - Add Stefano's Acked-by tag for patch 01/12 from v14

That all should be now be on

https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/
devel/for-linus-5.14 (and linux-next)

