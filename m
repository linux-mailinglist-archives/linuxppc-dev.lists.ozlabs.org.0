Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C84CA7BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 15:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7x446VKmz3bry
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 01:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=sGVPTxIX;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xWpNRvFC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=sGVPTxIX; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=xWpNRvFC; dkim-atps=neutral
X-Greylist: delayed 3569 seconds by postgrey-1.36 at boromir;
 Thu, 03 Mar 2022 01:15:23 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7x3H6f2Pz3bcm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 01:15:18 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222CTDQM017661; 
 Wed, 2 Mar 2022 13:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+H8jEbxRAjH5LJGh19NFnoJv1mnvS0Fd8stoMxTA0w0=;
 b=sGVPTxIXrSbagJ6ynSSDe816afmmTUjiMiZbnKewSSIpJkSoge6xG7EHhHCPgSidbgpG
 vy9fLOYAgrIbJlZ3WThbY1UyLw86tr1NTwwQLU/Q6GjO/6jXhqTH2Kk2QEAWSPWZc7pr
 DYAxABYfQCSLm9dGK5z+vOyKao+ColXnRe/UK1m7SVW5y1IwfBa1C8uzi4ohVaRmNQaD
 CEMNz8tJ1tpqvReQOy1MQbD8DBrk5UIw68/+c+i2mQOYkO0EcMh83nN2Ka2Joys2rDmU
 IsHaqAW1Z4liia9hOoIRI8ScirCJ9XYd5PcFmZUhfN8u0pPRmKUUgno+cCLigFz2k/yB GQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh15anmgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Mar 2022 13:15:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 222Cq3wi138590;
 Wed, 2 Mar 2022 13:15:13 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3030.oracle.com with ESMTP id 3ef9b0vcbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Mar 2022 13:15:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgHvmPUaOKjmTgFDRNyH2JK/nxIxKkD4elHWKwQzktzYLmilMNAijcf33DQQKQboEe07+iBVmL1MGbCLbJZlx3aZXjtbwmFKEoACvzg8YbahcPIE7FxRitBNV+KiWD34U7mYc5clIeXbd9rWfC8ESwhp9s9lbwKIrf8Y6OJ6IRXs566pG2Lsm5mhhsSCpLnEhUTD5vE/5IHLNdArFBlxN097/VAVLhnsR7wqfanCDgr8hU1dlCaZfeJIgOn06RHOqqoct/IJ89PUSA+7xbHF5NIgjdRJU3eyJzapVGbiI9ZIWp3almvhuQy5CTVIPO7S0IhGeFwMYTlKkaaCd0TcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+H8jEbxRAjH5LJGh19NFnoJv1mnvS0Fd8stoMxTA0w0=;
 b=YamrgLVX9B/qDq9QzF6II8wlZNthJKbW5iq53COtqYiKrf0HrhczdS3GUOwEHGNuw1wuUXG09BDIRYnB+Rx+5/RfiVASEFCd0JFbNPnPDJtHTEkZzT9fdnQHIUKTA86ouTSqUS7MxVFXQrpCMcUOLCujcX/uKEAbYbZ8fNrtZpUAzVKBXSmcCZNzPoqZelLCVA6se8VX7b0y8Y95bZz+ycb3+82QmPMqtQoTtOdrAI39CoABSuXcfLpcDBW9Ojbiovsz5qyACOrqLkmrWEscr+0V2slJMTUWMb/1R1gdfDs89mwQYFyJO4WY74wYO5ARLaztGM8UpRhz0zvBwWYMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+H8jEbxRAjH5LJGh19NFnoJv1mnvS0Fd8stoMxTA0w0=;
 b=xWpNRvFCMKQ+b7r+RN5bpz74Dv63CfBbIf5apoeBrlba9WYOtJvPEmZt911JQ/HoMTtAaZamyB/xb5VID0ghzq7PaGjs4cx1ivaDw6RjirQaH8PPg6U1qBuygmIv0TK/8eMScWB9rcnmB4/nQAEbGkhtkaGRvmlhTgOQwjmHveE=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SJ0PR10MB5533.namprd10.prod.outlook.com (2603:10b6:a03:3f7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 13:15:10 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5038.015; Wed, 2 Mar 2022
 13:15:10 +0000
Message-ID: <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
Date: Wed, 2 Mar 2022 08:15:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57f1c317-ff3a-4cac-829f-08d9fc4eadcf
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5533:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB55333F6B5F5D9371D60982E78A039@SJ0PR10MB5533.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KJwB9SxCqeLlNQ1Y5kvptorXPIyjzEcwrSw5cMQq4WMGQJNjONg5U4YwqywH3QNElFsQyzE9fDKUvmAFN9eU9jHUA09tJ03eaOHSVl8fLNVzzvhsHDfrk+Xz3sR1h+HGXY7EGF2FS/kILknpvbJavcAcm0nh1qQPE2x/vR/bK8/JlJTPfmDN5FA41H1UBElCjyklbo47P9mqTmvsf2/hZHdelU/U54wobNjybfIYwGOg2BTmP6L9TbRgk6lVBA6cPciiQURffcd0BfHVUIjRwl0TVykSnQ4SKortEMCHF/zt20qc4HUImJQmHhESafU7+m22MUWi3xdzmE2lu9tAl2rtsd6qEPf/JOdO537yBgqeImvORAOz4c0wP23wFtJID/9GR7oGbEPpmDba0G8ulotrUaFlaxvbU4CP8zoOsS74WsUfxYZL1xtNV8g3T4WcXEDz7Fd7MinctXAi8zLZMT5dKQlub7eZoUyqeqXiQJJN+XoVJWG/9zXONQEi544F4OJQFgRtrrckNdgSMcmM+kQH9vSb819Vxw7Q3I86ljT3ZBGezuYvE0zIKvjGdCCLp4CDtBVuy2wRH01e19ig5eQmgH8JHco5Kow6kb6x2+dS6lIJcK1yq6SDCA6crwtD5RnEKTQ9gC+c33149RAVdmASQLiimsze/lwtVAUzn4GUOah0nDN9AoH2Aj5iEt9pVIAB1qD8mkLf39IQt/CioRbyUd9Gf9FVpiCD272Ipk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(110136005)(6512007)(53546011)(2906002)(6506007)(2616005)(86362001)(38100700002)(31696002)(54906003)(6666004)(44832011)(4744005)(4326008)(5660300002)(31686004)(8936002)(508600001)(36756003)(6486002)(66556008)(66946007)(66476007)(316002)(7416002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk03Vk5LOC9NN29RTmV1SStZYWVzYlVVWlhEQ2loT1ZKQmhJZzRRYW42SlUr?=
 =?utf-8?B?elAzemVjcjJrMS9qN3ZwQ0o1bzhKTUM3a0hoVDZHL0x2c25yQ3g0cXFxeVhl?=
 =?utf-8?B?c0NSWHlrTkh6NUY2MWNmSFlKOEtqSUNuMENzcnA3QkdlYi9ydjJpazk1SGxW?=
 =?utf-8?B?dlFKQkYxUW9jRmVhMU9CRHlVaXQ4MG9hZ2pVbWZwQjdNTERBTWNzSTFkbjVX?=
 =?utf-8?B?bk1rTTZBOEwrb01HUjhWUThTUC9SMjVJalNXblFWUmZzSlBpbHZJVnpLNHFM?=
 =?utf-8?B?bWJpWkVYNnl1Mkp0cmozUlBrQUhlQnNjTFFrMXJzZHo0ZU1BSkhCTVpjTGFN?=
 =?utf-8?B?ZFZRN25QaGFWZGVTeG5vVjJ4TVc4dmtyR0d2eXdLTXd6TDRtNHliN0dwbFBG?=
 =?utf-8?B?d2pKTnczRlQrV0NRMSt1Q1dySjI3SzZMK21pOUJVUG5SL1IrVkc4NCtmdFBC?=
 =?utf-8?B?TnBsMzFqZFh5K25xTUx0RW9NSmhrK1N2RDh0L282a2VNYzdYWnJtZFA2RzJL?=
 =?utf-8?B?K2hFWklHZURBMEdhMkVuWEw0ZFFyMUhqL2JRMzcwNzY2SlJ5VnBDcG5QeC9x?=
 =?utf-8?B?ZjFnRmY0dWUzZ0RmRk5XTUhnTW1yNWh3RERvUUw2TWRQc0NuaTFFdTJnclYz?=
 =?utf-8?B?Slo5WXNreWFaa1ZHM3RjOE5WWEFreVJMRzI5NTNlQTZRTEhISElMSEdRWnBa?=
 =?utf-8?B?dG9kN1NtcVVqaDJOUFcwNXVNS1pXOVZrTC9SZjBuMVJXVjBtMXZ2Nm5GcFZa?=
 =?utf-8?B?Z3RSb24zSTYzbm1UcjFWcW9wWlpxVWx6b3lxbUhvdE1SVkIxNnpjU29PS25D?=
 =?utf-8?B?d0VKdmlEOWRCTitQbVRXZ3FMTGxNQTZPTlJFOU10RndzelFnV011UStBbTJ6?=
 =?utf-8?B?bHErWEh6VlZMUFJRWnV2QnBwc2pJTmZsWHNLdWxiNUFuV2w4UHZxQkFIOEpS?=
 =?utf-8?B?aW1WODBsd1pGRis2bUd1R1RZTy95b2hrUktmais2eUNXS3BpSUh0aW5MWkFK?=
 =?utf-8?B?K0svR2xpMzNvdTN0RnVFdDE4bFRSNXpPTDdUODlDVXBaaGdFaWV5aXdPTWVE?=
 =?utf-8?B?Vkk4NzlsdG5PU05MVnN1T2pnZnJJaU1QeVFYT01DTTBBT3hqQW5KaWpQQ0pX?=
 =?utf-8?B?M2kyNzczdEk0QTVIK0pkK25JZnp5Tjc1QWo4SHhQeU93QnFLR3kyQVpqN3Uv?=
 =?utf-8?B?N1RQbTluYWVXcWhLK0JEWHo0UStoSmtOdTJlMnFkM01sbDAwdFYxSFdVQTRo?=
 =?utf-8?B?MkcreEFJbFZmNjRUdWhRTVFyTjA3aFR3Z1FkZ3dRcDh3L2VyUlRUZ2ZFYWtv?=
 =?utf-8?B?RmxiRU02bTRPMzI0V2R0RVorU0VhOGVZY1E1K2twWXlIdTFXeFZ5RFowbEZm?=
 =?utf-8?B?dTZnUC9XTFdHUUNBbTdEaUowYmJzSXBEZ20vSWVHdnhqWWIyOFZ5WFZFeDhs?=
 =?utf-8?B?NXFueXdWUGdkRzFxblRjK01nb3FOYnl0K0VMVGpUYkVRclNrM29zc3Y4eE16?=
 =?utf-8?B?YjNJKzBxTTZQa2ZDMWlyMEVzejVqaEhuQTBBVnVVZ0VVdmJJdXJqTmwvem9P?=
 =?utf-8?B?Wk83YVl2QmJYZk9YTVZWY2NlV0l0YThCd09Wb1ZYVlR5MjhaRytKcWlnUDNF?=
 =?utf-8?B?eHAyays0TC9TVm1Pa2FUdTZMaXNJS2FSSnhpYmFrbjlzaWNlQjVPWkoxdEto?=
 =?utf-8?B?b0RSRElHRnBCTlRydURXamJ0TTZzajI4OGRrc0FySStPVnRMUEtRdkRNVUIv?=
 =?utf-8?B?OWQvK1ZnNDRFVXEwdy9vRFFIb04xeU9RS2YrZUVZRWNSSFZSN1h4RVdHamli?=
 =?utf-8?B?cUkwQkxaeGUxT0g4Y3NyNDM2RkJsYTdHbEZ0d3lXUkgySkdMRC94YzhRT1A1?=
 =?utf-8?B?YWNuVHRTbWhOcjdIUmExckxtdnlIUmpZTmJGWTdjYnJVR3czMGp5ZE9qdlgw?=
 =?utf-8?B?YTV2d0EybXA2MWhTbHFlMDhvWCtOR1ZaV29tN2NuRXo3LzBlYUsvams5dUU0?=
 =?utf-8?B?Y3hUblIxeDN0cGlKaW9XY3ZUd0VNZmh3NTRoMUJkY29tTHZPTzNsbEh3OUpM?=
 =?utf-8?B?MUtERHBla3ZnNjdlWit0K0VzSjJUM3NUNkpwTndXVXA0K3ArNVdESWFnU1BW?=
 =?utf-8?B?Z1J0T0QvQll0OXFNa091cWo5cmkwQlFCaHBrYTVBSWlvZXZ0UldodnNtMlB5?=
 =?utf-8?B?bm16bUorTE9zbWxjOEpjYWdGWTZSUm5yc25nK2dnUHEyb2lpMGN1RGdqUUdT?=
 =?utf-8?B?SEdyWHl2Y2NqN0kyT0U3T1lKcXFRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f1c317-ff3a-4cac-829f-08d9fc4eadcf
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 13:15:10.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9IIOBKc6c6QhVKe/5bkfbkaWQSPhPm6GmdCCxj3k9wSiUgOSXNzz6y0YmKoKAg4JLcdXQJpLOfjRQSt7BY9UBTEuprmMHXnOSm3nRiKsCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5533
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10273
 signatures=685966
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=939
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020056
X-Proofpoint-ORIG-GUID: G0FxjF5OpEILlkZGoBX3aG3B-oBasDld
X-Proofpoint-GUID: G0FxjF5OpEILlkZGoBX3aG3B-oBasDld
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
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/1/22 9:55 PM, Stefano Stabellini wrote:
> On Tue, 1 Mar 2022, Christoph Hellwig wrote:
>> Allow to pass a remap argument to the swiotlb initialization functions
>> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
>> from xen_swiotlb_fixup, so we don't even need that quirk.
>>

> Aside from that the rest looks OK. Also, you can add my:
> 
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>


Not for me, I fail to boot with

[   52.202000] bnxt_en 0000:31:00.0: swiotlb buffer is full (sz: 256 bytes), total 0 (slots), used 0 (slots)

(this is iscsi root so I need the NIC).


I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.


-boris
