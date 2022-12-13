Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDA64BF6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 23:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWtcR6PlFz3bhJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 09:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=uOPWEKBv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.50; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=uOPWEKBv;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWtbQ0g9Wz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 09:34:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAi6NyfRK5pNYdxAaLeZLo3QzHZqFS6OMU0JMo8qa4kptnV3aqG88jGWTtJdTHi6AZTARrC9rmE5AyxY3E14l66+3d5j/aTC0O1Uw+/odrky+BpTz7HA9g18tkfiTk5hhFrzyQ7zRMBiQHQv1FRBRlf9+0TPiu+E7IybjjYyuP/W1p+AF9qHSi4iqqmGZoDs0VW8UKsIwYzS2RZXIIrIBXHfAHrlumF/ESEnwQtITp2/hXehOvrpvZOTvz/IsQ0ev60J6MJhVJz3TlISzKpJs7f6x90TnpGUv3GqE8SEPYU1UHhc+aPkZA1pZH7P9KccDDr5c8/oDLf4eewSjlUQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCaZMbBEGSV8ciypXVHsQCjdJOubMgUMQhZ9NzDmSSI=;
 b=aZzwVRf1z+xrRaqs1lsIvY+LWp65bhKwuqkoo4PlJAGrTe4Di7RbK1ZT8HWN3+wtJsyuvxQ07p/uV4h5MZCSUdw0d0ET/LOl3fNRG/Mt/vq8PbeO1zF9cNY1zaQwmX/LquBRdWDzfw8Kj7IIqMvoJ2P00TDEyp+A/fSL07pUs5mfhh5CTO7igEftlT5o7zYhi5oMXbTIZWk8lLFfR8Q45rCf89+t+M+QCIoqSD3SIpsbYtF1JSyQ5xsymsfH2xClYMhJ58H/dZxA+8fqFRPgc8pbuHfmu2UOt1jx5Olc66edeHmYjyYSg7BhY9E1jRT9SG65zWs2VgXAtRwOG99jlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCaZMbBEGSV8ciypXVHsQCjdJOubMgUMQhZ9NzDmSSI=;
 b=uOPWEKBviOFqmDpief74LFBLRZ8WUlHPbda6Z0aROcVv8joA2/PISL5B39nuP3VDy6H0WabrjGTfJPhqi5yC+4vRQz/rlHa15H7GPeQ80R6ovgetM1yP93iZeyBtXPxL7WD0s9EiOPLRhRcQ9n72rq9uv9WPklyXqz7q0Ir+VcR1HbVUzf0NNvIVaBmoNm+24Sp01JA2OihpoW78LANbVKv2tKgf2GbA5u75DekS9BuZOa9STRRmWmjpxUnzDRjDNMBCQYA4cLUWAfD3CniQLPPlBdWZaMsP+ChhRdcb6D4hyPW4z40S3sin4eoxvqRT5XoZWhqH2jU1JUyakV5sNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAVPR03MB9237.eurprd03.prod.outlook.com (2603:10a6:102:32a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 22:34:18 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%6]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 22:34:18 +0000
Message-ID: <353180d4-7841-3c66-7a59-a98c7ee5ac24@seco.com>
Date: Tue, 13 Dec 2022 17:34:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com>
 <20221027230331.19C2FC433D6@smtp.kernel.org>
 <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com>
 <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com>
 <20221101201020.B6180C433C1@smtp.kernel.org>
 <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
 <20221207021742.A3596C433C1@smtp.kernel.org>
 <8b42763d-5fc3-3853-c421-227494c0144a@seco.com>
 <20221212233706.6C419C433D2@smtp.kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221212233706.6C419C433D2@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAVPR03MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: 2610a237-f610-46b6-90c4-08dadd5a2b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	v/A5exFwmFzDAdLLqgwAj8SHwvUpdQaDaWJLlJLrQ1pGUZxG/alOrr7y9/CNJkWWh60X6Le/UvtxY18BiDn9+XqeH2klsGzGuCnRd2M6h81UJii23nuS2HlHz/ueiDD1mA7+JA7u37BC3Io95g0nfU3phXve7dQrodne+fbGrNJWQem5fuxQDLI/dEEfb89KyM7IEUUYAkPaHo5YZYRM4fkZWEUHbjwknu+laeniYtcqQpOpDW7lVf5WXjSx5ZvRuhMYk7KSp3bNTAB8TvxECj85UrCn74KQgyUhQxqLg7SD7ZLpor/oxOr90hakLZKC76ZDvwwYSnOcy5YctON1rpQliPiQFyZSYDbk9ouWH3jVO2tUvDIR+9lToz9SGvDPykU7It9JtKap8+WqJtPLU75aWi7vLkrkQvIdNP6CTRT4GUmU6ZH65GCftFEDP+YTJFpK9kVSL6uu1Gg3Kz7p8cFVsjma1BOotRA8X1QDdXFA7GewdUf/IF3tL0DMeqZ8rFBtn0R1ROU7okVN35ZQ05mwg2xn/LMGDx+SPTQVR5NSUkYhSDadqS8Pnaj6ACs+xS6treP9Y9+9qhPE7jALFjThR9d4XKib2ptBWHvQrEXDMrZuf1nCZeyQvC1DHyopLqyJvKWTU547AhLJrkOvf6xhTDGUidrPHNrjbvWhN0oM88kAUYVDDkdvgi8gYgJw3ma3Fm5dOLS+NTjL4TOe6M03WGPhXARogpc1uLU5SA2VIRBJaA1COVztk/naRvEG
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39850400004)(346002)(366004)(396003)(136003)(451199015)(38350700002)(38100700002)(31696002)(6486002)(5660300002)(7416002)(44832011)(86362001)(41300700001)(6666004)(478600001)(2906002)(6506007)(4326008)(66476007)(110136005)(66946007)(83380400001)(8676002)(66556008)(316002)(8936002)(26005)(6512007)(186003)(52116002)(53546011)(2616005)(31686004)(54906003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Q3FWWlV5a1d3aXVyY2hGNHhWN2MwL2lnZjVnRkM3MmxBRExlQ3grdHNQdmli?=
 =?utf-8?B?TFJYVVZxUzV2ZTY0S29hSWxoQjJRR2ZDR2FnOC9xRlV3T3J4YXprMkVYaUZV?=
 =?utf-8?B?MWlaVm5iU3l5MHVuMkl1eGFsczl5QjArTnZsWFk2TUg5WktENjVCcVhKRXpY?=
 =?utf-8?B?eXNldnE5aTZqd1lJU3ZOVUVacHl4ODZ2b0NaeTArcFRRMEx4ZTg4aXo1eHZr?=
 =?utf-8?B?UDMyaHhRZ3ViUDFqT1hqM2NQZ25CNVk0Ums3cnZjOTdjMEtCMHF0Ti9GQUJB?=
 =?utf-8?B?czlKcWs0SmRMYTNrNWVrWlRSNlVrQjUwS3FoNE5aSi9YSWNMRU1LOFZoSFZw?=
 =?utf-8?B?RDU1aStlcG45RUNnYXJVVGQycmVLd3B0VW1xMWpVS2JyeVNwbjN2YU5FQTlI?=
 =?utf-8?B?emRoZVJ5QWlRMXU5K29ZM3FFSUJBTFRVZGczekJpMFh6ZXhNemN2ZnJjRE1r?=
 =?utf-8?B?WUFhM053Y3U0TjhJVWJGRXZvNExja0duTnE0eUdFNGlhOWJ1OWRPT1UraDVO?=
 =?utf-8?B?RkNITW5LV2lVdE1BZGgxbWxBY21KYUpuZ0YweW92cWpZUENiYXpKMnlldUZ4?=
 =?utf-8?B?S0pvWDBadGp3NkxkbXZkbkNrYkxkMW1QeUtrdll4bzlqbGlISUFQNWR0ZGU4?=
 =?utf-8?B?Z3l3YTI1NEw4UURGUlZnRXpMaUQyZmluWUhaelVNNG83bU1EWWNtb3ZjQVo3?=
 =?utf-8?B?YXFHQVBRSGZzQzVkbWF4K0k2NzZNUHMwblp4SkpLdktlT0pJZm1GMzY0U05L?=
 =?utf-8?B?N0g2UUV4TW1iVWtjd2E0Tk5Eb1Fob1Fzc296emdXYTJaZFQ5UC9xQVJlOVNJ?=
 =?utf-8?B?S3lOb0lKUCtCZm9TYVp1K1hMQXVDZkZtK1BLOVFvR0xleitLWUJ3Wnl0QXQ5?=
 =?utf-8?B?ZWFPSFdLVmgxSmpSN1p1SjhOeklUVnVsM01SOW9uYU1KOTdnUXFtOWVPOXZt?=
 =?utf-8?B?Y0xzNjM1WVpua25BSXQ4ZzA5M3pNanl4dUt0Z3Yvc2RZYkFxR254cjhXL3E1?=
 =?utf-8?B?RXhpQjU5b3JEYzJ4ek9yL1hlYUJjejBOdVR4S2dWR0pIZXdWU1V3SWV6Q3Ix?=
 =?utf-8?B?QjdrRjhIWm5ieDZDNXhFRUNsa1loN0xBeE5IWnovTnJJR0lhT01XUzRvSlBK?=
 =?utf-8?B?K1pZaWlpRGdERjNJSWVqUUM1Kzdoajh0aVJmTDVha2FjTmlMam5QZVBLbnYx?=
 =?utf-8?B?MzNmZ2pIVWwwdVBwTUxyRWlIUXVFV0FJcjZrN2p6YmFja1FvRVl0Y0Z5WVZt?=
 =?utf-8?B?VFcxR2hCSC9QQmJpMUw5WW1YM0VUejU2Qm5jbFpGRTl4dTV5WEMvaHBXWW9j?=
 =?utf-8?B?eTFwOVM4QldPeUVDUldxaUtCNTdHaE8yZFJIZ3N3R2pPUjRDWjdudHprSTJH?=
 =?utf-8?B?RDR5ZkFJOHRRakszMUYvSjAvMUJjbUdSK3c0QWthQlhmb3hHRnVFRXNGYzBE?=
 =?utf-8?B?YmF3Q2xMbEpYMi9HbXpoTUp1YmFLVkoxQUVRcWhmcUJPMU5wMU1WTXpNVVNN?=
 =?utf-8?B?d3hjbWFIVG8wSVlEdThZenNUOVFtU2VFcmFKNFZDU3NZMDUrMmxoV3FWUVJM?=
 =?utf-8?B?cXFjdWcvV1RQQjZxRGplemdFdGc0Zm1FTkp3Y3oyYW9SWmFYd1NWTVR2WWwv?=
 =?utf-8?B?cHc4N2lMc1RGVExYSHpBa2FRb2UrOVl3a2J1OVB0dHdLZjYxSDg1UWQ2TmlO?=
 =?utf-8?B?eGRpK2VIZnN1WjJuemlHb0lYRUpkOFlFL1JjZGk2T2NnN3NESCsxSU5KMkNS?=
 =?utf-8?B?cEVRdTQyNkhUNWdoZTBqSzdjcHZMWVZ6dzVSeWl3YTUrUENMbnRseEVRekZq?=
 =?utf-8?B?YWZjMmxoVXpxaUR6eTRpUWRTK1hXM3c2QU5KZVV4L0J2elhuK3ZzVnpMQUY0?=
 =?utf-8?B?UUhGWnZsNDhyL0JJczNWRmJTdGFocUhXZ1RwVENrWlVnbWxIUW5pV1paeEdM?=
 =?utf-8?B?M2pXMGorUXIxRGg1YSsyM3Aya2pNeGZqdjlaeTc0Y0swWWlsK1J1VXdZcmtj?=
 =?utf-8?B?MkVmU2ZlUmtLYmtXaUxjUTZibnR3UGZtREltSnhZaENXSVI1RzQwbHl6N2NR?=
 =?utf-8?B?RWxCMlkvYmw1ZHlxak9yQ08reVFabE55MVlzRVU3bWxXTHFOaTF2SmVFM3pm?=
 =?utf-8?B?aHV4N1h2Y2srdEJQeUZjeUFqNUZLOHh5STFvTTFCSUFkSWcrMW1xc1JQK2pD?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2610a237-f610-46b6-90c4-08dadd5a2b11
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 22:34:18.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWmrplnj0EULZkdYCdIDFD65zS4q7cgTCjiIuOp8wEpuYlUnksG0FMX0qyQ0GNzcQ+Yzn2T4viJ2N+/B05WkEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9237
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/12/22 18:37, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-12-08 07:36:45)
>> On 12/6/22 21:17, Stephen Boyd wrote:
>> > Quoting Sean Anderson (2022-11-01 16:27:21)
>> >> On 11/1/22 16:10, Stephen Boyd wrote:
>> >> >> 
>> >> >> Oh, I remember why I did this. I need the reference clock for clk_hw_round_rate,
>> >> >> which is AFAICT the only correct way to implement round_rate.
>> >> >> 
>> >> > 
>> >> > Is the reference clk the parent of the clk implementing
>> >> > clk_ops::round_rate()?
>> >> 
>> >> Yes. We may be able to produce a given output with multiple reference
>> >> rates. However, the clock API provides no mechanism to say "Don't ask
>> >> for the parent clock to be rate X, you just tried it and the parent
>> >> clock can't support it." So instead, we loop over the possible reference
>> >> rates and pick the first one which the parent says it can round to.
>> >> 
>> > 
>> > Sorry, I'm lost. Why can't you loop over possible reference rates in
>> > determine_rate/round_rate clk op here?
>> 
>> This is what I do currently, but you need to have the parent clock to do
>> so. With your suggested method, we never actually get a struct clk(_hw)
>> which we can query for rate support.
> 
> The clk_hw for the parent is given to the determine_rate clk_op in the
> clk_rate_request structure. It's stored in the best_parent_hw pointer
> when the determine_rate function is called. Does that work for you?

Huh, I didn't realize that best_parent_hw was an input as well as an
output. The way it's documented, it makes it seem like this is set by
determine_rate.

I'm still not very happy with having to use an aux bus, as there are
plenty of other drivers which just register clocks with the top-level
device.

I will try and revisit this at some point, but the project has ended so
I'm not sure when I will find the time.

--Sean
