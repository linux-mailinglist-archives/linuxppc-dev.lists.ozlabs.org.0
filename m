Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A130FD04
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 20:38:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWpkM1rcWzDwy0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 06:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=uoPRZ4vz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=nN9hWOh2; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWphg2CDHzDwwF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 06:36:51 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 114JTdwm044841;
 Thu, 4 Feb 2021 19:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=1mSbR7UYytrVmb9m+OjsfJQ+ECzLuT5FK3uth4D/hSw=;
 b=uoPRZ4vz6mb4z1gMXMHFvxwBkbXKBRmCy2XhjVbaPw0jNoHu0QaiZnf3j5/B7emztro5
 0iztbYhLd3vDgay72tQ6v0ij5PSveEkRKdrr3wcjAKxozyU0JID7seBQmz211BJWL3/n
 21EHOXgDC0bsG30hLvCbhqscoLzqfAVDMG+yD0DGaFTgq86fgtsLcFNTfURcxZlBx5/k
 FJjWBPesneE3gBMvwHtZumwjne8eT2iYPAdxJ5t4GcypklTFE0C6r4ZHlw4l5CMRCBMQ
 jrOMtCxfZphJ9eSlzXIBH5oTU4e6e81X+VeOeNvIRXTOuKTE+Drv6PXP6ARwvuQ25MEv IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36cvyb71sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Feb 2021 19:33:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 114JUXk4106088;
 Thu, 4 Feb 2021 19:31:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 36dh7vm7bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Feb 2021 19:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJRX8n8XulXtIXRsy8uGNsuDKgHehZ06tN4hkr9Y6Hpqe8VBz7mF4vuALeeF3RsXj6VV6Ioe+1HMiye4RgatyupMXkb9gZzMwGsHKUkZ8JQ7k3wMjdACflMNZ0QgpRNAf7eE5sQApZzzUksWAz+xfp7Bw9x54qX0YDJgpXdCRCUSpv46iRKsibQnlxkQtfzDayvDW7nfFsCpPC6IEIvHgpYeLLTIrwSqeQ7tfW6aQxULPXNk2ZL1TjCzgXRx3EDggfdVbglGophPcLovgGOrZZtxZdDQgKr83njV6y8JagEv8AMZdCRBsfuoZCLtmu4uh4DFTpLJSEvfJAk/oa+qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mSbR7UYytrVmb9m+OjsfJQ+ECzLuT5FK3uth4D/hSw=;
 b=d3fos0Kh39uzd19oyhdNiV5RCgUmtGZXuOsU4vT+3gPP4jy8C91KNWGYCoHRzariSN2dsL+Vn8OvhwROsmBtGp0ZL4SEidWTl1hz1XMIEPA03QlTOSj9ekIKjKXFi2vnzEsT8Lyt3nMrJw/6XTFbduPupuhZxeJp5PR1mQmvxeUfJOLVF4lFBhkNxj0wi5k94K/FuwlN1j0QXl78BmDaALE+Q7Um8K6TtofF9+Fb9lEzBx+/lkqjN8bphoMh15JK+b3890ccbfi++FdQ9kODvO5TaCsKE1YGXcnprZxnuUMGlIshUNfXBBEwrOYXlCN3Lu/cYbqtsQokn+fPuiuB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mSbR7UYytrVmb9m+OjsfJQ+ECzLuT5FK3uth4D/hSw=;
 b=nN9hWOh2tdMNz04L6MgzOKjjxEgtPjBcD0ZS7FMUKMpvtLgryAf3qEzi5GMWMiaUjUXtVqLYOx5IDYPB47nY/ZU+80CJmagSSM2aTRJEDxAIf99xx/fjlshMQjyV1BIE5WGD8JbhrwHYs/f2ROVtiJzYXdD8C5Cu0LO/4Sf27Lc=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3207.namprd10.prod.outlook.com (2603:10b6:a03:152::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 19:31:44 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456%4]) with mapi id 15.20.3825.024; Thu, 4 Feb 2021
 19:31:44 +0000
Date: Thu, 4 Feb 2021 14:31:36 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH RFC v1 2/6] swiotlb: convert variables to arrays
Message-ID: <20210204193136.GA333094@fedora>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-3-dongli.zhang@oracle.com>
 <20210204072947.GA29812@lst.de>
 <b46ddefe-d91a-fa6a-0e0d-cf1edc343c2e@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b46ddefe-d91a-fa6a-0e0d-cf1edc343c2e@arm.com>
X-Originating-IP: [209.6.208.110]
X-ClientProxiedBy: BL0PR02CA0129.namprd02.prod.outlook.com
 (2603:10b6:208:35::34) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (209.6.208.110) by
 BL0PR02CA0129.namprd02.prod.outlook.com (2603:10b6:208:35::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Thu, 4 Feb 2021 19:31:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef55351e-693f-4d96-4932-08d8c943812e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3207426DBD5DE06078DD9EE689B39@BYAPR10MB3207.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uAgalEdYjwOjJHCH2G7vN5tWQtCMtbX0n85NOzjg397fr4HPpL38hU+5XzzeT49OmKLLJVsnwxIpo+to5zKKQGIsK846HRhFER2KPTbPklCujGd8DTLblcPCup5OKFImj7oo9vISCGsDUiJZkiV/3ToqgvCCnZ6B7MuTJOyFbK32wJugnDz83jEY9ajCSyngUqObEoMU3edySoele8YHKMKQs6lZYD+ISVSsalYC0OzhTRXQE4+4oUMREmANuddjCtRwMZYVha7Km7A6VrPYzrIZUTCE+qTKTB/5qMehAd+orN5NztZ/wh0QB0yaOmm5HKNNBXGarBx77cjIGbdqh02HNg3UnBXLSrO3Vlw0yTXHrDNDI2IfSSAHFKYY8deJXB9W2dzWfmTSvLvpo+OPXRc2RGZ951S6BJ1FROzMHQhCJzBIgXYmDz/ZaD2ufs3XKyOOO17e5wOUQtMfLmh7W/1FrwiplQ115y6pFi47ExlWLvcLqtuN7NfidZI4Czy4IotM2VARalMW8UzXklor4Gvk0Bu87CDO0GQd7Z6htWQc5dBRVrO9l/fxVoYdjmAg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(8936002)(26005)(4326008)(9576002)(8676002)(33656002)(86362001)(16526019)(5660300002)(53546011)(186003)(83380400001)(956004)(66556008)(52116002)(66946007)(55016002)(478600001)(7416002)(6496006)(2906002)(6916009)(66476007)(316002)(54906003)(7406005)(33716001)(9686003)(1076003)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wawCRNyZ8ljyEuFsDq2wYljIRGRa+x/+LWf2aOYw3EPj/ts+T86ZgSpVrNI1?=
 =?us-ascii?Q?E+hi9N0U+VHnKEi643sfk/lKPgdNcyg1X5dIqfKRQ4obHAugfVLS3yvF9uHA?=
 =?us-ascii?Q?Et/CzMB5IJrQmQCH1De9LLITIdU4HxYUHXWeiyTewys9ZPW92hzJbHRHipFS?=
 =?us-ascii?Q?ZjKreRgS4eenVHSWbXtGKX1RdGwsvFmGUtZmt6RPIQnBG2nQbh6uY1x8XDm+?=
 =?us-ascii?Q?HNlo4+zCXXBRmqVsO/7K9N6zTYffAibVUCmdssjl652dJxDd3pjO60aeIy0D?=
 =?us-ascii?Q?8V+eyWUUKndo85mK1a37h25dT8XAJwF9Su3wjpK6ufcFPfV0VuubOJHsl211?=
 =?us-ascii?Q?eA7BLwTGejgutN/nAwdMSAZkzE2FrKGJS10H0MSnyrk04g7iNLjEZgUdKSG3?=
 =?us-ascii?Q?dbKSyYBKbpp42miUwg9hkS08itIpYL2S9a9RkXNAde3GAtY8hBCh3qcgSHdi?=
 =?us-ascii?Q?6Bwioin/m6tIHwT2fqnyX9f92pWdI4xt6zbdalUgmS0Nn/nWd6UBBXTVIwp3?=
 =?us-ascii?Q?dIIm4w1C7EEb9JRK6Ur4QTI7vS8dkeShTS7EEI0vs2iqliz4Ng9rEm1Ef1AH?=
 =?us-ascii?Q?7oWFim24xrTDWQ5X5aZEq27Kuqu+tHvo+AT6VOmALtiohgErAKdEVxNQZh0x?=
 =?us-ascii?Q?Vml36FCg9b/IZbsngoX9D721PfCaqnU+oC4nPWWIgX0I74A33IcyRGjtiXTn?=
 =?us-ascii?Q?Ia0ZN5cwmDDIGVeJGyG3iNUfqiIqi0y7Zeqhe9JI1OfjSliJO8W+KRBewRsa?=
 =?us-ascii?Q?TWvEmmm8e9DHFLSpnnuNii/MUeYnKoFTiIFdCEn+7nHBcowyz281im4/anKz?=
 =?us-ascii?Q?mlQI4Wr14VzMSyrfRi+QjA7lU5xNQGDgk4P6StAGD+ydA0roF+OAcMIs+Y0B?=
 =?us-ascii?Q?oLhz70asx7ROi582lpwamEJbklY3Udnoslrv910cdfzXvIG+i5kqodTaRA2n?=
 =?us-ascii?Q?H/vSpzVb3icXkkiJQGuwVwDxwg2+AvhseyrxM1QG/HMlrIT4zuO3DAM8Q+Xc?=
 =?us-ascii?Q?WhNd8k33wXZ5x9HqOyUVfSGBgprXrx/AWC7J2VboMq8mp1zfTY0uZ5flkTcc?=
 =?us-ascii?Q?KPICc97M?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef55351e-693f-4d96-4932-08d8c943812e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 19:31:44.2409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezbeptdNGkgwxrYaRP+vWUR9oW8gyl3BZp7dR4e7wHu1eriSLHANm2B5ihfHQRmNh+F5kZ7Hnkdiiin0cMy+PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3207
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040118
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040118
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, hpa@zytor.com, Christoph Hellwig <hch@lst.de>,
 m.szyprowski@samsung.com, sstabellini@kernel.org, adrian.hunter@intel.com,
 Dongli Zhang <dongli.zhang@oracle.com>, x86@kernel.org, joe.jin@oracle.com,
 mingo@kernel.org, peterz@infradead.org, mingo@redhat.com, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 chris@chris-wilson.co.uk, jgross@suse.com, tsbogend@alpha.franken.de,
 nouveau@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 tglx@linutronix.de, bauerman@linux.ibm.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 04, 2021 at 11:49:23AM +0000, Robin Murphy wrote:
> On 2021-02-04 07:29, Christoph Hellwig wrote:
> > On Wed, Feb 03, 2021 at 03:37:05PM -0800, Dongli Zhang wrote:
> > > This patch converts several swiotlb related variables to arrays, in
> > > order to maintain stat/status for different swiotlb buffers. Here are
> > > variables involved:
> > > 
> > > - io_tlb_start and io_tlb_end
> > > - io_tlb_nslabs and io_tlb_used
> > > - io_tlb_list
> > > - io_tlb_index
> > > - max_segment
> > > - io_tlb_orig_addr
> > > - no_iotlb_memory
> > > 
> > > There is no functional change and this is to prepare to enable 64-bit
> > > swiotlb.
> > 
> > Claire Chang (on Cc) already posted a patch like this a month ago,
> > which looks much better because it actually uses a struct instead
> > of all the random variables.
> 
> Indeed, I skimmed the cover letter and immediately thought that this whole
> thing is just the restricted DMA pool concept[1] again, only from a slightly
> different angle.


Kind of. Let me lay out how some of these pieces are right now:

+-----------------------+      +----------------------+
|                       |      |                      |
|                       |      |                      |
|   a)Xen-SWIOTLB       |      | b)SWIOTLB (for !Xen) |
|                       |      |                      |
+-----------XX----------+      +-------X--------------+
              XXXX             XXXXXXXXX
                 XXXX     XX XXX
                    X   XX
                    XXXX
         +----------XX-----------+
         |                       |
         |                       |
         |   c) SWIOTLB generic  |
         |                       |
         +-----------------------+

Dongli's patches modify the SWIOTLB generic c), and Xen-SWIOTLB a)
parts.

Also see the IOMMU_INIT logic which lays this a bit more deepth
(for example how to enable SWIOTLB on AMD boxes, or IBM with Calgary
IOMMU, etc - see iommu_table.h).

Furtheremore it lays the groundwork to allocate AMD SEV SWIOTLB buffers
later after boot (so that you can stich different pools together).
All the bits are kind of inside of the SWIOTLB code. And also it changes
the Xen-SWIOTLB to do something similar.

The mempool did it similarly by taking the internal parts (aka the
various io_tlb) of SWIOTLB and exposing them out and having
other code:

+-----------------------+      +----------------------+
|                       |      |                      |
|                       |      |                      |
| a)Xen-SWIOTLB         |      | b)SWIOTLB (for !Xen) |
|                       |      |                      |
+-----------XX----------+      +-------X--------------+
              XXXX             XXXXXXXXX
                 XXXX     XX XXX
                    X   XX
                    XXXX
         +----------XX-----------+         +------------------+
         |                       |         | Device tree      |
         |                       +<--------+ enabling SWIOTLB |
         |c) SWIOTLB generic     |         |                  |
         |                       |         | mempool          |
         +-----------------------+         +------------------+

What I was suggesting to Clarie to follow Xen model, that is
do something like this:

+-----------------------+      +----------------------+   +--------------------+
|                       |      |                      |   |                    |
|                       |      |                      |   |                    |
| a)Xen-SWIOTLB         |      | b)SWIOTLB (for !Xen) |   | e) DT-SWIOTLB      |
|                       |      |                      |   |                    |
+-----------XX----------+      +-------X--------------+   +----XX-X------------+
              XXXX             XXXXXXXXX        XXX X X XX X XX
                 XXXX     XX XXX        XXXXXXXX
                    X   XX XXXXXXXXXXXXX
                    XXXXXXXX
         +----------XXX----------+
         |                       |
         |                       |
         |c) SWIOTLB generic     |
         |                       |
         +-----------------------+


so using the SWIOTLB generic parts, and then bolt on top
of the device-tree logic, along with the mempool logic.



But Christopher has an interesting suggestion which is
to squash the all the existing code (a, b, c) all together
and pepper it with various jump-tables.


So:


-----------------------------+
| SWIOTLB:                   |
|                            |
|  a) SWIOTLB (for non-Xen)  |
|  b) Xen-SWIOTLB            |
|  c) DT-SWIOTLB             |
|                            |
|                            |
-----------------------------+


with all the various bits (M2P/P2M for Xen, mempool for ARM,
and normal allocation for BM) in one big file.

