Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3973EF7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:52:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=eOvOx8HI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eSDna9md;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qql5H6QGlz3dG6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=eOvOx8HI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eSDna9md;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqYM13jMLz30fZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:33:47 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFnjm5028755;
	Mon, 26 Jun 2023 16:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=LHZa4EVeUAYDPS39vD8Sdkjxd6+84JtuTbZB2vNKYWk=;
 b=eOvOx8HIfr/EPLHo9ghMhEEMqUU4Nvppd8SEdibVEBJa8ksqGQpHSkPlrbe+WhaqtmBy
 0gC4q8qM/u+L2Y+i2C+BzxuhoAj2CSC4tRJBjjU/w9N8kbqkj6GnAtbGYU2LbSxNXLos
 rADY5+f/fxTxrF+cu3G9hzPgoCJkHmubd0yIv/dm9tcD6fWdV8mdjvSWDW12KCsH6gpa
 DES1ZPCaYvuw0C2JfAmoWajNTv7SuNSi+OOD8Uw2Sl5Ij3ZQwjQ/+PkKSTz8hYjdt8EE
 qOIqD6pGvWwYo0fQ4pmppO7A4xD3Aa9991bvI5RpL9lOBtSIWVl78wy4uzZaBT9G9ZS1 yA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rf40e19gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:33:26 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QF5AEF026369;
	Mon, 26 Jun 2023 16:33:25 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx9truq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as6roS9sS+61ZzxotCmjwqgieNd/28Z3CGZ1d83JEiKv6MslxNNNAR+DDFAyPUsSBZmLGTHSIjQQQDheswK7cPLqSdg5kMNdaub0QsGlPL2ifGT2e5hGa2PubLHhG0KvfKgMCO3h27mSDTWKtQnSayk2pWxQA95CXdghmrpi90LhjSAtZtFz5N36zAOUslpajfiKhM9jzVspT/Fm+b1qJCZNq3jQZhK7tphlXk/8fn5OUSke3RzJZOvxZbSZyU79wPVrwcSjDgyS1jG/rya3Lz8qS8IMH2mZZAaHV6Va9yb3T+g+U9f5I2lS08VlIzw14kWNWuzkrf1pU1PGPv7HHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHZa4EVeUAYDPS39vD8Sdkjxd6+84JtuTbZB2vNKYWk=;
 b=DxzzrfPQGKUw/gl39OcL8jOCVwDWy2UhxXFkm60U2rN7aVTEO12i6HMaOBxJmJu/XO+tnzUEjiTvjsAIv+Posik9bJ3IjB6Yo+PezdWMiMcYexuu7TZY6SHy7FsgJXNHFWcOh6KmPKN4zvmZg7I+/l2i+NO94+uzbrh4Qkt2qdQsZkvBdUJb84oXwWKUI7XdrNyh03G/OCsl7LLPOmBkEVBxSmcmq1/NrE0g022Qedv+Wj26SdSvan9euK9+clNk/c4qIp52DYIatF0iMKDGkIbRJGrpuPBQGaN/vFhCgEbcq3w9R58eelWBESr/3aGftz0BIguEZFukNLu0hIFwUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHZa4EVeUAYDPS39vD8Sdkjxd6+84JtuTbZB2vNKYWk=;
 b=eSDna9mdET4veyKd1Iv67hNiYh/Avu9mGEHZq2XXCRwzBHKzVPcGAsokJlbvwR6rfZv7cEKXSKprA2lUWmDoo8pY5EEUsuo/VJoELERkE4tgz4CAPlIQDI5F1ebB9HIRN76Ch6tG52H9yxlgWy4GRzj9w6pGC445PjDQAS+TJDU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB5583.namprd10.prod.outlook.com (2603:10b6:a03:3df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:33:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:33:16 +0000
Message-ID: <cc282658-0d14-1f5d-962c-4384a5f43ace@oracle.com>
Date: Mon, 26 Jun 2023 11:33:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 01/13] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
 <20230626161332.183214-2-eric.devolder@oracle.com>
 <ZJm6eS6LiSApYVTC@shell.armlinux.org.uk>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZJm6eS6LiSApYVTC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ0PR10MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: b31e53a3-5f67-4b17-e75d-08db76630adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DQZvqwNxmOE276i/KxA5xZzczat41U88aXM7X2r9YbNhzXcJeKqJJIdbXcQJIiyvOKPH3+U1x0rSclqqW3I5zmccO8qizO9qA3RjgsLMEyRxlTzRHu1LgqQBbMbKw0vai/GWDK8/AsHFLglte1T5vGV7Q+fJcyct9yiLMYVGXZNUxcSQMle9pP/cz7f8nUvPQQgC1Oz/9Kk469U6tGOkxBfrcnWlORt3Caqc+pUQ6P3XEcn4sZ0NjdhI8BhYk2YMmMl5RP3EoEgqRZJDbTxG3IG46VWoUfcvnMcl6n07Oe+dNl53r+LpafqTQHTkaccuOzRZOsEWjP2rdRPbuy8CybMGuhdePgMoAUNz67HfHz6+DtP/IsaB8fj9zwmc/i26SIHltLC/swwxSyDCSpZ/XtayIldDJmrS2FrW2rQxgNWO/hTJqcdYnUSH28LxlZM4U5k50xHS8HZOULdhvArV76XUYgXAXWMAiTA+aCg+FbOcTtt3nurjxrbHF0Wo5V6WRTbzc7nITPl7h/jHH5IM0MOa+T0WHH9FEzwse98dIGasJ6M+MiP8RDFBgNJfHIL42KJx9qw37kEsQTbe18/AtUiN8175ybhqBKKxCFC1gs2qHA+kqnm4f22SsMPKzWU2iccTdlPsS37icRplYxrzoA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(38100700002)(31696002)(86362001)(6506007)(53546011)(107886003)(7416002)(7406005)(7366002)(5660300002)(2616005)(66946007)(26005)(6512007)(186003)(66556008)(66476007)(6916009)(2906002)(478600001)(4326008)(8676002)(316002)(8936002)(6666004)(6486002)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NUhaNG1GaEJZSmdHc2VURjVudy9Wb3BsZm8rM3JXTi83a0I3VXk5dk9nUm1u?=
 =?utf-8?B?Sk9Mek5zaVdOdHRBWmdEU0pJQVRRbWpzTmpaNHJiWlFJaDlpUHowQjVHbHFx?=
 =?utf-8?B?N0EzZE1MVTBhdWtoRGVRdW9hdEpyMkI2aVQ5NlQ0MTUvVG5vNk5WS0w0UEhi?=
 =?utf-8?B?aDBGRTNFaXlMdjF4WkNkOGlPaGZwTE90aWpiOTB1SmJaV0N5U0pia1dmRnZm?=
 =?utf-8?B?b3VQQlB2c1Q1TGRCYkFCV05MWEsxZmRQVTB6by9qNHNrYk0wN28xc1U1VWdB?=
 =?utf-8?B?NjRjRC9qTUxqME9JcWcvV3J5cDh5RnUwcTBybEFUdG55OU1aZityQnhhNk83?=
 =?utf-8?B?ZmRWYjN5TjVNRHJoczY3SHZwUVZveEJjajFRU2R0RHl1a3M1eTdCNVkreGpz?=
 =?utf-8?B?R1hocCsxRnBndDNNMzl4NmNyYVRFTzZUOGYwZjB1aHZEWUpEdUZVUXB4UlVt?=
 =?utf-8?B?WmNNQ1B1c0tPL2M1YnpTQUR0bzBFUGpjTTk5Q1JHK0ZTdHVIdjFaYnhOTThr?=
 =?utf-8?B?UUU4WExtZkVUN0JKNlFPaHA3THhtYnQ3c0hwQ0pPL2gvZG05OG9WcENIcnNV?=
 =?utf-8?B?NXlRT0tpUkUzWTMrRG04c1lHYXUrazBKMmlmUlM0ajhGNzI3VjdrQk9XdHlY?=
 =?utf-8?B?a3V4M3YxWmlqcXExRTBNcStaTmkwWG9icjM4ZWZpSVMyZ2RNUmJqOG1udjJR?=
 =?utf-8?B?YlkwWXZlK01HQndKK1dweC9rY1M0VDYzOWNmNzkrSFg2S0VGdzN2R24vcm9U?=
 =?utf-8?B?V3kxUzZieHpYUWFQQ0ZaREEybndCSzVIbXp0WkRJV1A0ZW5nc0xweHhtUlFN?=
 =?utf-8?B?ZTl0cEFEWjlyTkdyZXpNWllOaUpNWTB1ell1M3lKRG5CUnhUZTFjUHRKeXg3?=
 =?utf-8?B?VEVaREV4UGZ0TFFMNVFzZy96L1RsbTcvUEVoMFRiMDlrVUdzai93cjBZOURr?=
 =?utf-8?B?UG1oYjE1aVhMcGdpMTJSZTNXWjluRm1vQXYyREdyaXpaOHVzZUtqUkJzck5n?=
 =?utf-8?B?cjhieG1YMDVWeXo0YnRhcUxPbGdtL2tHdEcwMjRCMXdTcTU2cGtBdjFSR2VL?=
 =?utf-8?B?am9mNU9qUEpDU0F2MVR3a1RvMlp6TjBNSmtSKzN1b1QySHBackxyZFdqMkpJ?=
 =?utf-8?B?M2E1L3hVWjRhQ09CeFlVZGI4UUM2ci9EdFV0MkR0a3dLYUJVZmFFd0E4aFpr?=
 =?utf-8?B?V21MT2Z6UVdoVStwV002M3VNV01ueFA4aklDUHNRWWVQS3NEM1ltRkVPK0ZX?=
 =?utf-8?B?aitWajBOL3Y0WTZBUEdqTUtHRmZ3YTIySThyUENab21RQlhwMHpRajFYQXYx?=
 =?utf-8?B?dFkrZ1c5a3p0bm1qT3JPMElMSExQSDNpd1BDeUk5RW5wR1E2cUpEVk9ueS9S?=
 =?utf-8?B?elBaQ1pQamt0ZXMrTk1QOWMyV243TkJVSFpFSDBOd0tKdnRHUllrWTBIWWRM?=
 =?utf-8?B?Y0RvdXJ3dmVGc2puZDIxWVNkYlJmMURsVmZzR3ViTEk5Qmo1MGFGaW5KWVRZ?=
 =?utf-8?B?T3Y3Wk9Gem1XTnlxZUlwNExRbm9lREIyR1lKUFNrMkZ2a0RxN0pUZkV6cVFX?=
 =?utf-8?B?UW8yaDcxZm5jL1JiN2RVazFRMXVuaWsyV2hRNlZOZTMvV2xUaUF1Q1ZvNGY3?=
 =?utf-8?B?OG9TY013VHFxM1BhM0NFOTJuV1hSR29JOFE5eVE3ZjJWajdOQmhLc1orZ0hz?=
 =?utf-8?B?blhsamFGM1NIQmJpQjBmRFByZ1ZlSWZJOFdTa0o4WEo4OEdNTnlxd2pDajlO?=
 =?utf-8?B?aTJQKzhUWnQ4bVNjN1dLUXYxZUs2VWZLckVpd01FS3dqZld3RFQ0QllzSS9O?=
 =?utf-8?B?WU9mS2VPU0ZnWTMzSm9zbjdSOTJiNGlPQUlPV1F3OGpmNWkrcmNwblY2RDhp?=
 =?utf-8?B?UGZ5NTdodGQrdjlBMWJyVWxEY1dYNUpIZlRKR3M2K1VOV0NRR2VWRE0wTm9D?=
 =?utf-8?B?NzVkZnhQUVRqRnVHN0czTVQ3K3NGdVNwVHQyaWt1eUQvbWpHaGNWLzUrcm5F?=
 =?utf-8?B?K09QNXg4UE5VdXYzUkkrY1ZlWmY3RlVrRTNNcGI4QjZCV2JmMVJpcGVBOFBR?=
 =?utf-8?B?N2F4MFBMRTZTdDYyZEh5L2Q3OWNtei96eWpxNWpUblpEQ1ZJTXY0UlJYdU9z?=
 =?utf-8?B?dUwyQ1dwRGlhckxQNDVjMWtXVHE5UXB1TXR3ckhBUHdGWUVuekZuVjZYRHFF?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?WVZJME04QlRRVTV2bG1SbXh5RW5NaUFqU1VuK3o3N0xUUldjR2VHUU9vODdD?=
 =?utf-8?B?MG5NUFBsME5xVWhWUDRtWS9kVjd6WVg0aUdQVFZuOWhuWXgxMEVvUTZRdEQ1?=
 =?utf-8?B?N2NGcjlmakJYa0l4TzdneC9WSlVhTmhodDl0QlJlSE52RG9ySEN5WCsrUXZ2?=
 =?utf-8?B?YzF4cjJaM3pncGVwNkZDRHRMZEJWL3JGUzNuVy96TnY3ZUw5UXFvZUEyNGw5?=
 =?utf-8?B?MS82azlGVUdwQVRRRWNkM2xOQ0hnRlhxeVFReHRTRFhQbitrYzZ3U3o1TFU5?=
 =?utf-8?B?cEYvc2NyUXF3bHNZNWxva2YwemR0RG5yQ3FFZ3FXd0FoWVpsNVNZQnRvSnlX?=
 =?utf-8?B?MXdqWndTSW9wL0VRdmlWQ3pxcDAwbG9HRXFCdjdqeFlJWkFQN1lId0lRRXE5?=
 =?utf-8?B?MEJyVUYzUGVUajFnRTR6anRia20weXE2YjNrc25kemJsaDlKMU81dklUL2cr?=
 =?utf-8?B?K1FWNVozWks5MCt3TVFQZ1lGNzhVOE1ickl1RzF3QkFrZDBIdGhkTWs1aHFX?=
 =?utf-8?B?azFSOFcxWXpWa0RZTm12RkhYWmRVTldHMVRwenAxQXZyVVc1bEk5bVJOWGRh?=
 =?utf-8?B?enExbmxVMkN4TGI3K1Z6WlpCQU9vMjlwbXJ3eGVCUkd0L0lHYTZjWGZNRlJ3?=
 =?utf-8?B?Nk53WVh1UytPN3JMRTBCR1QzOFd0NHBzRWlmMlExMUE3SnNJeUlHRDdZVTZV?=
 =?utf-8?B?N1RLck5YUk5HSWZKazJNRDQ0dHB2cmVRZ1dqSnpyQmYvTm5TUE9waDROQTMy?=
 =?utf-8?B?TXhsRjYyOXczZTFnWkVldVZ3RXFTclNVMEhhUUhrd0d4cWVRSnFtd2tWZHNB?=
 =?utf-8?B?MXd6THppL3lCa01leHUwTU5hVDk2em0rRWJnTkllVDBLblN6RWxxMEJYajNG?=
 =?utf-8?B?ZXczRG92QVNiUzF6bXpiV2pKblUxSGZrY3FoVXJuODRiMWU3ODNyNmEzS1NB?=
 =?utf-8?B?UFNLMUVmeGZld3lDbUw4ZUEwU0VaLzJMRkhIMEEwdnQ4NGs0VzJnNFN4bDkw?=
 =?utf-8?B?UnpBdmxUZ0twY0dtcXlFSE12RGlWMXd6K2JudFVwYTNsaDdmSXBnRndwRU16?=
 =?utf-8?B?K3JsVUZNNk9HZkJyTGk3YTV1T0tUQ2ZsYm1TcDdCSTJBS3MzMHJIcEhnT2xM?=
 =?utf-8?B?OEpQWHA3clZadGkyTDhlMEVhMXhwZEh6L3FncnVGYVFJYmxHT0pLMEU4anJp?=
 =?utf-8?B?b0FPcFZKSEFzb0FSaXlYZklXSFhCbmMvcVNSRHZaSVdRcjVxanUxcHhZN1pE?=
 =?utf-8?B?VDhKMTZxenVIQm96ZVhvemtVR0NEdXRKVFo0T0FWUStCWDZFQlBrekh4UTVJ?=
 =?utf-8?B?aVpWQWpQUmY3ZHF2TkdZVXlyNlZJUWR5M1RuMlRjOEp3Yms0V2R5cjJtWFZR?=
 =?utf-8?B?RG1USEFOaE9UTEllTmtRM2wzaksrQlZRRWNlUUhkWTFTMGI4T1BabUdFLzBs?=
 =?utf-8?B?dGMyL2FuaVNWUGNGR0E4ZzUzYjBVUDdZc1YvcTlxSmVKZnk2MGVocDN3NFhh?=
 =?utf-8?B?eS96YVZNQmFhK2p4NjkrRnhNaWxpV3V4eFg3YU5FbGdFZHdMWkwxN1lwbHR2?=
 =?utf-8?B?N1JlNjZRTWtoQVhxc0V2N1htS2QvSVhiZk9jOWR1SEo0OHc4VnI0SW1hZTBX?=
 =?utf-8?B?M2xUYTdsaktNYS9nRUNxUXprUDN0Y1ZlQThUcVNITTNvbitOdWpESTJ2TW1P?=
 =?utf-8?B?ZFdJdElJWG4wN3pZVDFGZFJ4cFVURkZjYnB6dmtYalhDSmdqWURUZ1lDZ0M5?=
 =?utf-8?B?VW5TcnQvNXpqSU5UNXpFTEFDVzZmR1M2dmZ3d3ptNHBhdkpmUHlZNXMwMkxW?=
 =?utf-8?B?S1lkWjJRRktNZXJSU0RqQlo0OGFUdWgzYXMzMkxqZjlIUXFxWmlPZTBuRVlT?=
 =?utf-8?B?UUJ1RzVYd1NhbkVnTlAxVGlIWjZQQUxjSEtrNHhLQ1o5emRaeEE0L3o2cEZF?=
 =?utf-8?B?VnNMRU9ZWXlMTitBWUs2dlVFZnRKSzBQSnUxMzhub3poNzlPYU5EWEl4Z2Ra?=
 =?utf-8?B?b0wzMFNiQU04M1pMc2xQUVpDTTBwSWFRSUpqcGF0cUlVTEM2cFBMK2RINTZF?=
 =?utf-8?B?Zlkxd1U5TXZaejN5NVRqVVNnbllyV1ovUDVlWDJmMkxlU0RPS0VicjVhaFlC?=
 =?utf-8?B?RXVMd3ZzREIwYTRYNnEvQ1FQOU9oWjlFZGoyVC9LK2lYbDk3MFRiUmdmczc3?=
 =?utf-8?B?V2s0Z1NjQlpoc01KWHpJWVdMbjFZZENlWnU2RFgySTBLK0hmSml2QlBzdE5x?=
 =?utf-8?B?WmpGRndlZzY1bE53QUVkdWhiV2R0RkNNM0xYMzNNMGowQUl1bkdaOUoxMHJx?=
 =?utf-8?B?R0NQdzJjUWRpRC9VbmVTNUxmeGFUdmxmY09WdVdtRHAva3pmWUpNTmd5WkxE?=
 =?utf-8?Q?zudRA5d5/vxw3p7qWAZvO/mGxzYZCDMwND9F7Gng3zw0n?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	BsHTIU/lizkMsyUPfV+E5+3mpxj8VflhJZ/qQNKiS4QOhVVrHMSr99MraZQf43L4VB6I6m5fDS4l4Je4Nc9dy7jGb+MTzeRyLGKmMfyNqMmpgYanJVXEorOCOePTyFt/WgTqwoPYBpBztNySLT5vDq3n05Gec0ARKxdzMmQdCM0Q3L61eXWmnbHQZrJPUdVOO1QN+E8zSrz47Vw8O8+lU+APqdY4fkLllmHX+I+R1BTso/W/uzApZ0xto0dAvyZIez0+tfrz9L9rHbg6ddbV8KQApLTqFzjmjcR83J7hDCg9yXcvriH3IOCLB0P5vCXK4ZwpiTFeVibWblt7FpM0ceUB5qd6nmCup/u1+HQho9dZPI8HpbdFas+lYLUnhesyEPGTmAN3D3urEuVM6kSvnrzjqPn4HOmz4jYx8ycz2JpQCbYZkKCzJOZbqlC6aHmyJSkYXsB6xujliA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31e53a3-5f67-4b17-e75d-08db76630adb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:33:16.0975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqFzHXICCNtPfawA1fMOaXLPIhmViuVhhpRaJp8gTFb0MvWuUejsaUKMKUNqFCCGuvBPTgaDOu/PpKaoz18TiX63RzsncB3xxsGt2Z5vKHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5583
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260151
X-Proofpoint-GUID: FrSgtLm9dx7zcSaPr2-rKDAH9OeJ8u50
X-Proofpoint-ORIG-GUID: FrSgtLm9dx7zcSaPr2-rKDAH9OeJ8u50
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:38:37 +1000
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, chenhuacai@kernel.org, sebastian.reichel@collabora.com, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, l
 inux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/26/23 11:19, Russell King (Oracle) wrote:
> On Mon, Jun 26, 2023 at 12:13:20PM -0400, Eric DeVolder wrote:
>> +config KEXEC
>> +	bool "Enable kexec system call"
>> +	default ARCH_DEFAULT_KEXEC
>> +	depends on ARCH_SUPPORTS_KEXEC
>> +	select KEXEC_CORE
>> +	help
>> +	  kexec is a system call that implements the ability to shutdown your
>> +	  current kernel, and to start another kernel. It is like a reboot
>> +	  but it is independent of the system firmware. And like a reboot
>> +	  you can start any kernel with it, not just Linux.
>> +
>> +	  The name comes from the similarity to the exec system call.
>> +
>> +	  It is an ongoing process to be certain the hardware in a machine
>> +	  is properly shutdown, so do not be surprised if this code does not
>> +	  initially work for you. As of this writing the exact hardware
>> +	  interface is strongly in flux, so no good recommendation can be
>> +	  made.
> 
> Is this last paragraph still true? Is the hardware interface still
> "strongly in flux" ?
> 
Russell,
In short, I don't know. Specifically with respect to the verbage you point out, it was
present in most of the original Kconfig descriptions. Some archs are probably in better
shape than others, but overall I've always see people issue caution statements around
kexec/kdump.
$0.02
eric
