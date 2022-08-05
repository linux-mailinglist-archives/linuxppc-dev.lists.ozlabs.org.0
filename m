Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64458ACF7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 17:18:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lzq3p32VTz2xrk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 01:18:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Emps/SlQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.22.71; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Emps/SlQ;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lzq303zJLz2xJC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 01:17:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPBF0lhGvsuDs3RAvS+kpVi22DgM7ySjEtf9LMT5Ja6plL+q3l447kxPpBH+ofXZzbS+7W/Qz6Cg0TXWobuSH/GNoBsdyc0hbTCwOLYgjXc6Xq77MD24SVhKWFPQKOikq9KwkuMBdvs4xKiayInKSJ7Y3UfE+/6IxMdn/17kM6PFIp4HpZRDKcY5+nLPkqTF7Lr+Se9BvHao28HDg2K9QR6B9kJOZttuR3PoAW6sm6kbwDya/UszIqtnJgB6apMXY9jqO9PZl5w00iAppY+/t6J1sqm2KQo8L2zHtdFATI2NJgLqsr6sPjVafTIIxJgDhwSUr/L4KJCNubNJND+juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqw8T4MMK4xcGEMNViQD2UWL8H2UuhNzXd7V8ixlEgM=;
 b=V8/1UU5ejj9Qh2KY6X73UEB1mOQS1WFjUsod8/No6eQr7aT9UElKGe86eRaWLl2YAP+Ng2nKWxQTcdS0BQ3DDoUetvLs+mqqZLEzmhOTzt7tXhrybUZsJC/5JI8Pt0j7H0GenB07GN7AlZ9pGsGq7J8gyrMbtCuvfqK9P5xvWDLmeQuRARiINREioQkiNK9x8Y2+YQGQUv0PvFFwKQ03AUxmF/L6a0nvcCDe/Lx0kLH1p3DB/Q1Un7lh0LGREnxDKhahUxFzCauK/7tPnnPGAwoqORumxNjp6ZblphGDOLQR9cTivbae4qd1egNtOQP+Ysnb9/5Anb6KtxOCkIsBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqw8T4MMK4xcGEMNViQD2UWL8H2UuhNzXd7V8ixlEgM=;
 b=Emps/SlQvlk+LkBRXfwbVZm9DvFtZQivrW+HtnTWTu9ITf9q+yiAH0L80ZF1JoG4xebvOUlRfbP480oZ9FFIcaoKRtgLhyYIV3mceaKORzwWkagqipq22Nblx6+/J2BvP/ZFAN5LP/B9pzZPKFVyWspN8tDl8tjzgD0UZnkr8OzEjOiCmcHk17tBc/yI6Qn40pyZhdoAribPptzwTuKiugvK5OIS7ReLcOfrAQOoTVxYkQOVYVl0sk5rMsqDvY8cUPfn5PvlQMDBj0b+qq85qupyOgixIdoQ08d6u9vA6SBqWYULmqMX38SMwR+8Wec6fp1zNHQGan52DFFKrsIVyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by HE1PR0301MB2236.eurprd03.prod.outlook.com (2603:10a6:3:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 15:17:09 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 15:17:08 +0000
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
 <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
Date: Fri, 5 Aug 2022 11:17:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:208:32b::31) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3bda76-2f40-487c-aa32-08da76f59043
X-MS-TrafficTypeDiagnostic: HE1PR0301MB2236:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zn0DsthU294WpG0S6fxGHibAK+XlPutvrBqQc6ZZFD0qpP6dUwvHsbLTGGe3rNzbaPM2hKqXbCPMXzG7DGkGONv3iT/dpIPo8jVwYZ283gYfJXjTvoxckXZ+Aq9gkDM/3ThPT7FoWZVN29Y9kUNf9bJqzCx9SvnbrboBfiXaJzsMHcl+jCERs9FkR1xIudo106kE78y9tdxPsG3k3HY5pNs+iy9r7fMy0ENTAHoek/MnUGe/l3v1oNfD8c67f6Xep2C4NTQFVko6sWqWQa00OnSNTCJhe+2HH4pIDtLEddcmmn/51du3DwLaziDHcGQy/xgTCXxSI226ImisdMWSQiDTKXj6thQDgStj2qi+0p4vOTnT4cQt6fPs0hkOWMTisb69N6/S+us1S2bX0l6Z7QKfpjrDjAM7+I+XLhh6fN2s7jNlIor9armYM7YIGB340T4V+RRJIdQvnGpxzrdqxmN3YVARc/K1gJHX4WF4HgDzA9pj9SFdmcBZYEuzGzV7lKPJ3iOqos8xwFwlYkZr4mSoG7R0H0u3isfjBY8aH3c5DCewjZdYLT6EaKWU8vAiRnCZjFcGF8Nfj3icT+bP88smwz3c5acd/kfK9zzv7hJulDVOanmY65ae96Piumwnlu8MeLirsxLJow1TwLG9iTyPCSFgYe9STVBekJv8GCXY1ThJQAwso55+M8oCdPTdm1eJxFgIdIjb8RW5Y8jzj5B/wnS+Ly+uj0AEiOgdtUQsaWoylx17wiy9xSQF1+EtjU7+3ytxHf3dW430Q3b62W3DRLIXoFuHJXyqxDbqwYa/KW4gsURnjIEPdz4/HSfuGyIEFrYrsc7z1dpeXRhHSpWGEcfJ1CCHPzFDZeofKI0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39850400004)(6506007)(6666004)(41300700001)(478600001)(38100700002)(38350700002)(6486002)(26005)(6512007)(53546011)(31686004)(36756003)(52116002)(4326008)(7416002)(44832011)(8936002)(186003)(86362001)(5660300002)(31696002)(2906002)(54906003)(110136005)(66946007)(316002)(66476007)(66556008)(83380400001)(8676002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UTVBTVp3eTh6UXJEZ0tZZlFKSHhSM3JUQWtGNiswY1h4cFZQK291SUFSNGxk?=
 =?utf-8?B?KzJvQW5NZ1V4bTJTdnBnclFvdlA1Yk5aYU9USkcwOHNneGtxbm5DcHgzNXFv?=
 =?utf-8?B?NnNsL3ByNlJXLzgrYmFHNDUwWEdKdjRWYS9sMW5iakV4eXVxaXAyZzFXSHA4?=
 =?utf-8?B?QzFuR28yTmFwd2c5S0U3MmV5REtTTzZUVmR2UFhCdU9QVEt4L2FGQXkrVm5s?=
 =?utf-8?B?eFNPU2loVW05MVZYQS9PL3VKSDA5Q3lvWTZxdG55aDRYdENJRHMyUGRmU3NV?=
 =?utf-8?B?TDdWNmU5aW5xem92RHhISkhBcm1WODhpMTNRL0puMklFSTFYOWVJc2t1OGkw?=
 =?utf-8?B?amRYbkpZZ0dYY1YxK1lZbyswemtKQ2tVZVFuck5EeGI4bHoyL2VvT04xOXdt?=
 =?utf-8?B?RXJtTDhBYkQvUjM2NWJiZXhDc3pjcm9jclBOT3hMNTlLR3ZTN1ovTHR1Yk1Z?=
 =?utf-8?B?ZFdXcmdZOFdCRUhmL0NWRTJudm1NOGw4WG5RV1haSkVlTitERG5BeCsva1hu?=
 =?utf-8?B?c25sNllLRCtEOUZ3OWlPckZQdDBjcERXV3E1T2w4YWdBalZubjVkK0RJRU80?=
 =?utf-8?B?Y0VmTEIycG15cTVIUTVLQk91NWY3NjdJSk40YnNsQVBWS1luaWhFM2JOODRL?=
 =?utf-8?B?NDFaelArcmZlYXFvemRyaDNWT3B4QTNsZ25QR2t2NzhGQWNCZWN5Y083RjB1?=
 =?utf-8?B?RWVzUHY2VWYxZjVjMjRVMTM2Q0M2S2MyL0IrTllPdjZvNDlWM1p4anNsTmhz?=
 =?utf-8?B?MnVwR3UweEx0OHhkMDJLdnNNb2hUdEw4aVMxL2czUkZvQ0svMENvcmo3RHRv?=
 =?utf-8?B?a2k3ZURIRXVza1F1R2F4OUozdkRvc1Z3TmhabXBkTWk1OXM5VDVta3BKUlkw?=
 =?utf-8?B?UFVQRHlpK2RiWG5VYVRNaFlpb0F4ZTVOZzRmc2pLU1FxcnRsZHArS1BWdmE1?=
 =?utf-8?B?MktvVHAvN1o5b0R3S3hNcklrR3dQZGRWajZtUVpHQWVhVDlSK3ZNaXpJOVRp?=
 =?utf-8?B?MEdXRmlseTFJbEp1RTRsaEo0RWwyQjFUOHRWOUYwUmgyU004MkU0SksrQTEw?=
 =?utf-8?B?ZW85bTlKWDhrV2haVnAvekNHL1hDZFdYZm5IUzBGZGh5Zy9uRHJ4QlhTY2x3?=
 =?utf-8?B?THYzeURzMjFvVEo0Ujd2SnpUUmdsTDhoc2YzNUJKWWdpcWJoUkdoeFJnL2VX?=
 =?utf-8?B?ZWtkSkJEZXNMVWFNdGtnTDZ5ZHdCclNETDR4NE5US290SEt5OWcxZVgzTWRu?=
 =?utf-8?B?Z1dFbTYrZHp2WGZtaXVoN1AyTi83V3BlU256SDFCTDg3OHdDcHpnM3ZZYW5B?=
 =?utf-8?B?VjhzTVY5UERsdHdxSzdaK1gxZkhOR2xGM3drQjZrUGE0TWx6WTRpOE95dWdM?=
 =?utf-8?B?bGlSWVZEbjl5S0FrcU5CaVZSdWVwSUQvQkJHUEwvcHBWaXlySjlDbXMwRHRE?=
 =?utf-8?B?OXVtYmdFMXNpN2syYzVHOXRucDVJanVZRzBhNUFldVlIOW5DMEE4SXJLMENk?=
 =?utf-8?B?UTNTelFlM1ppRC92RXpsTTIraG82ZGJOTHpVRFdSckhoYnduTWtERjhiNlZM?=
 =?utf-8?B?ZkxQcmxtN2t4bjQybTdRTTN2U0svcHlkNWc2VHBkTnU2RU9BMm5FMndOb0ZO?=
 =?utf-8?B?Q3libjZSdytUVlQwbnk4MFc0NjVrZXhQS09CWldWL2xMWEU4TlQvQTNvSUhp?=
 =?utf-8?B?RzZWRTN1NUUzdU9Id2h6RFZTWlpIODI1SmIxQ1B0U0w2Q2FuaDVCeTRJWW1X?=
 =?utf-8?B?UEg1d245RHRPQ1lRUGdDQS9XcXV0Mk5ZM2Q2TlZ3MVhMU2lESTNTU25aZDN6?=
 =?utf-8?B?bXJ2VU1LTzF2bmJyaVFwaFhhQWEwalR5NVUxZGxzRlUrRkFRV2g0dVdPcG1W?=
 =?utf-8?B?OTBJMmtBamtDd0kzODlQQzNVOTAra1RRRlRkY0lPalFsN0JMUUFGMjdwMi91?=
 =?utf-8?B?NGttd1MzUHpaNlNSSGkyNmxHWjhkRzh6T3pzeGxUWXZJUkpIam1jVEk3dkN2?=
 =?utf-8?B?a2czdGhWcXFKblFSRnJYU2hLYUpqaGlFTHllVVFwYzhKYjlMdVkySVpTeGhr?=
 =?utf-8?B?aDRVR3RHN002ald1bTJCbVA4ay95cDhuTGhCOFBHbmVOS25yVWtHNk9LSHdN?=
 =?utf-8?B?elN3VFlKRkc1ellTZ2U0T0FzeXNHbHgzc3BNZDZZbHlGb1F4dGVqSW5jM3VM?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3bda76-2f40-487c-aa32-08da76f59043
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:17:08.6858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQTzg2+8/ndcC3OiDaWagSfm9z4gfWgH0DTO7enFrQGtfCC3eADVufQMavjOheY/vzB67fvdzX++9ofSZb5M/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2236
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/5/22 2:53 AM, Krzysztof Kozlowski wrote:
> On 05/08/2022 00:05, Sean Anderson wrote:
>> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
>> witn assigned-clock* to specify a particular frequency to use.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>> Changes in v4:
>> - New
>> 
>>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
>> 
>> diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
>> new file mode 100644
>> index 000000000000..f5b955658106
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/fsl,lynx-10g.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> This should be dual license.

This is just matching what the majority (263 out of 326) clock dt-bindings headers do.

>> +/*
>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
> 
> It's confusing to see personal copyrights with company email. Either the
> copyright is attributed to your employer or to you. If to you, use
> private email.

I hold the copyright, and I would like inquiries to be directed to my work
email (as I don't have this hardware at home).

>> + */
>> +
>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>> +
>> +#define LYNX10G_CLKS_PER_PLL 2
>> +
>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
> 
> These do not look like proper IDs for clocks for bindings. Numbering
> starts from 0 or 1 and any "a" needs to be clearly explained. What do
> you bind here?

This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
This matches the notation used in the reference manual. Although for
convenience, this driver considers the PLLs to start at 0 instead of 1.

--Sean
