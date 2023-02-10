Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4756927B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 21:12:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD4fG6hxgz3f6t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 07:12:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=oUGGcNLJ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D3PbEz3S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=alok.a.tiwari@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=oUGGcNLJ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D3PbEz3S;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD4dJ00NCz3f6B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 07:11:46 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31AI0AOe020858;
	Fri, 10 Feb 2023 20:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=xZSTQ/PYmZL5DclYTG9Y+8mr4hE2YI0x8dT2uN+b23k=;
 b=oUGGcNLJbiDhURdpvk/gKmgwL1yMjhtPakjsAYmvP56WRuXycZCbV6qcRGkKcQiaTrBi
 i2+oY6Cy8i9seohdh7yjyMYk86a3eKSoU4JDLxlPvcwGM+Q++2EFbdKITYBN6yIAannY
 adbdoDwFUMPjOb6XxT0c4i0tTvjXep0qwuBFIOR9D0yxe2ZgmvJl1+2+Hhy/2aRdbCfk
 cS6p/hU7ckKdW2FWVHdslygj6YhrxqtfNg+04JK+zMUEI2ZMzBOtvPu0of0SiJd1THjv
 p3/zEsZFmnJtlW4CMvqbnuXQOExweIv5aAJqo06Rlu6jaVED3ZllRMjaWM5JU+eBQRXd 7g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwue3wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 20:11:34 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31AJjK31003000;
	Fri, 10 Feb 2023 20:11:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3nhdtb7a4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 20:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLRyDUaqTHxm1MuaIhOQuRdaOxesRumldkPB38cNpH07mxV0LQ29izcXoggpDAGHjDa/IuYRBl6Pq/y5k7YKW4G8l4MHEvZ2mIZZEQWWp484yUBRzbCfZpgf2/1yBWeP1YqIx7be/6IkkextyU3KhoutqqyhSqb6qf6CM8YOA/Wz/+bzJXiJxJzNyz0inG38yLSC7Sje9TZHZ5kNBtgWyaRprujzyuL20MvwxldF7szHwtzhcmvneHQ3Znqxjtfvz1243FN64R0Pm2TFIgpNDU8Ws0XCr0+PUWC2Mnv1Et0el+qQrEMtZfQGjAdMOFifMn0+LfgIu2cg8z/4x8XcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZSTQ/PYmZL5DclYTG9Y+8mr4hE2YI0x8dT2uN+b23k=;
 b=bJL7T5nAsG14cq8PnIvakH8hN5ViBj+aNUNINymPCN7e5vHoze9loPRxiRqk7OlTcnoFjgeXSpvb+nCYLSV9/SDnqViTx6HUWyulQ3nOnMuV8KoZBKVp6Gqg83FFNG80/1oLnN2hihf8Y/sH5vCqrL9ad6n0e/r5G/qjuTQZ6QUd2AV81JLkzbAQTEvlvj1NsW17ELlI3yn1u86HwkgnoEMzBREVXQnBsR470SSJtmaFjozvgn/Wj/k2y1qwRFv1Gh4qW2IsVicW0dj65ZKTu0HX7u+Ifyxl3FxfnDercBNKABTLb9VExlb3HAmF5bq79HQlcgzE6R/HQtXULouUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZSTQ/PYmZL5DclYTG9Y+8mr4hE2YI0x8dT2uN+b23k=;
 b=D3PbEz3SeVoQlYb4iWx3IkHYAhDPEPfX/Nv28x+X6AJpTiZryZr1YsfqBfapKEetUmyHCSGuyCUbNzKQvKrqw74yLzSDBrgVoq15nzfUA/V3aRwwyDJtO07DaeCeBI8C5p1h2e5OkBaLubwUT3s+4PVSj40avrXNHqIsxCEdp1E=
Received: from PH0PR10MB4581.namprd10.prod.outlook.com (2603:10b6:510:42::16)
 by BLAPR10MB4866.namprd10.prod.outlook.com (2603:10b6:208:325::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.6; Fri, 10 Feb
 2023 20:11:31 +0000
Received: from PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a]) by PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a%6]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 20:11:31 +0000
Message-ID: <ebda03df-ad02-c89e-882b-03f7514c3d92@oracle.com>
Date: Sat, 11 Feb 2023 01:41:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [External] : [PATCH v3 1/1] PCI: layerscape: Add EP mode support
 for ls1028a
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, helgaas@kernel.org
References: <20230209151050.233973-1-Frank.Li@nxp.com>
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230209151050.233973-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To PH0PR10MB4581.namprd10.prod.outlook.com
 (2603:10b6:510:42::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4581:EE_|BLAPR10MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 3625d04e-eef3-4553-ef7b-08db0ba2ffd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	e4YI1rEO1KwI/UmyPykEriTHjVaqDb4idUHfNFvQ3RJNwmA2abF5t/VcerEhrGq6sSsIz0dKfLrdg/l3arWbBTbBTvPa4bKKQ3tMnSYl3Vde1CNHBmEn+dQzOTfXNEUp5U1sfSC0G5cmHJpBljxmNM+JBs5y6nPzBPOUyraVFBGHsl5bam4eng+lEx/RWNIWfMEAIbkpV8kfn1K5UVKvvqtaBoXgCcmcZ9h/8fZmsx+21mX0mtC4wDJ42BtWCBVSHt9nutLcm6oZX6WFgQgrTd7VP9XzGE2kG7m8nit9j2G3fKPTEPAa+2RLHOqljzqcKpSG9udFKB0AL3bl1d9rHqXafEKidBgG58y/w0ZkSDJTLVbOMepnZ7nEZUdkxDHQUtJjLPNEqWNNb4lRl2SGcdlHv/BMpHufazyJ0HDqXCcLsDiVScz94cQPXpZjUb1PuTMJNFFZEEbhiyC2pICJkqBAi7NTwio8NMAgGCndA73t9VxY5AtBaHw6VPO8TAYGmS1F8ZpWFR+KfiOUca81ASaT3x3CBAA2U+iewteEQlbI7J89jZZa3Nbk9BLFWENjfvmTpd3+EsqdE4rJYaFakCFKV+p30ErWD8Cl6HNjqrciGLUj/o645AheOS3aU2fhgaseVqgOR76qBjRMc6xpnnEMtgNovIRYh+QNSU1OVYIcHFyzN2L9qm9lkz4i8zh7HSHy+6gHOl6VEqhfnalKatIQAVFh2AmdA08fwYtIX89NNa7S/zRW8ltJGp7VpE5xooFb8Auy+4zj1yrbOCowUg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4581.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(83380400001)(2616005)(478600001)(53546011)(966005)(6486002)(186003)(6506007)(6666004)(6512007)(86362001)(31696002)(36756003)(36916002)(38100700002)(26005)(66556008)(66946007)(4326008)(8676002)(41300700001)(66476007)(5660300002)(316002)(7416002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?d0ovSlAyR0NFNUVHVVdldzhUWHlkcHlPMmpqUkpXU2VaVnh5Y05BYm9lZTZZ?=
 =?utf-8?B?M2lpZDVkNXBLeHl0VFdFS0xpQWhKdnIrLzROL09PVXZkVVdiMDlBYTNiVUtY?=
 =?utf-8?B?Z21GTFgzWTRVTGxKOXNNS0xOZTA0ZlQvMXVwbytNUGI2VWZRc1cvVVdSZmFD?=
 =?utf-8?B?WnNrTHdPWXV2Q0pURG00SmlQZTBHbmlPUGhjSmRGZ3IxcFk4YU9HSjlTMWpF?=
 =?utf-8?B?dkxaUkdkM25Sa0dGL0ozd1QvWEdUVmJvYUF5MktYNC8zclJuKytwdlYxbEhP?=
 =?utf-8?B?ZmE4ZmZqWHdwQ2RaNnhnb3NjQXQ1RkhTUXVvcWUxWWdGVGhZanRQMUhzVElh?=
 =?utf-8?B?c3dCY1VlVS83MEhKM1Y0UzcrUDBXaHpQV1RYMVBQU2ZIc2pxeWdiUG5tWURz?=
 =?utf-8?B?bVAwNmtwN3FIK1pPQkZJOFN2cTNscTNMVU1kSit4UUFBeE1jMXFmajd4c01v?=
 =?utf-8?B?aENlempPZWVGOGp6Uzc2L3hhMlJWNWo4U0FraEpvVXV5bG1rb1JmVlFsMzNW?=
 =?utf-8?B?Y2RkZmtXMkxOUThudnJOazBjNmJVVXpTYVMwUUFQZG9RM01FSFFiY0VjRTM2?=
 =?utf-8?B?TmQ4Q0ZaaFFHNnl6d3lOQlJtUjM4VjBZZFZqWnNxaEo4NUk1TDlucXF6aGlC?=
 =?utf-8?B?ZS84Qkt4VEp6TXRPY2VFb05udHFVMjkwampuTVQ2YW9nbzRQNVZRRFhjMURa?=
 =?utf-8?B?NjVPZ29kSkQzS0NNL1VQcXZnaEFVcCtsL1h6RUdXSUlKbTZpOWk3OUtIaXBl?=
 =?utf-8?B?dkRnMXAxY0Fzc2FOYTN6TU9qdDdSVTBwdlZaUitlZkc0V0dJOTNFNFlhRncr?=
 =?utf-8?B?Z0svSmFkWEZpRng0eDYyL1czV3dudkN4eFZ2VmZXcGMxWG5rNDFObUF1dk53?=
 =?utf-8?B?SG9KbmJaT3FQTVNmQmlqcS9TdnhMQ2pQdFlOc3V0WFhpNllCL2lNNThzbGFq?=
 =?utf-8?B?NDFxSlRFUys0R1pPRnFWd0NMS25ubW1YbUtjVnhmdndYaDduZjlBMFJhM1kw?=
 =?utf-8?B?aXB3dHpCOUVEZGM4dlQ5enVyNUhVR0J6MWNVM0xmVHc1b2ZTVWtRdG50V01m?=
 =?utf-8?B?V3NsYzQvc0ZmQXRhWTZCV0YzVmVYMUhmbEZGbWdnZ1ZkY0cweXlYbU1sT1Zz?=
 =?utf-8?B?Sy96QWFJWTI0VUlnUVJFRTVsVjludElIRmw5bkY2b01ZSzNzcmpXaVo1REdq?=
 =?utf-8?B?emRGNDlJaDd5TXgrTGRRdjRrUzBKdUdzMmo1bTlOT1FwdU5DNlZER1JtcWth?=
 =?utf-8?B?dDNvdlB2eEltNWhpSm0ra01xUGhuZG1zMXNtMmlZTUx4YWUyZExieEc5KzNU?=
 =?utf-8?B?Q1YxZUgyaGpjd3N0M3Z3MmpIZkoveDhZeHRZdW10MlFpd2VCUUYxaVlJZkhL?=
 =?utf-8?B?RFlueDJxdys2RzVNOWNUMjlIdWxibUpvck1GcUF4K1FlZ2hhRlp4aFV1SW9q?=
 =?utf-8?B?clY5anplUWFzMER0d2ZKUEgrbWtuVWFwZXFET0NRSkc4RTlTQnMrOWprY3ps?=
 =?utf-8?B?KzNTM215cC81OFBBaThZTVJZK3VBcXFoc2dldDlDVjE2eGtQb25KZThwMDVi?=
 =?utf-8?B?b1Q4QVd3ajJQMzJDTUd2T1picUtpWmZ4WmRCeUtDaThXN0lnV2I5Z0pTSzMr?=
 =?utf-8?B?Q0hPdzVTQVR2czlyYjVUVEdmeGhjVWhyejBhSHRVdnM2WnVoTFBLZjQ5TE8y?=
 =?utf-8?B?V0w4QXN2akNKWW1ZSlo2YkhabWZnYVQyV1N0d29YWVpLZ0FBeVY5ckNGOFYx?=
 =?utf-8?B?MVkzVjRxUTRxZldqdG8wUEFudHlTYzNrUytZMUFwMFduSUN3bzZSVTB0VFdw?=
 =?utf-8?B?YitNMURSTmlWNE84eVlqOWRjVXVvODBIQytwTzlRaDRwM2lJVUxtd1ZZWjdr?=
 =?utf-8?B?MUNBcHo1aVlZaWgzZVZXREhMRGtSbStVSzJMU2hIQTBVRXJpd0Y5RHZ5cFZY?=
 =?utf-8?B?TjlZQWNsS1l5RkRRc0VWSlRsNnR6ZjA4ZWZmNTc1U3ZTSmlTUVBXRlhqMHN3?=
 =?utf-8?B?dkIrWGEvRElVcE5vZlBsaFlhekNRY3RwSmlGODRuUm8zRWhHY2RROVphNnpC?=
 =?utf-8?B?WndxaExtNTdLdEpwQUR0QnZ0ZE1wMjV0QUhXQlZsMnJEZU5LUEYzWnpCd2tQ?=
 =?utf-8?B?Ty9hOFAxK2xBN1FzRjlIazB6R2hDeWcySFlBMVdONUlvQlZFSzhsa1I3cDRU?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?d0xmNE9lYUpvSGNUSUVwTHJiZFErWERtQThobjIxL1IxQVN1bk9CWDRaTmFM?=
 =?utf-8?B?cW9Nb0NFRG5nUmV6c0hiNjZMbWk3bk4zY0k0M3BOdFZKSlpENzFuS3hPbXNU?=
 =?utf-8?B?Vy9MVmdYNHJsNVNGZTBvUW4xTXpOSWNRN3VsM3VIUjlaazZQSVhZOXo4d21F?=
 =?utf-8?B?NXM0ek5VODQwcWRpZllHRExDMWtYQXk0WWowbGhNMFI4aFhVay9XZ3lqdEdn?=
 =?utf-8?B?M2xhc3pBdzNjYmhFaytCemdBQ2Z3c0x6VXdmdEhibzNJWWpZbkUrd1lFRklk?=
 =?utf-8?B?dVpjdnpQTTA4STFTcG5EZ09XL3JVd3JHZXY1Nm1GVTRNWWJBTlczeko0SC9q?=
 =?utf-8?B?VjdSUUYxNUhzN2NDTkZlTmJiWHB3aU1zeDhkaWc2WlpVVk1ualBwMWF1OWlD?=
 =?utf-8?B?WklseTBHczNzL2lWV1ZmNXdqMmZyODM5bGgrcC9YbkNMQWd6anlFbllxUWho?=
 =?utf-8?B?Y2RuWXRIMWtJQ1lVSkhZWWowZEdJU1J6djJkakF6R2ZyaGZRVlV2NlBmNXVU?=
 =?utf-8?B?NjFidmluRzVwbmZ0UTJjcW43RzA2UmVCMEJQTFJid21OQ2Zqakpla2NtWEd0?=
 =?utf-8?B?aUZvL1FsamRZcHB2SUtuQ3JONkZSaDYwL2I3azRRekZOZXROZk5IbjZGSG16?=
 =?utf-8?B?Q1RqMXcxUS9UVnBSSXlzZVluUEpkMThZMVV1aUpvS3IySkUxejUweXp6eUhD?=
 =?utf-8?B?bm90Q1paejhpdWtQdVdoVE1NSWM0OTZEejZVc2J5NDlYVHlyMWs3MWprVkd5?=
 =?utf-8?B?YWhmT2RkbXlQclVJSFpSOHJYMTNQL0J4RWplK0c5eE16OVp6c3NPQ0xMUkJk?=
 =?utf-8?B?eTMrMWMwSC9XK2JTUEtoWnJsMHhiVEw2azJQTm12dk5EM2x4MU9SWW9qK0pF?=
 =?utf-8?B?dkhqQWx2Y3VZMkVlZU1VTkJRaGs3dHU5dmhKNENPT1ZRdS9LUlVtN3BDb0xI?=
 =?utf-8?B?Qks2WTRVeUVTQW9HNytyNjNHMldIdjRVUTJ5Q0tTU2NidGR4aURobFJESjZQ?=
 =?utf-8?B?Vm96VURQWU1HNXBDUjNYSms5MGFyVXpQTzZ6cWZ1TXE1NTJtUUk2cnFxYy9n?=
 =?utf-8?B?MkdBNHl0MitndlArTlZYLzNHSHNLdWY0WVR6NU0xTHgxSmlBRFg5bVpINTFW?=
 =?utf-8?B?SEFVYkxXUUtYTzRUN1JodThRd1NIWVZGS3BoeWI5TUV2WnR2d2ZsN29JUGlO?=
 =?utf-8?B?OFNGK3BOK2c5YkxCK252WlJHWGtkTjB4WDQvd1JSK0hzN0pBZk5XMWdwR3ll?=
 =?utf-8?B?Witrcm45ZUdqNlQxWlE5S2FURHVROEU4SzBldDV1M2RjeEkxWHFPU0hVL3oy?=
 =?utf-8?Q?x7Et5qYzU4f+doIQLfVWGdOJgyoQn2fwkA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3625d04e-eef3-4553-ef7b-08db0ba2ffd0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4581.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 20:11:31.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnpAKuP312L9rFtC/76KDlL0BJM6GLelENTtQGxRN09JZL4XYW7d8aC+kfNXeHhGnHmCjnjz9wTVWy+aQCw/uGSteiYzXOvZ91bWVwmXBX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4866
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100172
X-Proofpoint-GUID: WGTcwyOGApGH4rXWvlezPnKmypOYxFZh
X-Proofpoint-ORIG-GUID: WGTcwyOGApGH4rXWvlezPnKmypOYxFZh
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

On 2/9/2023 8:40 PM, Frank Li wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>
> Add PCIe EP mode support for ls1028a.
>
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp>
> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
> ---
>
> Change from v2 to v3
> order by .compatible
>
> Change from v2 to v2
> Added
> Signed-off-by: Frank Li <Frank.Li@nxp>
> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
>
>
> All other patches were already accepte by maintainer in
> https://urldefense.com/v3/__https://lore.kernel.org/lkml/20211112223457.10599-1-leoyang.li@nxp.com/__;!!ACWV5N9M2RV99hQ!NR9EU4fPDwxdyrb9tdBm9VNIMHSlw6dLgXCAPDSrm7ftWVNrh6JldLGzzrKyiE0xRlP5OdiGBN7PCf9gRaA$
>
> But missed this one.
>
> Re-post
>
>   drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index ad99707b3b99..c640db60edc6 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -110,6 +110,7 @@ static const struct ls_pcie_ep_drvdata lx2_ep_drvdata = {
>   };
>   
>   static const struct of_device_id ls_pcie_ep_of_match[] = {
> +	{ .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
>   	{ .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
>   	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
>   	{ .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
