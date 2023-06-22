Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28373ADE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 02:37:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=W9dkRm9d;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vJtkU/XJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnJH50XK0z3bYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 10:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=W9dkRm9d;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vJtkU/XJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn7Hz1r2kz309t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 03:52:45 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MGG9DN004472;
	Thu, 22 Jun 2023 17:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=vbdqkt7apg2t3wGedNVvmQCrEBhQhFk69NNLzHeas+4=;
 b=W9dkRm9dbyz+ZMW/aeqErWBwfhf4ZWeH9ia5CQfRHX7iWEgNjKnIxdg5iS+3JMyX2lkz
 Pdqb02TdNV1Pryzl0g+m2R57LUBXMV1gh3Gp7CxE3gGavW4a5Zo4RzOhIcugT1EPX3lT
 UBtWBIneWcs6Jf0ekw3tHVQS4jwHLek35f9tfCJtwWgPzQ7aApb6jXCBf6gCjaZjOiSo
 QXSRgKUD+KEfEhHYtsXUmSiWcgpuw2ZeZScWnwy28vwmsBPepBIruGIWbnn8jS/7X+YG
 IWP17CCcNePagrnbB01/VD5MRQMQuVQ31fz/vs3f6cEDfSOqEZr7dUxRmGMQb8OJyekp kg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93e1jbwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 17:52:09 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35MHGxeO038630;
	Thu, 22 Jun 2023 17:52:08 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r9397wjfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 17:52:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCwoW5cABRRGRv1Opo8pXT4GOmUKxxRP+MBp360wvc2fMzaPvFodj76Fc4qiVDRJ0gjNm4fpho4N1s/rmIZglRtBI4+dOF3KtDd4sKAig18OyMnYuibRJijLsokVTnqbPc3/E59J5qQjUgZJC8u0+kgd4db3uOWTwUeAkN/DJ2rp3jUv6SThJfp6j6aPD2Ekhb9RyxOOKdi4rATZ1rPwynLPZtsxHrD9lt8HcD6w5F03i22s1hAkuoQ30ajq2BvjNhyNMJ/cEx34fXMPwhP33SAcgaMs0m+ldfEO/DbIB4mfzTcuQW0zD5iFk2pi1Yu3mySjhAxMLl4TqMHJCsgqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbdqkt7apg2t3wGedNVvmQCrEBhQhFk69NNLzHeas+4=;
 b=BHvl9X+3MC1E4ox1E9fn51qUuP8CbE0YUponAEQVamrhJZzJ801HZhrI8NPJfr6gorCfb2JWUizFo39XpTjgJ4uSyOSNz/5e6Ft8VM1kMZWsPh9atVvMrZ5Emsm+WHrkF2ftyPG//TZ2KKdbx7wnpjOtFjzsitSTFCvXUIoBGx1qu/TjpjV+JdRgEVqkmLJAw9xWpOryBH+aSU3oeh425vy0q1F5W9/23f395OlKkV4sdziylo8ID8uvm/OQU1JGN8b2TgsdEhMeDEnZxxt2tP8DmmLic2u4ims/GadhmMTBRR7BOvVjGFpo7zNztLBLqvQ+jjrOREkv9JiDwktlxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbdqkt7apg2t3wGedNVvmQCrEBhQhFk69NNLzHeas+4=;
 b=vJtkU/XJ0OJ8rHEftTHuPEwlJhYTNq1AMlvUaJSGKmSbhhCwgJ5mEPKsJhlgkz123DWbodsDeCqr1pjgKbg8pds+ncm4kiu3D1QecLIiz48oIfTQ0aS4cRzRMxoiTscGMEaLj9UhulYXIkaxxd42TwcN1Cj0GW30ljOR0MqurZc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CY5PR10MB6167.namprd10.prod.outlook.com (2603:10b6:930:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 17:52:04 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 17:52:03 +0000
Message-ID: <b6ea0dc3-313f-6aae-f3cb-26bb61daf1fa@oracle.com>
Date: Thu, 22 Jun 2023 12:51:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-13-eric.devolder@oracle.com>
 <ZJKD690QaX1IgiAz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <b89bb8d6-77db-76fe-e360-f6c439b80e73@oracle.com>
 <ZJR1o0lzhIUdpTb+@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZJR1o0lzhIUdpTb+@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CY5PR10MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 40879127-129f-4ac3-9118-08db73496325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	K3+vIp7ERrOPEEd/qGc/gVt/rel76E9Fn4NbmXiXNyFPaMme5eMY/rqe6DAD/Ps353VOrOWZOPtscuIQn0rj+FrmyZ/urQ6jkB/vHi42V1W1/lZoWylAn09KxNqSjh/Nabik0/b6SWlW0C/eq4g+Og7m4bNKXA0qBiXDrjPWrLuyFt2YiCI1vgljiIVZHnRSLV7j06trEFwDyOW9vEcDacRkjmQ3MMEz0XM+0xGPmmrcQkAFlbfg2tG59T8xBatlAJv5auP8rJwarwSCv1VIYSLEyMJBGAVQBeIPLzldH+Nz+BKh8JZ55fi/ikPdrGNhXiyTFOhaW2z00UMg4QkjwEAP9Zv04Jn7hUfQtU7Yh4hNqw1CWmCuU0oIKlUTre21LAxM+mL7nxy29av75Vym73UkwuudEqaqrEOpfh5INP1vR3UUqYmWGT0tB/+qIyV7WFNrFh/ltyZQ1piGlB3IfvITHyrihHUJRYBrZHxfczQpnF0v4KgbwaLi5pu+LI+H83xhh5IewfmbgcDXk/UyyFG1D2yFqC5TFWWsSudPjAcBHT1ZKbtOGxBnkhpX0idYvZVVAfo/6OJb0szh5F2ZahMzY26HcVOP10ehncEamHjP0bvU0+be1cvWZplJ4c3+fvwNf1LOEd0F2kgp8GiPgA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(5660300002)(36756003)(7406005)(7366002)(7416002)(8676002)(8936002)(38100700002)(2906002)(478600001)(186003)(6486002)(6666004)(31696002)(2616005)(86362001)(107886003)(31686004)(53546011)(26005)(6512007)(6506007)(66556008)(66946007)(66476007)(6916009)(83380400001)(316002)(41300700001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WnFQTHpuNHV2ZHRoSy8yZ0hTOU5NdStFakNGYnJkYm8zTFVJRi9zZGV5V1Fq?=
 =?utf-8?B?UlZKUjVVbEpscGlqNGllTW1GYzNjWWsraHB2bFJFSU1hbCtpRU04amEwaHNQ?=
 =?utf-8?B?ZU1DWkEzcFV2NytvUnZkUC92NW83SW9GVDlnMzVkSEdCbnQ4bkQxeDZtL2Fa?=
 =?utf-8?B?N2ZOL2lOYm1kdm5IMkJrMm44Mlk1bHk1cDVPajJuOW1rVDJ6dFhjNDhIdDdD?=
 =?utf-8?B?WXdCODNTLytBRHRnMnJMSVRUb3Fodkd6VXZmZTh6cUtFT1ZxLzdRNHdTeTdv?=
 =?utf-8?B?V2JnMkMzcTJ5cmp6OGR0V1NlODUyMVh5SVdVcUpTQnhkMkIvVnhDRnh6RHBU?=
 =?utf-8?B?U1Z5a01ESFlrcVljZXdjbkRzYXN1MW11RkdvaGMrRjlvdVJMakxsSUU5Zmdh?=
 =?utf-8?B?em9NV0tSYWdyTjVIS3lhUWlYZnN4QnUyTE5BTWx3TmZtNnRTMEw0ZWFWeUQ3?=
 =?utf-8?B?ZFFKdzZhWFh1aWM0MnIwb21LenNxTDZXbmIxNVdhWGdlUjFPRVFoWHNzY0lG?=
 =?utf-8?B?cVp5NmpiOVlVYUhRUkZFcHQ0VFFzc25hSzFqa1NIekVOaEtqT3ZGeDVLbWRs?=
 =?utf-8?B?d0cxenlRKzBhOWZncDBRaDIzQkVpWkp6TVlLUmplNVhZRytmWE0rYXFPcFRS?=
 =?utf-8?B?OXdjbllXV29aTlhSY1ZuR3JJb3hQOFNoSldQN2VHYkVrNEZHMGIwSVFZNWVj?=
 =?utf-8?B?U0VkVlp4L0xITlFTaVFVSVR5YzQxMTA0RTVhVm4wZWpLOGlrSll5bGkrdnJS?=
 =?utf-8?B?OFpaME45SnJvSm1PbDN5bFFVbUZaV1dFMkYxelRDaXNaUzY1WnJwWU5wa2t0?=
 =?utf-8?B?eUJZWkNjSVB0NFJjWTQvZTlaNVpwSGdVNW5TM1pQVGptOVhYcmNuZ1BSWDBI?=
 =?utf-8?B?UWdOckRpYnFxamRkK1B5QjdBVUNFUGhDNmpldFJ3dW4xSjlXelo2UllDM2lY?=
 =?utf-8?B?TWtvUlFjNHoyZlhpQ3VqRStFeHl5V3htVmh3NC8xc1hCVnZsRnRuNktvRkdS?=
 =?utf-8?B?VE9DdVpSMTluQkZMVjcyTXhtUjRZaHg1bVVIWnJzbTlNN0RlNEhsamJxSWlT?=
 =?utf-8?B?K0ZzTzFCZC9kK2IzcUhpM21VNEZ3RFZVeUJoQitERlVSbXU1NGs4eGN3QmVL?=
 =?utf-8?B?L2Vvb2NoMW1QS3p4WE5rZmNiS1Q5eVBRb1RQL2pZNVFZd0lCMmwzajNDOVgr?=
 =?utf-8?B?cWMyOGRsUDh3OGtPdUs0SXNSblFESUlsdVlZOW9Hdm8xa01WT1pLckZqbUk2?=
 =?utf-8?B?ZmJMWVQ3QnFVcHJnRGQzM3VyNFVnWk5PMDJpVGtYTjNVQ3lBZTB5eE1XVEZ3?=
 =?utf-8?B?Wk5ZOFFZcHBPSjJqSFFxZDZlOVpFOXo3a0RDT250dVlhWEEvbXp3YXhPMFlv?=
 =?utf-8?B?Vjd4YWV2UUhwaGxucXAzWDZVRmp3cnFkRWUzcFFqb3VPUnNJUWhaZ3RNbUkz?=
 =?utf-8?B?ZStCRmlIMXZ0THZQU1EyUm9mczBQSXNSclIzM2NTMnRFdVh3azZEWUZ6L0xO?=
 =?utf-8?B?eTJUa1piUmExK3I5cEQzc3VxRFVUU1lMdzNYdWxMYUMxQ3VodmlTNE9nQ1Zo?=
 =?utf-8?B?d20vamduSW1Uc2xUNGVQQ1lQOFZFRUFQNGpZUTFSM0p3OVBKMnJvR3M3UThL?=
 =?utf-8?B?UDVNWEhzdXVyQUgyU3V6UFNlOUQ5elRKZUxsYW1zZXkxRVlFb29FcFpKK2gv?=
 =?utf-8?B?bnY5SmdlSlNoVldlUkJFbGJxRklzamdKVjhMQkF0dktnMHBDNmpLY005bCtQ?=
 =?utf-8?B?V1NYa2NLTDhvV1BRb1pLZnZtMktRa012Vi8zUFlkYnNGM1FpaFY4dWhJaTZr?=
 =?utf-8?B?R2JzUk8yd1VwR3FjV3lyaXF5ejkraGVlZkJDWTM0dHZYUWxVWmRqemdUcXBp?=
 =?utf-8?B?VE9UZmxzUjE1TTVVbUlmVjhhUloxREd6bXFuT3picXNWa3Myb2NLRFZoV0NS?=
 =?utf-8?B?K2gvWnozTDN0bTBkZXZYT0k1NHNPTUFtWXBtYWVjSmZLb1RTSTNKL1J4Ukt1?=
 =?utf-8?B?UzY3T2NZc001SHUraEhMdXpRejNkSDhhY3U2dGpFRjBOcXVQSUkyU251dFYw?=
 =?utf-8?B?TUNTc3ptTEc2akFBQzNtdnlnWnU1VUg3a3F5MlRWbThLdGthYzNqRUllN0h5?=
 =?utf-8?B?T2dJTmxETGFRSTZqZWhHa1FKbjVGRkRualExaFNmZVcwOUJjVXNjZ2JDTEFS?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Rjl3ajlkdWFQR1IxR2RMMjZiS0hCYllSWEwzZGQydjN5bS9PYmRpTVduWUhG?=
 =?utf-8?B?L1VROGsyd0tUREFFR3VRTDJTWW5GdE51NWhGS1hETmMwWUZzY2YxUXBsSFgr?=
 =?utf-8?B?QmZTeGpYY2VsVnJ6Wk84UEpjSDNQL0llMmZsNFRVOHd1OER6K1I3ZCtUZWpK?=
 =?utf-8?B?cmVneXg1K296cnJ5U3hMdHU0ZnRHdU1nZmpaT3NjeUYxQ1dkTDBEQnhnUEtI?=
 =?utf-8?B?R1dUbU02NGJqZ0dnMVVIZHVlSlhrL3dkdjlkTFh2dWRiYy92dHpicDRxQTRG?=
 =?utf-8?B?MHRCNEZiRlhwRWgvbmhaSkUxYWkrcXNoWWtYWjczaGl0ekN1ekhCdnZGMmdo?=
 =?utf-8?B?QzZ2S2s2TUJqZUEvd3ZFWFJIcTN5Wmp6SDRrNVZKZHVqRXZ6UTBhblhyT3Rm?=
 =?utf-8?B?WTRkRmgxZnRPRjhpQWhLSkRPaENRa25lTzEvVFY4UTUzZGErT2YwdjV6RDlZ?=
 =?utf-8?B?Ymt1TjZSWVdTMnRhUjZhK1BrdEtHMzY5cW5sR0Q0NjlpWkw2bklXZHZ1dU9B?=
 =?utf-8?B?SHI5NFlma0psYUFPeWVXQlZlQjNPWHp4aXlpUDJEc0FVWm5DejZUbDVDVUxx?=
 =?utf-8?B?eGxaOUFVZ0pyMnRYc3RJRCtVOHkzZ3dQZGdVZTlYOEZmOUNFMlZGam4vM3lO?=
 =?utf-8?B?STBna2luY3V1R01kd25mTGp5Sjc1MVhOWnFEempNTm5YSnV4Vm54L3I4RzlI?=
 =?utf-8?B?NzZjSHlmaUZlVnBXY0ltcE5wY1J4azBMV2dqdWVDYXg3MUFhTDJMemFkM3lx?=
 =?utf-8?B?NEpEcnNPRWlRb3JJaHJzdFJjRUFMM2RESlBTV2ZIc25LaDlLZ0x5SUV3QkU1?=
 =?utf-8?B?WXV4Vi9LMk5BQ0grSzRlR2o1L3VwTnoyajh2ZEg2MEVURlRZR0FNeGdYTmk4?=
 =?utf-8?B?L0ZlTGdUK1ZEVUtiR204QmZYRkZlMVNoRUlXY04yR0EzSGpXMThlanRrb0pQ?=
 =?utf-8?B?NFlKbDl6Y2dVSjJEZERqS3BkbjBjWVlVQ3hMUGZmSXZGWUVsSmY4ejVmQzk5?=
 =?utf-8?B?a1F3RHU5NHQza0Y2Sk1kOHM5WUN3cCsxc2hzdEFvRHU1NHV4NkMxTjhrZXds?=
 =?utf-8?B?WE1YdEhJZEFueloyc1J0RXUrNXNuM0NablFjTlY0Q1VPQ29vSExRdnBOQ2NI?=
 =?utf-8?B?M1Q0LzA1dFFUWm1QSlFqaGltczhZMWw5S2dqY1JTQTQzUUpHUU5hUERENWZL?=
 =?utf-8?B?YUFHd2dWTjNxalR0THJQS2RkaXdxMG96QmhlZDVCZG04ZWpkQU9wUnFTMEJI?=
 =?utf-8?B?eXhXaXdOK3F2RHU0a25aWWdBeWQ0YnJLSTVuenkwTEkrL25XQ0lRN1JINVRK?=
 =?utf-8?B?bHZZTjN1THBBbE92U0k2Umsrb1ZrY29pN3ZnVCtFRmJkVHZiK3JaSjNjZnZo?=
 =?utf-8?B?bkJtNkxVek56TmRnTjhHeStBT290M0xtRHR1WVA5cWZTZ1U3L0JKUHZzQ1Fh?=
 =?utf-8?B?aGtMaFRrdkx3ejBLOXpxZUNRcGJXQUU3ZDVucXU4SCtrWjYvcGN2clc0dXAw?=
 =?utf-8?B?TG9lTGo3L2J1blVLUFBybHNHT0xuek56ekpScmE0RGw3MTFjRVJSaFZKSDV6?=
 =?utf-8?B?ck5kNXc2WjZ0OTlIN0ZJY3RqU2hZUDVVNW4wM0dCVVhYdEZwVldNTjFiVDl4?=
 =?utf-8?B?K29TeldRc0dKOGdEalNXSkhzYXROWExzTHNwVUxlMWhSZkNPbFRZQkMwV25K?=
 =?utf-8?B?NWJ0dzdmaExxR1NZNmFaOTc5UjVROFk5Q0JPOElNb1FMZjYrUkpSMHRTQjZx?=
 =?utf-8?B?clM0dnVHTHlHejR5VndRR3pWNkxoRGRydWlsd2VPSFZRTW1qUGwwWUZ0V2Ex?=
 =?utf-8?B?OEdDZ2VrQ1pvV3lINzVPVWgySTdqT2tlckNzWERoemF3N0ttd3lDeVVMT3Ja?=
 =?utf-8?B?UldOekw1T2FNVnVIcGpnRmpmZ3hGdmhGS1ZTTWs0SnhMaTNaS3A2MUZIelpG?=
 =?utf-8?B?TmFtNzJoNE1BWDhYVDYrWGx2QjlGb1hZTWMvTEFMVmIwN1hUNzNER3FQTVBm?=
 =?utf-8?B?bWZRd05TSDVhYzFxQ3FESTRNdlA0NGdINUw2bmphbllZZUs3amJMekR2NStU?=
 =?utf-8?B?ZVNFaG1hbGRUaVJBcUY4VjUrTFBCQldpdzVSQ2JSTjV6bU9OYklRdHF3TDhs?=
 =?utf-8?B?NmhFUTE1ZkFHeFAxTDhiS0pSTGs4LzUwdm1sKzFwZCtUZzAxcXlXT3JNVFVn?=
 =?utf-8?B?eG11YXVJVSt4RFIycVI1S0RycFJQMnV6YTk3UFREbHlSWWx6YURUeldZYjFZ?=
 =?utf-8?B?TnBuSWRZOEdxU0pRS2ovR3RjRkNjcFF2SFVTZUg3Qk5tKzhkR29vMFJyQVQ4?=
 =?utf-8?B?S2hVZzJkTXZWZ05rTkU3QVV3ZkF2UkR6N2U2Sk93MWZiZGwzYmlRVjEvak4v?=
 =?utf-8?Q?CLd3YRDJGQfzAM0ErF1L3lHH5oOjLfKXISdsX/8Dy+uWD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	KA56LK22jbcWtfd4VPQrbAq3F1U8kCQ7ib8IS+QlgtP1vPmVwwlfHNnd7Gkm9M5rw26To/rDqEx920Yi/jmGSxoZLAfvra5MjXqB9SXcIYLiRK17p8sFYW953oD5rCoJ4ZQediVMpHK23aCeOhd715saSNSQdHs06mItWT3AYBePjlRgjRL3YMBcX1GIlv2ihne6rFK7pfsYAmavfx/c2Ib0FCg1BeUYOmsDg+htUcg1mfIwhtAOfBNIgPUeiSIBlEn95zApqj3DNupyb3aI+4GKIeuEE2mu7+7c3NQqFOQ5YoEuUQEGLqoaBcKSHLffT7HHNzGS/Y+jAoquO5B+q6OJKmuFmQ4r00jqJHddjA2E/pbRL7ilfXgx6UeSl4WcXqJdVlIP1frv4OJpTjj6ghd/JOSq3cLHnI7RpWHxHC4gqhzzjRfZkI/NT8ukEql8zXsvSUlxLV/XVQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40879127-129f-4ac3-9118-08db73496325
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 17:52:03.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rzd4T3E/3SGF2XsOQxne8JzPnl1YoisbA936thDXcLAUbkXCIotA1BYkppv7z4CtwlkTmIfSwCLAy1GJZoAEsL8jTOe22D6ytVx5zYwRsxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_13,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220151
X-Proofpoint-GUID: qKamud_x_C6Qmmj2hsjNz9ttrCKCYNxO
X-Proofpoint-ORIG-GUID: qKamud_x_C6Qmmj2hsjNz9ttrCKCYNxO
X-Mailman-Approved-At: Fri, 23 Jun 2023 10:35:05 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.co
 m, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/22/23 11:24, Alexander Gordeev wrote:
> On Wed, Jun 21, 2023 at 12:10:49PM -0500, Eric DeVolder wrote:
> Hi Eric,
> ...
>>>> NOTE: The original Kconfig has a KEXEC_SIG which depends on
>>>> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
>>>> dependency (using the strategy outlined in this series, and other
>>>> techniques) results in 'error: recursive dependency detected'
>>>> on CRYPTO. This occurs due to any path through KEXEC_SIG
>>>> attempting to select CRYPTO is ultimately dependent upon CRYPTO:
>>>>
>>>>    CRYPTO
>>>>     <- ARCH_SUPPORTS_KEXEC_FILE
>>>>        <- KEXEC_FILE
>>>>           <- KEXEC_SIG
>>>>
>>>> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
>>>> for KEXEC_SIG. In practice, however, MODULE_SIG_FORMAT is still
>>>> configured-in as the use of KEXEC_SIG is in step with the use of
>>>> SYSTEM_DATA_VERIFICATION, which does select MODULE_SIG_FORMAT.
>>>
>>> No, it is actually the other way around.
>>> Could you please provide the correct explanation?
>>>
>>> AFAICT the MODULE_SIG_FORMAT dependency was introduced with commit
>>> c8424e776b09 ("MODSIGN: Export module signature definitions") and
>>> in fact was not necessary, since s390 did/does not use mod_check_sig()
>>> anyway. So the SYSTEM_DATA_VERIFICATION could have left intact.
>>
>> Thomas, would the correct explanation be simply indicating that
>> MODULE_SIG_FORMAT isn't needed as it is not used by s390 (crediting your
>> summary above)?
> 
> I guess, you asked me? Anyway, I will try to answer as if I were Thomas :)
> 
> MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION.
> But SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so
> dropping MODULE_SIG_FORMAT does not hurt.
> 
> Thanks!

For the commit message for this s390/Kconfig change, are you ok
with the following?
eric

=====
The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

NOTE: The original Kconfig has a KEXEC_SIG which depends on
MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
dependency (using the strategy outlined in this series, and other
techniques) results in 'error: recursive dependency detected'
on CRYPTO.

Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
dependency was introduced with c8424e776b09 ("MODSIGN: Export module
signature definitions") and in fact was not necessary, since s390
did/does not use mod_check_sig() anyway. MODULE_SIG_FORMAT is needed
to select SYSTEM_DATA_VERIFICATION. But SYSTEM_DATA_VERIFICATION is
also selected by FS_VERITY*, so dropping MODULE_SIG_FORMAT does not
hurt."

Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
from KEXEC_SIG.


