Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CB6D4667
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 16:04:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqt0z5QpWz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 00:04:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Rx+fxQbI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::603; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Rx+fxQbI;
	dkim-atps=neutral
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pqt051bMmz3bgy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 00:03:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJXNAqivDrGu/o/tDKb5TUIop4vluvWgjibDTvx8B8tbyhcsgLHs1l8suikITX1uRk7EvFgOUqv874mPcLO4SVU4ZtvJrNbrE4gMH7z0vawLSH18UAjTP4gQb2Rt7sSk61/u6IIt2e+bM+GjOA348an47PI3ax00OVaa79waAk366ScKvvdHornuX+guVkZpbTSo+VdDHXkTPr6ZH7BBbJ/ivEhQ7ed3zJZaPGrXaNRWOVTJ14hv9K9lcawBDkwtGctkdwbxUzu0kAI/ruOF29WmL3j155kLrCZG8fUtEqdAbBj/c6pCEGJrU2HtxvdiZB3bt5yTtz+s8owNom9S2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H2S0fVMCAsQBlLaIVdijR8w/I78c5sqqrtKj8UoAk0=;
 b=JnemgycHnzUquLaJGZyxH2zea8b9s3OVt11Yn8QbcSwHoN/UEY7wSK7+5M+WWf9GRTKtSBoVZ2wUYwMysjksKwhrDshVTKIMlfiYKfWWeQuTU+VWkSK8NfCKnOlZ4yOrDKhpQi/THfifMl9fxSB0uMiv9B3YN04rGAj2EaA6EpFbi+aNNy1iRC+mfXggHRxHBPhNDK5I+cJ6gKyHE19n9Mkv7Htag0126F1R7CrEW9mSi6pStjU1/quL616qV/4hpOofDV3FeFZ0nWCjDDuaFY0ATUmRbp8MUzZtsOx868oWfPvv60GAgUw25cTKCZ4i0k9Aheg1F7qS7J6Rj20IVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H2S0fVMCAsQBlLaIVdijR8w/I78c5sqqrtKj8UoAk0=;
 b=Rx+fxQbITMD1H/1lYtzExuaxP8OQd76gJ/7Jv3bnIennEjoriIcS+aIHezuAzMcIRba+c/Y892xu5Y88sKk8eQl+JlsKLqXDykKJ3x867OW4RX7Se+XySoygl1RWoMkQW2sP+9s8A59WyV5l2dOAiqpFLiSb0wq7ObDMDrz5MwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:02:51 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::dfa2:5d65:fad:a2a5]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::dfa2:5d65:fad:a2a5%3]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 14:02:50 +0000
Date: Mon, 3 Apr 2023 17:02:47 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v2 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Message-ID: <20230403140247.ugb23hqrha2kjup2@skbuf>
References: <20230331151413.1684105-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331151413.1684105-1-sean.anderson@seco.com>
X-ClientProxiedBy: AM0PR06CA0073.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::14) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f92b4d-0238-47c8-9541-08db344c1cae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  aCYmdca4php/7c8w2rL+dHyXwIU1RY38rT+FeUIp3D0Xb6OQSFdf1IcPDt7Em0tl6KjskIPvV2oPu1VZItiRPBA4KefJSQF64Rru6JnFgrFN4Q9uO1IhUg5OLHtGhaPxsvv9i2QKhO1cvmJApCQ0doZgjlKbvra56nJHtkInPGjfglhxmyXm6/JQ2vtYATyOHYyGibSyJladMP+de5J1ecwTbbQNHAFmM0jS+aLeBmVmh1yaSfuvdpA0e6++1vzf5CbKwcMl7EgBRiEQD2KCYyRCGRerIucSI0LbKWCBeVm6jwC/i1JDO7aua3Ce5ZIXnoW/r3CKLl51t1EUD2mNsJyTOONXDF3Sb5Jy0+a6zfXgONIuruoz6IXZJabf7A228pBgK3UIuMKBqhgKIpk0yEdeA2Ody0rNVqCRn/LUeJUcvYf7Pyfh6WoGIYJmia/OCgCtbKNqploaonW4BHeXeskK5F8yCBiWeQ7pI/8vEM8aDtuOk+t5L43SVnp0Md6gEeo+tTuyzGglSvmRs7VtjnH/ktKGiiIL7teaSoX1NT+BXI+ZzYCK50Xb8j0Wz7Nz
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(86362001)(33716001)(2906002)(186003)(83380400001)(6512007)(1076003)(9686003)(6506007)(26005)(6666004)(6486002)(8676002)(4326008)(6916009)(66556008)(66946007)(66476007)(41300700001)(5660300002)(38100700002)(54906003)(316002)(478600001)(44832011)(4744005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?BiRhz0exS8Hb6hX9pLvzDrXifDfi61ovIO8JY+nyHrFCtiOVY/nPFvB5w2m5?=
 =?us-ascii?Q?Ql7AblGTArxqKQtxhtpsvRsOIPeXQJpXhrRUunHpeFKJAhNPHIEAAMunW+qz?=
 =?us-ascii?Q?1gbTyOH47kBY/QUNLdNl3I3xqpg/tUcI3Jve+VZA2qPnBUV+xZMeLzmYp6ak?=
 =?us-ascii?Q?zyEBMzf2oMhJs2W+WNtt/HJcSFuP5re5mmTJ9IhZwlALfw87B++uol0BVhyc?=
 =?us-ascii?Q?TS1I5mpSBCuBTEpmPmkvYZi4C7MILe43tOT11sNwDJmEEng9K2q3G8tm2Gug?=
 =?us-ascii?Q?EjzZl+u9Tvzdl5gFS7/SqnX8nZBUHWGcG9swj3/gJJa3YE7LHxRCZnzfSDpv?=
 =?us-ascii?Q?RC4pwwDpX+w7yyI23ta7MAH0COIuHFFaoUnn78k840uGr4gReSTOxPw8r9gn?=
 =?us-ascii?Q?PCJS8H/pbBGhaIQztTUXDMkqlxmZrBNnyNisQbSO2zicJXQOdvukbVUNTF6a?=
 =?us-ascii?Q?JdfK0JBd0DsLaoH5pbAkbMZ2/0eTyhovReUvJ0uKOi0pVVfmr37HqXhikHp4?=
 =?us-ascii?Q?9TFnOpsX4ONonNdKYdtzp7w7HVbqI1yZBrpHaYcV3CjgN8bA4CXkGFMSBxjw?=
 =?us-ascii?Q?Kjm/W8zXWwm9UAzC685U00qbRD4mDapoujeAuMFctW9YwNnfirRWJSzkyB1a?=
 =?us-ascii?Q?FuMHqCz/y9n6NNR8fYoqiLEuCz44sImUcALz+knBnjjw65hLy/Xv47L9hqU9?=
 =?us-ascii?Q?e9szbQj4Rgzsy+rO9ANHqEoeU0xikRpm75sbsFRJxctyqTw7vGpkkLe/xHnF?=
 =?us-ascii?Q?mHwDQ/9sFnDkFUd4jpwDhWLGs/hkWrfLfOzeAO16ZHQRubjlVmDD1Oy0dawh?=
 =?us-ascii?Q?RXxZ6uP3+0fUNScNQHatzcFHKKMu9ngPFiGLscjRUGQajxLphzsjpqEXZJs1?=
 =?us-ascii?Q?Yl4JTSf54p8FQSEdOHte+FZXZUICqOS61Ah+k+7EsYB4Q9Ukp2tpZX6tBeA0?=
 =?us-ascii?Q?TrjAqUWffPzCWBNxCg0OFUSKYCNAL6ot1Ol3Gj6xBrc5P7SiEuAGjtciRmHn?=
 =?us-ascii?Q?IjRWi978++orG5vGWL/rPujElepw6gOD7XTvabELOEXAjdtsxNDzYZokrpfJ?=
 =?us-ascii?Q?o7G42pzla8wkw9yz32YEMM6mlmSFYwVrwYj18dVcB5rhwc+GoMfE9EtxWdkc?=
 =?us-ascii?Q?rkbUiMtjZS5+/HVysOIsXpYhzGrKN+WWzrG2UQO/GGArzAhvXZdJ2uceYRJO?=
 =?us-ascii?Q?MlDV0WkgiMndBAD2X/nqhskbu4aFNjqDjLVbfAZwEtlePkOutfWtqs10GOwk?=
 =?us-ascii?Q?EUcsEpvHethCDaz39YqczjRjhzLuv0ziTlq4CoeDCAX5RgpCFm27RLDCMJfT?=
 =?us-ascii?Q?dEkFTOtNfM84rcfW1A2t0hWXHR1fEDD5mFIreGTEDnXlWmdyCeBP1hyjtETY?=
 =?us-ascii?Q?mA/qviyg8clIbhRB6DrGuqRdnHkICwOmSb3MLkM3GLd8gDUmKMl1+ywv0iYI?=
 =?us-ascii?Q?fW1ySDCbaeEOoYbm9KWWIBROPX7CoyX+hc31vX2BbQtjT70Rj8fyMnUG3uSQ?=
 =?us-ascii?Q?xAXYfzp3q3VvmVvMw+nh3gght+38Gt5Zysb3KDe/fE4dM+ATAPdUACzGoXUl?=
 =?us-ascii?Q?NOmXZTG2+7ZRQxjh7WdI6XzjiDC4vtFus4u+UT4BibZpa5fSrxVhJgRd707p?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f92b4d-0238-47c8-9541-08db344c1cae
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:02:50.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dnuql5pQVrnlKVy3h6EK43VEsg8iaaxC5/9hwF0ENRCqw/26cyckfe1Ji0mEI07MYTx1s/SS5rlnAcc6Jt5UxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390
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
Cc: Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023 at 11:14:12AM -0400, Sean Anderson wrote:
> smp_call_function_single disables IRQs when executing the callback. To
> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
> This is already done by qman_update_cgr and qman_delete_cgr; fix the
> other lockers.
> 
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")

If you've identified smp_call_function_single() as the problem, then the
true issue seems to lie in commit 96f413f47677 ("soc/fsl/qbman: fix
issue in qman_delete_cgr_safe()") and not in the initial commit, no?

Anyway,

Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
