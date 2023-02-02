Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF46888B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 22:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7B7t61h0z3f7x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 08:02:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=yd1HH6ih;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kniEcPoq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7B6r5HB5z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 08:01:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=yd1HH6ih;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kniEcPoq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P7B6n44GHz4x1h
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 08:01:53 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P7B6n40mRz4xyj; Fri,  3 Feb 2023 08:01:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=yd1HH6ih;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kniEcPoq;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P7B6n0yT7z4x1h
	for <linuxppc-dev@ozlabs.org>; Fri,  3 Feb 2023 08:01:52 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312IE0LR024301;
	Thu, 2 Feb 2023 21:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=FTHJtMKo3qeOUWeWmZjJ5BPwmq+IDvi4Ma04HY7s7ZU=;
 b=yd1HH6ihi/PkdbIKSatmxzAvCEAVcqgquSscUwbBl+xFw99ZBVw131/yU5BO1j7zQ3jR
 dCfp3KOuteZN4agrmG+U8IXgR6IICDKkk9T9UfDO2aZXfS+3lMyEvDP5InjLckK26daR
 tICeXxmh4ikoRrPfxtJZ3lzZ0kJEn4elKVNzkoE66mpxzm8+0OBLeanUy2yapT2WAQ8R
 EW0NW6q4hKE/nTyaUPSuTqDVHt4sCuUW3rtxoW0FwNq5k4X1ijnYXNlDUFVnYNJ8Crlu
 6jkS2DOq9lktcnpdjJf1DcOwXK4cmywXfxsR+U7xghTTre3QHrRS3LsNp6uJio6un13b pQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfq4hky0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Feb 2023 21:01:37 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 312JODuX002451;
	Thu, 2 Feb 2023 21:01:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nct5g6ykg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Feb 2023 21:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMbreUQmVDfE6bGVhpo7Yu68HTJO3xbXGGS9Zp4G72rA93F5EnV/5bZNkF9hu6S+j4CWSKwvktyjF4JdpKYMPAnUjYcHwh/xtcm/6/ovgh87ZaTKI7JARWlp8L6edVBE/fCR+nQVRP60wyYUh1r3VNeLxoy1ddbn7yu7A5AUU+xlugF7Hgtf73e9Fq4gl77J4Z44KIZLWMt8ozyeaAsYn4PJrytqrphRZm6I+/yRlpc0C10lDRoKl6zxXmT7zNGeb54istEylpn8L2CIJDJTaRxyjHD2RJqlM3W4iXHK4n50G18+VrV+kUwjoAadxRvK2x3RsSOx+qJXAIt4PHc33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTHJtMKo3qeOUWeWmZjJ5BPwmq+IDvi4Ma04HY7s7ZU=;
 b=WP6R2oR1qbiK5RabOsvzSdXZzvhmFQ72N95jB8299ftL3x9MTxWZ502FARAeUQbLVKvm7yve35pa9KVUHAliYplIuqfSeIjcTuaZ3wMr77MQ4LWCoSl7V6VdGNQzLJT5eErrgrJYPeUqZqLs7sfMVYrPYi4kU5ioSTbtF7VJOhxMyRL384eL9cCwH5qd3cQ6aiagh4p5jthBc0288XiWahFWFCFyZUdCIO/JL9sqxSocn9tHzPxPMBAsAfgwjOyDhEzz2fa6fsNKXMkJXiW9MKTdOl9Mxa2Qiw2SYDsZV9TjCQFJ+r/arw17/Wi0iOD/ZaiHuN5txE2jDA9KXV4hDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTHJtMKo3qeOUWeWmZjJ5BPwmq+IDvi4Ma04HY7s7ZU=;
 b=kniEcPoq4nC/+CzUNfU9kVbUq+TfuIDvWcltrdfFATXrlbaDHXfabjyw5+U2layDC5RihubWSba6Iqiy+VJL/WPcAh0MflLYLtmPMgvvJsEzHnzVUZ2XJ0qGX01feg9NrcIpFo2nwdVcMQMAtqEP5P71VJXkU5tb2Qy2SdCkdBs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH7PR10MB5831.namprd10.prod.outlook.com (2603:10b6:510:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 21:01:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2101:3ed8:9765:370f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2101:3ed8:9765:370f%5]) with mapi id 15.20.6086.008; Thu, 2 Feb 2023
 21:01:34 +0000
Message-ID: <f81a50ad-ecd3-8866-2307-b9ef52f0f77a@oracle.com>
Date: Thu, 2 Feb 2023 15:01:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 4/8] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: en-US
From: Eric DeVolder <eric.devolder@oracle.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
 <20230201063841.965316-5-sourabhjain@linux.ibm.com>
 <401813b1-9834-f8bc-e035-2fef309d3fa6@oracle.com>
In-Reply-To: <401813b1-9834-f8bc-e035-2fef309d3fa6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH7PR10MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: c96a5168-6f79-449e-50b0-08db0560aa9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZuszZ+t4idd724nf/EuIZjd1z42bOriioSb2vAcU/DRtRV0MtaQB3VuZSr3lC1cCVFSJz2DYIjxtPmQY2M0tjn7eRZUny5NFMWmlywPsfLDlKfNGaXWj9j5WuSA8HGNKXS7qdlT/orJTzp4MLvWq9qTXzZcJncEyJL+PQDjngNmgj/R4Ple9RE3/WUFVnZNZlAAoRVcQuU1czy4Hr5aZ0bj4ydYlP24Ep7lHCcDG3WgDeGOVIxCK5JfBo/+muz8i8PGjkUBskUDmGMob+LlZSerC4gA0qxjIbrCwYUfvLlqOaLTrgxdzaGyFGq01OBGpOrbM40dsFEhKQuio4oRNTKKqm5qXzwz64Sru9FoBBXoOWaeQ+ZFzzsHdwLZBmXSkfT+fUlGIKUPZenjdoN64zhyWLochLC9adAQegPg0z4Ep594j/eTEkJW5RYylBOIy4r8DoSLOeu6iYgw9iLOACXP7SmHR6UjJ/vXzUb3H65N+4L9VI5XyNG0/WxLwTYTZXqt47gpYX88DHFaGujPJgKzTUNZwO5sA4wU7vGrgCEZtvUo2m0dJZvfcRvg6q030HojjrDdFtJxnTjOOALG9xT00KiJu0fIZrUJr3RMimxqweF7tjW2etIIlRG1Gv4NtAn07kcKQlGTMkiQjGeNXwOW/5Wf+PkaZhMASH76SM+jaXf0zbiAloVx/eDzYwNrWkjlxMEvijMOgJNLHdsKp6rwX/PMg1U9BsnMUo4/2EaM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(83380400001)(31686004)(36756003)(38100700002)(6512007)(2616005)(31696002)(6506007)(316002)(66946007)(5660300002)(478600001)(66476007)(53546011)(8676002)(6666004)(186003)(2906002)(6486002)(41300700001)(8936002)(66556008)(4326008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UTZDblgwWHpacmlpZ0E4NC83Z0kwemxJYXI0bFlWb3B3MlZxV2VDRmxCUWtz?=
 =?utf-8?B?WWRFMDljRkpWeFNZNXpUaTIzV3ZxZXRIQWJlVmxvZkkxV2tLQnZqam5qbnNF?=
 =?utf-8?B?UFpFRlhiVHVnTENmZ2xYOGhrelZZYjhNZ0Q4RHdDUUozRTZPWVUzdzhTWFBT?=
 =?utf-8?B?czYrOWNyK2VtVVd3SHdQL2hwUGU2NmdEMitSaVJmbWJhK1NzSDY5a2dRRGUz?=
 =?utf-8?B?SkJXOU5HeThGOEUxNUwrMHBVNTAzdTFWZ3ZTWW0zVm9NWjN2OHJvcFNKYVBB?=
 =?utf-8?B?OGRCcGd5emN3WDhYV3FpaU85TjRna3hVVUNBU2g3M21zNVRObURJUlp4U1Fn?=
 =?utf-8?B?Vkd6UmphM1J5eis1aW5KMUNyWmJsR3NyNXY1UHNhZGRZYzBJQkZtTUpkb3lX?=
 =?utf-8?B?UXlXOHRNb1c4Wm9JamxVcW1UYUswdkVkdGQxOFN2eDJNdVZtTjhGWE5jVGQy?=
 =?utf-8?B?M3k3bFRjT1MvWkxkYkpPcHNYRXJIZHptbUR1Z3Z6cmhDNklDVFc0L281ZkNN?=
 =?utf-8?B?V0NRWTdPOVFDZjhheitFK1B5OFRzRVFxbmNFbFFPSkVMd253VHN2eGgvbkZH?=
 =?utf-8?B?MG5Db3FaOHFLZ2cxazRJcDdYODZzNnNLL3lkWWprdHdjNWZJRmcxRHk4V0RG?=
 =?utf-8?B?YllVQWVFNDBzRXYvOU5iZy9maXVZNTB5Zi81Z3VHSUVCVTB6MytEenI3cE9l?=
 =?utf-8?B?eS9wSDRFT0ZwdUFNdFVzM0t4UkgzbVAvUUM4UE5WN0pwRVlhNVZ5VmQ2WlY4?=
 =?utf-8?B?THI2bVpXU2FYRDIybERmanBCWGgyTVlmNUY0OWNKNldxMjlIN2FiMmo0Sm9r?=
 =?utf-8?B?ZnVTbDlWK1BnSkVyR0pqUmkyUElteUhnOXBqWW1JZkIxYnBGL1ZyNklBU2Zi?=
 =?utf-8?B?ZE5JMHRkR29leWdMUW9Lc2VWZ1VKeGV6MjJscytGN3RDa0ZLOGNscUxYODZl?=
 =?utf-8?B?WHNvcmxtcFBZYi9HWkdobCtTQ0lvQVNnSFFZdkpVUWV1QzRkVHpNWnJwRGxs?=
 =?utf-8?B?T1F1TUx5NjFUL094NHZZTUltSGRLQ3BQd1JXOGR5TkxpMnM3MHBlaVQ1NVBq?=
 =?utf-8?B?WWJHRTBvdlRrdzNDSEpQWG1oU0UwcjhxR0F5dlVxNWdlOHAvT0lyMEdzcTAr?=
 =?utf-8?B?N3FrK2c5V2gvQ2pKTGhLR2Fxc3ZQMEt0S05JL2NUamJjK1pFMFhKRW1jay9Q?=
 =?utf-8?B?MnovUXRxcUk2dzZOYVN1TWpvNEsxMnZUQVpzNS9oZmptcGNZbXUwTUlSOGRq?=
 =?utf-8?B?Y0U4bDZuLzJHSVhMRExuSDAyN25sUmh6OUtocngydFlxU0pQVU5pZ242dFJ5?=
 =?utf-8?B?QzFsa1p5OUtFVDNCSHNHUHU5aEExQ0I0bDRxOUdDeVphdjJIcGExM0hFVGRv?=
 =?utf-8?B?MnVxZkYvZzRQSUZDeGpOTlVTQW1pb1k3dHppT2JZSHVzNDhURkRIZ2JLalVj?=
 =?utf-8?B?dituUjF4eFM1b05HSFM3QTUxYTNIRlBiMHA1NW0rcUNVU1AzRjZNNmUwYXNw?=
 =?utf-8?B?Sm9PTDIyVFA4bjFvNVN5UWUrWU1zd0ZMWlFlcklIWTNHT2NMMlJzTzZha3Na?=
 =?utf-8?B?STF3Nkg2RmIyaS9hZGJuUVMxWjM4bVBjYkVRdE90Nk8yZE9IODlvMlRveFFC?=
 =?utf-8?B?TzBZbUx0b25jY0x0RmZ2OTNUQ2RwOFVrUGVXOGllU2UwY0lBNWRYWlRmRDcv?=
 =?utf-8?B?ekdoZFJUT0grREFaZ0Z4b1hqL1hoV1NjRVh6elVkdEt0dkhBZ0lRYSt2MVdi?=
 =?utf-8?B?Uk9tZ3RheW45aHB0bFpVeVBvakRwdzhKdG5XZXlqbUdKSHVGM3hGdEQrS0xY?=
 =?utf-8?B?Yzc5a25uM3JJbW9EK1FxdFFkWERKQng0eVl3NzZPSllad3hnYVNkK1d0NnVC?=
 =?utf-8?B?b2V3TkpDWlpBNVg4T0hTeFRmRHFuWVlua3cyeVQxUER3aWg2UFV0QVdqcUhy?=
 =?utf-8?B?d09uNm94TFE0YTYrTnZobzBjTCtoN0ZQTnBHUUFhWkN1QjR4RjZhT2RPWXlU?=
 =?utf-8?B?a0VvaGt5ZU9RNjVrYXFFaitrNDBTdWltSEVibENUVlJkVEovS05jZzloVm44?=
 =?utf-8?B?OTM5azFKbmV6TER6VWF4RWJZQU5LZ21jNndPVmtFcFBJdUpFZjZZZEN1UzV5?=
 =?utf-8?B?em1JQWNPRWdnaXZxTGJQUGN3Q2ZMNFNxUkgrbVl6dGpBMHJvbUExbUxFc2ha?=
 =?utf-8?Q?YThkUuR2Fe18mmNn1mtV3wc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?SlVtZXRZK0t3L2N1N1RoY2J5QmJlZEZOb0xhZ08ra0lkUWJsRXd3aEx2VDI1?=
 =?utf-8?B?ZVJoVXFBajFIdE5HaENUSVQ0Qzh2VlJCVHdQSUFyZzJxbk1wNUY2c2VsREt5?=
 =?utf-8?B?dWJqZXpWMzQ4bTZPSEpsK3QwcGtTZVBFdDZscDBTTi9IeHQ4TmlURDFRbkdC?=
 =?utf-8?B?NjRxczJpMm5XaUJVMzFPaHRBcGhHemdEamJ6TTJtalRWV1dUVWNzYlp0TEZG?=
 =?utf-8?B?Z0VDWDd4a2FFcmZQZm1hazhSRlFGM3hpUFU0WXJlVXNVNFVNcnk0cjVxVVFQ?=
 =?utf-8?B?VjU0QTJkUHhFVkZMdU9aaGV5RWhuR1FHc2dNOFpsRTAzNE9Cbjc2dnRQQlNQ?=
 =?utf-8?B?Y3RNanp6bmx3Y2V3L0J2eFYzMitFK2RickVxU21SNnZOdUMraVpGTXFPaisy?=
 =?utf-8?B?c2FTZXpwbXJXaUV6MmJaQXYyZStLR2d4andzRXFqNmpiS1UyZXhoRFdGQStu?=
 =?utf-8?B?NUQ5Nks5cVZBTHk2MlJFOXZHVTVvSnZxRFZNaGp5Q3BnMjliYVdzKzIrLzRX?=
 =?utf-8?B?WWU1S3BLMEpSOWV1dmVIN3NBSFpOMWNFUjBhRmNyRDlNcjRlb3NvMFB6R1Bs?=
 =?utf-8?B?dGRDaTdkalRnNklCTVdhbDMzSm5tU2MzU2Y3SXlsVFBBY2REbG9oWnlCZXRI?=
 =?utf-8?B?aTFSaEdzaThjdzVRMGwyR3NMWFVieXJKUysySVZQMVZYMTBnQjU2cE54VGZK?=
 =?utf-8?B?ek5aZFJCRjZsVHpQRmhFYnh4QVdMc25ZeUsyTWhkeUtZa09jMGZsV1htOTFo?=
 =?utf-8?B?a2xVMmUyS3ovSXVyMHp0Y1l6a0RpTStkUUZyZXhEQ1pZSnV4dzJZU2NZNXVL?=
 =?utf-8?B?c1JFaHFyTXdTcFVpaGNJckpkMmRGQ3lsMitUWHBUbEpDWVM0TkFzY1FRSGYr?=
 =?utf-8?B?anFQaWRJRXRBSzVCbmtONHJ3aTY0SEg5WW50a1pZSXVGRHFhSDdpdFpTYWty?=
 =?utf-8?B?Y1pleVZpbU1RTjh5MVBTKy8yU1dPYTZWMFFNeXQ0SFlQcUVVR2pzRTdvT3JC?=
 =?utf-8?B?eE9wK29oTTV0bUNreXpGTjREVlVpZk8wbW1FcysrWDQ5Q2Y4M2RoRWJaSXVH?=
 =?utf-8?B?NXpxUEc1VWE5N1dybXN0V2VLUlo2RExsMXE5eHVuN0Fhc2ZpMjh4cFVTNE5U?=
 =?utf-8?B?WUFubUpkMi9JZFVMQWM0aTR1QlNTMGlwNEtBbmdQbEdsZy91WWxSanNTbG1U?=
 =?utf-8?B?QWlwcEVsOE5JdG9IZEJzVm45S2Q2ek5BekhSaENHa1czakZGSGRvZDVSc0gz?=
 =?utf-8?B?SVRBME94eFhwdGZlUCtkakl4OSsrTFR1NVdJUGU5V3o3RGdSUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96a5168-6f79-449e-50b0-08db0560aa9d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:01:34.5179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRBJcyTemA1e1l7DvTERWzCRe9Yg6rDBCuHdi84msGPyzlozU/D4xIZKutrjkIKHr0wV6TuBNm6EcQ9Vr8RoFYG2SoXo/rkhK3STmZsLF84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5831
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020185
X-Proofpoint-GUID: aZlvufYvYwct8NawUK5BM1k867jQy5LB
X-Proofpoint-ORIG-GUID: aZlvufYvYwct8NawUK5BM1k867jQy5LB
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



On 2/2/23 09:37, Eric DeVolder wrote:
> 
> 
> On 2/1/23 00:38, Sourabh Jain wrote:
>> On architectures like PowerPC the crash notes are available for all
>> possible CPUs. So let's populate the elfcorehdr for all possible
>> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
>> crash update on CPU hotplug events.
>>
>> The similar technique is used in kexec-tool for kexec_load case.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/crash_core.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index 37c594858fd51..898d8d2fe2e2e 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -364,8 +364,8 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>>       ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>>       ehdr->e_phentsize = sizeof(Elf64_Phdr);
>> -    /* Prepare one phdr of type PT_NOTE for each present CPU */
>> -    for_each_present_cpu(cpu) {
>> +    /* Prepare one phdr of type PT_NOTE for possible CPU with crash note. */
>> +    for_each_possible_cpu(cpu) {
> 
> Sourabh,
> Thomas Gleixner is suggesting moving away from for_each_present_cpu() to for_each_online_cpu(). 
> Using for_each_online_cpu() is going to the minimum number of needed, whereas your approach of 
> for_each_possible_cpu() would be to the maximum number needed.
> 
> What would be the ramifications to ppc for moving towards for_each_online_cpu()?
> 
> In my next patch series, I have finally figured out how to use cpuhp framework to where it is 
> possible to use for_each_online_cpu() here, but that is at odds with your changes here.
> 
> Thanks,
> eric
> 
> 
Without knowing the ramifications of changing to for_each_online_cpu(), I currently am
using the following:

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e1a3430f06f4..a019b691d974 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -366,6 +366,9 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int n

     /* Prepare one phdr of type PT_NOTE for each present CPU */
     for_each_present_cpu(cpu) {
+       if (IS_ENABLED(CONFIG_CRASH_HOTPLUG)) {
+           if (!cpu_online(cpu)) continue;
+       }
         phdr->p_type = PT_NOTE;
         notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
         phdr->p_offset = phdr->p_paddr = notes_addr;

Thomas points out that the above can be simply the for_each_online_cpu(), but again
I'm not sure how that impacts ppc, which appears to layout all possible cpus rather
than just online ones. How are present but not online cpus handled by crash analysis
utility?
eric

> 
>>   #ifdef CONFIG_CRASH_HOTPLUG
>>           if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>>               /* Skip the soon-to-be offlined cpu */
>> @@ -373,8 +373,11 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>>                   continue;
>>           }
>>   #endif
>> -        phdr->p_type = PT_NOTE;
>>           notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
>> +        if (!notes_addr)
>> +            continue;
>> +
>> +        phdr->p_type = PT_NOTE;
>>           phdr->p_offset = phdr->p_paddr = notes_addr;
>>           phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>>           (ehdr->e_phnum)++;
