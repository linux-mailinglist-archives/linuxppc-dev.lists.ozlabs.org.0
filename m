Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F484CDDC7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 21:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9K2y30Bxz30HY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 07:19:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=X67tZTA/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vfDSotFZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=X67tZTA/; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=vfDSotFZ; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9K255YcTz2yZc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 07:19:02 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224HFvRS019110; 
 Fri, 4 Mar 2022 20:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=g1zl/jtSQUcv6zq5IH8TsnBi6aRZ+imTi1+joGXQAjg=;
 b=X67tZTA/uVEO4CnS81ENaHWi3A7hafrQn4IZcb+uWh7Adspl7Uyq9ezdqYNszdSqAvE8
 S33Qx0lx3EZtxt9qdgPtgA+lvoT3/pprjdJiaQTO6lh5IQOOKAPiZZsJxg5L3BF1O+7A
 ZF6lIBlNBEmybXxN22J6r7hd7rVP490gx70yeVBKC7yXcQoXJK5qXCqphvXKkHCk7nnY
 D/7W5/5lj6TCxTLQEh3O50NP/2k+fkdua7I+Gk1kz+L92GrwZR0Ni/A6di5Nlt3stnxY
 KCa6zTNvhQFrEpje7SsUNdbfc9dkIvekI2yeS4sFQMtZKIW1arYvBh0PLoqg+dvwzqFs uA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hvar45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 20:18:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224KBTqf043959;
 Fri, 4 Mar 2022 20:18:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3020.oracle.com with ESMTP id 3ek4jhcggj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 20:18:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhGarKdRSorgd/CEDvE1i2bAtbM6QhxahtIAy3DZCcJWfUcdlz1lKSu+KVGSSTi6ETYg2DbHsaxEudu37OePhs/kfYUY/f+qpFCPLB8NqErO82r95sf0buZKEFWmQZuU9EUuhEQEyRuLIqBQarsJTD087W8WyCQxg8MXJnkgHHE/ENEB8ZsPD6tnEgIVCVmYUVcbUcbzk6nxGiG5kZGTyf77H5ZZBxqCSG3E2Q7boGtVTxSq7Qm6V6yj2b5LhcsMrScFk9S4ctqnWbQTlxAYMXsokcuKNqfUrNwymZr7t5XM/uOtBKs82YRBOvzc/MAg6801FOmlKIw9B+DweOHnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1zl/jtSQUcv6zq5IH8TsnBi6aRZ+imTi1+joGXQAjg=;
 b=PtvWc7g9PEdMkY7/88sO2XzUd3hhiS8fkVbr4Z4W8KXNfwRymBm+UO/OYPEr5uIkcjarU4IYcEMLcWZYPobe3tmOjD5JqOSQMaaDvvs0ax/1ccmOKBrxWvng4L868qJGjSg3QuEGrYBM6Z89ldiP7YmzmeDZ+Q25AuousH6lcvviQIeUHSmbpQaTsyf720o6n+JYTuFmwWBQElHs521x1nMgh7OO4JVY2W3udr4mV8EB2Gm7heE/Fu40WvqP7/So352v9hfWojeVDz00DVPI+jEmIhbcpjchEJfw5tUdScyipuIsFvC6AF+FREon/5ZWHCesH8qtsJgOnpkmcqDoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1zl/jtSQUcv6zq5IH8TsnBi6aRZ+imTi1+joGXQAjg=;
 b=vfDSotFZI8+Of/YHYjFPFb8zoiBL0WfcJPGV5JvJw8mXUV8e8D6amRRR5eOAQR4cXvXh58eU8Du/SBCVmVHDKO/fAPV/LFoeWK8RKTvR0e/+J2y7Bkcd3B5UBDHlcfZ3fjTvFGLCYp73N4ZMVZWdG/QtOvJMiq2iZtlK4GKcAak=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BN7PR10MB2418.namprd10.prod.outlook.com (2603:10b6:406:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 20:18:30 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 20:18:30 +0000
Message-ID: <75cb15b5-d861-1b88-5413-df326c3f1144@oracle.com>
Date: Fri, 4 Mar 2022 15:18:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
 <20220304172859.GA12860@lst.de>
 <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
 <20220304174308.GA13515@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220304174308.GA13515@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30b5e278-3965-457b-18f6-08d9fe1c262e
X-MS-TrafficTypeDiagnostic: BN7PR10MB2418:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB241890FD23B08A445411034E8A059@BN7PR10MB2418.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nocj07XcbmJrvdPiYW/qSck1N32eVRKcrdh6rTaclqIVJHPZSnzlefVkdJMIw50PFKxiBmlyPrDIV0osUmX3pB2Ofm3oL0RjbZ1zfamE4PR5OQL1umoasZfbyMmo4gjdEfesSb83V+qXlieDfDWY3Hzd0koHSEQxDUWxH2+6YL/+iFA2MxVOBSr5fRpjSaScip6tbhYdLNE7zFm81/daimeempItWRi294b4OU/2mlE4f2xGyCX8qkKUKycBTMJZJ7YLRIrsKYT+Yx30cPGDH8Gta5ARuUfrXKc+IUPqKx91vpn633HRjfXRL63/6M+yPA+GErmVjynuEyGvDFLmMdr45g1zhNPAKrUbUgwlZ4SlM1PxYWFVcTMasiry3H1jhAZcbJgV4tBgDlZCkjLTNCmb3kBuwkuW38UIFVXmg2fAjcfk0fXSOG++ZnFKjZE20LMzK5MBgusm9s+CtPOkzXbNhyxJGZVltnVRimU8Zti/oDITM8uRwEGemxxfU+IgXD+WYwbw7zpjdTz3FuDrpRqU8zrnCoJzoZe1CDjgqdoXhEl1hGBmUiMjCrOUGViZXOd43DUyzjzwMGxYhUbQXPry4ZuLDNyZoXvRi4ZevKE5eJAJjUTfK0WQ+K8qS5QEUhotZLzr9Eoy7UbiEtcjIzMzLyh9BVm0Us8RiRsdWGpuRLdPgrL6mWTw0ZldPvmvRL2Rk2sSlMG094psobP64RK/mB+rR+wexLYTpo1MC/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(8936002)(31686004)(316002)(36756003)(66946007)(66476007)(6666004)(2616005)(66556008)(6486002)(53546011)(54906003)(508600001)(6512007)(6916009)(31696002)(8676002)(4326008)(83380400001)(86362001)(186003)(26005)(44832011)(4744005)(7416002)(38100700002)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFZUnV5Z0R1TFFPcTlhdm5BMWx1Z3dkczJWc3Q3Sjh0aWJFTk1OeHRIa0ll?=
 =?utf-8?B?eGZIc05ua3gvVmZESXAxWlJiU2QzWGlCNDcwRWt4eEQ1RWFDako1ZU41UHBv?=
 =?utf-8?B?MkF4K2R2RUJkUWtHTGxDaXdLcE1UWXQ4OFlWd1NyRlV1UmtxTllLTUkralJn?=
 =?utf-8?B?enJaVU9Mbjd3d3NKLzN4aU5sMkdGMjF6K2Y2RWU5S3NLMVZMZjltL1Y1U1JV?=
 =?utf-8?B?b2daeG14SlFNcHd2QUxGVUJtZzVjUE1pNnh4VEZiemYwYURzMTBVc21BTTZS?=
 =?utf-8?B?Qm9tRTVjRUFFZzcrUTJQNXI0YnFkY1FSUHA0MjZXcFJWSWg3L1g3Sjl5K3I5?=
 =?utf-8?B?dEZXQjU1ZGJkc3dFdnNmMXNIMW5JT3FHYzlseWxTVUppRTV6aDRSM1hOdXp1?=
 =?utf-8?B?a1lpZzdVNU0xN1NMeU81bCtPeE1CbkVJd1R5VnNBT0xYVXplN3FUVmkzYVIz?=
 =?utf-8?B?SXU3aEJYclg1dnN0SlgyeGlpaDk1YlRvWTE2YlJoaGdzelZld1lFSXZla1U2?=
 =?utf-8?B?dUNTVzZ0NnZYcHhyRGYyYVMxYVFrbVk1UU43cElBejluY3dPdlkwL3E1TG0v?=
 =?utf-8?B?a2FKL0NUeWpwNGZWRFBDbzVYMXJBbHZzdWU4WjFmMVlOT0JpK1ZtbHRFVXgv?=
 =?utf-8?B?TXJyeHBSOGJuV1l0SDRxMUROaUZCejNSaFhXVjczV3JRU1F5QW5qc241VDgx?=
 =?utf-8?B?R24yNEJVRVFQR3JBeFlRVkowL09IZkhidHdUUXdKSUMxTTNOMVJIeHlOMGI1?=
 =?utf-8?B?ZzBFVmx5TUtWM0IvSGdqUkhCQzZBZ1lVelk1Y2tRRE1jVTl3UEo3QUpmZW4x?=
 =?utf-8?B?bHlOeGliNHVJREhIbkZhL0RiQjM4Mzh1eHlSQkU3RTFOMXl3K29Ick9jdXdS?=
 =?utf-8?B?TDhKZGFQRlB5UTZVWkNQSHl2OW9pUmRJdS9lQk5wRzRYWHNMYk01RlJwVTdC?=
 =?utf-8?B?NUcyZ1p0UmpGVmdqTzg4VXowbGg3THhOb21ESU1XZVNDZVAvTFJIQm5aYTRk?=
 =?utf-8?B?cDRkWlFORG9NTlNhVSs5M2RrV0VmdTJERU9TU2RWVXpGM1RuU3REby9iUXda?=
 =?utf-8?B?cEh0allyRXBzMUVqek5YanJVS3pLR2dva2RLL1RkcW91K1FSR0h2U1RtblY2?=
 =?utf-8?B?Z0JVTWtCaUN6ZXNXcTdhNzk2Q3VkVndTSHBwMS9iL29pTnBBOXVNd24vNCsz?=
 =?utf-8?B?YkRrSjg5MGpBcFhMbUgrY01sVnhraHVDU28wV3ZiakRyL282WEw2Rm12Wmoz?=
 =?utf-8?B?TmtZbXFyN1BPRVdQWEI0OStUZjlldmFnVDFrTHBhS3ZzdEl5UmVnSEZFemRU?=
 =?utf-8?B?TjJTdnMycmZDSzlqL2daU1ZXUXBQdVRUaWc5QThJemlGcUNzVDBlallrR2VS?=
 =?utf-8?B?SHRma25mdFBKdWE5QzBJc0RRN2hMblJkV3pndjdtckF1UFkzMzFCQWRTZ3FU?=
 =?utf-8?B?cGVKaWx5eGlLVm5TN05CQTVYdW1WRmVyc3lXdFhmSGg0bGwvQmZSSVFrTGtM?=
 =?utf-8?B?V3JuUGNwSXAxVzN0QlliRFREVkwrRHFmUEpEbnFGKzdlWFllTGpOa0VqVHBa?=
 =?utf-8?B?OU1GUy9tdUw4Q0RTdlZlSnZZTllJenBZRGhJcTBKZkpUYlE5MDZoZmNzRWFD?=
 =?utf-8?B?c2l2OXp5T2NySHY3NHZEc0VpRldYVnA3bnZ5N1ZrUno0ODBmZURrOXNwK0xj?=
 =?utf-8?B?aGpYZ24xMDIvZ0dRc0pIQzhNYmxpc2ptSVJFY1c2WitUSTVLWkpPUldVSHdo?=
 =?utf-8?B?WnJnSGVqWk9JWFE3akdEZ3Boci8xYS95NmN2bEhET0lsK0lPL29QTjltRG96?=
 =?utf-8?B?ak1CVzF6OTRCbnNuZDR5NnZaU3oxNGFhSjZFMXZXNXBXcGIrQ09TTXIrNDZM?=
 =?utf-8?B?WmtDRXZZdFNMbVlZUjZnWkxrVGVUWHhZK2ZxT2tsWkc2dGVua3dybmMvUTJH?=
 =?utf-8?B?Rms4czZGUVpzUUtmMlBXN1NkclYyczdOa2l4a1BGM2dCR2paT2w4L2JlNDJW?=
 =?utf-8?B?dGxOSUhSR1BNVDZsNk01cURUZWVXUEtIblpDYXBLaGlQSDF3bVN4Zlg0QVI5?=
 =?utf-8?B?ZG84VkFnNE1rS0RNbHFkdEVsZzA1NDBjeXNJVnRaeHcyOHBLZ0ltZXR1bnlH?=
 =?utf-8?B?Qmsxd1ByQ1hvZVdDVmNWL05PakQ5RTF1S0dZdDBUaXV3MEFxWlNhTTk4UERU?=
 =?utf-8?B?Mk14OG9xZG5xZGI1OE1QSEUvaUJuOWVpQzREVDZzNi9rZ1BKZUl5OGF6RWd2?=
 =?utf-8?Q?7TtBsC9N4JQqfrX++FXqcxmF06UPoaqPsyQClstjWE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b5e278-3965-457b-18f6-08d9fe1c262e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 20:18:30.5230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV48hjgWHi6Pbqx447K51UJ+OGtJbfpJe9pSO8+HAKAEtv/1bzJFBKyy5we1zMg7V9o3tXqkdgD6bnD8ytxaTZM4SUSjr4v+bRwGlIY7Qoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2418
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10276
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=823
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040101
X-Proofpoint-GUID: 8hJhYIJeTbw-Nq1Sqvvk0fd9jQeRkrHK
X-Proofpoint-ORIG-GUID: 8hJhYIJeTbw-Nq1Sqvvk0fd9jQeRkrHK
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
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/4/22 12:43 PM, Christoph Hellwig wrote:
> On Fri, Mar 04, 2022 at 12:36:17PM -0500, Boris Ostrovsky wrote:
>>>> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.
>>> That looks like the swiotlb buffer did not get initialized at all, but I
>>> can't really explain why.
>>>
>>> Can you stick in a printk and see if xen_swiotlb_init_early gets called
>>> at all?
>>
>>
>> Actually, that's the only thing I did do so far and yes, it does get called.
> So, specifically for "x86: remove the IOMMU table infrastructure" I
> think we need the one-liner below so that swiotlb_exit doesn't get called
> for the Xen case.  But that should have been fixed up by the next
> patch already.


This indeed allows dom0 to boot. Not sure I see where in the next patch this would have been fixed?


(BTW, just noticed in iommu_setup() you set this variable to 1. Should be 'true')


-boris

