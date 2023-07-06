Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA574A759
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:00:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=urVjfu2t;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rDOzkwD0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsSH6z9Nz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:00:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=urVjfu2t;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rDOzkwD0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxhJr0fZGz3c22
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 02:08:10 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366Fx3Kh013002;
	Thu, 6 Jul 2023 16:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=xXCf7xTyQOdcBqhKXBf0A0eNoxe8B2jCPqMI1lux0YM=;
 b=urVjfu2tUXfCp71HuaF84WDy0Y4V2snEzlU6z/kA7NAYxZDf2z+cfsWN63ujRTEj+Ts+
 ZrjQrOY9AAJhS0K8p6vpYRAqOnRfws4R99Cj3xLnkqDOt9M55+Fw0akya6Z9Iol9JD6g
 HQosEeL8yqbJwnf6R9wBWZWEBoyRSHgoGHJVZxn1ot6V7IdFvvXMaBXufX5onxzmfIy7
 Sp4K0m22zdJeHsBGbks4EYYo/FFR2thsgOa9L5cG80TQWE9QTCTdTh8k503qEFXxDUTx
 sRp2WuyXtfOuijgMdrq2uk3051WV+SIYhKytAH9wHkrlFqKkGfvu6WlSCNd7AsP3fnsY jQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rnx8jrg4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 16:07:28 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366FJYX8033300;
	Thu, 6 Jul 2023 16:07:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7f4r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 16:07:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrxYEeGcE3Won38FSrSrDORI1CttwA/PH1eIYtjdDoN2PCELh3yJF/RHisUgOhfGbWQpaqpU9rmXAzTR1w910W6Y1C9c6IwD92Jj7JNeFbwcggaR0jdiXpAxbW3wRE1LSYDzydIPI30LJYCbZ/AaZNu3xrGqAjOdQKFaS0CnNufr5Hmw38UsvIBDEsMIvJBfiaItCjMpkcK+QyJpXCl2B9S/JHk2GCRrAtwm23uuca/QtHiPtT0EFTvBgz9IR84SsjXcb5iuLPwx5iRCAJPRhlNdOO+QDrtCeLo5SJ8RcJWBahlxsG8nXssyuKSUFpV3oX+A2hF4WatHQ4uC0t2NjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXCf7xTyQOdcBqhKXBf0A0eNoxe8B2jCPqMI1lux0YM=;
 b=R5O/CiEByPZ6gjyYnKwffT5dOoA9JGnuAIW7xPTgRBO0vm/4G6oH5LeHFdmnMNaUjujl0oOWpfCAkx6fsHkdlkBloB3scAF2LjhRxafnyL4xlhJPLIXBhfSZGI83wY7KGwyeXmEs99dCJg+ETDoCo6tElPthAHOTEaaUOw/Fgz6ukN+7+boojDa0y4k5xC4ug5qR+aJwiuhuo9S4OBt+iAkrO6wNF1wi1lP0wQjr62Iyz/tiXd7xhw9SQKgQEEbCRljJhYx/JY7xz4b8hZwd8hmMKmYtM2gl2uvhgYgAI/q8/uDkyhs4Ne1sFEj6bOudQy11cwWLDDc/eoL4VPLyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXCf7xTyQOdcBqhKXBf0A0eNoxe8B2jCPqMI1lux0YM=;
 b=rDOzkwD06cLpq2wwowGAZ7Lc2YBzlrCbMZ52Ac1BoDNsmoCWCmt9AlWVhPEPuUo9AJvSNgZf5sc0ZiW+yoPHK9xTDVbfj+Iaxdr9CYLtRU7Zad3AGUmPdu8c3zq1AoeX5Qw0oJu7HauijgjuT9QdW8AHjjUIXpfMDlkbsjPiDeA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM4PR10MB6765.namprd10.prod.outlook.com (2603:10b6:8:10f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 16:07:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 16:07:23 +0000
Message-ID: <6cf04378-782a-1b1b-f215-92ad7cd9be6e@oracle.com>
Date: Thu, 6 Jul 2023 11:07:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>,
        Nathan Chancellor <nathan@kernel.org>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-13-eric.devolder@oracle.com>
 <20230705154958.GA3643511@dev-arch.thelio-3990X>
 <ZKbknQoC1MkAjsqJ@tuxmaker.boeblingen.de.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZKbknQoC1MkAjsqJ@tuxmaker.boeblingen.de.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0122.namprd11.prod.outlook.com
 (2603:10b6:806:131::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM4PR10MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbfcd0b-b71f-4622-3a32-08db7e3b154a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7oa+OJXjgnb85ONBxYx8ktdRTJ/MxD+DB9n9sajqmNOefduQOj2o3b/3CJxiKhtgbguz/G39ER9T5M/PBas/694XQpCkPVvEbWSBtGCF2J/76laI9LvTUS9MUxaDtruL8gYgBxg7QN8ZbVLkjXkb5SyQoNaw6ZCg3MRgDA4LRg+eVC+Q4oDcmAHYnSrwdZl+weoM1bP2NbKuCe8fRXC6cy9hvQfLKAMGrZH9ItYItZM+yOrviejF511ZdKL4czMcq3SCBkU75YdAwjsi75j5SW0BaVtq3Mweo5JTc3DWEgb1iMNhzcQ9sFEbiodaHUy0rVR+qa0NqtNKCKa6jSg1DTsmdI1Z1NB76K5onYe0/ePlQm+b+gooytsxXf+UnwWrCAmx+7rEqwmqPdaRKua/7Ywj2C6dKHjZq4LxEqaWjCei+6JBwjgoUGop/oghom4F6ssV0SOmCZTRvqklSTAycyenIPTAzMWfA80/zAMGFGmp8eUTM+fKPK4OBDgrn3bBrzzXW7y+f2XE742+Qj9bf5TXHzeBjBgXgPUMLX0oV4yTFXEK1mWSiJXzPdlwSYToXTGzZb1UHJS0QNgRnVlD4i5xu1rhMh+xNbSnX/+JWtNGtl5mrY5mKhqYQ7PcbUCxjCj//vkTgLrJ8pSxO6T4Ww==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199021)(30864003)(2906002)(41300700001)(5660300002)(7406005)(7416002)(7366002)(8936002)(8676002)(36756003)(31696002)(86362001)(31686004)(2616005)(6666004)(478600001)(6486002)(6506007)(53546011)(26005)(186003)(6512007)(4326008)(66476007)(66946007)(66556008)(316002)(110136005)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cks5UFJXY2IrejFQQkF4QjlLalI5T2kzbkxWN0Z4MUk4VGNSS28xUXFxWGZa?=
 =?utf-8?B?TlhxalFCZDlnUVA4UXdVcjhLV3NZeUJxSExsZ3p4R3RIWE44R2pvbG8yS3p1?=
 =?utf-8?B?MEVHNDByNnBJVmY0eEYrQlk1YWNMSkVDZklUOHd6c0Z5M2xKSGpqSVhSTHVS?=
 =?utf-8?B?djFOcG5yL0RsT2RpWlNJWVMxV1JLWGFGMDJlaHdndjJUaGdkSVZRNjNJZ0NB?=
 =?utf-8?B?RStMYTF5U1NyeWh5Z0M4U1VrdVlERUdjQ3ZnQ2hUalk3c1VGeDhHZzlPWXJJ?=
 =?utf-8?B?QlRlNUlTaHc2VFBUKzk3alRGb25NdGtESXdPMk5YcXZURDNnUG1PcVh4V2x3?=
 =?utf-8?B?ZkdnVDdPK3gvYkZPaUxyQ09KeWxiTk9kU3YwVGxpNVhadFJxNDJtV0FFcFFW?=
 =?utf-8?B?M2pybnF4VXN3S1BJNys1REVqeElZVkZyNm5oZGJCalBaMDZwM29aR3g1RG5L?=
 =?utf-8?B?RFhrUG5LN2RoRHd6NzJkeXUyVW1Kaks1ek5FSzBSeHJJOWZsbW02QkRUVVNa?=
 =?utf-8?B?dktTYTE5MVdyWUJHRXlJVXZNaTY2cmlreVlxQU52UTlvMFd3Ym1nMUFxWkxR?=
 =?utf-8?B?WlFxZzZic05mNmMxeVVmVktwVWlUZU9uWUhzWmhpV0dnQ1pwQi9HZ1hKWHJo?=
 =?utf-8?B?Q2hpWm53SGJiajV2NUQ4U1p6eGpCNTh1TXdLdEtqYm5vMGZaMFhCRTVVUVRL?=
 =?utf-8?B?N3AxeVZ3SmdGZjlzY1pCdWh3MUdNdmhveDJWSEROUzY4T2c2Sm1keERuYUl4?=
 =?utf-8?B?T0ZJQjUxOFdBZk1wZTRlamNVZUQ5U3NTem5RVEx5ZVYrRHgyTys1Ly9iQ0Qr?=
 =?utf-8?B?SmVxT3J3b0hDRGNIRitUSCtsakp6eDNZcS9zUEJYUmh0WloxY3ZadVhJckdB?=
 =?utf-8?B?NytKWXlBdTRmeDZrNnRmQnUwUVNZeFdGNm1OaUI1OGc2cnRtN3krUUJ0WG1F?=
 =?utf-8?B?MldhbHNXbEgyeWpMVXRQTHBrcFZwbERROUtjRWJyWU04MW1qanA3WUJwdFVO?=
 =?utf-8?B?VkRlamNwL0U4b08rbldsSmlTTXNaQlBlTHVNYndHRDhVMmxKQTJqTDdiZnB3?=
 =?utf-8?B?K0lqY3pIVjYvTW9NQVFrZndWNUxFallXQUlsb2JKQ0NqSUJPanp2MkRTdE1r?=
 =?utf-8?B?RWNFaEhyZUZZR0l3bERONldhWndMVlBHaUZ4aUF3VGNRbXRFYWkrOVU3OEJS?=
 =?utf-8?B?VWZic2RFcEZyRFdIbkVpajlIM2h2Y1IreEl2M1dsQ1VDczR5U2JHdm9ib00v?=
 =?utf-8?B?bFJQd1pRQW9kdVFIaEZtS0NMZEdsMWFITTF1Y2laV1pZU1NtM2NqUkNkM0FE?=
 =?utf-8?B?MWdJZmV1aFBwbGJVcHlVN1hOcHlCUEgvZnpEZG9XdE9pY1JRVUVnMDhQMlZ6?=
 =?utf-8?B?akppUFJ1bDI2bm5xZmdrQzZMOGpNc2JsTlVvc1hYRW41UUxabmpvZ1FQVkF6?=
 =?utf-8?B?TkY4WDA3MlloYXpLNXozcE5kZ29PMXlnbDlqVGdGYlJBd3RlVmh4M3hqT1Fy?=
 =?utf-8?B?VUoydVpZa1MzYVIvbWlnT3F0TGhxZ2g3YSt5b2VXQ0xNZEgyWFM3RmNEYkxS?=
 =?utf-8?B?cDhBWVloVkZ6SDhCdmY2RnZjWVJHSVg3dUl1SVJ1WU40VDR5NWduVGM1RGQ4?=
 =?utf-8?B?RlVQcGZ5anVLZFp0SlNsbnN5YWdtOFZaMFBseC8yZm12TE1kbHkvVXRoWWlz?=
 =?utf-8?B?RTREdlhuc3plVmFNVDNubjVjaWhEakgvRmZrQURoNWtRZ0R3eE1RQU1yMFpt?=
 =?utf-8?B?a1NaaVlpUUIydjVMaFhqSXpTYmF0L2FFcnlkZGR3OVJYYlpyV01CazQ4Tjh5?=
 =?utf-8?B?aUNhTTBPZlB0aENxV2t0THhrTllZUHdaV2p2Y3dEOG5ibjF5bDhYZktMaEZs?=
 =?utf-8?B?OHZ2L2NXVkVxeVFkNTZDaWRSQ0VRRldZWFJPclF6RVBsNHRUT3FjWWJ6SWFa?=
 =?utf-8?B?NHhEaGVpczZCek45NXh5MkhyS2t6cDhMSjd2ZmhJNWp0ajliL0dOemI0N3lP?=
 =?utf-8?B?VUY2cEE5Ry9NVGY5OVJPTHEwbVg4Z3UzMlRmNzY4eElPUjhkM3RpcTFKTEJk?=
 =?utf-8?B?disyQkRORmlMMSttbHFXK0s2b3BmQ2lsVVhJQnRGNnNMYVFmWUNGSG5oNGd6?=
 =?utf-8?B?aXBnMGlRNHYza2tJUkxKS2s2elhZRm9WUXFDaWFVcnh0RXVGUGpMclZhYjhE?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?dFpsMnB5dmxNWkpra1JMMWN1R3J6MXhQT093R1ZoTG10cFRMVnI5ZWhaWUVV?=
 =?utf-8?B?eUErbnlESmRoZWk3OWpkRlEyNEplclprOStYOFdjMTFVekNFN2FUWmNpdWpt?=
 =?utf-8?B?RlVkRElzckhQQ3V1SEtZUlFkbUNYbnNqWmM1WWRTcVBPb21TK3VzTU9OeW8x?=
 =?utf-8?B?UHBrU3RsUHIrd05pN0VOOFk1M2VOQm9HS2t2eUR4V2NNWFJmQ3NPQnpsRHln?=
 =?utf-8?B?R0lyNmxpbWlvVDJaZlZ4TjVKbFBQZzBlSEk3UUQyRDlZSjlWV1dkVFhkWWYy?=
 =?utf-8?B?MXcyTk9KaFJKSk9mcW9kaFRIMVBmdi9wWGQ4ME5NWFhyODFDRytHallqQTZ2?=
 =?utf-8?B?RlVqZ3ViT1J6UkdnbHllWFRrdHI1NTFlN0s5OXJ3bUJxTDdaamEzelBpdnF4?=
 =?utf-8?B?VnZra1BpS3hBY0FqZTI0c0dLbS8xOGliSExYWXhCc2pvL1hLNG8vV25tT1JE?=
 =?utf-8?B?SmJlZ2c5c2d5M2pSNTBpSVZqa0VEV3pyOUtCbjREOHNMSFF1Nzd5dGtoZjlK?=
 =?utf-8?B?K1R6K3l1d0N5N1N6MXFPeGpxQjBaYmdNODJoQ2tsTVFQZmVraFZ5ZFRJTFRL?=
 =?utf-8?B?OERwWkwvTUIxS2p2cmlkaFVBeUJEZklhOGtlSHpVRVU4WWUzem5aTGJ2UEJF?=
 =?utf-8?B?SEFjMk1SRTVPY0l2YzMwd3psYXN4ZW9IbFdIWmdyT0M4NStva25JUzBnZWVw?=
 =?utf-8?B?VzF6Zld6WTV2TnhqbzBjeWRzVGtuYUhDSGtIVjFxc1RPRnNsVjM4RlRtaXhq?=
 =?utf-8?B?aXJKVDYwU1JiNGEyQlFIdmFXZlFFd2Z6NVlkTWRqZkFFa2d1YjV5S3RqOGNq?=
 =?utf-8?B?dGpBTkQvOHo1Vkoxd01ia2MzMzZwbzJwV1lJdUM0bTJrY3VLYS9naVhsTE9j?=
 =?utf-8?B?aFQ3QUJnZFVHRnEyZURpcnhwZitnMFRnTG04SStYdVFnZTNERWVoQkFLTzJK?=
 =?utf-8?B?WjZLYnBuWHBWbUxyMFJKNXZzSUx4ZElWRmp2OFlJamo1RksxSXUyZ2FGaVFQ?=
 =?utf-8?B?aTkvMzE4VXJOb0JqTDhPNElPK1hpRS9peHZxd2ozdGR5UVN3RnhSRWpEWlBj?=
 =?utf-8?B?OE5EcVVLU3ZHckJybVZxQ1prZ2U3VjVEU0k1QnVaYlMraDMwSnRuRG5ENlo1?=
 =?utf-8?B?MGZnQ2VqZDhiUFF1aTZ5ZmpEMkdOWXRaK2hCNmJjMkx0Q0RCU2JydmZua0t6?=
 =?utf-8?B?cUFaeEl0NEhkTkZ1TG5ZNTJLbmt5S2V1T1J4WGpMYWFTNmttczR1dHBzNHdr?=
 =?utf-8?B?Nm5lV2s5eUc1YUpwcG1iRXNUN3lLU2Y2OTh0bnFvVEJsVnczWlBqREU2TVNs?=
 =?utf-8?B?bTBIaFFhWHBMUUNySXFxYlZGYUpmWVlXSDMxYXhkNW05YnZNQWJJUVNqZ2hD?=
 =?utf-8?B?TnRWVGFwMXU0bVhiMzJ5dE9XcVhCaVFyTEd3ZEVuL05Ob2lNWmR6a2xmaDBY?=
 =?utf-8?B?YTdVTksvM0xMUDRZTDN2eTBEYkc5aDF4dkJQSUhwSmsyZnQ3RTdxVkNmZGFL?=
 =?utf-8?B?QlN0ZEM2ZnV5Y0NmV1pUUnd4Q21ta3RTOFVKVWFtT00ydXdwNHJwRTJmL1lF?=
 =?utf-8?B?UStpeHNrSWsrbGZnQzBMaGZxOWVRbUt6clBkYThubmZHM216aVhMdkRpRGli?=
 =?utf-8?B?cThNemUxTm1XVkJjTVdWZWtaazV2SjVxVGJ1bU9abUVxYjRjQXFFck1TUXp1?=
 =?utf-8?B?dnlYWkY5VUpmcGtURUtyb1J1K2lRV3hNSDQ2NXNLdXFlZ1BJeXNWK0JaWU1L?=
 =?utf-8?B?Zjl0aFliTkF2RTVYckI3MWEwcGJ6ZHYvbGJJWi9iYXY1QUdyZlY3UTVvUWpr?=
 =?utf-8?B?Z0JUWUxSRlFPSnc0MDR2VWRBYmVSY2Q5WjRVdHJGYUkvYkE5Y2tNVzltaDdk?=
 =?utf-8?B?Y3R2MkQ0bXBDd1FJbUdIN2VOdm1IWCtiZkZleGI4cUZyMFVyU200d1J1R0hm?=
 =?utf-8?B?ck0zUkNZbVF4YkpLSmMyVjE5TDVGTzlsdFRpS1VSbG1tLzhPeE51VTVyRWJQ?=
 =?utf-8?B?RS9zbEw5S2ZOdHBVaVdYQzJWR0NGTWVVZDJacWJPSmhxQkhidldqOFArMTJK?=
 =?utf-8?B?aDd5VktJVGk1ZlVFSnp5cTRENktpb3h3TWo2SWQvKzQ0b1pETTZxYU8zNmx5?=
 =?utf-8?B?R28zaFE5VFhrUGVlaldvVTlwcUpCRjdTQWJLTDNSd0lBUkRERkd2OEVuSm9x?=
 =?utf-8?B?UFE4ZHBuSS9LOENWZ2RmLzBLNFhFSVVQK0laKy9wUmt1WHVycHFDZHdIKzMr?=
 =?utf-8?B?bWZuYm1NcDg5ZHFkeFJ0THRXRFFEU21KVUU4U1phMWFZdVZDdjFYaktuTHFl?=
 =?utf-8?B?cTVPazhPUk15NzFvbmEvNnhyL0RiaWF1bkx4akk5UDhETDJqbStwY0hrZjdQ?=
 =?utf-8?Q?EAija2ZvCmtlhP7gEGH+mTZtk46Xtx6PTCp2pHnxFbNF7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	rxEvY0bLjblDZMS8GOAQFnDZoosI59WL6tRs/v4S9cYpsf8lGgy1qhebQkmZjr8UoRIXXTjjssjeeAVfk1ea3ytx1mcftX7EhybeAvL6w0KAi3ZzUwZCNsepAk6ESNdw+wGCzyv+YMdECOMpHzBSNsIrSrO4C1tfayFLd3H9bn2ZVg0gTP83yJjeIkNlrzwdA5Wucdbj9JmI2DgQ9yxAcOflmhqCpdPgrjcErOollQ32GQhK9VlIeTBR8MijPffndpWQNf2CI/d7umv5+oeNdbhHqx3OCsihFcNPnaQx+YzFDSJXLV97IuDLiuv5W7t0d8Sk29NSumJqYtFGKdvNNdt0OqY/bTIxD75sj08xMYHR39qUacyk9iRS4s4tBM5WQJ0rE6tzCFZAaM5uSl5Q0F8ESxcGwGaHIZktFMtxH7QZJl8FOy0aXZC3YkYfqH0V9zT5fnyCVZTO2A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbfcd0b-b71f-4622-3a32-08db7e3b154a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 16:07:23.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZLSKBYb8VuI5IQHyaFHClcNF180ihTD564+XLaE9Hg7GSK3vcn6fsxzY4cFxqIE3Yrhw5OM17hHasBjlIoIGiQ3cCAeqhHg5C5bpT742cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_11,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060145
X-Proofpoint-GUID: IpqfVoh1A5dsH9F5h83Sl_PBrbHK9QA-
X-Proofpoint-ORIG-GUID: IpqfVoh1A5dsH9F5h83Sl_PBrbHK9QA-
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, Naresh Kamboju <naresh.kamboju@linaro.org>, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggi
 n@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/6/23 10:58, Alexander Gordeev wrote:
> On Wed, Jul 05, 2023 at 08:49:58AM -0700, Nathan Chancellor wrote:
> ...
>> I just bisected the following build failure visible with 'ARCH=s390
>> allnoconfig' to this change as commit 842ce0e1dafa ("s390/kexec:
>> refactor for kernel/Kconfig.kexec") in -next.
>>
>>    arch/s390/kernel/machine_kexec.c:120:37: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>>      120 | static bool kdump_csum_valid(struct kimage *image)
>>          |                                     ^~~~~~
>>    arch/s390/kernel/machine_kexec.c:188:34: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>>      188 | int machine_kexec_prepare(struct kimage *image)
>>          |                                  ^~~~~~
>>    arch/s390/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>>    arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined type 'struct kimage'
>>      192 |         if (image->type == KEXEC_TYPE_CRASH)
>>          |                  ^~
>>    arch/s390/kernel/machine_kexec.c:192:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
>>      192 |         if (image->type == KEXEC_TYPE_CRASH)
>>          |                            ^~~~~~~~~~~~~~~~
>>          |                            KEXEC_ON_CRASH
>>    arch/s390/kernel/machine_kexec.c:192:28: note: each undeclared identifier is reported only once for each function it appears in
>>    arch/s390/kernel/machine_kexec.c:196:18: error: invalid use of undefined type 'struct kimage'
>>      196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>>          |                  ^~
>>    arch/s390/kernel/machine_kexec.c:196:28: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'KEXEC_ARCH_DEFAULT'?
>>      196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>>          |                            ^~~~~~~~~~~~~~~~~~
>>          |                            KEXEC_ARCH_DEFAULT
>>    In file included from arch/s390/include/asm/thread_info.h:31,
>>                     from include/linux/thread_info.h:60,
>>                     from arch/s390/include/asm/preempt.h:6,
>>                     from include/linux/preempt.h:79,
>>                     from arch/s390/include/asm/percpu.h:5,
>>                     from include/linux/irqflags.h:18,
>>                     from include/linux/rcupdate.h:26,
>>                     from include/linux/rculist.h:11,
>>                     from include/linux/pid.h:5,
>>                     from include/linux/sched.h:14,
>>                     from include/linux/ratelimit.h:6,
>>                     from include/linux/dev_printk.h:16,
>>                     from include/linux/device.h:15,
>>                     from arch/s390/kernel/machine_kexec.c:9:
>>    arch/s390/kernel/machine_kexec.c:200:48: error: invalid use of undefined type 'struct kimage'
>>      200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>>          |                                                ^~
>>    arch/s390/include/asm/page.h:186:58: note: in definition of macro '__va'
>>      186 | #define __va(x)                 ((void *)(unsigned long)(x))
>>          |                                                          ^
>>    arch/s390/include/asm/page.h:194:38: note: in expansion of macro 'pfn_to_phys'
>>      194 | #define pfn_to_virt(pfn)        __va(pfn_to_phys(pfn))
>>          |                                      ^~~~~~~~~~~
>>    arch/s390/include/asm/page.h:199:33: note: in expansion of macro 'pfn_to_virt'
>>      199 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
>>          |                                 ^~~~~~~~~~~
>>    include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>>       64 | #define page_to_pfn __page_to_pfn
>>          |                     ^~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:200:30: note: in expansion of macro 'page_to_virt'
>>      200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>>          |                              ^~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c: At top level:
>>    arch/s390/kernel/machine_kexec.c:207:35: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>>      207 | void machine_kexec_cleanup(struct kimage *image)
>>          |                                   ^~~~~~
>>    arch/s390/kernel/machine_kexec.c: In function '__do_machine_kexec':
>>    arch/s390/kernel/machine_kexec.c:243:40: error: invalid use of undefined type 'struct kimage'
>>      243 |         data_mover = page_to_phys(image->control_code_page);
>>          |                                        ^~
>>    arch/s390/include/asm/page.h:189:35: note: in definition of macro 'pfn_to_phys'
>>      189 | #define pfn_to_phys(pfn)        ((pfn) << PAGE_SHIFT)
>>          |                                   ^~~
>>    include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>>       64 | #define page_to_pfn __page_to_pfn
>>          |                     ^~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:243:22: note: in expansion of macro 'page_to_phys'
>>      243 |         data_mover = page_to_phys(image->control_code_page);
>>          |                      ^~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:244:36: error: invalid use of undefined type 'struct kimage'
>>      244 |         entry = virt_to_phys(&image->head);
>>          |                                    ^~
>>    In file included from arch/s390/kernel/machine_kexec.c:27:
>>    arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>>      252 |                    unsigned long, image->start,
>>          |                                        ^~
>>    arch/s390/include/asm/stacktrace.h:101:32: note: in definition of macro 'CALL_LARGS_2'
>>      101 |         long arg2 = (long)(t2)(a2)
>>          |                                ^~
>>    arch/s390/include/asm/stacktrace.h:216:9: note: in expansion of macro 'CALL_LARGS_3'
>>      216 |         CALL_LARGS_##nr(__VA_ARGS__);                                   \
>>          |         ^~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>>          |         ^~~~~~~~~~
>>    In file included from include/linux/irqflags.h:15:
>>    arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>>      252 |                    unsigned long, image->start,
>>          |                                        ^~
>>    include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
>>       11 |         typeof(x) __dummy2; \
>>          |                ^
>>    arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>>      136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>>          |         ^~~~~~~~~~~~~~~~
>>    arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>>      219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>>          |         ^~~~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>>          |         ^~~~~~~~~~
>>    include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
>>       12 |         (void)(&__dummy == &__dummy2); \
>>          |                         ^~
>>    arch/s390/include/asm/stacktrace.h:134:9: note: in expansion of macro 'typecheck'
>>      134 |         typecheck(t, a)
>>          |         ^~~~~~~~~
>>    arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>>      136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>>          |         ^~~~~~~~~~~~~~~~
>>    arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>>      219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>>          |         ^~~~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>>          |         ^~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c: At top level:
>>    arch/s390/kernel/machine_kexec.c:278:27: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>>      278 | void machine_kexec(struct kimage *image)
>>          |                           ^~~~~~
>>    arch/s390/kernel/machine_kexec.c: In function 'machine_kexec':
>>    arch/s390/kernel/machine_kexec.c:280:18: error: invalid use of undefined type 'struct kimage'
>>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>>          |                  ^~
>>    arch/s390/kernel/machine_kexec.c:280:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
>>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>>          |                            ^~~~~~~~~~~~~~~~
>>          |                            KEXEC_ON_CRASH
>>    arch/s390/kernel/machine_kexec.c:280:66: error: passing argument 1 of 'kdump_csum_valid' from incompatible pointer type [-Werror=incompatible-pointer-types]
>>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>>          |                                                                  ^~~~~
>>          |                                                                  |
>>          |                                                                  struct kimage *
>>    arch/s390/kernel/machine_kexec.c:120:45: note: expected 'struct kimage *' but argument is of type 'struct kimage *'
>>      120 | static bool kdump_csum_valid(struct kimage *image)
>>          |                              ~~~~~~~~~~~~~~~^~~~~
>>    cc1: some warnings being treated as errors
>>
>> I don't think this change is equivalent for s390, which had
>>
>>    config KEXEC
>>        def_bool y
>>        select KEXEC_CORE
>>
>> but it is now the equivalent of
>>
>>    config KEXEC
>>        bool "Enable kexec system call"
>>        default y
>>
>> which enables KEXEC by default but it also allows KEXEC to be disabled
>> for s390 now, because it is a user-visible symbol, not one that is
>> unconditionally enabled no matter what. If s390 can tolerate KEXEC being
>> user selectable, then I assume the fix is just adjusting
>> arch/s390/kernel/Makefile to only build the machine_kexec files when
>> CONFIG_KEXEC_CORE is set:
>>
>> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
>> index 6b2a051e1f8a..a06b39da95f0 100644
>> --- a/arch/s390/kernel/Makefile
>> +++ b/arch/s390/kernel/Makefile
>> @@ -37,10 +37,10 @@ CFLAGS_unwind_bc.o	+= -fno-optimize-sibling-calls
>>   obj-y	:= head64.o traps.o time.o process.o earlypgm.o early.o setup.o idle.o vtime.o
>>   obj-y	+= processor.o syscall.o ptrace.o signal.o cpcmd.o ebcdic.o nmi.o
>>   obj-y	+= debug.o irq.o ipl.o dis.o diag.o vdso.o cpufeature.o
>> -obj-y	+= sysinfo.o lgr.o os_info.o machine_kexec.o
>> +obj-y	+= sysinfo.o lgr.o os_info.o
>>   obj-y	+= runtime_instr.o cache.o fpu.o dumpstack.o guarded_storage.o sthyi.o
>>   obj-y	+= entry.o reipl.o relocate_kernel.o kdebugfs.o alternative.o
>> -obj-y	+= nospec-branch.o ipl_vmparm.o machine_kexec_reloc.o unwind_bc.o
>> +obj-y	+= nospec-branch.o ipl_vmparm.o unwind_bc.o
>>   obj-y	+= smp.o text_amode31.o stacktrace.o abs_lowcore.o
>>   
>>   extra-y				+= vmlinux.lds
>> @@ -66,6 +66,7 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>>   obj-$(CONFIG_UPROBES)		+= uprobes.o
>>   obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>>   
>> +obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o machine_kexec_reloc.o
>>   obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file.o kexec_image.o
>>   obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o
>>   
>>
>> Otherwise, the prompt for KEXEC could be made conditional on some ARCH
>> symbol so that architectures can opt out of it.
> 
> Hi Nathan,
> 
> Thanks a lot for looking into it!
> With few modification the fix would looke like below.
> It probably needs to be a pre-requisite for this series:
> 
> 
> [PATCH] s390/kexec: make machine_kexec depend on CONFIG_KEXEC_CORE
> 
> Make machine_kexec.o and relocate_kernel.o depend on
> CONFIG_KEXEC_CORE option as other architectures do.
> 
> Still generate machine_kexec_reloc.o unconditionally,
> since arch_kexec_do_relocs() function is neded by the
> decompressor.
> 
> Probably, #include <asm/kexec.h> could be be removed from
> machine_kexec_reloc.c source as well, but that would revert
> commit 155e6c706125 ("s390/kexec: add missing include to
> machine_kexec_reloc.c").
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>   arch/s390/kernel/Makefile | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
> index 8d7514c72bb8..0df2b88cc0da 100644
> --- a/arch/s390/kernel/Makefile
> +++ b/arch/s390/kernel/Makefile
> @@ -37,9 +37,9 @@ CFLAGS_unwind_bc.o	+= -fno-optimize-sibling-calls
>   obj-y	:= head64.o traps.o time.o process.o earlypgm.o early.o setup.o idle.o vtime.o
>   obj-y	+= processor.o syscall.o ptrace.o signal.o cpcmd.o ebcdic.o nmi.o
>   obj-y	+= debug.o irq.o ipl.o dis.o diag.o vdso.o cpufeature.o
> -obj-y	+= sysinfo.o lgr.o os_info.o machine_kexec.o
> +obj-y	+= sysinfo.o lgr.o os_info.o
>   obj-y	+= runtime_instr.o cache.o fpu.o dumpstack.o guarded_storage.o sthyi.o
> -obj-y	+= entry.o reipl.o relocate_kernel.o kdebugfs.o alternative.o
> +obj-y	+= entry.o reipl.o kdebugfs.o alternative.o
>   obj-y	+= nospec-branch.o ipl_vmparm.o machine_kexec_reloc.o unwind_bc.o
>   obj-y	+= smp.o text_amode31.o stacktrace.o abs_lowcore.o
>   
> @@ -63,6 +63,7 @@ obj-$(CONFIG_RETHOOK)		+= rethook.o
>   obj-$(CONFIG_FUNCTION_TRACER)	+= ftrace.o
>   obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o
>   obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
> +obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o relocate_kernel.o
>   obj-$(CONFIG_UPROBES)		+= uprobes.o
>   obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>   
>> Cheers,
>> Nathan
> 
> Thanks!

A bit of additional information. I've corrected the problem with s390 and now all config files pass 
with the olddefconfig, allyesconfig and allnoconfig targets (using approach outlined in the cover 
letter). What I did to resolve the last s390 problem is that I realized that KEXEC was 
unconditionally set, so I did the same by adding 'select KEXEC' to the config S390 section.

I'm not saying you shouldn't do the above changes, but wanted to make you aware that we're attacking 
the same problem...

I'm running my final regression run here (takes about 8 hours to get through all 385 now) and then I 
hope to post v5 within a day.

Thanks,
eric
