Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 084CE839B0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 22:26:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=M5x4HZCL;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=M5x4HZCL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKKs36sBSz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 08:26:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=M5x4HZCL;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=M5x4HZCL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKKrD3m55z2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 08:25:30 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ccZa+G3SCYuE261lljQjbxjBIadJINLG0i5CmhLh/dnlpLoOux7w9vz1OcnrWF7pxvX5c0Plx869itHbgr0OPlCiI2KGWfaDeQe4lA3HAjCzk779PqHrOxumkZc+o7HdzwTVEP9abN6LsTJ8fKNNqzRpzg71jh2NQSBJqg1/Pvz+dtPEjFvv3vS6cu7BSSNqHzOLw31xorgIGDt+IE2VugKpVrN2ZMmMndK7yyiIzRauJBYRM6kh7n56Dk8HhyTCr5XqFy/YzwNzdpWdNtyIo+rJnvWJUMHpzLZxY8JyvZvoX3KSNE1JPOVF/TpQoVBUC+Lsh/GXWyHnT83OXijyrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYnRlRgctNBJa4EXgFVNvuy79YSRrFQomZLkAbzJPSM=;
 b=EveJkln0pW+nKP3RLQI6rar7srZBbFlx/Ajj42zw9DI6UnOTnyASCC8dIn1Ck2UrDy2SKmmCvkEbkXrNEXhoibEBGsG/hnewEzrlmMerGHUo7xi1o8FmXPgpPN5nCfayO+Z+9wDjymH0q/fe/Gt+bVxb7EOMKEKX8dEdcNO05vqtSOFYIc+Psw1cGrWdyOn07eai1T2AuDBGffTevAG2HhYdvIYAQuDaQpxju1Qkr+hk0LC4ggo+ZgkTx4a+yd4xQ0ObSLI6n1o9BdaehERqzFuf3mMiicpH5u4xDP0xxbdCRQ2WJA8kWq3lp3NhDRZBgmfV8U+rU6jLXuOsL7dSHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=buserror.net smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYnRlRgctNBJa4EXgFVNvuy79YSRrFQomZLkAbzJPSM=;
 b=M5x4HZCLLJKo2vHxySqofAL/WJvYOHlZY6np90ddx6UwmUyUBg3SMDZ3S/dpXQtPRCRF0RlRTiDK1EZX8j9BPk1AxH+tXlt5AobE9Jwtk/CQGRA5B4r3UdyktSMueIS/4puv2zK9DCCoJqg18bV3OJlWok1+HNUmqk//jv/vjaCOUGpQraQdF216VbE99ndtMZf0U9M8BLa9FCbBCNpmg6Z0WetFvGl94rcGiQp07t7vx+OboMgiJzgES1YRHf5AoLgltnHkQWsPPBcIRqdZBAsxbfpjTDqP7EsTg6/AvMSXei6s48r2UfTiIUZvb7SE1T5QWbyt6Z9Y0uF4znTTrg==
Received: from DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) by AM7PR03MB6310.eurprd03.prod.outlook.com
 (2603:10a6:20b:13c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Tue, 23 Jan
 2024 21:25:06 +0000
Received: from DB8EUR05FT036.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:50e:cafe::90) by DU7PR01CA0027.outlook.office365.com
 (2603:10a6:10:50e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Tue, 23 Jan 2024 21:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT036.mail.protection.outlook.com (10.233.239.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.19 via Frontend Transport; Tue, 23 Jan 2024 21:25:06 +0000
Received: from outmta (unknown [192.168.82.132])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id DF6DD2009538D;
	Tue, 23 Jan 2024 21:25:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.104])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D683A2008006F;
	Tue, 23 Jan 2024 21:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPCshnd91z6/UIwvFnbefD8sJsQI9fe8fjHTuK7lxU74bEAF7tesvanv6ai88V0GQGRDRASbTVZUcGjdAEx/19ZR7eCDp0VInAaPE5co1grbC+4ooo1LTv1eqg5m78IMazv7usxzeczFCIJ8035GuYi84TzMVEsEdmC4lsaLSsqXWPLAO9J9exAgnzZluEEf8wfJzkZrbuUcBNkxrOUrK0vbH1mCIgD1ynr1zZlHKopMvtlmT5jaP9EWz3w6eYirN34O3P6VXnK6+vsIJ0wGwcmz7WOAxlYsGROUBXGzbRsgXA6Mu6FnIsDB8eUoKaHuKLo49Ow6WuxP5Ebje3yBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYnRlRgctNBJa4EXgFVNvuy79YSRrFQomZLkAbzJPSM=;
 b=Jj5gyiN7T1o+uJPIo7vQB37E2LiISZZ9uy63xlinqwMIDnGtc+xDAxnA261846ajaQQscuJ0fC9F7kfvWXXMuWce54LkjPj/mQHM0hJjuGbKyargqEPTLEZD3wl5QDP7C6FxEjzVZwSZvNM24yucRuZ1RfvGGR+bUH31UMgirZMhJ7woXTQUh09KjVjwH/Ua6FMNbTvkDZnqoKmzN44tF0m6j7fkHu+ekWtkAQWLMbVeUm3kWsuL3F0rNVkpM3PCoeEoZOwJ9WVF64AbArty7PKMFg6kYTVEQenKCo512w6ehKZo5lPiDCCtMEF3H6IIKRmGy6nBt13mJEbELjaFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYnRlRgctNBJa4EXgFVNvuy79YSRrFQomZLkAbzJPSM=;
 b=M5x4HZCLLJKo2vHxySqofAL/WJvYOHlZY6np90ddx6UwmUyUBg3SMDZ3S/dpXQtPRCRF0RlRTiDK1EZX8j9BPk1AxH+tXlt5AobE9Jwtk/CQGRA5B4r3UdyktSMueIS/4puv2zK9DCCoJqg18bV3OJlWok1+HNUmqk//jv/vjaCOUGpQraQdF216VbE99ndtMZf0U9M8BLa9FCbBCNpmg6Z0WetFvGl94rcGiQp07t7vx+OboMgiJzgES1YRHf5AoLgltnHkQWsPPBcIRqdZBAsxbfpjTDqP7EsTg6/AvMSXei6s48r2UfTiIUZvb7SE1T5QWbyt6Z9Y0uF4znTTrg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAXPR03MB7596.eurprd03.prod.outlook.com (2603:10a6:102:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 21:25:03 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::ec0a:c3a4:c8f9:9f84]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::ec0a:c3a4:c8f9:9f84%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 21:25:02 +0000
Message-ID: <f25c58fe-55e3-490f-bfe4-34dee945d585@seco.com>
Date: Tue, 23 Jan 2024 16:24:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Content-Language: en-US
To: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20240108161904.2865093-1-sean.anderson@seco.com>
 <20240108161904.2865093-2-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20240108161904.2865093-2-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::16) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PAXPR03MB7596:EE_|DB8EUR05FT036:EE_|AM7PR03MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a1bf55-b76c-478e-e3ab-08dc1c59c50f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  ptdI9CvAAt7y43UXZi4zLLFX8rRhkgjs+H1stHiq3H2CwWfhpfuhMbnNbUFqrR59ROJO8JKO3fzV+Ma6MRWy7J9ward6DEhnAtmTDoIzZG7uXv31+Uv9YWtOqp0ItMr5ZDQB4fObZDTVh1YuGW+LmlxapNausNwhm3cgHN8AwTb5x07+jz3rr4olmc3YNtsRnogxheGDQfT1Kz5qU19fKrEKWG2r/OYN0UulZ1fHzGIreJ1OksEVCo9im4SWP06+KfnCTebZKxql5ZiqFoTsLPd0ozcRUW2SFH8i/471JuEoEvxjR6MPx2Y6/Tx6HVE/nD0/IGdUzaHpZrNGvcBRTmO2FfHrWzGN/e3ScEYJhLZ+Nk3lo5YnXMxo7hnvCN1g7LjBK58ImbaFMHuilLDJVG+bigKsFgbBZs5nXQOpgRiDg+0wgT0qQUkYZP8rqVF2tZOmjsd5nS14fQV34vq+HcrWcgLwI9PsN31uj5/sAr7piZLqPVRqwA80fWvuJoZHDO4Fn3kKiIGUp7ZjgrFVqsdfW8v35y5Kdck9Z61PMrRs6MD+h2rt0HHO7W99DBwGI4EVsz3NlVvgx2uB9YTuyaNYBjjgVtiW1Hwq4jBRhXItRtbZxvYPnKPeafPjDpJEAvFjEoPzYaJ6E3fBpV8YdKa8c1hMu/Pnq+HJeVwhxJM=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39850400004)(376002)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66946007)(26005)(8936002)(38350700005)(6506007)(53546011)(41300700001)(36756003)(6666004)(52116002)(6512007)(2616005)(66476007)(316002)(54906003)(4326008)(5660300002)(66556008)(7416002)(8676002)(44832011)(38100700002)(2906002)(966005)(478600001)(6486002)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7596
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT036.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	aae1e122-d29c-4a40-47eb-08dc1c59c2e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bK+h3GTQ9eop0jcdYER4n3XlsNJz4AT9h3ENyqnFZN/jjlQ3d7Lp+9V5T7L+ZXVNbLlCkpIWML9a4FfHoXdSv03VUNUaNftDgY0npuo8mfcXJqr0Ko1S0ZEdvpe22tdgZVVVv00GjDrEEyx21DxZ+yJts521kdw2HA7lSSaak02UMh09r9TygN9vwaBIKTCYcoikdLwp6gmjh9KskvwoXoGRZ1CBr4zQwXcspVIktpg7aFxTo6Ju2wmarU/ou1nIGezXKV+wGywyk+GCBIPuv0xfnuvNVIc2NrpntY06xHhcQvod83KYCxp2OscXPXoifdc2fClltzBamFWK1oFqp67F1dgI3qobw3d00Fa4Id+ZNGFheMVQUC67J1q3n4R4fKM/5M3XMbqLleu0IoY6yRCczwmiyn+ZwCLWVFSk+FApOLouwGEKWeppDfUqljGQoK9QYJVO6Hr1nGh+ATT1ZheFT5U02ACnW9DRadj6Nf9/6O9gERnYXHcQ2RM3EZjxtBN36U+W/ntg31sxCzASJDXQCjJ86/414JVx9xW0FzP9jcjbO8oCxnjSgpIh8sV48ldDfbR5P3pcqAfg1biuFR2Mn7uHTUO8yCdYHqBelT3t9zSSdAV6TMm635UINGj91vyG0cfx5uELZNuu8ayFXF3btKbuQsUn1cJAt/s6iIzVzghgRLZ/dssyRcIZWHvlmxNTBxirp+BTzT3hIV8CG8KySgE+ZbNCwUCBuqEP12zRZyjsUmqeG5AXpy7nL7g+1LDdyV0x5j6oIj01BnVy6w==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(36840700001)(46966006)(6506007)(53546011)(40480700001)(336012)(44832011)(7416002)(26005)(5660300002)(31686004)(478600001)(83380400001)(6512007)(6666004)(6486002)(966005)(70586007)(316002)(2616005)(54906003)(70206006)(47076005)(8936002)(8676002)(4326008)(36860700001)(2906002)(82740400003)(41300700001)(86362001)(34070700002)(31696002)(356005)(36756003)(7596003)(7636003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 21:25:06.2650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a1bf55-b76c-478e-e3ab-08dc1c59c50f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT036.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6310
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/8/24 11:19, Sean Anderson wrote:
> cgr_lock may be locked with interrupts already disabled by
> smp_call_function_single. As such, we must use a raw spinlock to avoid
> problems on PREEMPT_RT kernels. Although this bug has existed for a
> while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
> queue depth on rate change") which invokes smp_call_function_single via
> qman_update_cgr_safe every time a link goes up or down.
> 
> Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
> Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Closes: https://lore.kernel.org/all/20230323153935.nofnjucqjqnz34ej@skbuf/
> Reported-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Closes: https://lore.kernel.org/linux-arm-kernel/87wmsyvclu.fsf@pengutronix.de/
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Please backport these fixes when applied. This bug has been reported
> multiple times (see links above).
> 
> Changes in v4:
> - Add a note about how raw spinlocks aren't quite right
> 
> Changes in v3:
> - Change blamed commit to something more appropriate
> 
>  drivers/soc/fsl/qbman/qman.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 1bf1f1ea67f0..7e9074519ad2 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -991,7 +991,7 @@ struct qman_portal {
>  	/* linked-list of CSCN handlers. */
>  	struct list_head cgr_cbs;
>  	/* list lock */
> -	spinlock_t cgr_lock;
> +	raw_spinlock_t cgr_lock;
>  	struct work_struct congestion_work;
>  	struct work_struct mr_work;
>  	char irqname[MAX_IRQNAME];
> @@ -1281,7 +1281,7 @@ static int qman_create_portal(struct qman_portal *portal,
>  		/* if the given mask is NULL, assume all CGRs can be seen */
>  		qman_cgrs_fill(&portal->cgrs[0]);
>  	INIT_LIST_HEAD(&portal->cgr_cbs);
> -	spin_lock_init(&portal->cgr_lock);
> +	raw_spin_lock_init(&portal->cgr_lock);
>  	INIT_WORK(&portal->congestion_work, qm_congestion_task);
>  	INIT_WORK(&portal->mr_work, qm_mr_process_task);
>  	portal->bits = 0;
> @@ -1456,11 +1456,14 @@ static void qm_congestion_task(struct work_struct *work)
>  	union qm_mc_result *mcr;
>  	struct qman_cgr *cgr;
>  
> -	spin_lock_irq(&p->cgr_lock);
> +	/*
> +	 * FIXME: QM_MCR_TIMEOUT is 10ms, which is too long for a raw spinlock!
> +	 */
> +	raw_spin_lock_irq(&p->cgr_lock);
>  	qm_mc_start(&p->p);
>  	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
>  	if (!qm_mc_result_timeout(&p->p, &mcr)) {
> -		spin_unlock_irq(&p->cgr_lock);
> +		raw_spin_unlock_irq(&p->cgr_lock);
>  		dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
>  		qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>  		return;
> @@ -1476,7 +1479,7 @@ static void qm_congestion_task(struct work_struct *work)
>  	list_for_each_entry(cgr, &p->cgr_cbs, node)
>  		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
>  			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
> -	spin_unlock_irq(&p->cgr_lock);
> +	raw_spin_unlock_irq(&p->cgr_lock);
>  	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>  }
>  
> @@ -2440,7 +2443,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
>  	preempt_enable();
>  
>  	cgr->chan = p->config->channel;
> -	spin_lock_irq(&p->cgr_lock);
> +	raw_spin_lock_irq(&p->cgr_lock);
>  
>  	if (opts) {
>  		struct qm_mcc_initcgr local_opts = *opts;
> @@ -2477,7 +2480,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
>  	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
>  		cgr->cb(p, cgr, 1);
>  out:
> -	spin_unlock_irq(&p->cgr_lock);
> +	raw_spin_unlock_irq(&p->cgr_lock);
>  	put_affine_portal();
>  	return ret;
>  }
> @@ -2512,7 +2515,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>  		return -EINVAL;
>  
>  	memset(&local_opts, 0, sizeof(struct qm_mcc_initcgr));
> -	spin_lock_irqsave(&p->cgr_lock, irqflags);
> +	raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
>  	list_del(&cgr->node);
>  	/*
>  	 * If there are no other CGR objects for this CGRID in the list,
> @@ -2537,7 +2540,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>  		/* add back to the list */
>  		list_add(&cgr->node, &p->cgr_cbs);
>  release_lock:
> -	spin_unlock_irqrestore(&p->cgr_lock, irqflags);
> +	raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
>  	put_affine_portal();
>  	return ret;
>  }
> @@ -2577,9 +2580,9 @@ static int qman_update_cgr(struct qman_cgr *cgr, struct qm_mcc_initcgr *opts)
>  	if (!p)
>  		return -EINVAL;
>  
> -	spin_lock_irqsave(&p->cgr_lock, irqflags);
> +	raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
>  	ret = qm_modify_cgr(cgr, 0, opts);
> -	spin_unlock_irqrestore(&p->cgr_lock, irqflags);
> +	raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
>  	put_affine_portal();
>  	return ret;
>  }

ping

I'd like to get this in for 6.8.

Would it be more convenient for this to go via net?

--Sean
