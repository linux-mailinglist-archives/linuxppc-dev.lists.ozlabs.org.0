Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592461561C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 00:28:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N25n50TTcz3ds3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:28:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QcURuJzr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.40; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QcURuJzr;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N25m42XFQz3cC0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 10:27:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrZMX9hslRUG3QREZkB8r5tfb18dFE4Ory5DOmX9Z/QoX6JrjVAsbD70nfCED+z8FWgjjxXaMyFlf60Kopg1+iPhNrBrN/MfEZRjVTdTEEPXjh+l8Hz9m2OVIRWLSRUDYnPt5hNGhlTWUEIyLQM0Cw+uzrjrv03RYJOCImv31FC/EJlDf2fWlrnTpleyQAY9T6dEWKL8Dx5Hbmx+0zZ3/tM0aj1JWPybUI/YzUoDuKL1uf0Z+FI0zdoUEq8fAtBSIj54WnuHBUp0D+FSMHWjw9MD3V2+UaaEHum7MLSEEwaSnMo+CcCresIyMwRCBp+7lp2kKtUH7Si4TRoz45808w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB0euJUs8R9BTyhOLwueavcpAxZAjDo48mVPWxSKbac=;
 b=f0If6PDoWUxENOseMFISIojzS6S6gvTQuBN0fjlfjUP8hSfntdSqKTDi4DuvLQ07o5LekU0pMSaRXDGGmn4e9jTPLgZQ6vAYm1du+cFHNcKSp4PN4t2NRSK0K5AP8DQU7xfRGtme1kRlLabSshEZu5+BjQK24uipxhj6wf+EUJOE8qdeizHFrqhSDDsCyxeRCitk9RwCbJWUeqZhFN95K/VWBeKmpidkYRRKXg2dGf0X0WDxJiPM8t5L5oMgmqdeUt4iM2UxaK/cCXLbr8tBo3gQ+CsLxInHdY2dz2YRYPqih67MthOehMZk3UAdf+yiN1BRuOKUResFe32jqZBm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB0euJUs8R9BTyhOLwueavcpAxZAjDo48mVPWxSKbac=;
 b=QcURuJzr9cetInqjo0My2GK9uNPzqP951rbXL+qbZB2D/SEEM3B+wf5U9jizewRyv5M6P4Och0MMC4AIzzABF3ABkfb2plf9jVxI3wuJKvxGNcbpEElnnAoZWw1qXmwDE/pubIOAc2eo3VnZIOnxszyZWdNt3y1X0Z9EU+6LxYGDlQNriGAzjhOy85CKR7A0ijY6NaCPjGqrUfOlgg/IBiJOeE7OH+BRBSKWa4yj28zt6FUCus5aV/P7NPqzGGOADV6FNMPYk5JspGpmcIhRdz+UkLJkCr+4kfAvILUhQhoVNJU3smXljagCFANCr6L6Rjj9u11NkoN3wRTXiCO/xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AM0PR03MB4964.eurprd03.prod.outlook.com (2603:10a6:208:fc::33)
 by AS8PR03MB7205.eurprd03.prod.outlook.com (2603:10a6:20b:2b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Tue, 1 Nov
 2022 23:27:26 +0000
Received: from AM0PR03MB4964.eurprd03.prod.outlook.com
 ([fe80::bebb:9559:edd8:5e79]) by AM0PR03MB4964.eurprd03.prod.outlook.com
 ([fe80::bebb:9559:edd8:5e79%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 23:27:26 +0000
Message-ID: <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
Date: Tue, 1 Nov 2022 19:27:21 -0400
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
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221101201020.B6180C433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:208:e8::28) To AM0PR03MB4964.eurprd03.prod.outlook.com
 (2603:10a6:208:fc::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4964:EE_|AS8PR03MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 678054b5-69b4-4815-793f-08dabc60a307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mvz06i79cfDXqtUImMOhIUXCrXxYJ0kuHZBbccuNfGEqL0B5N3Uq4H8QrOjuJnTGc+J/UQHXlXeL01NCGJt5i4wB5Czw01dsbL1qPg3OLrQgdjOieGRgVk4cboLXT85yJuATraF9rw18kEuYUoFBbjydIp34/EJA4AWpqki7ruOkBinHHDPfpBqjpAG+5IkYb1OY6ke4/J/6abnj41Xe8bym6cx6Nmc8zVQM0XW4jruw+ZCg8P7RC++rqX5ixcrCYBFtjzGQFiaFOBWHzmXc8dMC9jtw9e3v2+fS8ki48lmHf6Mh8TjpkmPK8o3W1gAvP3kjNmUG8I6oCVuqtYw5gznmR6xXpjLi5vDRx2G7QguDa+FMUGHv06b3A+6M04d9QUoTtXwzzI9SRazm1SVJ5/Y79ueu7tFw3H/3YzgK20AA9qZDYex+PndfpiiyghH68xqq5r2zpORn72QsSbIFgiFPHq8Gr+FjMoyUa336bha1YcsPX/oZCADYybY9UrwcQK8TGVLJfOTFYZlBoGqkzRB+DfXwYe5M9BVujp77uJe22e2dlxgrC0BvmOS9zYRMgyHQpAeqaK5S6n78WDYdGnGZpFtHd9DcfcSgNcjMSawnRdDKfbxvvcI+mWvIJSFh0eLH0nvlBEzi6JMEOlfWqjkneDCk0iSTvkuaAXAHHz0BblosJ0AYXRMvyUZFCzjNwHm8zIxl3FZXikuOZLwNl14AV/c4uyTmr4jLLtjh4TIwKnwU54qBoJNnW8PiU4WCoz9X0nqE0cvqRtjS9EKPsrnr7P/smFuYmk/NA9SRThbi8LMDI3RTV8PbirPwku4h
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4964.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199015)(31696002)(86362001)(38350700002)(38100700002)(8936002)(316002)(66556008)(66476007)(7416002)(44832011)(6486002)(5660300002)(66946007)(8676002)(41300700001)(4326008)(54906003)(110136005)(2616005)(26005)(186003)(83380400001)(2906002)(478600001)(4001150100001)(53546011)(6506007)(6512007)(6666004)(52116002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?K0JFV0dNa0JVeFY3eVMvZE8wVlFiQ05PamRiaGQzNGtqZUdQaDhvUlR4d1cy?=
 =?utf-8?B?ajNNeTNScWFFYkhVKzN1Y0g1S2QvNkFRVW8vcllWKzN3d1VVRTR1SjJlWEVt?=
 =?utf-8?B?UmdIUFQrazArQnFYTG0vNzhvazMzMGhuVktWM1M4blZsQjNyd3FTZ3VESFB2?=
 =?utf-8?B?T05JUE1OYjBLWUtmSHNSTzE4N0UwOE1pT1VxM25wODNFYlVqTXVMTzF5OFhy?=
 =?utf-8?B?R2YxS1FZL0RWN0ZMRG4xQUx5Y2JvenphRVFhbU54T3pvRGhQL1dXWGxKNi9I?=
 =?utf-8?B?ZEsyU0NiT2pJL1VjbHJqcFBOL2NJOW9TK0xHRCtxWVFTU3JKdm5OWURWMlF0?=
 =?utf-8?B?eFY3MkEzb0I4ejFkL2dLS1BXYXpRNit2a1BUczJVMnJub2JpcDZldW9rZWFM?=
 =?utf-8?B?cUVYV0krb29nTHl0eGF2WEM4K3kyeS92YUY0c1JyRjNHMVd6UnpEYUQ2RXJP?=
 =?utf-8?B?dXg0Y0NUWnJvZDRoU3QyS2FHYlZveUw2WHRvVGhpMzVVejdSYlFiNUdURk5G?=
 =?utf-8?B?NFJ2blRhd0tWV2FTNEZseVREK1RiREhScU0xTGVtbGIvQnlDa3ZWTUE4Sm95?=
 =?utf-8?B?ZUZBcFRlSUsraGU2WDdyUkpoSlRnb3EyNVZqV3RGeVJVK25yMGR0YzRxUW1z?=
 =?utf-8?B?aHpaZkwxRWEzbmprM0FhMVVkdnZieEtjUmNaNWZIMm1pSTFUVWZvTEM2Nnlx?=
 =?utf-8?B?WkZlR3dSVDJ4RWhjUU1FTlYycm1WR2xrWVZMbk5janFnMDhHWWZUK2IrTS8r?=
 =?utf-8?B?SGcyWkdkckdoa1k3VVlNc2VXUGczaGRpdGJ2d0V3cVAwa1VXajlnSkI3RDlW?=
 =?utf-8?B?dmNGME5lS2tMb1RFNEFCQU5HbjlaeEhhVHV3d0NBZGRJS0RjNHlWL1VVVGI4?=
 =?utf-8?B?bnUrQTBQTGJHTVlNb3YxRzZkN1dDRmcvQUdGQW1hc0NJUGVyNU1mcGExNi9F?=
 =?utf-8?B?S1M5MUF5WS9YNCsrcE4veWQwUE5hcDZTNlZlQk5SNE53Nks4MllJZjI1Zm9E?=
 =?utf-8?B?TzNIb04yWHpUQlpYVE0wdFh1OWh2U0Ezd3ZlRXlpUGc3Z2pwQjNtMmxUQTJO?=
 =?utf-8?B?cVdnbU5IUGY4NE1BTHNRZzRjMXBBUTZ3d3ZUUE9yV0dEdHkzRkQ2RG5zNmlP?=
 =?utf-8?B?R2dNUTk4RWRWZElPNWZDb3d3N0QzZU9GSk5wdE90SUxTc3FNdzFwbm1FYnB6?=
 =?utf-8?B?b1V1b2xFc2gycFJiN09VOE9wQytwQWx0RlVPQ3libTRkY2xYbFhkK3JhczM3?=
 =?utf-8?B?am5uT041MUMvTXpuYkRkUjk2WmMxZTRBaTREMHdnVm5BaDNTSkdkdGFuZW52?=
 =?utf-8?B?MUtRRFBpU0xwT1grY0Yya0UrL3JkSUwrWFNlN0h6L0trK3BFdzNSQnkveTBH?=
 =?utf-8?B?cXdMVFliNXdhQzJUZTd4dTZjN1Q2SUdWWURSNXppZVdOWGQ5WjR5ZmVFSGZ3?=
 =?utf-8?B?NjB1SVB0dEY0RVppc05VSjNoWHhpaFpNWktubDVQWVZJTVlLcmk1cVpIWXRS?=
 =?utf-8?B?d1hndmtoVjNsZ2dQazNUSUlVV3p2TWVWL1RxZkhxTGpNc2ExNzVlYXpqTHc2?=
 =?utf-8?B?dVlma2NBVWMwRmVkd3B5ejBOMjZaeHhYWGRUbUNlTU1qOWhvT2c4aVNBbkFF?=
 =?utf-8?B?M0QxN0RYeWRxTENjTXExNTdITGk3WVB3RHp2bm5PeTNtWW9pWUorWmUwYisx?=
 =?utf-8?B?T1F1cmpaSElwdnkwMFdpMHZRalZnWHBwcjdLNkpqcG1VeTZhVkxoRjlaUEls?=
 =?utf-8?B?WGNJYnNDSzFyTnZEYmZucjI0Vml6TFFrR05LVjBZRWdBQXg3SVUyMkE3NWVZ?=
 =?utf-8?B?dS9GZmJvSXNWdU5uMDZoYk9BZkNHTkE1MDZOT2ZjODdqZ25KeFV2RWJUdTlz?=
 =?utf-8?B?N05WVXVSZTBqUyttVFpTc2RPYThCOUVqZGtTUC9uT3paWFgvR2JucUFTZ0U3?=
 =?utf-8?B?MkhYNWc4Mnl0Z2FHR0dSMHd6RnliWk1aZW1Gc1dVbTZkSHhrRXl2bnFEY08v?=
 =?utf-8?B?NnRIeENNZXB3bDlGVkExdmlhZkVldkdjQUNsVllzN21POTFlSDdvekwvQWo5?=
 =?utf-8?B?eVJEWUpESkhQR1NHNWxUY05TN1NxMnlyRDB1R2NDMFFIZmhDclZDR1JGY08v?=
 =?utf-8?B?aU55aXRBQ2VFYmQ0VVNZYWp4dGlsWGdlWm5wMGk0Szl0MjZkazZESW81R3N5?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678054b5-69b4-4815-793f-08dabc60a307
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4964.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 23:27:26.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJK1QML+ZOb+fM7j+SDZf25D7r89NKySnYgzJVtlfh0UD2zzPCMKGpnsFGpyhoPH3isrKHr5tu0oWi5gJkSjkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7205
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

On 11/1/22 16:10, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-10-28 09:33:59)
>> On 10/28/22 12:13, Sean Anderson wrote:
>> > On 10/27/22 19:03, Stephen Boyd wrote:
>> >>> +       ref = devm_clk_get(dev, ref_name);
>> >>> +       if (IS_ERR(clk->ref)) {
>> >>> +               ret = PTR_ERR(clk->ref);
>> >>> +               dev_err_probe(dev, ret, "could not get %s\n", ref_name);
>> >>> +               goto out;
>> >>> +       }
>> >>> +
>> >>> +       clk->ref = __clk_get_hw(ref);
>> >>
>> >> Please don't use __clk_get_hw() for this. Instead use struct
>> >> clk_parent_data and set a DT index in the index member to map to this
>> >> clk.
>> > 
>> > OK
>> 
>> Oh, I remember why I did this. I need the reference clock for clk_hw_round_rate,
>> which is AFAICT the only correct way to implement round_rate.
>> 
> 
> Is the reference clk the parent of the clk implementing
> clk_ops::round_rate()?

Yes. We may be able to produce a given output with multiple reference
rates. However, the clock API provides no mechanism to say "Don't ask
for the parent clock to be rate X, you just tried it and the parent
clock can't support it." So instead, we loop over the possible reference
rates and pick the first one which the parent says it can round to.

--Sean
