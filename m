Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B850A452
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 17:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkhRb09bpz3bdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 01:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=EuCqcIQZ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=EBY6rJJV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkhQk5Zn9z2ywF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 01:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=EuCqcIQZ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=EBY6rJJV; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KkhQk5MNWz4x7V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 01:33:50 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KkhQk5JH1z4xL5; Fri, 22 Apr 2022 01:33:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=EuCqcIQZ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=EBY6rJJV; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KkhQk28FGz4x7V
 for <linuxppc-dev@ozlabs.org>; Fri, 22 Apr 2022 01:33:50 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LFGLVk015013; 
 Thu, 21 Apr 2022 15:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=CASgJd6rbEXHhkRYiEwnOtF0EoxQ0vCdIRSlY3F2CMw=;
 b=EuCqcIQZbNh3mYQDQtW7+YNcC6cc+gPXrW1d/C/Rhw+t/aIeOFD2lGlnFacgABHuNzLi
 Rbq7O0Cnmr6Sgi7k0epa3gyzkPuFdKpKa2vW+k+7HR6GJBQru9QrLMHE1mYeTMXt8f2e
 PSWQ/54Nrq+O0w90K79DtO/uqMViiWU5T8EaQ6cbGU1eiJFxp5g4c8Y0C5K+qLAjTZKz
 /vLhNjrSzTQ8TdpfPlwERlWg/JHXBoFQWPNy9AtdztU0NRxP7e+TAlx+v6pZGVSHfgMO
 z4lQHKLrb56NEp2CTQyyPALyDCtjtn9ljCVljxl9RyIF+lDsIXV2DOBhiIzGamrKzQf+ dg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffndtmdfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 15:33:33 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23LFFqdo015824; Thu, 21 Apr 2022 15:33:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8bqehy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 15:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fclLozPAAigH2pzXfr/3g1wXdARRp3AEo8Fv5OEqeETT+eGQZldYxDim+V6ilVkREv3wPE1qjM1nmZKf21aiyzrw0ZpkZYx/MxBgOJqU2BPdFPum1IrcM8zy5GfMSc1kEwiWwCtLtqDYEgY/DIzPVuLeo92qhcY83YUujq5I0TTq7FluNSHp0mf5v8/x3keXjQduFBiED0ummtqf/LBqVzZ5c74FUcSvcS/iUIsyEvMwF9jouAKQANN32I68uVVSHi9wxSEy67Nlpc9OTs/lqfAksaFoyiyHhDM8dyKJmtruM8/DSIJhZnc/M8QGl0XQNgBM4U9aVe5HYOOI45c0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CASgJd6rbEXHhkRYiEwnOtF0EoxQ0vCdIRSlY3F2CMw=;
 b=IhzKyyn/2/sU55eiFZQ+eRt/5ioNkg+HH9JV8Kv4AkzipGCoZflfqQ54Egh9U3+RZ1zRWVmvjtQkxXobTvKItR424JS+XTDnz6R0ni/6YI0yHUb+bYZOstA6+oPL85t91jjLJtrdBBVNwPmDoweOHiBbuVqQUYMUnrJ2hswDRcybKttPbBqerqSx9CF3vqg/TdEc3NAxq+8C7XWyVdCODqS8xOaL/lpZsIrOIG50IK2g8UzwTwCsxTyqBuB4n+49M4MeS+kplclpVi0Fd6cTY7NQ4kkXOBRH0SO/5U5+0Af099r7vNVPdISffctQMLlOsTBssVEh/VERodQJxFCs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CASgJd6rbEXHhkRYiEwnOtF0EoxQ0vCdIRSlY3F2CMw=;
 b=EBY6rJJVdTTLf9bJtdtdS3FH35RdVk+9pKr2FZBmWpFaOTQb0F03G5ihh/L1ygiZgg9MtiuGpzsin0qpq7YYNkr++tAD3XWmp0W39amI6mJ7jGN5VIEiPEqIZfpNVGh8lcG4CVzeWj/kjq7J8IfaRiWHvcFT8nKgWg4AiNyCBsc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB4445.namprd10.prod.outlook.com (2603:10b6:a03:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 15:33:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::c11a:5b2b:9659:7c42]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::c11a:5b2b:9659:7c42%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 15:33:30 +0000
Message-ID: <632d016e-758c-aef1-c385-e7495349ef8a@oracle.com>
Date: Thu, 21 Apr 2022 10:33:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v4 PATCH 4/5] powerpc/crash hp: add crash hotplug support
 for kexec_file_load
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-5-sourabhjain@linux.ibm.com>
 <20a85683-a2bf-e6dc-8d34-cc0c88496928@linux.ibm.com>
 <8598c28c-4297-c3a0-b180-12f7e596f0e4@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <8598c28c-4297-c3a0-b180-12f7e596f0e4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0059.namprd05.prod.outlook.com
 (2603:10b6:803:41::36) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81c93619-f532-476b-87c4-08da23ac49aa
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4445:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4445324AEC779B7250E253A997F49@SJ0PR10MB4445.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CInuKSppKWDbY0OMqZy+g9aCUQoIZOqLf18vOtinwYjLY4Sad9JNzx4bMfXpPjuQP6qmhfWxkP4mio250FPHW5SwrlFdpdBS49LQlcDDjCD7gNLEHvvPx4wqnPtiyeiOT6qVDb/eOJV4BY0lTREWqFJkwiZGWnZJCLshKA172kkKJbNydDW2uZpX4tCKc5b7LIxiWkFBtEJyEBdF40y9TVu6WvQG9Pb+lNuuRxlqNiKzfA5ezb8sgFajgAh2c6Zz+RvgeqE0GPxp6j4r1ku1U2y8PlRximr5iE0HAbDsC/yrqyWXKXDQxDsVlRK24+yXegtZDZzdHG8c9RnBpPWL2RXq5QKNVvkBv2eBeGnqJJSldBVrbv7fZKU5CNeLhgV4+haIz9f+O/woCvKUWlMJ96ZpUeyFQ8ganRmSA8Z5kMlVjhSkWBunRySAGV/iDocbCOCGQoqCZuCD6/fHMocrayAYlAXL0Olk0d1MQQcgp7n/j6H11NLGzZH7v3TwHlt8NqIGTmq5yuMQCdhVpAUla7kaCr8Cu9mWx1aDddQ7vQ7H3bKWxuHwuHJCBotX4r9rXa/5Fq0AhslKa8epWZ2HtYlR9zSRV6oV0bn8q1qyex00bR7jpPmVpI1nW4G7/PPtbt2WP4JfgEySodcdaRODgwSiJj9ATCFL40KMhgTrI585lsvjKj/sE93ZckFYtlirTgcztJu9lMELdmprxP0Q5bNjUT+cOyD5234K5mv/GQA3nfvtsP6/quHq5VzqwqBH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(86362001)(31696002)(83380400001)(186003)(38100700002)(66946007)(4326008)(36756003)(316002)(110136005)(66476007)(66556008)(8676002)(31686004)(6512007)(53546011)(6486002)(6506007)(8936002)(508600001)(2906002)(6666004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlI1enhmcXFTZElaUXd1RUhLbnY2UlBQWFdRaU5OaVB4dlRhenBhV2Z6K1FK?=
 =?utf-8?B?dllPeGl0VG5SZUVTdzY2ZWZsSWU1QndBUENVeGorMlRvTjN0SlZiQmdNSzBV?=
 =?utf-8?B?T3JXOVJOOG4xbEZXYmgxU2Y2aldrWDlsN244bDh4enJoSHVTdmVCNVUyQTZJ?=
 =?utf-8?B?N1FvVUEvVnRhZzhKSS92N2FmbFpwdHhPZkJpZWZ6NXJwNmx4amxIS3pVZ0p3?=
 =?utf-8?B?cC8raDhUYlJORjBtZ2NyRmcvTHhSYzNEY0FwcFl5bktKMFArZ3M4allmV1lF?=
 =?utf-8?B?dTkxU3RmeFpZTnFwZmlnd2xrUlkzUld2alg2VnFQUldlSTVRZ0UyNUs3SFpL?=
 =?utf-8?B?RHVYWjVlWFpnR09UbXFIRCtmSFpnSkloR3ZOM1d4SkFKZmZmdzFaMXl6d0Fp?=
 =?utf-8?B?R3lmRktUYTN6aG1kVWZxSUZMQ3BzVWZUOFVydHh3Q293S2tQWWRkRmJjR0Js?=
 =?utf-8?B?a0xCWWUzSWNLQndqOUREa04vZVVNeG5aREhVZ2ZmT254cXhuclVjaXJpUTY5?=
 =?utf-8?B?V1FERWdhSXdxNnV5bW1qNENWK0FRYndVOW1uU1ZydEFUS1RUZDZ6TWdjaW9M?=
 =?utf-8?B?YUZKL2FnSVpVbmdqWU5HVlluU2t2b3JhT2tFaTVHcm9MeGdPVVFSVnZnYVZx?=
 =?utf-8?B?V0kyV3hjYm9pWVpFOS91bnpOai9PWm5oMytqQlp4eFpIcURBMklDUmp2Z0Jy?=
 =?utf-8?B?K0pDTWswNHhrZmpscENMT25JRTNyTGsrT1l0WllPVVNuRVpXR1g1TS80VXlr?=
 =?utf-8?B?ZHlPNjN0STNLWklIMk51L2FYY2NUY0w2anRNSGNXZ2FLL01NbStFdEZLR0tZ?=
 =?utf-8?B?bWtOc3NiWkRNSWRJSmdCTHlZVTZGeDlyc0hFY054UURYVzFiUlV2M0t1V0VD?=
 =?utf-8?B?enpkdUxBSndyMk1yM2tzQ2wyU3VFQnhrTTZNWFBSVi80cDlVUWk4eDArN0pZ?=
 =?utf-8?B?Y1hNa1BrWWlNSXkrSG1VZjBOQ2dUMjdFL29GcSszNG9RRHYxMUJ5MlZydkRm?=
 =?utf-8?B?S2E2OHhNMXlvVHJBUzZCT09sRnp5T0c5V1pTQ2NYWnRPMVhwL3ZQWi9oWHZr?=
 =?utf-8?B?RkJ4eHA1K1ZqVHUxZDRmTmVhVVNONFpXQlBRaGt4bVpWck1VYlE5VEhRSmli?=
 =?utf-8?B?VkpoMW9LOHNMZDd3WWo1ZFVPYVBRd1NyNndOZFhML2VZaE00UUZpSXpGQUsv?=
 =?utf-8?B?THJoeUdMUHRRaW55NXM5MDJ2cnpzRXhKMmtGM1FmTno5dmVlY3Y4ZTFrZWlH?=
 =?utf-8?B?L1JVOFZuc2xtbm9TNW1JWEN0eStmSGJrNWlKLzhaLzRiakd4NGFtdTdsbHZM?=
 =?utf-8?B?WlZGTXlBbnNZYVdPeGluUjZETDNZWmdxblNOVFd4Y0tySU1YTjF2dU12MFlC?=
 =?utf-8?B?Q2x1RWxQUWVNQndsalFrOWN0QkVPN2xrMXliQ3VxSnpwN2dGcDIxNTQ1NEdM?=
 =?utf-8?B?WWg0RTY2QlFseld5N25KWXZhWEVFTVg1aGhxRlVscmNTNU1TdW90WmtNdDlE?=
 =?utf-8?B?QWNGaHN5UFJZK01hRmZDNExyT3VmbXU4Wkp0S0xTTGlSdU9oM3QzY0N5SDJ1?=
 =?utf-8?B?VUoxVTBzZWNnekFodjhZaiszUjJlZ2JLRy85enE3NzRuUTVTWHltNXdWU0tM?=
 =?utf-8?B?NFFqdE12aWRoTXBxMGEyd3FlTDFiQzlNUTZSNWFmUStvM2RpOEtTVkQrQnJR?=
 =?utf-8?B?MmdUZkFYOUo0UXI2V3Z2VGdNM0R1Y2FId21BQ0VIckV6dWMxclA5dDJ0azV5?=
 =?utf-8?B?VFdNMGVDNUF0R29WOXNKZHZNU1UvbU1kTWdpK3YrbnBPMHVMNU9aempndHdF?=
 =?utf-8?B?Q1pvS2dOVDdXdEl0NnRFTTBQSHh6Z1JmQS9PRldHYkFzbk5BbTljTExuWi8r?=
 =?utf-8?B?RXhBK2g3eTZBeFE5YUxTQ0VMaURXaVJtcCtKVUNRNm9odTFId2g0UFUvYVg4?=
 =?utf-8?B?cnM1YURsVnZlRjcvRzliaVVFb0tETzliakVLY1J0ZkkrQktQWnFZNTc4S1Y1?=
 =?utf-8?B?RStaWXNMOGF0NEF4Z3VjUlJwa08vSXFXbUQzM2dydm81YzN2c3V4SHo0RERX?=
 =?utf-8?B?aURRWW01SW9JaTAyK0tPM0k0MjZhdDRGMXdJZWs0SG9mcHlIY29VbTlTa2FW?=
 =?utf-8?B?ZjRSd2U2d0ZEem84Tks4OC9GNVFRTkJ1S1hSNldRR2hJcUJwNWNFYkNuNUkw?=
 =?utf-8?B?YlFncVRaN2JXenlzTHkwM0JISzB2R0hhV1h3R2V6VmRkRkwra2xKU1JsNFhu?=
 =?utf-8?B?YUZtRk9YZWN6VUtnQWdURHhOSW9Fa243TXJjdjYxWm1teXJraHZ5Wm9VeEc0?=
 =?utf-8?B?dFY2c1poVlQxZjhlQnJEenVpUGNMeGpEbDhsNnphRDZsY0FDT3F2WFZraHVp?=
 =?utf-8?Q?LxttPwc4IiQaoQhhPNQ/OKehQISB+2nqRCWC7Bu8mTnvf?=
X-MS-Exchange-AntiSpam-MessageData-1: wUiu9Wj2G4Wpzg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c93619-f532-476b-87c4-08da23ac49aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 15:33:30.5012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRAiBqb0vV+BBVAtrmtOBdMnUxMiHMDfpEpheHUVWFgmNnL6L6cqhHhHdL4Dps/inAbDVJagUVsFrksOShCZcm1vgKpvLQ/3OpwzSOSH4jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4445
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-21_02:2022-04-21,
 2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204210083
X-Proofpoint-ORIG-GUID: jXjbdeO80YY-onwT9HLlKcuvwjJ6UDn2
X-Proofpoint-GUID: jXjbdeO80YY-onwT9HLlKcuvwjJ6UDn2
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org,
 hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/19/22 03:31, Sourabh Jain wrote:
> 
> On 14/04/22 22:02, Laurent Dufour wrote:
>> On 11/04/2022, 10:43:56, Sourabh Jain wrote:
>>> Two major changes are done to enable the crash CPU hotplug handler.
>>> Firstly, updated the kexec load path to prepare kimage for hotplug
>>> changes, and secondly, implemented the crash hotplug handler.
>>>
>>> On the kexec load path, the memsz allocation of the crash FDT segment
>>> is updated to ensure that it has sufficient buffer space to accommodate
>>> future hot add CPUs. Initialized the kimage members to track the kexec
>>> FDT segment.
>>>
>>> The crash hotplug handler updates the cpus node of crash FDT. While we
>>> update crash FDT the kexec_crash_image is marked invalid and restored
>>> after FDT update to avoid race.
>>>
>>> Since memory crash hotplug support is not there yet the crash hotplug
>>> the handler simply warns the user and returns.
>>>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>   arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++
>>>   arch/powerpc/kexec/elf_64.c  | 74 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 120 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>>> index 249d2632526d..62f77cc86407 100644
>>> --- a/arch/powerpc/kexec/core_64.c
>>> +++ b/arch/powerpc/kexec/core_64.c
>>> @@ -466,6 +466,52 @@ int update_cpus_node(void *fdt)
>>>       return ret;
>>>   }
>>> +#ifdef CONFIG_CRASH_HOTPLUG
>>> +/**
>>> + * arch_crash_hotplug_handler() - Handle hotplug FDT changes
>>> + * @image: the active struct kimage
>>> + * @hp_action: the hot un/plug action being handled
>>> + * @a: first parameter dependent upon hp_action
>>> + * @b: first parameter dependent upon hp_action
>>> + *
>>> + * To accurately reflect CPU hot un/plug changes, the FDT
>>> + * must be updated with the new list of CPUs and memories.
>>> + */
>>> +void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
>>> +                unsigned long a, unsigned long b)
>>> +{
>>> +    void *fdt;
>>> +
>>> +    /* No action needed for CPU hot-unplug */
>>> +    if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
>>> +        return;
>> I should have report since in the previous version too, why nothing is done
>> when CPU are removed?
> 
> Since CPU note addresses are already available for all possible CPUs
> (regardless they are online or not) the PHDR is allocated for all possible
> CPUs during elfcorehdr creation. At least for the kexec_load system call.
> 
> Now on the crash path, the crashing CPU initiates an IPI call to update
> the CPU data of all online CPUs and jumps to the purgatory. Hence no
> action is needed for the remove case.
> 
> With the above logic, we shouldn't be taking any action for the CPU add
> case too, right? But on PowerPC early boot path there is validation that
> checks the boot CPU is part of the  Flattened Device Tree (FDT) or not.
> If the boot CPU is not found in FDT the boot fails. Hence FDT needs to be
> updated for every new CPU added to the system but not needed when
> CPU is removed.
> 
> 
> Thanks
> Sourabh Jain
> 
>>
>>> +
>>> +    /* crash update on memory hotplug is not support yet */
>>> +    if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
>>> +        pr_info_once("crash hp: crash update is not supported with memory hotplug\n");
>>> +        return;
>>> +    }

Sourabh,

Baoquan's preference is to do away with the hp_action (and a and b) parameters to
this function. As x86_64 has no need for them, I have no reason to argue for keeping
them.

If you really need hp_action, then please respond to Baoquan's concern in the
"[PATCH v7 4/8] crash: add generic infrastructure for crash hotplug support"
thread.

Thanks,
eric


>>> +
>>> +    /* Must have valid FDT index */
>>> +    if (!image->arch.fdt_index_valid) {
>>> +        pr_err("crash hp: unable to locate FDT segment");
>>> +        return;
>>> +    }
>>> +
>>> +    fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
>>> +
>>> +    /* Temporarily invalidate the crash image while it is replaced */
>>> +    xchg(&kexec_crash_image, NULL);
>>> +
>>> +    /* update FDT to refelect changes to CPU resrouces */
>>> +    if (update_cpus_node(fdt))
>>> +        pr_err("crash hp: failed to update crash FDT");
>>> +
>>> +    /* The crash image is now valid once again */
>>> +    xchg(&kexec_crash_image, image);
>>> +}
>>> +#endif /* CONFIG_CRASH_HOTPLUG */
>>> +
>>>   #ifdef CONFIG_PPC_64S_HASH_MMU
>>>   /* Values we need to export to the second kernel via the device tree. */
>>>   static unsigned long htab_base;
>>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>> index eeb258002d1e..9dc774548ce4 100644
>>> --- a/arch/powerpc/kexec/elf_64.c
>>> +++ b/arch/powerpc/kexec/elf_64.c
>>> @@ -24,6 +24,67 @@
>>>   #include <linux/slab.h>
>>>   #include <linux/types.h>
>>> +#include <asm/kvm_book3s.h>
>>> +#include <asm/kvm_ppc.h>
>>> +
>>> +#ifdef CONFIG_CRASH_HOTPLUG
>>> +
>>> +/**
>>> + * get_cpu_node_sz() - Calculate the space needed to store a CPU device type node
>>> + *                     in FDT. The calculation is done based on the existing CPU
>>> + *                     node in unflatten device tree. Loop through all the
>>> + *                     properties of the very first CPU type device node found in
>>> + *                     unflatten device tree and returns the sum of the property
>>> + *                     length and property string size of all properties of a CPU
>>> + *                     node.
>>> + */
>> I don't think this is following the indent rules.
>>
>>> +static int get_cpu_node_sz(void) {
>>> +    struct device_node *dn = NULL;
>>> +    struct property *pp;
>>> +    int cpu_node_size = 0;
>>> +
>>> +    dn = of_find_node_by_type(NULL, "cpu");
>>> +
>>> +    if (!dn) {
>>> +        pr_warn("Unable to locate cpu device_type node.\n");
>>> +        goto out;
>>> +    }
>>> +
>>> +    /* Every node in FDT starts with FDT_BEGIN_NODE and ends with
>>> +     * FDT_END_NODE that takes one byte each.
>>> +     */
>>> +    cpu_node_size = 2;
>>> +
>>> +    for_each_property_of_node(dn, pp) {
>>> +        /* For each property add two bytes extra. One for string null
>>> +         * character for property name and other for FDT property start
>>> +         * tag FDT_PROP.
>>> +         */
>> Coding style request to start with a blank comment line for multiple
>> comment lines.
>>
>>> +        cpu_node_size = cpu_node_size + pp->length + strlen(pp->name) + 2;
>>> +    }
>>> +
>>> +out:
>>> +    return cpu_node_size;
>>> +}
>>> +
>>> +/**
>>> + * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
>>> + * @fdt: pointer to crash kernel FDT
>>> + *
>>> + * Calculate the buffer space needed to add more CPU nodes in crash FDT
>>> + * post capture kenrel load due to CPU hotplug events.
>>> + */
>>> +static unsigned int get_crash_fdt_mem_sz(void *fdt)
>>> +{
>>> +    int fdt_cpu_nodes_sz, offline_cpu_cnt;
>>> +
>>> +    offline_cpu_cnt = (num_possible_cpus() - num_present_cpus()) / MAX_SMT_THREADS;
>>> +    fdt_cpu_nodes_sz = get_cpu_node_sz() * offline_cpu_cnt;
>>> +
>>> +    return fdt_totalsize(fdt) + fdt_cpu_nodes_sz;
>>> +}
>>> +#endif
>>> +
>>>   static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>               unsigned long kernel_len, char *initrd,
>>>               unsigned long initrd_len, char *cmdline,
>>> @@ -123,6 +184,19 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>       kbuf.buf_align = PAGE_SIZE;
>>>       kbuf.top_down = true;
>>>       kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>> +
>>> +#ifdef CONFIG_CRASH_HOTPLUG
>>> +    if (image->type == KEXEC_TYPE_CRASH) {
>>> +        kbuf.memsz = get_crash_fdt_mem_sz(fdt);
>>> +        fdt_set_totalsize(fdt, kbuf.memsz);
>>> +        image->arch.fdt_index = image->nr_segments;
>>> +        image->arch.fdt_index_valid = true;
>>> +    } else
>>> +#endif
>>> +    {
>>> +        kbuf.memsz = fdt_totalsize(fdt);
>>> +    }
>>> +
>>>       ret = kexec_add_buffer(&kbuf);
>>>       if (ret)
>>>           goto out_free_fdt;
