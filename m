Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F15E66FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 17:24:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYJwW5wgZz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 01:24:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PIMiKYvw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.73; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PIMiKYvw;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130073.outbound.protection.outlook.com [40.107.13.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYJvh6wx8z3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 01:23:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQWRN8mTmXLXWmFRngUHYUJpbQPzD61kqRHOvp5dgZbEimeVGa8/DQfUEZCfJbKvJNTy/PQUEWy925Mh0K45tSry3xQAQdvKVhXnxwGJWaMg7YrO5uySpibUxKWSkEzaTA0exB5pgYpNDKowcFdBM0zGSt6ciWb8MM7lp808Hi1dqCohXxthJ5RPH7bIwQ9L5l0Oehohsn/wVCqaKStBGI+66S5UkIgiaI3bkLZ0woGBxh1QKOqo8gh7ICYneFbrYBTr4m+QiIfePMdaceN+qEOyBbGx/39yC/aipJ3KG8qmzCP5hl+9nAnDEZlrqJd9Eed/LL66iVnWpUkJN81PUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBXqWRbAjUVZbPvxARLYoXRq14TqPfhSKiUUrThATz0=;
 b=GUyxIhBHfECmY6rb8BMGgQth8KFjjGLzFSoPbf+PDgF+cKmRP6g0sQja4lsT0gl44TEx10Kes4xv/xIMtFoMmiJmGRp3ipaIs1Jq3YFvHteKZZb1efX0y8bPWYc3vq1kvyGIJfBUZpbGmA6xbtIFppU9SHwAdrvgp67gatlJW8dW3UmzSj0GDvZ22JXi5TLReWQ2qC4q1+CSBpQ9xOF3/ViKvcvax4B2uANpD4Ax2+HqOrzTmHHfLqQ9QcESqggx8T8RRzisdhDxkcRyx4FNB4xdXtieRENDIKJBFP84416Jj0vmdIHvHxsfAHWgrMdsg4iLLQWTwN5tI1yspwzloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBXqWRbAjUVZbPvxARLYoXRq14TqPfhSKiUUrThATz0=;
 b=PIMiKYvwHWQWMbn87flhMIMKJTNFBHy9Xy4YaOlQQvbGq12f0rexfQYoDj8ZLcAxQEeIVOLkf6XmEd4LRrcotPjspdfMYlW2owPr0iaQvyyEiwpniYFnTPj9YfG7vlfn1p56mlA7ER6oBC7nzhuWl2wp3W47fpvzavFnT7qSWe+gyiJRzaqVwMcp3OfGpDPOw5tjwrQuXVlT5b2iRt1TKuzJivQHvDhBw/JCd1NSUUkeMO75HYxbs8sSeDC7DEEnvEMVN3iAgFlBJARoqyg5WYAfWQRV09WtUK3uDFnPtV7YnelX5yOZthTV7FEqeM0GsvF8BLhplb1GJ/PvLQMntg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB9675.eurprd03.prod.outlook.com (2603:10a6:20b:5ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 15:23:05 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Thu, 22 Sep 2022
 15:23:05 +0000
Subject: Re: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-3-sean.anderson@seco.com>
 <20220921065718.lafutkkgiium5ycu@krzk-bin>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <4e125df2-b815-c0cd-336c-97b20c2702c8@seco.com>
Date: Thu, 22 Sep 2022 11:23:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220921065718.lafutkkgiium5ycu@krzk-bin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:32b::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: e42b4576-2795-4c68-50f2-08da9cae58ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qnFRiPzGQqechNmeVGl9D/OsmvRbrDIOJSoJZu/TXW8rd0CPQhg8Hyn38/WzigcvvDFvEqtdrS4vPojzKLfac9nX9lGU2bKwdFR7PPlXOpMwioBxCw2SBlO6gC+lSqCYTgkVI+tgy5TxBM/KzVCV4OkwuLrxybi5eeF+t82bE7F3CPNkNqVM4YftEbLVBnhZbOEWWQknoKkJT4+m0TbVKQoLEVRXpmDeAkB4dDkGxQKLlCa2oiSg23nnIz8FKfmxqE50InLLdmSvvTvj/AOvThRlAF2vzJjIqs9qcKUfoVtjU64kopcGBS8bbRqmeaIyjeFV7HUBwZ2RvcceIKc1Ld7Ob5Q2ALvzwV/ENmGg9Fz+7IMMtGTQ0sm6fcZBnIWclUkMklFVtjNB27+h0vZvpQf7MjKhG4jXhefFOAfcL1sNIovMxbmko1HGNmq09aGZW/cdopf53BT+FwVuWuoBlOlBnuaH9gnB9X59U1O1OtBgJ/ZFLsVLtZU7vb4t0XDZIcq92DjOfB6OnJGfPaUNujm0dsePoJJHrtnP+R1jvXJQ7s17o25QJZ1aibxHHpQ3thZq/ZuxqMXIA/Is33hLisE7FjMyysfVPwRHp3JY+ygJTJVQ8CSAvV/ljoRrAwgfo2DoVl82pXlJBPvIVKt3Ne5aKGBs37kW1EylVglIFak9buc2GJnSWx0HUK1FUBqc/iVmXd3Ii2O7JWHLrShO8ZxAKx3tzRSF/1MmRH2GAI0HJU+w544V5vqMEchTjHYgKof8JFxNg9y8k7fR58Z0dp/cBbctUPVx2xQYaGx/eC77dwqNoa5aGercHE9FVpXMQUjgCl5A2FxoAXu82y3t7Az8jcUbBJfjuRqvvmZNe5M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39850400004)(366004)(376002)(136003)(451199015)(38100700002)(478600001)(7416002)(44832011)(6916009)(41300700001)(966005)(31696002)(36756003)(6486002)(38350700002)(5660300002)(2906002)(86362001)(66556008)(8936002)(66476007)(54906003)(316002)(26005)(6506007)(52116002)(6666004)(53546011)(6512007)(4326008)(83380400001)(66946007)(8676002)(186003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dnJqcEhWNEhsSlIxSDZZSE96WHBaU3NoNWd3SEFkOFk2bzRZTUNxOUdic2py?=
 =?utf-8?B?dWNnU2ZvNVNXQzlyc2RkdXdRalpmczljZngrb3ZuYWZ1NWNzdUR5TnQwZ0pw?=
 =?utf-8?B?c0x2bDhRRnZhb2RUQnN4UHFaWHRZaFFseDFwRHpOcGprWmQ0MXN5RHh1Q0V6?=
 =?utf-8?B?MCtkNXJXWlZ4cEJrNHUyZGNOQWE0RGNzdU9WM3ZUNjlGNHl2SFdDSHlPNnI5?=
 =?utf-8?B?aEtuRkQrWCtERWVsSlVkL3NDaWszMjZudlJ0VzBJUXNjUVNLMlRPYlpwRjJW?=
 =?utf-8?B?TXFGSnJzVE9DTEZqN2ZlZm52S1h6TTRhUWR0MHN6SnZwbjloTnRwaSswTU9H?=
 =?utf-8?B?QmtEdG1GTHVjNEVueG5WNjRDakREUS9HZXh0REdud1JHR2s2VW44bW9iTjh4?=
 =?utf-8?B?QWp6cVlBN1VNdGxFbFJzZ2tsZFYrWWdId2tNNFFZS0p4N1JXR05YYktjN3dm?=
 =?utf-8?B?bFB4dlRRRU0zNnJLZUs4ZjFNTkV0ZjdoVlZ6SEVuL2tCV3NKeU0xckhVNGxZ?=
 =?utf-8?B?V3RiTnB2ZTMvOFRVaDVhd2JwanpIZVVlampMMzRXRXNWUkNrN0xvb3E1TG9O?=
 =?utf-8?B?TU4zRmtVVVlOa3FWQ054T1JMbTJPRzZPR0F1NUdLS1VBVDROVDhremUyT3pB?=
 =?utf-8?B?RDl3NXFLR0hCazloWFFpQUhkc3BWZ2xQZ2ZMNlpaTWlpSnQyTnVqUzZvRjAy?=
 =?utf-8?B?S3NKVGMzVnZxVnk2MFBZMjA0Rm5HU0hJWGNENlQ0Q2NiZkdPY21BZEZidm9I?=
 =?utf-8?B?MXVBODRFZ1FHYiswY2k2LzdNbVVVUkRIa1dxKzluTDNDdXZ4d1AzL282cUI1?=
 =?utf-8?B?STNyaVZyZWxQL2wwTHJWdGYwYmZKRUxPQjlMWmRwbzhic2M1U0RlRjJnK0NG?=
 =?utf-8?B?NHJWblFMdEwrYS9EYWl1cm02RzBHT0dYOTA0L2U1QWxTYXA0YVZHN2J0Ui90?=
 =?utf-8?B?ZThBTTRBWDBzaTJKZG96a2ZHdUVDUjBwVnBNYTNOa2NxQ2dGOXYvMTNDWlpr?=
 =?utf-8?B?M0FFK1BuTU9DUzJ0TEc2dHdvbDR5RnFqS3RsR29BVEhRemZkbnZoZlh2bDZW?=
 =?utf-8?B?TGhBUVpJWGhQeVUramR1bk9VNVJWWE5GV3lraWt5MkNuZnRtbDhQUnVPM2FF?=
 =?utf-8?B?Z2pidkV3WXYrdlZ2UVBIT0Q1RW5vM2xDUlFqaXdvYnZRNUdMOVVuVS9SOVZk?=
 =?utf-8?B?eGU5Smh4WHVOSkE0T01QUHJqcVBaQ254ZkFQYlNVMVdBa2JraDU0S3U1R0s4?=
 =?utf-8?B?KzE4NHFDRmdOaUNtVUZEdkFpSU8rNldhajRJN2t6aXBTb29NWnFFUThoRjdw?=
 =?utf-8?B?VWdLL2pWTlBiczVPYmhQS3h6Wjh0WWs4cTdwWGFWbE9aOEcvU0dNbFNnZHdv?=
 =?utf-8?B?RHJpaHJVdEtieEllQWJMY2szOW5heHI5Nkc1UE9pSFloRDdXK1M4eDB4ekR3?=
 =?utf-8?B?TWwzWkpuTmRXOUNIMmZKRHZOdkRnQnZ0MXV3OFV0M3l4OVA0UndlVW9welc0?=
 =?utf-8?B?UzJJQ0FIbzBnTlc1N0d5NkR4ODdrUEZsMGI1SC92TXNtdmREYml3TmlQcjJH?=
 =?utf-8?B?ViszRWtSQnc2SVdRZXprSnRFNW9DandjcVhLWTR3RDZBU2lpZGRVL2F3V05k?=
 =?utf-8?B?Sm9ZMnM4OGFIczJwMGtka1V1aDVxQnhXNzFIbXZHNVpnR0V3WnVITkpZdndi?=
 =?utf-8?B?WXpzQkNUL2xKczJrTlM5Qis2emJnWHh1bldCaExRVmZPanVxTmhmOXUwU0x3?=
 =?utf-8?B?Z083Yll6UFl0b2xHT2RmYkhORGF5b05WZytVUWRnRElyakM5dlB0UlpIYUlz?=
 =?utf-8?B?ZEU3a1BOb3liMWdpOGVIQllGcjY4djZtaUJFaEcxc3JwcVJrMloxOXFmZU90?=
 =?utf-8?B?NlNMWVFWU3cyeUY2Z2xweDN4c2hZcUM3SnMvU1ZmRmN3c2l4VSszOUh4OFhV?=
 =?utf-8?B?azhUc1BBYzZZVE5oNjIwR0NCUHN3TDVjRWtxREpCWm5RSm5VaHpBRnJncVoz?=
 =?utf-8?B?WURHN2RwTzlsQzVJOXFlVCtrWGVVWDhxY3UvNit5ano3OS9IN1FJTEVZY2Yx?=
 =?utf-8?B?NXY0ZFp5anh2MWFsbCtzTkFsNkdqdzd0WnZQSzlESW1tQlRsdTJERUNmZk1U?=
 =?utf-8?B?VkRMeFFHOEw1NDFMVXpEY0h3dCtEelIvK3NqeG8yVUtHREFKbXN3VnFvbjZN?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42b4576-2795-4c68-50f2-08da9cae58ba
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 15:23:05.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh2jUsMLbSE2AkAJQTc9vpfFKniJTsQIlbhpWgf3CVKKAqlOBwoseXiNNHy+NDv6XAdA04g2RUajq8mYLF+WPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9675
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/21/22 2:57 AM, Krzysztof Kozlowski wrote:
> On Tue, 20 Sep 2022 16:23:50 -0400, Sean Anderson wrote:
>> This adds a binding for the SerDes module found on QorIQ processors.
>> Each phy is a subnode of the top-level device, possibly supporting
>> multiple lanes and protocols. This "thick" #phy-cells is used due to
>> allow for better organization of parameters. Note that the particular
>> parameters necessary to select a protocol-controller/lane combination
>> vary across different SoCs, and even within different SerDes on the same
>> SoC.
>> 
>> The driver is designed to be able to completely reconfigure lanes at
>> runtime. Generally, the phy consumer can select the appropriate
>> protocol using set_mode.
>> 
>> There are two PLLs, each of which can be used as the master clock for
>> each lane. Each PLL has its own reference. For the moment they are
>> required, because it simplifies the driver implementation. Absent
>> reference clocks can be modeled by a fixed-clock with a rate of 0.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> 
>> Changes in v6:
>> - fsl,type -> phy-type
>> 
>> Changes in v4:
>> - Use subnodes to describe lane configuration, instead of describing
>>   PCCRs. This is the same style used by phy-cadence-sierra et al.
>> 
>> Changes in v3:
>> - Manually expand yaml references
>> - Add mode configuration to device tree
>> 
>> Changes in v2:
>> - Rename to fsl,lynx-10g.yaml
>> - Refer to the device in the documentation, rather than the binding
>> - Move compatible first
>> - Document phy cells in the description
>> - Allow a value of 1 for phy-cells. This allows for compatibility with
>>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>>   binding.
>> - Remove minItems
>> - Use list for clock-names
>> - Fix example binding having too many cells in regs
>> - Add #clock-cells. This will allow using assigned-clocks* to configure
>>   the PLLs.
>> - Document the structure of the compatible strings
>> 
>>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>>  1 file changed, 236 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts:51.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1420: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

I believe this is due to the previous patch not being applied, same as last time.

--Sean
