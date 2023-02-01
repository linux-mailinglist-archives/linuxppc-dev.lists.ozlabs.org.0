Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED3686DDA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 19:25:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6VhK44NHz3f3Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 05:25:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ep1ZcVFw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=d9+pdXK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ep1ZcVFw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=d9+pdXK/;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6VgJ2PcBz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 05:24:10 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311HwcLU028311;
	Wed, 1 Feb 2023 18:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=qO/tRVW2PbG8cAX9XtterAW78qMfiRx9hNNiRS2GiGY=;
 b=ep1ZcVFwp1OQgqIkGqFDgTQGTbUe6edY4o4UZCElygHbOrSTJHVos33Zy2GKkFqh0EOF
 9m5ulSCZHcQYrsJEikJZuu9fd+9nO9q19BMRjvgawL7bCxvnYvM2VelwXv/ZC08JlJXI
 ja3Z0mEStIZWtcIImZHW/4gB7Fmj0fngoCIAVEpR1/O4Q8FiJ/6VO4Aghpn1zDJczvC8
 q+5aM+m5MdzuMzkyJORDYXiBvL/6s9MZqgAL9BW6sQ1iPSpt96zt9QTheADwj/QEJEiN
 wRyvHWiNTN6BG2IrbREcwacu5A7S3JV+kT9QeBE4mDuZiZhT2fSFox12JsxB3h+p4tKW uA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfmbg1c0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Feb 2023 18:23:33 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 311GnSsv033895;
	Wed, 1 Feb 2023 18:23:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3nct57nmut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Feb 2023 18:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFpTzBTKAbud3gBnILGmBXdVaSLgeALu+forscWLmHahbqXBr8P6iA4oZvi4ndwnynHgmlj/1kUAM6r/lvsglctHXfy4iN0RQ+bshZR7gmn20R7+pLAoECQNCOid/lLvHJSEYcLGylqGltYyPWYrXEvAQTuK8tBBZ9pxa60ueQIq9a9a3nT0z6LAY9bPHmuV7ynKMCvkuZEJ80x+TgBNmWuikV1A7iNDOamQJ85fEsTDY1GM2e4V7V0UbCXxBw9WimEdQtKJrj/FtcByzrVw95UKQlJFtGXrdc5jTtvf4nwor5hT3ENYoYIZ3clNfKNX7btIC9dj+X3WcbJ0D9FhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO/tRVW2PbG8cAX9XtterAW78qMfiRx9hNNiRS2GiGY=;
 b=bN478eVdcnfJ+pKQANzHVXyR38cvqNtOHgBVTV7EWYTfMofHfEXnI2A0u6a57uPisFw5hjoA1U8wCz/LYyQOFY4xkXCSvvJgtLSrQ6QS3KHvjUDuQKqr1Ld1kQn8KRUVQQUbps9mjk+xj5IEWsbOa5IBQkvldrd4q+kmhQ3ah2zjEHKlq1UKTlEBCZ1NQ4rbjaAcs0dkO9Lly5eAJoRo4Yrm3vD/4fgQQlX68xq2rFdMKRAG4T4lMSpU2XlQus3YcRru6oxkOSUSKS4cJ+KM0hRT+bAOiGNchAXc8Mh2HNLbx7/6VRa090HtCoK71QxYtBiw21mJWD6Hhskje5u6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO/tRVW2PbG8cAX9XtterAW78qMfiRx9hNNiRS2GiGY=;
 b=d9+pdXK/a5eO02WB8n4p19ZXU6ivYmVjZonltNsGlXsgoRC7T01L4J/+06tBCpMtqNNlM4YKN6+XnypctAg/rzkCsZUbuMr2faOrgUAyJfwMlaGxyj/9W0fymPhRp4949HNz1hXAynjaR2ASVws8soLf2uQ5j8L+Bz43YOstXBI=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.19; Wed, 1 Feb
 2023 18:23:29 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%8]) with mapi id 15.20.6064.025; Wed, 1 Feb 2023
 18:23:29 +0000
Message-ID: <a7e2e1ab-95bb-8c23-ece9-01ee3a119bd1@oracle.com>
Date: Wed, 1 Feb 2023 18:23:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
Content-Language: en-US
To: Ian Rogers <irogers@google.com>
References: <20230126233645.200509-1-irogers@google.com>
 <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
 <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com>
 <c18b2293-5f34-28b9-25de-c92c25d5c3f0@oracle.com>
 <CAP-5=fWvdOFG0r5eibOy4Ai2EF2zcKZBsFU+vSDBPasvjFepVg@mail.gmail.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAP-5=fWvdOFG0r5eibOy4Ai2EF2zcKZBsFU+vSDBPasvjFepVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::7) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f9b7dc-6dab-41d7-de08-08db04816a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3e5vLVsIAOnXxgwx0vITZHuC2QmeCn29qOuMfse8o79L90e2a+Bcl3vWODfJjXGv47L2CW8pf0dR++m026hyBWVT0tlArCTqX7jkQve2y74X2/qh85qyGh+0fWCIyTJoXjZxmIMxGmO1NciV4KL7LJlrxYSSNYEml0418vz/LXzqysZfiSm/JdGr9ED8zsMxcb60KhYesqlbdW4/pgGtzWQOQ3EIrenuv8YZy/J3JKCULnHYlrKIMYpEeueDJJZ9+ojf+sb6JIBSWtXz54pUMcr4FzzqePmtIWsoAmn+295CmDdqgvyzEfaUYqMqvVZwrNS9ANGT5qc6+ZJGIT+JlPpRwqe8ei2oV1nrCDJa20PeRmygqy8VY5OyS5YsB3vO2hiMKslkKabeDDBhpqrltk2euDcwKiJ7sDEYiejs9hvRl6A5dROYYhNipGPAHvbh1jKjfh6RF3TH0y8jVyWFqDROfeU6u4LNjIkaM1o8qrdLpFIXN9EuAkvv7H166re1DdK2QXIpmBoUb6Cm+N2l1h1LpjyIHXEMyWlsJ0WB3smgJq+ZStqw07WDKi4xJFU8xQJQaDG3tGY8MG7Ox5eyfcR8TetIc04qol7CdfQ/1OczMEX2+CIDg4TJUaLy/+uc3sPeRALZofvYBXaNbud6WbR3wGPNJU9oIzckFAyHToBRzjCRzpdDBXFIFNKp09ve6pk4Zx4vJjHYXZWIUXdk/JTitCXaeiLjmwaGtuIrGT7BqPlrvYG4/c/cFErFIeCklk/MRWCtozGHykj7r3HJJQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199018)(6486002)(4326008)(66556008)(83380400001)(54906003)(2616005)(66476007)(66946007)(8936002)(8676002)(6666004)(316002)(41300700001)(6916009)(478600001)(53546011)(86362001)(186003)(36916002)(6512007)(966005)(6506007)(26005)(36756003)(4744005)(5660300002)(7416002)(38100700002)(7406005)(2906002)(84970400001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VFF3dnBVWkN1ZFVPYVNLTUNtU2N0SUYvaHMwWlV3MllRWHdSQWZTbWl0bmFk?=
 =?utf-8?B?WGdqd0Yvd1JDcUVmWDRTcGlHaGI2L0pzeWwvRmJMbERuNHpwd0RUT01pWlpm?=
 =?utf-8?B?RDBjR08yZWdDTy9OR1BsbytOMTJ1ajBIcUpkSlFHNDBiK0REbW1obkJHZEFN?=
 =?utf-8?B?cGU5ekJIak93WjE4dHN4MUxDaUlwTGVIMC90Ylh3VzJydDk1cU9EcytkSlZS?=
 =?utf-8?B?Wm9CaWVyQlZYZU96QXFtUW52QWszN3V0YXpLdlQ0ajl3bUZxOFF6aTgvU0pC?=
 =?utf-8?B?VEFrQXNHb2VLWmNFOGoxK29GblVyWTdZUnVCUlF2RHI3Y1dpQ0hxRDJFcFpi?=
 =?utf-8?B?MVB6VVdmRnlBUFpIU1dBOVJqVzAzTDRPN0RPRDRLWlVjSVUzbE1wd29MaVIr?=
 =?utf-8?B?aVVwZTdna1luWTNrUVlNN0haN1g3R0E0UnRjeWVMNDNkVjFhaXhnd0NGNmVi?=
 =?utf-8?B?ZldiOVc5c293ZDdWd3RGOUFCU1cxWjZ5aGRUQUk3cFJMcEdDN2tCeklsdUh0?=
 =?utf-8?B?QWh6ckFYZHZqdW5rWnpDNmlKV0dHYjFLdERiZGM3NEppTnlKQ1hOc2FTcDc3?=
 =?utf-8?B?N3NKUElNUGxUQ2FBZHJrZUdEbG90VFpvSGZTTnJQSjNuWnNhd1YrcHg0d1Bm?=
 =?utf-8?B?cklZWGpXTkdNSXJvTVNhRnJ3eTJtalFBVTFtcjNCVWc4enpSaStCcFc0c0Nl?=
 =?utf-8?B?NTJxQWpJZ3JVTzk5WWQrN3BWSWVXdkRCS2NiNWNlN1VGMzE0NWplbE1rK0xU?=
 =?utf-8?B?aEw2SDBSakpYaUJRWENTK2dpS25sdHRJc3hzNnpyeHQvblkybk5XVHplZXdY?=
 =?utf-8?B?QXorNG9XRjcyWTlGVlRRaEVlU0FES2x2TzhqT1czMHoyOVdiNEpnSk5JSlh5?=
 =?utf-8?B?TTdjWUF5azZ0U05kM0RuTkhCcU43SStkQk4rZk9SdHRkRTlkSUxWN3RUSnFB?=
 =?utf-8?B?aERkOVBtVkxUVTAwOUs2T1NNWGhYSCt2U2Z4aFNIcWU5Nm8xeXY0aUw2NFpG?=
 =?utf-8?B?UEhDTFNSUWZsTVNCb2llNURYWGxTaVVOaExNSzRNNEZyeUs2Tjg1VnMzMGZj?=
 =?utf-8?B?UE9qbDAzcjdEdmtkYWFqdUhvTFFUVnl1V2w1dUpwYlpUVWZaYUFoWExSQXV5?=
 =?utf-8?B?NlhpOFhyRzFFTWpVK3JIUndWS0dTRk9YVlM2d3BGZk5hdlM2QjlsQVI2VXNs?=
 =?utf-8?B?NGRRMFhKUm9XUkxRSlRBZjZnRk85cmF2UWxyOGlXUEZHcFhsSGx3VHN5L0Fj?=
 =?utf-8?B?SnNrVUhXbUNWSXYwMDhGeE92MEJSTFBCRk41aVdDelB1eEVxZ2Q1NS9BRDRq?=
 =?utf-8?B?cGJ3VDBKaVBsbmZJTmlZKytKN3dFdG0yVmdBZ2hKd29kaUhBRTJBMjhvN2Ji?=
 =?utf-8?B?dE8wMDd6aVArVVJVNVZveHdqd2ZlWGJXSVdYYzBnbUtXZitYc3U0MmVpdDVC?=
 =?utf-8?B?cDlPNGtCOStCVjZLNjVlSXA1V2tIMFg0dEsveWJVd3FWQ1gxVlJMYVgvNkxi?=
 =?utf-8?B?eW9xMnNYWWdMaVdUSFoxMEJ0UjhRelB1MnhNRk9lSFZaR1FNQmtldDd2Wk1t?=
 =?utf-8?B?a3AxRkxSdnpzMTZ4a2ZaZXZiR21VdHJ3TTN6YTRPKzNLSmpnUGFIWlZSRFdh?=
 =?utf-8?B?VC9PSW4yYmVKRWg0K3ZBUlVBdVJGeFdITG53WktwZU1ZM3pqWTl6aXo4VXJr?=
 =?utf-8?B?RktxOFRmTHRvVDB5SEp6ZXJselE2UXUyc0l2bzRvRGZCczY5ZFRwcHA2N1Fh?=
 =?utf-8?B?VlEycTNMcU1vak4zMTNzVGJjckhrRVRBRjFqR2VyRzQ3UjBFaDB3OFRLb2xq?=
 =?utf-8?B?SDVOYW82YTZwcGd4R21iY29QU3VUUmZrNFB3STF2bUsvOFNnZnpKWmNBSUU4?=
 =?utf-8?B?bU9icE5ZMG1WRFdPVVZHME01ejV0YVN2MjdCbi91UGtuQ2FIdWJFVEhvczFt?=
 =?utf-8?B?Y1RZR3AxWDJJbDVSbGFRSVdubGlvQWNwMTV2UDRqc3Z1dEt2SUZqMUxOcG5B?=
 =?utf-8?B?S1FLc2ZtL0ZjM1JvVC9heDhnRm0zT0Z2OFdPcThGMGxDZ2lpL0MxdnF2SUdM?=
 =?utf-8?B?S2lCTVhMbjduTW00VVpIQi9NUHozTm4vT2Y2S250ZUxHUFUvMThibE5RSE1M?=
 =?utf-8?B?Y285d21EcVFDYko0ajlvd1lNTld5cjlzdmx0aXhLRjhwWWFkS05zNlB5aldH?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?a2xUSkFsMk01NlpySWJjMTRqekdhSHpYYWZTZW5wOS95Mjd4c0NjUlFBQTQ1?=
 =?utf-8?B?TlFMRmpKWHVXOTNSQTNWOUZXNnJHNVJibUFIWFpiNlI5NzlHRkJWeWxabFBw?=
 =?utf-8?B?V01RL2ZjenI2OWhSWnlHNkh6Y2NHUy9xcmhWSWNUSkpUdm9vSVFXa2xkVi9K?=
 =?utf-8?B?ZnVOVjN3SjVUL0x2ZExDeG15Q1d3alBjcGQzcUdqQWxEeTd4Q1lGUVlzcy9n?=
 =?utf-8?B?SnlXenFwTFNJWHJkZlhPTXVJaFpkS1cvdjBwSjN3Mi9xcTBmWjFmajN1bmdp?=
 =?utf-8?B?VjJnVVhkeEN4REQ2OW9aZU5QbmlYcW1yTmFRUU9ubWpNR0pKWWNBRjV2cW92?=
 =?utf-8?B?Ykh1LytLNE5JNVNLUW5VbG1jTVBrbzN0QWZiMEFHWExJZW05VEFnM2pEZXh6?=
 =?utf-8?B?NjNtcGZod2JPUWNOUWRyZUo1engwcDV3S3g4ck81eXkwQlF4cUhSaEFrNVNH?=
 =?utf-8?B?ai9NVTlmTURRclcxZ09FMEc2ZjE3eTR2QXJjbjUxOUpPQnJrbU5jNlhGSU1j?=
 =?utf-8?B?eGhJMWZ6SkdxRURPdTB2Vi9PUm10WWQ4U3A5SXBhNzVaVGtqTEp6ZUUybnpu?=
 =?utf-8?B?bTBrYnBScmYrVU5PYkxmK1dtL2pUZ0NmeTZzbTdvaHNCSU1EYWJqVlFyNlBK?=
 =?utf-8?B?MzZSbndwbThMSjlaMHJ4RDlYd1h2VHd2d09tV0FQOFUrWktMMXJjOXhWbmdq?=
 =?utf-8?B?bThWZ0FDL0NFYWs4NHoxUGhXd25BdHFtQXBqQ3hEdUlTQkdEYTRGaEppeHRH?=
 =?utf-8?B?U1RvOTltendSWU90SjJmVlRWQ0gyUTBkZ29aS0JqWXR4MisvUTFRcHBwb2Vi?=
 =?utf-8?B?eUZabjV4enhQcnVGZjBtM0YxNXlqbHovZ1JLa0RWaUtRMHZnbkNockVveHpX?=
 =?utf-8?B?bk5nb1ZYSWh3L0J5ZmRidE0zS2wzWnBRZG5CKzFXeXlNZVVSYjZqQU00YzlE?=
 =?utf-8?B?WFZ0NmN0T3ZlbVNsbUxNVGUvTXJkWUQrSXA5QWowRGRsM3VTMUNsQ2dRTms2?=
 =?utf-8?B?WkI5TU9LdXdyTnZDWEptZ0s0Nm9pSzlmdisxbHAvQ2RYV3BDZTN1b01sRG5z?=
 =?utf-8?B?SE1BRmYxeWIvWmsvTXB1ZGdXYm5mMlVMOE9aMnVQSFZ1RCtZWHQrYU1Edk9B?=
 =?utf-8?B?UjREWm5ubklET29LQVVZOW9qU0hhQS92SXFEQy9QMll6cHVWTzVhdzVySkNE?=
 =?utf-8?B?aVNyWGxWcjJKbEZzZ1F4dDZwZFdIV3REWktSbkhRSCs3T3JHNXZ4YVNoeG13?=
 =?utf-8?B?MlZWc1pjaHo5RTNRY0kwc3FIRWwySkNmLzFwL09LZGQxdkQ3L3FkV0ZSZkkv?=
 =?utf-8?B?QXpUV0ZVT0trd0VIQTZKa2hqWW81L0JlYjgwS1dhZFNKakZDY3hKdFR5dWFH?=
 =?utf-8?B?eXU2amdVTW9vdWlyMVltamxpZnFWUmJRWjZtZ0RtNW00bFJqbExuS0dVclFX?=
 =?utf-8?B?OEdQQjlVWnBUSWdHMy8vaTVoc0pRWGhqdWwwQURRdFhqeURjcXlNV05tY2tB?=
 =?utf-8?B?eTkxdm45LzFmWTNYNC85NkhvV1B0ODlpL2czSlRzbzhIbDM2Njhxb1ZvRDYx?=
 =?utf-8?B?TlRFT1p4aUxtMjBPWjBHRE5XdXN3Rnd3QXVDZDNBbU9TMmt5L2pvc0RmV1d2?=
 =?utf-8?B?b3RSenBpcUZYcXVTNGdLb2dTZ3BWQnBtQ0M5R2twOENlVEpGaDBaa2lla3hp?=
 =?utf-8?Q?X0oML5yYwMhQwISpxOmP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f9b7dc-6dab-41d7-de08-08db04816a9c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 18:23:29.1983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtHZfSeXSvIsAvtLp5y8woQ5vnQFRI4EyOaB/Cnc9291Hr4vqSpcsy4oJbdcoC8dQSLkWm8Uug60bNSlIY6mJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010158
X-Proofpoint-ORIG-GUID: Rrl3KqA3ygYUt8_7yd4x0p8Z_wXnxpIR
X-Proofpoint-GUID: Rrl3KqA3ygYUt8_7yd4x0p8Z_wXnxpIR
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/01/2023 00:39, Ian Rogers wrote:
>>> Thanks John, will fix. Is there anything else?
>> Do you think that pmu-events/__pycache__/metric.cpython-36.pyc should be
>> deleted with a make clean? I would expect stuff like this to be deleted
>> (with a clean), but I am not sure if we have a policy on this (pyc files)
> Should they be covered by the existing clean target?
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/tools/perf/Makefile.perf?h=perf*core*n1102__;LyM!!ACWV5N9M2RV99hQ!IqhXlW8RwYRwSK4Gq_djcf1C7Zjp_q6OmUE8Kb6Cei9CvHFBoJWyMfT3IR8RHRS8iKkd7ZlvE4mvil-4Aos$  

Well it didn't seem to work for me and I was using acme tmp.perf/core 
branch.

Thanks,
John
