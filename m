Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364677443F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 23:36:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=N5zYq1Ii;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TQqJz7dF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qt7tq1vV4z3bpK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 07:36:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=N5zYq1Ii;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TQqJz7dF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsyXH1NWjz3bYj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 00:35:08 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UBOb7d027625;
	Fri, 30 Jun 2023 14:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=KBLXkqTyDgGqDVUXc22DsusNSDraRoWPl2Q13ZLMwXw=;
 b=N5zYq1IiZU7N6CgGi15nYFO3zr7w1nM/H4TWDoGG72XxmMUN/4g9Zy1q7j8HJ0RDZaaX
 ROLOlSKDRfxVfNimIK+dJgbWdbZ1zkLfgIPf734+/AA32o2wSDirh6XcWVmmhtKyqti3
 r5OXeQFYftgTIFnSflodlEx7S/4gcul+ZJoAjpBSw5Q03eZjV7EsShmLgMJE/Ce0sREq
 BIyo9So/MM1yoRuwuEHJ3fdvxBDJqOpcioanmvnHlJk4BQ+7NPxRj2aQhuR1056sBD0V
 Ca7i2oWTr0jTBtsOjz/p8anB+ei07RTtxXHKCRDG0OormzuLbH2sz+RJ0QWaFC6oSaIZ Dw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq31993b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jun 2023 14:33:54 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35UD9TCP038172;
	Fri, 30 Jun 2023 14:33:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpxff8hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jun 2023 14:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLnEbuebXzJVyCecWCOZ82L/wijMHcqiPGKad1a5q/HB2poezGjVbK2Tj2BR6xiyu3pN9hgQmwDBbfoyDDN+ASxt6S3pge+M93yRHuN0XG0eQaZ2XluzhpT/oNPw8VckhW1o09tL/+nWKI/jsFeb7XehQV9vv42cqW/pVckhsLw73ILKDfZbtMKfZwwUeocT3jHmtfg49NiBdeWBmjbQ+fIR5SX6hkVK+WoCu1fR4MNbyzcH1Dtm5wOVdBIQBPeuxELWoCHa2CeD8OmhLyBq7hx+I/UqjZFOPNZx75q0OAkg7rrtBH2Wz58/MwU6PtIpCWiTy6AIRgTvcmM6Q2yHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBLXkqTyDgGqDVUXc22DsusNSDraRoWPl2Q13ZLMwXw=;
 b=JYfzwnD8lu3WQC8FDkcC7X2ZLMRUlN92lEP0UjdOuMoxgqeFoFM/8D+fXOiKOwRJVYwrchtok0S7wqKzdia/7YeCLEwtDXkTD/dmufJ+CrBZWaFs9GLilBLFODe9VCrDypjVbc2iPEEq5b9jF5HE9+zm9+BuSCF/cgeVIf5JGVtjQpDe+eLrC/uNhqGfyGTbjt5lUvolbLDPN7AXX7csL5GkOn0sjBMfGSKo3EYSnVGifh8HSBPP0DdCh7Ijb+OlWX/L2j3Dtip8A8jyEI1pKGwVG6WeEzekh+l+0O2waGkhLWIL8B39Ao9Gll9tGUkcuZyrX2BzDUawTglabkmhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBLXkqTyDgGqDVUXc22DsusNSDraRoWPl2Q13ZLMwXw=;
 b=TQqJz7dFD0eLu2wmoR8cX699mO0yf3OKR/SKDgLSKb5NWWxHyhsHEvvowKyg/2rpfGQ6H8m7+hSfBf5OdKBisMeHwFXJTTPjaIid2xxCO5y4JBcFDLCdcyQRRy9aegP/lrX3h4nUiA48AXrsq47tXDdhTBnt4A/WG/DAeJJgwqg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA1PR10MB6712.namprd10.prod.outlook.com (2603:10b6:208:42f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 14:33:49 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 14:33:49 +0000
Message-ID: <c4552463-a6b8-2c4f-a091-d7a6558c8236@oracle.com>
Date: Fri, 30 Jun 2023 09:33:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
 <20230626161332.183214-13-eric.devolder@oracle.com>
 <ZJ7ToGgYAq33bwYI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZJ7ToGgYAq33bwYI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA1PR10MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 42de4681-c9eb-4571-816e-08db79770506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9PD928TUMp+5WsnAmsrn1rMqqrGrRIQpsNEKxMSTKtDsP1s/HTz++4tcUtFgsFi/zeBjzNyA2E2BpDCfIgSWHB7naetdpA2CaM4aasNzBLASBuQPK60xNDJZQei7MxN6PuydV3/2NzatMDdsvY27uj/D7PlIcC4xyZWV4oq9vPrgBA2xatri/n5Zt7/PCpuACcOcF9MC0QKVlNFhmhoPD0C/mhNEiPc6HlqzXEsz44KEGhm0pGZmn162z3QODV0zuR0UPm0U+N/18qK26fFlyKiW8axSMRsfrLA704btUQhkKzcy13VnBCq25llxggDH7qVfEsbpzLeuk129CAU2sYqx61T85ueRwCHlSJCm4ZtIIVkmwotNefm3XDm8VsL7CtwyOntJBVjQGdNx+8OYFtnUTOv/OhmsI+8VHlv5Z8DeSOidNpDUFG/pnnQidGpYGDvrBh64ORA1dDBA09XG1F8GJeSM1iaWmc9ytKhWdRnDPU5j5xMBoSFrcsswCaoWEO6RQh8oWmKuCEqD4lDUykWLYK7HMksMTA52XhS9H6n3NF0otSV8oZpRBedKJvdB5hqWCqYFqxEvJ26GaPVnT02VffnpI6jdgSMbgkUo9eQUCbd5IAEBWw8zYG6lcgEBlS/3fYT4dA++cbTPsP2t7w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(316002)(66946007)(6916009)(66476007)(4326008)(8676002)(478600001)(5660300002)(66556008)(8936002)(36756003)(7416002)(7406005)(7366002)(31686004)(6666004)(31696002)(86362001)(41300700001)(6486002)(2906002)(53546011)(186003)(6512007)(6506007)(83380400001)(107886003)(38100700002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TGJHM2RVSnB0RDV2VGhWZlBGRmQ3WllsQ1A3dG1oNlFxdWs2NFlYT2tZZDUy?=
 =?utf-8?B?Z09UM2tqMTZlc3Bqb1lPQ3VvT0RIOGtvQ2NmbmdPazJiRnNEWUtoOWRqTDIw?=
 =?utf-8?B?aFF4Z3RzaVE0d2o2VzBrS1ZucWRXTmF6Yjkzak5TemF6NGwrQUJKaSthQ2RJ?=
 =?utf-8?B?SDVqNllhNDhnYmJXYXAvTGNtaEk1YXVGd3ZOY2JhbDNyTENpVUtXSGFwelVJ?=
 =?utf-8?B?VThuSzk0N3U5b1pYUzloUm5qM3hvQ01ENWJ2empZOFhpTVd4ODhIQ0ZJQjVa?=
 =?utf-8?B?U216K1JZNi9LNG8wUEhpbHF2K3ovZDhZU3laM3FKOTczYkpVQjBqanFTUDFE?=
 =?utf-8?B?LzV2NnR4Rjd3M2JyTURiQUNWZC81akNuVmRHSEZzUUVzVmwwd3M4NzRtSWp2?=
 =?utf-8?B?K1phNWdINEVNamFYdnA3NEVvak0xSm1IeFVNS2tmYUgvT1R5ZGh5WkhXOTBx?=
 =?utf-8?B?aHZuTjNzYlNxYUtFNHNrT2lid1dVTkJOOWZWUFBUUmd1L2xmeFE3aDBJOHJL?=
 =?utf-8?B?NzlHWEoyQUgxQ3dwSHdtZk80WDlzL2VLMy9pSzBVMmg2a01QZ0dHdTEybzRz?=
 =?utf-8?B?Z21uaG5lRXJBSzV5QUVxOUtpeGJHT29TTUllaTJNc0tEcXUyS1pFcTB5ZmlI?=
 =?utf-8?B?bm1aTEtvb2hWTXhma2tTalBSZ05ac241dTZMMllCUUlxRjZ6K3NFMzQvbWtV?=
 =?utf-8?B?d3pnSEU5UmlOREtENEQ1ZnRjNXVUdlUvV3IzMjFSeDBTemFHTVd3eDdUU0R6?=
 =?utf-8?B?eWM0blRMVCtWM1ZrMCt2MXRuZEZjOVNyZFM0VmRiTGtTU21PbVVLWEVZRHpX?=
 =?utf-8?B?UWgrTE14akNkT21kZXp2aU9GZDM2S2VrN1FqUkRpblBQRUMzMUNYeFJnQ2Jh?=
 =?utf-8?B?S21yUUZmUVhkbnExMUpWeHJPRVByVC9yVVVPRng1eXdrR1haMlhzWms0ZmZw?=
 =?utf-8?B?eDdHWGdVMHRqMjVWMW1iT0ErbWJ5UVE2TllNcHY3UmdHRlR6di9FbS91bXlj?=
 =?utf-8?B?UDFoZ0l4NW51TVZrQ0JIUlFNYmlLZjgrcmluQkptckYvaDdENG9tSHJucXlP?=
 =?utf-8?B?ZzFveFB0MU45RE81aWJvVnNaSWV3YzZ4NkxQRThJb0hVRHBFM0FFTnBBVkYx?=
 =?utf-8?B?ZEwwRXpjT0lwN0ExL3lFQnhlSHpsYnJnV2t5eGlJSVJkQnl5akVUODhzNm51?=
 =?utf-8?B?eUxpamtVckNoMWx1SW9MQnVwM3U5WTM0R1RVU0NPY0NTK29aelBRZVNmazJF?=
 =?utf-8?B?NmZpaWU5ZkVxTW53Sml3UXBVUGNNMFAzYmpzdm5TbUFIL3pmTFAxSEdjbVJ5?=
 =?utf-8?B?RHJMSlErSmdwTFNmYloxTlJ0SDZ1L0cybU1rak9qTjdQU09DZDBreGdLcWNP?=
 =?utf-8?B?VS91QmgrWnNTcUxpT0xtK0ZiNTdXSFI1OENqTjdremFUK0ExUTVBQ2Ezend2?=
 =?utf-8?B?ZmxBN2x2azVuT0J5ZW1NVEk3M0tsK2R1MnNzdlVaNU1qVUMybFNaZUpwZWky?=
 =?utf-8?B?REJpTENwdHZzMm1MdzJrNGJ6dGFyZ2xES3BrVDJORTBZay9YSmp0cnFOMWFs?=
 =?utf-8?B?aGJ0N1gzY0VNNjVpRVFLRE5la2FQREVLWUhsZTVQOWlWeHU4SVVYRHlPL0tT?=
 =?utf-8?B?RXNHRUxDeCtwUkFqNWtSUW1CM0hqaXVIOVlXOTh4ZHdoOExkczlZZUR4NXlr?=
 =?utf-8?B?aTN1dHRWZkhLdU84WkFoU1cyODBJUVZsMVVkZjBoWk4xbmFBdmg1NXBkWEdW?=
 =?utf-8?B?ejhsSmZlbDhOZ3ZhMEdMWWdiMllRU1RlaFhhV1A3OVlMdjM3R0xiRnFlaUkx?=
 =?utf-8?B?T3BZandOcHYrZnZ2c3R1TnVhZlBzaFdFU0pNbFU4ZUtpN0hONWxweDBueXIw?=
 =?utf-8?B?d1lkVENFam1xYTU3RFlEZ0NneVhmRDEwMk9jS3A2bWwrZndwaVJNU0toTGpN?=
 =?utf-8?B?dGVpbDVJY1htb2thaWxIZ01mSm1IcUVNdXg3NzdYYnIxQks2TmRxRmRwMkkz?=
 =?utf-8?B?NVg2SDViNGsyUnd5c1QzNkdmb3pxK0E3YW5UdnJRSGRFTlNxa0xqSEpwWVdX?=
 =?utf-8?B?TUF1Yktab0ZvK255dXkrbjdMZzFGeElTRDZ1cmpzc2JxcGw2b1ZJKzJFWHRw?=
 =?utf-8?B?VjR6ald2VjhKZCtuL3dranZqbFNLQTRhWUZhcHFTZk5UdjRsVk1NblhNWUdF?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?eWJiMlJhalUwRDAwS3hHd056TEZuVDZWbjJPT2xOR2xKZVlGR3M0SzVFUmNZ?=
 =?utf-8?B?eGFTZ2pyUUJmVmpNaUFxYzFKVGFlYkRKS29SWmloa21rNzV0OTJIVDNVZVV6?=
 =?utf-8?B?cUxBazMyVWlaYkRTY1ZUZlFaZE5HYTRha3VGaksvQzNDMlQ3MEdDbFpTQSt2?=
 =?utf-8?B?bVovTFA3VktISm9FbFhJMzFSOWJ0ZVlMZndtdTk0ck8rNXdMeEE2YmlmOEt0?=
 =?utf-8?B?dTdnUm5ta0h1UVcwWHlvUEoxNHcxazI3R1pFM0RtOUh2ZWU1S1hFd09BRFJj?=
 =?utf-8?B?cFhtc2E0YVJGSGNXQXZ6NXNnV1gwUGh1d0tHR1FBc2t5bjhjazNCcGVGcncz?=
 =?utf-8?B?NmFpTHk4ZmdCVFpobzlDTGlqOEV4OVJCeDEycXR3cU5MaWgwRlJjNDJiKzB6?=
 =?utf-8?B?RldxOEkzbzZacEVkdWYzVUExWnpDVTBLTEZGZ3pmM29WMTdRVnZKVzIvbEgz?=
 =?utf-8?B?N0pSRDNzZTJrd3pSNFRtS3h4aW1MUzNhaEpOVk1aTGZQOFYvcXBOdWxaWS9j?=
 =?utf-8?B?b0NNK05ZVERZU1FBN29ZMVJ5dDBUMkNEUWdZQ0wzb3FSZTVrdHVjalFMN2J6?=
 =?utf-8?B?UFBDcjBYbGFrejF5UUsvTUhvczJLYTg5bEtrV28yL09sNFEyYk1jL3grOHc5?=
 =?utf-8?B?NGlIaUN2SGd6SW5rL3d6NHFBRGRVRlBxSEhPUnNjdk04MVIxT0hwQ1BEQnpY?=
 =?utf-8?B?OWZib1dnZTZsRzk3RlZjQVVWRHJob1dpR240WDBBMkg3RFkxUFpYRy9iUlVW?=
 =?utf-8?B?N254WnB0VTJHczdNUEkzdXE5V0tNYkpnQ0NLQUtlQUVuT3VrQkpHaGFDbGQ5?=
 =?utf-8?B?YStLNlo4VzhLUThxVWtQalh5cTNlM0hLdzF6OVdCM0h5d2dWSGdaaW1Vdm9u?=
 =?utf-8?B?aEp3eWRqOXVTN3UrUUFTM05FUENyZ3I1VVVhM3FtWDRyWWt3RXQ1YzFzeTVJ?=
 =?utf-8?B?bllxbHJlQ09ULzdJc3hLTFFEYkhvRGJHN0Z6STRpWEQ2NXhtTkUyQnhHc0p3?=
 =?utf-8?B?WU51SkxFd2NRcGhJUHVFUUZ2ZDhTYVo2RXNlMDNONHJLMENPVWlNVmNSc3p3?=
 =?utf-8?B?T2xINVRTNmR4bkVJUGRQQ3FLTmNncXAxcUd0dDRYTklLZlF0aWdsQkd0T2RN?=
 =?utf-8?B?QXpyNm02YlVCT3VmRnp6UHlWQ2EzekFhS0xmdlB3WVBXRUhNdzdtckVROVhz?=
 =?utf-8?B?MnBTakVlRzcwbmZYclp2V0QvR044elo2YlViMVJpaFNuMWpaT0RQMlppbGR0?=
 =?utf-8?B?dTg2SU0zQ1ovKzhtUVBaUEx5UnF1UHBMVC9sSWIyS2dJbGpQOXR1YXk5ckI1?=
 =?utf-8?B?eTd5eHpQOFJhOE5nRWxYNE1Zc1AwQllLS01nS1UyWk9kRGZkOWIyNnVCeVBN?=
 =?utf-8?B?eFlUNTFmc1ZVNVFsbFhaZEs2OTFGYWRZN25NRGpSUnRic3VLSUl0VG9PZWdO?=
 =?utf-8?B?dzZ3NWwxVzhsMFE2YitHeEVvUjgrUlJuTkQ5Uk1UT0NZMkoyTXN3VUUvUUZ1?=
 =?utf-8?B?c3FpTG4xZGIrUGR0T1ZhMXplcXVyWkgyL3B4Z0gwQ0tpejIybHdaSVpaeTkr?=
 =?utf-8?B?ZHVsK0ozMkNzTGE0V3c1dXZyN1hTQWRkVmxJZnZWM2s2amFtRHZNRzVNbEhD?=
 =?utf-8?B?aFZhbVJFbjVPQkY4ZVNWL2p1TmFma21yNm1jUzRneXdRWmE0b0VVYVN4TW90?=
 =?utf-8?B?NXEyQkc3Vy9FbndSdndzZWg3ZG50aUUyZUt1RDB2WmEzbGRFVlNTVFNjaHZ5?=
 =?utf-8?B?b1hUTFloMHNQcDVFSDhkeXJjRm42WlhHN2l3WlBveE1uUlFRenN2TWYxbjlC?=
 =?utf-8?B?b3FwZlhtWlBPTC9vbXhrSDRwMndmUVFjVHI1NnVkZWM3ZXU5T0RZSjl6dXB6?=
 =?utf-8?B?elJyWXhocGd4Z2tMeVRUT3hQR2QxWHNDLytjV3ZuanpaWXV5Q3FPbDBjTHpD?=
 =?utf-8?B?bFJDczVWZ21rMHZBVEJQSGpHMlBQN2l1KzYrTERKejJrbmI4YkdxY3M4Yll4?=
 =?utf-8?B?QXNUa29QR0U4OWFQZlNuNXl1bXRyMGIxZkJFN2hmZm9tdG93eXNZektHUWQ4?=
 =?utf-8?B?cmZxSFhIamI0cFpmTE5YTmxZTW4yYnlOTitaaDVZY1E1ek9UOEtzOWhEejky?=
 =?utf-8?B?WDRZTXQ0Vk9FYlpJMEl3MHE4ZHpzOHFVM1AwY1Evd3Y0Sjk2aWc4aTZPRlZQ?=
 =?utf-8?B?YlV6OWpzYUw4YVNNWmV6ZW4vV0J3T1R2eUplanRlOXVQMXZmdlNzOGY5RzFy?=
 =?utf-8?B?UnozOFlGWW9VNGZ4QmY5aUJGY2V5VkFPMGdWaHlXSjh3bCtUSGphK2NtdjFX?=
 =?utf-8?B?ME0xS0JLM1dGSWpnMHdpM2hsT2ZsOWREMG45SjBBWkdBclVpYWJoa2lTK1pT?=
 =?utf-8?Q?FIx/kSvBxffDDkTsthv9twexeqwn+YlpceNdVtnn8jrqE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	P+UvDVNnShE3LXHfnP7l/CLrB0ZHwy12ryhoINNM0TyUrGfBtrWopI+XhYuU+GGQMzi06CHqQhw55XS6r4Otr/4wtWn3A4emRJyWuYXHY3d1h8um9IEDFadEh8T3bByLIfUY6dzFVU7i8jr7pg20QM1JJNJIBSJMnIah1FI4/KkJVS+WNtM7DiorNezCndobKOfSRN75enMWzqIjvWDupd9W48QOJYLVBvelUQOd3ELXKs9Qh3Z0FwP0Ukc9YMyd7AUI56P9EKXU484SeVoPJtzp5yFA4xuTsvtFE8C1AdTKGfsnskYIIfOnMbCFQB4Pk6wWxCWMqGulzNtr/NN7N1rqkvrAOUNx6ihq1eY7zARlVTYorz+CFBPe6Z3JDHbOMlLRlVZnqp1LiiMRIr2nh12P+GY6R/J8zbMxjS6wgEeCs377eiGE9UgjqbLE7xarU4qvl4GCcZugpQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42de4681-c9eb-4571-816e-08db79770506
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 14:33:49.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acg6MfHde5j9r6Hdz9JKFSS8NPj7wpezis7/Sn8W++vuI3OpXdJrsSeVvjinguiXQHEJv7P0eThstyqjsZCu7Q7unvIQiC7KpuS88aN4Juk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6712
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300123
X-Proofpoint-ORIG-GUID: YDGWlaoexSzvOeE09hl1lVatrHTaCIYL
X-Proofpoint-GUID: YDGWlaoexSzvOeE09hl1lVatrHTaCIYL
X-Mailman-Approved-At: Sat, 01 Jul 2023 07:36:04 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m
 68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/30/23 08:07, Alexander Gordeev wrote:
> On Mon, Jun 26, 2023 at 12:13:31PM -0400, Eric DeVolder wrote:
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> NOTE: The original Kconfig has a KEXEC_SIG which depends on
>> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
>> dependency (using the strategy outlined in this series, and other
>> techniques) results in 'error: recursive dependency detected'
>> on CRYPTO.
>>
>> Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
>> dependency was introduced with [git commit below] and in fact was not
>> necessary, since s390 did/does not use mod_check_sig() anyway.
>>
>>   commit c8424e776b09 ("MODSIGN: Export module signature definitions")
>>
>> MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
>> SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
>> MODULE_SIG_FORMAT does not hurt."
>>
>> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
>> from KEXEC_SIG. Still results in equivalent .config files for s390.
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
> 
> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>

Thank you Alexander!
eric
