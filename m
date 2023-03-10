Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D63406B3A37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 10:19:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY0rF4lvRz3cdK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 20:19:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=QTDfe9F/;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=CZvJMH37;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.155.168; helo=esa5.hc3370-68.iphmx.com; envelope-from=prvs=426ffb546=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=QTDfe9F/;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=CZvJMH37;
	dkim-atps=neutral
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com [216.71.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY0qF0416z3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 20:19:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678439944;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mh2ueymrj7czzT7GtkczhUnwPi5VvVdRNyQ7JrvHfcM=;
  b=QTDfe9F/V8JIr1VBcYYJFk/WMoL60t2D7ZoEZthTNFBdzTJC7sIpFepA
   0yssUpR/YucFlD5Sff4kZMnRvWQrMsvd2QwOeMto9G4CMrUGxIIEiV76R
   mxUTh1DCFCJ0XyCBS0UbpSe2Vjhcgp+cxaf/cClj/6uOMjG+0hOMcfvS4
   M=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 99102769
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JtusRK/OavLdGZ3uCnMXDrUDNX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GAWWGDVOKuIY2Sme4pwPdmwo0sE6J/QzddqTQJp/iA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklX0
 uAmK2hXViuDguW27eOUcsZ8uecseZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr6exHuhB9xDfFG+3uJOrWSOgWAvNCMTZVTig+Tnsm6ZROsKf
 iT4/QJr98De7neDS8HwdxC8pHOeuxcaHdtcVeQngCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neLkMnuHidHq6CORDSW8bL8hTyoNCcWLUcGZCkZXQUC/t/vqZ0yiRSJScxseIa3j8f0AjX5y
 SGiryUkgbgXy8kR2M2T+VHBniLppZXTSAMxzhvYU3jj7Q5jYoOhIYuy5jDz/ftGaYqUUFSFl
 HwFgNSFqvADC4mXky6AS/lLG6umj96BMTvBkUZ3FNwt+iqF/3+4YZsW5yN6LU1ydMEedlfUj
 FT7vApQ4NpfOSWsZKouOoapUZ10ne7nCMjvUe3SYpxWeJ9teQSb/SZoI0mNw2Tql0tqmqY6U
 XuGTfuR4b8hIfwP5FKLqy01i+9DKvwWrY8Lea3G8g==
IronPort-HdrOrdr: A9a23:cJoaBKOm7wHldcBcTjGjsMiBIKoaSvp037By7TEIdfUnSL3iqy
 nOpoVl6faQskdlZJhOo6HnBEDtewK+yXcX2/huAV7BZniehILAFugLhuGOr1KPek3DH4VmpM
 Jdmt1FebrN5C9B/KLHCWeDYrQd6ejC34ztvOHaz318CSFGApsQn3YLe3Sm+wZNNXN77NICZe
 ehz9sCoyC/PXcaasn+AXUaRe3OusDGj/vdEG877jAcmXWzsQ8=
X-IronPort-AV: E=Sophos;i="5.98,249,1673931600"; 
   d="scan'208";a="99102769"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Mar 2023 04:18:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3cAHFupXgiLqlR4UYUipZiXR/MKnEZKZzhc81DSpZ/iPNGZnyV7svywErGjgNQV9ENj/hvkwNBO7ElzDs66/65Oa45Yv+e6j94H+r6NcnZMKN8NzvUhvZsICUhZKzeHoRsBhURLU3FsQvG6FCi4PrQzkwofkoSQocpvz/w8nrM5CAU7zTxgxudh3Wti3ec5GTSSciAELvmE2IEJ3BGIlmpsZR8rZcQP4lSHZedYdH+LhMyIZW89ehrJUUXNzyc1dFlYNu1RC86nWwZF2deHAKginZC9D2WqeMowSzPpp61jx8lc7/yvDnxPLSMykpqtc5cN1p5gJkswVM4sQ7lJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isv7pyswxh4k7JvnZXYR3aaQSe4UF5A2aKOxjW1mFpU=;
 b=FL2AH6LbdKxdL3CwOYra7m/8gu3s1kBtPj9AVz7GhYmgkP4exIJIg9YYx8WMdi/f1Ki5ZH4HU51xYN+yZG2oeVznBSlpzGpx+0wptNSIU35D9rmcqVx+HjR5GUfcpkE9YcwrY5cVv1TJvBr+1+HxJ33nqqL3oHB0+BMn6DdptnXxvj19/ZXWOP66S48Cdlr2ByFcIUAQYXFsr/VBnbtij7EUN2/VyJ7eFt1JqLZZz3ZmFAjMNl+mlTS4PMRGgPB6QBE/FS6BrOKm8Cbk6zeNsr4S2G9oV1JJak39TyMyS8GVvKp8cVxZnUf0OPPE+DLz0OPWIC6XQSGWVSValSzP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isv7pyswxh4k7JvnZXYR3aaQSe4UF5A2aKOxjW1mFpU=;
 b=CZvJMH375ij5f0xTyy2ALIIHGVor6d4M2Inp69vlAMfkow/FjB3Vu38rvNQiFKoHQ13QsutWWIVulbZk+0Ky/+jdbv5ujVXyWd+TElFV54UbR0kM7y2kYk6iCfyeM9Rk58RS4ohIi8VuqBZ9Pm/Xy+ImBR1qkwhM7RP97x8ZTW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH2PR03MB5206.namprd03.prod.outlook.com (2603:10b6:610:a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:18:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:18:38 +0000
Date: Fri, 10 Mar 2023 10:18:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
Message-ID: <ZAr16LM+qpGqa1h6@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
 <Y4nkFZal7oy+aICa@Air-de-Roger>
 <Y5cgYLNwtPbmP1JL@Air-de-Roger>
 <ZAm8BDGTMaI0XmMI@Air-de-Roger>
 <87zg8lo7fw.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zg8lo7fw.fsf@mpe.ellerman.id.au>
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH2PR03MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: c4548530-6aba-478f-e1bf-08db21486ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pI+ZnyWZZSKqOaRA79Z9OpSJLCSR+6tbSFL2pSwqcAOUcYj7Ltz03JeoH5g4xNPks2qMJV8R9SnG6xWdOUmwHAcrtHT9g6f/ZrWhRiwfMZDe/EAmipiSatsnR70fE707PNpIrLK0ddwvFbxwE8hsdiOgXJy9cURiV4mo2dkSUN6j8kX5E2LfQyj0pW6RRV7q9RgRcveW73e+062UUeN5A9OCjcAYmwDDTtIyuxaVBm3hu1B2o13nTuOIg1V1FY5p/HgAOFVjqSyZ2xbI0kQ49XoUPUcDYh52Q9/C7Au4eOs55MYE+7oM2fLBMfIJV480J6dBA3bE2gHOt8vSN1WXWrTtR5CdUv1iKh2Yze1GGGi41krwHSjoV3Col0OzwsXrd2459BmSaxkgLuTOmAfGPfq4E5606oAbBGlgD47/HJFjqHwQ82r4ioVSH3lBp5ICY1UZnnKseCZt40u22BVnRZqBo7kusATZJAf1RLMZFtJK34neDvPSXEYhvCFZFS+NPwn5K/ibMd5cXXbo4uRAMQXOYgrvPj/fNb1PAL+UrMT/CTNqHhxpVlpEDI5MJ5C0gbT/UHNrwbki7nMJyC8Fk17ER/29YzD/bSBMXOh1u29EpIru2rBcUigj/l3A36oyTLSePUoSyUtVuHORSwXhUTs/ExAkAowv8rYVUX9bY6crLULrBAfXh+gitfuiTngp
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199018)(85182001)(6486002)(82960400001)(186003)(26005)(6666004)(6506007)(41300700001)(83380400001)(9686003)(66946007)(8676002)(8936002)(4326008)(6916009)(2906002)(6512007)(66476007)(66556008)(5660300002)(54906003)(38100700002)(316002)(86362001)(33716001)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NmRRVTZTL0RUN3pLREhsNGdoZkJNU25WN3Fvd2ZnVjBoZ2JDZzlhRVRxRlVQ?=
 =?utf-8?B?WUhTYUk3R29VbzJrK0IxMFhWQ1JqM1ZIZ3JIaWR6b3o0b09CdGkrRXBOTmRP?=
 =?utf-8?B?ZFVzK2Z2KzcxbHFsVGZkTDNRWW5NQzFnUjZ3UWhwQWNjTituM2N5dkltT3hR?=
 =?utf-8?B?eEtkWHM3L2ppMDlrZHdlZVVUZXBnQzVoYUU5WVVEMllleVNlb0Y3OFZRWlNR?=
 =?utf-8?B?czhKdkR4UlhWREQ5UHhpb2ZZaStORXFVUjJ2UXVPYkRraUJIWW9CR1dRUnE1?=
 =?utf-8?B?TGwwcWVkQTYzSlF5MUlMYW1rZDB1RXVJcDNBalpTYlhRTFJBNUoyUjJqcGhW?=
 =?utf-8?B?d3hYNVBDTXRCd2xyMXRqWkVSbERDRWhrQlRoWmJOYmJtK0ZSS1R3bUpFZS9E?=
 =?utf-8?B?K2k4TWxsVElSNU5YYnlBMlRLSlBiZERuRXp6WVA1MEpwTUIyWGVORFAxY2c0?=
 =?utf-8?B?UzhQYkZLNENtTmp4ZGV2dFdGakNZWnB0L0tJcVZ6Y0l2bFpFWTlIL2MvZ3JW?=
 =?utf-8?B?VUwyWWZYdTVPakxEV1hod1p2UytKQUc4L1VBTDV0Lzl0VXRmeUFtaGRNL0x0?=
 =?utf-8?B?c0M2WUVCYXRScU52SFQ5NVhIdEJDVjQwbWhJcUdCTlBMeUJwOTJ2S3orODlB?=
 =?utf-8?B?UCtVRktzRlNmZ0pBdXBvQ3RCRXJGWVk3T3ZlSVBrdDV0bjFLQkRQS3JGQ2E4?=
 =?utf-8?B?dTA1aVVteDFJcFhYOXdVeWh5VUJ2VFh2ekRJSkZYTFRDR3F1Yll0cUorZ0Nv?=
 =?utf-8?B?QXNsc256L1RENWNWdVZwREcrZ1luRUhhQm1PRUR4dHJHWUsrRkZKak0xb3Ux?=
 =?utf-8?B?cmlKUmNYM1VYdkg1NlZ6MWE5TFZNenBsZVVrdzVrZnh4RnRTZGpMc01pVi82?=
 =?utf-8?B?cXhsa1ZzdktmODRjMldFLzZoR3FnTnpqbXZIV0xDUDR3dGhxYjFWcUFxbnlO?=
 =?utf-8?B?NFp0OURIVHhnd3h4UjV3OFF1emRvNEpDLzZsL0tHbVRjWG5lWmx2WGE2L2Q3?=
 =?utf-8?B?a3lyVFA4bTFQK3NjRlQ5RU1UU0NLZXlERnJXVjMzQmwrQWJjMjIrUWhkZE5J?=
 =?utf-8?B?clBmRTdLVWRQMlNmbkVvdE94eC9ZREZ2dkZjUkVsVUFaV3VaZkFubEpZVHlW?=
 =?utf-8?B?MFUyWWNKb0R4bXBvQ2pjTlpmc2pSY3BqVzFjWU5vcTE4ZHZWWkZGZlhOekhz?=
 =?utf-8?B?aU1TVjlhaUNpVW9NQ0xiZ2ZuNldIMGpaTWN1K0xQM1NuMzY0Z0xTYTUyVkEr?=
 =?utf-8?B?NnhPRFBGK0p5RjlneUdhU2ZwZFpJKyt0TkJHalQwZlhXelpOMjM5RXFMRWJm?=
 =?utf-8?B?T0U3Tk84emFpQmN3RWRtWTRaMUJOUkhaOElJUS9RdkN5dzlrY21xdmRNR3dC?=
 =?utf-8?B?K2VsaVpmRkQ3dnVhNThxK1JKaURlSkFRS3prR0NpK0syMEdNeFJ0MVErZldD?=
 =?utf-8?B?VjZNUFBVY0pGS2loLyt6VTlBV0h2ZU5RdDRWNDhodVRKcVk4dmNoQXJJWG9l?=
 =?utf-8?B?dWE1amhhRTgrczJtNTRWYW52Rkp0TWduTVBDVnozSlgxOUQ0TEtnaW5UcXlz?=
 =?utf-8?B?SS9kY0x1OWxXRjRKekVlRUNmYW40SndwdnU4ZGVwTllMNHEvNGVTUG5zNmVq?=
 =?utf-8?B?T1pmTVpKK1EvZWprbXVqaHZlemdkWmxWVkUrTndEcVJCUk9ONEs3a3JFVjIy?=
 =?utf-8?B?MFVzKytZRnI4dVlFc1RoUWp4bmw2ajl2M0xHMGNyd3pwSGhCVTZUQXFxR0ZU?=
 =?utf-8?B?K2tRUEd1bnlpbUk0Q0RZNXkyTElVWnpNQlp4bTQ2WU5xNWVmN2FibExCYTk0?=
 =?utf-8?B?ZzU0MnRZVi9hRXJCazdITkhscGtQYWxNNEE1dkNxZ0RoUjVqZEhlOUVKelps?=
 =?utf-8?B?aXRrSjlRa09DZzhnU09GNHcvWjQvcTduTk9WSitqUEV5TG5QSUJvM05ManZI?=
 =?utf-8?B?aUVZdFhkMk0yQ2x2TytFaHJwdFNYUWtHVTgyZEs5TDZjeUgwWEMxUW9ydWZj?=
 =?utf-8?B?MlFVZHQ5T1hOd25McTE4ZmRYbmcyZjQvUFNjdXdjL085WEJSWWY3RTJ0S0dD?=
 =?utf-8?B?RVM3U2RNOHd1dFZVQVJVZXRjR2QyNXJlWVNxMHN2TEQrUitFUHFqM1dZNVZt?=
 =?utf-8?Q?Nq1AvQ6AywcwV3uOHSQkxzl6r?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?amN2Y0Y2ZG03cEQvam12S1NNRFo3em9xU1dxaDlsNXBaK1VvTzg2RkRPTlRu?=
 =?utf-8?B?ZEczRHV1ckhSMWliaExKOFBLN2Z0TkgrNCtvS1ZpdFlsWmtpS2xGaGl6T3hY?=
 =?utf-8?B?Vkt3VWZGYWd1dTAxNnFlNWd4SW9UalcreFB3YkU4L21idk9aRjlqYkJHVDk2?=
 =?utf-8?B?cXMrRjZxdW9vNFQrb2tEU3ZkcDBIK2tSOVAzZXBuUnQweGZnUndhQ1NsS1F1?=
 =?utf-8?B?QnFtMFNJZjk3QnZ1cStHOHhud1NWWTIvcm1VMzB4NlBNUUJmMDFqUlMwN2Fu?=
 =?utf-8?B?MisySEIydzcwd0hTZlNmZjJkNWhSczl3Yk9Bb3pHb0JSVENscXBxcVQ0WDBD?=
 =?utf-8?B?RkxZa3NNOHVWNnhCRUxxbExhUEJUTFE4K1p0QnpUdkFZNHFybS9KSkJpckUx?=
 =?utf-8?B?NGgza0ZOaFlEWFFDZ0dBS2U4anYwYU5UMmkzclh6ZG1UQ1ZvS3FJaFFoK0Rv?=
 =?utf-8?B?bC9tOGlTdWV0NnIvS29mY0dpSTFBYllwRk9rY01iRGE0YitJU2FzK3orbERr?=
 =?utf-8?B?Ylk2eXdINWJFOTN1UEJscFZVYll4bUdLRGFvVkp0N1B3dExiYVQzdDBNSzFp?=
 =?utf-8?B?Nkw4K1lXZlhwTGJVd3BUSGltcmNpRXZVQjFZQmhUdG9oUFRIZGxkajN4V2tp?=
 =?utf-8?B?N0UwVE5OdVdpTGRiNEltbm1uSFllcE4xOHRhZS91UmZUSE9hQ3hxQkcyZDdW?=
 =?utf-8?B?LzFOOEpmY0F0SHFZb0p6Z25QeUxVSXI4bUVBdUs4QmVHWmdTbHFyd05kdldy?=
 =?utf-8?B?ME4raUdLNWxaSXg2NTlkdUQweEZrVE1UVXg1cmhSNVdNQmQ0YXBXa3hSejhz?=
 =?utf-8?B?MjhDTmZyVTJRTG12ZVQ5dVJHZDJaQUdvdjBwaEtubnZyWGJ0MWZHdk40TVVR?=
 =?utf-8?B?ZDg0Y2ZlUWNzbitUSkJ3WHR3Q3RrTVBtL2k3ajc5cTA4VzI0S0lVWGFOWUNx?=
 =?utf-8?B?UU5CSElKUS9QN3dpWDVraTUrbjZEWXZyMGMxRHRTZS9EVEt5Uy9uSlI2UFBJ?=
 =?utf-8?B?VEo1L0tRdmRqN2pBZ3VDWnZsQi8wV3Y1dCtxYWdRcFNjZjEwckpsQjNaWU9t?=
 =?utf-8?B?OWNTOThzSU5rQWdBUXlQQ3ZMeDl1eklkamV5alU5aXBodmxYbGNDNG1Tdnpa?=
 =?utf-8?B?Z0xTbnM0enVHV25SWUpYRlVyL2hRU1V1RU9kQzRwVDRTNXZ0bEpReVNYL0cx?=
 =?utf-8?B?R1ZPc2hWME9yNXhURGpRSW50UVNYeVhUMmRlOVZLVklBOVBCdHlCdkg0Mm8y?=
 =?utf-8?B?WFBZaTZMRWhXZU9HSkg0TXJyOG9QRFNhWFgrNWViK1VUcGRxQVFjU0txaEMx?=
 =?utf-8?Q?safIwPNU7S7SydN93fn9H+aHuretHgaJtK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4548530-6aba-478f-e1bf-08db21486ef4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:18:38.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnsamIzCoRukN23yQdXuyERRG3a4VqluDdcL62tciiEagrn63HaHJHXVq9G/TsF8dbht+UtlKoLInmrdri/K1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5206
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 10:01:39AM +1100, Michael Ellerman wrote:
> Roger Pau Monné <roger.pau@citrix.com> writes:
> > On Mon, Dec 12, 2022 at 01:36:48PM +0100, Roger Pau Monné wrote:
> >> On Fri, Dec 02, 2022 at 12:40:05PM +0100, Roger Pau Monné wrote:
> >> > On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
> >> > > On Wed, 30 Nov 2022, Roger Pau Monne wrote:
> >> > > > The hvc machinery registers both a console and a tty device based on
> >> > > > the hv ops provided by the specific implementation.  Those two
> >> > > > interfaces however have different locks, and there's no single locks
> >> > > > that's shared between the tty and the console implementations, hence
> >> > > > the driver needs to protect itself against concurrent accesses.
> >> > > > Otherwise concurrent calls using the split interfaces are likely to
> >> > > > corrupt the ring indexes, leaving the console unusable.
> >> > > >
> >> > > > Introduce a lock to xencons_info to serialize accesses to the shared
> >> > > > ring.  This is only required when using the shared memory console,
> >> > > > concurrent accesses to the hypercall based console implementation are
> >> > > > not an issue.
> >> > > >
> >> > > > Note the conditional logic in domU_read_console() is slightly modified
> >> > > > so the notify_daemon() call can be done outside of the locked region:
> >> > > > it's an hypercall and there's no need for it to be done with the lock
> >> > > > held.
> >> > >
> >> > > For domU_read_console: I don't mean to block this patch but we need to
> >> > > be sure about the semantics of hv_ops.get_chars. Either it is expected
> >> > > to be already locked, then we definitely shouldn't add another lock to
> >> > > domU_read_console. Or it is not expected to be already locked, then we
> >> > > should add the lock.
> >> > >
> >> > > My impression is that it is expected to be already locked, but I think
> >> > > we need Greg or Jiri to confirm one way or the other.
> >> >
> >> > Let me move both to the 'To:' field then.
> >> >
> >> > My main concern is the usage of hv_ops.get_chars hook in
> >> > hvc_poll_get_char(), as it's not obvious to me that callers of
> >> > tty->poll_get_char hook as returned by tty_find_polling_driver() will
> >> > always do so with the tty lock held (in fact the only user right now
> >> > doesn't seem to hold the tty lock).
> >> >
> >> > > Aside from that the rest looks fine.
> >
> > I guess I could reluctantly remove the lock in the get_chars hook,
> > albeit I'm not convinced at all the lock is not needed there.
> 
> I don't know the xen driver, but other HVC backends have a lock around
> their private state in their get_chars() implementations.
> 
> See eg. hvterm_raw_get_chars().

Yes, that was one of the motivation for adding the lock also here, and
it has already been mentioned.  The other is the usage of the hooks by
callers of hvc_poll_get_char().

Thanks, Roger.
