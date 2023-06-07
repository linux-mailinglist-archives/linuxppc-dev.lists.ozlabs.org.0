Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163272630D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 16:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbqkW5WS6z3dt1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 00:40:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=aAcu1Ezs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=aAcu1Ezs;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbqjd6Wgvz305g
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 00:39:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n51DtxbzSeUmT4QwxgwWSua6EWQa5PYkW3Wn1IVWrSiDIvf3XfWsk8JVrcSab5tcqlZvrKeaOvDOO+w/E3JVKTuqbYcX+ufb8mXDak99c2BIrDz9TygdcteWjW2s0F2jE8iLof3fKxLDXZLCeZ9N/iiPtJHKzqRVvICHqCPqWnGMnDArBVqk2YjsOS1emwjOyK16F/qCLgZfUwjd39U5txlL0qhqgQyRKGBJWCJYQPRU0gK8Cug+n8Al4Vd9Jp5OMQrd3u1sT6cHIOD4869bdX3p+jSvzYVRhIQy8qbm9effHND3MpWxImGmtAJDXR6m+YVuatQTAiRxNo0ST3ZVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO3uWkusm6xuM8zDi3KCO2eC7nCzgOFdbZVlCxA1ZUY=;
 b=d+f2WzkdsutuOvgpmstgTR+OY1ZS5hpsqJW4x2WahcW2xLOougi7fvCSbMu+vNh8nYY3KDSLsWZKWmIXuketA6dNf+hNmkiRhtdOGw1FMozYE16XunueXrfy7dKjzryh/gYLb+UW8N/OPQUiOIuZd4dkoI/mbfp2c5ddfE+O+tTiEx5HWYognKSqxVzhp6REkQLWz9lEZ7wJmffGom7jNQpU32HzgjnRoDN8zv7Tej2KlZSNU3ei4pYbxgIKvRZztWWavinrwjzYzPiF4ApfIiZFkiAc59nzr6pwWDUG6xpviz+JPOyQwf0fJaRJpZLHbNX+AUPL6EFej17iWvdFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO3uWkusm6xuM8zDi3KCO2eC7nCzgOFdbZVlCxA1ZUY=;
 b=aAcu1Ezsr7Q3P16SAY/6ZhUI+A9Fl6OuaS17jdhDMJ42N25O0xC0HE1OiYUEBJFjnhQLJ0FV0/kgt+Uc/5WdlSoR9H63/O76YKapnhCm+QGOq38cXEk542ZNPZvSJrvtI83qy2s+Zr40itTWvh8IKcdoEzyYcJPbaM53Z/SHB2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from BY3PR13MB4834.namprd13.prod.outlook.com (2603:10b6:a03:36b::10)
 by PH0PR13MB5330.namprd13.prod.outlook.com (2603:10b6:510:f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 14:38:59 +0000
Received: from BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::9e79:5a11:b59:4e2e]) by BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::9e79:5a11:b59:4e2e%7]) with mapi id 15.20.6455.037; Wed, 7 Jun 2023
 14:38:59 +0000
Date: Wed, 7 Jun 2023 16:38:52 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH net-next v2 5/8] net: fs_enet: Convert to platform remove
 callback returning void
Message-ID: <ZICWfMaqqWFEfhH8@corigine.com>
References: <20230606162829.166226-1-u.kleine-koenig@pengutronix.de>
 <20230606162829.166226-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606162829.166226-6-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR02CA0132.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::29) To BY3PR13MB4834.namprd13.prod.outlook.com
 (2603:10b6:a03:36b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY3PR13MB4834:EE_|PH0PR13MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: de55b660-ae49-451a-63e2-08db6764ee06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8/c7GNh4wf4BqnoJO/2vF4uwde816cklUSDiuN1Wuo3mk1vPkaQcLVMsWOQ0UjfdWXdm+1bPhXtF/Ch/Nme7J2OQsO5IQLTvRlW762oQPcEzntVF7TYUsebzKBq0IjMP9DDD+hi3COI6MetvuOCfPQO0gPB9Jy2aGNpaTDjLgoE3iGjT0VMtMKeO81MbtYMZ1L0XKPXEohhGBDbSRJwmKVKtJxEegVqI2EKUQIAme/tiiBSf9HvGO+ru3sUul/5e+6dbQVExLD/Nb9Rq3awXhan5BMkNZP2S9RTWIHLfc554jS3P5tqHyeGa/JOpH9fajJ6fg/ImCSaryF/lvotbLcqVAKJcL7PCKxJs6Qopa6f1L+KuXile1i4w500CnG2GjjJT+94kP0N72O5T+wGOaldevRUxKoydnUbo+ad92Jy3/vhvQOMPDU48Np3/3if5R2PsREOcOXK+pw261V2uLo+lyrzbXR0DQoVEWVYhn1NtkZOublLgiPgVU68OAVOg9LbF88jEayvM5xVSpHrSZ0AJKZZvbvw+4OUGL666ILyhFkxYKfOyqkMFl82HhHiAk8ylNyZAV36Kj6EOoAbq+jVmV5xOT7zZ2VAYivcERVw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR13MB4834.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39840400004)(346002)(396003)(451199021)(38100700002)(6512007)(6506007)(36756003)(86362001)(2616005)(186003)(54906003)(5660300002)(7416002)(44832011)(2906002)(4744005)(316002)(478600001)(41300700001)(8936002)(66946007)(6916009)(66476007)(66556008)(8676002)(4326008)(6666004)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SXBLN3Vva3NFamJYZllCVk0xakczSG1kTGlyV2JaZG9qRnhCL2JQMlRURUlN?=
 =?utf-8?B?TmRoVkg1S2VmZ3F1NWpicVc4R2trbnBEdXlIMWFNb0xPWVVNSm1tVHZMT2VO?=
 =?utf-8?B?SFlnRFNOdDZJNEZCSUVlZnFuNWhEWU9MZGl0bXlMZTFlQXFkbGVXYTNaSjVw?=
 =?utf-8?B?ZEhwekc1ZGVqM2c1MmNCWTZldHE4cHpaSFBxVEZ1VnRkdTdmak41UzMwOVpQ?=
 =?utf-8?B?L1p3ZW5icWRKZEpuRGlWektlSTA0TnNlV1FZNkFGNnNXWmZhNGcxTjhlV1Js?=
 =?utf-8?B?MWF4MkFTeHpTNXR3T3R3L1VodzA2U0wwZlIyNEtLM1lNUnYwUDZ6dzN3bllT?=
 =?utf-8?B?bE4wWis3RWlPTXNmeno1WklnSXlBWXVGY3NSV2IvNXZZZ1JCNFp4RUtlSlM3?=
 =?utf-8?B?ZlVsWGZYMi9HKzhFUWlUeU9mSWJxMnJiRkhSUHJJK3BLVytUZjRUQ0tsR3F5?=
 =?utf-8?B?b2RzOTlCUTNHOGcybGdqNloxZlhlVXNaNVJyaXFyd2RPcmhGSDF1N0pOblZP?=
 =?utf-8?B?TGpkM3JUN1Z4cTNsUUorSDd1Vk1wVTJPYUduSVdBelNucE92VW1sYUQxd2lk?=
 =?utf-8?B?SE1VRzErVGZJOVBVQm52cVNhV0lKWjhERzhWenRzM3c3dms5UVYzSVEva1d0?=
 =?utf-8?B?Y1R3MTcyOUZCaUpEQjBxSTVkMHNQSGUrWlhJdnR6NDFTdDYvRGJwdS9tWnVn?=
 =?utf-8?B?L0NXTU5jL1ZwTXpoT0RrQkhGM3ZLQ2xUaUgwUW1nVGQvaVVzVEpBVS9qQ0dS?=
 =?utf-8?B?YlRSbXhuSXo5cDF4WWM2WnIxR2orbHRYbldZcmU5VFIvbk5oQ1dsSjZGaW9v?=
 =?utf-8?B?M0w1bEY5RnRsaVFvcXpzczBrdnMvYjdiYkZEVExORG1remZaTENWTXRvSlE3?=
 =?utf-8?B?SEJLckpzNk1lRmV4byt1ZHlHRk1EVHFBQ3o1YVhPVk5Ed1g1UXYxV2ttcGNt?=
 =?utf-8?B?OUxFQ2RYUlFFTXNyS2VGY0NOZXJvbzlib01qNmVQTDRGajFLczN3ZE11Rkkx?=
 =?utf-8?B?K3BUYVhPdG5weTA0dzllZllPQ1VZbGkxOWRsYnRnNW9PeTNWLzQ0WFBFTWpy?=
 =?utf-8?B?enB1ajFKK1YrQklLWVRicW8xTVNpLzF6VWdFcmxLZW1XM1NTZjVQa0N6ZUtH?=
 =?utf-8?B?NnVGVGsrZVcxT1kva29xRmZpV1lqNFZ2bmdMOVlDSlJwRkpFbjJkSGpGYnUr?=
 =?utf-8?B?cDJrc2FXR3pFSFAySnArYnR3M1diZGNrano4VGZCcmhpK1ZnZ0FFUUJRdkZK?=
 =?utf-8?B?dlRwdDJQblBQN0xSamJ6QmVVd1prMDIxdHVOc3pUVjlYK1g4RVIrbGxuS1RE?=
 =?utf-8?B?cnlqRC85M1lCRHpjWGh1Z2t0dW9vNEk2SWJoWXk2MmVIaHJ1SGRXajJNY3ZP?=
 =?utf-8?B?cWY3OTNBR1hNNWRmM2xwMEFvYUFiQVFMcnBRZmIzRGw2by95bEY5VW9ZS1Va?=
 =?utf-8?B?dWp6bUlydHI4Um5TbW1sNkZKQnhudzVoT0FhVjM2dmYxUkJvSjJOTnpDRm1y?=
 =?utf-8?B?VC80dzhHa0pvM0M4bkZkREJ5TmtTNld2RDRhUWhIaU4wSnIwOTNuTFl5Lzhv?=
 =?utf-8?B?YUNPSjF6T29tOWZoZ3N6Tnk5VnkvcHBNWVhmVlRRa2ZSNzdaUmU4Y3Qvdklm?=
 =?utf-8?B?aDc0amd5WHNwRGxRTjhqZmZtQnNveDBjaFFOU3BYVkhPL0E1MVFOZ3ZjNEts?=
 =?utf-8?B?TTJtdWVNZ2Q4eU5zcDBQa2JYZDA0SmFVeG9ibzZObTJwMjBhNzIvSGFKcGxo?=
 =?utf-8?B?RGFya1p1a2lZcmpMWVBYSzhOSi9TUWtzQkNGcVJwTHI2WlB3bGUzQ1lqU2VT?=
 =?utf-8?B?UGhrS0ZFK3p3MFUzSVBiUk9Cem9TeDdFY3B1NmR3VUYrMk45dXRid0JxUjlk?=
 =?utf-8?B?Q3lwWDdtZjEvMHNOL0RRWUx4cG5Sb1FBQzN6QXk0Tnp5TkRwVjkrUWFERU1J?=
 =?utf-8?B?cHZORG5TRlhCdDFycU5FUGNtbkQ4MkRCVXJzT3Y3NVR2MTRkU1hkR1FUYW0y?=
 =?utf-8?B?cjdwNjErSWVIREFGdWVoV2FBTVhFYU5TK1pTY1BVb2lHdWU3VTZIWjgvczZR?=
 =?utf-8?B?cXlFUjd1YncvaExBNEVlUkNhMEpzMkxxUXZCd2NSTGRCV2x4dklqZkFsN1M5?=
 =?utf-8?B?Q3NkL0phbFc3ODNFNjJtVXBKeEY0Rm02S2hTYmV3RXlZdGtraG9SUjl5MEh4?=
 =?utf-8?B?VUxnUjU1YnN4WlJ6eXlwd3N2eUl3V3lhVXI5NXdkOWFzdVNtakVoQ1R6ZWVz?=
 =?utf-8?B?QlkwcWV6QUphZFFCZnVEMGZlUnJBPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de55b660-ae49-451a-63e2-08db6764ee06
X-MS-Exchange-CrossTenant-AuthSource: BY3PR13MB4834.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 14:38:59.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwFooYwldQThoTfoHkbZF/1lBqZd8+oVpDbO10BoF3xt4zed1DNr0F/U83BV86OHfsDdEky8sdWeFRxaX8f8rUXwbcf/osaoZ6Q7I5vp6cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5330
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
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Michal Kubiak <michal.kubiak@intel.com>, kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 06, 2023 at 06:28:26PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Simon Horman <simon.horman@corigine.com>

