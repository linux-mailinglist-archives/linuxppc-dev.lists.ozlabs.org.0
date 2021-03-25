Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29E34884B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 06:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5YN86K5Rz3bsC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 16:20:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=vLJPWTWr;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mpAFQGnE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=vLJPWTWr; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=mpAFQGnE; dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5WWm4sLBz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 14:57:08 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P3n58L192651;
 Thu, 25 Mar 2021 03:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XEzcBYN5EVuuly5bAZXj1aJMU77+78DYkP4J08kRRMA=;
 b=vLJPWTWr7GgTj9/9girDliJmlnLkFazpR3eUACfWIDbIpv5bKf42asW5ExwsUJME8Qzv
 iuokPLua4fKme4xHuAifegOBwN9VaR0VhjeJb7r/Azuq3zGfrCfJgMoCsEiPUORwAEWK
 rJ4DGaLt0v2LQ+NJe8W09AvFEu5/zTVmiBkWt1VDKLsLKCXGI/pT3s8Ek4nHDq1l7K/U
 3uHF2Oqya202r8TJxmrYS0Y4EDx/904ZiQqap+KEWjFjg11V55dQvf97yJ6e9+S6Ifw/
 NrOzaBEsXjrO6IZJ2pd0P4Krwz7wlmba8SnN2s4odUC+79NgTHUHVu18uR2AqA2w3ta7 fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37d8frcwfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 03:54:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P3pFh5134348;
 Thu, 25 Mar 2021 03:54:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3030.oracle.com with ESMTP id 37dtmrmuua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 03:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5C4d6DbKc0hVDHdsmeDJVDlUcejYnPc4D4cLuZR88mdIksuYQLfu+L5ZA9iUQQryy6Z3xhz0qWgQg2JhtYgW1qGGemgpo0hVtAfghQsd8/WdahhdeZ/pE9z7FYcqgvX95KTGTfOYA+q4XshTz9wCExERNZrji03GXFcCldjvv8sRRLNPlTphmWG0tEPDWrgTlRXPGOVe91hr+9VlsDa4sOQ011IGXQqsc5Bs1TItNF4zBq3lXj79/M6/Pqn960FjcN21MQPAk4z+1dgCnt3KX7aZ1k4QrQd86IADYoqwcqvWhylC89a5xymYK5l8V5MNivN6pGKuu9FkVvjoJU9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEzcBYN5EVuuly5bAZXj1aJMU77+78DYkP4J08kRRMA=;
 b=mvZpNLVCBAppuUESt03nlSaSeLofpqyuKw6kg6D46Gcq+Q2qBWwddNOxa80Xj5/U5KYSLdwF3Dhrji4y+4szBReYL4TZnvGkrfaDxU/FCZgcm8wYlt5yKLkTIKgm/JSQ3hBHCsbtunyFlPDxW0XkL4onXa6f1RJBduG9X6nQR/6dvqf6DFmfVjwlVCJg72OkaF0xy44jeNYlSnSuMXESb5u/sg1MsZKwujlUS2whZIYxw7Nv0I22JjBHBlG9N4O3KZ3CVRWn/jeOn7U+Mm9y/5Qe1xPiw1/undoa7VIRXZugk8zgNndBOeI7l0zdzhCL3gu+OHIp4zx0c5GMLPhNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEzcBYN5EVuuly5bAZXj1aJMU77+78DYkP4J08kRRMA=;
 b=mpAFQGnEU/CLZQtftWmod4cOpfVJkFkNrbyHlLcB7lSLzfx7lDw4c/Lg/bnJ+79INpt/I6vPYrjzqVKmZVbL5CMh6G3NyO9HrphH4OcXqeR/5SoCX4P24gFU7dVzc2tco9CDAXjgwJCkrxjA/mhMJqgT2T1D/xKslz1sIEuRHEg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4774.namprd10.prod.outlook.com (2603:10b6:510:3b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 03:54:17 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 03:54:17 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/36] [Set 4] Rid W=1 warnings in SCSI
Date: Wed, 24 Mar 2021 23:53:59 -0400
Message-Id: <161664421199.21435.4256343253687572354.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317091230.2912389-1-lee.jones@linaro.org>
References: <20210317091230.2912389-1-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.201.9]
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by
 MW3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:303:2b::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Thu, 25 Mar 2021 03:54:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb61a6a8-9201-44a6-ba11-08d8ef41a941
X-MS-TrafficTypeDiagnostic: PH0PR10MB4774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4774ED8FC99321F0013A53448E629@PH0PR10MB4774.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCnpHrUfkBZXfw9LMgbjk5T+3ZkL48WNgT/MzcfJkeSOPFdBxDuffW9bBMVYYjZNhBoqbwat9cxDNJwv3/a5AIP88zrlNMHNj2lcgp9y/HEkysFM8H5QTzf92QKuV9FtR5nLd1nrmXGXK7uweWiREgqsRuXZVwwWGUVi6lzBGYvFNm/jEcU6kv5P65BMMXFWxOrtwnmgociOt8X/0oslkWfMybMl3qwXIBw3Eqp8e0j0WObDeiiGaahzmTGlWPopqOA78WoU6Y8z6SglMIYoxdNAKRmLpKXL2QR1gmY8mEfrvZ6X3QEfIUsXY0klNtERPID6xWowA5tZkZBXD9QdW4CKAvVbpT0DSCtrPVb4kh+zeYBj62s24EzUqUEnUbqQAJzPzHX4srLOQZfvJgIBy8uCagjdImd/zdr4ExjSNNzHhPlumnusvoTlOrEhOugLwxo+gSt7LQhSxlmR2Nr3XVg9EYuJWQmY5/kYztVyMltjvTStj74+PsAcIgKiFt71ZweybLc6u9Qfazx3Mos/U2XM0/QIqLuWVkfXC6sTxaOhLgjCkXEFQi8XcjIl4YDY2NHZuuXOl9TI4E8y+xOUrYdOqEWXDOGFGqqoWZhUG2B9SmanWh3wxMX5UVrKcrJ7rAvXszVMzkSIrxbw8pQlQhdVNgcAAycPeCIn6onryO+Gw7jOLI2MLihvvBxtw+GnJaPPMMgAAXa8zma0dCLOMEM8EMSMkvUpaqFMVyNCUZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(54906003)(8676002)(4326008)(86362001)(103116003)(6666004)(36756003)(966005)(38100700001)(6916009)(8936002)(2616005)(2906002)(16526019)(7416002)(7366002)(7406005)(186003)(66946007)(956004)(66556008)(26005)(316002)(52116002)(7696005)(83380400001)(66476007)(478600001)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N1lXRTc1L093VmcwazVKaFFWamdkdWttZWVnODd3TUFwMU1uUHJnVW1yOUpq?=
 =?utf-8?B?bkhLR1VoNnYzUjBFYUl3T256U3pzUXJDNzcwZllHa2xGb0twZ2V6d1M1b3NF?=
 =?utf-8?B?b3Exd2diSDQ3SXF3Z29YbmZTL2ZZUTdsYU1mS24zQzJZWGFzTFd6TlU2d0l1?=
 =?utf-8?B?dy8ybG5LTmhDTlptdndWWnBhQnNYR2RVdG55aUFBaVQ2enBycEtOT29sS0dz?=
 =?utf-8?B?TUFMZDZLTFV0M3hpaGdXSUtKMnB3eC81d1ZDWUMxQmVja0FqVGp4cnluWjVw?=
 =?utf-8?B?T2dwalZtOU85VVNoMDF2NXpHL0k2VVQrVXBZYjNWSWFHQi81RkRScW8xc3Fu?=
 =?utf-8?B?ejRXMWV4N0pCSDBNV20zWlk3dHNiblBBd0VUL3lVYVQwTXRPRC83UHhHaHh6?=
 =?utf-8?B?MHdQcFN3RGFEZnRsbEhJZnFTNzBWdGJ1eU1JSVNtZ1laSTR4c1lNQkw4bmxU?=
 =?utf-8?B?RDRlSGtWODF1Y0p5clJSM1Bzdjh6MjcvdDJrUm03c0NUeWpiOE1WaGtUUkVX?=
 =?utf-8?B?YnhlRndGa3FIS2Q0aisvMDVvODVQQVNRRjltbmI4MzlQbGdoSjVDZk1VR09s?=
 =?utf-8?B?MnU4MUJBNFd2WUtmeHhkQ3hTT1cwd0NQeWc4SFp1eFY3MmJYY2tybEwrWHVL?=
 =?utf-8?B?aENORUF0QkZ3TlZWeVB5MU9VSlk4MklHK3RacjhMa2JabVBhcGlBcVhTK1BG?=
 =?utf-8?B?cnEzT1VFYWEvUXB1UXlYZnFXRjVxWklwb2ljTTYzWTB1b3NqZjNZaUVPZUlF?=
 =?utf-8?B?SjFWMjEwdmNFcWN6OU5vVUlEWUpaMWRRamJkc0JTVDJGNGlxZ3JwUW5QL0Vp?=
 =?utf-8?B?MUt4WWpMMjVPb3lBL2g1MTAxNE9hMEU4ZjdPVUxReVJ1TXgveGkyTmdCOUIz?=
 =?utf-8?B?Z0cyamRWejUvUTI4OGE4NkV3aVFEYy9mb0lZRWtmelZVaHNhNnQra01DaWZL?=
 =?utf-8?B?ck9TTDNDcVRhTXNlVFpobHdQOGkxbWxJZDd0eUVwdEx0c25JbVdhZ25IdWwy?=
 =?utf-8?B?M29vaGFqT01VenJRRnM4dnE2eHJyRFEzMDZZTHgxRTVqdVBERnFkemxrMFpQ?=
 =?utf-8?B?YU9qd1BXdFhOUmxuV3prN3NHcHpjeDdSV08xSC95c3l5OXlkTy9tSDVoRTBj?=
 =?utf-8?B?ZXhaV1QvYnQvellXbnA0Zyt3MW9NNWVwTFdBWjJ3dWJaM1FiMkRycDduQ2th?=
 =?utf-8?B?dFI1WUc1RUQzT25HVVZEYkcwZ2NaVTNLTTE1VHd1R0YvOGJFRGtVbmdUcVpS?=
 =?utf-8?B?OGpIcU9abzcwVFEzaVptdmZaQWhId0xjT0VSRVN4WnI5RVk2MWdvNnY1eGtF?=
 =?utf-8?B?R1VxTzZteEtoc2N2TFo4K1paRHpjWW8vNlExbGU4VGJQZm9COEltMjFJQmVz?=
 =?utf-8?B?VklucW1IemtLVkd0UTkrTDloYVJMb1ZCTDh3bVBGQ2RyWVlNVlpib0tCNWhT?=
 =?utf-8?B?MlJpMStMVUhCS0d6UCtNRDR6K1lzV3h2WEZhSUJibk1iS3hWVmp6by84SFUz?=
 =?utf-8?B?cHRIWTI2cXFrbVlaMDA1Z25vdnIrM2diSUwyRmd5bTlzV3dzMldmbDlvK0Fq?=
 =?utf-8?B?TjdOSFBLZUFWem51eExxUnhaYlFzYTVWZ3lLb013NkxwaVdBSzQrR05CbWw3?=
 =?utf-8?B?dkEvRUNsVEliU3N4NzdvT08zNWJka0JBZ1V2ZnQySVpLUDRuNm5IUk1iVGFM?=
 =?utf-8?B?ZzJ1ZWh2ODRiWVQ1USt1NnVteDZiR0hJQnd3MEZOdnNjcEFnbkF0akFwVUt4?=
 =?utf-8?Q?k7FS8rt6jL4QM0oVrKj44DpZyF8TkN0J28zwGFh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb61a6a8-9201-44a6-ba11-08d8ef41a941
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 03:54:16.8686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcef2pl3DPl0DdR1YI1XPBZtaQ8Hd+9cT89AyVLAxeKYfLSUPbHbghw50TSocnF1cW+4VZiI839oZRqDgsN4YbVeDtRXnX0tk8PdylwsDuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4774
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250026
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250026
X-Mailman-Approved-At: Thu, 25 Mar 2021 16:20:09 +1100
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Hannes Reinecke <hare@kernel.org>,
 Anil Ravindranath <anil_ravindranath@pmc-sierra.com>,
 Brian Macy <bmacy@sunshinecomputing.com>, willy@debian.org,
 Le Moal <damien.lemoal@hgst.com>, David Chaw <david_chaw@adaptec.com>,
 Marvell <jyli@marvell.com>, Jirka Hanika <geo@ff.cuni.cz>,
 Brian King <brking@linux.vnet.ibm.com>,
 Artur Paszkiewicz <artur.paszkiewicz@intel.com>, target-devel@vger.kernel.org,
 Drew Eckhardt <drew@colorado.edu>, Linda Xie <lxie@us.ibm.com>,
 Ketan Mukadam <ketan.mukadam@broadcom.com>, Paul Mackerras <paulus@samba.org>,
 linux-drivers@broadcom.com, Dave Boutcher <boutcher@us.ibm.com>,
 Brian King <brking@us.ibm.com>, linux-scsi@vger.kernel.org,
 Subbu Seetharaman <subbu.seetharaman@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Doug Ledford <dledford@redhat.com>, "Leonard N. Zubkoff" <lnz@dandelion.com>,
 Christoph Hellwig <hch@lst.de>, "Nicholas A. Bellinger" <nab@kernel.org>,
 Colin DeVilbiss <devilbis@us.ibm.com>, Karan Tilak Kumar <kartilak@cisco.com>,
 Badari Pulavarty <pbadari@us.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
 "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
 Douglas Gilbert <dgilbert@interlog.com>, Jamie Lenehan <lenehan@twibble.org>,
 MPT-FusionLinux.pdl@avagotech.com, "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 MPT-FusionLinux.pdl@broadcom.com, Eric Youngdale <eric@andante.org>,
 Torben Mathiasen <tmm@image.dk>, Michael Cyr <mikecyr@linux.ibm.com>,
 dc395x@twibble.org, Satish Kharat <satishkh@cisco.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Luben Tuikov <luben_tuikov@adaptec.com>, Ali Akcaagac <aliakc@web.de>,
 Santiago Leon <santil@us.ibm.com>,
 Jitendra Bhivare <jitendra.bhivare@broadcom.com>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
 Erich Chen <erich@tekram.com.tw>, Dave Boutcher <sleddog@us.ibm.com>,
 Richard Gooch <rgooch@atnf.csiro.au>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "C.L. Huang" <ching@tekram.com.tw>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Oliver Neukum <oliver@neukum.org>, linux-kernel@vger.kernel.org,
 Sesidhar Baddela <sebaddel@cisco.com>,
 Bas Vermeulen <bvermeul@blackstar.xs4all.nl>, Alex Davis <letmein@erols.com>,
 Kurt Garloff <garloff@suse.de>, Shaun Tancheff <shaun.tancheff@seagate.com>,
 FUJITA Tomonori <tomof@acm.org>, linuxppc-dev@lists.ozlabs.org,
 Linux GmbH <hare@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Mar 2021 09:11:54 +0000, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (36):
>   scsi: myrb: Demote non-conformant kernel-doc headers and fix others
>   scsi: ipr: Fix incorrect function names in their headers
>   scsi: mvumi: Fix formatting and doc-rot issues
>   scsi: sd_zbc: Place function name into header
>   scsi: pmcraid: Fix a whole host of kernel-doc issues
>   scsi: sd: Fix function name in header
>   scsi: aic94xx: aic94xx_dump: Correct misspelling of function
>     asd_dump_seq_state()
>   scsi: be2iscsi: be_main: Ensure function follows directly after its
>     header
>   scsi: dc395x: Fix some function param descriptions
>   scsi: initio: Fix a few kernel-doc misdemeanours
>   scsi: a100u2w: Fix some misnaming and formatting issues
>   scsi: myrs: Add missing ':' to make the kernel-doc checker happy
>   scsi: pmcraid: Correct function name pmcraid_show_adapter_id() in
>     header
>   scsi: mpt3sas: mpt3sas_scs: Fix a few kernel-doc issues
>   scsi: be2iscsi: be_main: Demote incomplete/non-conformant kernel-doc
>     header
>   scsi: isci: phy: Fix a few different kernel-doc related issues
>   scsi: fnic: fnic_scsi: Demote non-conformant kernel-doc headers
>   scsi: fnic: fnic_fcs: Kernel-doc headers must contain the function
>     name
>   scsi: isci: phy: Provide function name and demote non-conforming
>     header
>   scsi: isci: request: Fix a myriad of kernel-doc issues
>   scsi: isci: host: Fix bunch of kernel-doc related issues
>   scsi: isci: task: Demote non-conformant header and remove superfluous
>     param
>   scsi: isci: remote_node_table: Fix a bunch of kernel-doc misdemeanours
>   scsi: isci: remote_node_context: Fix one function header and demote a
>     couple more
>   scsi: isci: port_config: Fix a bunch of doc-rot and demote abuses
>   scsi: isci: remote_device: Fix a bunch of doc-rot issues
>   scsi: isci: request: Fix doc-rot issue relating to 'ireq' param
>   scsi: isci: port: Fix a bunch of kernel-doc issues
>   scsi: isci: remote_node_context: Demote kernel-doc abuse
>   scsi: isci: remote_node_table: Provide some missing params and remove
>     others
>   scsi: cxlflash: main: Fix a little do-rot
>   scsi: cxlflash: superpipe: Fix a few misnaming issues
>   scsi: ibmvscsi: Fix a bunch of kernel-doc related issues
>   scsi: ibmvscsi: ibmvfc: Fix a bunch of misdocumentation
>   scsi: ibmvscsi_tgt: ibmvscsi_tgt: Remove duplicate section 'NOTE'
>   scsi: cxlflash: vlun: Fix some misnaming related doc-rot
> 
> [...]

Applied to 5.13/scsi-queue, thanks!

[01/36] scsi: myrb: Demote non-conformant kernel-doc headers and fix others
        https://git.kernel.org/mkp/scsi/c/12a1b740f225
[02/36] scsi: ipr: Fix incorrect function names in their headers
        https://git.kernel.org/mkp/scsi/c/637b5c3ebc1c
[03/36] scsi: mvumi: Fix formatting and doc-rot issues
        https://git.kernel.org/mkp/scsi/c/5ccd626516e1
[04/36] scsi: sd_zbc: Place function name into header
        https://git.kernel.org/mkp/scsi/c/59863cb53d80
[05/36] scsi: pmcraid: Fix a whole host of kernel-doc issues
        https://git.kernel.org/mkp/scsi/c/3673b7b0007b
[06/36] scsi: sd: Fix function name in header
        https://git.kernel.org/mkp/scsi/c/ad907c54e36f
[07/36] scsi: aic94xx: aic94xx_dump: Correct misspelling of function asd_dump_seq_state()
        https://git.kernel.org/mkp/scsi/c/3e2f4679ea03
[08/36] scsi: be2iscsi: be_main: Ensure function follows directly after its header
        https://git.kernel.org/mkp/scsi/c/f1d50e8ee5c9
[09/36] scsi: dc395x: Fix some function param descriptions
        https://git.kernel.org/mkp/scsi/c/33c8ef953ece
[10/36] scsi: initio: Fix a few kernel-doc misdemeanours
        https://git.kernel.org/mkp/scsi/c/100ec495e01e
[11/36] scsi: a100u2w: Fix some misnaming and formatting issues
        https://git.kernel.org/mkp/scsi/c/c548a6250627
[12/36] scsi: myrs: Add missing ':' to make the kernel-doc checker happy
        https://git.kernel.org/mkp/scsi/c/9eb292eb2ef7
[13/36] scsi: pmcraid: Correct function name pmcraid_show_adapter_id() in header
        https://git.kernel.org/mkp/scsi/c/a364a147b1dc
[14/36] scsi: mpt3sas: mpt3sas_scs: Fix a few kernel-doc issues
        https://git.kernel.org/mkp/scsi/c/a8d548b0b3ee
[15/36] scsi: be2iscsi: be_main: Demote incomplete/non-conformant kernel-doc header
        https://git.kernel.org/mkp/scsi/c/a90a8c607570
[16/36] scsi: isci: phy: Fix a few different kernel-doc related issues
        https://git.kernel.org/mkp/scsi/c/6af1d9bd9051
[17/36] scsi: fnic: fnic_scsi: Demote non-conformant kernel-doc headers
        https://git.kernel.org/mkp/scsi/c/c7eab0704c30
[18/36] scsi: fnic: fnic_fcs: Kernel-doc headers must contain the function name
        https://git.kernel.org/mkp/scsi/c/2efd8631d6a5
[19/36] scsi: isci: phy: Provide function name and demote non-conforming header
        https://git.kernel.org/mkp/scsi/c/6ab7ca5139b7
[20/36] scsi: isci: request: Fix a myriad of kernel-doc issues
        https://git.kernel.org/mkp/scsi/c/db35a0835357
[21/36] scsi: isci: host: Fix bunch of kernel-doc related issues
        https://git.kernel.org/mkp/scsi/c/44b7ca966128
[22/36] scsi: isci: task: Demote non-conformant header and remove superfluous param
        https://git.kernel.org/mkp/scsi/c/0afdee03f2e7
[23/36] scsi: isci: remote_node_table: Fix a bunch of kernel-doc misdemeanours
        https://git.kernel.org/mkp/scsi/c/103d61927ed3
[24/36] scsi: isci: remote_node_context: Fix one function header and demote a couple more
        https://git.kernel.org/mkp/scsi/c/ad276048f1bc
[25/36] scsi: isci: port_config: Fix a bunch of doc-rot and demote abuses
        https://git.kernel.org/mkp/scsi/c/29faa5ce26ae
[26/36] scsi: isci: remote_device: Fix a bunch of doc-rot issues
        https://git.kernel.org/mkp/scsi/c/242e15d7a4f4
[27/36] scsi: isci: request: Fix doc-rot issue relating to 'ireq' param
        https://git.kernel.org/mkp/scsi/c/a8604e44514d
[28/36] scsi: isci: port: Fix a bunch of kernel-doc issues
        https://git.kernel.org/mkp/scsi/c/7292a8b039c5
[29/36] scsi: isci: remote_node_context: Demote kernel-doc abuse
        https://git.kernel.org/mkp/scsi/c/d2d480f132e8
[30/36] scsi: isci: remote_node_table: Provide some missing params and remove others
        https://git.kernel.org/mkp/scsi/c/188f513dd22c
[31/36] scsi: cxlflash: main: Fix a little do-rot
        https://git.kernel.org/mkp/scsi/c/cf0ad7a15ac5
[32/36] scsi: cxlflash: superpipe: Fix a few misnaming issues
        https://git.kernel.org/mkp/scsi/c/32b3edfd28f8
[33/36] scsi: ibmvscsi: Fix a bunch of kernel-doc related issues
        https://git.kernel.org/mkp/scsi/c/841d7df0d416
[34/36] scsi: ibmvscsi: ibmvfc: Fix a bunch of misdocumentation
        https://git.kernel.org/mkp/scsi/c/dd9c77297148
[35/36] scsi: ibmvscsi_tgt: ibmvscsi_tgt: Remove duplicate section 'NOTE'
        https://git.kernel.org/mkp/scsi/c/cba3ebfc008e
[36/36] scsi: cxlflash: vlun: Fix some misnaming related doc-rot
        https://git.kernel.org/mkp/scsi/c/a690baa47fd1

-- 
Martin K. Petersen	Oracle Linux Engineering
