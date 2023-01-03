Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915E465C7F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 21:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmkZW32wsz3bhn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 07:18:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Q34yfvFk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.249.63; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Q34yfvFk;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2063.outbound.protection.outlook.com [40.107.249.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmkYX2h52z2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 07:17:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhf3DukZSBWx01Jqv1x51NYJ8d/1EyVRAP7Uqx/UTjP4s9vNOURBkxXfj8X0qpWOb6E6amROsyemjTc+/NdU3qA0d+cK20dmppMReatq/MdcmVoGmpRSj+1v5jwB02nqZh0cSaZzsxcahRDrc/yE7zdB6ByzIOX4afH+EfwkEoJ+QsR5bdK8iNN00GaqMg7lCxTlOBWa74AlhYt+/zSUzUJObb5EN01NxIy+y3JXsO5Ugs6CbEg53Dg+1RuECW4gwPoHqowbflDg5gtpFxJp80aM4paNbyZgH2S844DKI6IU3PlKMWy5pf2vYiBhBsQPFc8ijxRIfAYVYCM5h0u6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65zOHUZUmxK4/CQ0kGUcowWVyjfEuj2Rf8yr1O1TIFw=;
 b=Idi3dVWbu2WtIEotWjHbKJ7RwObxZHbAOaRZOSvrP9xj5+7bSY4c6GNTTlDCyQ4NbdyVPADobrYgvkbxSsDe/iW+ic1ccNok+XXry3Rcz4aRhU7H78CndFIe+X4c+PXyPF+JS63qY6xbaX1fjUxidd7uRIY/5EOLiZIGuSuvKbknnJuCoV5siZS0mmsr3n9vJzgCMI7cubpL1GoAfUjyyfPlJ1qEtWECTeatDQYEWXL1qfkWMXE6cwpwWFFMoeYTHjw0LjUfOzay8rdXcoe92yDhSlcTGv6QYH2tzxw4lmTd5db+K3AdyMo7aiADIM1fwpT8zscjoGH+oWxoiHNoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65zOHUZUmxK4/CQ0kGUcowWVyjfEuj2Rf8yr1O1TIFw=;
 b=Q34yfvFkmzLgCjZ7M62HPvS/de1CvyNnhj0YNfdJEp7SCJ5w3uA58AohXHDFuowHw4/BbFMpmn3ujBBnS7NG89kDgP8Ua1d7HNFgNsobLgJn4JiLhvRC+fJICohTMPG63ZU6399g5Jp/k4SNBHUiz4TuU52jZy48nj174KmI0e9h5ZwwNq6sWGHo6n5NNyXEU/f/S2A828j9eBAi+bmSdkVC2GIMuJxQ/QVyLKjivMduIGvx8jnkppm3UrWl1sOx1WMArtu0J13nf89WSm3tAhMiXAbcz+6cnmn7FZPv4efeL4CwRhNNbBzr2m5pnO12uZasRTd3te/RAdVa8uhBYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DU0PR03MB8413.eurprd03.prod.outlook.com (2603:10a6:10:3bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 20:17:14 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 20:17:14 +0000
Message-ID: <460bbe6b-3bbb-2960-be96-8da58b341ef6@seco.com>
Date: Tue, 3 Jan 2023 15:17:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [FSL P50x0] DPAA Ethernet issue
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, davem@davemloft.net,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Matthew Leaman <matthew@a-eon.biz>
References: <0bfc8f3d-cb62-25f4-2590-ff424adbe48a@xenosoft.de>
 <3a5f08ed-65dc-c6ff-5da5-b9ce6880c6fd@leemhuis.info>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <3a5f08ed-65dc-c6ff-5da5-b9ce6880c6fd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::6) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DU0PR03MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0a32f3-c222-4e88-8531-08daedc780bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZE+sSRH9P/+lo2y7T+6G1sdEqvP7EkBdjEJCmqSP+6UDaRo4vtSIbRcQRGh7fPWwKpTTp7lDQZmFcWNwn85DEMlalOKc+ef6c38/4Ef8Xm6Dxot5ueBkk4XY7d3bkFYMQZeBJ/FINvyyGmaqSJXNjFtwjbRSB0WCqfFrITL1UiVldtgsawpiyIjBeVrcjqu5Z2YYsDLzazSDyUW9bLklcVThKXM6bDrZtZFD6JUBqmqqZWHSsiL5PqWz/aLXepAFW9hJgPu7zcb0P8Tb6gByi4Vl3iD+npMllc2UMRnZPDsEu2p16ICm4Mfvlz5uV6YxKDscWGoM+7WUDehnblGB1Ukfz0/UIxGrShVuualUARpGaADVTtr+/rNWKgPvPv9+GQSBM9COco1DEiaUp0t+fmTKnMb8rcM3wpo29XpQvGca9VDLGMONVOYDC8Ku1P37NFDELvjGDpt3SJOrTmFgbfAzjPRsrs9gPX4GxoXIeYBVi+SvORhaHljkEEA+b8ASjiq3jERYvhgwvTHNJOrxRbG7vTYYMGGXcfVDBmM2ofAl+vAD1nOKhP/EjKGoHqG/xJFJt3/DOM2Gs90VRlPtmeplosnC4yAwHcNGRQWcD6EfiFhCEKkvyT1p8MGEyXPSJP5tg2WYE1qDsH4fQ1h00KVvnAoTZ1AED+FGt00pS+FlH9tPtqd+eFXDBOUWq6mgYN6LTXYuqxsj6xhF+HJwoVK+PtUfG6STpvgMkc3a+xDBAN2qFi6wmAJJ/NmbBu/wmh0f7g0TUjoTEVnZ9YhkgAIjZxvxhA+fZ7MFWggJsVnPGyOKmkbzVJw3JkQzI6iR2h9tw55lFVC1DIx+EQVN3A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199015)(44832011)(66899015)(31686004)(5660300002)(41300700001)(316002)(2906002)(66476007)(66946007)(4326008)(66556008)(8676002)(8936002)(36756003)(110136005)(53546011)(478600001)(6666004)(6506007)(45080400002)(16799955002)(52116002)(2616005)(26005)(186003)(6512007)(83380400001)(6486002)(966005)(86362001)(31696002)(15188155005)(38350700002)(38100700002)(22166006)(43740500002)(45980500001)(19623215001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Nk5KOWtkZGtOTUtxWXZBWWwrVzJVUjRxSTkrVHRVWnZOSklQNGxwUzUyems3?=
 =?utf-8?B?MnlUN1Z6dG0xNmo4YjFFUHBSNkFtYlJ1OGw3cS9WTmQ2VVRVd2NVbVZOYUVw?=
 =?utf-8?B?alRESUpQTEtud25XZ2VjR0xDRTc4aVRnNXJ3Uys3QjlPTncxd1d2L1Bzb1ox?=
 =?utf-8?B?MlpJRHRLTWI1QUhhMWZtZkJCcS9RYjZUT2tEa05FYWh5REl3cThDMWVzZ2Vs?=
 =?utf-8?B?TlhtQVhhQXRwSmh1eUtSWm5hMjNXekczUHVnMm9OVDhNbVRSVWFKcG5CbXZm?=
 =?utf-8?B?UlR4Y0ZIMThpOUgxRklGNTdHY1hxZ3FON0V1ZzhiSWRlMjlvK1kzY3hHZ2pV?=
 =?utf-8?B?SmxFdnozVEZRbkl3MzNNYUtJOERlM3pxWlBkRDNwbDZ4WlJpNjVIekNsMzRE?=
 =?utf-8?B?MnhjdU5DR093dTA0TVlCOXJPSmdLQWVkNUZITG9ROHZWcmQ2L25SZHJJUWtU?=
 =?utf-8?B?VzdZSzNGeFBmVEhOMFhDWG8vNktvMTBRTEhCV2UxV3hNZjRuRHNIQnVITW96?=
 =?utf-8?B?UnE4NGdWblhnOTdoZis2emNVQzJUWFp4dzgyY3VDS3RiZlk1RklYb1VVY0Ry?=
 =?utf-8?B?QTk3ZnBvc2NPdDBGaVp2eDJHSlVyOVlQcTc4MzhxV3UzZFMyR0lVdWIzYUVj?=
 =?utf-8?B?NWlxWUsyaUFkZWU2cDFxMFI2MnUyRXBKZWpNRlFRdHU3bWRHOCtYY3EvUkZr?=
 =?utf-8?B?RDlMZWxUKzZVb254dlVCRmpzaGVQOFJSYnVMYk93dmxiY3hLRll0TjZTdndQ?=
 =?utf-8?B?UkdsV3B2Tzk1dWQ1dDYwbVpvZFZyanZTOWZmOFRJNTBrcUw3NWhUOWloSFNI?=
 =?utf-8?B?bW5lU01zQzIrNTd5VEJkSTF0bHN5Sy9nM2cwaFRCdlA5RnFmSWc5Y0NjK29s?=
 =?utf-8?B?Q25HOTNaUFZoM0VoT3VJaHBuT3NMc3hBTndQakM4ZXpidUEwYW5nSTZSQ0pY?=
 =?utf-8?B?bEY5VkxGYzBLOEFKZmcxRlRwNEl2UDVsYWpDS2syaHZIUndpTWxsbE1DczlE?=
 =?utf-8?B?dVM3M0djSDhxUzY5K280bFJJbjNUb2ZlT1Nqb3F3aFJoYThscW9aWmlaSkd1?=
 =?utf-8?B?RXByMGx3SVpsVEY3UzZLeDVLQ3gvTlFJeXhIcG1YU1RoT0p2Z0JNa1J5aEM1?=
 =?utf-8?B?bDNoNUE5cE9XZEU4M1UzSmRaTVU4SEhKMXVsYUhRVW9oR2FuTFBXVHpXbFVm?=
 =?utf-8?B?TDhLZ3JIc204clBnOVcrOTlHM0N0eVJjN0dKY3p6eG9Jd0s1RUVhRGxNRUZu?=
 =?utf-8?B?S0IwSzJXQ2RxZ1NLTXNGc0hHL1J0bFcyNGtpdmdtVVRWMjR1UklCWjZBbCtC?=
 =?utf-8?B?d0t3N3RvQURHVVQySHF1elIrcVJXa1dyS2NlSnBKME54dG5oYTNOUDJkbDU1?=
 =?utf-8?B?bXZqSVU0NHY2MERLb2E2RnJlWTFBaXBRRGFvRS9NZitncWdJU0s0VmQ2YXVZ?=
 =?utf-8?B?MDlMbWc1RnJiWllZbmRtRVhUM29wQzliUGN2VW5CUmJTMThvNTZEWFlVU0Rx?=
 =?utf-8?B?M2hQamV3bk1lcjMwZ3NQa3paWDc4aGdOUmQxdGNwN25RbFZTRktGdVBVQkpx?=
 =?utf-8?B?RkV3REEvb296bUsxSjdwdEZsaG9pY3hma0EyTEtqbWx2cGxhTy9jT3h3dTFs?=
 =?utf-8?B?ZWtxMXZXTUp0NEFsVW1pbFlYVjdoQXJTS3ZMM0R3eitBQkJ0NW1MUkw2Zndq?=
 =?utf-8?B?YnJEMldsN1lsak9seXFzTFVoV2xMUGdVQWxXTFROeDZ2dm9jbm90THpXalFC?=
 =?utf-8?B?bVNINXVwS1VuaDdET0RGNHIrYWxtUk5WSXBtV0RIdFZPWU43L1JvNWZYbjVk?=
 =?utf-8?B?aWk4ZmdYN3Y0cnBaNVJSall1YTNGcnUwSjN2YVZzYy9ZSmxEUGx4MmYzUytn?=
 =?utf-8?B?ZUo1Z0VlNEVTaGZMM0NEaHhKN0RaREx6ZUZkUkpKS1R6N0FkNllFSzBJRmZX?=
 =?utf-8?B?ekZhbkhzbGFJaGlMNFMzOERENGxPL2JSWDZjM25wYkhkV3ppbjlyUkc4NlUz?=
 =?utf-8?B?UmQzSThGWUtTb29SQXNiOGdNQ2tHdFA3Q21pdDBqdE9hVjI0WXVER0N0b3k0?=
 =?utf-8?B?REZsZVdJL0VCVFhobTREWURrVFJGU3BqblVDc04xdk9BV0pHMnc3Zmtqc1VM?=
 =?utf-8?B?RmVYN204SHZ0Y2hqaXlXVm5CaFQ3RlZiaDZxZzhtMTN0SzZDcGh1NXhoR0Ri?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0a32f3-c222-4e88-8531-08daedc780bd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 20:17:14.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M76CtTFjuUVB3t8GN1vBgJilLvqcDEI/vqbuh9rcOJnbhXlrfrzQQmTg7Nf9bmYcfYXHdw5UGQSiEpJtTQHJRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8413
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
Cc: Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/2/23 02:58, Linux kernel regression tracking (#info) wrote:
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; all text you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 01.01.23 15:18, Christian Zigotzky wrote:
>> 
>> The DPAA Ethernet doesn’t work anymore on our FSL P5020/P5040 boards [1]
>> since the first updates after the final kernel 6.1 [2].
>> We bisected yesterday [3] and found the problematic commit [4]. I was
>> able to revert it. After that the DPAA Ethernet works again. I created a
>> patch for reverting the commit [4]. After patching and compiling, the
>> DPAA Ethernet also works again.
>> 
>> It seems, that the new driver doesn’t work with our onboard DPAA network
>> interfaces.
>> 
>> Could you please check your commit? [4]
>> 
>> Thanks,
>> Christian
>> 
>> [1] http://wiki.amiga.org/index.php?title=X5000
>> [2] https://forum.hyperion-entertainment.com/viewtopic.php?p=56326#p56326
>> [3] https://forum.hyperion-entertainment.com/viewtopic.php?p=56334#p56334
>> [4] lnet: dpaa: Convert to phylink:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.1&id=5d93cfcf7360eac9903774fe94f626c9ead2049d
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 5d93cfcf7360
> #regzbot title lnet: dpaa: Ethernet issues
> #regzbot ignore-activity
> 
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
> 
> Reminder for developers: When fixing the issue, add 'Link:' tags
> pointing to the report (see page linked in footer for details).
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

#regzbot fix: 7dc618385419
