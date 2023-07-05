Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2E7490F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:24:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=082Yim9f;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=v/R54tXJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDjQ5TFPz3cSH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=082Yim9f;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=v/R54tXJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx9BH61zFz2ydX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 05:45:41 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365JU7wQ014833;
	Wed, 5 Jul 2023 19:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=eV0jbK2WDEQS43HbEvcqWc8f5PWLc4h3jI7cxGtxApA=;
 b=082Yim9f87vZtRKB6C+VzOgr2FSGiknXvwN05wtlyhd/avPd3r1iwhL8y1rUU1ID4TTC
 oIV/OkL4EUvP3JluIEKcd0iL6PtMa1nyzOy/84r62yXTpvn8zRWfCdRohnLMUOuU58yB
 NUm6THnPDrQl1edbn/NH3OBQsSW/sEbpOUN4g9WB33PSQkJ6ZjBNTkFhjLzwsfcQhgUC
 wSVQ1TWsxHH/t0tI40Z8y86Olll85fzPdHwdFILgFPIUNoyYATvcqmmzQE97y9TiP6F8
 BLplaMykrPt7g56nXS4kFkoN36m78fud14O7DqDMchQetHZ94eSeftiGSFhXvbdELJTs Mg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rneqqr13t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 19:44:51 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365Id8k7033293;
	Wed, 5 Jul 2023 19:44:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak699xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 19:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZjwwL/3NXedoCSEOCpaOwlOpzdbBpxbNLJlaeMScvF9D/y7rYg8xpfwy2LYq84g61lL14guuQbhEO2++ErLBpER1AJ5SgXLMHVkSHf1LnGShcsbmRJmsIbFM54gWZ22UWNWLh1nlsd0vlqRaUr1hLmBe1wDTzjk4NjBrXcBLHdfoE7COZvAXkkuoTtdEsBmSsM977qrUVW8G3Czi8s7hu3jeEzP6oz9yCU6BZYsuhIoffO59VfoF/wG+RdvYom9KBlozNT7nGUXV+LrevVIbQ80oQo9jGEJfE1XIDKRHPY3f4gXkF0uJN+jcpLx4bU7gJdvH8OELQVgUEgAqsNgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV0jbK2WDEQS43HbEvcqWc8f5PWLc4h3jI7cxGtxApA=;
 b=U9s+bjh/84IjofYywawnMyikyAAIl/Qxa/OGwWxPOJylqz5wOHIXIpzrl0HlBOR4KIukZonFTiS8Wu0k+A0jqiV6PZf1ZQ7jeVIVRbHjsTu/Fgay0KAwVQZ2xrvWHws51WItYKJ6DONhmLCV/7snPj3bb6xFDkkH3G757KmVol3KdQydlnRpwIwtMiBRdFPt7cJxhbAlQtr3zFkXWqY6H6IkYcfgMkROb5C99BZ0cmakWn4ixRqWUrEbkISyAGnQq3yFaFbDjn567bm1xbK1K61XMsa6Yj2yfPTVnaMsjiDxnFIKC3BDsK9wq4Mo6eT8sUfD2yYKMmMKCT9/S3cm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV0jbK2WDEQS43HbEvcqWc8f5PWLc4h3jI7cxGtxApA=;
 b=v/R54tXJZUNUSEy6E4SxWVFlTD6FmXrDQzfwSQhcvnFacHjabrPKaeXb+eg9snHufqEBrAm/yeflIAs2Q6am1mfV2Tme1kmsBW6YneGFaKiIXZsSfBxDfWevenW2lBVVMTKD/telgm9CmZkPtLUJxJ2/itX5kN7Rdv2Hjg4XupM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SN4PR10MB5542.namprd10.prod.outlook.com (2603:10b6:806:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 19:44:46 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 19:44:46 +0000
Message-ID: <c8b55b86-604e-6257-b1e1-9cc8d988181e@oracle.com>
Date: Wed, 5 Jul 2023 14:44:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
From: Eric DeVolder <eric.devolder@oracle.com>
To: Nathan Chancellor <nathan@kernel.org>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-13-eric.devolder@oracle.com>
 <20230705154958.GA3643511@dev-arch.thelio-3990X>
 <891d6836-b331-13e0-20da-6a0a4d98293c@oracle.com>
In-Reply-To: <891d6836-b331-13e0-20da-6a0a4d98293c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::11) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SN4PR10MB5542:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d78df0b-a920-44a6-a61b-08db7d90494f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aZUxD0cxSpYYdQRs//zJ03dmeyeq7dZayyz4kjwhyyQywzDTI7qw5HZSicx0STrGCKdAyG+xY5htwgClZ6/yXVGVT8cUwoOvdu8V7Yq2p4x/SCoNqI6e8z92OgRs8TMlY48cnk10g4qzodZ8Z3Xp+Zghs5+XYMHhhl2T8fulqB1jIyv7xBqF3N2/kKgZfjeIXIygqCRO7DfvxmlV2h/k+hhjavoWQ1Hlko57A1UpdH7YLq4X9DUdMAUYdykccRH781WT8SEAirk19c1uzJl5Z/z+uaRAD5zkf1YYkHlAL+qFZzBGSCDFJrGGx0x21fKwCLSpkZeriYiZpG99S1JwNdv4WzylKYCqpM478S34mN3oi7DzjQVNf68UMYzfEJ7Nx4dHixX0CFyu4V1LfM3ib3MU2NhO75Na8XT+1ha2MVzOWgnk/V1feXPmMbBtUW1YD7foe5PcVXkW/bBodVhx2stokqA9Febc+c5Qn/dSeJacUkUFa+WPk/orOpADXSsWmyESDE7S2vKYG0x3GiDseQh1GcBjM55EI89t/7DcX/C7D1YuLdUgGDzF5Z5kl/UYqwVT4ngWqAqF7T1WZj+KbK6mVReZFhdjSr5Yu3kPm/or6AD2TxSocDqwNwNiUtqkAWEgRVg6Q/8lXcxKQCGG5g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(4326008)(316002)(41300700001)(31686004)(66556008)(66476007)(53546011)(66946007)(6916009)(86362001)(186003)(26005)(6506007)(6512007)(107886003)(83380400001)(2616005)(31696002)(2906002)(6666004)(6486002)(38100700002)(30864003)(478600001)(7366002)(7416002)(7406005)(5660300002)(8936002)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MS9yZWl4WEErVk1DQ1hHOThTZ0ZIQ1ViZUhVUzRFa0I0ZklvaXR6TnRDSzFH?=
 =?utf-8?B?Z1FXZ0hnbVVFemF5UkhvOG9FSlNoWThDeWltMTNZVW53VVVhc2dOZlBmRjU3?=
 =?utf-8?B?djNXb0tEYlkxQ0h2UjljNHE0Zzd0Vy9LdW9VZ0czYTMxTE1BWlJYVENScWU0?=
 =?utf-8?B?Z0d2VmNuTVlPM0FuQWljMEZxOWtpekltYks0T2ZxeklTSUt0Z1FFNHdIRi9h?=
 =?utf-8?B?bytrMGcxdHo4NlNBdldDTDRzTTBSVE01bDZOQ2pVZGFqM2xvaUh6NzVPQWJN?=
 =?utf-8?B?UTV1MzRzbC9FQkFvY3Z6ODZ2RGloNWlieklVTnhSY21LQkdnd1BUYWFXaG1x?=
 =?utf-8?B?QXB6azFsZXR3NS90OFpHL2dqek9qNGU4RFpMT0pwOVZZUW1IaEloZjBmQjht?=
 =?utf-8?B?eDJnYlI5WVBudnh4RU1ldWFBUkVVMG5xTkxITUM5OW1iTndlYmJxOFNBR3J2?=
 =?utf-8?B?UkUzd1VPcUlNVUNqd3JPeVJaM1UzU3hodUw2YjJVQ2VmVDFaODVCMWFOa0x6?=
 =?utf-8?B?cktQUTdkVnltOExLYzBlemk5aUlkSDBYbFpHbnNQazVVWFRpYkVFbTYyeEtq?=
 =?utf-8?B?MWl0Y0kxNytXb2lNd1VMRzNRdFpXRVpHV29rNGttUzFURmhnbmFUZnJoNDJI?=
 =?utf-8?B?WHFxS0ZjeWlXWmptZ1VZV1NMRTRNWk5Lajh1cXIvZkdwbVZjZkVWYi9CK1Q4?=
 =?utf-8?B?amlUa2ZlNFI5OWEzc3E5ZC9zdXRXMTJPbm02R2l1VTNOL1gydG02T29SNUZP?=
 =?utf-8?B?UHlkb1VYODFXT1RGbDVqdUZ5cWJucE02TDNYSXYrMFY5dDMyWlVlejYxNkVT?=
 =?utf-8?B?MFQ0SGNGd1ZIUVJZamVyaUp3ckJjdFppODUrRGxXQU5ldS9yNW1ZVEJ5a2Jt?=
 =?utf-8?B?R01tZmRocnhiVUQ2TlprZDIvODE1RGoyV2tRaUlSQWZnMnQrVmZkWHpHYUQ1?=
 =?utf-8?B?ZWpMSDVvdUkxaXBvYllvazNpRUtrczJWcXgyL3FnczRURzA2RE9LemJ6N1Fq?=
 =?utf-8?B?K0lwWmtpMXFLUTJXSTl1aktOVm9NcUhwR1lwazF4Z2VhaWZXTFNYQ2RMQ3Yw?=
 =?utf-8?B?Mm12TTVweTFYcHkrOVF2eEpPK1VRcWxKRUhhUWNKVlRiQk4yK2pKem9IdUlu?=
 =?utf-8?B?RndBUFhDdmY5Yytxa3k3ZGgyNFhWeVUrbVplVjgvclJod3ZFZmF2QXIxZFlV?=
 =?utf-8?B?eVRQYUhDWGJOYnQzRllWNWNTa2U3czlWMFBCNklZWEppN29kbXBBVkhjMTdL?=
 =?utf-8?B?ODNRbXZaSWpCNlZhZHhXZkRvelpWUVVWYTVWVW9YTXdlTnpaeFQrV1hwZTZJ?=
 =?utf-8?B?cnh6eWtIR3B1NWkrdzZMcGdhSEtoQ3l5Y1N2N2N1WWYwbnRDQk4yNWRucGp6?=
 =?utf-8?B?VEZaWEM3MUwxYzhsM2t5bHNGRFdRenVpNGw4NmZCSEpDTjVSSkVSSXJ0enZj?=
 =?utf-8?B?Q2tpSTVGMTZEV0NaaDhmMWtGZlQraUlXWXlWY0pUWElKNktlaEw3bDNPdnpV?=
 =?utf-8?B?TXRQL1dreU5nY3RYalN1K2tiL3U2TjBLTzlTUjBqbFcyL25WbjBwa3dkY1RS?=
 =?utf-8?B?cGoyUXZSMVFSUmx5a1NmSXplRG9QYWkyMXpSMkFtUmdYeUxSVVVJN1VtaVh1?=
 =?utf-8?B?N1ZqNm1YdVJWaHpPdllBQ0Z1elRhdStsUzlyK1U5bE1CdDNTMEhvYVk3amhN?=
 =?utf-8?B?elB1dWpPOTZjUXE2NG9oRFRiOThDMnVSZGVYazJZL2xIQWhVc0Q2bGl0ZWNN?=
 =?utf-8?B?UzhxMnBpcTNSZnE4Ym0wS212V2l6QlB1VzVqb2d0aXJCM3Q3WTJvUGRpUGdk?=
 =?utf-8?B?TW5xSUJ3SUZsR2hYLzZ4ZFd0UnoxdS9ybUtUMWpBNWpZM21uZ2s3RkdBVjVP?=
 =?utf-8?B?alovUDNsZXRxWEJDZ1RaQnhVSDFPbG1kTlYxUi9uNE9GQWszQjZZZmI0bGJJ?=
 =?utf-8?B?bTRsK0FQdC9RVloxSkl4dVNLTFpKZVdJOHBFZ1NKSDdqQzZGMCt4QnJCSjdw?=
 =?utf-8?B?Z1J5SUxHYitGSElaSWpvY1ZwT1pZbDU0d25KcjAvWWNyN3cyMTBCTUFwM0Jj?=
 =?utf-8?B?MVhzUmdIVkNMZDdCeHFGUVN0cmRvN2lWYytIRGtpeDdUVm5qUkVGekNNMWVq?=
 =?utf-8?B?TTFYK2V1OW9IL0M5di9keFBCczdoODh4blRkQ2dFZU9YYzZUZ2MwN2kxSThz?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Si9ka3YrT2h6dUhHMnRDYVFtYlBvT0E5WHlURWowaEw3QVZNd0p2TUp2MzNK?=
 =?utf-8?B?RzZmTmo5NG10K0ozMlQ5c0tpaEVxdzZ5eDhaNHdudEptTDE1RVpKYk1yd0Fj?=
 =?utf-8?B?R2VIRW1pMnB0MzZ6QSs3NGFiZkZqa0V0Q2lEQnlFcFNFa0JlLzRIUkV4aWdj?=
 =?utf-8?B?ekp5Tmh5ck02MUY2dGtaN01Obk55ODVQS0dLWEZuNnVvbXp2UW4wek5wVFZK?=
 =?utf-8?B?alVRN0E4aUNxMVpVVzBJS3BrUlhOaGNjWDBDbUNLNHlVK3krZVdmeEJFSlU0?=
 =?utf-8?B?SFpMWXgvalF6REZWTXA4L21ERlN1VEtGV0tNUlp3MnBtTnpvOFZNUkFMTHhD?=
 =?utf-8?B?VzdCc1VVVlZncVBoc1BoMWxmNXB4WEltNThJRmV1WVFWNmo5OGFmemVkOTUy?=
 =?utf-8?B?elNGQy9YWVlKVzh0Ry9HcUVGLzM0RGlNSjhYQlRuQXBQeUFKMFdhRDVET2t2?=
 =?utf-8?B?VFNVdVEydnU0aWg4NEFlczVyS2g3dGFwVFJVZTNFeDFGYm43ZllTVk1nRHNq?=
 =?utf-8?B?N0UxcHY4bDJ2aHBIMjRra1dHSDVseS82NGZzOUx6QWRYOHlXTUxMbXQ2QnJ6?=
 =?utf-8?B?NVd6ZHdOYVVYdmU1azNaOU1henFPOWZiVTRkOVJ1TUU3RUNNeE9TY0pVZjhN?=
 =?utf-8?B?Q0ZHZ2NXYWg5SllDc0F2eW1wRUZTZWtidzQ2NTh2MG9XRE40aGV6N1FQc0tu?=
 =?utf-8?B?Y3VTSlF5ZEZtUVYyb21MZUI5cncxcjF2K3VvZ1JVMVNhR0IwdFRUUjFQT1di?=
 =?utf-8?B?NVVlNURnSnllR09uWFEzYzVwbmxJbWtMVHU0Z24vMWZXSjhsSWF2NHFjODZs?=
 =?utf-8?B?b0hSUkozc1VKZlJqaWw0QU1mWHJCOXUyNmt5K2ZGSDJ5bkNRdGhsVGFOcHFX?=
 =?utf-8?B?ODJEZVliTW1MWXJUTnQ3QmZSQmNpLzhuUzB3Tkh3dzFveUdyTzhtQWtFWUpY?=
 =?utf-8?B?Ulh3bVBpcFFUN1VEUUhoTWIweXJPMkRKWXVETStGZ2Q3UThYd1lYMnRTWG43?=
 =?utf-8?B?STNlK0w2WkVEV2h2aUJRalpaOVZWVnp5R1AvODlGaFJQME80ZnNkL3RYSlhu?=
 =?utf-8?B?U0ljMlhXek5QT3ptN0JtTCtRVFBEd2w3L1Q3QnBXTkFPS0s1WkpBNmwwdTBE?=
 =?utf-8?B?RnMzNUR0ditVNCs5cUdVNkRGcDVURnRGdEgvbXJmYUlzalFWc0YzMHZGaENq?=
 =?utf-8?B?YlJEU1NQaUg1TnQrRnFhUCtVbDJhQzBuNWI5MHlPZ2FQeWlLUGg0TGNvKzlw?=
 =?utf-8?B?ckh4UklURTFjZDNFOE8yWG4rKyttSjJwaFdyamNET3Ryek01NXNxckc2eGVD?=
 =?utf-8?B?bGpvdTdRaXRHbDV4dXRGY1ZES2NjcVJoYUkvSzVTWFZXWmNuaG53RnFzSk8r?=
 =?utf-8?B?dUFXdkJYMlN0OGZibVhpUldHa2RtbW9MUFJ3cldKQXN2M3FMZHNRWFJINDFC?=
 =?utf-8?B?STJTbmxmZzZpQm5ycFViV08xS0NmYTFBbU9GenRHZnY4aWZGMVJrTzc4UDl4?=
 =?utf-8?B?dzB2RVlPamJOMk4ydzhoVXBrQ1dPbzFHNkRDQ3lSVkNRSkpJVFBFZXE3U1Vo?=
 =?utf-8?B?c0UydUFzZzN4MDY2UWVZY1MzdzJ2VjN2WDc2S3lWZWY3UWlrRjN6dGQ1UVQr?=
 =?utf-8?B?bWpZSUJyek1sLy9ycGRXMG1ubGtEb1pESmhTVnpDRDNnT1ZRem0remJ4N2lJ?=
 =?utf-8?B?R1o5K1JaUjM5VGx6YlQ0Y1FOTWFIV3RYVVVsUzBmQ0hIZGNZQms0dUx1SWdn?=
 =?utf-8?B?VStJVXF6WW1FSk1OY1FxaHErUjBrc2hyL3ZKTlRnZm9DVnhlSHdmZmRvSENp?=
 =?utf-8?B?cm9RMWo4dHU1R0Q0cDE5R1owNU1GWndXMmp0RVQ4NjVBeWpkK3pmWVFZcUMz?=
 =?utf-8?B?cnBnUWJ2OVZiL1F4YWdmVkdMZXJtY1A0ZXdRL2szNlpKazJuUjVHb2VjbXFE?=
 =?utf-8?B?YVNJSkpmREtEeFJvL1dYSlZlZ3lObzlTQU5mNzJhYy9NaklGWjRKcm9Ia1dJ?=
 =?utf-8?B?SFZubi9QcENoZitxR0ZDUnE5dXlNdTJQYmdNRDRoaE1YSXU5MjYvVVd6dHRm?=
 =?utf-8?B?cmxUdjVMUEVQVVRnUkxCTXgremxMVTFJM0dPTWg1RnpCZzliSmwyV09STmk3?=
 =?utf-8?B?ZDdEVzNjYWxiTUVBZm9HbnZYRHNNRzVpc01LQXVIQzlvWGEwakt4dU9FZEZO?=
 =?utf-8?B?UFgzSDJjbjFNSDc4bFpYRUx4bkp0UUV3WHdhNkRWbWZaM0ZFcnUveWdxc0xS?=
 =?utf-8?B?QStxcU1YV1FsMFpmUG5oYWhUTUhLUGVaQVBlbUVyNXd5TXNFTTZ0d0o4Sms0?=
 =?utf-8?B?R21sRXhIRC9JckhrdUFBOFROcElGQzgrWnhYbHBHYUdDbHlEd1dLczFnZG5T?=
 =?utf-8?Q?eCtM2TjFxTvnwX6PU8VmORYUhT9qVXd2n9YtL5izrv+2m?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	RSg8COh8KMv9zmm6BiyCSzOIU9DuX+9ZR52u8GcfYMhDSivFvwlP/muheXasVYHms+DmrOJHfOGSDOfvBbKvboM3G8gODI/6RXnwWvxCOrsRBP50vgIU/Mv3ovVNVJj1T1ajgr4COO3fweeFru+3jzCqK6PdUC1U7kYJ++6qDI6D1H4T4NCiYqVAEQlAlQG28IixWJlg7vvc6hlgbGqjxXVzf4d2Y8Ey4wr0v7MsFYYXJAr3g34Cgxh+ib/SCLeZp67h/7t15UbU2INhxGetp7JS6O8viSSkUOwqOxhehj1107FrLcp3UCwhTrW55DeN5tOLsm8kxQHCg60Mg6uMTX0J9Ef1IAaoWZ8ehdTiMO+0kvFhHpV/SEt3+nerwu92CzmXQc8g2vLWnuDQtG9avF3+cGKWqGfAUvKtbJW078O6DsB6KiiUf7IfFKKT3yxn7G4avUY4F1AIyg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d78df0b-a920-44a6-a61b-08db7d90494f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 19:44:46.4438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6ODCCFmcmrDfb3fQBoPrTBqeCORdzcpbZzQ5vXXxqCzmSp7YtrZYkWXM6QmjfEc47Z2Zx8mNcjbZU/4JKtqaiF0syAtqjgOxrtBdvQi4bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5542
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_10,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050179
X-Proofpoint-GUID: BkVD1xxSCy528DZdHFEVJL01V5VeAPCj
X-Proofpoint-ORIG-GUID: BkVD1xxSCy528DZdHFEVJL01V5VeAPCj
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.
 wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/5/23 11:23, Eric DeVolder wrote:
> 
> 
> On 7/5/23 10:49, Nathan Chancellor wrote:
>> Hi Eric,
>>
>> On Wed, Jul 05, 2023 at 10:20:03AM -0400, Eric DeVolder wrote:
>>> The kexec and crash kernel options are provided in the common
>>> kernel/Kconfig.kexec. Utilize the common options and provide
>>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>>> equivalent set of KEXEC and CRASH options.
>>>
>>> NOTE: The original Kconfig has a KEXEC_SIG which depends on
>>> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
>>> dependency (using the strategy outlined in this series, and other
>>> techniques) results in 'error: recursive dependency detected'
>>> on CRYPTO.
>>>
>>> Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
>>> dependency was introduced with [git commit below] and in fact was not
>>> necessary, since s390 did/does not use mod_check_sig() anyway.
>>>
>>>   commit c8424e776b09 ("MODSIGN: Export module signature definitions")
>>>
>>> MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
>>> SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
>>> MODULE_SIG_FORMAT does not hurt."
>>>
>>> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
>>> from KEXEC_SIG. Still results in equivalent .config files for s390.
>>>
>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>> ---
>>>   arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
>>>   1 file changed, 19 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
>>> index 5b39918b7042..5d4fbbfdd1cd 100644
>>> --- a/arch/s390/Kconfig
>>> +++ b/arch/s390/Kconfig
>>> @@ -244,6 +244,25 @@ config PGTABLE_LEVELS
>>>   source "kernel/livepatch/Kconfig"
>>> +config ARCH_DEFAULT_KEXEC
>>> +    def_bool y
>>> +
>>> +config ARCH_SUPPORTS_KEXEC
>>> +    def_bool y
>>> +
>>> +config ARCH_SUPPORTS_KEXEC_FILE
>>> +    def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
>>> +
>>> +config ARCH_HAS_KEXEC_PURGATORY
>>> +    def_bool KEXEC_FILE
>>> +
>>> +config ARCH_SUPPORTS_CRASH_DUMP
>>> +    def_bool y
>>> +    help
>>> +      Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
>>> +      This option also enables s390 zfcpdump.
>>> +      See also <file:Documentation/s390/zfcpdump.rst>
>>> +
>>>   menu "Processor type and features"
>>>   config HAVE_MARCH_Z10_FEATURES
>>> @@ -482,36 +501,6 @@ config SCHED_TOPOLOGY
>>>   source "kernel/Kconfig.hz"
>>> -config KEXEC
>>> -    def_bool y
>>> -    select KEXEC_CORE
>>> -
>>> -config KEXEC_FILE
>>> -    bool "kexec file based system call"
>>> -    select KEXEC_CORE
>>> -    depends on CRYPTO
>>> -    depends on CRYPTO_SHA256
>>> -    depends on CRYPTO_SHA256_S390
>>> -    help
>>> -      Enable the kexec file based system call. In contrast to the normal
>>> -      kexec system call this system call takes file descriptors for the
>>> -      kernel and initramfs as arguments.
>>> -
>>> -config ARCH_HAS_KEXEC_PURGATORY
>>> -    def_bool y
>>> -    depends on KEXEC_FILE
>>> -
>>> -config KEXEC_SIG
>>> -    bool "Verify kernel signature during kexec_file_load() syscall"
>>> -    depends on KEXEC_FILE && MODULE_SIG_FORMAT
>>> -    help
>>> -      This option makes kernel signature verification mandatory for
>>> -      the kexec_file_load() syscall.
>>> -
>>> -      In addition to that option, you need to enable signature
>>> -      verification for the corresponding kernel image type being
>>> -      loaded in order for this to work.
>>> -
>>>   config KERNEL_NOBP
>>>       def_bool n
>>>       prompt "Enable modified branch prediction for the kernel by default"
>>> @@ -733,22 +722,6 @@ config VFIO_AP
>>>   endmenu
>>> -menu "Dump support"
>>> -
>>> -config CRASH_DUMP
>>> -    bool "kernel crash dumps"
>>> -    select KEXEC
>>> -    help
>>> -      Generate crash dump after being started by kexec.
>>> -      Crash dump kernels are loaded in the main kernel with kexec-tools
>>> -      into a specially reserved region and then later executed after
>>> -      a crash by kdump/kexec.
>>> -      Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
>>> -      This option also enables s390 zfcpdump.
>>> -      See also <file:Documentation/s390/zfcpdump.rst>
>>> -
>>> -endmenu
>>> -
>>>   config CCW
>>>       def_bool y
>>> -- 
>>> 2.31.1
>>>
>>
>> I just bisected the following build failure visible with 'ARCH=s390
>> allnoconfig' to this change as commit 842ce0e1dafa ("s390/kexec:
>> refactor for kernel/Kconfig.kexec") in -next.
>>
>>    arch/s390/kernel/machine_kexec.c:120:37: warning: 'struct kimage' declared inside parameter 
>> list will not be visible outside of this definition or declaration
>>      120 | static bool kdump_csum_valid(struct kimage *image)
>>          |                                     ^~~~~~
>>    arch/s390/kernel/machine_kexec.c:188:34: warning: 'struct kimage' declared inside parameter 
>> list will not be visible outside of this definition or declaration
>>      188 | int machine_kexec_prepare(struct kimage *image)
>>          |                                  ^~~~~~
>>    arch/s390/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>>    arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined type 'struct kimage'
>>      192 |         if (image->type == KEXEC_TYPE_CRASH)
>>          |                  ^~
>>    arch/s390/kernel/machine_kexec.c:192:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in 
>> this function); did you mean 'KEXEC_ON_CRASH'?
>>      192 |         if (image->type == KEXEC_TYPE_CRASH)
>>          |                            ^~~~~~~~~~~~~~~~
>>          |                            KEXEC_ON_CRASH
>>    arch/s390/kernel/machine_kexec.c:192:28: note: each undeclared identifier is reported only once 
>> for each function it appears in
>>    arch/s390/kernel/machine_kexec.c:196:18: error: invalid use of undefined type 'struct kimage'
>>      196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>>          |                  ^~
>>    arch/s390/kernel/machine_kexec.c:196:28: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in 
>> this function); did you mean 'KEXEC_ARCH_DEFAULT'?
>>      196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>>          |                            ^~~~~~~~~~~~~~~~~~
>>          |                            KEXEC_ARCH_DEFAULT
>>    In file included from arch/s390/include/asm/thread_info.h:31,
>>                     from include/linux/thread_info.h:60,
>>                     from arch/s390/include/asm/preempt.h:6,
>>                     from include/linux/preempt.h:79,
>>                     from arch/s390/include/asm/percpu.h:5,
>>                     from include/linux/irqflags.h:18,
>>                     from include/linux/rcupdate.h:26,
>>                     from include/linux/rculist.h:11,
>>                     from include/linux/pid.h:5,
>>                     from include/linux/sched.h:14,
>>                     from include/linux/ratelimit.h:6,
>>                     from include/linux/dev_printk.h:16,
>>                     from include/linux/device.h:15,
>>                     from arch/s390/kernel/machine_kexec.c:9:
>>    arch/s390/kernel/machine_kexec.c:200:48: error: invalid use of undefined type 'struct kimage'
>>      200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>>          |                                                ^~
>>    arch/s390/include/asm/page.h:186:58: note: in definition of macro '__va'
>>      186 | #define __va(x)                 ((void *)(unsigned long)(x))
>>          |                                                          ^
>>    arch/s390/include/asm/page.h:194:38: note: in expansion of macro 'pfn_to_phys'
>>      194 | #define pfn_to_virt(pfn)        __va(pfn_to_phys(pfn))
>>          |                                      ^~~~~~~~~~~
>>    arch/s390/include/asm/page.h:199:33: note: in expansion of macro 'pfn_to_virt'
>>      199 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
>>          |                                 ^~~~~~~~~~~
>>    include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>>       64 | #define page_to_pfn __page_to_pfn
>>          |                     ^~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:200:30: note: in expansion of macro 'page_to_virt'
>>      200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>>          |                              ^~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c: At top level:
>>    arch/s390/kernel/machine_kexec.c:207:35: warning: 'struct kimage' declared inside parameter 
>> list will not be visible outside of this definition or declaration
>>      207 | void machine_kexec_cleanup(struct kimage *image)
>>          |                                   ^~~~~~
>>    arch/s390/kernel/machine_kexec.c: In function '__do_machine_kexec':
>>    arch/s390/kernel/machine_kexec.c:243:40: error: invalid use of undefined type 'struct kimage'
>>      243 |         data_mover = page_to_phys(image->control_code_page);
>>          |                                        ^~
>>    arch/s390/include/asm/page.h:189:35: note: in definition of macro 'pfn_to_phys'
>>      189 | #define pfn_to_phys(pfn)        ((pfn) << PAGE_SHIFT)
>>          |                                   ^~~
>>    include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>>       64 | #define page_to_pfn __page_to_pfn
>>          |                     ^~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:243:22: note: in expansion of macro 'page_to_phys'
>>      243 |         data_mover = page_to_phys(image->control_code_page);
>>          |                      ^~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:244:36: error: invalid use of undefined type 'struct kimage'
>>      244 |         entry = virt_to_phys(&image->head);
>>          |                                    ^~
>>    In file included from arch/s390/kernel/machine_kexec.c:27:
>>    arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>>      252 |                    unsigned long, image->start,
>>          |                                        ^~
>>    arch/s390/include/asm/stacktrace.h:101:32: note: in definition of macro 'CALL_LARGS_2'
>>      101 |         long arg2 = (long)(t2)(a2)
>>          |                                ^~
>>    arch/s390/include/asm/stacktrace.h:216:9: note: in expansion of macro 'CALL_LARGS_3'
>>      216 |         CALL_LARGS_##nr(__VA_ARGS__);                                   \
>>          |         ^~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>>          |         ^~~~~~~~~~
>>    In file included from include/linux/irqflags.h:15:
>>    arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>>      252 |                    unsigned long, image->start,
>>          |                                        ^~
>>    include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
>>       11 |         typeof(x) __dummy2; \
>>          |                ^
>>    arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>>      136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>>          |         ^~~~~~~~~~~~~~~~
>>    arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>>      219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>>          |         ^~~~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>>          |         ^~~~~~~~~~
>>    include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
>>       12 |         (void)(&__dummy == &__dummy2); \
>>          |                         ^~
>>    arch/s390/include/asm/stacktrace.h:134:9: note: in expansion of macro 'typecheck'
>>      134 |         typecheck(t, a)
>>          |         ^~~~~~~~~
>>    arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>>      136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>>          |         ^~~~~~~~~~~~~~~~
>>    arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>>      219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>>          |         ^~~~~~~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>>          |         ^~~~~~~~~~
>>    arch/s390/kernel/machine_kexec.c: At top level:
>>    arch/s390/kernel/machine_kexec.c:278:27: warning: 'struct kimage' declared inside parameter 
>> list will not be visible outside of this definition or declaration
>>      278 | void machine_kexec(struct kimage *image)
>>          |                           ^~~~~~
>>    arch/s390/kernel/machine_kexec.c: In function 'machine_kexec':
>>    arch/s390/kernel/machine_kexec.c:280:18: error: invalid use of undefined type 'struct kimage'
>>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>>          |                  ^~
>>    arch/s390/kernel/machine_kexec.c:280:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in 
>> this function); did you mean 'KEXEC_ON_CRASH'?
>>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>>          |                            ^~~~~~~~~~~~~~~~
>>          |                            KEXEC_ON_CRASH
>>    arch/s390/kernel/machine_kexec.c:280:66: error: passing argument 1 of 'kdump_csum_valid' from 
>> incompatible pointer type [-Werror=incompatible-pointer-types]
>>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>>          |                                                                  ^~~~~
>>          |                                                                  |
>>          |                                                                  struct kimage *
>>    arch/s390/kernel/machine_kexec.c:120:45: note: expected 'struct kimage *' but argument is of 
>> type 'struct kimage *'
>>      120 | static bool kdump_csum_valid(struct kimage *image)
>>          |                              ~~~~~~~~~~~~~~~^~~~~
>>    cc1: some warnings being treated as errors
>>
>> I don't think this change is equivalent for s390, which had
>>
>>    config KEXEC
>>        def_bool y
>>        select KEXEC_CORE
>>
>> but it is now the equivalent of
>>
>>    config KEXEC
>>        bool "Enable kexec system call"
>>        default y
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
>> @@ -37,10 +37,10 @@ CFLAGS_unwind_bc.o    += -fno-optimize-sibling-calls
>>   obj-y    := head64.o traps.o time.o process.o earlypgm.o early.o setup.o idle.o vtime.o
>>   obj-y    += processor.o syscall.o ptrace.o signal.o cpcmd.o ebcdic.o nmi.o
>>   obj-y    += debug.o irq.o ipl.o dis.o diag.o vdso.o cpufeature.o
>> -obj-y    += sysinfo.o lgr.o os_info.o machine_kexec.o
>> +obj-y    += sysinfo.o lgr.o os_info.o
>>   obj-y    += runtime_instr.o cache.o fpu.o dumpstack.o guarded_storage.o sthyi.o
>>   obj-y    += entry.o reipl.o relocate_kernel.o kdebugfs.o alternative.o
>> -obj-y    += nospec-branch.o ipl_vmparm.o machine_kexec_reloc.o unwind_bc.o
>> +obj-y    += nospec-branch.o ipl_vmparm.o unwind_bc.o
>>   obj-y    += smp.o text_amode31.o stacktrace.o abs_lowcore.o
>>   extra-y                += vmlinux.lds
>> @@ -66,6 +66,7 @@ obj-$(CONFIG_CRASH_DUMP)    += crash_dump.o
>>   obj-$(CONFIG_UPROBES)        += uprobes.o
>>   obj-$(CONFIG_JUMP_LABEL)    += jump_label.o
>> +obj-$(CONFIG_KEXEC_CORE)    += machine_kexec.o machine_kexec_reloc.o
>>   obj-$(CONFIG_KEXEC_FILE)    += machine_kexec_file.o kexec_image.o
>>   obj-$(CONFIG_KEXEC_FILE)    += kexec_elf.o
>>
>> Otherwise, the prompt for KEXEC could be made conditional on some ARCH
>> symbol so that architectures can opt out of it.
> 
> Nathan,
> Thanks for looking at this! I've been receiving broken build info from Andrew's
> machinery. I've investigated and learned that CRASH_DUMP can be specified without
> KEXEC. I also realized that s390 originally had this right, but in the conversion
> I did, I got it wrong.
> 
> This v4 series corrects that by having CRASH_DUMP select KEXEC.
> 
> The new KEXEC looks like:
> 
> config KEXEC
>      bool "Enable kexec system call"
>      default ARCH_DEFAULT_KEXEC
>      depends on ARCH_SUPPORTS_KEXEC
>      select KEXEC_CORE
> 
> which appears to be equivalent, I think the CRASH_DUMP issue is the root problem.
> 
> In a separate thread with Arnd Bergmann wrt/ arm build issues, he identifies
> similar problems&solutions as you did, but points out that CRASH_DUMP might still
> need some refinement; I'm looking into that.
> 
> The goal really is to make this series to result in equivalent configs as before,
> but there are small problems in the conversion that are showing up that I'm working.

Nathan,
Thanks again for looking at this! Your feedback made me realize that relying on
'olddefconfig' for equivalence has proven to be inadequate. As a result, I've
retooled my testing environment to use olddefconfig, allnoconfig and allyesconfig.
That enhancement has revealed a small number of issues, which I have now fixed.

I'll be posting a v5 once I've worked through all architecture results.

Thanks again!
eric

> 
> 
>>
>> As an aside, is this intended for the 6.5 merge window? If not, it
>> shouldn't be in -next at this point, I was surprised to see new broken
>> builds.
>>
>> Cheers,
>> Nathan
> I'm not going to pretend I know when this will make it...
> eric
