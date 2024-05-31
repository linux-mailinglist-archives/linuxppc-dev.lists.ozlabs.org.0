Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970F8D5E19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 11:21:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=obrLnH0t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrHfp14Yzz3cV5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 19:21:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=obrLnH0t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::61a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrHdx4nljz30W7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 19:20:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Esl6ufamiFd65oeGrIFnImk7f1azAQv5j7z4G5paOX6frt54hCc0IQTUwPzlgxXoh3gKbAYl6lNyjTyO+f7HFHhrGKnE70h36gjuG7CFvviGwN+qSUNSc/gXAshMKge2WnnmHA4bODD6M918raHkaWY4smLtMZGQ6/toQ5hyMuOqy3DM65NpIOS2r6XNdQIFefSB0garQ7g/eCGamQ8spVmzXPqQYGqcO16vq3DKzgqk2oQVa2FO1+aPjvO4AlpA91Nwz5K1tNg+6eYj/QA8jxS8EMIIjeGQOua3TQwkTDChg5A5emtAsW2xT+mAAPMA5dsC5iozseM70Iz5nslSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqqRAMS/EXIos4XOWqk6Kr0AaO2lD/oSfSmBvCzl45w=;
 b=MtcSmVZ/r/awNJEmLBJJBwaaPxSQL0SgPX0FBoUqQRBcmx3W83fIySs4OsiRoRSwfT7UhH+HClmHrhQp0q/ap2HUsntq06p5WGWV8eW7XZxoQYYytMTum/vZrOA+/0ZxA3x75d6eOsjO6CZq0vzZwDwisWoRemL3rIUy6zxbxBojVNr+nFdAn/54z7RfU13JVNC5PX+tSj0Ls3mlqWYOPTGzxVntHqjqjqrT05sPm6Gjk81iW0+VUw9uZpJmj/JCWWOccuMd80w6d3A0MdL9hZd+LFKEiRShEtdraJV6uDmJ8A0Pdi0Ze95OgkBkJLHHA0cBMYd8sUlJPziIL/mfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqqRAMS/EXIos4XOWqk6Kr0AaO2lD/oSfSmBvCzl45w=;
 b=obrLnH0tAYnL7oINEMMqRK6IPbUewI7AqvNbwKRrjVFeZW8SopZBnFFUlp8QS8LAy50Zz2baJDxKEVw/+SgJGNZB6uTA66ti7iJv9sydyLN+e2+sdyl/xoEzC740QdH1fkIZ6E6/PsEP0ZENSBC1qegadURwmW3QYFcdzXrR4Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 09:19:52 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 09:19:52 +0000
Message-ID: <b370276c-cbe7-4583-a906-dd0ef9f5afad@amd.com>
Date: Fri, 31 May 2024 14:49:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
 <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
 <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
 <20240523144543.GDZk9WlwKpCKx8I3RE@fat_crate.local>
 <664e101b-3689-4876-825b-a5aa12b7978f@amd.com>
 <20240526090554.GAZlL7cpva88mMUbCK@fat_crate.local>
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
In-Reply-To: <20240526090554.GAZlL7cpva88mMUbCK@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7698cde1-e339-42d0-683a-08dc8152d3fe
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?VE1IRXVsa1YydE1HbnJwY1NGSS9hQU1VZWxEdjQyQkFEOW5NajJVbWdoUDZa?=
 =?utf-8?B?U2ZSZkdXdC9lbUVvSStxeTFQL2xrM0JncHlhOHlnS2NrSTg5OHVuVXhLeUt0?=
 =?utf-8?B?U0VLbzBmMkdFWFc5M1RpS2NRMTl0M0JwYlJmTXZTSmJ1YkJORUFKNitINlBP?=
 =?utf-8?B?Mmg5eTJYNElCZkgwYUhobUFtMGY1TEt1elRJZFkrdDBnWjJORWFIU1NVbkdt?=
 =?utf-8?B?ZENYaENuR3VxYnQ4N2RoeklQQ0dUMDhiMWtjSWczYkdpbnRlWFFBTWRaOUIv?=
 =?utf-8?B?amFtSzNUdzBrVzJ1aGxodkZicjJRM3VsV0grbmsyekpXYjFscHFTVGZUUFc2?=
 =?utf-8?B?RHppUE5DbmFoWjBsSmxwajJ5NWU0Vmx3VWlIcE5JaTVkUmhFa2EvZ0kzZEJq?=
 =?utf-8?B?ZmI5enJHVTR6dkROWDdZNUNNSS9KNFVKOS9taTl4TllYaThWMU9ieWtPZmVD?=
 =?utf-8?B?TlhaT0xqUWVZZVBjSUJ2SExBUFljOVBQQklVcHpTNklEVEE0b2dUOTl4RGR2?=
 =?utf-8?B?S3BTTFhQMFNjem1BNUp3aC92dFNTKytqTmN0VTlLYzhhSEFiSG5sTWhHUG1N?=
 =?utf-8?B?SHQ0bm1OcnUrNEdQN2xFRlQ1NmVsV0lPM2x1K0NNTXBVSkgwYXJmd1FQOUZZ?=
 =?utf-8?B?dHcyb3BsZ0h3OUg5OFNiR2pBdi9QaFlvdEs5UGFtdGJ3aUhkNWF5ang5UTVh?=
 =?utf-8?B?RDFORzRRZUErOXNGdU02QVNoR2xJKytoOEt6OVVmenFUK3ZNRi9YY0NjNHFO?=
 =?utf-8?B?MDlPa1ZMaHhDOHFGbjVqZXhuRlk2ZEVUR1IzbVNyRlZMNTJic0JEclhUenps?=
 =?utf-8?B?aVRKUzlySmszMncwSjFHOUZnZ2FhU1J6OTJKVEhCdDFraDgzYThPdEZNUnhq?=
 =?utf-8?B?ZVhkK3h6V1poNUVPMnd6bEJ6QmYyNXRGYzU1UmRDYXlTK1RqNFllekhMaFVH?=
 =?utf-8?B?eXhwNFNueWFkKzBVUTFIL2owWERVdHRoWm5ncnNnV1BvMjB3R3JhNFV4Rlk4?=
 =?utf-8?B?aEpHTjlWY0o4UW5WVlFtQ1RvU2FOOEExSE1ydnQ0SjVpN2RoZFd1ZUdLS2Fl?=
 =?utf-8?B?SE1oNlo4RWgvbmhEYVd2cDdzblBCNFhMZ0xOUEljdFVXYitGRHMwbGFTQktm?=
 =?utf-8?B?ZW5qTzFITXBNZnZSMklFRFladndTQndOYUtSbFJiV0ZuTUZ5eGFnL005QmRQ?=
 =?utf-8?B?K21YZFRpM2RyTDNCU0dBcWxQcjNQNFRzQlEvcGZ5ZlJjcUdvTmNHVVVJMXpP?=
 =?utf-8?B?YVE5eHVNWmZCei9VdlBNa1ZGc3F6bm5CcHZaMUVJV1BMaEgxZDYrUWVoTlgx?=
 =?utf-8?B?Y0w3Y3VpdHRRYWxwajA2d3hnTFU4dlVvdURaa2R5YzE2SWtxQlF2UGp4ODRG?=
 =?utf-8?B?YWxsTlIrSDJpcHAvUkpISE85N1pvRnh3cGNzbVl5bnJ1cmlSTTFESGtQTlN4?=
 =?utf-8?B?OXdXbVJWcC95ZEozRi9PdWFDUlRNQUFnSUJpNnp6Sng4aDFnUVJUM1BpeFIz?=
 =?utf-8?B?dGQyeUFGV1Ewd1RrcjFwa0EyUm9YQnhOSytMQlV5Q2lyRzF4a0NaSFI1RUdo?=
 =?utf-8?B?b042cE91OVBxcktNQkhjQ2NxMXFUVkgrajVwc2tQMWFXS0MwSVNDR1VTRTVz?=
 =?utf-8?Q?EvybIDU7/LQSxhx6eEx+B5k+1xqQ0U6lqwVOFaacP9SI=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?L2Zoc0lkZUZ3bmdxUk0wVTVzTVptd1dNUnBIN2VUREVSa3UzYjNBRmFGTGFB?=
 =?utf-8?B?ODE5NnhqbGo2ditGMFIwU0dqYmdzL2JuYjZaMlJUQysrUFVFdEVEL01rRC85?=
 =?utf-8?B?ekRDeGxoUWplakNkUVR6ZlVJZ2NIZ1NmTDZnUWg3Y1dkNFNTY2dQQytWRENy?=
 =?utf-8?B?SDZGMHExK2RuTnFMbUpsdUlJQ2dpTTdmMmZ5dFVGT2YzYXgrSGtZNnFDbFV0?=
 =?utf-8?B?Rlk0NCs0SG82QVJ4RDFLQVdEK0kwa2pNZFJjNXpJMmRYTlR2dkFwWWw5d0po?=
 =?utf-8?B?c1JHeVgxOW14aGtPSWsrbmtrUUFKOTVLNlkvTEUzSXlGSFppOXR0WGExNy9m?=
 =?utf-8?B?QjlxZEtpYWRoem9vbVlnMDdHbXB1RXc0bElyNTJVV0FnL1J3V3ZYK1JqWnhv?=
 =?utf-8?B?a3FQRmhtVTF3V3llRXRmR3hOd0VMekRaalprSFc1ZmZYNm81M21CQ0hva2Vj?=
 =?utf-8?B?REFRWWlwT3VLMnFlSDNXSm1XeWVwZU4yZzBleEdCcUwwZzdHQVFCUFM2WUF1?=
 =?utf-8?B?aDBpMXNaZlh3dW5BSWZkdEFVVEJzbG5KaGl2RHpTMm43WFJnOTRzbVBtYStW?=
 =?utf-8?B?bVoxWHFMeGVrUEUycmRVWVlKbmhZcHZPblZnaExyMVJCMCtteWJDcmFpZ0Y2?=
 =?utf-8?B?Mml1WDVrR0h4MTFOeWZOQllaWXIrbDQ2LzFleWRHb2tBcGFWQlhOWCtNWm81?=
 =?utf-8?B?Q1NCMlZrN2ZNVGtGL0VDUEpmOVE5LzdHam5zRjZiK3F1WDcwK240Z3o5b3VN?=
 =?utf-8?B?M0dRS1ZHZ2JaSXVacTgrRTZnR1RHUG1FRSswS1NsOGRGdUFUY2x1RUtXS2dH?=
 =?utf-8?B?SXpranBQR2Zwa1l6YXIyV0dMRHRHUHA0Q3Q3NUc0UjVMQUZFazk1cVB3L2xW?=
 =?utf-8?B?UGFHelZNWkthTlVlbVpEaHV4Y3g2UUdzZXNNR2lYN09oWnA1aGNJTkpMNWQ1?=
 =?utf-8?B?NVZDcDhmYXczTDBmSkQ1Q1lXQXc5SG9LQ2JPRnBETlQvVnVjbjJVd1d6RVRx?=
 =?utf-8?B?aTJLNS9WSUhWd0g1UkRGaE5kT3JaWHNHL0dZOUFaSzdQb0FXL3ZkOEtsRDlK?=
 =?utf-8?B?OWhBRG9DOXRDVDRRNW5vS3VQcU0yd252dkppR3FFdzBUc09mSUVwQ0ZwNjFj?=
 =?utf-8?B?MUFkSm9aT0ZTWDFQSzN2MFVNTWZ4QzFDRy94YzAwOVpFTU4wcEcwZGczUWhq?=
 =?utf-8?B?SE85NS81dlNoOXE3ZDhhMkZzUTZ5U0Njeng0bzR1NTYya0Z0UVo4ZlNadC80?=
 =?utf-8?B?QlhoeXNWdURTS21VOUNSQy9kVncyM29HUHE1alJjZzlxcDJSUUJ4RERTNlFt?=
 =?utf-8?B?RlV2eWZBWDhDTzhWU3h0R2ljKzh0c0RoOGZ0c3ZUN2VVOUNDT2lHalVlZTk3?=
 =?utf-8?B?UU9EWlY3cGFyL0NWWS9UNi9LTVlHZzQvL0EybnIyRVR1akVudU8vVGVHR3R5?=
 =?utf-8?B?dUtYRmlpWkhBS1pRMFE4WW5lcUZYQVozd2ozSVhTclE3TWJmWW1qOEc5MXRX?=
 =?utf-8?B?OTkxSW1yekp5dk9SS1RUQURqaVNnTFh4YWZiclBxMXdSVTIxV0VRNTFWeWQ4?=
 =?utf-8?B?eFFrOVdTdXZEbjBvTW8rRUNqWlhaN1hFRi8yejRuS0YvL083RVBWMHl3Rm9j?=
 =?utf-8?B?WmU2ODB0WklFV3F2WnBZQU1MYlF2SVNQZjBkUWlQMC9XU29aYjdFaHNkTUho?=
 =?utf-8?B?YUdMMDhEOEQ4SWZMZHRVSXdSdVJXdmtWdWxsdzR4SXkvU2xaUGFYWlBVTVEv?=
 =?utf-8?B?UnJzSnFHUVBMV28zd1h2UFZIVXJ6S0dGb3VuUVk1azAzUjRHanBIcFNJeUNH?=
 =?utf-8?B?Nm1Sc05COHNBc2ZRN1FXa2w2azZTWSsybW1uQmR5WlVXMXF2eFB5SWEzVC9h?=
 =?utf-8?B?UCs1a3hyV20zT0prZEw4OGhBS25SL0Z0UEdOUWFPYm5CMGtLbHNWZFIwTnhy?=
 =?utf-8?B?U1hrNk03NWRVdGhUUGhQcVMvd2FBam9XUnc4N25xZzViaTRyK005NkdXenVa?=
 =?utf-8?B?dDZ4N05GMFpaelNrN2tmcE9QdlpNa055NU1LLzB2ZGxHZ3dsUUUrY3VuWWEy?=
 =?utf-8?B?SW9pTVlJcmE0cU9maDBKbW91T3A3R3ZPQ1c2N2k3YThhOXkxd0oyaFgySTl6?=
 =?utf-8?Q?ejWDowKxTkWiPy5IOPmETIEA5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7698cde1-e339-42d0-683a-08dc8152d3fe
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:19:52.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SnwaE6Ytpq5hT/oVKFH3VwjV1eU/fLZDWj8vU1HhkQ/Ap7vwlFW/VOs7ylZo4j1EwZmZBytd+99bjIvfzZOoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/26/2024 2:35 PM, Borislav Petkov wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Sun, May 26, 2024 at 10:24:41AM +0530, Balasubrmanian, Vignesh wrote:
>> If we can add a new enum only when we extend, then as Thomas suggested can
>> we use other kernel variables as in the first version of the patch until we
>> extend for other/new features?
> I assume by "other kernel variables" you mean CPUID?
>
> If so, can you change the layout of your buffer once you export it to
> userspace?
In a couple of the previous review mails
(https://lore.kernel.org/lkml/24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com/
and
https://lore.kernel.org/lkml/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/),
it was suggested that the new .note should not use any internal definitions
like "xstate_sizes", "xstate_offsets" and ""xstate_flags" which are also the
direct output of cpuid instruction.

Also, the feature ID in .note records should be independent of the existing
XSAVE feature IDs (this was the comment as I understood). I defined the 
new enum
and mapping function to ensure that these remain independent of each other.

Thomas' comments on this version are that we should use existing variables
instead of re-evaluating cpuid. Also, to avoid the new enum and mapping
function which will make not any sense unless it is extended for
newer/different features.

That will be like our first version of the patch
https://lore.kernel.org/lkml/20240314112359.50713-2-vigbalas@amd.com/

So other than with the new enum (custom_feature) and the new mapping 
function
(get_sub_leaf), we are unsure as to how to maintain the layout to be
independent of x86' cpuid.

In the current version of the patch, the fields -- type, size, and offset
are derived from the cpuid instruction currently (and could be derived from
existing kernel variables in the future). The xsave flags are not used
currently, it can be zero(reserved) for now and its layout can be modified
(as per the need at that time) when the need arises.

If there are other ways to maintain the independence of the layout of a 
record
in .note section from the cpuid instruction other than depending on a 
new enum
and a new mapping function, we would be glad to follow it.

thanks
vigneshbalu
> --
> Regards/Gruss,
>      Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
