Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D8634331
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 19:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGsbG3QMCz3dxG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 05:04:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=X2h2k8ud;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D74UoiKV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGsZJ0N46z3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 05:03:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=X2h2k8ud;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D74UoiKV;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NGsZH6qkGz4wgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 05:03:35 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NGsZH6n8Fz4xN4; Wed, 23 Nov 2022 05:03:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=X2h2k8ud;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D74UoiKV;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NGsZH4MBzz4wgv
	for <linuxppc-dev@ozlabs.org>; Wed, 23 Nov 2022 05:03:35 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMHhmR9027281;
	Tue, 22 Nov 2022 18:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Nq8kDU7863zOJwIxA2uKNpcDLqccFLNoz116/DsuEFM=;
 b=X2h2k8udUwPcMchMbIO5REwa018l4Y8L2//49rWjjyKgOUJpHcGLC5R8JXMb50wH34GY
 m4lHXP7MEmusSMJjITJsAXZYRe8Ku2CX2vnU4qRjwq/L0+KFwpPoKm3Sx2gpAUYMXyib
 wSFRG/GjN0uMGW3FiVLWdP3+lVdtqYwN3DV+JzKEizFP6T/vCWJSGursKVDJh1urW8UO
 9k72YSMOMwI/CsB6r8tgkJzY4h6TyjlrAukpUoq2NwWr9TUqzLOu+R/Ex7rZDAoQwRf/
 c7A4o/z0LRT6TeAzIyq+IYURbehHwFlD9e7aKD3tF5Bcmkzyti6aTrsoiLvGi5nP4odg /A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m0edq3n3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 18:03:23 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2AMGoMBK039562;
	Tue, 22 Nov 2022 18:03:22 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kxnkc1u1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 18:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVaCY32Wv/YbnA9whppYF4ktXwrTxfsxRx6xt+q2n1KRoc0Q5PaTzymA85Adftm++e36wyCxCOEp8OebKix6HMrEYHvFoK505HNlmoKDOwgByYMxX85Qbj1+I0h6cvJvClRq4hv1qKNZ0x7n5M5U0L4EvWyNi3rx0AVjyf3Ua1rdUU7HYZWNPDE4CRSAKoGenmq45KSe/A44WxoEnxy8fQFiJ0NB8BCb5I5mEVBukpzbTqOQvbLj8fHoy7asUU0x2h85WffC+cegYU39mpGnO0UOqM5fgybgXRLpJsazpiQVnQOy51bpUYhBvWOLUL5DORsW4UCj6ofqKPdc1Z5YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq8kDU7863zOJwIxA2uKNpcDLqccFLNoz116/DsuEFM=;
 b=E+lqXrTn3u7dFcRW4TB7xmAfaqKYoyg/94ZohjiAdBZpDVjmmQgtv3QiobLfqqPm9q6e4wYo09mh3dBmwL5Eh38WpitTK/ecCM4dSWIiS8kUPOSQQdb0PESYL6anRXx3fFjOd8I4SaGafWj7Fv00HjNbv2LPsDFSssnPE1SwmqUrRIB+qnN/DQHEw4kI5tMrYIJilntHZaeJ11XCGR+tgP4bd6mpiIE9nyhMvoQYepmiuaAcMK/eNd9lyL1VABzX8YA0ZZQG5CYxY4j6EQp3se/U+RRt3NVaOjGowcHY4FjXAz7hZ3fZfD4ZrILite8qT8RqgWBhT/D8SlqFwyREfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq8kDU7863zOJwIxA2uKNpcDLqccFLNoz116/DsuEFM=;
 b=D74UoiKVA9QAF4XJQo5YWav+5sTFzf9kpu9BJ8PmcCQIr/92mGOwBhquGT/vYQZo38tewFS6weZIZlUsYycqBHMQE5miKJg3xHcjhdXi7WDveFjq09pWCcGjmsP42hSJyU/1MaqWP4i4GmbpSwLTwSVqfM/oIch0j/P/ad37xgs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH7PR10MB6333.namprd10.prod.outlook.com (2603:10b6:510:1b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 18:03:20 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7%8]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 18:03:20 +0000
Message-ID: <c1b0fc60-c458-d0b0-9c33-17218d3a1226@oracle.com>
Date: Tue, 22 Nov 2022 12:03:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 5/6] crash: forward memory_notify args to arch crash
 hotplug handler
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
 <20221120232508.327554-6-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20221120232508.327554-6-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH7PR10MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3308b8-9a5e-4fce-5222-08daccb3d705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9rnZ8t+KWU5yDDH0ntnsnKOgTSwYVTdZOZnuEsnBNq/jrbDO5ZYOosLpgjgqJjzpeJhK2bEcf0gDIyMA4usRtEpKM0Ky1OiOjti19xPl9TfT6fWiBR7RxOfUywkwSiZnxMuNYRKH6r5MgPrR7ik5uLaxcMZq5WaQI+ptFsAT3R/uI13hpURhoXc5zdM/B4Hp7lgD4PAGBMrVXUM+LcoiQd+rI3XKdDaWLE5SpXVzavW9DMgFdFHGqXym82D8cRt9+98N5RRRS6Sp9aTmczgzDhDkEwJ/1fCMRLOE2qFa+4KHsxh0B8ZPJZ8M8rb1FmBc67/BbO/lne88yhh6w3UapBU1SvCk9ir0BsoYmWlQSlbO04wVqeLtk1twzBf1wj/NL6HZgizmP5/5lRWPxlJIE7JcnhjvmRE7i3aeHCeFTrywOX6bp8Ht7cl7jVN3FjGCyE5bf/LDqAH576PTS6QfU9GXMvKelLSE/g69kkpbRqmSfWERG/4AGFLHmIT3r6snTy5bXAL1pAcBjGbu2IQNal7FvOUJoVWEfA26nPWPFA2OcNo5X065q0R7geizCuFVyxLP+sebJXkNaErgec6ByYlpGXRlg1cda67RTrf3FPrhI+m5+KyFFuoqEmOp4hltl6lC2rv0p/hYPGcLEPfgb0n6NeK3tJX0C0H5QnNrzWXSrpUiRDxlDti518SZBWr1w6oKsF5pa2OYCspK6FeExIwKTqr3eaA/uitJmpDRPBc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(83380400001)(31686004)(2906002)(2616005)(66946007)(186003)(66476007)(41300700001)(86362001)(31696002)(36756003)(66556008)(38100700002)(6506007)(53546011)(6512007)(5660300002)(4326008)(8936002)(8676002)(478600001)(6666004)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MTBXSHF0Q2JYUmk3YW4welRVKzMwcGlGUHVkZFFZSmw1MXJOc2lMSy9yTTdF?=
 =?utf-8?B?WHlLR0xBTVFmRTZJdmU2WFZ2RzBrS1JHVnJqVEZKcERXemtENElDMlZadlIv?=
 =?utf-8?B?NlVFRFZXQnFTNjVWcEdISHI3UmZjVEFGb3VvV3gxNGRpb3B5N09qZHpCZ0po?=
 =?utf-8?B?ZmN1clN1dzBweHJGK0pPWm5aeVBrR0UxcVYwNXdFMWEyKzV6a014bFpvT1ZQ?=
 =?utf-8?B?UHZUUlNvdENueElMMkVkRDgvNXlKQVBaWDlTQ2Mrd3lsMDZ1TERld1JLVmVm?=
 =?utf-8?B?U0JSbGpQNDV1eDdLVnRzV3VUYnQ1SVZzTFpQQ2kyem1TRUJmWG1JVHluaG9K?=
 =?utf-8?B?VEgxZ0Z6VUtlNnJPVWpUVUNITU1kekl3d3FaSGNmdmp5UkxWK2xrQnlDNkRz?=
 =?utf-8?B?UDIzZTAwbFpZL2RaTURCeXhXWG9aellzM3d0L3d1ZlRBbUw2MmM0YmV3SzVh?=
 =?utf-8?B?dmplaXJLcHZQLzB2WWplay9OZm9XUGNJWFN5K2dYSDNMS3pjdVU1Y0krVFJD?=
 =?utf-8?B?d2llcDN0Vi9wZURYbGIyTjNzUU5UZXpFd0Y0cUlSUHViRCszem5zZHQ3bW9H?=
 =?utf-8?B?VDdtMTRqcHgvQkhQSVFwOWlaajB1ZUhTSkZJU3hXZlR3RWh5d3QvZzN5OEM0?=
 =?utf-8?B?V01KYkZGa2lwNXN2L084ZVVINDh5eGt6bzNya3dNeGtCa0ZiS2pDZzB2eFhL?=
 =?utf-8?B?T0dGcGZRSEk4SXNieU1QVFJ5L2grc3VwR2RIVEcxMFRpT1VjeDRHYXlpVWhz?=
 =?utf-8?B?T28zZXlQMkdscG8wdnRnazluVGtTRm10UDArMkw0YnRzOTh4SGhPZVUyVTM5?=
 =?utf-8?B?QW05M0M3WG9LYWtmSkJMUldQbnFmaXRhL1U1bzQrODlUWXNFdG16SjhqMkNM?=
 =?utf-8?B?RkErWE5GR3ZyMWUrODlTWjNHNnhkKzA0U1RwdmpmUzNtaCtaUlE3QTkvTGM1?=
 =?utf-8?B?a0pyZVlsQm14dFZrN1RxMytydXZlam1TdWRjamhHSFFSQURpM2JwM0t0QVVU?=
 =?utf-8?B?bUFKQ0FUSWpMTVRXS240RDVmdkFhWCt3VlB5NW9DL3VZSEJXaDQySGxBRzlz?=
 =?utf-8?B?QVE2NDcycWZjd3JkbVFEbkFtTWsrMlJhb2NOa3RodGdWMjNKdHNWbjBGVVNP?=
 =?utf-8?B?WG9NckhGODh5WS81TnZOVSthaERlbm5iVStobjN6MmJNa0F5djl1RUJ0eDJB?=
 =?utf-8?B?bnlrUVBtM0JRZXNmUE1tWkROZDhIdk9xTnB5S1BHRWJtQXVJc25GR01iUlFy?=
 =?utf-8?B?VVo5aWNQR25jdTVZWmlkOFJRSUk3ZUFUSnlJU3RlbHV2MUJtSks2WWJhRTdL?=
 =?utf-8?B?Y3ZrdEp4YnVQVTVTYkE1SFRPbW54QXBSK24vYnlvZndWSTZyZEtpMEI0YUVS?=
 =?utf-8?B?dEU0ejRGZEgrSEcvUjNjMldJNUgzVzA5VVplVXRpRGZPSFIrZ0Q3YlA4Q1pI?=
 =?utf-8?B?dk5UK0c1MjAvbjRGR3FpMUhMekp0eDdoUjNOUHhZWmtVN3R1V3BodHl5bThI?=
 =?utf-8?B?Q1ljTXA5NjBoNC9IK2lXemlwT1oxVmtQVkZBVlp2UVBWRkRham1FK1kvTU44?=
 =?utf-8?B?UmRyQ1dnelBxMGsyM21DNlJLRkdaT3ppTFoybE01djQ4dUpheVFBd0VzeFI4?=
 =?utf-8?B?Y1h4YnBmdUo4UXB4Y2ZZT21TVFpPT2pneURTSnFKdmdqa1Nic25aUzY3d1hT?=
 =?utf-8?B?Q0lINjhwRTcvZDBlZzVkbWRkQ1N4RlZjMUw4TVZ4R1ZISXNBcWdrMTRvdUp4?=
 =?utf-8?B?Z1dxOTUwZ0ZYKzNhbTFmRVpkZHFxQlJDKzBKdkQrS2tsaWVITm8rVlk1WjhH?=
 =?utf-8?B?Q0JCSVc2T2M0MmtTbUxJeE1FREhPVEM0bWZuNU9xRndOZTFhdlVhTURRRmxY?=
 =?utf-8?B?dEt3S0ZtOE4rNkFkS0JtcW94c3VVTHU0eCtLN2VHZGxJT3RhNFhDbVhBSTNQ?=
 =?utf-8?B?VjNtclBjKzMvNS81UXRMeHRpc1AwM2VuY3BvTDBldHM1WmJTZXJPcWQwKzJR?=
 =?utf-8?B?U3RFRkVsVittM2dNQ0VwSzlKWElVTFlRNWNHRXVtT3FsaUJCcGo1cllGaEc5?=
 =?utf-8?B?R1RLK3NySENLdEZrYVpPWXZvSGh3UGR3TkhBYldmbCtOajRCeThERkMyMURo?=
 =?utf-8?B?d3BHckx4UVQ3Y2Nya3hUdnN4d3Q3cXNDSnNQTVZyS25COWptWDJtUnJyaHFN?=
 =?utf-8?Q?cMVFXB+JfMG6TiYWduUuVvo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?RGdPdVZuR1ZSVDNlV1pkSUJjRWNJMHlaU3htZ09QVEJaVHI1VGo4SEc4Qisv?=
 =?utf-8?B?VllETEM5UzVjaTMxVTg2MkVHaFRuRkJKTWhiYXI4Z1djUXhBY0VKZjZaZnFy?=
 =?utf-8?B?YXNRcGVPKzl2bitRNWI0Z2VBdEhRSGdMeUtWZmdUbkdleTZKVkJXVkZwejdY?=
 =?utf-8?B?ZzVWT1JaUWp2S3Ivd2kwNzhUeDFwSGFodnRUbmRJOHRQME5mZWQrUjZXWFRO?=
 =?utf-8?B?VTlYUC9taEtNd013U2licUN2b200Z1p5S0ZmdytEMVJsUmxxRHl2OFYxSmdk?=
 =?utf-8?B?Uzc4ZHhBODZSVDZJUGlMRzFFYWZxck51TURYQ3o4aXpQTVdVcjR6ekF6THVK?=
 =?utf-8?B?aXVERUJnNlRvWU85bnNVaWE5b21sTks4OUJ6V3VidGFnUTduRGxCaDdvR2k5?=
 =?utf-8?B?NW0yeXlxWUVCdEZEWFFCMnJ2TlcvK2hrby8rbDlGekpjejNGUHZxejdhUy8x?=
 =?utf-8?B?TFhBcnZFaU1DdEJvdmtrdk9tNm13NjZmU0R4VnVTWWxkQWNtSXBlYkNOamxp?=
 =?utf-8?B?UXJPVktUck16N1kwZFlwZUx1L2wyZ2x4SlpRWDRjeVZPcDFYTERYRHpsWTVZ?=
 =?utf-8?B?SWV4MUoreGtzV0p5S1Q3N1l5aG9JQlE3WS95U01HUkYyM3U3UkcyVkU3eGR0?=
 =?utf-8?B?ZVFwd2t3WS93R1dIOFhROG01MjBYZXltdFFsMkhVSmVLbWxRM0lxcXlWaXB2?=
 =?utf-8?B?V0htOTdEMCtWUjJiVlFNeUQ2ZzhPMXpLMTBoZ2FBZEhkaEhQeFhCelpIaXYw?=
 =?utf-8?B?cmN4YUliK3U3WWkrNnRwQnpxa0JOVFowUjhjV2haTWo3NVpXdlNWU2R4NStO?=
 =?utf-8?B?YmZYcDFUbC9xUncraVZReGVUYTJlM0ozazlGZ3Y5N0tOLzRjSGdQUnRBY1Qy?=
 =?utf-8?B?ZWJPQThPdjZXVHczZDFYeHhjSmVJN3JhY3BlNXFQeHNMMUEwOVlKN1hLb0VP?=
 =?utf-8?B?UXl6elZHNVpZWGJZcWVrN3dDY1hObXliRHF3MGdYNVE0cTZGUFhPYzRIQWR0?=
 =?utf-8?B?ZTV5b1pTREZrOGx3Q1JZeWhOZExUaUM5K2YrcTFvTU05S2VWamp2eGpOK29p?=
 =?utf-8?B?VTUrTWNCNEVMYmlpbWRpMnlPU3F3U1hxVzJ2dVQvbXc3VjdhNzVmZXo2Ui9Q?=
 =?utf-8?B?LzdSaDRFYmRHQmhhcnBjYXZwakJad0VrZkRyWk5oWE9BcXhrK2hIbjhkQW1s?=
 =?utf-8?B?TXNOOGxUTWhKOFY3a1NTOG1zQmNtdHorVWVicFlSSmVYKzBsM04zd3BVaDRj?=
 =?utf-8?B?bHg0aFk5TzV2N3BjQk5oUWFWY3l2Unhsb2RVWVh4dFhpcnh3NVE3dzdkZHFz?=
 =?utf-8?Q?Zs4Q8KlzUClIRtEZ6R55AKLhpI3wdNNuTb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3308b8-9a5e-4fce-5222-08daccb3d705
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 18:03:20.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNYTAOno9iyF+SOQc+qdgVSZv+wceWQtwOixztt3oaDf1Q8iEuP9+W2gO1uRy6VFkekBdTLSXxyYQKvSxHEj0+6tfSa18jA3ucjK3XseRLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6333
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_11,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220139
X-Proofpoint-GUID: j1VjCDjzcbYJwKtuW1WPZbRpMfM8V2Pm
X-Proofpoint-ORIG-GUID: j1VjCDjzcbYJwKtuW1WPZbRpMfM8V2Pm
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/20/22 17:25, Sourabh Jain wrote:
> The way memory hot remove is handled on PowerPC, it is hard to update
> the elfcorehdr without memory_notify args.
> 
> On PowePC memblock data structure is used to prepare elfcorehdr for kdump.
> Since the notifier used for memory hotplug crash handler get initiated
> before the memblock data structure update happens (as depicted below),
> the newly prepared elfcorehdr still holds the old memory regions. So if
> the system crash with obsolete elfcorehdr, makedumpfile failed to collect
> vmcore.
> 
> Sequence of actions done on PowerPC to serve the memory hot remove:
> 
>   Initiate memory hot remove
>            |
>            v
>   offline pages
>            |
>            v
>   initiate memory notify call chain
>   for MEM_OFFLINE event.
>   (same is used for crash update)
>            |
>            v
>   prepare new elfcorehdr for kdump using
>   memblock data structure
>            |
>            v
>   update memblock data structure
> 
> How passing memory_notify to arch crash hotplug handler will help?
> 
> memory_notify holds the start PFN and page count, with that base address
> and size of hot unplugged memory can calculated and same can be use to
> avoid hot unplugged memory region to get added in the elfcorehdr.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/kexec.h |  2 +-
>   arch/powerpc/kexec/core_64.c     |  3 ++-
>   arch/x86/include/asm/kexec.h     |  2 +-
>   arch/x86/kernel/crash.c          |  3 ++-
>   include/linux/kexec.h            |  3 ++-
>   kernel/crash_core.c              | 16 +++++++---------
>   6 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index a4c0a035cb407..f32126a22f6ed 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -109,7 +109,7 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>   int machine_kexec_post_load(struct kimage *image);
>   #define machine_kexec_post_load machine_kexec_post_load
>   
> -void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
> +void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action, void *arg);

Be aware in the latest patch series, the hp_action argument was removed. You'll need to introduce it 
again since ppc needs it.

>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>   
>   #endif
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 3dea1ce6b469c..6803d7e352a96 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -575,11 +575,12 @@ int update_cpus_node(void *fdt)
>    * arch_crash_hotplug_handler() - Handle hotplug kexec segements changes FDT, elfcorehdr
>    * @image: the active struct kimage
>    * @hp_action: the hot un/plug action being handled
> + * @arg: struct memory_notify data handler
>    *
>    * To accurately reflect CPU hot un/plug changes, the FDT must be updated with the
>    * new list of CPUs.
>    */
> -void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action)
> +void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action, void *arg)
>   {
>   	void *fdt;
>   
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index d72d347bd1d3b..e105a6b8a51b6 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -213,7 +213,7 @@ extern crash_vmclear_fn __rcu *crash_vmclear_loaded_vmcss;
>   extern void kdump_nmi_shootdown_cpus(void);
>   
>   void arch_crash_handle_hotplug_event(struct kimage *image,
> -				    unsigned int hp_action);
> +				     unsigned int hp_action, void *arg);
>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 2687acf28977f..428121560c3cd 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -457,13 +457,14 @@ int crash_load_segments(struct kimage *image)
>    * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
>    * @image: the active struct kimage
>    * @hp_action: the hot un/plug action being handled
> + * @arg: struct memory_notify data handler
>    *
>    * To accurately reflect hot un/plug changes, the new elfcorehdr
>    * is prepared in a kernel buffer, and then it is written on top
>    * of the existing/old elfcorehdr.
>    */
>   void arch_crash_handle_hotplug_event(struct kimage *image,
> -				    unsigned int hp_action)
> +				     unsigned int hp_action, void *arg)
>   {
>   	unsigned long mem, memsz;
>   	unsigned long elfsz = 0;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index e2dbbcbf37dcc..43b668484264b 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -537,7 +537,8 @@ static inline void arch_unmap_crash_pages(void *ptr)
>   
>   #ifndef arch_crash_handle_hotplug_event
>   static inline void arch_crash_handle_hotplug_event(struct kimage *image,
> -						  unsigned int hp_action)
> +						   unsigned int hp_action,
> +						   void *arg)
>   {
>   }
>   #endif
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index f6cccdcadc9f3..3132466b5e429 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -641,7 +641,7 @@ subsys_initcall(crash_save_vmcoreinfo_init);
>    * list of segments it checks (since the elfcorehdr changes and thus
>    * would require an update to purgatory itself to update the digest).
>    */
> -static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
> +static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>   {
>   	/* Obtain lock while changing crash information */
>   	if (kexec_trylock()) {
> @@ -704,7 +704,7 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>   					cpu : KEXEC_CRASH_HP_INVALID_CPU;
>   
>   			/* Now invoke arch-specific update handler */
> -			arch_crash_handle_hotplug_event(image, hp_action);
> +			arch_crash_handle_hotplug_event(image, hp_action, arg);
>   
>   			/* No longer handling a hotplug event */
>   			image->hotplug_event = false;
> @@ -719,17 +719,15 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>   	}
>   }
>   
> -static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
> +static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
>   {
>   	switch (val) {
>   	case MEM_ONLINE:
> -		handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +		handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY, 0, arg);
>   		break;
>   
>   	case MEM_OFFLINE:
> -		handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +		handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY, 0, arg);
>   		break;
>   	}
>   	return NOTIFY_OK;
> @@ -742,13 +740,13 @@ static struct notifier_block crash_memhp_nb = {
>   
>   static int crash_cpuhp_online(unsigned int cpu)
>   {
> -	handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
> +	handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
>   	return 0;
>   }
>   
>   static int crash_cpuhp_offline(unsigned int cpu)
>   {
> -	handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
> +	handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
>   	return 0;
>   }
>   
> 

Otherwise this lgtm.
eric
