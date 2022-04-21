Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6450A43C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 17:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkhMJ6sLnz3bc1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 01:30:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=j9v/fq0+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KiSnf0w5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkhLT5Tvyz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 01:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=j9v/fq0+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=KiSnf0w5; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KkhLT0M2qz4x7V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 01:30:09 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KkhLT0D6lz4xLS; Fri, 22 Apr 2022 01:30:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=j9v/fq0+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=KiSnf0w5; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KkhLS3mgLz4x7V
 for <linuxppc-dev@ozlabs.org>; Fri, 22 Apr 2022 01:30:08 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LFSRps020622; 
 Thu, 21 Apr 2022 15:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4UWVpE4j/cKIhYUZ8a/6pIvbF0lTE2/z1Z1ro4TaZGk=;
 b=j9v/fq0+sIK3MC97bfdSXwrlVDohTozTs7PVgym3KuYT79elLKAOqD/swZAKM4FmLFWH
 raXLnqMAnlRQqoV4XTSkGGvlQnIJt4Hv5e8udiOFpk0JvCKKEK8uYJP4umz+Iz9sub2x
 KK9NV/jR2mDNZuOm8XegjWBI5sYOZg+KIpZ04pAWZSvIBmS+BduLBk3gzyZuk960wZCN
 uZD1Dialx2/EgUP8cQQ/8GBe5C8RWPvilqnmcg8dcX3IFbM+biq8qEhfzIJsYY28KyTs
 G7m79M+lcyNK444XOFenJO9jbF1NtDd+M8ddUk0eydGRiQeZzB6Ynd2P8Ts+ZYID/kwH Qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1cf4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 15:29:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23LFFrBJ015885; Thu, 21 Apr 2022 15:29:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8bpt8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 15:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAFDd2ZCBpS6MB/eb5AqseCC0MxM2UnlEvDNOCWmIxhwt3dB10nLBuW5bJYhLB8HaynPZ8qd9T6j82RP2f/EofuY8YTnBHj+7KaetlmWoSS9b89Y9+QlLJXtPSBg5kJQ0zotgEA+92pWV1eZFHmQe8tB3kU/EIWof2g4VizOm62Ndz6UJ4vWABHOg3RV8s4oYZa3HhrRRV7jZ/D8bZb2DaOXa069gwGHYNWMebc2LinXjz/gY2EXqFXWzgXlK8ZvmTUTG3EyZBQEF/mWDxJOR17jdo1GFgGqSoBZJm90zTVlxxh6nUBP2xY7rQcpTbeQ3dP9Q26s1L2wdX3zSza+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UWVpE4j/cKIhYUZ8a/6pIvbF0lTE2/z1Z1ro4TaZGk=;
 b=FH23Id11EKRMzsW17Xrdy1T5yypmvX0vKWC3G0lCspq9vPmvHytcbJRYox25zZmFIo56FC3/dHZuEeGsFNonhU1migIGzCQuECURStZM49gFDBVw8RtPEqNA6wJkjTiXyqZv9p9BxX53jsA9XBfhF6ChIuwLmYTcod9pr7dBrzkizliZH8olgG+/+BWQCxTznTOykUhxtpcwsHKDfm6Xt653pJtxagSg/9KFSk8Ivpv4J0YSQ3TmcjLvGRQSSZp8vzzys1qDltY6GWawacdXNmtaPQBpOlm9QLwW4DLOXpQevHVBdq21DS+tQ4hX6rkmxAzMaowiGWSGbmCdPur4WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UWVpE4j/cKIhYUZ8a/6pIvbF0lTE2/z1Z1ro4TaZGk=;
 b=KiSnf0w549AZfWJpGawRHPIUuBsjTK+xeNfkgdkYO1m7LWoOdi2AHOfDgDL2lr9g2/C+ZsST63oUMEq1heTSyRAkEqABOt3GHHZi1lYMj59cPsld1UKI6OUf0RIglD3HX9Ezj42hVhiDwjZwymdQEqDEJHyUdUsGoVhLNK7exGQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR10MB1657.namprd10.prod.outlook.com (2603:10b6:4:5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Thu, 21 Apr 2022 15:29:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::c11a:5b2b:9659:7c42]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::c11a:5b2b:9659:7c42%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 15:29:47 +0000
Message-ID: <35ccca7c-07c2-1fc4-70da-2cc581ba818a@oracle.com>
Date: Thu, 21 Apr 2022 10:29:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-3-sourabhjain@linux.ibm.com>
 <874k2mfz5t.fsf@mpe.ellerman.id.au>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <874k2mfz5t.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fe4ee77-6a8b-472e-c3c0-08da23abc479
X-MS-TrafficTypeDiagnostic: DM5PR10MB1657:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1657F0B9A3D6264EEE9472A297F49@DM5PR10MB1657.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxU5mXLL3R5AgCzQMxlvLFQMTefnCrg4wq2T++Ih446cRpSOHyW6krrr20d7nq+5J85W+L3X+7xxVP7nUZVjJWog3ihsX0KlVCuOhnDWbG5KRn+J9bYQzL1QldwkJNamZebDY/sfukTRUO7Qf1lu17cnHJs2SNFPrnjO62fW9br2mr4fw4nNXfOV9cuOiutGAfcbqLL42Lzf9U3ANWESqd3k8wcPSjiv+/PEbnl8R31Sr3mU4K1LRvf1LCNhAkwhbI40zFTdWdaiDzzK36bNaSdwtFEt3KCmresFg4lDXEqY5fE/0/i0VD6tyi/hhxdC2zRh6SgXdvfwK8XuVnfsmtAO3GgJaJb+KORNYX4Nqz0Ey/mJgKlf3rjD249kJQsl6GSZtCxGjpmZNa54Oh0esmDVA59TLuTwYKLFpimCf2U/bePSbnnlTgWDyNICS+bo52op9gisjXjYXu+F3Y5vqB6QAhjFsC3pVedv/mZuZM3h/nj9jEWOIJVWPdoySh2n/sbbH6TKBBW1BCvygn54cEpVfwqfUT/I0UcIAk+odN3QjgyBPv4b5+KK3YxB0hKZL+jxMsyxhiEUijPc0qcIUPYkYtnj8J0smx4Aah5jWCEP3N8g6D6PzdLKmtpbcAGiuwrDqXZBq2tsGKyicojXtJiqENjeJBspPIMJIBxT5RU8Ja0eALNC4EtnhimVqamM4MWD2qKejh+RHDWx1X96+AEdbz8YzXzIjSAh7AzdcPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(110136005)(31696002)(66556008)(66476007)(66946007)(8676002)(186003)(4326008)(316002)(38100700002)(5660300002)(6666004)(8936002)(31686004)(6512007)(2616005)(83380400001)(6486002)(53546011)(508600001)(6506007)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9KVDZEaEUxeDNWK3ZKU0srenVIbGVnUEdPZzI5ZjlyQlZJckZGYlkycTVw?=
 =?utf-8?B?R1o3QklYN2NtK2VNZTFRalZQZTRISE92VFM5emFuMzIyMWJBRk1FRUcxMENh?=
 =?utf-8?B?NHFCeWRwYUk1TGxYZCtTNHI4bkczZDlNbk9wMWk2ZHVLZzdPTEM5d3pzRzR1?=
 =?utf-8?B?b2Y0VVpYK0tGcHMwaUh1Q2NQL3dnSW5vcVl1TkdqZ2gzZzFGTHRMdngrWVhU?=
 =?utf-8?B?UGRoa0VkTnloRzNFTVFoSk5sTEQwUzU5TWtNVmVMRHlsbm4wODFveURyUVFx?=
 =?utf-8?B?QkdVVHZBZHd0NUhsMnlzM05tUEVZaXQ0UFRoUlhhMXhqVS9xTTJldVU5ejQ0?=
 =?utf-8?B?Z1lleEs1TXh5SkphWU0wME9ncTRoZjQxZjRCdVF2d2xWMk9yaWtyN1NPWGRO?=
 =?utf-8?B?QmphSkFJZmFZN2JBbnFkV1lmQzJrb2l3Z0kvWGlOLy9Fd1JVZUc2NEVnMzF4?=
 =?utf-8?B?azFmYUxTNGZoazdoN09nZjNLdXUycCt1SGhMdXp1QkFXMUVmc1lubzdBTlpU?=
 =?utf-8?B?bmhMQ1diS3lBaWJTNGNpT0xXSEFIaUpnaEwyV21DMzUxV2tWSG8vWXk4aFND?=
 =?utf-8?B?bFhOTFJkbysvM3VTSUI2U1RLbWdRbkp3SGtvc2k3QXpZaVVBQitRTTJ5djVC?=
 =?utf-8?B?S1pvVWRhZXM5NFU3TlcvNjVXS1M1OGVqeFdkbUJiZy84SUhndEpObnVjZ3Ra?=
 =?utf-8?B?dWMwbW94MnBINnlPOXNCSWdPT1Q2Z0RudjhyaXQzbDBjdG8ybzNLbjFWRDhl?=
 =?utf-8?B?SlRwTm5PU2Q3ZHd6QmJLMVhIR2xmVjJkOWpsMEdjbnR5ajdodFJwRW9TSlZX?=
 =?utf-8?B?SVVNa2k4b2hpSkhmcXRldFJGbjJrOXFGSWRyMzV6eW1LZUZNamdyQWxld0Zu?=
 =?utf-8?B?QlNnL1JFTCt0VmV6OVZJRmpKVngrSXkzQTFvdjMrYU5GT2ZnR2NrY1B2Zjkr?=
 =?utf-8?B?L1dZeGFlWGRXSVpaQVNUdzAyUFgrRFZBdXorRUdHcmlUTzIvcWhGaDZneGtV?=
 =?utf-8?B?OTJjbC9sWTFSUmFrdzNYcVFmelNZaEhUYThOU0o0aGI3YjJ3bG1ERVNCU2JB?=
 =?utf-8?B?Nzl5QU03WHFCQ25SaU8xV1g5ZVlST0prN2hFcU53Nm04YjBnNkMzSEJUZUdP?=
 =?utf-8?B?L2JOSGZuZkh0ZWhXazF3d1ZzdXZERHBReDRhVmxLVDFDMVVSOTNUdE5qK0pT?=
 =?utf-8?B?L1U5Z2pEdEhHSzBNamo0KzhaMzhtWUY2d3Q0VzN1L21oMG1jTVkxR2dEeXRL?=
 =?utf-8?B?TG9nZWFOU0ZkbjhROGovb2RsMi9Ea0VOWDdjblhhL3pCeHI3WWVRMktlNW9Q?=
 =?utf-8?B?aExvTjByL0J4K00rMG1lNTA1QTdyeVZkY2dIQVVKR1ROQjZXV1YwNXFqR0Ix?=
 =?utf-8?B?YnJRZnpNN08xNWxIRmcrVjRoYURPZkZvdDVKWmJzZnY4S1FLSWZQZ1RkNnNs?=
 =?utf-8?B?NnlUK1l5VW5kNURFdXRrMm1kaHFTUmNoZ3k3NkF0NHFBTGlUd3c3MVJaOFVP?=
 =?utf-8?B?MmRBbVNqOC9odTJqdzVUakJBcUhQeCt1aUgzWFRYYS8vQnJIMWdpRmdzZmFs?=
 =?utf-8?B?cy9mbnQxUjhaaXNONThqUi92UXhIMnJtdkJrSG9mOFY5aU9nY1dSb1gzVTlj?=
 =?utf-8?B?UWVEOUhUdUFzS3RmRHhCbEFMRUNTWlNXRlpmTisyOGRzaDNyRFlsOXlzQUNm?=
 =?utf-8?B?VEpJUHlFbEVuR3NJS0ZCMFp1eWI1VE9VQmZycDYzbHMrZGdBOGcxazBmbFZZ?=
 =?utf-8?B?ZEtRL3JnRUIxc2FHVzZEZFJhTzU5SlhFbFRJQkxWT1hWUmRwcTIxb3NPNzdY?=
 =?utf-8?B?anc0RkIxd0NLZlpEYXowOXVHU3NQeFdqR2lCRGd4M0dsUFh2Y2VoV3VxZS9D?=
 =?utf-8?B?TUc4RmthbEFwdEFuTjR2K3FKSENZZ0R0REtJaTVvWHFXODZxWVpEV3poSDhx?=
 =?utf-8?B?YldONE5ZelhOOTN6S2RNcW95eDNiVUV3Z1VSODJ5ZkoreXpKeHhqbUlrRVVC?=
 =?utf-8?B?S3pWL2VzdHBQQStyd0VHSzJ4UGZWNHJtdmxRbEZEKzl6Y21jT0t4QmhSOEQ3?=
 =?utf-8?B?dDVtTUtFSDA3bjFrM2QzMjJLRFdZSGdXNHgzZGlBQUhWRHE1RVliTVA1dnFt?=
 =?utf-8?B?Z2VDNmtCQVRtemhzelAzZXdMYTNINkUzU09tQjl5RjhZam1Pbzl3RWNxdHFp?=
 =?utf-8?B?dzVGRHFXS1hWT1NrQmpsNTRDZnYza1hSNFNUQzg4YTQxTHdQU04rT3lDQmVz?=
 =?utf-8?B?cVN5UEN1YlJxZWM4bVJZNWU2VGJ6bHVjOTZKdVV1SmlxMklxNVhCRlFGSFls?=
 =?utf-8?B?WWx3NTlLOHd2dmVad3VOOVJnSkM3amJRTGMraTVMNHdrU0ljZnVBTXFPeWJn?=
 =?utf-8?Q?N3KVgOYifVK7SgigKhkAho5QynAGieCR7OKi0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe4ee77-6a8b-472e-c3c0-08da23abc479
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 15:29:47.2164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSMFK4s1Vo/c7vvU/Ss2grMpIX7yjCKUN+9F0JeinSO3iI3hhuKS9ohbbqaPqOPszebuSoAYsGseaI37bXZM17lGG9LrsfaHEJjOaerEHFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1657
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-21_02:2022-04-21,
 2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204210083
X-Proofpoint-ORIG-GUID: qTQ5593f0R-3xizGmuhLSKX0WR8MFzyY
X-Proofpoint-GUID: qTQ5593f0R-3xizGmuhLSKX0WR8MFzyY
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
Cc: ldufour@linux.ibm.com, kexec@lists.infradead.org, hbathini@linux.ibm.com,
 bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/21/22 06:34, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
>> hotplug events.
>>
>> All the updates needed on the capture kernel load path in the kernel for
>> both kexec_load and kexec_file_load system will be kept under this config.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   arch/powerpc/Kconfig | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index b779603978e1..777db33f75b5 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -623,6 +623,17 @@ config FA_DUMP
>>   	  If unsure, say "y". Only special kernels like petitboot may
>>   	  need to say "N" here.
>>   
>> +config CRASH_HOTPLUG
>> +	bool "kernel updates of crash kexec segments"
>> +	depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
>> +	help
>> +	  An efficient way to keep the capture kernel up-to-date with CPU
>> +	  hotplug events. On CPU hotplug event the kexec segments of capture
>> +	  kernel becomes stale and need to be updated with latest CPU data.
>> +	  In this method the kernel performs minimal update to only relevant
>> +	  kexec segments on CPU hotplug event, instead of triggering full
>> +	  capture kernel reload from userspace using udev rule.
> 
> Why would a user ever want to turn this off?
> 
> Seems to me we should just make it always behave this way, and not have
> a CONFIG option at all.

Sourabh,

Borislav Petkov also requested I remove the config option, which will be the
case in upcoming v8.

Where I was using CONFIG_CRASH_HOTPLUG, I've replaced it with the
CONFIG_HOTPLUG_CPU || CONFIG_MEMORY_HOTPLUG.

Eric

> 
> cheers
> 
