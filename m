Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDF4C25B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45Ms1sddz30NB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:16:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=piKgrJUz;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UrhESG0L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=piKgrJUz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=UrhESG0L; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45M31K3pz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:15:42 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NNwseF010340; 
 Thu, 24 Feb 2022 00:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kjsHYyUGUqhofVt9G6M3BjkWcNnLrpgEeRq0S2D3wC0=;
 b=piKgrJUz+K8Ja+RJ1MwZu4nqzVCRD2bn+YLDjzK1c6rkDGqv8NQmMCo7/lHdz1TSB8lg
 LOKyF0XVV3iPzQ9VPsd32dYv8IWlCePSAN+r1eBJZeJvz422jB7dSgqXngrtctRpq4zU
 DMqfbPRQOBv5dQeSZpyi1dRAewZZ46F0TrN/ym4lzKcD2QlxBRc+go2pf3AGs9ERt/Sc
 /N+9q5ag+f9VhFYh5N+9En/1QI4a0qX4b8F18nWQa2Tx1c0aEbK0gbFY5ci6enJmZXjr
 7v4oXw6NdPDPfWE/bnRnOFNpI82S3O6wEXHcwmINhmRWFwI6uYWFazUoDJatC30YUx9q ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar5km5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 00:57:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21O0jgHX084496;
 Thu, 24 Feb 2022 00:57:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 3eannwnghg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 00:57:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InlK+QGWLbO/KNOqUWZRnIK/wQMZisJ81vRILGTKDCLmdgUllU3WPEM0u0fF9zefBI9GcE6n24f/t8dbGplvtXis37wtas8Az69vYN8uBdLaUYWyYLfVGGislkh10KBMKcs8+AHyWIf9n0dUyGWzBSuWPSTKT6D1cEPW8RjnZ4VZRlt0czuKiEQMNZvOArXCBMY2c3O2Ug8HjTf6b5Mj4dCIhAw7nWeoRmUkRm9NcLyZxXvcVJ2xbFbsrgBqxEQO+EucaqadlL4JQrdgXnNeKGnGXLd8rn6Vui+POEFxsi4GVPS6Kuw9leb1YEmUGdvbG3NksDI7wp5yXOdh+1PBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjsHYyUGUqhofVt9G6M3BjkWcNnLrpgEeRq0S2D3wC0=;
 b=FJ23ufPoASGS7iQQzMA+GvA8Uw5VTlraxgqt02WkX9bHXImEpWIS4RusTmErVIRX+V/c0hOA5BPVmAWcmoMLJwTIpjDt8+e4DfTWGm1Ihcw8uR2ixDUGTGE3GjOdWLJVhHvGgi4TLF260HyvEMoxHHkyLj7GcmCLTpNNKyMNUPspaOY1zNSH9h3lcfvur84Qloa1+MSET5hgYxmRSRH/QpJRIQj181rLne0y9OO2BznEj0aQUt3eMlIR67WXbpChoRtO87xE/hVfCTIO0zSXpNlumv3dkA+FZkGqWslm0Ik4XuYJDe04PCpiDVtBrfQ4zqnGWE6bk/e8zTGsvVocQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjsHYyUGUqhofVt9G6M3BjkWcNnLrpgEeRq0S2D3wC0=;
 b=UrhESG0LYGJf9Nwtt08/44jyIzTRDyHKNN/gKlpYDM5TQ1GWJRPCl6xBaWMSUJICKAMlvgSbgrRU/4xqjRhFE4vOLs2IJDdwu/MQ+qedZ01XaVgbyyOY04coVgFKrozH8Yd0GJbQOpfFtpZfl0CZU/bjvcpG8eveh621I44a1oI=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SN6PR10MB2815.namprd10.prod.outlook.com (2603:10b6:805:d1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 00:57:55 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 00:57:54 +0000
Message-ID: <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
Date: Wed, 23 Feb 2022 19:57:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: cleanup swiotlb initialization
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220222153514.593231-1-hch@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220222153514.593231-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:806:6f::15) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce6beb6e-deeb-44ea-059b-08d9f730b0c7
X-MS-TrafficTypeDiagnostic: SN6PR10MB2815:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB28152A54E63B81D29015FA8F8A3D9@SN6PR10MB2815.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FGzq+TKGdGcDhu9q4HayTzQgtGDKsO5UNbH5NtF76/uFi27aZoiinIYQgPiCfFDC6XqirAkiROpo3XwYgvIP8wozjrrqmpr93oumyIKluaTl0bySY+a99Cavlc6bvPNWJ6hYNURUlQxsqQ1/4qIDUENiJ7+RpU1Pf0eP7KFYkMAtgjS56qQz9thyteOfA4sZNFIFWCskg6pfLUWHcPlH2tkv9cnTdAmXoJlrKluSlvsYkSmv0r5JceHCFOWX5FmjJvcE2nMltZxt/vYN1naPTzY5EOeEDVYUVtyBBw9JaRnM5MZb2D//4toQfhNzttuAoBciU58t3fxearQXXBMvikSjKJhwp2flpPzQHEE8ZjS8vDuurFN/Rxqq+d1PaIh7wOi32lJU2gllIxnMrzQMlL3PdrYU354WvtBHbivxcEkQjBMD+P2C+NECHo2+d2h8JEFHyO/fxenzEjWD++0m+KTpvHUUDo1Vso6U1vPvdQjs3D+aMccdpi1wP+qVXKULvb77fyKSoEdUdQwnulk29J9lCJ4h1eHPsxutWrXOsHTSrd1S9xMCvP410Z1XS6vbYbV+MIZu0wA/sTBUAwNrvztukpF0LY7JEjXs58BL176sWSWBGEtds3MUfCa+VQLbaS+UYKN4EATvMvxOdx9yp/pS10Qc/FSIWx3FYC83pzTJdeMPPop4FrzOlMbcxZW4Iqfe4wHDdZuif8uYOQaaItHBNhHBHCDf6bNyPL9gO41XOgAThLPCbIfiKDjCfYOR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(36756003)(508600001)(6666004)(45080400002)(2616005)(6486002)(38100700002)(26005)(86362001)(31686004)(316002)(31696002)(83380400001)(54906003)(186003)(6512007)(66476007)(44832011)(66946007)(3480700007)(8936002)(5660300002)(8676002)(4326008)(66556008)(2906002)(7416002)(7116003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNZMTZ2YjAwd28rRjVsSkxiZHErcHpjUFpWNGhWalhQZkxiVkJvNjhwRFFw?=
 =?utf-8?B?KzJ4ZTFsbitOMFBiVEIzdEQ3WkRaYzkzc0xGTXd1eUZ3b2dvY095Vmd3cmJh?=
 =?utf-8?B?Q0JPVGZzckVqSlJ3b1pMbExlNjRyTUJQMXgvREZ2ZklCcW1uK2Y3aXprMXQx?=
 =?utf-8?B?VGRnNDUwN282ckhVZjBUVVFrNVd3bDIrTzFmcFVrbTRVOC81VUdhUk1Yakgr?=
 =?utf-8?B?QXJVcVZRTEVaeWR0U0pZVmI0ckUvYzY0ZHBUWGhSK1M2MmZsa2wrRlFERVQv?=
 =?utf-8?B?VUVzS0RvVk1rRlpsdzQ3eGVVbkE5Z0RwcG85Q3FtZDZHbDJGZjRuVm41K2ZV?=
 =?utf-8?B?R2gvMXUyeGtCaHB0RlZaQ0NCdjZseEY4NWgrUGtlbVJhbmppQ3BybGtYWGM3?=
 =?utf-8?B?ZTl0aDdXc0NzM3JtQndBQ1BlS2xlaHkzQjdJU21Rd29VSUNBdWRWUllFMnNj?=
 =?utf-8?B?RkRWM3FiOFU2eTlLS3ZObVZqUnRoRHRiU1phODVqTjVzTXJiVzQ2UEZvRzBa?=
 =?utf-8?B?UzMwVnZJYTNQMEdSSkIwaXgrUDBMK3hlUzhjT21rTTNjTERpd3ZKNUFDdDNU?=
 =?utf-8?B?Q0J5WURzeGdpdk1UeDVncjZQRmsrckhyTUdTY3RVWXlLcGRNYXhQNzlFTFQ1?=
 =?utf-8?B?NkJKSm8yNXkxdDNRSG9URWljVm1MRGtwVmJrOE1Fd2Jod3YzdnVJN2tKQW14?=
 =?utf-8?B?c1ZWaTF0VXYybXdJUTFzRlhNdE1YRkJ4d1JGOFhLRVNyemdlK2dDQlV5ZlJj?=
 =?utf-8?B?b0dOYVM5VGFwUVNCMGRWVUVxODVaVUx1MEMzMFAyNStuSWFoMGJMeUordklt?=
 =?utf-8?B?S2Z3WEIzVHA0dUc2SFlqRWROUk9mTFVxWHdTdzkrWkpKU25QRmNCNHRuTVZY?=
 =?utf-8?B?MVVCMUNtNHJCOG1wVDlPZ1Z2cExOYWFEUGE0YVdRVUdzUUFvQ3plTERCRFBk?=
 =?utf-8?B?S1QyMjBodTZuMTRTUVAzb29CVEVrNVQzbEhUUjhrUnAwS1RkQjlramNJOGNB?=
 =?utf-8?B?Yzl5Y3cxWnRPcDg3WFJ0TWk3UmxPeEJoYlkxQ0pCOXF5Q3hDNUFreldUVFR6?=
 =?utf-8?B?UEhTZHJMN055NHhEUUdpZlp0SEptczFsZFR4ZHllWk4zWWdvTHJMaVRueHFv?=
 =?utf-8?B?MXFiT1J2dGYxaGxYZlE0MG11Y1BUdW5vNy9MSHdMZzU2Z3pjcENWRGRqa3hM?=
 =?utf-8?B?YUY1YkxzVzMwbm5NUzhmenBVUmUrUGxoZStDTWxIdkNpVTFzSkV2aW05L3lZ?=
 =?utf-8?B?WW9jTmwwaDlkbXJpYmhTS29WYktNSWRuQ3p0dG1hMDV0SFVYOTNWVzdrSUI0?=
 =?utf-8?B?ZVF2TTBORlRpU0tGT2JKTy9YTlhpUitwK0JLV1FrRTlndnEzSXhDUDFYVzdk?=
 =?utf-8?B?dzFGMnZmVStLSDRNMWdCeGZoZDBkeDM5Nk1EdHFHQTlkbm9pMXoxbmlTaS9a?=
 =?utf-8?B?NVVNQXYrbDJvc2M1WjFwRUNjeGljT29TVFZhNGROOVBaT1FOaG9YbTZ0dk4x?=
 =?utf-8?B?NHppV3ZWQlBmZWNHNVNXbHpZSkk2ajJOSktyUysyS1dubDU5SnNTc1hrb0FM?=
 =?utf-8?B?dllvSkhGRWhaaUpaekdYY2I0d0lHV3BueUVqdVpWZFpHNVRyZWJhbUFTakJz?=
 =?utf-8?B?dnpaRU1ZZExlOXZVNnVoNWU5Q2U1TU9YUHJSaTZIWHVuUFJ2K0JOY2hsTEl4?=
 =?utf-8?B?L1I3QXh3RWZQenFvemRQZm1icUVrKzRBdDBVbmtucGx1WWV0MmdvU0IyN0RD?=
 =?utf-8?B?YzhCZ1N4aW82dE9KUThheVVqeWEvVFBGMnlweTRHYmN4OXlidWpPbTIzdXdL?=
 =?utf-8?B?REYzM1NaRzdaZm15dDE0dXJEdmNOT1NvbWxjbEtMODBGS3JOU284bzJOeFVn?=
 =?utf-8?B?U1ltcGlhL2J5WUd2SnZTUVh6MHUrakp5UnJCTkNTYTFhQm54UlQxaUVlcW91?=
 =?utf-8?B?SktLeDR0SXNyaVp1Tyt5WnlIVm9TanNXVHFDT2xQYTJ0cXdHeVp2alIwbVlF?=
 =?utf-8?B?akI0d1J3WWthcnRmTDBxREVhOWVhaElNcFBwckZOV0xuRTRvY29jWkI5WXBY?=
 =?utf-8?B?VTVPVDVBQU1Nbnh5bWhSSk56bHI4T0U1N1ZyaHJtajNEV0dhc3loV3U3UkRD?=
 =?utf-8?B?TFZCUVJoZDgwZmpKcFU3dzQwNmIxNDNJaEk1b0pHUHR5YitnNWlNWDVrL2tq?=
 =?utf-8?B?clgzVzkwZnkrVEIyU3BOejVnd3pLTWFwcStJaUxBbjZpSitxMnpSZFluRVRK?=
 =?utf-8?Q?XnhKan/a00Saat5GnF+5ja5TG5nIIz3g4MVrrXJDAs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6beb6e-deeb-44ea-059b-08d9f730b0c7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 00:57:54.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KOvD01bFYIaznvbYZcMYEtKGp982/dqKmebzGFd0X3wvF2ppb2np1oeGZg98uq6U1SNviRK/AjzOxFiUL4fOVsVizt/giBEAJad/EDY10I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2815
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=856 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240002
X-Proofpoint-GUID: ONDMCBVpPbgmCxR9AdTAk7m45vieR2vz
X-Proofpoint-ORIG-GUID: ONDMCBVpPbgmCxR9AdTAk7m45vieR2vz
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/22/22 10:35 AM, Christoph Hellwig wrote:
> Hi all,
>
> this series tries to clean up the swiotlb initialization, including
> that of swiotlb-xen.  To get there is also removes the x86 iommu table
> infrastructure that massively obsfucates the initialization path.
>
> Git tree:
>
>      git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup


I haven't had a chance to look at this yet but this crashes as dom0:


[   37.377313] BUG: unable to handle page fault for address: ffffc90042880018
[   37.378219] #PF: supervisor read access in kernel mode
[   37.378219] #PF: error_code(0x0000) - not-present page
[   37.378219] PGD 7c2f2ee067 P4D 7c2f2ee067 PUD 7bf019b067 PMD 105a30067 PTE 0
[   37.378219] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   37.378219] CPU: 14 PID: 1 Comm: swapper/0 Not tainted 5.17.0-rc5swiotlb #9
[   37.378219] Hardware name: Oracle Corporation ORACLE SERVER E1-2c/ASY,Generic,SM,E1-2c, BIOS 49004900 12/23/2020
[   37.378219] RIP: e030:init_iommu_one+0x248/0x2f0
[   37.378219] Code: 48 89 43 68 48 85 c0 74 c4 be 00 20 00 00 48 89 df e8 ea ee ff ff 48 89 43 78 48 85 c0 74 ae c6 83 98 00 00 00 00 48 8b 43 38 <48> 8b 40 18 a8 01 74 07 83 8b a8 04 00 00 01 f6 83 a8 04 00 00 01
[   37.378219] RSP: e02b:ffffc9004044bd18 EFLAGS: 00010286
[   37.378219] RAX: ffffc90042880000 RBX: ffff888107260800 RCX: 0000000000000000
[   37.378219] RDX: 0000000080000000 RSI: ffffea00041cab80 RDI: 00000000ffffffff
[   37.378219] RBP: ffffc9004044bd38 R08: 0000000000000901 R09: ffffea00041cab00
[   37.378219] R10: 0000000000000002 R11: 0000000000000000 R12: ffffc90040435008
[   37.378219] R13: 0000000000080000 R14: 00000000efa00000 R15: 0000000000000000
[   37.378219] FS:  0000000000000000(0000) GS:ffff88fef4180000(0000) knlGS:0000000000000000
[   37.378219] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.378219] CR2: ffffc90042880018 CR3: 000000000260a000 CR4: 0000000000050660
[   37.378219] Call Trace:
[   37.378219]  <TASK>
[   37.378219]  early_amd_iommu_init+0x3c5/0x72d
[   37.378219]  ? iommu_setup+0x284/0x284
[   37.378219]  state_next+0x158/0x68f
[   37.378219]  ? iommu_setup+0x284/0x284
[   37.378219]  iommu_go_to_state+0x28/0x2d
[   37.378219]  amd_iommu_init+0x15/0x4b
[   37.378219]  ? iommu_setup+0x284/0x284
[   37.378219]  pci_iommu_init+0x12/0x37
[   37.378219]  do_one_initcall+0x48/0x210
[   37.378219]  kernel_init_freeable+0x229/0x28c
[   37.378219]  ? rest_init+0xe0/0xe0
[   37.963966]  kernel_init+0x1a/0x130
[   37.979415]  ret_from_fork+0x22/0x30
[   37.991436]  </TASK>
[   37.999465] Modules linked in:
[   38.007413] CR2: ffffc90042880018
[   38.019416] ---[ end trace 0000000000000000 ]---
[   38.023418] RIP: e030:init_iommu_one+0x248/0x2f0
[   38.023418] Code: 48 89 43 68 48 85 c0 74 c4 be 00 20 00 00 48 89 df e8 ea ee ff ff 48 89 43 78 48 85 c0 74 ae c6 83 98 00 00 00 00 48 8b 43 38 <48> 8b 40 18 a8 01 74 07 83 8b a8 04 00 00 01 f6 83 a8 04 00 00 01
[   38.023418] RSP: e02b:ffffc9004044bd18 EFLAGS: 00010286
[   38.023418] RAX: ffffc90042880000 RBX: ffff888107260800 RCX: 0000000000000000
[   38.155413] RDX: 0000000080000000 RSI: ffffea00041cab80 RDI: 00000000ffffffff
[   38.175965] Freeing initrd memory: 62640K
[   38.155413] RBP: ffffc9004044bd38 R08: 0000000000000901 R09: ffffea00041cab00
[   38.155413] R10: 0000000000000002 R11: 0000000000000000 R12: ffffc90040435008
[   38.155413] R13: 0000000000080000 R14: 00000000efa00000 R15: 0000000000000000
[   38.155413] FS:  0000000000000000(0000) GS:ffff88fef4180000(0000) knlGS:0000000000000000
[   38.287414] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[   38.309557] CR2: ffffc90042880018 CR3: 000000000260a000 CR4: 0000000000050660
[   38.332403] Kernel panic - not syncing: Fatal exception
[   38.351414] Rebooting in 20 seconds..



-boris

