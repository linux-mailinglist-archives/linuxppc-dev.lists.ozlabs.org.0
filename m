Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAC649EF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 13:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NW1PN13Fxz3c9x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 23:38:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=H2nhZiZB;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=wybwJWAw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.155; helo=esa3.hc3370-68.iphmx.com; envelope-from=prvs=33806dea2=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=H2nhZiZB;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=wybwJWAw;
	dkim-atps=neutral
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com [216.71.145.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NW1NM13PVz3bXK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:37:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670848627;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B7sDTSniKj0XTjdjSECBI92esaRkzXjEuJ64n6AeyRc=;
  b=H2nhZiZBzbBwS6I8siPLJOUuZatTrMGt/DL6BN8ktsopd4tlESOFMXzl
   UpYaCmbgkKTI0pgde5M+XdhmbKXWWKZ9+RsUV0eZo1M8htQY2yKwegVvB
   ub/RjR2LzRSH1SCS2crvw6bR/H/+WkuyJCnhtd+LYmgprokqgG3dOguQh
   o=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 87886569
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D58RWq2jXl0sfibyY/bD5ahxkn2cJEfYwER7XKvMYLTBsI5bpzUDz
 2BNXGyFa/iJMWTwed5yOYW+8RgHu5/dyYQyQFE9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZnP6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDEdT8
 vUDEjs0S0rYpeWvkLbmFthXv5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlF0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r82b+fw36lCer+EpW90uxxuXqR21c9GT09a0a+pMins1axDoc3x
 0s8v3BGQbIJ3EOxQ9b+XzW8oXiZrhAbRtxcGvE77wfLzbDbiy6bB3IFVTpIYs0Ot8IsQzEuk
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsSQoD/smmo4wpiB/LZshsHbTzjdDvHzz0h
 TeQo0AWl7gVyMIGyai/1VTGmC634IjESBYv4QfaVX7j6Rl2DKanaJav8kPz9utbIcCSSVzpl
 HoOltWa7esOJYqQjyHLS+IIdJmj4OyEK3vbmkJ1GIc69CWF/GSqdoRdpjp5IS9BOcYeeCT2S
 FTUpBgU/5hXenywYsdfZoO3BMMCwKz8GJLlS5j8ad5JbLB1dR+A+WdoaFL492TsllU8ibk0f
 JuWb+6oDG0GEuJg3j6/Tfxb1qUkrh3S3kvWTJH/ih6hjryXYSfNTa9faQPfKOck8KmDvQPZt
 c5FMNeHwAleV+u4ZTTL9YkULhYBKn1T6Y3KlvG7v9WremJOcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:gho7s6ryzCAFvLc0tyJr/pQaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="87886569"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Dec 2022 07:36:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLo6ow+qgVwpnNLrgiHSnv7S7iyPZkORvBk9fHSVLNbZbvQDFZpdrTlrFUjPseWmE1hKeM0u1P/dZrW0gvxGP0crJpkMMt8SIluhdeOB4T7r6+Ip6WDr93qR1T6n+5YWyuxVuiGB5E99A2e6A5R1Vk/q/sHFNU79SlTEum4TxoYdAwlt+Qmv8UCetdkIgbW87sAJsWuYl7qBkdukTvlUrBkkH2FjrZAHaH3Nr2cFpCunGPHmyvGx9eDyPQehCIjPtegQ9eviz0IwLJ3MJSvWQfNvtcBDHN9SY6SmHcH3aCQLnFrm7g6WwOYF94uJ8glLQ0B0s3yV4szvE+gI5FW9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRu9Z56sEmMx/fvaUg5qa1RdF02e6Nvl5C1TgIr1ywE=;
 b=EuM0ejCUJGIKWxm/sUfyuFwz6dkUST8VwdheCkSUaBJq7p9FemQ7o/+tt/XhTARF/zGZqm/3Zyi09p0w9x1S5Poy4Srf8nAEy+gCvur8S/Zxr983m6s3r667M5Ctw/nXEP92Whd8fP+/SSZCS/V+VzSIscByeDNv6AJW0ZIUHpKmEB43YXub5xxgzDWqlhra07l9K1cdonUWnY/O1RQ4f6N+MaG9sRzW8YH+2MLhaPXCiyuxMzgdr/DbBZ2FhT4SOV3CJell9CPq3rHrk9egEr9AwXheCOwt6EseI4pIAN9YUwWXc2TStLRDD7cWJD6wTR+iNSqAD69U8ohAcJ53aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRu9Z56sEmMx/fvaUg5qa1RdF02e6Nvl5C1TgIr1ywE=;
 b=wybwJWAwmEcwx/j9RAv+Y6bVtJuhFdWELtCo5Qoe4u57yk8OayWMC0H/ps6Ec5xZwTL9JQ9CWadT+U8/Xhcj+diG752RW8ZDkXWMELoi2jV3GSN/930crw0fCIEFiPy3/XFqVWo5APJeGg7HWk+RBgd3anKsQhxwZH61BlKxlGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6333.namprd03.prod.outlook.com (2603:10b6:510:be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 12:36:55 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 12:36:54 +0000
Date: Mon, 12 Dec 2022 13:36:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
Message-ID: <Y5cgYLNwtPbmP1JL@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
 <Y4nkFZal7oy+aICa@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y4nkFZal7oy+aICa@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: b8306172-1773-4d7e-57ea-08dadc3d8d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FHVN4pu/HbWBPcETN1U16RxdfuWY+rPsR5HCnj+NUgBcBA/hgtA5vCM2a5/WIdv2q0xDOGhrLb0CIUVNIPCqItX1mOXaOof/J27uSFBRs11RWNkwmbSgfEX7g17Mqss6W4PId8CnDKOIXS4r25RJVTknT+V8cpJiXlx/k8QteSRrELCqIpWyU9xQOHUU1+ugp9PvugMeWGErg/uvOlpdMHXVQQzdQwncLqFaodmpvEuK5/Je+Dz71x1zoCjYxpCM8GSf3xZwZ/a2krv/sdlPiukJrWYOEWqSfpCBDRf8xZAck7UnRAuvdWldmmzEPnHnkSFw2TyrvqWmswu6W+cEyVJZgift/KblrL7K9W7eNaiAn/Qnre3JEnZk9vZ1AlD+/D6mfe5mI0i8pOtTv7oFUDAL8LlgDEHU0wmpaSDnQ7laauB9L4aEM4Cq/jst1WYxLQ4739eawG7GwB+l6XlWs5lcYOXOJqm24XuaE9UEL8ko1NLyEaWXRgCcpLPby1/Tk3VbCbhm/idLSUkB/xNOrUP1pbUdphp8Ui1T+bPJtJrL5Dk/6YJRL9MJWvF2IC7CerTtz+Hi3AX+66CxTwa5N/EiST8IWyv/LmWAFokw8X9eXsi/PpASr4IMIWGH01Av
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199015)(85182001)(8936002)(6666004)(6486002)(33716001)(478600001)(82960400001)(38100700002)(86362001)(41300700001)(7416002)(5660300002)(54906003)(8676002)(186003)(110136005)(66476007)(66556008)(66946007)(4326008)(6506007)(6512007)(9686003)(83380400001)(26005)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZmxEUWRtazlLdU5OZmw1NXZXVzFRR3RlMmVFdVdpb2lYL0xVMWVUSzZxbUl6?=
 =?utf-8?B?emdPbFEzSnR1ekl5cVhVU1dISzlKZFpvcDQ2QmI0Y0pIc3J5cmR5M1hTU2to?=
 =?utf-8?B?VWp6N2pPRXJxdGlmUWFBOGVCWExOWEtpZURtRHNKWVN0RHpBblpFQU9ONG5i?=
 =?utf-8?B?clVNSmpTTGMzQ1o1a2hNOU1LZUpVd3g5eUlQaytmb3R3MHVTOWtuWUpHSFJZ?=
 =?utf-8?B?aXRUOTZQeUwzQVdxdjFMa2YwTGRYTk1ZL0YxSGFWYXBYeVhMMmVzUVhXQVVQ?=
 =?utf-8?B?V0JNVFZPSkRCanJncWRkWFkxbXZYZVdxV1BYQ05sVlNET3NMWmk2TzlWdlQr?=
 =?utf-8?B?QWhYQ29TS3NxSDU1ejYwRkpKN2RKUnhpZUR3R0R2c05iYTJxSnEwbFVzazdh?=
 =?utf-8?B?eENHWWFDKzJmRFI2dFdCdndubDhVK1ZlOER2U212VUR2bnVKV2I0UGZQSy9p?=
 =?utf-8?B?OUtFYk9uRlpyaHFDYUhLZkxMZEFPM1RFSFFXaUc5S09XUGVrY2Z6Q0dpWHlS?=
 =?utf-8?B?VHE1anpscDdMdWdSZHRhUFM2RzRtcWhuQ3VmRk44c21sMXMvaUJzSlRJblBa?=
 =?utf-8?B?d1ZwMjNjdFRDTmF3Tk84TjFJZ3V1Y0dyaVBKaHpRZ0Z5anE1U2IrR25xZkNv?=
 =?utf-8?B?NE1RL1M5TGFuUGhTWHpxUUxJaWpvODdodFAxeU1lMUtsZUJ1cXpsdjcxYTJK?=
 =?utf-8?B?S2RZVmQ0eXluemxuenp6MTBpLytZOFJSTnYxakNwSWk1L2VsVHQrakgrWS85?=
 =?utf-8?B?aGZuaVRTaWhlUzNtWWJUZzN5ZERNaEZhMW1Zb0d6UFlDWVp1MUFGT1VFQ3Fa?=
 =?utf-8?B?Wmg5Mk5RazhzS3k1UE11WGZuUkJMMnJxQWlWRHIzVnppV3d5OEVNaTk3T1dU?=
 =?utf-8?B?d1ZVZUVzaGxKWFNoSW1iaHV1MndCck9CSEVTTHdyYXErcG5oeUtibVcrQW1I?=
 =?utf-8?B?bGZvQ1EyQU1TM2dwQ2NESkNGSFN0REZZSmhYYkUyaGpYZ2pEL3hvSHNhQXAw?=
 =?utf-8?B?ckk1bmlINGthOTRHRHNZYkw0SysxNGlsSSt2enNhUDI2ajdhVnArNlNoUWFt?=
 =?utf-8?B?WkJjb0dEbHA2YjJZTmk0a3FRZGFMTlM5N3RRZ3QwYjYzYkF3cmxNbVZOTXdZ?=
 =?utf-8?B?L3pEc0xyQUp5YTdqcWFIUGp2dFBkV1pWYm5hMXRKeEZGV3Zvdm1YWUhxZUdN?=
 =?utf-8?B?NUdFbUFlK2NncHFPVjdJZjNXQlNJTkNBSjlXaTR1WHYxRkI3a0NYQURNQWp2?=
 =?utf-8?B?Q01wNDZhclZuV0RzdTJERkxwbnl6NHc3MURpUTVoQTNIMW1tZzFqeEx0N3FF?=
 =?utf-8?B?N29ORHgxQjd2QkY3K1d2TDZuM3R6UEViNks0QVovUlhKcVY4cmR2V1YzUUhV?=
 =?utf-8?B?cm5zUUJ5bTFZRElzUzMzb0ZDRmh1aGx3MnJLVGg1NFNIVldUakNJSnlPak9x?=
 =?utf-8?B?L2NGUXREaURaV3BsbmlzMzI3MTUyN3Jxd0h5azVpbFEwSXlPRlZoR0FiekVq?=
 =?utf-8?B?OEY1S0ZPWDc3QlRtTEZYTHY0ZmhiY1BGWERQS1NaZldTbExBUVNPMmYzT2to?=
 =?utf-8?B?ZlgxK2hYMzJxejZiMjExYjczdDREcGgvZkdvY0xuZlNpekEzVDhtemxmZE0w?=
 =?utf-8?B?WUhXWDM4b2xKTnplYVNrNmRDTmU0UHZiaTVXRVJkZnF3ZS9GV0xYZUFOOFI3?=
 =?utf-8?B?OXFZYkZTS3laUUNmL3VEYzF1TDlWaHZ4TkRua0JGUmVWVnVjZVdMWjBrZHNI?=
 =?utf-8?B?SlZaUThJakJKdUJBRFFGczdtTFh3ZGw2L1V6VDJPMVMzMkduODJyc25EeFl3?=
 =?utf-8?B?R1MyMDJSVUJJdk03dnQzSDJXdkxBcTRBQ1l5MnV1aFJEZThQQWFEZ1VEYTND?=
 =?utf-8?B?R1FjRENRcmQrNE5KZStvem13MzNTeGp3ejR5M3BvMnN1emY3N3ZxMnNab3Qz?=
 =?utf-8?B?TDAzNG13N1QwUUR5VHB4NVd2aXVVTWsxQ2QzY0JSRGxRbnkxd0ZTYzVNOWhs?=
 =?utf-8?B?cGRlN2h1Uy9vZThYQUZXaWhXaHpybnFQSVM0K2VrczU1bTFDRVZyNkl5S2xz?=
 =?utf-8?B?T0J6VldSaDNSNUtJVUtsazRmSEV6ZXhFek9hYm0yNmduRzJheTZPeHo4ZE5n?=
 =?utf-8?Q?ThpVtkhe2JdVdaej+1ax5/UV6?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8306172-1773-4d7e-57ea-08dadc3d8d23
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 12:36:54.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6XNf9KnrwhTTTSTQrbX7EZ/SW+9k6U+aLRapFkVor/+jWkIWjZ+bmRpXDGmLSKzGipXEG7rH4Ec4wUkIE6Keg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6333
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Jeremy Fitzhardinge <jeremy@xensource.com>, linux-kernel@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Gentle ping regarding the locking question below.

Thanks, Roger.

On Fri, Dec 02, 2022 at 12:40:05PM +0100, Roger Pau Monné wrote:
> On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
> > On Wed, 30 Nov 2022, Roger Pau Monne wrote:
> > > The hvc machinery registers both a console and a tty device based on
> > > the hv ops provided by the specific implementation.  Those two
> > > interfaces however have different locks, and there's no single locks
> > > that's shared between the tty and the console implementations, hence
> > > the driver needs to protect itself against concurrent accesses.
> > > Otherwise concurrent calls using the split interfaces are likely to
> > > corrupt the ring indexes, leaving the console unusable.
> > > 
> > > Introduce a lock to xencons_info to serialize accesses to the shared
> > > ring.  This is only required when using the shared memory console,
> > > concurrent accesses to the hypercall based console implementation are
> > > not an issue.
> > > 
> > > Note the conditional logic in domU_read_console() is slightly modified
> > > so the notify_daemon() call can be done outside of the locked region:
> > > it's an hypercall and there's no need for it to be done with the lock
> > > held.
> > 
> > For domU_read_console: I don't mean to block this patch but we need to
> > be sure about the semantics of hv_ops.get_chars. Either it is expected
> > to be already locked, then we definitely shouldn't add another lock to
> > domU_read_console. Or it is not expected to be already locked, then we
> > should add the lock.
> > 
> > My impression is that it is expected to be already locked, but I think
> > we need Greg or Jiri to confirm one way or the other.
> 
> Let me move both to the 'To:' field then.
> 
> My main concern is the usage of hv_ops.get_chars hook in
> hvc_poll_get_char(), as it's not obvious to me that callers of
> tty->poll_get_char hook as returned by tty_find_polling_driver() will
> always do so with the tty lock held (in fact the only user right now
> doesn't seem to hold the tty lock).
> 
> > Aside from that the rest looks fine.
> 
> Thanks for the review, Roger.
> 
