Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F697CE9CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 23:12:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=jVWTV1dg;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=jVWTV1dg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9k7M59j2z3vX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 08:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=jVWTV1dg;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=jVWTV1dg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f400:7e1a::601; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=szabolcs.nagy@arm.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9bkW6RlKz3cBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 03:23:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgj16zS6PgE0Gfzy2ZVYrIaDELe67037s2rq4tznm7Y=;
 b=jVWTV1dgPmW8ShIlQsW1ISqg71I2IaJt0CZwji5LJhkxIcv1j5RSdghYwJUuxa7eQ6pzZZO4nNeXqh8cdX+8T60G2DRFhPZ5ypFHlW+uchRZjCcgLhJq4Use8c2sJLTNpShv4tUcw7ZX/9yCFX4FSM6S/yFi9jg83n25EHxXo5k=
Received: from AM6P195CA0048.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::25)
 by AS2PR08MB10084.eurprd08.prod.outlook.com (2603:10a6:20b:648::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 16:22:52 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::7) by AM6P195CA0048.outlook.office365.com
 (2603:10a6:209:87::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 16:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Wed, 18 Oct 2023 16:22:51 +0000
Received: ("Tessian outbound 9e011a9ddd13:v215"); Wed, 18 Oct 2023 16:22:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bc9be87f8aee56f
X-CR-MTA-TID: 64aa7808
Received: from 6319eec14f4b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 16CA8F59-A1A4-4788-BB6B-1934F2EF7CD7.1;
	Wed, 18 Oct 2023 16:22:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6319eec14f4b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Oct 2023 16:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/bumfYspw4GSjf+TokeekzRTgXTX0pJs8w4FkTa7TzYMA3azxTez5ci6MdLvIJW/5DniiGgWp+Quk3MdF5+jvlRzCy+9TORzPgybv+NR36If+GKHHRdyA38HoB26AHsK8oEiXNNqeYfU0gVpBotxUZKZen1/LF7kFQSHgk0P7yluU4SmxgO9jFHra0sf7Bw9Ik4Rmy3Md521GIdzPZwl6SDtOWpx+JD9XW7zevLis2mDcTGa1vVDKjRjVycIzmeLFAFKE6GgHBTIs1kirAGV+du91tK0icJEARDmyELHR1kQ7zIxKLRZcvmv4rlzyGCF0b6gki75Ma9nH/clC74ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgj16zS6PgE0Gfzy2ZVYrIaDELe67037s2rq4tznm7Y=;
 b=kiKuFCr+9docbTvI4txUNY6Q877bwEiXyOqiUpYn4MHUCvn1DJ7KvY8AYDj1kBanazp1qivrftom3nQXc9nUYmMxVzVWXVmbwN+M/QTRaO7uUW7R8iii2yO1mpqrnCim1WXndftIVSqjqZJDzmFcLasPvWddkJMx/90qSXQxUH3Sn/FctfgEeX/qEnt2ZaPnKpKAGEHMpba+rFXohvbRaFM3RUQdV1q8V7hFuX3DlK+VJIvHLqzsSdqxCNuhjjN50qo4uiXQMtZX6K04NTP2qbilHDU98MILcPGwGEzmYQGy13mmZknuklkUaFiE7eVMcWtrIY1+1a1JkfKovRpvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgj16zS6PgE0Gfzy2ZVYrIaDELe67037s2rq4tznm7Y=;
 b=jVWTV1dgPmW8ShIlQsW1ISqg71I2IaJt0CZwji5LJhkxIcv1j5RSdghYwJUuxa7eQ6pzZZO4nNeXqh8cdX+8T60G2DRFhPZ5ypFHlW+uchRZjCcgLhJq4Use8c2sJLTNpShv4tUcw7ZX/9yCFX4FSM6S/yFi9jg83n25EHxXo5k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by PA6PR08MB10829.eurprd08.prod.outlook.com (2603:10a6:102:3d6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 16:22:43 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7279:cb15:78e8:3831]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7279:cb15:78e8:3831%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 16:22:42 +0000
Date: Wed, 18 Oct 2023 17:22:29 +0100
From: Szabolcs Nagy <szabolcs.nagy@arm.com>
To: Peter Bergner <bergner@linux.ibm.com>, linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PING][PATCH] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux
 vector, entries
Message-ID: <ZTAGRY0Zn0KV/biE@arm.com>
References: <fd879f60-3f0b-48d1-bfa1-6d337768207e@linux.ibm.com>
 <4294d9ae-3f5e-4f81-b586-2c134d21896a@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4294d9ae-3f5e-4f81-b586-2c134d21896a@linux.ibm.com>
X-ClientProxiedBy: LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::28) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR08MB7179:EE_|PA6PR08MB10829:EE_|AM7EUR03FT038:EE_|AS2PR08MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9e52a1-a6ce-458e-0ed9-08dbcff679f3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  1wG3soMbwbiPjvoXL19E8lJ+DuH7PSpk/5qhpukbI+bBLeHFPrtl072sjH9FZe3z1B03vf9zi+S6RJyWdk810MI7KXszzeqx3O5kElJYvb4JnaprgE3zd03eW3DEnHrkhOpg7vqOvDkVKb0shiw9yTcmI/nG1CszATch8TeTq4ZkqzYA7Dzn3Jr/0CNRWYRcXKSl1hcA2LAgl2LaaidZNUojK2hTUEH/CvuvDSRRLagDLgccCcE0iw1BatvN87ntIrNcHz0zLlK/kiYXSt3INTh7azjHeaqopKiyL6iqzWKf55xAc6U4eKEhmNkgVvza6Yp7JGU2Dn8X/iqIxPW0mnM0oMUOCxKcW/QBEJQXRyAJjD+FCkhS1+m3Td4vUHYB9xmO2MvMzKXDiA6No6stIK582/75zWHYbl9rGonxLMC8lklifowIlyC7MokJzsrdvy6lnlGomXNVZxp9y66cYEz9Q2LwNPBFCpm0V7xjo7ooYC79SZwoEqNKK30n7k8D1kAoK/QXGw7ma+VnxZPfTxEXz9gUYAsk7T7QNZHRSiiwXvh+xK/WaG0iyHn6gDRD
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6512007)(6506007)(2616005)(26005)(6666004)(6486002)(478600001)(44832011)(38100700002)(8676002)(36756003)(5660300002)(316002)(41300700001)(86362001)(2906002)(8936002)(4326008)(110136005)(4744005)(66476007)(66946007)(66556008)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10829
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	9179579b-26c2-4ba1-771c-08dbcff67472
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FqRkGz27a9sFpYX46Oa1A0bYM7ZS4mGXM66Y6cAQwoXfOAif6lh1tkg3nh0NmG0fJktsBalRo6kNm4GAr3nBzhitmq43mtl8EIgS55PFbnN5GKf5y4UA/2QYn6Qqd4VLh3pM67baMb+Z2AvffCADpHX7W2SYpnCyu2MS6U17F5P/5KZ/qAfrTLjQRNvF539mdMQnt02h72sTJ4N/FtDPb0u0U/AxZr/kkzSlqrojAVBNG3OOftmhUxFyiP+MgFsteLP25rUoy7mWitwLXyTLGL8/vrOEuTcS/cPJ4CkNW3VlV0DqOMUybKpVbVO1XERiYSvQquis57Nn72irPsyUTakgjEZK7L7C14qy1OMfAD5cPsJNbowS9MSlaDIP7yF2q8Al4RlnJced8NEo8aAlQL7dorlF8NUQi+t9qQ/zEC0B5Qh5ep849ixz02yPUBEmsmdljUyM/TUaKQ990Q+yUAzHDKzdJgf24idmcFTEwfknG8SKpKqnfJuVMCo6YI45wYsHIpOC8IP1gGlqOXM+NfSrTdZ8mF5S5Q/Dgan3mxC0cQ6LL91m+M89mWptWYrJfnLhB0gnI+vSzodWRnCjeThPxjn0WthVNiKSCEeBorRnkyy96de8Rfy+tyE9oC+7c6QFf6WSO3S+ZdflwGS6fgVA/mjMkQAojYaipq0HKg2V8yLk0MyOyJ2YdmWHVQBdBqZA4shYrnwM6L7KQKdDLP++vPMthUDSANppp1iXiyrVIaJhb2rDfV8Mg3NfOAqg
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(186009)(82310400011)(451199024)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(36860700001)(47076005)(40480700001)(81166007)(356005)(82740400003)(478600001)(70206006)(6512007)(6486002)(6506007)(70586007)(316002)(6666004)(110136005)(5660300002)(54906003)(2906002)(4326008)(44832011)(4744005)(41300700001)(8676002)(107886003)(26005)(2616005)(336012)(8936002)(86362001)(36756003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:22:51.7308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9e52a1-a6ce-458e-0ed9-08dbcff679f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10084
X-Mailman-Approved-At: Thu, 19 Oct 2023 08:09:55 +1100
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
Cc: GNU C Library <libc-alpha@sourceware.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 10/17/2023 18:14, Peter Bergner wrote:
> CCing linux-kernel for more exposure.
> 
> PING.  I'm waiting on a reply from anyone on the kernel side of things
> to see whether they have an issue with reserving values for AT_HWCAP3
> and AT_HWCAP4.  
> 
> I'll note reviews from the GLIBC camp did not have an issue with the below patch.

fwiw, aarch64 is quickly filling up AT_HWCAP2 so this will be
useful for arm64 too eventually, but we are not in a hurry.

> > +#define AT_HWCAP3 29	/* extension of AT_HWCAP */
> > +#define AT_HWCAP4 30	/* extension of AT_HWCAP */
