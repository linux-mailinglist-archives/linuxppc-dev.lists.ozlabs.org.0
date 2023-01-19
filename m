Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B3673EA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 17:24:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyScj4zdKz3fF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 03:24:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=MZxYrYy+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.105.77; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=MZxYrYy+;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2077.outbound.protection.outlook.com [40.107.105.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NySbj5wbTz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 03:23:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSZEg3PINUHeaxEtN54N0NNa/vJYGgRIpzOcY3DJSyup/jh98Vh8huddAKgmUgXBN90pETiUDW8wTBNy75pP01ZUX79LcR2AWRTGLj1kAqMDRHnqegZGCPDkhEwv6VmEWQr+A+E9TcgCsqcWkcBIVzXsFm1KXLX26B/ht70UbubHJE84ELISp6+nExmVn2T0pYnN5TY4NQb+sl2ROD/NdMyFWljKmubxTgnes8d1OxayK2/1nf0CqpXgOkfS49ETl7iKlH65H3wS2A7HqIqM6iQLwuWNjH77WEAlyS3Vqqqw38mpuiF0ZHtbInOIW0A4KNpra+3ob9GLBJEf7sWK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcK7D7u4iLDuWEf+GfXKvnKfqAs1iVC5ykZJ9QFYgO8=;
 b=gHcyRmRV9B091M2LfVROUybfyP3knG/7u5311GXuPGAGYZn27SJoIvZVBzYVPKktU77n062QEQ2mt6gvh266gv2c2aAZoA6xn2AR1+/bsPwYU2wpBav+iAqTxAg250ntvSQ9rzHmznVTdi8Q+T8AvF+BgaLvif35grYlLX/yaz8V6esYTcvfeq76qExXxJcX567VJnjq7AA0Mn271FDyqrZCBo5NHvMl5LFQkLxiDXnDidciYaKDm2TrPoWmtx8Ogdeu33m2gAHAsC1vfSl+GmleEif8NGk+a/CVKNwkqev1AUQAPllqtFN+L99X14jvF3JPZjSjejI53GBL/+bpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcK7D7u4iLDuWEf+GfXKvnKfqAs1iVC5ykZJ9QFYgO8=;
 b=MZxYrYy+SW0Udk/0d/xpGZ4U33Aug2gcYJlVSQ9licoIVSDHhFtZckz1ucUjoF4t4z/ad/yg4YD632c4Vdov/DdqPqky/3ZDnTQGQZn6OsE8pRsafGRtWS7wLx7i42ieEs6dfkTgRIjIJfb5ZSaxe+x1tgDLKMCwSLHyBnr4aVahaGVzX1K17GigoqzpM6pXbPVbAfa1xgfyg+7jsYApSsH1gqn1W17XapVniJFKeW7/lAG6IENYJ032cgevUlXhFNrufXHGQR+hRnG1YCJRXG0g6ZHD4xrizk2YRVAbQXQAr72qrFJH4YJUdunRHtcuGa5R4uQswwCqcf/h7082pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PA4PR03MB6991.eurprd03.prod.outlook.com (2603:10a6:102:e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 16:22:51 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 16:22:51 +0000
Message-ID: <17e428ae-7789-a1ab-3ccd-90b3b9a088f1@seco.com>
Date: Thu, 19 Jan 2023 11:22:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com> <Y8gkMlqfPZic7reK@matsya>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <Y8gkMlqfPZic7reK@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:208:15e::34) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PA4PR03MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6704a4-a358-4257-52ce-08dafa396914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AFPgAlp8FaAlf1iXNzkq+9tO/PSMcfUrAB2etesKR8CWQ+BiPmDlF/ojeDIzSZk+RV6H4Os7ndD0UTJd3VKg4WrPJPNchT2mBGfhJk8ekM3YT6MPvRx7NT6ZlV0hxHsw6Zb8k1huOsnWqisNCwvJBnA6at9lngdTDER0jnjpzKIZEMpZj5DReUMQgLRTmcDjU9cfQUQ84E0OgaHS8W77Heh5aZkAox6ALgoBWDGoMYjVAlss5inwB56TPKJuLa6jHZvZBl7SpCVyZDKu1wjfNionIoIK19JCE4iC+Cyp5D0A7hshnFOMysEoQWGD/2KQSh7r2gT7NjPSiPRkEfwdh9AuKZnxRF1BVhnQJEdg8otRQ3v1JahzNM1ip872bPadVfi+2lelwzTxJ9fhr56IjsbwPLstaFOeCbMxd3VNydXZbZW3MEueF7OxUxoNUt+LoqXCgNfCZbF0UZ+lO3VuAOhAHK0gsg6xn3Qb38aQM7VBxWRV0GuKiTpS2bEJ7BCbwOSNnt9IxSbdQDpRE5lRUvYo00C+bqqzbav2RfhbHNTNec0Lhno87BxqsSHD1hu2ykvzBj68MA2a5YRIxnH+xaQ4oOvtoVrccxIFS/hU9WAj0+v9UgVq7TbxIEcf677AwRKwhsx5e3VhU1YplTnhyXIsX+TDVPLfTFLFa5zpdhYD0owmSCrTPwG/3nsMxaxIHq/426AEEggU/vVS9qNCJqgqxMQY6j6g+HCSKVA3CfSIdVUcVOua8r3IIN5/ZYR2GNILCPxTv1TyIK/iY65QTg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(31686004)(86362001)(66476007)(44832011)(2906002)(4744005)(7416002)(5660300002)(8936002)(66556008)(66946007)(31696002)(38100700002)(38350700002)(316002)(54906003)(6666004)(52116002)(53546011)(6486002)(478600001)(6506007)(36756003)(8676002)(4326008)(41300700001)(6916009)(186003)(83380400001)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MWs5REN4ZDFKWm9ObnNHeENCY3YvWEhXYi96dGlKUEtWL1V5MXBwajhJK3h5?=
 =?utf-8?B?RTl3TllpakNnZENxd3lRNm5UWkdtYlZCS1ZKWjc1d0tpMVBqbXBOSStmbTZP?=
 =?utf-8?B?RWFOcHF5RUFhcXZXY3dDUWVsWVhYZUlWTm5mMm1tQ2hEMXNhS2VFNUF0Q0dM?=
 =?utf-8?B?SFdkNW1zbWtnclZ0OXl2dHZvbm1nbGUxRUhNekxXd0RpUmExWXpEWDE2T0cx?=
 =?utf-8?B?M0xVemcrcGdTMW5wRzZUa2ZCMzZqd1o1Y0p2SjBiNExBcXRIU1BtWVRIaUZZ?=
 =?utf-8?B?ZG9JaGhSU1hEME5IeW1QNXBmSFpyZ09LZm1CTDZHMEZkbjhOWkpkdGlyUWxI?=
 =?utf-8?B?eitHTGNtK2d2dGRJek9HdVRMOTVZYm10N2M2N0hzdXN3L3hhMEx2blVseTBP?=
 =?utf-8?B?SU1VTFNLNU5WaFNCVDNGZGVwR2pYMUxFYkJ5STg5dWJ3K3pISkQ5dTgzN1Fz?=
 =?utf-8?B?cFJuYk14ZDZDZjFmZlJVNVRYdWdGdm1OaHlPekFLS2lDSkFQdlhDbG9RWHVZ?=
 =?utf-8?B?QXFRaGl1Q3d1cm1sZVhTTUtmZGpxRnJZclcvaWZ4NVU2WVhZSjBRMjhid09n?=
 =?utf-8?B?aER5OFIyYjlFS3B6UE9NNjEyR1hSeTRNZ3Y3ZzQ5TFQ0MzZEcVBva3A2ZjE0?=
 =?utf-8?B?R0o4WU1OT3ZwdzVDUCt0S0VZUmpwU0Vpam9pU2d3N2Z4cGdwa3pHV1JwTVhY?=
 =?utf-8?B?MlpzWE0vT2dzZkM3bU4wUjl1Z0hPREJFVk00bTNhK0UvZ3Z0WkI3dXo5eTdJ?=
 =?utf-8?B?dnZhV3B5ZTFKUGhnSkpERUI4SC9UNzBHQjBTRDE5RzBZUGF1UmM0MFZid3ly?=
 =?utf-8?B?VkV4TmN5M0JXTWQzT3ppT01GTXdsQWg4ZGovV0ZEUFQ4RkJIMjNKNDlDYnBu?=
 =?utf-8?B?OUJvTURsSG0vdHkxQ2hoZ1pGdVRramF6dmhRb1ltdUZ0WjNkL1FOekFzdWR4?=
 =?utf-8?B?L2t0MEJYVDYxc0NBdFdQS0FhSmJwVUVpU2xYc3VaYzdza0pob1V3MXBMd1FT?=
 =?utf-8?B?am8xY0hTdEI1eHdpTVpORSsxMVcraXJsc3pZTW5PQjJQQ3MyWjNkQ3J3a2px?=
 =?utf-8?B?K2RnNDJOZGQwWlFrUFN6RW9yMHBxMGhQalY0L0NRWU80UkJFcGxWbDhFcnlw?=
 =?utf-8?B?dHhrUlo3R1RXaVpVWjNDdWh3V01uSXRmL00reXdRWDBtWFZ0SkR6SlhZQ242?=
 =?utf-8?B?SytYSVJKOElpY2VBci9zUWVqNFNlQmlXeVpnYnl0R0E5M2pnN09ld2ZlYnJD?=
 =?utf-8?B?K3BVNWZRT3FHekRQbHl6RWZSYnNpNzJydGZ3TWpqdnJiUG9WN1BBTE9UZjRh?=
 =?utf-8?B?K0FwZkJza0EvR0VVZTNIYVhueUJ3RGlXNks0bC94YzFkMnZDM0pkNEFtdDc3?=
 =?utf-8?B?cHJxQ013NG1ZTElkSExaYm5Jc0xncUVtUElNRmFrUVJXSG12T2pzMWFyTzVt?=
 =?utf-8?B?dDlLSkNyWi9Ccm5tciszSnE2QnV6aUpJWGFkYTR3VktoZmFuU0pVRll5TXds?=
 =?utf-8?B?NlhyN1VnSmdxYWZKTUJna2p4VjJkNlN0aFdpUXltSkpkT01rQjNEd3dUdGJu?=
 =?utf-8?B?VjBPdHJLWkErclZ0SlpIVTA3TUxidi9sNHhtZ285c09hdjhVaWF3cC9Ld200?=
 =?utf-8?B?WCtvbGZCTTg4eWxydTJ0UzlQNmJtYXpPWmJXWUdvNHNpRVpYUzdOeFZvbzNW?=
 =?utf-8?B?ckJ2QUZ0VWZvVVVEQkh1S1U0RmdBMHU4akluRFFVWXZmaWVvdnpMZStWVmp5?=
 =?utf-8?B?YUlObGNzOCtOTTJlUlJYSlpydjhucDNjek5nVzg5ZW5OSDdLeGQwZGczTmp5?=
 =?utf-8?B?SmNqYjZ1TC9IWGlEZUpDTW1EaXZvZjhabURqWDVjU0pwTk9xbGJYWWJ1WDc4?=
 =?utf-8?B?Z2JYMzI3RmFkTkRxaDJSUURpVVRLRVNId0liTFhYdElUTHVNeStFbU5yanV5?=
 =?utf-8?B?MDJlMzc4emVvQ040dm52OEpNOEYwMzNHVHdPWUtNVkhLTzNJd085RGVMakFh?=
 =?utf-8?B?bTlEaW56MXNPY0JMWXlRb2MvUXZMdFI1clZCdXQzaTg0d2ZNcXR3NitvNEI5?=
 =?utf-8?B?RDFNbEhpVk1pMWJOaC95cGxWYWJKUGFTakVYdkRqTHFxQ2NHcDQ0VFQxQTZy?=
 =?utf-8?B?enhiSG5CWUhZclNnMUcrS3ViZWJsZURmamlqS05Yb01iNGE4YkVZeFFiZExG?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6704a4-a358-4257-52ce-08dafa396914
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 16:22:51.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iq/LAGbGF6JavLANK8jHjeTbJ999zQ0QCtE2L0whKbR7L5Xf6iSWvntiFN2WBTSQ0c4EGNmumyvzobC2Fg97Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6991
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/18/23 11:54, Vinod Koul wrote:
> On 17-01-23, 11:46, Sean Anderson wrote:
>> 
>> I noticed that this series is marked "changes requested" on patchwork.
>> However, I have received only automated feedback. I have done my best
>> effort to address feedback I have received on prior revisions. I would
>> appreciate getting another round of review before resending this series.
> 
> Looking at the series, looks like kernel-bot sent some warnings on the
> series so I was expecting an updated series for review
> 

Generally, multiple reviewers will comment on a patch, even if another
reviewer finds something which needs to be changed. This is a one-line
fix, so I would appreciate getting more substantial feedback before
respinning. Every time I send a new series I have to rebase and test on
hardware. It's work that I would rather do when there is something to be
gained.

--Sean
