Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27568A219
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 19:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7kv90rkTz3f8f
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 05:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=0zBure27;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qbLP738V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=alok.a.tiwari@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=0zBure27;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qbLP738V;
	dkim-atps=neutral
X-Greylist: delayed 3183 seconds by postgrey-1.36 at boromir; Fri, 03 Feb 2023 17:11:21 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7QJn3TC4z3f4y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 17:11:19 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3130O1Oo029043;
	Fri, 3 Feb 2023 05:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=lb0D1hoBtSPaLNfZHIXqn14NBLIS1jj5oCHsXxGnS/I=;
 b=0zBure27IbjA7kooKKG/H6YThy+Tx3IN7G6S0VWFHk702LchAvf0gd02Obaf2UpxDga1
 7950vHFvMyX58+JniUvhCIUMvkWg9HdHaT1eK15JguqbfUQPUck2TsN2B4AOW8iV5PNC
 Wf1jE51uWdcjR5P7gMCM6aaeZiKbWEWt0CASpC+T0MyaGB2bSGr7Au6KtjP47l8qcI2r
 GJkr5/aaJZf8JE4cXqA3B+HslFGjdvIq3naOeSFLWE5pBgRzfkDonRPmRaHIzsnuFRMd
 EXf3tc+fZaHLCGRbUrYtNyhsA7468Uei7L6VFUihFg8qoiUVA8hdrcO2+WsviNXv7P7w bQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfn9yms6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Feb 2023 05:17:51 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 3133ajSD004992;
	Fri, 3 Feb 2023 05:17:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nct5h708u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Feb 2023 05:17:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvUe6cH1vP1vUfRabVdvrqGPOBwlEycHsY1nV/3Ydaa6VWJZWAFo4rqICud6BxjAvhwvejGf4KSdRf7hwar0NJp/mTQ75x6qzJ0GoUhmLMBR2yOX+5M9r7JqHMr1Wlxg6Bgl6APbVfX9J9+uUHFcsyrQ4Ut4LybsAwqFqKUIqPz2v3LZVk/M9K/HvxC6yJwxU0ue5spOLKxR7fTZvJtP8+WAGZtIaZEoEBRwtPMlz+tTtul2+Tozb3J+SNhbFIOnaTTYDooLi9USggAKjrxIJ4A1YXCY4yzlbETlOsbmzHyJZqjCT0TyV5C6mj+fRJZu0wdLwT7vZtmKPHcc7hubAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb0D1hoBtSPaLNfZHIXqn14NBLIS1jj5oCHsXxGnS/I=;
 b=B0d/5Sjrdd3aDww7NUkIZgwBxhFOGiDJcxTLNkFgW+CjoGtayr+V88mk/EgY2EleBE74XO8Cx0A49H4xFbOQRxuSjNY4+HMif5wG2dxF7xLJauKySZq/rGRNOn9LccMsPll6YJ8rArRpDXhNefxdbgkXB1/YQ4J7odkOPg/tiWOaEJdwclA70zTptt13jtboGiEhOEJ8CwdNQQyM1x9XFUtw2ChZxwGob8upwLfttOsDXgRBmINAPOkSoWbi69ZrT3t9bsgiIDJpb9zwC80QaSOD9ZusaXUDL7PIed1lCQq8mUx0P1FDltCHhEaMoEP1RRRCGsHlP8hA5vAOWkHFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb0D1hoBtSPaLNfZHIXqn14NBLIS1jj5oCHsXxGnS/I=;
 b=qbLP738V8ole+QhETQZ0ZUcmbylNzEiTUWyMFxE+JNjhglbspP0ZguuJXbS3FDjttjgYfjhtvW16Hdgrb57Cwckd+0yoVUMSRKxvHWPc/ZyuOBPOSzBgHOtrpTFToUZX1Ix/ziTkPhnmp4L4j0AL0Poa2abmFBtQjYxq+dIcWPA=
Received: from PH0PR10MB4581.namprd10.prod.outlook.com (2603:10b6:510:42::16)
 by SJ0PR10MB4704.namprd10.prod.outlook.com (2603:10b6:a03:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.8; Fri, 3 Feb
 2023 05:17:47 +0000
Received: from PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a]) by PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a%5]) with mapi id 15.20.6086.007; Fri, 3 Feb 2023
 05:17:46 +0000
Message-ID: <199a5aff-fee8-71d3-bfcb-c0492667de1b@oracle.com>
Date: Fri, 3 Feb 2023 10:47:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
Content-Language: en-US
To: Frank Li <frank.li@nxp.com>, "M.H. Lian" <minghuan.lian@nxp.com>,
        Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linuxppc-dev@lists.ozlabs.org>,
        "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
        "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230112193442.1513372-1-Frank.Li@nxp.com>
 <HE1PR0401MB2331C19D7474E6EAA4DC29C888D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <HE1PR0401MB2331C19D7474E6EAA4DC29C888D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To PH0PR10MB4581.namprd10.prod.outlook.com
 (2603:10b6:510:42::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4581:EE_|SJ0PR10MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: afc8216c-be80-40f9-027c-08db05a5fc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KsH1Oy1hp6dhTOIbgqdTNZw3INfPqoFrXAlTd0nkh/HFsqReO0NVtbTDaWlKy/4piVoAyhQK3D2c4kYeOBx/VqYWU0wdR4yaASWfo077PPSPjDnLatRCSW1IZ9eU4IwNJ7X2rQHPlM1IN8mXttXYx7HUekTAbM6qKYKb0l6q8R7pGNaUMzRAv05gW0ymP0GDhLJzoodvM6sLvR+nWVqoR9NsoY8d43PUOmAXhJIsz9sGuxn6OoHzj0Re6yIozMaWo8V1/UDrVLBHPOxz2/0B1PQCjJOCcg6g5dhAOvgflW9+WdMV4k4LE16OktYZ3LG+1zZUuoBe16mC9Jy2yxIhTZX+OfYSfXBWc1MMPlncRDog0sga9+IZ6iEaR62/Gsxjvov4DVQdPSHut6sVGjyT1zO4OF97jIVDcnUdJWj3fKPbwlps5xOvqBfz72NGSaZkP8hEEWKtwqbUTLw3EWTbhFSqCZXefm9Y5E/FBpWHAV+e/mvZKFLYWXhzxTCQs0sivCP5s/jGyjtdXo+498ynsWeuGJ7vllCYFEZSeh97ZadjRWrqH88Xy95grohvxHD3Vd7EMUxNK4aUbEqu3+TmbPjs7Gdpv+y/oGfbRb9wchhmORIschV0yg0rrh0DuJJZH2GbHnutJe3KvDIqQ3/CCA6sUgu9HQwwLRJX3F0MZWBb2a1s+8G9axq8YDlWpn0ZJ4vONPW6s7Y9rYG7Q7l0L94nXX8uTPgPrfvE83/QNe2SQJz/H5wMHh3XqVW7V91GiJbEXfvcJWjjslz+8o20CQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4581.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(31686004)(316002)(6666004)(110136005)(36756003)(2906002)(921005)(38100700002)(53546011)(45080400002)(6506007)(8676002)(6512007)(66556008)(66476007)(66946007)(26005)(6486002)(2616005)(36916002)(4326008)(186003)(966005)(86362001)(41300700001)(8936002)(31696002)(478600001)(7416002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TnlRWmYxOC8wU1BUVnVDam9ZNXFiTVV5cDdkVEZKQmhsYnRHQjNLNUJuTFF3?=
 =?utf-8?B?UW9CaWRKang0TGJRdzVDdVVjVVhlTmU2U1F2Sms2SU9SakZQenBvT3N1N3A1?=
 =?utf-8?B?aTEwQkI3RER5YUtBUWFBdW9KWnZXSmJNWlNNd2VwVlQzS2RsVnI2Zm45RzdR?=
 =?utf-8?B?NkJhWVg4TDZkMVozL2hmV3J6Z0J2ckk0VXlDQzBPUXJqT2RmMW0rcW95UnNG?=
 =?utf-8?B?ajQraDNGSHhNVEVkZjhYNnY0citIcmREdW1SWURoVkVCVUhFdmQ5ZlpUS05R?=
 =?utf-8?B?TnlndWpna1lXS2lndWl1cjFYZWlnUjkvU3lVOW9wRmtVMnlndzc0b2JOazd5?=
 =?utf-8?B?QTJaNnRRMzVqb0lHQ1ZQNERNS3g5MTkxNkpaT2JENC9QWDM5TE93S0tndFhl?=
 =?utf-8?B?VDVWc1NMUEhmZS8rYyttVlF0dDQxamNZNit0R2lqUlRtaG95TFFPVzBkeDdZ?=
 =?utf-8?B?bForaXZybkdCVTYvS0htM3psQVNyTlRuMFp5MWRjUTkzWUFHN3krZ3B2Sllr?=
 =?utf-8?B?T0RpeElnSjE3a0krbG1teWMyRUZleU1haGx6OXRGRHFNVThFYmRsOFRBc243?=
 =?utf-8?B?bm4vMzd5cnJoZEhSUHpxWkhJb0gvWFlzQWdnajdTZWVvNFY0R3dPL3lCRW5U?=
 =?utf-8?B?aDZtUWlodFdCb0JTMG4xQVZOMEE4RWpGWml6VFY4Z2FYZ09DMFpLQ0N6MUxJ?=
 =?utf-8?B?cjhtRnFNcTEyMVdvL29uckdIMjZNWVhOS0NPU3hvYmxSeTZuMVUzWUUxS1Zo?=
 =?utf-8?B?NzR1LzZvNVJtYVA3RFFIMWV1THdwK3hqb0JFT09IcithNFdIVTRscldUd1lS?=
 =?utf-8?B?S2F3WVdJczNNNktrWUwveWRwSlloTFptdXFxa3dRTzVsOEZXN09VcnI1UzNB?=
 =?utf-8?B?QjNVTEE2dVI2THo3VnJFSWhzSysrbktUUnB4VTM0aWdXWDdEWDRTcXIwUTlH?=
 =?utf-8?B?Rmg3VEpqWDF4S3ZvZWh5MU92cVJlcE5mK3A4cjdPbkJRUlRSbEh1K014UXF4?=
 =?utf-8?B?bDBhL0tUdnMxTFpPaXRnZW5NeVUyZzdmUWV5NVI2MTFoR1VPM21ndHFCRFVh?=
 =?utf-8?B?T0lUbmRQUFBxTGkyTnpFUHY4eGF1bGJuaWdhS1YwZit4T0NYL3dZeDArc1pv?=
 =?utf-8?B?TGw4RVpGc0NPa3V0Qk16STlBeXUzeFJxTUdTRlN4RW90TGxnQ3pGMmRjRWxN?=
 =?utf-8?B?Wmc5WVppY0lkTlF4alBqQXdtakVNeUZsSlFQSUJNSURodW96Z0p5QjZaSFNQ?=
 =?utf-8?B?VHpzWHlxTEpIRER3dmZwUDhYd05iVkh3cjF0NUVvS0czaDI3cUwvRFZ0Y0RI?=
 =?utf-8?B?N2crV2h1bFRpZDU5eXlPaVZNN2RuOW9JVkxxeGtzSzI5KzdONXgzbTBPUzRP?=
 =?utf-8?B?QlZEc3F4aDVKWDZOL3hFKzVGVWhKSmZ4K2tncHoxZlhBNW93TW1zSG91NytI?=
 =?utf-8?B?MXk2QmE5MEd1SFZLUHV2dTNzbnd0bG45ZjBnMWtWTHdmQmo5ZC9BVWRUR21J?=
 =?utf-8?B?dU9SekZlWk91L0tMNGNkTTlVdjFuRHhhajA5N2R1d0RTOUtMZWhQVVlhd3Bq?=
 =?utf-8?B?MGM5TGQ3QzI0eFVYbjdLZUVNb1AwUTYzTzZ4Y1VYZHdoRklFMk8vb3BqTTFU?=
 =?utf-8?B?UzdmNFpXL1BMM09YWFJXbyswaFZRczFvWHJsMFpRYjRsMEU3ZzF1UHBhaFNB?=
 =?utf-8?B?eW9sU0xJNHFrVnpPcWdhVlI2NXRoSmVPRkp0VVREODNqSnVyc2J3T01QK1VD?=
 =?utf-8?B?S29UbWlTQXVTYldRVzZ0T081SnhqcmZRZG1TOUkwQnVCelMrS1RDNzhRY0pU?=
 =?utf-8?B?L2p5WE5UN3o0ZE1TajlJZ3c5WWNuMW9rN21wWnhSME9TUyswQmhHUWI3dldy?=
 =?utf-8?B?Z0tVNWYxNnYvTlg3OURPOGVaa3ZKck9lY2tJV1NDT1YrMGxFc0NTYTUxa3VV?=
 =?utf-8?B?azNrWGVLYXAxVy9MNlpLQzdzU2RuWXpIbWxUYVp6ZWx0Z21QTXBGTTFSYk5U?=
 =?utf-8?B?MUJTNVJ3QTR6OG52RkJiODRMZ1pYVmRaZDc3S2xUTHA2UDUwQ0tNQ2JzZ0Nv?=
 =?utf-8?B?cWp2UFFFOFZLaVFRS1p5SDBFSWVuSUR2UTJaRnJpUGtRckZpeGZXOTdza3Nv?=
 =?utf-8?B?bWF1bFVZWmdYZ3FKcUZ4WnNET2VsOFN0dzk4NUk0aHp6ak1mbVMxN2plR1BJ?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?ZzR6M0dva0NZMWg1SzlQM0dGYWhzdGRRWHBXR0Y1YUtmcDdaVmNnbGFySXdm?=
 =?utf-8?B?VGpnRHpHcUdZZWhBMkIzWEUwUkRDR0ZTSTRyczFjTU5yS3QvTTBWTXZkQnVz?=
 =?utf-8?B?QlkvbmJieDJ0VUNmaGVNRmlwUGFvRzVvY296RnphYW1FTTAvVUkxb0hOdUlK?=
 =?utf-8?B?c1M5UmlyUHhUNFF2QTdqMjAyd3hlOTVsQkJ0S2NRNzZ6bDlWaFlpaGxIemRy?=
 =?utf-8?B?aXdOenhKSm1aZkdSclNqenB2R2dZYVRTaTc1aEgxcXkxY0hZTHZlU3cxUkdG?=
 =?utf-8?B?UmoxdGFUc2NwOUk5RkpneEwxRy9BN3dPbzRYbHZpdk5VZmhPOVZBeFhibEgz?=
 =?utf-8?B?ZUIycjB4S3hVbFN0bWlrTmNlMzVwQVZPb0FNbnc3UkY3dmx0Y3JjcTB1dlFu?=
 =?utf-8?B?MEYweUdMWFNpOFpySHN6SGMyM1hwSFRoTlpLd2M3ZVByM2hIR0JncDZ1L1hk?=
 =?utf-8?B?NnRVZi8xcGZ1MHlkbkhNRmpiQkwyYkFPeEF4YWthblJyTHlsamhGOWgzeXNu?=
 =?utf-8?B?TUdoM2JNL1BnOFI4Z3kxU2NHQ1VhOWMrc1dGTlJiSm91SU9vcW92YU9VZE9V?=
 =?utf-8?B?NkREVmgzYStISFY1VThhYUJ1R0tQWEhYTHpsUWtPZ0JNUURHdHNVVStpVjdt?=
 =?utf-8?B?NC9vZHFNd1JGOW1BVHV6Ylp4VVRBUzRPYStDRDFqd3RRS1RxeDlSdHB1Q1Ju?=
 =?utf-8?B?WGd3S0VUdDcxYTRPekMwc1FqbXFjRXZvNk5rM2JZSTlEZ1pIZXdJa21tTU5u?=
 =?utf-8?B?Z1pyVmNDV2RwRC83blZiL3E3SkoxZ2kwbDd4Ukh6SVFXRXZFTS96Q3crbmtk?=
 =?utf-8?B?MU1kbWFlalJPWFRTdGY2cVpHTnZ1dGFoMHF3Q21hTVpFdHhxTk1qZGhBbDg1?=
 =?utf-8?B?RTN1L1VlSzVNeG5aWFQ3WWxIdnEvMTZmVFpiTDNyOXFiTHVaTktPYThBZWdX?=
 =?utf-8?B?UVBRZWRnSU5vZllCNUl1RkY5SkVjcENvVGd4U29yeEJJWHptNGdlYThoUEdK?=
 =?utf-8?B?R0tIa0RoakRnZVBrdXJ1MVVnWXNlU0N4dE1QdjFGM1ZaY2x3NzV0WmN4dHZt?=
 =?utf-8?B?SjZpdkU4azFFUjVXM05hM0J1bHhyZHdaNHJ6dkhDelRuSzdsaXhqM1NkQXJJ?=
 =?utf-8?B?OUk2WnJEZzRxT0RscmVIejdjQzN1UllERy9pS0pLcWdtR3BMN2hiYlZvd3Y5?=
 =?utf-8?B?YVoxOGR4Q0pEWjZ5WmtrTjFQa3pJMlNCY1FrQTROOWVNWHhEQUF5QmJGTUZ6?=
 =?utf-8?B?TnZWTnFYV3hzN2tZZW9vQlhha1M1Z3V0QjlRcU9NaVlaWHRCRzRVTjl6eGdt?=
 =?utf-8?Q?mlBtTHRRBqgmA/k4hiJvLhmsZz7411GWZw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc8216c-be80-40f9-027c-08db05a5fc5c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4581.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 05:17:46.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYazspEt8PGoQGN4OGHE+YPzEPlDFf+CKUciQBYzFqgzNl5txY4nTh20ctUyZq1oYrdnZVThTaQCfAVA9hWMnARIH7tGQyvtpn1VbVgOelc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4704
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_02,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030047
X-Proofpoint-ORIG-GUID: a7gw57zwRRHEYtfEdbxTYiUdjRk7HTqm
X-Proofpoint-GUID: a7gw57zwRRHEYtfEdbxTYiUdjRk7HTqm
X-Mailman-Approved-At: Sat, 04 Feb 2023 05:37:56 +1100
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

         { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
+       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },

can it be like this for better readability. ?

Thanks,
Alok

On 2/2/2023 11:11 PM, Frank Li wrote:
>> Subject: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP mode support for
>> ls1028a
>>
>> Caution: EXT Email
>>
>> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>>
>> Add PCIe EP mode support for ls1028a.
>>
>> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
>> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>> Signed-off-by: Frank Li <Frank.Li@nxp>
>> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
>>
> [Frank Li] ping
>
>> ---
>>
>> Added
>> Signed-off-by: Frank Li <Frank.Li@nxp>
>> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
>>
>>
>> All other patches were already accepte by maintainer in
>> https://urldefense.com/v3/__https://eur01.safelinks.protection.outlook.com/?url=https*3A*2F*2Flore.k__;JSUl!!ACWV5N9M2RV99hQ!PIKq0-lb3ccjBcAZNFo48kfWvbGPlh7_Wiws1olaNdTthUzhcGFrpLbw3vOMDaeops5LkajDO_y_vGPyuhE$
>> ernel.org%2Flkml%2F20211112223457.10599-1-
>> leoyang.li%40nxp.com%2F&data=05%7C01%7Cfrank.li%40nxp.com%7C29d1
>> 5c05d59346e552be08daf4d573e5%7C686ea1d3bc2b4c6fa92cd99c5c301635%
>> 7C0%7C0%7C638091494850726163%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
>> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30
>> 00%7C%7C%7C&sdata=0wnHTyuX%2FyLAiioKNvlFbBM83nVyF%2FCdhqsEmV
>> f2sI4%3D&reserved=0
>>
>> But missed this one.
>>
>> Re-post.
>>
>>   drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> index ad99707b3b99..ed5cfc9408d9 100644
>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> @@ -112,6 +112,7 @@ static const struct ls_pcie_ep_drvdata
>> lx2_ep_drvdata = {
>>   static const struct of_device_id ls_pcie_ep_of_match[] = {
>>          { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
>>          { .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
>> +       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
>>          { .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
>>          { .compatible = "fsl,lx2160ar2-pcie-ep", .data = &lx2_ep_drvdata },
>>          { },
>> --
>> 2.34.1
