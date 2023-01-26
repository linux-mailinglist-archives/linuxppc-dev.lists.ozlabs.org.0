Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE767D21C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2msX0rHSz3fFy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:50:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dkjEEnVd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.74; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dkjEEnVd;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2mrb2RFNz3c45
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:49:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt40xWwyiqNSWRZ9MFVZJ5l6Pnb0AdurxN41WB126opsB4aXVXC9KzCpGbyU3lg5PxIjmPapKG1osMTJUVRMyIhsm0+RrlcJiZV2yinFrTypLilIgC/JuR3aajwMD4chGnmDxKChqjvYk6KW4A2T6GgNKKsWF9PNCTjxVU129fsJQ/0W2+lWUXHmTwdOrP3wfs4VP3EBzPb62y0zxBiIxiISVL5gPZTtWWH+JaIDglr21EogVP5pKPbk+eXyLzJrdAGUNNw56n4Z+o8PQyfn6s69Xu2CB45Bs29RmfkiqhcQMSkukcHh9V7d9sDLpfpAnMkCBlGPkEXP+KFHfsxxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k20iJLtccWq2D+9FwD5qz1guSfwvLonaE9tDEzdigPs=;
 b=FGgiVfyAWC9Jd7SQVoYL3zu/x0HxTjbgW3X8RVBdSc+sX2KRpordT7n0eoj6w3lpLtkJW0+OSSfBDOoiqzW9ImzYoaxPQvpVNM6Lgx9PvgRaEd18JilX3uLy2knenY4HK49BF0vMZBxeKkzwbEI8vdgv+E9DOlA11OcGx/siD2MgM73oJxyTtLcwlRa1/tyDwhXVhA4SaQv4ULbM9j3smws8TWESSXt1YpG2QJHeHFZZRigdzLhI+PrxPl6yd51UwoDMyyxvRCfBK948QcxzRFveb7JWqIZyHkID1okUrI/qaIJo0s80+uYs3yUcH5MAxUb/qoyHQ0FAGYMSbUIYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k20iJLtccWq2D+9FwD5qz1guSfwvLonaE9tDEzdigPs=;
 b=dkjEEnVdb/eY92tRJpGxxNqZ1X11xZyn6cSgf+QO/McAViLpW65K1RF1QU33xVR3oTZ0mg8afdXH9Ae5zbp0iEdXV6O7mTc8ZKCZHuxQUDJNIy6iIVRaamKjs6svcMEX3YU/PTgGAQKwftN40+M2PwmxmOikZZ4ES1NB4PhYdzM94NSnxyxd1PwRoRubMketiZ6KDtEULYF//7mYDHXyEU5Ex4cWLKPex1zli496+X02VR7tQYWXx+hzY0tu5/vFj6vWLgTxuu3nAKOIB5TP161ajq8CSUnwhXWb0eN10No9SMj0YpD8zm8J2eNiR1FwPg/QC9p4QFT8d8GHalTfZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DU0PR03MB8244.eurprd03.prod.outlook.com (2603:10a6:10:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 16:48:58 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:48:58 +0000
Message-ID: <8074f0be-8a70-a937-49f2-123e0bfc6218@seco.com>
Date: Thu, 26 Jan 2023 11:48:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-8-sean.anderson@seco.com>
 <20230125234335.GC20713@T480>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230125234335.GC20713@T480>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::7) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DU0PR03MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 373ed4c3-4f98-4fe0-b784-08daffbd3869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uyo9RSaV1bKimg3iazR//u5L1x9akkYIJSZM9jrbLPGaDk0ruEc7oauo+PTfPSHb1xww/S3Ymy95gGk10sEaagfgw7HmbTnEh/FWWgoxTY5NsE4P8h9Fxk2zuCmAquZsZwnrWbMSaOmZ/a6/LLPco3dnwiJ7mmLpFxk4BFljQOuislbD+24k8brmeZkEcvLLViCZ/vG1qiW9akbjqhJyr27m+f4F5zkOrfPsj+YQFm6DHKjo0IG4F/MssqpcBV4RwKKMa7WT1zH678VO9scRmEblnmk7z9FsxPdFr+RMoBgLri5twnwddeqpG8fuOnS3H7vaMyWax0iuW1wmdwgc4gSX2CKt0x3Z8UHP9+MEBZRLH0sfsJxrFysmxu9iZrvgLo+iezT15L/JNyYlffrJzOKrNGdFhvng4ffZycxWkmmnhriy0hZNGn5tClgM1s+MV7QS4F9HA/sXsWATutD0fMZexgqSJrhTqi+/8bjLjERDIgC1Pyn1Tfq9GRuvBEmKid9y7KGnKQxhn0dL47/OYLnwgGFqZqNcMaJYki1JnJiO3W7dAlfhIommrBBqZGYMJxZXv8335k38hRoja25iSSXAoc/w3YfRG5D/rJqCvmcz30kHKe5M4iEuLr5GYu6IEedyLMO/gZLRygFqD9IVWr6OVkgZmXYHZLrI2FhFIwe84ysy4hzEpWr7BSsOBFpRrDrGjuWs8yUyyMA1x8H/YFeL/+U+sNm9jeYCDrM8ln17E48u7fYHBDcfHEc8FFUTX6sYogbRuF0fkd1IdOr1ULRvODC0YZb9Sv5Y4LRuLRilL2cJCNvwVX3MQPH94WfV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(39850400004)(136003)(346002)(451199018)(66476007)(54906003)(66946007)(2616005)(316002)(6916009)(66556008)(8676002)(36756003)(4326008)(7416002)(26005)(478600001)(6666004)(41300700001)(83380400001)(6512007)(6506007)(2906002)(966005)(52116002)(6486002)(44832011)(31686004)(186003)(53546011)(31696002)(86362001)(38350700002)(8936002)(38100700002)(5660300002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NjlEbkZKMnJKSW5NU0VVclZIRHlZemt5bjRuM0NFa1Nlc0MzVnRvZFZ5QVIr?=
 =?utf-8?B?RUlWQ3NvaWpCbEdBdDlFOGFJVnMwSi9XWGk0ajNDeUNHZ0N5dVdTWE1mZmVp?=
 =?utf-8?B?UVlJTUdRelh5WnhJcDVoTnhsSHlTYjRzbmFzak9aQkxOTEZMWCs5KzJWeXFE?=
 =?utf-8?B?eENOSTRJR3N3OHBIM0VOSVBCQXptcUJUMVRUSTRwTjBRUHE0MUVHSThCaUFW?=
 =?utf-8?B?cWU0YUdIdzdnamVHc2RXUUVMeDY4RUlZUG12bHFGd3NtdnNHdjhxMGxQazZS?=
 =?utf-8?B?WFVvdi9zQ1drQjJnMUpJT21VNGh4M1ZnYUFtTlJNUjlId3F1YVdHcFk2M2Js?=
 =?utf-8?B?S2RUWks3RTZUeVFZdlhBSW90anhmQ3RPeU8xWktrdDdpc3NXOWJDb1A0Z09O?=
 =?utf-8?B?N1RhWk4vUXV6ck9nUWlMeCt3bkJZa3V3dmdIT3JCWW5BZWlPTFFMcTU0YW1t?=
 =?utf-8?B?Um0raEFaQklTY2E1NCtsRm9OL1krY0RPaG45ZWVQTGRqNElTWDh5VGEzQWd2?=
 =?utf-8?B?NzZ6Z0o3UVp1bmNZbFRCNnBZc2MrTVlsZVRLUEpCSXlrU1ptRWZ5ajBlOTFm?=
 =?utf-8?B?TXlHYjNHb0NjWk1MMk5WUmdPazM0RWNIVFEwZStJUEkydFNBZmVSYjdEcXdC?=
 =?utf-8?B?bGlwTGdKR25zYWdHajk4Ti96dDZDRU14K0NBYzVFV0phc3FMSjNIVzBJd3pL?=
 =?utf-8?B?dkMwNHppQXdsMGJiQ3pKTGw0MnhmdEIyNjlTOERvamVYYnpXSDlFeVltckh1?=
 =?utf-8?B?dXBRK2JmWFBYTXhFZnZ6MmNoSmJYSHpGNENuZy9RNHExN0xqNW02YkNWSVJo?=
 =?utf-8?B?UlkvYkpUL2thcVkxd2hyR1BOU1Z5b253R29CQ3VRT1RpVGlVR0dMTDJ1ZU1C?=
 =?utf-8?B?cE1OLzRMbU5KRGlvU2NXa1QydWJaNE5FK0NBZmk4a0VvdE5kZW02ZENxeXRJ?=
 =?utf-8?B?U2U4bjF6Ymk5STBWcllRcGU4bDVqZHZkRkpjK3hWMnVnQjJMMzV4M3NCWlBI?=
 =?utf-8?B?L2VUV0dmUFUwT3lJcGFENXRSeWhoUGlRdTBrUXk1Z24wbnJpL20rZWRQemdE?=
 =?utf-8?B?QzZTNE03elBPRXR0RzhiVkgyUmo2N0kvUXdjbkNMVWVOait2YkZNcUFVZXY3?=
 =?utf-8?B?cW5MUmp0anY3WHovdTVPMTVtangrSnlSSmJPV3doV0llQXk1S1NoVXhaRkRO?=
 =?utf-8?B?dldqZlZ5MDBuempUS0FQL0sveUdMYVNnbDRTOCtvOSs1bm8rTFVhTVJzZHRy?=
 =?utf-8?B?U0dqdXpwTE5heThqSDNmaXorRUV6dys4cVlKUnJXbkNOb3VRei90OWVrSE1y?=
 =?utf-8?B?NmpPbzBnb0ZvWVV2SWZFK2wvTkZUWEptMUF0SnVDdGVHMGZZU2tFcjU3aTJQ?=
 =?utf-8?B?S25aLzVIaVR5ZXZCa0dHdjY2b052UTU4alFZMThpSDRMWWRXZzU2MGFVNDUx?=
 =?utf-8?B?OWRITEpMMiszNFM4bWtJMXhsdnRxa0xPYmxQVmlPY2dCMjNxczE4dnJ5TEpo?=
 =?utf-8?B?VEVmazY4R3dtYkY1TkdNVWhXN3VST2NuRzc5Y0xxcHpvbWczQWY5SnJZa0dC?=
 =?utf-8?B?M01wdjNXQUpHZkkxVVh3UEsrVkJsL1VXMTNZUUhoTjI3L1RLRTJHR2grRUp0?=
 =?utf-8?B?T3dZVXRzQVYyV0JmRXdVUmJQL1Vsdzg1MzYrbHc0WjBKaElwQmE5blREOW41?=
 =?utf-8?B?aFhIaEwrMWF3Z2pFQWdyRDVpK2E2MEtjdDJDdWFyRU05cTliM1BxaFpPbncr?=
 =?utf-8?B?UDBVQXg4N3JJN1dFTHh6dnBtMWk0M2dOdnBXcEZsd3hnSU5tNUs0aVI4aFJP?=
 =?utf-8?B?U3ZPRDByZGVDdjV0NUZlcEdBTlpNa2N4SDd3SHVzZVVUQ0FsVVJxdDNCZHBx?=
 =?utf-8?B?Q0hMSkp5TVdhTGNQK2U1MXc2SmhYd0g0d0JUbTRBWEtyZ0ZqZEx1c2o4OUwv?=
 =?utf-8?B?VEFIeWlpdGRlMWJWNnlRQXBieXFJVGJwT3RrUUplSUpwSHhPOUl4VmJmMVRT?=
 =?utf-8?B?TTBTUjNmVGJTV3NpZGwrY2htSUNZQVVpZlZQTG5IcTFzNDRHbUNhcEhKeDFy?=
 =?utf-8?B?OERnNVVML3FCSmlySnA4dXpNdzVJU01Sck9jUjhuTGQxbktPd3M3TE95R3ZF?=
 =?utf-8?B?M0xTcE8vaFVmZjh2THhRWTJVR1dPdUQ5aXNQc0ZGRTVzcEpVTlpTS3UrQXor?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373ed4c3-4f98-4fe0-b784-08daffbd3869
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:48:58.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHTT/6LJdAbnQoSQYzYE5XcdGmELWSwuuVF3CwKAK1cL56neZwvAR1VNJnKBc5ghaNZW2WZeXAICyLkCJslK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8244
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/25/23 18:43, Shawn Guo wrote:
> On Thu, Dec 29, 2022 at 07:01:36PM -0500, Sean Anderson wrote:
>> This adds appropriate bindings for the macs which use the SerDes. The
>> 156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
>> actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
>> no driver for this device (and as far as I know all you can do with the
>> 100MHz clocks is gate them), so I have chosen to model it as a single
>> fixed clock.
>> 
>> Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
>> This means that Lane A (what the driver thinks is lane 0) uses pins
>> SD1_TX3_P/N.
>> 
>> Because this will break ethernet if the serdes is not enabled, enable
>> the serdes driver by default on Layerscape.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> This depends on [1].
>> 
>> [1] https://lore.kernel.org/netdev/20220804194705.459670-4-sean.anderson@seco.com/
>> 
>> Changes in v9:
>> - Fix name of phy mode node
>> - phy-type -> fsl,phy
>> 
>> Changes in v8:
>> - Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
>>   This should help remind readers that the numbering corresponds to the
>>   physical layout of the registers, and not the lane (pin) number.
>> 
>> Changes in v6:
>> - XGI.9 -> XFI.9
>> 
>> Changes in v4:
>> - Convert to new bindings
>> 
>>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>>  drivers/phy/freescale/Kconfig                 |   1 +
> 
> The phy driver Kconfig change shouldn't be part of this patch.

I put it here for bisectability, since this is the point where we need
to enable it. But I can do this in a separate patch if you want.

>>  2 files changed, 113 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
>> index 7025aad8ae89..534f19855b47 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
>> @@ -10,6 +10,8 @@
>>  
>>  /dts-v1/;
>>  
>> +#include <dt-bindings/phy/phy.h>
>> +
>>  #include "fsl-ls1046a.dtsi"
>>  
>>  / {
>> @@ -26,8 +28,110 @@ aliases {
>>  	chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>> +
>> +	clocks {
> 
> Drop this container node.

OK

--Sean
 
>> +		clk_100mhz: clock-100mhz {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <100000000>;
>> +		};
>> +
>> +		clk_156mhz: clock-156mhz {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <156250000>;
>> +		};
>> +	};
>>  };
>>  
>> +&serdes1 {
>> +	clocks = <&clk_100mhz>, <&clk_156mhz>;
>> +	clock-names = "ref0", "ref1";
>> +	status = "okay";
>> +
>> +	/*
>> +	 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane numbers and pin
>> +	 * numbers are _reversed_. In addition, the PCCR documentation is
>> +	 * _inconsistent_ in its usage of these terms!
>> +	 *
>> +	 * PCCR "Lane 0" refers to...
>> +	 * ==== =====================
>> +	 *    0 Lane A
>> +	 *    2 Lane A
>> +	 *    8 Lane A
>> +	 *    9 Lane A
>> +	 *    B Lane D!
>> +	 */
>> +	serdes1_A: phy@0 {
>> +		#phy-cells = <0>;
>> +		reg = <0>;
>> +
>> +		/* SGMII.6 */
>> +		sgmii-0 {
>> +			fsl,pccr = <0x8>;
>> +			fsl,index = <0>;
>> +			fsl,cfg = <0x1>;
>> +			fsl,type = <PHY_TYPE_SGMII>;
>> +		};
>> +	};
>> +
>> +	serdes1_B: phy@1 {
>> +		#phy-cells = <0>;
>> +		reg = <1>;
>> +
>> +		/* SGMII.5 */
>> +		sgmii-1 {
>> +			fsl,pccr = <0x8>;
>> +			fsl,index = <1>;
>> +			fsl,cfg = <0x1>;
>> +			fsl,type = <PHY_TYPE_2500BASEX>;
>> +		};
>> +	};
>> +
>> +	serdes1_C: phy@2 {
>> +		#phy-cells = <0>;
>> +		reg = <2>;
>> +
>> +		/* SGMII.10 */
>> +		sgmii-2 {
>> +			fsl,pccr = <0x8>;
>> +			fsl,index = <2>;
>> +			fsl,cfg = <0x1>;
>> +			fsl,type = <PHY_TYPE_2500BASEX>;
>> +		};
>> +
>> +		/* XFI.10 */
>> +		xfi-0 {
>> +			fsl,pccr = <0xb>;
>> +			fsl,index = <0>;
>> +			fsl,cfg = <0x2>;
>> +			fsl,type = <PHY_TYPE_10GBASER>;
>> +		};
>> +	};
>> +
>> +	serdes1_D: phy@3 {
>> +		#phy-cells = <0>;
>> +		reg = <3>;
>> +
>> +		/* SGMII.9 */
>> +		sgmii-3 {
>> +			fsl,pccr = <0x8>;
>> +			fsl,index = <3>;
>> +			fsl,cfg = <0x1>;
>> +			fsl,type = <PHY_TYPE_2500BASEX>;
>> +		};
>> +
>> +		/* XFI.9 */
>> +		xfi-1 {
>> +			fsl,pccr = <0xb>;
>> +			fsl,index = <1>;
>> +			fsl,cfg = <0x1>;
>> +			fsl,type = <PHY_TYPE_10GBASER>;
>> +		};
>> +	};
>> +};
>> +
>> +
>>  &duart0 {
>>  	status = "okay";
>>  };
>> @@ -140,21 +244,29 @@ ethernet@e6000 {
>>  	ethernet@e8000 {
>>  		phy-handle = <&sgmii_phy1>;
>>  		phy-connection-type = "sgmii";
>> +		phys = <&serdes1_B>;
>> +		phy-names = "serdes";
>>  	};
>>  
>>  	ethernet@ea000 {
>>  		phy-handle = <&sgmii_phy2>;
>>  		phy-connection-type = "sgmii";
>> +		phys = <&serdes1_A>;
>> +		phy-names = "serdes";
>>  	};
>>  
>>  	ethernet@f0000 { /* 10GEC1 */
>>  		phy-handle = <&aqr106_phy>;
>>  		phy-connection-type = "xgmii";
>> +		phys = <&serdes1_D>;
>> +		phy-names = "serdes";
>>  	};
>>  
>>  	ethernet@f2000 { /* 10GEC2 */
>>  		fixed-link = <0 1 1000 0 0>;
>>  		phy-connection-type = "xgmii";
>> +		phys = <&serdes1_C>;
>> +		phy-names = "serdes";
>>  	};
>>  
>>  	mdio@fc000 {
>> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
>> index 6bebe00f5889..b396162dc859 100644
>> --- a/drivers/phy/freescale/Kconfig
>> +++ b/drivers/phy/freescale/Kconfig
>> @@ -54,6 +54,7 @@ config PHY_FSL_LYNX_10G
>>  	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
>>  	select GENERIC_PHY
>>  	select REGMAP_MMIO
>> +	default y if ARCH_LAYERSCAPE
>>  	help
>>  	  This adds support for the Lynx "SerDes" devices found on various QorIQ
>>  	  SoCs. There may be up to four SerDes devices on each SoC, and each
>> -- 
>> 2.35.1.1320.gc452695387.dirty
>> 

