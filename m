Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF96AF44F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 20:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWQCX4P8qz3cjQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 06:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c7U3X7QH;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c7U3X7QH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::320; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c7U3X7QH;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c7U3X7QH;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn20320.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::320])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWQBV1FKWz3cMP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 06:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z19/KYxHJfZbjRC2u9g8OcNWWEVAHhKTVS+8o4WBBM=;
 b=c7U3X7QH8s9e6HHAtwKDuzUQEjUny9H9fOzXYGZjVEfaV58OXG9CdtHHy7GaQZVO3x9+5D1X2vdueibbvaMpeJwBR3f9dva+/DoGC1oxx4gXrd7Mq8APgwBVoad4OQYnjR1R0N8LuGegcwn3aGZP8qFkSAeVPlnCAGryoSxzhoKyOPJPjpWlhRWdefrxahMFAo0hbx/QlF9aEwzuuLtJ/xpOSdiqyDO8Cvd+/G6cniVRTM+8me7A8CUTNe04nWpUiMUaFtgTQoFbsPbwmh1rwnuw83x/no+5drvrxGyKWCiP7E65NBi2DNKSl5OSnBCVhqxxgpIFDz7rSo9hA9Y8Ew==
Received: from DB6PR1001CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::16)
 by DB9PR03MB8399.eurprd03.prod.outlook.com (2603:10a6:10:396::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Tue, 7 Mar
 2023 19:14:48 +0000
Received: from DB8EUR05FT029.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::5c) by DB6PR1001CA0030.outlook.office365.com
 (2603:10a6:4:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27 via Frontend
 Transport; Tue, 7 Mar 2023 19:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 DB8EUR05FT029.mail.protection.outlook.com (10.233.239.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 19:14:47 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 4772F2008088D;
	Tue,  7 Mar 2023 19:14:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.106])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id EFCE72008006F;
	Tue,  7 Mar 2023 19:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAcXen+1Hh0nazcfvqWaEYc3s69fAQCqLe/UloQB2sSHnWgz4g4ijXPfjkl4MYQKo5YjnsE8ySc2kIoLBxLi5MeqV0ZEY0Lqstb1B7rH1EOTXCTtkWdyD3jhJizK6k+0p2d+oPX/LqsDd0skCPR1qf1AZmDaY5eJKQWnv3NpETBsv6ZIk4lC3FibccUX0DKC9E0GFlHnYg5INM3sT9VXgQyjVO7y9gwDLy8OXxEWEPD2tcNAonjv1Ni2PGzSAeTDl9/N+FZqIGN+dvqtCXKmKzjt6AaH86hBK0jjOwSUSmoA85IBv7j3C02FI0FxzWE4w+iQZkNLyWsHasNwotuFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z19/KYxHJfZbjRC2u9g8OcNWWEVAHhKTVS+8o4WBBM=;
 b=atX0q3IGjx1S21OssRArlTYZ3jR7XkY0KkJxMPHjbcemFeqNVFKcdInMoQ3js1nPcB9zx7BwktfTBFTuSo4/+XJmkXjpfOuGwc1wqzlEPsCg111/uAGSEz1csPE66HSwHWOyx+CY+vKFuGmldmubCgO8SAe+gou48PRrnPYZLv9D88dTR9eHjYMaKyyMyuQPgIrjB6d4OmMpQVH9zES2cGwtSUW52+SsywximCvUuv2JwYvAa+I4uQKQQW5YcuNYUbFDqL5hcxYriAUtsRRYf1HzEDRbj+eFrNbPx6OP0LByv0vCTjZcOG8K2XrIbtG4KEW8vt4gHctm1qoyvhs4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z19/KYxHJfZbjRC2u9g8OcNWWEVAHhKTVS+8o4WBBM=;
 b=c7U3X7QH8s9e6HHAtwKDuzUQEjUny9H9fOzXYGZjVEfaV58OXG9CdtHHy7GaQZVO3x9+5D1X2vdueibbvaMpeJwBR3f9dva+/DoGC1oxx4gXrd7Mq8APgwBVoad4OQYnjR1R0N8LuGegcwn3aGZP8qFkSAeVPlnCAGryoSxzhoKyOPJPjpWlhRWdefrxahMFAo0hbx/QlF9aEwzuuLtJ/xpOSdiqyDO8Cvd+/G6cniVRTM+8me7A8CUTNe04nWpUiMUaFtgTQoFbsPbwmh1rwnuw83x/no+5drvrxGyKWCiP7E65NBi2DNKSl5OSnBCVhqxxgpIFDz7rSo9hA9Y8Ew==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 19:14:38 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Tue, 7 Mar 2023
 19:14:38 +0000
Message-ID: <91e59ee2-d686-1afb-e639-d260fe8111ac@seco.com>
Date: Tue, 7 Mar 2023 14:14:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 02/13] dt-bindings: phy: Add Lynx 10G phy binding
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-3-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230306191535.1917656-3-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR15CA0024.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::37) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9024:EE_|DB8EUR05FT029:EE_|DB9PR03MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 007585cf-b159-4b74-8b4a-08db1f4037d5
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  6H/lH7noXf8RQAyCyXbH8LaGIq5MqmLjXEVraGmxGFkM48E58JcscIW5ZODMAPm9hEW4s74TI0LAb04Hv0ovZjyLd5im58la7NXzW5XUaz6sOnTeFEA33tTM58LA1O7poi3v00D+3LL3kdihGWLJE0KAah0hFKxeInU6NIjgASlAmCpQPSOGEWROk5J3hEd/T/F1GYGvBPjb/eXAsgIP7fkh5+C8sMM/yLdr7N8prL7vhAUJljkFv5CVgcNqR4Eb+fHrs8Vzn7eGrd1wxjJZJ4rUVcjeDmD89DiQ8TAZjsZoZCdVpD7XhjEGA7fjSsxRe++cJXObROIiGlDGHRcqolDv5thl7haLWEW8dcKx4gMjaUf2CyDyWP+ooToY6qPiIlO1q72/jv3uCmqGZ36rXaoOnL2RyaN/q4X4UsvpJz377CTKbd1p266Tsr1TkfQ9612ahQrlp5Smr+SRAATZjpSZnwjb15/GrkbZQ4TLZz5KeH51UHy8CSLKwUFSz0uebAkHyjPsFHKb3WKOsYDGHkp1G2UeJFGaiJxTKBujHVHE68KnkdaVWMv97xYBxYXyfwq5Qbde9+VGePPdIWdPtGqQoeYOOBw3akHXTDGvAEIAeA6NLY463avJBLU/3WP0M84J3Ta6dq+2zzkUrls3Qy29nFRBFYTe68oamDcIshYwW1fzX1a6cbWD+E/4++ESGr6DLoK+Tzwx4RPwT3NMdFtiCH+RXMZtXpZ8qYvgIs2RknizjTS5WKwNZs9/CzT+pXgHx2rsnm/2JAL7eqEMhg==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199018)(316002)(110136005)(54906003)(83380400001)(36756003)(86362001)(31696002)(6506007)(31686004)(6486002)(186003)(2906002)(4326008)(66476007)(66946007)(41300700001)(8676002)(7416002)(26005)(44832011)(66556008)(6512007)(52116002)(53546011)(478600001)(2616005)(8936002)(6666004)(5660300002)(38100700002)(38350700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT029.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d3203212-0f43-48a7-dee4-08db1f40320c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5EOj/7HOzN0ke2dMDqYJgjKI4b2agwR2du0FprViJ6ibiWow8+ljDbC7agkSnpFZKlvas294Pdo78G8cIHx+lrRwVoIYolADbek2YPwaPWnsrzmXnO6xblLyzkpC/T/4toRaFh0M48rm1iWnryRlFz5Glta8jBniypA0FtJskkkIZM/wxlas1fjiAqDZyOiGiXm1QWr2H9A1NJ3fYDEIpcqsR79G+i98EbLICcw3zLLVHUMUmNerGRhyOcxEqWReU2l4ktHVAdXnfVcazrKxqn1x+FZzDF+b1hIyikdGvJJtAgDNTKh+ylDSwwgoGgwIsJqg+OKrB1Feb7U6HHUkwqy+cXmy3lpSYU0KCNBzudj09biNc8EiR8rgk7GCMDiUYPdC3Yle/ZCSIuwOxCECM1qyNgj4CpXqcyZ7GgP0s5GvUP1skGO15nw5uewjPLr7Jb60UdEAUHfovGXLuzJxpIXAYPdgSEEJe7lxIiVqg3viVdhlWCiQCGAlaamc0vR/INxma5Q+24eZz3Q/WrXOTphiGr67hF8kpzgeA2ofUC/rYQULylmdfHSsfEQ21bde8rMDCe7oJY+zqAjRFCK5pNQDM2K+9rRG95tv1gEcqJmR9PJdaPzrW4k00QfzQqC04v+KO0gMSKs6dkzWX4vBt/CAAEBvk9KbCND7oF8LV+one8d7Q8OoqGKjyaPQtuxK6DqLXAsuB58pselnjsWcxRrXWoSUulD2MrXP7NBwCiKjgZVoajah+aYpY3sg64m2Ql7X8RfxNSOsQnw0QGu9IdXpfMDuDU0d0lwIeCz8viFJOQoBJCVwqkdGggfQ5y96RCvqVXeXobnuMW4Uq+2yBnH/fr1iADPBW/AUq27jVWk=
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(136003)(346002)(376002)(396003)(451199018)(5400799012)(46966006)(36840700001)(40470700004)(31686004)(336012)(47076005)(54906003)(316002)(110136005)(40460700003)(36756003)(356005)(40480700001)(86362001)(31696002)(6512007)(7596003)(82740400003)(7636003)(34070700002)(34020700004)(36860700001)(6506007)(26005)(53546011)(82310400005)(83380400001)(186003)(2616005)(8936002)(5660300002)(7416002)(6486002)(478600001)(4326008)(41300700001)(6666004)(44832011)(2906002)(70586007)(70206006)(8676002)(45980500001)(43740500002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 19:14:47.7229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 007585cf-b159-4b74-8b4a-08db1f4037d5
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT029.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8399
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/6/23 14:15, Sean Anderson wrote:
> This adds a binding for the SerDes module found on QorIQ processors.
> Each phy is a subnode of the top-level device, possibly supporting
> multiple lanes and protocols. This "thick" #phy-cells is used due to
> allow for better organization of parameters. Note that the particular
> parameters necessary to select a protocol-controller/lane combination
> vary across different SoCs, and even within different SerDes on the same
> SoC.
> 
> The driver is designed to be able to completely reconfigure lanes at
> runtime. Generally, the phy consumer can select the appropriate
> protocol using set_mode.
> 
> There are two PLLs, each of which can be used as the master clock for
> each lane. Each PLL has its own reference. For the moment they are
> required, because it simplifies the driver implementation. Absent
> reference clocks can be modeled by a fixed-clock with a rate of 0.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> (no changes since v9)

I forgot to add Rob's review from last time

Reviewed-by: Rob Herring <robh@kernel.org>

If another revision is necessary, I will add this.

--Sean
