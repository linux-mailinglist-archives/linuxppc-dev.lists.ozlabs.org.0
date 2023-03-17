Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 710926BF195
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 20:19:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdYpF2Pptz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 06:19:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f1bCtATA;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f1bCtATA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::32b; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f1bCtATA;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f1bCtATA;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn2032b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::32b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdYnD1pD8z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 06:18:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f0WXcZZ15q5DJVqmbm7QdVbBh9SvtiJMI5A72kzRdc=;
 b=f1bCtATAruT/6mP4Mpl2aWwigqWSdBOzxgn6jJrDgRg9kmTCEyT7nFfTfMj6txsopO9B8b3cgk6jqkJUdNWejpP35lNjsEBm/uQiWq9fd+kSaZeFYHHhiaUiRw8rRo3UYCEfkFdzI6deuUjrY7qsgcPidNfNffLcfd6dNRzyvd8+r2Iu6akWUFlqykP2RbRVOaZKWD6XiP1aQcn5TGC/OAgHggVJv3MIbM62bLIRblGwqunCJYkM8mgkXNNioTCHlCDjFgZXdIDYn/xljrYsBFdbtVeOrro1QerHTgz4Ti51BQVQYSbSr2D/lPUWLWIP2yyJlDUvxcwXFZ7c09DFWw==
Received: from FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::17)
 by AM9PR03MB7867.eurprd03.prod.outlook.com (2603:10a6:20b:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 19:17:44 +0000
Received: from VI1EUR05FT033.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::7) by FR0P281CA0053.outlook.office365.com
 (2603:10a6:d10:48::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.10 via Frontend
 Transport; Fri, 17 Mar 2023 19:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 VI1EUR05FT033.mail.protection.outlook.com (10.233.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.20 via Frontend Transport; Fri, 17 Mar 2023 19:17:43 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 836652008088A;
	Fri, 17 Mar 2023 19:17:43 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.110])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 09CC92008006F;
	Fri, 17 Mar 2023 19:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7wED6WI2Ru4ONfi0HM8TdPMh+DSC4SV7XrzxFwZNTz3jzoCEpSZWLOPRAoONAGttZh4jePW1h9WaT21/evYa4WNW5cEnP0ckwFWqAW8m+ZArJIQMtpsCciCvZFN8M4PdfESg/XNyekNqvwXvG1BlU0qQUYdh9gVMkJJ/EkTgqQqOgyBzx2J/yXmmURoM44qqaRFfFmoIjc/OOQsnH0DgqsFBBiSjL+xSxVGPyW1GGXvvAje7raxD+G0CIv7x9AMoiv7r9OI1ffvwXlzUYdqIN1tpVG0ri3u9l2Y6L7Xf9YfewDdzAmd0cJTCWBAKiFqYxVvfrpmYzM+SO771BakCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f0WXcZZ15q5DJVqmbm7QdVbBh9SvtiJMI5A72kzRdc=;
 b=WLtY0+mvAsnxVi38/YWXG6wpnrt9zyRtaI6wmaSl7a9/AtfUY+wGUqGzSztNBvqFaRpOZV5RZuB2rZXKrxIJdUyFJa5emdquSQ1V7kwOTkIOYcxAVeelEzSMXQ/LNbex8KzZBYBWJqWBeXO35exESD1P6h4BSD0fAolEkYZfMiQtt1Pw38j3QxkBi40WHzg4MvzFY26D6HluO1LjpjeSjCt7QXK7hlXwO/EtSET2eiiItQQ5exq3GyJKo+DiX7zwVEbg8ZdbXRLv153Qx+dB/J5w0p/fWfal1SZXgUy+rrVfi5sU/e6H6aqzFkMfDGBN2aU2c5O8m4oTBujXP1QiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f0WXcZZ15q5DJVqmbm7QdVbBh9SvtiJMI5A72kzRdc=;
 b=f1bCtATAruT/6mP4Mpl2aWwigqWSdBOzxgn6jJrDgRg9kmTCEyT7nFfTfMj6txsopO9B8b3cgk6jqkJUdNWejpP35lNjsEBm/uQiWq9fd+kSaZeFYHHhiaUiRw8rRo3UYCEfkFdzI6deuUjrY7qsgcPidNfNffLcfd6dNRzyvd8+r2Iu6akWUFlqykP2RbRVOaZKWD6XiP1aQcn5TGC/OAgHggVJv3MIbM62bLIRblGwqunCJYkM8mgkXNNioTCHlCDjFgZXdIDYn/xljrYsBFdbtVeOrro1QerHTgz4Ti51BQVQYSbSr2D/lPUWLWIP2yyJlDUvxcwXFZ7c09DFWw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DU0PR03MB8390.eurprd03.prod.outlook.com (2603:10a6:10:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Fri, 17 Mar
 2023 19:17:33 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 19:17:33 +0000
Message-ID: <acc331ca-9d1c-ed98-9271-281ded976fbb@seco.com>
Date: Fri, 17 Mar 2023 15:17:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v11 09/13] arm64: dts: ls1046a: Add serdes nodes
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-10-sean.anderson@seco.com>
 <20230314070848.GA143566@dragon>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230314070848.GA143566@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:208:32a::13) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DU0PR03MB8390:EE_|VI1EUR05FT033:EE_|AM9PR03MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f726c91-be97-4a82-c98c-08db271c48f8
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  xi2512uw26XhVnvbRlMtckWdR1kRuad94HoF0pwZX49KSSAkkrx322C5/jWeCSkk2TGMM/C3zU2IG0xJr23QuFPzvucH+m1ljlZWdbU33soVP6z5Pk4zyfk9GIVP4Y4CjfJaL9Xdttj7NFAYt7l3cGI2tyTS32+RbvE2jxJu+2mGMgHKwqBFS2R/aQJKanjyeTtyGDoZIUNoBuUTqyEF8K0+yaaPsQrMwP1EwBqfSmZ2C7Nwz809RMXd5P0/RksLQwhqP/kMBP73AS9Ddpjd7O4Sy95kC0rFh4nYDj1EwloYoQ5d/oXBo+X0plej+RVz9tFMMh210nEJd1Bhp6re3oEj59zfdqx0rvbhV2v7qQ63WOS4gtuVK6eNBhy3XKi9SLKtK326f76masaX1yfh1Ui4J8H6Gw1CzVK/FVsrPOPetBIqIJmt30iqOob6DrO/Fh07P/6masp4mvR52duFQtdmO1oywUYhfqjlu+rXL4rCkqD8eh9DIOP9NX2O3GAfoeF4fOJg2q1jXRNv+FaBFeM8NqjnQu2Q/kkAWwxxQyaTC5jx1/gxcMmQqBFS1O9lbu0lJGh7V70AeTozYbBDhaUFE2BuR8Us1nrPl1KlaTzFp4RFQv7ne+JmMZlvxOCRvvpe4PxfZdm44ayWzYW61Xeg1v9gj/eE2/9JTLsIIiq/Xe8ctS306ngRnuf8sUypnB8Bh+9447vDqX95T0QfpzX3LRBoP1ffrja3zIS3fTs3DPqQX0INg8LLUAxaZln342sWPABw8nhnCMQP8HHQLA==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39850400004)(366004)(376002)(346002)(451199018)(31696002)(86362001)(38100700002)(38350700002)(36756003)(2906002)(44832011)(41300700001)(4744005)(5660300002)(8936002)(7416002)(6512007)(6506007)(26005)(2616005)(4326008)(66476007)(83380400001)(53546011)(54906003)(186003)(316002)(8676002)(478600001)(6666004)(52116002)(66946007)(6916009)(6486002)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8390
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	110ca56f-e50c-49e6-3e03-08db271c429c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fsO+zZFQvmYFu28f1JnrsTPoJykBfIs6k+LCg5IoTiXpxxJl4/Uwv4tH4XRSEeQNTRJm0rYaGohIvhfzeFVfu3qtqVOWGeOZM12M+iQq1jbIf1DGbBqAMONty3AjuzjXTaZ+C2j41LkzrdjunqPnqe0UWObVE21J7Ib6i8//8m0NHXA57JEFzyE7yx9peYoDo/zRla10gmaUGk4CUJSr195Fcl+gBR1LUaBrLJrkbEAxxEcItsS7lSvbTo+g5mmSOvAOgz5BOHKs5GO9xcDO6arDMKf6ryA0hnPaYlGqBaUaveW/MvIXgsEzUcPAU1JzGXXuHv7PX0MF3dYSdMXVVxNSOFjMK08fXhU5Avspk5J9asIwvsi4zSweBZw4ujojCfXJPirzoNBto4tRJSVrVYhAuFwt6XbOOh+znKoT3y9BqNk9usFz0XMcTzIiJhBbnfmHXSgtaUGG08QBmtGT70a4D1FeqPxEmUAMt4DYdmm8FXt3vFZU4gyHjbVTkXqn6NuDcOnYcucF+XXLohTmHSFthPjH2ZbtH7CQUOGY/gnKn8u85D7Z7uWsPrG1gXibYGTEtots1FBNsBjJmQfztasj78iAZbKar2R+JxxMTTyONDaF6Np8aqa0JVv5pmH/wA3ueuvodFncsSqqg+ZlMniQHljM4e+bv/Ol08Yerf/FjZjJyusZJc+kwcC5/Zd4P7K4mNQTeuLgmFIZgVE6BRaWUYVl/lhaWjoB+6+3qo0DR1FdfTngNWqDPU8hhAPuyjfE92D7RCr+Sg+O399oLjsOmgGQFCfcBO5fCVppgm4=
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(376002)(39850400004)(5400799012)(451199018)(36840700001)(46966006)(40470700004)(41300700001)(34070700002)(36860700001)(6916009)(4326008)(70206006)(8676002)(70586007)(356005)(40480700001)(4744005)(44832011)(40460700003)(8936002)(5660300002)(7416002)(7636003)(2906002)(7596003)(82740400003)(36756003)(2616005)(6486002)(47076005)(53546011)(6512007)(6506007)(26005)(82310400005)(186003)(336012)(31686004)(6666004)(316002)(478600001)(54906003)(86362001)(83380400001)(31696002)(43740500002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 19:17:43.8951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f726c91-be97-4a82-c98c-08db271c48f8
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7867
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/23 03:08, Shawn Guo wrote:
> On Mon, Mar 13, 2023 at 12:11:33PM -0400, Sean Anderson wrote:
>> This adds nodes for the SerDes devices. They are disabled by default
>> to prevent any breakage on existing boards.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> 
> The DTS patches look good to me.  Let me know if they are ready to be
> applied.

The main holdup is driver approval from Vinod/Kishon.

--Sean
