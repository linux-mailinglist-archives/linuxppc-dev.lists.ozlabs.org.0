Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9866B7C5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 16:48:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1Jj1svKz3bjY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 02:48:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mPxVPe1d;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DOT5Putm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1Hl0KzZz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 02:47:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mPxVPe1d;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DOT5Putm;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Pb1Hk6sdmz4x4r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 02:47:14 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Pb1Hk6pG3z4x5Q; Tue, 14 Mar 2023 02:47:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mPxVPe1d;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DOT5Putm;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Pb1Hk4XXSz4x4r
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 02:47:14 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DCSJTQ027922;
	Mon, 13 Mar 2023 15:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=TBXssBL/WTfMQ7bhpOmU74VfCv31VyJBTkrlH4CuUxk=;
 b=mPxVPe1d2choLRjpH0zta76xGTdLgBK2EL4i0qHSKQO+gfsIrutR+uIIDZunPTZCTvSi
 oUj3NKHWpeJT8cxFuXfyz6iTrMQTiEiUMPGhFd3Tck6Kf2mim8Svwwpdrr1YVy0aMq55
 4I9d6NuWlb07RbAHXCUkbtIweaJvfdR2Mm+Xkit7Kg0mih+XmALzmajpsTOxITKUytoZ
 atRL4GVEzF9bhj+GxSJLqkaGjto3BKmzeX0DMEPFU0crNXAf4Itrce+q81J4OZjWF9my
 eS6NChO6L6aOYWCXmKn3TLklx7SjWc5kXUdnWqxTf99oElfZhiand+J3AIzVP+R2Dqsq rg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p8hhac6jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 15:47:04 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32DEd5Ha002304;
	Mon, 13 Mar 2023 15:47:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3p8g3bcfy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 15:47:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6v6FE/v2HV+w8381erhKYcE92NsPjaLUawhYloXIrDVBqTIaK82FMtSjymJVd7miXfO3l5OP+Bt36f95ZfGhJKCZNiAxkEu82kpMj1uSCGrgPzr4QO4vtfcDgfEw+LHReUzUbXMZ6uboGEfPcGqVoqmmHWXJUyxBiav/3lsrUoDoJU3Jsg+h+AtX/vCltmXG7e5XiKIZzeZsce3maVriLgq1bYi5VYYUNHTdbuNK6J2IqONRoVlVnDD+AWev7JcvfYAwv6S+TzY36J0MZHObuiWPoUcad4N6CCsCBk7+jIH8wNGVXbvC5TM8gWQgJhhEhyqrgobYutCqiMrtgNBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBXssBL/WTfMQ7bhpOmU74VfCv31VyJBTkrlH4CuUxk=;
 b=Wmn2Ie3SNpdyagFlh1qYfhrQP2knMGh8vzug2OFb0bUyhGOLc9szJYiKR7JcsqplCTFjjOSsaBHHnTQMuu65Y0ehyyHPFpZ971CpE/i9jB4WTt7vm838gkG4p9sf4v71ZkzhoSEPYVl47UHhKh4suKkE45Y1SzHreiOQNqnSCGYghR6Unrqu0sSrWr/KVSDTVd1R2vXSjjawbUUQgq1ItxrIiqX4DklklrgT9PRBFasHd/CU1uN7MHAn2fhF1sLOz/Z+KNkXQA89oQ1+MHRu9gvYOU11b/4P21BZvaVM4bycYxjG0RtGdQzH57YjLfjMBv9MVzpxyDO/MWmzMjScfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBXssBL/WTfMQ7bhpOmU74VfCv31VyJBTkrlH4CuUxk=;
 b=DOT5Putmq33pmB/NOT58QvHvnFdHPXMakK5D1WmlqJJV4P/5FOXm7KRR5DJHXL/x6qzSvM7B9DUOvy9L5Rt8dSH6qJLlh/t6ltzG4rAJsUnq/WtnsEhPlZpEFxkIOAE/VglUkVSX/KOYwDjziGtPcdP4NwBQNV3z12vR3hlu5ts=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6296.namprd10.prod.outlook.com (2603:10b6:806:253::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 15:47:00 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::671e:6486:6996:c38]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::671e:6486:6996:c38%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 15:46:59 +0000
Message-ID: <0269c298-d53c-7ad7-c718-3dbc1e225d0d@oracle.com>
Date: Mon, 13 Mar 2023 10:46:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v9 2/6] powerpc/crash: introduce a new config option
 CRASH_HOTPLUG
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
 <20230312181154.278900-3-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230312181154.278900-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:806:d1::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbf46a5-4176-46be-8d7f-08db23da2e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yKb2SPW8MQJGlKuTtZL8df1CtL8dC//ro3ZkFyjg4BVk402kUd1VYunt7dxjagrb1sgZLc/CTg8pe5o/eDfg3gW5yotwK4SiYVilHazj58cJsnPf6HKpkRMW2y5bMEeHSG+vV04xORSEuVv9TYCevipCzFVoroJmJw59IJuJsABjrxzU0w1qGHhkPC7x3ixhl/pLDBoiuiQxlW9yBF0742F0D4omX1jdKh0CmTib+W1NFH0IhEvPCNvB8Yk5ymk/4SFxnAAF4fTCe/VwGEQq4SZpH0Uva4UX9OM8GAW2ObQ2EpwlzzXRg4qJVZ8F/C9BQWoOLfLUd9YeDHNwSFvc0TANU1MWnTsoqG8BEOu6RkyIZBphuGFUpL8nEBcGAjpKL8Ee7WRwYjy8OsJhjP6OUO3d3aSmt7CE0ki+npz0UNxaZL81PDjopZM3sJJB1MJXYnCVnL1IqkxLgVifjFFWr4Kad33Sh4t0r/coCXMdJpz0Q7e7t7CFsKxAKFiJmqo5a3uCjp3DKRtBHBvzNlm0glT/6hmpWGn5+EmUr3xukkfhZ07uNscIFHiYIWnx6rCv+CYEck8sKaX7c2Tod2g9tbjdlxN8Fvx7Extbn4DmGeKeDvqwoRSB5V7LwbKAETJx7IstuEVM5d0JX/KISRQpi98KHwjNRKosA0GxzGWJ5R3dHIzOcOfVzb79B1IPWBjTyw4WMYHckKIlNy/LSq0icUveNCHUSosVQWqh3ebc76g=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199018)(86362001)(31696002)(36756003)(186003)(41300700001)(6512007)(5660300002)(4326008)(2616005)(8936002)(316002)(478600001)(66476007)(66556008)(8676002)(6666004)(6486002)(66946007)(38100700002)(2906002)(83380400001)(53546011)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NGE0Y2g0T3FKZzlpK29xOWs5VDV2S3ZtY3VzNVVNek84S0xqYWhsd1hyOWdC?=
 =?utf-8?B?Q01FbldnT3NUN3pCa0UrMUJNRWJIK0I1OXJ0SWtGbnQ4RmVpQUM5ckQwSEp3?=
 =?utf-8?B?MGZRQ0R4RmtFT05WMW4vTGxmVGtEZkhOMmFrVCsrSGF4M09Rd2xEUm4yUVFn?=
 =?utf-8?B?c1lkMGU4bUp5VGpYempPdnM3c0RXWWJUQ3N6R3ZZZ1FkNm5SdVlKZ3o4TjYz?=
 =?utf-8?B?aTNhRzBmTTFPN2hoWFFqOXFWYUx1dlNWcDNWaTRBemVlWnd4bEdlQWdZVGJR?=
 =?utf-8?B?bjM2M1Bja3M1M016THBLQm9kMWdoZkN0SWplV0Y0c2hXdkxWT2NVNXFyMkhU?=
 =?utf-8?B?dElpWVczb3pqY3ZkOVhub3RsTnJ6dHBKejY0dW9NcGdYV2JnQnRCMWFOSmN5?=
 =?utf-8?B?N2txWStFRUw0UU1xelZBcWdBR2U4RWNrVVV3U29sOXpQdTBjY3lwbmp0eUZy?=
 =?utf-8?B?UGVuODBGMVpJSWJ3SjR2M0VJaSs5dFIxdzZnV3drZnpNUzMzaEtndXVPMENo?=
 =?utf-8?B?OXRJbkorWVRUZVJMeVduZDBPMnVtY1FGeGdCQlM4OGQrUHp0V3VDR1VsWm1z?=
 =?utf-8?B?U3V3eXp3cFlCbnNGa2UxdW9ZcExlbWZxVmVOYUFERzRwaVNQSlpLcHhjWnY1?=
 =?utf-8?B?VE5SMnhrSFdsazRjejhRNWZFeFB0QkhIa1ZHTWluSU9lMElwVFNYUmkySDVk?=
 =?utf-8?B?dVpDVDN6MkUxOW9iVU9KREFRUXZJUWpuYXlCQ0RBcHRsejdZTXB0Q1B6SURO?=
 =?utf-8?B?bU9ENnhUc0hWMW52bDR5RitjcmVwWTk2dU4vVTdKa3ZGSC9RVHBrRnY0M2p4?=
 =?utf-8?B?Mk9rSlprYUhsNzQ1NE9FcW1TcGM1R0JxY0w4Ym52Q2VETTU0MjFINkNkU081?=
 =?utf-8?B?b1FSRUNwNS9GMnhDU2paWVd0Y3JtZ2U5V3R0WGgzL1dZbTE5aUtCU1l6aGp5?=
 =?utf-8?B?c1lSdkhvZUI2dDdLbWhEQVJMY0xKeE80bk1ZMzJvajNmKy9QSzYyMVd1QXQw?=
 =?utf-8?B?RGdPL1RSamo3bS84UUo5VC9hNlJVemhZa1o4ZlhJTlE4UVNQd1VqWldTQjZ6?=
 =?utf-8?B?Tm9odVVMMUw3UE1OdnZqMFF0ejBaWlNzb3ExZFlnbDAxcjdDMGdyM29LbFRK?=
 =?utf-8?B?SDRvejdFMTk1MDQzT0JaY200OUVUaGpnQnpwNG1HaDZBRFRGWCs3K2JlNVhZ?=
 =?utf-8?B?M0trdXBJQmN0cFZiU1NLdytqbnFJS1NDRlpUNGJqdks4T1BNUXFPc1FKRitY?=
 =?utf-8?B?Nk40ZFIvV2NEY1VUam1RV0hFdmtTdjlDR2E3VjkyR2hZVUhwOWNWUEp0RlZK?=
 =?utf-8?B?cWRZenlDOWpuWC8zR2wyT0xleUZ4Skl5STA4NGY1YnZnbXZDZkk5OFBpN2xq?=
 =?utf-8?B?emFFR00yNWpoazJ2M0V1cWEvMTFpcWN2UXNyNk95clFpdTM2ZGgrQVg3R1By?=
 =?utf-8?B?MjY1RlRFY3orbTVZZjhwc20rS0ZDVHhlaHprbVJ5eTdOb3Z5b21ldmJoVjk4?=
 =?utf-8?B?QTY4NkFhYlJyenRRZVZCYzBxNlRncmtkdkMvN2xjdlJydkV0cmNzMmdYQXY2?=
 =?utf-8?B?MmRKRlZmZmEvMGZRckhHdXgzYk1XalZXMncrY0h4cGozcHZBYTY3WkkwY09K?=
 =?utf-8?B?U0pkWGhDQnBYUmxsbVlJaWZXVm4xZGhMSlJWUEM1cTA0blcycGhtd1FMR3Ra?=
 =?utf-8?B?WGwwUXdsY3JDMjhmU0tJYzhBNEptVkF3eHArUUhTK1pUcDNxMm1vdkpYV0pk?=
 =?utf-8?B?dnE3L2hDTUVqcE5rbU5PQVpOTERaWjk2dFZHVGVGMURWcFg1ZURGTXJteERB?=
 =?utf-8?B?OTUzSFFqdkdqQlNhMnFoRFZqTVl3dkQ1Mzg5Q3FKUnpacS9uenF3T0tMN1ZL?=
 =?utf-8?B?bFphVmd0c3dYSTdSbFR2QlQrTG14MWRIQ3dUU0FsNFZOU0gyWVFETEJOdTBo?=
 =?utf-8?B?OUZmYS9OeWxITXVTaXExbTBRNjErVXNJM3MzcmRvVkpRQzBwZy8rZzk0bGJM?=
 =?utf-8?B?ejgyZUhKVHdzNWxOR3AvUnJHTHdoVXV2eFJpMzZBWTVjQU15MXhJUEdQdEFN?=
 =?utf-8?B?bThLR2pGdkthMFpWSXkzYytQMi93aHM4cllVOWJVOCtQVVhIR1NuZzIwOGNU?=
 =?utf-8?B?OWpKb0lCU2dhemlrMW14Tk80R3gwcXprTUJwWEMrZXdwMVMwMVlzWmVZVVlt?=
 =?utf-8?Q?RSpJo6Xvhu1afztmuMQHQEo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?WTBvZ1hTVm5JUHFLMFhnODB4TnRSSnRLbU5RQnMyQlpoUy9JUEhEdjFEQmZw?=
 =?utf-8?B?N3UrMWlTNklxN0VSSTRHamQwTWdGSU9ESkpRSlJnMzVNdjczaHd3Mmk5UVVz?=
 =?utf-8?B?WVlpWUJsWnl2Z3EzeVdzUE9WeGRSVFcwQlhodkkrTkc2U3l1MnU2OWZiK1ZD?=
 =?utf-8?B?aXpLNkQ1QVpKaWRaOEMyZnQ3NWZ1bFMvaEVadHYyWnRtYXdGNjVWNmdCeUxZ?=
 =?utf-8?B?UkJxcXRZTnV1a3Z5SGRRazl6dS9JL1AvdjVmbzJFTTR6SWZkdWFIZGFjL3Vw?=
 =?utf-8?B?ZllqTTVZdWo1UEtqMjN3NktTa3Fta3VkT3dRbWtWTUthNmttMVF0b2pJMnIv?=
 =?utf-8?B?cUFEdVlZbmRxT3JWWWxmcHVHUGoyclA4NlB4RzdGMXdhNlEwYkNMOFVOMmdq?=
 =?utf-8?B?TEFUNzh2cjFRYmlJU0tHREl3M0MrODJqZkRQRnU1OE5QYnhqVEZneTUwQVRP?=
 =?utf-8?B?bFZ2RVRseExZUzliUXVyRlJPMkphTmFhVWxGR2o5Z0xjRWI4Q2t5QnVhOFBO?=
 =?utf-8?B?R3BuMEhaL2JwUWRyUUcwYjJpSGNVclQ2T0s3a1JvakUvN3cxRjVBQmFvT3ps?=
 =?utf-8?B?Y1ZhazFtOWlFK0dxV2M1UEJuLzZiZHJXbFFKYzAyMm9xNi9sUFNLRnFaZFJI?=
 =?utf-8?B?ZFZPMEhjMWRUcCtPQys5bFVnOXpQUHdtSkZ6dnpGelRaVjFXYnNOemJkRnRI?=
 =?utf-8?B?ZWZwV05Cd1BZR1l5dEo3aXZMSjNaZDB1UHRFRmZwd0dGN2RNYXRYZEJ3T3Iv?=
 =?utf-8?B?dWp5a3dWSXUyWWFKWjI4emJIdE9kcXBIZ1I2MTlWT042aVFjcks1bWovYjY0?=
 =?utf-8?B?Z2VVK3F2RU84cllad3k0aS9CZkpZVEhPb0wvZkowK0NiNUhmb2ZIWjhPVUkw?=
 =?utf-8?B?OTJCeW9VeFY1dnY1L1doYzdoUkZFbTJDMGM0RkxkeVJyUTAyVXZwek5mRUN2?=
 =?utf-8?B?QVJHL3pyNzVqSmdRZ2JHTmI3b2tta2ZzZ1FrZlIrakpvRjNKaE1ydklNVjVM?=
 =?utf-8?B?bXZGblNybDU4bnF1UU5CTURmSjA5Y0VjaW5HUmJ1bnZDMFpVdUY3b3NsZk9I?=
 =?utf-8?B?L21ZWTR4RjNoc1c5K052S0dDQ1pWWlQ2ZU5ZZVdhUXl5WG1HSVJDNEVvYXlx?=
 =?utf-8?B?YmM0ZWRGaG9aRGRzRlVYUjRkQmtubHNYOHZ0c1VRM2lYbHJvalJHTUhFSkwr?=
 =?utf-8?B?SnlwVUNmWk9SNnc3UDRJd0Jma3NabFJtSFFCMjZFdWYrTFlvQ0FHbGxmNUw5?=
 =?utf-8?B?aFlyc2pCUXlpQUlMajZHanBNMHViSmlGY0FvSlp4ckc4Q2hFZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbf46a5-4176-46be-8d7f-08db23da2e78
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 15:46:59.8937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oUoUPlghWBxnjUGw3KDXnwvYR7msl38a4y9dNsmOp3or7uhKTusX5Wz/9dbHvSV96BgJuIPjGByRnL9EYInl0RRVN0jr7YHxJtjml8ldZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6296
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130122
X-Proofpoint-GUID: LudCGicO7-QJTIcFumAolpctK8IwV6Gw
X-Proofpoint-ORIG-GUID: LudCGicO7-QJTIcFumAolpctK8IwV6Gw
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
Cc: mahesh@linux.vnet.ibm.com, ldufour@linux.ibm.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/12/23 13:11, Sourabh Jain wrote:
> Due to CPU/Memory hotplug events the system resources changes. A similar
> change should reflect in the loaded kdump kernel image that describes
> the state of the CPU and memory of the running kernel.
> 
> If the kdump kernel image is not updated after the CPU or Memory hotplug
> events and it tries to collect the dump with the stale system resource
> data this might lead to dump collection failure or an inaccurate dump
> collection.
> 
> The current method to keep the kdump kernel up to date is by triggering
> reload (i.e unload and load) the entire kdump kernel image whenever a
> CPU or Memory hotplug event is observed by udev in the userspace.
> Reloading the complete kdump kernel image is an expensive task. It can
> be easily avoided by doing the in-kernel updates to specific kdump
> kernel image components which are responsible for describing CPU and
> Memory resources of the running kernel to the kdump kernel.
> 
> The kernel changes related to in-kernel update to the kdump kernel image
> on CPU/Memory hotplug events are kept under the CRASH_HOTPLUG config
> option.
> 
> Later in the series, a powerpc crash hotplug handler is introduced to
> update the kdump kernel image on CPU/Memory hotplug events. This arch
> specific handler is trigger from a generic crash handler that registers
> with the CPU and memory notifiers.
> 
> The CRASH_HOTPLUG config option is enabled by default.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a6c4407d3ec83..2f45b3f5175cb 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -681,6 +681,18 @@ config CRASH_DUMP
>   	  The same kernel binary can be used as production kernel and dump
>   	  capture kernel.
>   
> +config CRASH_HOTPLUG
> +	bool "Update crash capture system on CPU/Memory hotplug event"
Fwiw, online/offline changes also flow through this infrastructure...
eric

> +	default y
> +	depends on CRASH_DUMP && (HOTPLUG_CPU || MEMORY_HOTPLUG)
> +	help
> +	  In kernel update to relevant kexec segments due to change
> +	  in the system configuration, rather reloading all the kexec
> +	  segments again from userspace by monitoring CPU/Memory
> +	  hotplug events in the userspace using udev.
> +
> +	  If unsure, say N.
> +
>   config FA_DUMP
>   	bool "Firmware-assisted dump"
>   	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
