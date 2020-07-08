Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83C218107
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 09:22:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1rNl4TC6zDr3N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 17:22:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=40.107.22.49; helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=james.qian.wang@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=Z7NBqvep;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=Z7NBqvep; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1rKh0fxXzDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 17:19:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=Z7NBqvep5KuQYSyH/wF3oHrHsHWaGhtoxTqVWcgqbmGVKlYftZxS+XAXeC+uHJyf/GjIMC8YdPd8VKTP/EzNmsV3qZzE9od25fFWW5t3xf6jRZBhikORdvNAsixWI/oqWI7xRWRgSrBcw+WLArC40UdFIMS3XFuQMchUVWmD2NQ=
Received: from DB7PR05CA0039.eurprd05.prod.outlook.com (2603:10a6:10:2e::16)
 by AM6PR08MB3992.eurprd08.prod.outlook.com (2603:10a6:20b:a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 07:19:40 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::d7) by DB7PR05CA0039.outlook.office365.com
 (2603:10a6:10:2e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Wed, 8 Jul 2020 07:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.ozlabs.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Wed, 8 Jul 2020 07:19:39 +0000
Received: ("Tessian outbound 4e683f4039d5:v62");
 Wed, 08 Jul 2020 07:19:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84719459c5a0d449
X-CR-MTA-TID: 64aa7808
Received: from 0c7ca0ba8389.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16C0E0C3-FCEE-4BFB-A29B-575CDE561425.1; 
 Wed, 08 Jul 2020 07:19:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c7ca0ba8389.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 07:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXAJnuftCYN4eLG7y5MpPp7K77lHN5T9Fw6SesFCbuQeHzG6lPzgLMMTJA1Uer1cNKd8stOHFjRaMQzurDgVJwBB6uz/iUVJHoIeZTlcWuIgE27PmZtqJ53iy1KWZZHUbRF8PeF0ntkHOIw0ol1TgwenNheXxc0FQNM2n7BbJanjvbDJCoxqheIqDMg8BPVcK00TskgbeVESEgmZVn3kIQ/1sdzxZaDy4HpPiwBpENOGdlUC5q070kSBvJ4qGsQE/taMe9MThyGV+r6Tx6GB3QvbRUNsXxGkZuoKUnr0EsGsUwdzMev+UpP5Edn4nNfzsDO01XVdyQ9U3whG8pgD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=bs8ObSbhVbu7ggwdmxh99Y4u/sMnXIGUjDjCgKcymNH+HAciicG7OE8oRQ65d3n4dZ4oYPXvqSaEEwsMdg/vpGKYlbl+802VIQDw8Sjym4Fq3cGS2JFb8MyDU9zjmzJBopxMnqajf0HDVCoGkRBreOOUpCZKBp/hTZsrAA4TGKQr3o9OE+sOEMK1pwkO/YjGNaPwl3WymSUpT88PqaCo90jCJgiYwWtAVY6nu2nVEQWpMfG39p54l/6Fl4NP9MlYvy7A49NiKwvoahSs1QcszhnJmt8zh34BEo1NB+7qLf0htnTdhPcFDY885OfCjERjvbRYdz7ncxg68qM9cyeemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=Z7NBqvep5KuQYSyH/wF3oHrHsHWaGhtoxTqVWcgqbmGVKlYftZxS+XAXeC+uHJyf/GjIMC8YdPd8VKTP/EzNmsV3qZzE9od25fFWW5t3xf6jRZBhikORdvNAsixWI/oqWI7xRWRgSrBcw+WLArC40UdFIMS3XFuQMchUVWmD2NQ=
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB7PR08MB3866.eurprd08.prod.outlook.com (2603:10a6:10:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 8 Jul
 2020 07:19:30 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 07:19:30 +0000
Date: Wed, 8 Jul 2020 15:19:23 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 06/20] Documentation: gpu/komeda-kms: eliminate
 duplicated word
Message-ID: <20200708071923.GA1127463@jamwan02-TSP300>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-7-rdunlap@infradead.org>
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.111) by
 SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 07:19:28 +0000
X-Originating-IP: [203.126.0.111]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b501d04-3ac3-4dc8-4b37-08d8230f4725
X-MS-TrafficTypeDiagnostic: DB7PR08MB3866:|AM6PR08MB3992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB399264C69A1F846C603FADE8B3670@AM6PR08MB3992.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JMs8wCULxbtOsZOmUQzPrITahAzA4Io1/sdAjlgr8dJE3tHGP4GIeV1X4Vu2A7mx3XJFaxhGWIAT5hTG1FIKW3Ym1sxFbUxGh/7QSkykaRbClm+o7OVpeLyz4aYhx4XrqZx4wyUwOHXo1ewT5xq90DhW7ct8taT+VYtTEALZwnewyH/xUXEkZ54b7tx2dTbgmb3ihzt5xLhaa5Q3NACOdz+Nv0dTpfE3/fpA6xlFigyk5kmoRFefn5yPa7Qx2ssEHwDHqMaf4yNnDsLZu5g/qY8pi/c2exhw/X2uf0UqNx2y0qzMBjuc67vFvDR6qld6Efymt7VhzVK+9K17nyxvgw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(8936002)(478600001)(956004)(54906003)(7366002)(86362001)(7406005)(9686003)(8676002)(316002)(7416002)(6486002)(2906002)(33716001)(6666004)(6916009)(1076003)(66476007)(66556008)(4326008)(66946007)(33656002)(83380400001)(186003)(16526019)(26005)(52116002)(6496006)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: s28MBsKsTNwLsb9W726e+etxqE/6znWCOOivA0sQnLqpMN6EqMSmrM6eEwj1qUVHukQiovpM6XzazVXZiSwSO9vVVgp1ps+hDhPnHxKC4Kb6paqlRLn5HNV0StemiVHmy4Ze5RLtH1yUVS5S0CPqXUnn0BQE2rrAjC0IOnPB9b/BteSh/zzB07567K+zDHCOXeSNv6L1XsQIznCLeLdxarRLq2GZ0W9dyGB4X6XZNrp26pn0U8Z5rM8uU1PhfmpcjwEaLFqiUzxwmdKOUDEqsIMuqY0H4db3enXR4Dhc38e6nJINBTEZlyTTZ0BcqpJKu0343xm65IQyoqlnecLBU7djtFNMW4L8EqqAA43UZZVM0mbg+S+zXUS2I/rxeXEqaS3jIga2A3pbxP4oXHelCX0cgHrAxNhSIJMTpH4thNLJx1P47VYKAZDftLdV1VUYP/XzobqEsn4ahCCW8xGiiixtnG5s3m48t/KIOe7xtDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3866
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(82740400003)(16526019)(33656002)(6496006)(956004)(4326008)(33716001)(5660300002)(336012)(83380400001)(478600001)(6666004)(9686003)(2906002)(6862004)(70586007)(70206006)(26005)(1076003)(47076004)(186003)(82310400002)(316002)(6486002)(356005)(86362001)(8676002)(8936002)(81166007)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c801bed8-98ca-4271-cf60-08d8230f40e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfcZEcANIoNmSU7fibyA2TBwRmlxtz2DWeLB5LtESliv9Qv9R9eryhWgWt1r3UrYxoYPlVQCbIKvhMGIKaY78HogP+50mR5TSw/uTFhxCKQ/rnW0CP5eFLwhdpQN8tsZ3SgxnCnbUtI20lkfsRiN0NMAgOlIrC2FsiZtT/BTktOaCrEuDBDGirLtWOlyyQQGG8lHfw4qjt8QItKz8Wj9Fj0Mo7vQwyjWHP+f2qAEiVFXE0JUNEWoXvvuxGDUiuSqtntvOq8oAWeS9MSoopJUEwxFRa+SYiNAufW3EqUK+AcI/mbuER6E/dkhGL/VBZelyjD88lJ1tKx/C2p+PRv7drVugYvj4d6IQnTVY7nrq68IX7kWlcBfuykY1ziCjeEoVFoaOBlbzwJhbDndX3/SoQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 07:19:39.7963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b501d04-3ac3-4dc8-4b37-08d8230f4725
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3992
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-input@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, nd@arm.com,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> Drop the doubled word "and".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: James (Qian) Wang <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> ---
>  Documentation/gpu/komeda-kms.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
>  frame. its output frame can be fed into post image processor for showing it on
>  the monitor or fed into wb_layer and written to memory at the same time.
>  user can also insert a scaler between compositor and wb_layer to down scale
> -the display frame first and and then write to memory.
> +the display frame first and then write to memory.
>

Thank you Randy

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  Writeback Layer (wb_layer)
>  --------------------------
