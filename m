Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8F45E2A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 22:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0WTq2qdkz2yXv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 08:38:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=QpYK6mQO;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eXBfqvFr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=QpYK6mQO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=eXBfqvFr; dkim-atps=neutral
X-Greylist: delayed 22534 seconds by postgrey-1.36 at boromir;
 Fri, 26 Nov 2021 08:38:08 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0WSw62XCz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 08:38:04 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APFLBG1005318; 
 Thu, 25 Nov 2021 15:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xOJcvQ6fbJUOm0/j1nsNc/L5/Wzc3OVZQ2WAo52zC7I=;
 b=QpYK6mQOKyrTNKIfAy2cVNxQnPy9dfkLabZekvWqd3CN36hupZTVX3iACv7rSY/mRAMh
 g6QwZuGXqMKaApM6va3d2+Oh5Cks6+MRpp6n1eCnLP+K0DD9V8n5oWMqjQLzFJFp8R2h
 sazGJEvDkRorWn1DFI86L/zRevO0T6HsDX/GCbgSerdoMOVWeHlme22KXFI/3Y1Myr8b
 /niJp/UJX9aBL0Cwn9JHsrZ0VHdDlVTy1mr36Zf2W2zEPv6Od0zRN0Nd8lYIXW+BQu2I
 /4wjuRo7dvVnLvc7JcLKc9FbVxfZbWnNYvo6KXLxrbLxLw9RjKhiKjG+X5EMIHyFSSFt uA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chk007rcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:21:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1APFFIaw111632;
 Thu, 25 Nov 2021 15:21:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3030.oracle.com with ESMTP id 3ceq2hsqse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deVhZjW2ErlAfMn2kpwIWCCcr70VkysnkinuhioojLMjnQBbs+cD3wvdf+/FmvIi1GxIWSBXVE/cqvqWbML/GRNChS+FgPzeER9qZxF6AXZPvBkMMQxRZXHWINpyw0FbLX3KHg88CDC9Jd5TWYnpCtWmzdgktG9Sz4a//0syX0eoRlBqnbhJBKwdbxtocV+7/+YBp5FUPjWZsFJmGWdGEbyh1imFG12t4qJLZLGARaAuRSLEPzgO4yYud7tTdHj6xk8zsXCyWV2uyTlNOkP4zVFSFxVISOHhYw6s/aG9TZZAO6WCtjEtShYCozIWIBIYhmR59g1dge4pa0kZ+Tdiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOJcvQ6fbJUOm0/j1nsNc/L5/Wzc3OVZQ2WAo52zC7I=;
 b=jgBpGXqqlljaGHB0ei0+oD6676Dfy+aaaGfJq+X8PidpStyo3EfeBUZIDC9p434fch825+jbqwK8MlBwlg5QXWrxUww2D4qkEFXB8TVM7yMh6wbZvrjiOKmP1Dh4Il3syWIlB44MBO0FAYjt0rm2Ib9bwtLmQfVR1nqpZfObC3iwnl+Xq2zgakmU4NXmOFSgi8RkJoGgGT1jDD7GvZpoEMmYpZHzJNzXMW0ndT5wm2fr52enO1q6zbu2GQGShuEvAUMbv5tafDew06sIi+UxZdjlhvHOlzqO3SQMZjjWM5VVczcZ7qdkOskaqjONAYkyEdYBHndBhlRhThIXqCmvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOJcvQ6fbJUOm0/j1nsNc/L5/Wzc3OVZQ2WAo52zC7I=;
 b=eXBfqvFrwjT8KKGhqwNICDf/TLh0E3jD39WvuExuaZ666g6yB1oNnRoKa2UetW6vof5s9knru3Sls8Pn10gnFTN0OsaTkdt9RTndqaxvhOpR2ovF+HE/KrPrVJGIfqQhDTzn1aShh/rZ9NI0Rmw8wWqZhRzM5j5VrM2cfvL4UZc=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4383.namprd10.prod.outlook.com (2603:10b6:208:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 15:21:51 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 15:21:51 +0000
Message-ID: <b14018d0-a978-7c51-431b-ebdfe902e172@oracle.com>
Date: Thu, 25 Nov 2021 10:21:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20211022064800.14978-1-jgross@suse.com>
 <bf5a4749-0216-53db-a022-ef4f84d823c5@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <bf5a4749-0216-53db-a022-ef4f84d823c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
Received: from [10.74.106.108] (138.3.200.44) by
 SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 15:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bca32ac4-babd-4bd0-7609-08d9b0274e39
X-MS-TrafficTypeDiagnostic: MN2PR10MB4383:
X-Microsoft-Antispam-PRVS: <MN2PR10MB438351371AD34DE6301057148A629@MN2PR10MB4383.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izFBXKiEDIni2MgEDXHJ4qsQDAWTTRuCQKVdzdDC34prTkeOouN+dpq94lkKFZnhEnffMdYZ4bX7zIXKnX2X9L3TkelkAla6+D6UbTRVHeg7zln+z7YAe521Tat6q0PmVIDbnJHByU8+os9PUbEeefWwQx3XCjuZ4jKjzBu5Bqc9Ysl61JNCxI2CdwRDKb1fSVHGTarb0NTi43KbZ2Kfosmty2txN7/uq8ERbXjElm3YuAnbbogc50AfrBVs8NyFOG1gtbx2atpEXDnquHzcemBKgQz2dQoi5IBAAxUDBD47DSudZYQAYHXRJJB+mU2O6Sg521qzJkzLLbOT6u4scOz+gs4n41w0lUHud/71GqofqYqUfhIEmbbMuUSDyRO3KpTSBiEx1AUqtzePz0xtlypszpK9Y8oWVEYpzX+xuAhxgU25+XfMrZp32MO2hpXdRZ1y3kLmttQ9a0Jp6RSUEJ58eMm+kIVBdbRj51Us73KeZtHC67pRV6YKqOu7zG3kNCk139MP2s7VXGrE4sZ5rd68QECz8s4YjwuTjM+qNPGHfJeqTpcfhvwucN0xppu8AB7cTv5pWtrXNs9xAQIild5GKf6vdCYwW7Y++iJ9n9pOqNje5028ODhbhaIvpaVV0Wal07ai6oAZTahU36SW6p0n23D5WrTXbsHlc2af+MjbeThHOxYVNZ8em8qM94l/Em6ZxAqGCh5TYmBvaNQhNbjm6Lngiu23qbGcu4NFD685zCkBElgR6TdGyzlK8v36
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(44832011)(4326008)(54906003)(2616005)(31696002)(66946007)(66556008)(186003)(316002)(6486002)(5660300002)(16576012)(7416002)(38100700002)(508600001)(956004)(2906002)(66476007)(86362001)(26005)(8676002)(53546011)(8936002)(6666004)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhHSjF4VC9FTGZwN2puR3FWQWkvc1N0a1RER0U4MmxOUXZibU1TRHRpT1NM?=
 =?utf-8?B?alU2bFVSREg5REp1dC9ydHdXSm5JdjFjQ2xXNG8yMUNmY0lkMGhMYkxiKzBB?=
 =?utf-8?B?ZGhBS3IvRERqTXRhOFgvWHFCMThZNzNIQ0t5MUpGOWk1Q1pWc2t4OUZwUmxH?=
 =?utf-8?B?WkFIbnUvSllKT3M3ejI2SjhtQjZDbzNnVHlCSDdVWnpQbjVFczN4cG9rVWg4?=
 =?utf-8?B?T25rN09iRlRzQVVxMVp1TTNzOXhmSTN1bStVd1ZBbkRHSDg3bmREVlJiVitu?=
 =?utf-8?B?bzU4cjFGZm1FR1lhUzVLemxRWGlocDRnVGlFd2p5S0xuOFAwM1lrcFVFY3Rv?=
 =?utf-8?B?M3BYOHFveUl1MEJ0QUhMRFRTMEMrZ2ZKbUVnY0VEMlJaOXVyOEdmcHFvbTk0?=
 =?utf-8?B?UUFVWVVMczF3c3lQZmNUM2o5QjBGU0E0emZwQkZ2TjJueDVMTlErSFExOUNE?=
 =?utf-8?B?cmtiazJwT0lEZUlIaE84SG5wNkNRZzBlY214eTZSRnFUWFRQZG9Od3VuV0d6?=
 =?utf-8?B?M2Joamx6RmJLZGtvZ0E1dmkxQVlQbEFpYzQ4ZllFNkxsVGJmYkl5UW5QMzRN?=
 =?utf-8?B?VWV6WDBYWXJIeTJpYk9NTXB5RkZoWUxRRzE2ZTJWWGJVRnhCSWZYY3dyQUhQ?=
 =?utf-8?B?elVUOGROSlVuS0JFTTVMZEdsNWVFNjF0MDByUm0zTWl3TmJUVnEvK1hnUXlS?=
 =?utf-8?B?eWlSczZRc3Fpeko3cmFCRnRuOTgzNDY1TlM1UmQ5eEd2a1YrRmY5Y082NVFI?=
 =?utf-8?B?ZjNTeVFGS2N6NTlxb0hGUU0vOEkvaFJ4WjEzdG5ndWQ0NE1JZld4TGtReUZO?=
 =?utf-8?B?d1Axdzd3dFJlVS93WXBHeVJJVk1IelhGVEttc1p2d1NQa1pITjd6akhSZlhX?=
 =?utf-8?B?Qk1LU21FSW1qRkJXK0RmMWtlcGRmL3NjYWd6UkZrZy9VTFZuSzhlZ1BaZVlY?=
 =?utf-8?B?d2xuUm03eDZId2duZngvZ0NVWTYva1d3d1R4NGlhQThISWZpUEV0VjQ1UXlt?=
 =?utf-8?B?V1NYU1EwZm5XaFNaZUcyRjZXY256Y0MwYm9LeDFxQjY2Mmdra2tIUmYzOVlR?=
 =?utf-8?B?QWREcWg1OElsVXphRG40VTlZTDIvc1RrMzZjUDRNdDNuckpmY3ByYnZUeFhh?=
 =?utf-8?B?ZzdZVjIzWjdtaktaYS9IQVBvbmh5cXJ2N00xREhGakRORThOaDhKV2RuUzJR?=
 =?utf-8?B?QVp6QjgvQ1llVzNIWG9HclgrelI2Umt2M0FKYmFjQkJJQnExK0JnMFBVSXJP?=
 =?utf-8?B?cnYyUDV0OHJpdFBLOER5THpjeHd2bFJNa0c3ODF6S3hWSHVMZm1ML2ljKzZV?=
 =?utf-8?B?S0JWV0xlSVgxRUdoVkR6c1FlM3JaRlZGaW5Qc3dWNjhpZjhxOWxLTEdGVmpv?=
 =?utf-8?B?TnQ2OVI0V1hrc3lJRW5jeksySUIzem5OK3FKZ1AzQ2d1akY3eWp0RGdwdWxW?=
 =?utf-8?B?enA1RGlZWVNtSFRzNURsZHhkQU50ZXYzSExDb3dVclJ6RGxzTzdVQ2dUUXNX?=
 =?utf-8?B?dWUwYWE1UDVocTc1SThXWmtZQXFETlU0ZWxKTHRkMXRvU1BYYk90VkpZMTZq?=
 =?utf-8?B?S1BsMFhHQlhwYlQ1aTFmRkt5eVFuaUtQNmtVYk1NZDlybGJpMmdIT2htc201?=
 =?utf-8?B?ZnovSkhIMmtvRFJ0eU5NNlBKT1BzOWNlTmxlRVVhVnBXL1BhbkFsc253Z09u?=
 =?utf-8?B?VHB0bVpheFBUVDhkcHlTSXY5b3dMZGlueVBCUDhHd1B5bE5oVDMyZ3dKTjVW?=
 =?utf-8?B?RWN0K0tKRnRZWWpNVlArWVk1ZUpzTjI5UVhhZS84cFczNmdIVkM0L3M2Uldh?=
 =?utf-8?B?NkRaZmJDeTJMaGVEbnNHcW5KUGZSTFJpN3l6V2ozNUt5UHA5NGZiQlFjdzVt?=
 =?utf-8?B?dloydDdIam8rUW0rWmJjUUhLQnZ3SFBzNEc3YUZnU1Mrb0tua2ZTQk90cjl4?=
 =?utf-8?B?eWh6bFZoanlNQzNGWUlnZWNoUlRXRDR6U1RRa0t2azFNYSsrOWMyUmZSREpM?=
 =?utf-8?B?anA4U2lYcEZITm11UzJmMUtjYjg2ME1zVmpJRzlud05vL1Z0c05LWURYT3I2?=
 =?utf-8?B?bFNkaEExbEY0N1NvVEpKZmozb2JoSUFjVm1POEJhdGFWMG03akJLSkdzOXhm?=
 =?utf-8?B?cjdRdkN1dk9IU0lBRW1DZUFBRzhqQnU1WWsxT2RIZDVQTndTV0FxQ2huR2w1?=
 =?utf-8?B?bksyeUh1REloaksvdHd3ZUJScElEUFFldHZRTkk1THZUeFJRWDBvbFJBQzZk?=
 =?utf-8?B?cndIQUVyRjM1Y3FMckFZSVdJQnJBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca32ac4-babd-4bd0-7609-08d9b0274e39
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:21:51.3711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNwnUwzlptoU7PN9FlUem6dEYoTxBzr3Ll6KrPKYNLOaqjfs0npiEmctdtfiaN/RiSWNLmnc3NvfHZ67c0ht+7MQt2nosKscLQCd6yzalwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4383
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10179
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250085
X-Proofpoint-ORIG-GUID: X_NWAn0AHYKFSi1y9iGuMiKi1e_UfJMo
X-Proofpoint-GUID: X_NWAn0AHYKFSi1y9iGuMiKi1e_UfJMo
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
Cc: alsa-devel@alsa-project.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Daniel Vetter <daniel@ffwll.ch>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/22/21 3:20 AM, Juergen Gross wrote:
> On 22.10.21 08:47, Juergen Gross wrote:
>> Today the non-essential pv devices are hard coded in the xenbus driver
>> and this list is lacking multiple entries.
>>
>> This series reworks the detection logic of non-essential devices by
>> adding a flag for that purpose to struct xenbus_driver.
>>
>> Juergen Gross (5):
>>    xen: add "not_essential" flag to struct xenbus_driver
>>    xen: flag xen_drm_front to be not essential for system boot
>>    xen: flag hvc_xen to be not essential for system boot
>>    xen: flag pvcalls-front to be not essential for system boot
>>    xen: flag xen_snd_front to be not essential for system boot
>>
>>   drivers/gpu/drm/xen/xen_drm_front.c        |  1 +
>>   drivers/input/misc/xen-kbdfront.c          |  1 +
>>   drivers/tty/hvc/hvc_xen.c                  |  1 +
>>   drivers/video/fbdev/xen-fbfront.c          |  1 +
>>   drivers/xen/pvcalls-front.c                |  1 +
>>   drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
>>   include/xen/xenbus.h                       |  1 +
>>   sound/xen/xen_snd_front.c                  |  1 +
>>   8 files changed, 10 insertions(+), 11 deletions(-)
>>
>



Applied to for-linus-5.16c


-boris

