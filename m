Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB66405F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 12:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNrcW4RDyz3bh8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 22:41:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=a5qQMrmF;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=PbEfRCOB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.142; helo=esa1.hc3370-68.iphmx.com; envelope-from=prvs=3286be18b=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=a5qQMrmF;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=PbEfRCOB;
	dkim-atps=neutral
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com [216.71.145.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNrbT5L4tz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 22:40:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669981221;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Xty5QrePFdD61vX9gLf+bWucE4wh3C739XvdioDyAmw=;
  b=a5qQMrmFev/LjXXq0pd4XQ863XyuSS3qBR/Uy72+dwb5UdIShtUqj9jX
   rhVfbxerU3eUyhlx//XC7t/w68xUMRXOckekrru1kZJijyrm9/dQ9d3dF
   AFA9rPdrtfF2MVptC/fFf5x8d6ojRel/qgpTGuB/2W4gvWG4IVB9YHJ1w
   w=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 86659349
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lagO86seT2/DIoYrGqLT2b3KAufnVC5eMUV32f8akzHdYApBsoF/q
 tZmKTuAPvyCZmPxetB+bNvk8hxS6JTSydFlHgRt/i08EywT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwK2sfTEuDrLmMwaulZsxsqJsjPuW2I9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xbrI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXOlBt9DT+HpnhJsqH2YxH0/NhoxbmWYuMiQlUK6AdMcO
 nVBr0LCqoB3riRHVOLVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xCXIJQT1BQNgnstImSzs30
 FOAg9LuA3poqrL9YXCc7LaPqTq4KAAWIHUEaCtCShEKi/HnoYcunlfMQ8xlHaqdkNL4A3fzz
 iqMoSx4gK8c5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPAwVrU9/FbN66CU0KM+
 nMDnqC27uoDEJWMnyylW/gWEfei4PPtGDfbm190WZ466y6q5WWgbKhX+jh1IEovOcEBERfiY
 FXSohx5/5hOJz6xaqsxZJi+Y+wvzK7vEvzoUuzZKNpTCrB2cAiJ1CVvdUmVmWbgjCAElaA5J
 IeDac3pAXsEIaBm1yatAeAP1bYh3WY532y7eHzg5xGu0L7bYWHPT74AaQGKdrphsP3CpxjJ+
 dFCMcfM0w9YTOD1fijQ98gUMEwOKn84Q5vxrqS7a9K+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:zQ9lM623xoOi9V+roLibewqjBIwkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN9vYgBGpTntAsW9qArnhP1ICOoqXItKPjOW3FdAd7sSj7cKqgeIcxEWndQy6U
 4PScdD4Y3LZ2RSvILG/gmkDto6hPOm3cmT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="86659349"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Dec 2022 06:40:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y31lBoLXLCnef8KGytNNQiWsGEQaZq8cD624qUvKwiC1+CVFYSveUjgBdgnKoEDP306aJgHlxNIh8RnO5oFb3ep3mGgwNzcHo65NPzVdTw4FHqxEdWWaBHlDNi93D184MxrCdqjus+WRvzcEeh0kxr6hy6UAf/deSX3pZw7Ai5V9Jjc+2iFv+6NAe0TOvTaCqmvZPFUh32hK7yx6jk8lK5zYEjdX2JJsIlZLBQtgr1hiPaPuiT1YwPphVz1x5gDb/dmhPE9EoIHRfZfZFeWxSfiPraq3AZdUeBNUSSM00dayudnCRkUfh0gGOi6nFHomxzdJoTeGhjFW+AsBs0JGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/TzwSHGpP2p1Yz+lpbrnlAdsXzRUqR00WAaoANJDlk=;
 b=DdiGo/SYcaCoRG0Wgd6/9gl5CvrQIz5J5jAK0APUb+B+5uUvZXVjN3MbughFwo7HwO0H8x4TB2/DJ8q7X4XazxuX03xbKpMevyatr6UW1V661u56zZegfdkuKgc2+l3eUYIG23M9Vth/bHZBawKjQttTs0tEOqWiWqedMa7e+SrxhT5Iv8oHOY2SWpFIVZZFIpwMvBFsEBuQ4xeoo4ERJbKYD3OLOEj9z5EJBVF6v0PzlDamWOaFLa23aaX39A9G6N6DADLu899oJYML9TgpWEyLQZKVnErHsJW0wBGlRuuGIB2xajcsREjzWiZ0NoxLaeMnZVWUbWMDamEQe9P+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/TzwSHGpP2p1Yz+lpbrnlAdsXzRUqR00WAaoANJDlk=;
 b=PbEfRCOBgtyaLw6F/z8E/Iu12JpdcYkZxuJtvAbfSNm2n003abbRMQYm7bAsueo1p1DN+LhUATguHGPpfNBTfiVIQ6YgGbu5x5oWW69V1Ir1MQcvZriuy+eajq25Oxow3uxQsIazFzbRydLelrA9lXyxoqrFcfW8mBdnROdUDv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB5964.namprd03.prod.outlook.com (2603:10b6:408:135::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 11:40:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 11:40:10 +0000
Date: Fri, 2 Dec 2022 12:40:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
Message-ID: <Y4nkFZal7oy+aICa@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: BN0PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:408:e4::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d81d5d9-7c6b-4b3f-d064-08dad459f778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XxpYyIUKDkK0DCqc44EumRxM5SNJwkawwqNZj8U2+OJMpyxrvzB2PjF5pAvNYY2s0YdgvaHl5Kb2iqr9N4OMfRgIzqHhlgbb4Xq2XdJ+q8RjwEfUgu7s2wMQ9Dt7lfl5NfcwSk3UcrIUUaiNUmo5FvFnT4gv38+tAZuLmD/QMcg1lKzwFpHxjqemnqOpAxhFaX/KoE7zJCY5hB9XRbAXX20GlrtizXqCllbUKHIOt30YMuJMkQCOq7Hqwe3SS2EnJfZMqdESy/WSn7pNRJSSeCygkU0ji+zab/0fZl2DiIR49g5o44AisWbipLKZo/KrzBooB8lSmBbpvbjoYIcRSWM7qOBHjR+U2QH1P2Nms3mNYgM5sTyo2PLo90osH+gGKBMz3ApjGmfOD1060DyQvG4KG8veyUb3Ao1qT287lISFI7rkmu6RlZ9W2ZSBefHzsyqni62txWJiyRE+ttlPbb+5vM0xGIASvfXSzEM9G52Pe5/4r8CNpohaY4OaW2p9MF2V3h7jLs23pCIIivIBC8g5s29x1JLr4BK5UU8k9qAs0lxQUofbBQ/dj4WfhKACdW/ivP3k0sOkQqD4czB1+TY9gNKNs4r5rRDnbhONnAbi0wb3e/VDsBkmS6myz7KXmT0x6nHChS4bjPplKOMDBzIOUCg8QkYyTASOMyC+whntKED9GY2Pd14LboH7I+q1
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(316002)(85182001)(83380400001)(54906003)(110136005)(5660300002)(7416002)(2906002)(4326008)(66476007)(66556008)(66946007)(41300700001)(8676002)(82960400001)(6666004)(38100700002)(8936002)(478600001)(33716001)(6486002)(86362001)(9686003)(186003)(6512007)(6506007)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WU1NVERCZ2RZa2M5TDNBeGd3Zlhpa2xpVnhBTlIyZnJzTVhIcFlZU3BKalhi?=
 =?utf-8?B?OHVKb1B0ZGxrRFJ4OWhUL3NyMlM5bDBUNnBFNUN6dWN5SUhRbStoVW9CTk9P?=
 =?utf-8?B?Vi93c2k5T0ZOZm9waFJ0ZE5oaWxSVmVodjYwcEd2Z2cveFh6QVpPZUVXOFAx?=
 =?utf-8?B?UWRNTXZReFVvR0tYYnBzRWlKUk15TTB0bEdMV0JSN3g2dGpyOVdRR1ppK0tL?=
 =?utf-8?B?RGtTdnczbDlzYUVsTTMwUXZpZWtHTVgrd0hkMXpkekVucmFGbDZKeGNOaXhL?=
 =?utf-8?B?MTYzRG1jaVhtYXlkQVg1NW5HY2t4TDlBTVF3clpHekRIeXh4bE1LU1U3OXRV?=
 =?utf-8?B?bkNKa3BmUDZzVGNzWlBnQ2lqNTEzMHNOTVBESkd1cnlIcDFSMGI4QVdpQ25j?=
 =?utf-8?B?d3RFek9DSzN5UVAyTHJxdEdkTkpmTkJhdFRIYjFxYmd1WUZ2UHYwK09wcXdx?=
 =?utf-8?B?NzRoOHk3Vy83V1RYcFNtV3JRaXVnZWkrUC9CVlJVV2l4OEtqeTM0UjkxQW8y?=
 =?utf-8?B?Z3ErZ2d6UFBwVFZkT3V1UVl4TTRUbkpTdXVjTzhudloxTnpvYkxHb0pBVjRl?=
 =?utf-8?B?VzFYaHNBRXUrV3h1d1poTEtHZm9oYWNET2k5Vm92TkR4MGVscUtRSWwwSm93?=
 =?utf-8?B?SVAzT0g4OHVOOXIxQVlzemhpQnZQQnNiVUlwNXI0N0V5eWg2U3ZjZXphZEgy?=
 =?utf-8?B?R0hzdzVxQmdxMGgyTEtRbytVbzRqM25BRjZMMDZnYk5PTnJ3SzRZbnk4WGho?=
 =?utf-8?B?UDFHYXQyeVBjOE5jN0J2Q202RkZGZGI0ckxLNWNvMkZrYzd1RXZKeTJXeVBp?=
 =?utf-8?B?R29qZ2dMSFNNaVZjRHgzTlRoRXM3VmlNMUgzaFlvUk1uaC9sTXg0emJyU3B0?=
 =?utf-8?B?aTFIWFpuYmRxVE4vaVBRandOS1RlWVFJdU5JenV1cGlleHlvWTZrUHhYZEU0?=
 =?utf-8?B?dXM3VzdzdFZrMVB5emxvRHVBTEtYNkY0UlMxanNuUURlZHFyZ3kxbEU3TGZy?=
 =?utf-8?B?ME00MnlVR0NLWlEvUmZ4MTRscXFVYUt2b095eGRDL2EwWFR1c2U2V1pHdEo1?=
 =?utf-8?B?Wi9vZnBJYSs3SGtmRi9WOWdqRnRKbGlaZ3RRRHpaS0VRMzBacmgrMVF6VEN0?=
 =?utf-8?B?Qk8xUkdLUjg0b3ZaWVVKaVNtMnFsNEk4L2d3VjhkZHFJTi94LzNRRzZmcDI5?=
 =?utf-8?B?dGVPMDM1TFl3azJvVlRkVDBZNmswNjkrNzNtc3QyWXB2SVd4eVJVQVVwa3pt?=
 =?utf-8?B?RFFkTVhDKzU3SEg4dmdhTGdpODJJYy9oNDdFZWJxb0dRMStNaU9ucTRaMDJ4?=
 =?utf-8?B?dVFmNGpBWlNadWs3MWZ3MmpWNzNlYjdTRHg1R0VmYlE0VGduQmtHTFhPcW54?=
 =?utf-8?B?dXptOWVEMzZYRTBaWXJJZWFVM09iNXBkb2dQeHl0MHpLYmg5YWNvOGFFT3d2?=
 =?utf-8?B?dTB5ejIzNUNEQzZzVWdrVnJPSUJVVUJ4a00wcWFTbTVEam5GbmMwS2ROOHda?=
 =?utf-8?B?MWlWcFFSdldFYWFMaFlMcmNUbDdKM2NhdnBpVWVSWHVyRlZ3OUhBVHh4S2Vu?=
 =?utf-8?B?bFpzbUl2YS9FNHFDaHd0K2NLN1ErNHB2di9xTFN4ZnlhRUFSdklnT3EvY2d4?=
 =?utf-8?B?RjFMajZxdkkzQ2xqWmVwckJyZFZxRS8zZi9aamo5cXlkL0Z2QzM0MkUvYTRZ?=
 =?utf-8?B?Y09Ga0x1c2FKTHBNSyt3RHVKUTMvSUlvWEF6UUpHbXNReDF5UGxUK2RERmow?=
 =?utf-8?B?M3g1QjlTSGhvWmY5NGdkV3VqczRGSUh3RXE2MzBPTTltSFhnWGFpOEZxNGVK?=
 =?utf-8?B?SmlBQkcrYjJRNVowVFhkQlJUMXJzNXVueXVkbEExY3VkMVFmcjRQWEs2aG9n?=
 =?utf-8?B?Y2ZBT2JiVmVxMU1DejgrZVorQVl2N2dFVmNJb3FtRDlrVms3NDV4RHc3dVlU?=
 =?utf-8?B?TWlrdXA4Z3M0SXJwZlhIN2FUc2lGZU42MXdXbmZSaGNKT2VIRGEzcnZpRld3?=
 =?utf-8?B?Umc1c2U1VllGNFNIc1ZCVU1weGlVZEc1eDFZUE1MT3pDeitkTTJoSUhINnR6?=
 =?utf-8?B?TjYxckkwdGZxYU9GNG52NTNzOE14SHFvMWl5d0lSQjIyQjd2VUpLc282SGQ4?=
 =?utf-8?Q?tofOo+63PnIOyqjBm8SDRrfdl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?R3Z2MURNNzV1WHM2QkRIL1A0Z1d6QUtZYnlTYVRhZTlkRDRUeW1OL3l2d2RB?=
 =?utf-8?B?OStLRUhnL25CODRpWE9XbzFLeTNydFJmdzdNaWErZGUrZk1tNTZUeGxaZ3BL?=
 =?utf-8?B?UmhmeG5GSjZZQzRTTGwrelVmQ0NuK2dYT1VpeitOelFXUUIrLzVGbGsvbG43?=
 =?utf-8?B?UUFMUGxSSVNiTk9tWjBCQ0gyRm1STCsyRnpBY1NGRGtkTlVmNFg2a2RMc0E1?=
 =?utf-8?B?VTBwaGZuLzFjM2NNbDdCN0dRMDBKdTl5L1loYXdaYUluU2lhank0YlZBTzhP?=
 =?utf-8?B?dUR2ak9acmE3cVNqQUhNUnNXejBmUHpHUWMwdW9Nd05vK2NFS0tKaHFOa2ho?=
 =?utf-8?B?RVl4cEdyODhyd0w3eDRFV1NBQjVONHMwTW5VNUhGUkc5V1RDUERFeThja0VO?=
 =?utf-8?B?cGNjN2l6T3QwWnduNStTc2VqTjlSTG1VeXA4U1NUdGRSWDdlOG1pUFBMK3Ns?=
 =?utf-8?B?K0VJcktQZkZocVRlY0M2VkQrMXVlL2RlVWhCaGZpL28zT0lJeDJ4andnKzlI?=
 =?utf-8?B?NUZxVXVUWUtQWFkyUVVxbkllRkRZNzZScVBwY0gwZXdQL3hiM3VrWmxReklw?=
 =?utf-8?B?aGRmdE56WkdFaHlmV3JnaDRnWERLR0hHZjdPZzVZdEhDaWFwemc2WGJ1WExt?=
 =?utf-8?B?U1FuWEtYcU9WdTZUMmVPUVFqNEV3aGFidllLakpFWFdnMnNLZHRRV3ZNZHp3?=
 =?utf-8?B?eTQwcE1OemFScmxaMi85ekJNNHNVTXlRT25jMnRxa0xweExQaktSTmJnSzI3?=
 =?utf-8?B?SkF1OFk1Z2hpU1ZvemphQkE0YkFRVFI2SjN6ZzB5VzVXSktVVmV0TEpOdWpX?=
 =?utf-8?B?SWlrMlFBRHNneDlvVUNzNnFaT3ZKNWFadFRzQStPVkRaNzFubUZvUFBOVFIr?=
 =?utf-8?B?MVE1WHhxeU1SUXliSmVEN3Vka3hyTCtTVjRwZWhvTU5xaCtNRGNaNjVZRHVr?=
 =?utf-8?B?bUx3TUxCUDNjU1N4MzFYK01nWG9mTDVuVnhPUS9NbC9KVk1FajNLUHVaNlQy?=
 =?utf-8?B?OVZ5bURGVFRBamNYbHh5Y1ExcHRXRnFsbUY3dlZEVUIvRDRxK1RuM1pjZzFr?=
 =?utf-8?B?RFZmQmJxZGczZFg2QzJNQXovek9tRkxRb0EwbVFhSlE4ZTZWMEE2QU9MMVl0?=
 =?utf-8?B?dEdHN0VWKzA4NUJKR0JBbmtGUGNrNnNrNElIdjlXYS9iMEg4MHIzblUxMS9q?=
 =?utf-8?B?YmZqVGRFQXRGem9SZ0I5RFRqeUU1RzB2dnFja1hTRWF3bUhoMFlxNldtckhr?=
 =?utf-8?B?LzVQVG8wcDhjaFpneVJUaXV5WU41NWRobTlGdElJenVUU3RHVXZtKzlnc3Jx?=
 =?utf-8?B?RnROVUpmYTdsS2hSWGRLZDFmZ1JKM1dtU0lxNlhKTDBVS2UrWnFNamcxaVVL?=
 =?utf-8?B?dms0NUl1VXZDalBqdy9nVzZRT0FHaWJKWDVKN3JWTkhuTDlkeXcyRHo2OGZq?=
 =?utf-8?B?TlZsUTZvN1l3RnMrT3lKOUMyTWkyMG0zSHA2b2MrY05QTnRDRUo4dGNyNFJr?=
 =?utf-8?Q?Nrfr8FrEgEenhl/PIfVoL3rTXXC?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d81d5d9-7c6b-4b3f-d064-08dad459f778
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 11:40:10.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtbOwEN71fvS74DHLfPx2rox/W3Vb+QEeE0oBSlwgRRfK7NiFi4k52rT3WNKVqbp+9RhUdwB4uOLmPb3FBtGjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5964
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
Cc: Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge <jeremy@xensource.com>, linux-kernel@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
> On Wed, 30 Nov 2022, Roger Pau Monne wrote:
> > The hvc machinery registers both a console and a tty device based on
> > the hv ops provided by the specific implementation.  Those two
> > interfaces however have different locks, and there's no single locks
> > that's shared between the tty and the console implementations, hence
> > the driver needs to protect itself against concurrent accesses.
> > Otherwise concurrent calls using the split interfaces are likely to
> > corrupt the ring indexes, leaving the console unusable.
> > 
> > Introduce a lock to xencons_info to serialize accesses to the shared
> > ring.  This is only required when using the shared memory console,
> > concurrent accesses to the hypercall based console implementation are
> > not an issue.
> > 
> > Note the conditional logic in domU_read_console() is slightly modified
> > so the notify_daemon() call can be done outside of the locked region:
> > it's an hypercall and there's no need for it to be done with the lock
> > held.
> 
> For domU_read_console: I don't mean to block this patch but we need to
> be sure about the semantics of hv_ops.get_chars. Either it is expected
> to be already locked, then we definitely shouldn't add another lock to
> domU_read_console. Or it is not expected to be already locked, then we
> should add the lock.
> 
> My impression is that it is expected to be already locked, but I think
> we need Greg or Jiri to confirm one way or the other.

Let me move both to the 'To:' field then.

My main concern is the usage of hv_ops.get_chars hook in
hvc_poll_get_char(), as it's not obvious to me that callers of
tty->poll_get_char hook as returned by tty_find_polling_driver() will
always do so with the tty lock held (in fact the only user right now
doesn't seem to hold the tty lock).

> Aside from that the rest looks fine.

Thanks for the review, Roger.
