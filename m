Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B3738F21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:49:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=asXOqynp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=inU5w9GI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXbt2PYZz3dGT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:49:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=asXOqynp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=inU5w9GI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmVR50hr5z30hG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 03:11:43 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LDAbSC030805;
	Wed, 21 Jun 2023 17:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=cFVA8rz4Byy6FovNBlIwDK3HTVYo/vUXwFWTq50KWOU=;
 b=asXOqynpqRuVCSuVziBHfs+JoSW/Zu1LVq933MkQRxYSB5tAMQW+d59PpJM7lKLgvhY/
 xaL2mf6Rar5p908DUOWTdXvFe4q6ugG1cYQ5SVo0Q5oHk7dO8Ub/NlEc1kMiblCiSoTt
 NnkcDQx9rNPLJVIOi6rJKbULIvodYfOv1g62qoHkjIfNRP+QxiIK1RunyiwaMbLDauZ0
 gu4GmQDgoH4Y+F9eGEu+fycKrXUiufV+TzpjZs39BluYdFsPhFN35+vsOX/3QV6lTT4W
 GELraALyCWABn9Jdn1P8Mwu6faeYzeqg3Uo9ZDQuA/H/noDoV+wH9n0uRNKyWydcrKV5 TA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93e1g0u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 17:11:05 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35LGJxvI008428;
	Wed, 21 Jun 2023 17:11:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9396kj7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 17:11:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rf4uBUd4lyEaY7MnulRrmgXTokHmlZJW24aQBmrAhPLhz1c2Hkncf5g1cvpilRrD62Mda0O8gIvk6kpLDhM06EUIUTFiV/q0wHAEwcL/l3oIiHOJjVKdP5ijQUEJMiIUXjDAIs8lQsDIlCImyJn3kK8eN/fQ+BASpWfDhv53SicK/0cw02f7z0emhWfD428KzeqORCH8Q1j2p5fCFZmtZ3H90O9A8eBmw+mzY3txXZx2dNtAwCwfSYR9MIpiuapLLvG24INNtKt3e02zYXiF0FgQqXVz7xStOTymAFulN8R3/CUkJHI5JU7YWyiYsujtVUXqhw7Fu5yQDL6TAjI6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFVA8rz4Byy6FovNBlIwDK3HTVYo/vUXwFWTq50KWOU=;
 b=HFVzr/dFRo0vbvoQg3Fsptqn5pT4AvTfzcKD/ysKOJDRJvzbMsZ4xvFI3t5DJXIVdRMkUmLpMJeiZh4VwREkX8a7v7/bUUZAhI1n8Pw6LjJSh42pDF5mnanUdjOZP45Mtlm4aaqWS2jMk7sVcAqEYFxFajrVhFIeVFWCKL581wS8AV7VkIM8krrRsvQC43pwtaVzcIVD1iNMi43hEsQ9UQ3kBKmP69Bwxu7e1I6bUKDgUyybrNaaGoXS25u2VaVoJf74rEiKUFGS79D8VUXa8x+iWZdIJ0S6ZBjtrUUyUjmLzBdJ4gZXYwFl1eu8s7RFru8MCnKaU3JWsldphKftwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFVA8rz4Byy6FovNBlIwDK3HTVYo/vUXwFWTq50KWOU=;
 b=inU5w9GIRoMgWDY0lNDzLZ6tHplbwJZFjjeNlO7kKuNFvhfm4oLEEb59pIEuBCE7A3OZMpuEsZevHu0RMGvot7z5zP2O2GVSSg5lxhenjKNU7d+TsyKIMR0Ndpw8n+45A+6I7J5fRRrIdN9RR3u/qHQFis3CKm75Zzr1TgMBtVg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4699.namprd10.prod.outlook.com (2603:10b6:806:118::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 17:10:59 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 17:10:59 +0000
Message-ID: <b89bb8d6-77db-76fe-e360-f6c439b80e73@oracle.com>
Date: Wed, 21 Jun 2023 12:10:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-13-eric.devolder@oracle.com>
 <ZJKD690QaX1IgiAz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZJKD690QaX1IgiAz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ab26fe-9ba1-4023-73ee-08db727a7c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TSe6jR9RDHigmRyBDUYjurDIcM2OcJBQy6AEfFDI56YSvVfPaOzBh5wm73eVBDQBoQ2yDP1s7ZDV14jhzzKZBgTtaEwWerukQ/A+fIkBRAtTGjit+8Cc0EPB59Q/0A2v/pxZuwcXKUMb3avE4JjNDzN9BigerI/6o6sQRXy1PpB5I0Fm3+uPhJ2VERC64Bc5SUS0Knyc8ZqQzXY3RSBCAHSyK500eT9zLCz3iTixXlmTdVU8dL4+U4Hnc2npnba6O8hEGg50IGzTDfRV+iNrIRfXPcfB4iLRy1H2anRGDe4c6u2L/AQhdZNNNFZkfRRVYo1AqfUoPIwqpxM+AYqV+PfLSJOZeL1wPSMp1/1KribzbH+WDnkxsXdRp8jWoxTPNG/OrQWLSTIYzEIGPPgKPXjkqgY5JU5Itpc+3yX0j2U7wIbrDrv2y8vsnsalGO98v+kEragmTstosV8t0R4BfuwfFRjK/yrQR6r4DzFv42NLfXn2gSKv/Ppe+TycXnx7yv8EKUpKpqsFMWoZZRH8h0rPjdo3HTj5bH6srXtFOm0zEkT3XsGz99/QDX9cWpdY/azLtwgx9gj4CRmpDDc7fvTdwVCAWywg5hJBcR3eFma6wVmQ07y4F4Sk31D6BlBqSOCyYwTQ46ElcrEfky5hTw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199021)(31686004)(66899021)(36756003)(7406005)(7366002)(7416002)(5660300002)(41300700001)(8676002)(38100700002)(8936002)(66476007)(4326008)(316002)(86362001)(66556008)(31696002)(66946007)(6486002)(107886003)(6506007)(26005)(186003)(2906002)(6512007)(53546011)(2616005)(478600001)(83380400001)(6666004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Ukx4cG50azBTazNpRGRweUFXRTUvVVZRd3VFaHZUOTU3L1gyQm1oTkU3dGtP?=
 =?utf-8?B?L1pXN0hOKzBGSUVDelJBb2d6NENZYk9vR2tBOWUwamRLNEFkdUJTMGl5L05o?=
 =?utf-8?B?cXBqc01heTdTeS9oMTNEdVEzbG96MjZUZ05FWWxGdFRkMGc2K2FHTlkvV3ls?=
 =?utf-8?B?ZU9pUUZmc29vZGVhQlp3RThGQWZ0SjZPanFXd08vQ2ppNk5VKzJMdkFRRTl2?=
 =?utf-8?B?U1Rvc2FxVkxpK3kvMTdhalRuWjczKzZucDM0bjhidEMxenQ0ZThGRCtlRTZl?=
 =?utf-8?B?bFowYlpmd2hlRFU3cGh3aTdoZHdZWitrdWtodDJWbHlqMk1BNFRBaTNMUk91?=
 =?utf-8?B?bWwxV1R6MjB2Kzczbm9uRmYxbU96ek9iU05zd041alFwSUdKa3pJU3ptVlR1?=
 =?utf-8?B?TWdtNU1Gc1MvRnVYa0hYU0ZjYklMb2FpL2N5YTAxdXdwUk5wT2dnblg1Rm9v?=
 =?utf-8?B?SjdMWEdocktPd0Y3Ti9nR0w4SkdWV1FrQXRUejFWWVMyVGJyNDNhNjRHT0xv?=
 =?utf-8?B?NXJxbUxaUDZIQ0RUVytvbU9hc3c0dXc0NTRDM3BPZktkRGtVR2ZhV3JoZk9K?=
 =?utf-8?B?eDFjZ2JpdjFOaThVMWFsTlkxYS9MNzJ5c0RPalpYcmxMK3h0UFgzcTYraDRM?=
 =?utf-8?B?aUxoVFhqeHkrS1FGVlgvd2V6Wm1udWo4Z0NlME94bmFDc1BGZ0F5TGFYR3FB?=
 =?utf-8?B?S1AvaFYyY3JENDUyTEtqZ1hia2dONzdRaHVuTklXamVqNXZWbVFZaTI3ZkhX?=
 =?utf-8?B?WlpEeU5VNHRQb3pnQUFYTlNSTFgxa1hjc2Fabis3bjhEbE5SRTlicXlVd1dI?=
 =?utf-8?B?eXBKbEpzZEs0V2lSNDBYRVc1REVsdEozTm9iazA2TDVTcEJJYm1rUTlPV0V4?=
 =?utf-8?B?R0dRVVRud09IS3UxdzRaamxCSXE5bzBMQjVnUGRjdlVpWUVEMUVEOXgvOHBu?=
 =?utf-8?B?Qm03OTc2R1dzU1VlOGEyUjM2SFZwRzFGby9GVkUwT0MvVFZkWkNEZWY3dUQ2?=
 =?utf-8?B?aGIvZkordTBkV053dWx5eGM1NFN5Vkh2cVhKMmo1Q0txYTZtUmhnZVhZRENO?=
 =?utf-8?B?OEtpWi9TVGYxM2Exc2pDczlCTEVyYXh3NFpaRlhwMy9ES3VZb012NXVTa1Vw?=
 =?utf-8?B?SlRtSzdBemY0V3ZndjFhcEtlZFRSWGtOeTh2cjg1UlVldVdlMEc5NytueWsr?=
 =?utf-8?B?QVhJSUdrdUlIWndiM0o2aGZ5UXBOcUpKeVowTUU4YjVjRzlEd240SGlvVlov?=
 =?utf-8?B?WTJBSEdEamhpTUpZdjFkbzhkN1ZTS1p6b093Y25UZDl0WG1mNFNtM3ZNNkZK?=
 =?utf-8?B?Zzc0MVVQQ3N6YlBqUXQ5MThDT2FCYkt4S3U4UmZyYnU2WS9KUGpEcVRqelgx?=
 =?utf-8?B?ZXB5aWd3bWtqanpNejB6LzBnU3RkTmlqcHRydlYvWmdNSlUxK0pwS0hIZVNE?=
 =?utf-8?B?Vk5hNEZkZldLbytYVDJ4V3JQOVhnbDExdS9XU3BKaVdydFRjdGZwTnNXTm5m?=
 =?utf-8?B?L3Bxc0RiVjkzNURicGtDQkdxOW9LNUlzaFE2b3pLdUcvZHZPa0pjbFJyNTZh?=
 =?utf-8?B?Y21XaTBuWTZIc1BCTjBNWis2OTYyZDVqRjRhMW40eHZoRTRWK3dyb3dXaWVO?=
 =?utf-8?B?MzZTdXp6Y25tK1FFZUtHTTdsbFQwVGZhaU9lQjJnTHdycHc4NVpqT1NXUzcw?=
 =?utf-8?B?TmgyaW5ZTmtSUmlVc05JSk5CM3dTTldjTW9HZUMwUGhPSDdCWXgzQ3ZTVVRp?=
 =?utf-8?B?anVCVVJENUQzOWFJd0gwemhyRmovcjdUcnBSTTNRZHQ1N1lMalg1c0lhOXR3?=
 =?utf-8?B?dHhtczNibTJESnRGbXByQm9kd1NUcmpHaHBaYzk1T1pXQmVmbFB5bXdUbnhr?=
 =?utf-8?B?UzNBSHNHbG1pWTVsTlRXWlI5VE12SzVVUFA4a0hzeVFLR3JpanFZYXdGb2hE?=
 =?utf-8?B?anBwUFZBZUEvRFM1enJicW9RNGMwdlVFZm9MaDJkZk9SWnNRb01Ub0RsWDAy?=
 =?utf-8?B?SUtqNmxCOVJqallsNzExVU41NDZSZi9lVk5pd1RqWnBydHE3YXFsOWc1Ykpw?=
 =?utf-8?B?V1ZuWGJObzdYUXpoRkNBQmhUOWJLN0FnczlJVzlNbU4ydmltOEFWUWNMQXpF?=
 =?utf-8?B?b0MxaFc4MWRtcXA0YnJ1bzJ5M2JWdjBLenZoOEdHa3F5RGhjcWozM2YraDg1?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?RElPd3Q1dm9heE1NV0ZEWXVidjZ0Zk53RXlFSnJTYkppTU1DS29NZ2Y2TEpJ?=
 =?utf-8?B?UVJFRU8wRkpINGI5MGp1cmlHV0t4VWRNb3p3WVJESDNXdEF3bFI3YWI5VnI1?=
 =?utf-8?B?MFFhaXpUUGJleGdiQlY4SzU0ektpWWFzNkpNU0FZMDJ1THBjbUR5YlJiU1VM?=
 =?utf-8?B?eURpWjhlMkltbFJCSFk0MXN3THRRTE5BSW1PRThNUWRQdGtHTTdhSEQ3cHpG?=
 =?utf-8?B?R3cwc0dGMUlDak5HT2h0ZVlFSWtWQzR3eEJmQjNWNmlpMjdvQXVjd2tCZjJX?=
 =?utf-8?B?S2c3TG5BVThiZTc4Nmh5V01LdUF6UU1RNGV2N2puODdPQ0NDWVRtTk50c1Nu?=
 =?utf-8?B?S0hNY0h0VVI4TWxaQUdGL2pHNW1vR25NZTBNUVUraXoxMDNJUW5DODhOakNr?=
 =?utf-8?B?NWtlNmFydEhiOE9RaWt6VlQ4MWgzMWpxeWV2YUluN1VTdkNTbUtxYWJvNWgz?=
 =?utf-8?B?c0crQ2NxanhmYXpSV1E4eGhVMG5TbzNLcExTM3ZYd3VzekVCNk9xeDlPY1Z6?=
 =?utf-8?B?ZXVubFN2a0s3OEJxN01ocVY1cXF5N1FUU3Iza0ZYcTlMdkxwemxqRlpsOXM4?=
 =?utf-8?B?VEd1S2hZSlhZS2U5K0krcmFERkkwZW5YcTVnMGJtU050WUZ2MXppaHBubGg3?=
 =?utf-8?B?K3VRS0F6ZjlXVHduNWozcTlENDFrY09BZjBhajMwN3hqbUNBL2JHdjJtSUUw?=
 =?utf-8?B?Mjc4dWRrWERLMDJJdmo1cVRzdWQ2eUFYeHR3WU5WSWx6cHQwREJDYXJmcEVC?=
 =?utf-8?B?WjJic1lKZXE1c2FtUVhmdlgwdTM4dVViNFAwNGRwYkowTktYNS8wYWNxNTN0?=
 =?utf-8?B?WjZBVisrWlV4YUVZQkZkK0V0ZzZ0eVlETWljdnppZENEOGNhN09LbGphaUFP?=
 =?utf-8?B?cUQ5OFZIdFRZUVN6YW9HdTNKc1JUMXNqdUY1MjI1am9RK0tmUVVxVFVCTGti?=
 =?utf-8?B?dnIwOVNmQnpyQ3JybzRxMmNJYVgyTCt2NDI3ZTl0VFdWM3BhZGxRVHNyOEJO?=
 =?utf-8?B?QUVaNEJPVEp5WmtkN2o5Z0RDUFhFL3RTMlZaKzJIalNwcC9CTktWa0M4dnNG?=
 =?utf-8?B?RlRtbnN5WHVQSFFIbmV3MEJhc3A0WFJDNFNVZ3hyVEpoQnh5TVZCRFIrUEI3?=
 =?utf-8?B?cnBObU16WU1IQWJIWWpqSUswRW10NTJmekNreDhmQjMzSlpqSjAxTlByL09l?=
 =?utf-8?B?akowVHByTEgwclRtcTYrdG1MZ2lMckZMQ2ZEVnhzaS8xcUVUeXV3SVh2Q0N6?=
 =?utf-8?B?dFkvVlRKbVd2N2MwY2xRem1CdUc1dkhhMUdKUWFNaHk5R2dITjl4MTFmeGNG?=
 =?utf-8?B?L3M4OGNpT2V1YUpVaXcvajkrWkhDZ2p4TGx3U0dzMlQyUXc2VGVwcFZVVmgw?=
 =?utf-8?B?YnQxd0FycGEvK3R2cW95KzhWbWJnUGR5aEROVnhzU1cwU1pRL3JUY0lPaFgx?=
 =?utf-8?B?b0FuK3BlVlFDdnlTRVk4ek0yQXVKalpMSDhDVVhwdDNOeHY1ZDVYVFBacTdY?=
 =?utf-8?B?c1pyS2Q4S0VqTmRBRG10TmMvcGJCblU3NFlVU1d2dzR5emVLTjJhOUNad2Rq?=
 =?utf-8?B?bElwNDRYd1Z5dGJEUXdLTlU0UllEUGxtRFhDc2lXVCtPVE5rTnh5ZlhscU8r?=
 =?utf-8?B?VlpINUZWQWl0cmRBK0ZtOUNlN2o2MnlqaGtPQUdRUzFBZnBwMjRjbjVqSmcr?=
 =?utf-8?B?RmNpZVFMTXlqQ0RrTzdOSEVKQVpBdVZsOGxVVi9GalF1M1lTNDBYZHhHelZ0?=
 =?utf-8?B?Q01kR3o3bDFsVTJXa1FlVy9YbTRkSXdPMUtkN2FIbjBKRFdiazZzOUZKd3pp?=
 =?utf-8?B?YUo5cnIrYXRsblA2RG5RVTh6UTlvVDZrcGUrajl2MWFHSVVTRDQzdE9BWktU?=
 =?utf-8?B?OUVVaHgzQzh2N25sUFJPZS9Qb1FtSk9zNEs5aGpBYndWcTc4MDFqdmpYSlds?=
 =?utf-8?B?dWtkdEtjdHc1QlhTcmN0dUd6Y29CZlBSWWlkV3g5K1NWUThxUnZOS2RrY3cy?=
 =?utf-8?B?S2F4ZjYwaTVhOGYveE9RZUFkOW43Rm1jTjcrUkhONFl6WXpCY282OGhVWDc1?=
 =?utf-8?B?V25UMmhNbVpBcm9LZC9qc1dSZkthY0FTTm8zVnVFRTAwUDd3RlJFY3hQeVBY?=
 =?utf-8?B?cUVmTG9FNDJJZ211Qnp2NWhBcmZ4L0FEd295clJVVUQ5TkowaGcxaWtxTGpI?=
 =?utf-8?B?S3IvUE96VG9maklwZ1c3dHMzajBOOU40QWh5SCtXUm5rcXBqVlRSSUFzNjVV?=
 =?utf-8?B?WXFOTUszSnhiU0gxZklyUmNVcXVXZjFNWlVFWlQvVUxyYTNOaktRT1hIYUxR?=
 =?utf-8?B?bm8yNWFiajJCY0FrTGRQR1JTeHdSdE5xY2dSenljZ1gxZkFRbmJXSWc3SXVk?=
 =?utf-8?Q?sT0XTl6skeVKUWSSlQqnb5QNhbfI1VEOK6fsTb2C4ObFy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	r4Kg79TGH/5+GpXJ4RIGsplkvLGx/ah6xU+we4dxo2OvfNCuk4Xo2TJRgGiHk2N3T0qo0Pec4XEoWf7+3u5Q99FA5xvadOa96jTSlW+ab87tjZgdRX5EfK/D1y3XuWrXQx3BCWN5j1DxA7dkSFxBYeODfjWZfnFAIJW+x2ONJMk1QTYsFz0ZAjKsqNcCb0WJGpKlAfibfH9Wfy0lmGwEeprgkHwIrfCm221jWVn2vA63GOujfxledyGqdXXYL0Wu20g6MsBLhunGVGmZeXITUaHAJRNrLMBFplS1Hjd4wU79pF3hJryGuMe3AHbkXTuoAr+PM0aH4vrGvLC6IjEXBYOguG41P4T4KfVI9wSdeEnHJd2r5rN4qCsT3gXzpDspfS4xYg7gxUJqqRRim0dz6tTrYq6+Gmo5/G98Q6AcPG7wliPvXN7KoZec9XwO2V8KSdS6U7VgpLathg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ab26fe-9ba1-4023-73ee-08db727a7c14
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 17:10:59.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNn7B8IpDq50uWYPKj8K/Rk9COIn8nMPGUbl6QNCB9nHBsPFbRbUGBAjKCHP9suZNQ1FEpITduIQZnWiFbPWXUgkvBoSkRenS7UNrOKHczk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4699
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210144
X-Proofpoint-GUID: aQzqRkEXScwn-a6gonGdwPG6ptTnbI-0
X-Proofpoint-ORIG-GUID: aQzqRkEXScwn-a6gonGdwPG6ptTnbI-0
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/21/23 00:00, Alexander Gordeev wrote:
> On Mon, Jun 19, 2023 at 10:58:00AM -0400, Eric DeVolder wrote:
> 
> Hi Eric,
> 
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> NOTE: The original Kconfig has a KEXEC_SIG which depends on
>> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
>> dependency (using the strategy outlined in this series, and other
>> techniques) results in 'error: recursive dependency detected'
>> on CRYPTO. This occurs due to any path through KEXEC_SIG
>> attempting to select CRYPTO is ultimately dependent upon CRYPTO:
>>
>>   CRYPTO
>>    <- ARCH_SUPPORTS_KEXEC_FILE
>>       <- KEXEC_FILE
>>          <- KEXEC_SIG
>>
>> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
>> for KEXEC_SIG. In practice, however, MODULE_SIG_FORMAT is still
>> configured-in as the use of KEXEC_SIG is in step with the use of
>> SYSTEM_DATA_VERIFICATION, which does select MODULE_SIG_FORMAT.
> 
> No, it is actually the other way around.
> Could you please provide the correct explanation?
> 
> AFAICT the MODULE_SIG_FORMAT dependency was introduced with commit
> c8424e776b09 ("MODSIGN: Export module signature definitions") and
> in fact was not necessary, since s390 did/does not use mod_check_sig()
> anyway. So the SYSTEM_DATA_VERIFICATION could have left intact.

Thomas, would the correct explanation be simply indicating that MODULE_SIG_FORMAT isn't needed as it 
is not used by s390 (crediting your summary above)?

> 
> However, the original SYSTEM_DATA_VERIFICATION seems sane and I do
> not understand why other architectures do not have it also? May be
> Mimi Zohar (putting on CC) could explain that?
> 
> It looks like such dependency actually exists in implicit form
> (which you picked from x86):
> 
> 	In addition to this option, you need to enable signature
> 	verification for the corresponding kernel image type being
> 	loaded in order for this to work.
> 
> Does it mean that if an architecture did not enable the signature
> verification type explicitly the linker could fail - both before
> and after you series?

As a quick test I checked x86 and it compiles/links ok if KEXEC_SIG and KEXEC_SIG_FORCE are 
configured-in, but KEXEC_BZIMAGE_VERIFY_SIG (used for x86 sig verify) is not. The reason being that 
the kexec_image_verify_sig() function checks if the fops.verify_sig is non-NULL before invoking the 
verification. If it is NULL, the sig check fails. This would appear to be valid outcome for other 
archs as well.

At any rate, I think attempting to determine if other archs need SYSTEM_DATA_VERIFICATION is out of 
the scope of this series; I'm targeting just the refactor to be equivalent to what is what prior.

Thanks for looking at this!
eric
> 
> Thanks!
> 
>> Not ideal, but results in equivalent .config files for s390.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
>>   1 file changed, 19 insertions(+), 46 deletions(-)
>>
>> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
>> index 6dab9c1be508..58dc124433ca 100644
>> --- a/arch/s390/Kconfig
>> +++ b/arch/s390/Kconfig
>> @@ -243,6 +243,25 @@ config PGTABLE_LEVELS
>>   
>>   source "kernel/livepatch/Kconfig"
>>   
>> +config ARCH_DEFAULT_KEXEC
>> +	def_bool y
>> +
>> +config ARCH_SUPPORTS_KEXEC
>> +	def_bool y
>> +
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
>> +
>> +config ARCH_HAS_KEXEC_PURGATORY
>> +	def_bool KEXEC_FILE
>> +
>> +config ARCH_SUPPORTS_CRASH_DUMP
>> +	def_bool y
>> +	help
>> +	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
>> +	  This option also enables s390 zfcpdump.
>> +	  See also <file:Documentation/s390/zfcpdump.rst>
>> +
>>   menu "Processor type and features"
>>   
>>   config HAVE_MARCH_Z10_FEATURES
>> @@ -481,36 +500,6 @@ config SCHED_TOPOLOGY
>>   
>>   source "kernel/Kconfig.hz"
>>   
>> -config KEXEC
>> -	def_bool y
>> -	select KEXEC_CORE
>> -
>> -config KEXEC_FILE
>> -	bool "kexec file based system call"
>> -	select KEXEC_CORE
>> -	depends on CRYPTO
>> -	depends on CRYPTO_SHA256
>> -	depends on CRYPTO_SHA256_S390
>> -	help
>> -	  Enable the kexec file based system call. In contrast to the normal
>> -	  kexec system call this system call takes file descriptors for the
>> -	  kernel and initramfs as arguments.
>> -
>> -config ARCH_HAS_KEXEC_PURGATORY
>> -	def_bool y
>> -	depends on KEXEC_FILE
>> -
>> -config KEXEC_SIG
>> -	bool "Verify kernel signature during kexec_file_load() syscall"
>> -	depends on KEXEC_FILE && MODULE_SIG_FORMAT
>> -	help
>> -	  This option makes kernel signature verification mandatory for
>> -	  the kexec_file_load() syscall.
>> -
>> -	  In addition to that option, you need to enable signature
>> -	  verification for the corresponding kernel image type being
>> -	  loaded in order for this to work.
>> -
>>   config KERNEL_NOBP
>>   	def_bool n
>>   	prompt "Enable modified branch prediction for the kernel by default"
>> @@ -732,22 +721,6 @@ config VFIO_AP
>>   
>>   endmenu
>>   
>> -menu "Dump support"
>> -
>> -config CRASH_DUMP
>> -	bool "kernel crash dumps"
>> -	select KEXEC
>> -	help
>> -	  Generate crash dump after being started by kexec.
>> -	  Crash dump kernels are loaded in the main kernel with kexec-tools
>> -	  into a specially reserved region and then later executed after
>> -	  a crash by kdump/kexec.
>> -	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
>> -	  This option also enables s390 zfcpdump.
>> -	  See also <file:Documentation/s390/zfcpdump.rst>
>> -
>> -endmenu
>> -
>>   config CCW
>>   	def_bool y
>>   
>> -- 
>> 2.31.1
>>
