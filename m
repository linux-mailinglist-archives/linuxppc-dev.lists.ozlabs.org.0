Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461066E402
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 17:47:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxFDY1yb8z3cff
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:47:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2cOO3KNj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.66; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2cOO3KNj;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxFCY6cW2z2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 03:46:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiHxRkXa018ezH5xAxZb4xNXN+N7uIkJ0q9UPcv2Km2LQpTtO32KvllXUEQ3InaGDUci7s/auOVlAmUKXKct1FxgLeBnFJ9zdvGKnJhZ70bq9dYsGoIgFCOazM0JtCwJ13u1ZIinWJXttQBcjdfvlufjNZAtCde2YU9ECnFVeEeiA3waZmg6ZuUqPPUAx6N7bXTqimQfcSGLIUhaKHP4H0Hnhkkpe5F1AXMSsrbbJHvtOAa5vRTlGjJ2Z55tPRtGLU4GtDoOAZahunDDzUyIICgIgjhuZOQhmzbOeZlKioAf36EEWgMjIxdMaZyCPP1mYylYzQmRAzm5TFdDZlsM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvfYQutEl6PqBITNoW/fFfGKZTk3VsnU8gQS5XsSSKU=;
 b=S+350q53roMDN47qwSM6fOVQOOCti+SzfMy0ZuyWs3/06PuE8Od+EZ/1uEaSXp3oMWHpnZ5Q4mXd1G4ISAwTJWgZNIjFCZrSd6w17WjfER8jH7J9G2vPPK968ypJ/B09QS1OVreW4kaCFuZT2fcoy9sJfNEwiv5ysuZYqQq5JvuuZ2GCeCFYMcG3jQbT1k4XlVIphohf9d0ybj+uzrtThxVwCyF2W4pCYD5uhVuNrMa0awZ4cUYGN+aO4bjyugpSBlYfaeQufgb8aIkvJrGXEetV4OLolxQE4y9AfNKPnKYVUp32eOtFqgaeQfnkq1T8ZTY3yYlTW8xKBsMRMJDE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvfYQutEl6PqBITNoW/fFfGKZTk3VsnU8gQS5XsSSKU=;
 b=2cOO3KNjSfttHz1qXRm/psNXXAMJdfpffAs8qbYcO6+YsuANlXU4fjnILueMZcgW1pdeuFEraQ3ETBQdqZEUFqJjZiGqRKjdFTiZz7mOKs1OYnTH6onY9fqXvji08CnLoHE/6XLBX1t7/ru6IHZoe27Gep5fhcVW/AsAPN6r90fdgMlJOMPq25vIBo09s6RLD+7IlEPWU9iYZMAhGX28dDpTBmr1RWNf7TqdzDYHMajhib/nqJjLkr7MdNrFdrWxgHrbdbD1VyRDZn6s5owsLKIpcYHRt8VYmwkJ4bwEuC7SVFK3dKxBNRDuOXkQlBGzbdRNgY5JliKuUX1va5rNBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6183.eurprd03.prod.outlook.com (2603:10a6:20b:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 16:46:11 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 16:46:11 +0000
Message-ID: <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
Date: Tue, 17 Jan 2023 11:46:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20221230000139.2846763-1-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0041.namprd19.prod.outlook.com
 (2603:10b6:208:19b::18) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AM7PR03MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afe7d03-bb44-46d8-2d6f-08daf8aa5700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AHbLvUco1rTmIFwVtRZcLgLxUofw9Kn5xVYjKqetVjH7o2HmRFZQs2hDtQ/p2ZGSclJsb0XMcg6NvlN784/mdhqnKm89xXErCy3XjjtETL2cuqHvZDCGFYE+YF7gYs+smze9dI+oWOoUJBqgdnVHg2QxjVcIwCFUUKpWi7VktwevYjGz8vRLnNgoqRpDp4HOoUgSAb6yCZq9hpdJMauivQcjN2bsy3D3+IN9DCMa2F/Lf4D7b2htu5MsVkLPgNgBKbLH0hWxrPQe95Iw74yPAkswRaqizChpm/Y1DxOnSbo5wqK5rgL1yJbx8HHGx1rHNIWXZUfYOXMbT0VLMJ1sGwXEyVP6iNaEXSjCINWEKSAGpmuH733/Qhpxmw2cWa+RqsaoKVZ1tJ/DxT41YGPbPaYkiqVs0hxlgwGGN7MIVRBo3i4QVER1XmQcsKnoJeZgCU8DmvWF4SZJ+DipkEZdUyyW5NMeVaN5xYu8XCHLf0UBUcpNB36MGydChcVPQrQ62gRaTxNPAiJrZS9TPEJ35Ecr93V8Rv4E9F2SWLDPXXbd3fBNiDxahnClJiY51o4ZxjVcAgW640RJDdFbN/r6k9F8Ghj1oK4PGlJEfqp2ljkA5Y/b/f1vc3BJnLsx1DbTlR7a/2H1nwbTq02gsetidSA4qpZiuOM+l8J3VXMJa3c4Ud4FcUKS4us8dvIcxykNh4kyuLQbh/t+dPmZsVyNn1Z+ZQErgTy5T0NCwq5/p5v5rKB7XQlZ6lH3oozBfZXYEcuC0eZqXtN0xmNnDwpPGRMDjiN8WcCZSZPTs01ZnN4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(39840400004)(366004)(346002)(451199015)(2906002)(83380400001)(38350700002)(38100700002)(86362001)(5660300002)(30864003)(4326008)(7416002)(8936002)(31696002)(66946007)(8676002)(66476007)(44832011)(66556008)(41300700001)(186003)(26005)(53546011)(6506007)(6512007)(2616005)(54906003)(110136005)(6666004)(6486002)(478600001)(966005)(52116002)(316002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MXArRFpZWGRsR3M2YVhIZkxzUUtyZ1A3d3Q5Tm0zSDJ5SDEvMit1UUl4c0ZO?=
 =?utf-8?B?ZVhvdkhnNEZJeXJnY1RMd2g3dTEzSjNBQXdiVHBSZW1YOWRDZnZEeDk3WXM0?=
 =?utf-8?B?K3VRSlhKOXY2R3dmemFPa2VodjNWSzRqcGF4SEM4dkt1blBlaVNkUStxS3h5?=
 =?utf-8?B?K3VETWFqSmdKeDVMaUFtVklMYjRtUEx3U29aQ2MzQno1aDFudGZiSkZ4S3dH?=
 =?utf-8?B?K09meEorQ3hwbk9MWDhHdlMwa1lkeXFLcnFTMnB5ajM1YWZjM29GUHNwTzFQ?=
 =?utf-8?B?QmhYcUlMWUZHWU4vVjNUb2tEbUdDQTVZOS9zNUhiQ1pYVkVFL3FTcUMyMWhm?=
 =?utf-8?B?SHgwdTFZMlpxaXdrQkFvTVJFaEJtSG13MG9jaFA2R2FRTFdBWFJBbUVTeUNk?=
 =?utf-8?B?dTJEZGZiMUZNY2RvcmtyVk92UWhqbzh1c0NOcytxV2NsRmFiODA3cnpwNWRG?=
 =?utf-8?B?Q01FNmZBdTloa05NMDU1cEdNREIxUEpsd3hEb2tqcWJGeVlMM3hyVUN5dHlv?=
 =?utf-8?B?Z2FGcU5OdE9UNmxFWTNLTVE0NzlpNUpGYVJ1SHBmd0NodTlIWnljeHBkOGpz?=
 =?utf-8?B?Y2hYK21BdGtGZVNMSHlmbGIxaGY0R3hTbC9OeVE0cjJNRzNOQXBuM1Boa09Y?=
 =?utf-8?B?OGhrSkhrcm9YRmJWZytJNkZZMi9NRUZ3cEQzbk03QUd5cGZMR28wcHhad1Bi?=
 =?utf-8?B?djlwOWtkNTlnd3djY0tQTGQxU2QyTDRLVkdlUEdHZ2ozYkFtR0luWDZ4TXBs?=
 =?utf-8?B?OWdWZEY4OWVFVkxUa0xhdHVobVZZUWM3Q2s0SVBxVGZHZ2MrMTN2S1lnbkhO?=
 =?utf-8?B?Mm44VElvelBtd2VLWlZROVZDcjNjUStyWVNGenE2c2VlKy9STDZ1dmp5UWpz?=
 =?utf-8?B?SkM0UTArbFNCNW53dWR4YWF6ZlE3K0prVjlUMXlXZ2dWc29oVC96clNFeG9I?=
 =?utf-8?B?eTF3M3Y2eVJDRnlySDZaZ2g5UVJwSEFmU0VJSXJwK1hOZHJUbXdOMzJTbTFJ?=
 =?utf-8?B?QmZTbHlubGhhbXpjbnVXSVMzUnRmUUpQTjIraExKTFBPYVUxbTBwZURRanFG?=
 =?utf-8?B?YWNYQXVURVp6bmhyRlRGVjdnclRUcTk4MHVmaW50OVlpUndpRVlNazhFOUxt?=
 =?utf-8?B?bHVtWXV1UXRKdWdweXJnbEt3S3AzTGc4STgwTjFJb3J2b3dYV010anh2QWpj?=
 =?utf-8?B?UERyZmpTNTZMYVpYMVlSWlZBNG9JWWlPdGRUdlRZdEhZTHY5dzRBa29vL2JX?=
 =?utf-8?B?cGNGdkFFaVNYOVlVUTJjUGxXcjRPWklNcWxRVHArdjlqNFpqR2ZUSEJiWWFa?=
 =?utf-8?B?VnA5ZEsyVkEwRVdIdGFOZTZFcVRYVVcyKytZQjdQYmdFYVZFOUZ4dkZoVVlH?=
 =?utf-8?B?Qkt1b3hwdndpMVV6SFJwSVhpTDYrTXRab2kyaHdrZVI5RnlXRzFaQ1gxbVZL?=
 =?utf-8?B?eFk2MkI5VFJvSFlraVZzOXFLN2pEOS9OS0ZQbVlFUllmWlVmbFVNUlZ0d3dL?=
 =?utf-8?B?VCs0dFFiQ2RhM3dNMU9xVnlHdXBRYUtxeEZ5c0ZSeFJaMFpleGRxbzJTVzV0?=
 =?utf-8?B?QXIvdmFYcnRFNWwzK2RoTitiODNLdUF2VjFySTVSczU5cE5sZm43ZjJSbDNU?=
 =?utf-8?B?Ulo1NndYeGE4bGk1d3BuVFZrZGR1M2lPVURqUnhPUTkvL3hKZnlnQnFhSWZ3?=
 =?utf-8?B?em9SQzdzMHBtdGZsN1hnZ2pmNzJMKzloSUxLZmo3YWYxdE1FaHhVOVoxeGtn?=
 =?utf-8?B?eW9uYlpoNElPWW5uK1lmNW1GTS9GK1FzSkI2WG9NU1BOOUdFeG92cGdKdGVM?=
 =?utf-8?B?cU5uZzR4c05KNTZ0Z091d2F4Z2V0Z2dwRHQxOFd0cW9ZTjUwZEg4UmtQZnM4?=
 =?utf-8?B?K2ZWZVUzRUdET3p6TVUyWFRndWR2bTVwUGdxSEhZSXZmUU9GaWZaUEZHc2FI?=
 =?utf-8?B?NDVPSTZEMU1aaWhieWRmb3RyZmdBVUtBSHhzUHRUdGFNYXMvb3YyRmpCamlL?=
 =?utf-8?B?cVc4UFgzckpxM2FrY1dZcW44RmgyZ29vaHZRMC9zcjJRUUJ0VGxmbHZuUXpy?=
 =?utf-8?B?Ry8rY1NMOWdweHBCeHhVZHBCTlY4SGpheFFXN2hwSHBRRmFHc1VTNzcvaEdC?=
 =?utf-8?B?ZEZjTWpQZC8yS0VNMVM5b0xka2E0NWtEK0JwOStlUVljWFJtd2FsNmd3d1o3?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afe7d03-bb44-46d8-2d6f-08daf8aa5700
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 16:46:11.6291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LV0NhRCxc1kestEEXzjbNHdR+bAH3h/gK2bjlkNNQi/IdbgjRzP+zOy1rdfdXwQmVJnKBaymZM4jv8cf5eqnwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6183
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/29/22 19:01, Sean Anderson wrote:
> This adds support for the Lynx 10G SerDes found on the QorIQ T-series
> and Layerscape series. Due to limited time and hardware, only support
> for the LS1046ARDB and LS1088ARDB is added in this initial series.
> 
> This series is based on phy/next, but it requires phylink support. This
> is already present for the LS1088A, and it was recently added for the
> LS1046A in net-next/master.
> 
> Major reconfiguration of baud rate (e.g. 1G->10G) does not work. From my
> testing, SerDes register settings appear identical. The issue appears to
> be between the PCS and the MAC. The link itself comes up at both ends,
> and a mac loopback succeeds. However, a PCS loopback results in dropped
> packets. Perhaps there is some undocumented register in the PCS?
> 
> I suspect this driver is around 95% complete, but I don't have the
> documentation to make it work completely. At the very least it is useful
> for two cases:
> 
> - Although this is untested, it should support 2.5G SGMII as well as
>   1000BASE-KX. The latter needs MAC and PCS support, but the former
>   should work out of the box.
> - It allows for clock configurations not supported by the RCW. This is
>   very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
>   on the same board. This is because the former setting will use PLL1
>   as the 1G reference, but the latter will use PLL1 as the 10G
>   reference. Because we can reconfigure the PLLs, it is possible to
>   always use PLL1 as the 1G reference.
> 
> The final patch in this series depends on [1].
> 
> [1] https://lore.kernel.org/netdev/20221227230918.2440351-1-sean.anderson@seco.com/
> 
> Changes in v9:
> - Add fsl,unused-lanes-reserved to allow for a gradual transition
>   between firmware and Linux control of the SerDes
> - Change phy-type back to fsl,type, as I was getting the error
>     '#phy-cells' is a dependency of 'phy-type'
> - Convert some u32s to unsigned long to match arguments
> - Switch from round_rate to determine_rate
> - Drop explicit reference to reference clock
> - Use .parent_names when requesting parents
> - Use devm_clk_hw_get_clk to pass clocks back to serdes
> - Fix indentation
> - Split off clock "driver" into its own patch to allow for better
>   review.
> - Add ability to defer lane initialization to phy_init. This allows
>   for easier transitioning between firmware-managed serdes and Linux-
>   managed serdes, as the consumer (such as dpaa2, which knows what the
>   firmware is doing) has the last say on who gets control.
> - Fix name of phy mode node
> - Add fsl,unused-lanes-reserved to allow a gradual transition, depending
>   on the mac link type.
> - Remove unused clocks
> - Fix some phy mode node names
> 
> Changes in v8:
> - Remove unused variable from lynx_ls_mode_init
> - Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
>   This should help remind readers that the numbering corresponds to the
>   physical layout of the registers, and not the lane (pin) number.
> - Prevent PCSs from probing as phys
> - Rename serdes phy handles like the LS1046A
> - Add SFP slot binding
> - Fix incorrect lane ordering (it's backwards on the LS1088A just like it is in
>   the LS1046A).
> - Fix duplicated lane 2 (it should have been lane 3).
> - Fix incorrectly-documented value for XFI1.
> - Remove interrupt for aquantia phy. It never fired for whatever reason,
>   preventing the link from coming up.
> - Add GPIOs for QIXIS FPGA.
> - Enable MAC1 PCS
> - Remove si5341 binding
> 
> Changes in v7:
> - Use double quotes everywhere in yaml
> - Break out call order into generic documentation
> - Refuse to switch "major" protocols
> - Update Kconfig to reflect restrictions
> - Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
>   anything.
> 
> Changes in v6:
> - Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
>   meantime
> - fsl,type -> phy-type
> - frequence -> frequency
> - Update MAINTAINERS to include new files
> - Include bitfield.h and slab.h to allow compilation on non-arm64
>   arches.
> - Depend on COMMON_CLK and either layerscape/ppc
> - XGI.9 -> XFI.9
> 
> Changes in v5:
> - Update commit description
> - Dual id header
> - Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
>   series to be applied directly to linux/master.
> - Add fsl,lynx-10g.h to MAINTAINERS
> 
> Changes in v4:
> - Add 2500BASE-X and 10GBASE-R phy types
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> - Add ids for Lynx 10g PLLs
> - Rework all debug statements to remove use of __func__. Additional
>   information has been provided as necessary.
> - Consider alternative parent rates in round_rate and not in set_rate.
>   Trying to modify out parent's rate in set_rate will deadlock.
> - Explicitly perform a stop/reset sequence in set_rate. This way we
>   always ensure that the PLL is properly stopped.
> - Set the power-down bit when disabling the PLL. We can do this now that
>   enable/disable aren't abused during the set rate sequence.
> - Fix typos in QSGMII_OFFSET and XFI_OFFSET
> - Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
>   reflect its function (adding post-cursor equalization).
> - Use of_clk_hw_onecell_get instead of a custom function.
> - Return struct clks from lynx_clks_init instead of embedding lynx_clk
>   in lynx_priv.
> - Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
>   primarily in the layout and offset of the PCCRs. This will help bring a
>   cleaner abstraction layer. The caps have been removed, since this handles the
>   only current usage.
> - Convert to use new binding format. As a result of this, we no longer need to
>   have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
>   instead of lynx_priv.
> - Remove teq from lynx_proto_params, since it can be determined from
>   preq_ratio/postq_ratio.
> - Fix an early return from lynx_set_mode not releasing serdes->lock.
> - Rename lynx_priv.conf to .cfg, since I kept mistyping it.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> - Rename remaining references to QorIQ SerDes to Lynx 10G
> - Fix PLL enable sequence by waiting for our reset request to be cleared
>   before continuing. Do the same for the lock, even though it isn't as
>   critical. Because we will delay for 1.5ms on average, use prepare
>   instead of enable so we can sleep.
> - Document the status of each protocol
> - Fix offset of several bitfields in RECR0
> - Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
>   a PLL is "enabled."
> - Only power off unused lanes.
> - Split mode lane mask into first/last lane (like group)
> - Read modes from device tree
> - Use caps to determine whether KX/KR are supported
> - Move modes to lynx_priv
> - Ensure that the protocol controller is not already in-use when we try
>   to configure a new mode. This should only occur if the device tree is
>   misconfigured (e.g. when QSGMII is selected on two lanes but there is
>   only one QSGMII controller).
> - Split PLL drivers off into their own file
> - Add clock for "ext_dly" instead of writing the bit directly (and
>   racing with any clock code).
> - Use kasprintf instead of open-coding the snprintf dance
> - Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
>   support, so nothing is truly "enabled" yet.
> - Describe modes in device tree
> - ls1088a: Add serdes bindings
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> - Rename driver to Lynx 10G (etc.)
> - Fix not clearing group->pll after disabling it
> - Support 1 and 2 phy-cells
> - Power off lanes during probe
> - Clear SGMIIaCR1_PCS_EN during probe
> - Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
> - Handle 1000BASE-KX in lynx_proto_mode_prep
> - Use one phy cell for SerDes1, since no lanes can be grouped
> - Disable SerDes by default to prevent breaking boards inadvertently.
> 
> Sean Anderson (10):
>   dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
>   dt-bindings: phy: Add Lynx 10G phy binding
>   dt-bindings: clock: Add ids for Lynx 10g PLLs
>   clk: Add Lynx 10G SerDes PLL driver
>   phy: fsl: Add Lynx 10G SerDes driver
>   arm64: dts: ls1046a: Add serdes bindings
>   arm64: dts: ls1046ardb: Add serdes bindings
>   arm64: dts: ls1088a: Add serdes bindings
>   arm64: dts: ls1088a: Prevent PCSs from probing as phys
>   arm64: dts: ls1088ardb: Add serdes bindings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  248 ++++
>  Documentation/driver-api/phy/index.rst        |    1 +
>  Documentation/driver-api/phy/lynx_10g.rst     |   58 +
>  MAINTAINERS                                   |    9 +
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  162 ++-
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   48 +-
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-fsl-lynx-10g.c                |  509 +++++++
>  drivers/phy/freescale/Kconfig                 |   23 +
>  drivers/phy/freescale/Makefile                |    1 +
>  drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1224 +++++++++++++++++
>  include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
>  include/dt-bindings/phy/phy.h                 |    2 +
>  include/linux/phy/lynx-10g.h                  |   16 +
>  16 files changed, 2434 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>  create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
>  create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
>  create mode 100644 include/linux/phy/lynx-10g.h
> 

I noticed that this series is marked "changes requested" on patchwork.
However, I have received only automated feedback. I have done my best
effort to address feedback I have received on prior revisions. I would
appreciate getting another round of review before resending this series.

--Sean
