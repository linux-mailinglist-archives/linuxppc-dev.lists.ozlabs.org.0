Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB6217F0E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 07:23:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1nl33MVYzDqgr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 15:23:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=40.107.7.40; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=james.qian.wang@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=LdZVkyZH;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=LdZVkyZH; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1nQX3tsfzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 15:08:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=LdZVkyZHffRY3zc8d7PkEH6Er4IMXnRtIH2vKa84vfGU2JhoCHYliZPltpjD5l7/WTbbeUvornNRn3JJyNn6zTCswY9A1QCbLePCS0zoypRVMVm9Mluf4/7lbXWySIfkrbxP2If3jfxaUF1eqOqAlPqzLkGcarHkvm98Ah+ROBA=
Received: from AM5PR0601CA0061.eurprd06.prod.outlook.com (2603:10a6:206::26)
 by AM0PR08MB3762.eurprd08.prod.outlook.com (2603:10a6:208:100::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Wed, 8 Jul
 2020 05:08:39 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::2f) by AM5PR0601CA0061.outlook.office365.com
 (2603:10a6:206::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Wed, 8 Jul 2020 05:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.ozlabs.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 05:08:39 +0000
Received: ("Tessian outbound e44de778b77e:v62");
 Wed, 08 Jul 2020 05:08:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31c59d195aa7f0dc
X-CR-MTA-TID: 64aa7808
Received: from 2e5d9e7d8353.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06FC9AB5-E7E5-4261-865C-0C530ED94E38.1; 
 Wed, 08 Jul 2020 05:08:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e5d9e7d8353.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 05:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtUjxmWFlhOqgMKTTCk0ej+2KO2YVuvGrBQd6zpxtJ5JbtVd67CWNwutBuzVp0FRS4JY9Lu/SJOzZwGwi4PnHgNb03wgKkjohPtJUi4786G09q2tsuZbb/te7vNLas0R+qhQqI2oIwJn35Dron8NJJwa4gQo3gmLHSfim3LOOy5DqKy9oSrUFNpKSzkpZZ+GlVG6sTF/h6LmIKAaAlc9UFR3OnSnk5MI/HY/FKA0S9zKzMBFd/pYYwDNleFam4wSctNqnyoG20qpXBeeAxIaI5vGMhBATIqruTaFqmowuZbmV31lOCEISp/l5exmIvFQzSJXOcqTMcTl2/d9MT9Lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=Vo4fp2KvVUc7u7E6caIyjBGj20AuBQk1aIvjntJwAYH47rP/Jxj2R87rcj+nsyyzPmaConDnUVdWbzB7kJALGUE29LwvOtDGGvAY2QGJIvLOd3hHGQ9n+I/p8bOp0GQR8wapf2BUu3DpwBxsKap5dXhfKQwEqMQKR7cmt3Wo3dmM/m1DYKNW/MPByusFBiwEjf4jrA8ja8SflGoLSoz55GsOYtmH6xCh27KqhMdCKQLitURgCYPjK71i4GBXjeZTohLm979ywqmgNA2BeR7f0lIdAezYXjBJmsQyiGiD3+wYhKHDA4h3oFe9bcT7haEIjDV8agjcor5Us9kOCtwH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=LdZVkyZHffRY3zc8d7PkEH6Er4IMXnRtIH2vKa84vfGU2JhoCHYliZPltpjD5l7/WTbbeUvornNRn3JJyNn6zTCswY9A1QCbLePCS0zoypRVMVm9Mluf4/7lbXWySIfkrbxP2If3jfxaUF1eqOqAlPqzLkGcarHkvm98Ah+ROBA=
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB8PR08MB5418.eurprd08.prod.outlook.com (2603:10a6:10:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 05:08:27 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 05:08:27 +0000
Date: Wed, 8 Jul 2020 13:08:21 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 06/20] Documentation: gpu/komeda-kms: eliminate
 duplicated word
Message-ID: <20200708050821.GA1121718@jamwan02-TSP300>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-7-rdunlap@infradead.org>
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.111) by
 SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 05:08:26 +0000
X-Originating-IP: [203.126.0.111]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b488b61-2a32-4971-ec2d-08d822fcfa33
X-MS-TrafficTypeDiagnostic: DB8PR08MB5418:|AM0PR08MB3762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3762CB6D7B3F2089095972B4B3670@AM0PR08MB3762.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ugv76lIcWFzncaE8CL8NRcn6Y25zj4XaFHTLySKgaHoOkaWTWq9Qj9ZZhP0IJzeMVS1pPW9l3z9+9dwd3xUldiqi+o7oxY0AOqdkDPPHERIhDyC2SNjRnrLpm6iYobnss+uIxhuvfEryWIeZylCaITi7KP5y54tSmWIY2DME7iiFTGMCou1LWfo5Sx9h54U2HnAzztC+7i/KxuFyqyRcfH0cxR/1YKdDobyrQxHxNwVAQ5jUFJOlNXS36ebm775MNWRYWv3kdjf2/invGaF++KMpE2wNwFXFrO9cg1P8v8v1RCprlSrRLlDlNzS6KVHZRGjK0s1jpIMzdiZyoGPiNQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(7916004)(39850400004)(396003)(346002)(366004)(376002)(136003)(478600001)(186003)(7406005)(9686003)(2906002)(7416002)(7366002)(6916009)(54906003)(8936002)(6496006)(52116002)(4326008)(316002)(33716001)(956004)(1076003)(6666004)(83380400001)(8676002)(16526019)(33656002)(26005)(86362001)(6486002)(66556008)(66476007)(66946007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cbkH8aJ+VUJQNAYUsDp271bZLTF9bRsCKaYGBd3fSkjP/IVDmSUfCWoIVjMV00+V8zEh4kZ3pmIpL1u53ce11rKnQjfGIVmzmZ3GUtSRRteRb6x/qYqIW2lXJKMjl11L9YpRW0e/YLWSiU8X9Tq7dmlfMZHPOLSBn3CRoEJ5X/2jt1eF+V8EaJZFdp785bZA5B5+o9ocL5EkUAxXsDBuv2TmBgzekPUHt+NUqXeagtZMSNfnCZLf/bbvm+qrplQMutZ1irKbQLFnErk4jDNLuUX8DcJGqP8nHL/j24c89Z6FfJ42q/uN/6HFIOWBuJj2jpyYx/9dVVUidbMOT5qe7bCmyjy3C79wynuMO3rVlav6A7FjUcb2tHg+CI4PflCHdF6RfwnKnBwy+MQpm6yyzRv1s1n4sWYtBi1BH7pEuC+waX0qJVyLIFbKC2Dy8T0Bng/8w+kAIzGeNxNDHToKvpsXjxdPadN2moIcftwpV38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5418
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(376002)(346002)(39850400004)(396003)(136003)(46966005)(82740400003)(47076004)(8936002)(81166007)(478600001)(956004)(36906005)(86362001)(8676002)(9686003)(54906003)(316002)(33716001)(2906002)(336012)(6666004)(6486002)(1076003)(4326008)(70206006)(70586007)(6862004)(83380400001)(6496006)(186003)(356005)(16526019)(5660300002)(26005)(33656002)(82310400002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ffebe40-5e4a-44cc-93c2-08d822fcf283
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6bT3mq7vJ2QLS4FckVMLNEBuJ6hpD2OeiM8f+HFUDaamQjErnzpwIW1IRrlTJY9Du73IFjysa4u4Jj50jrZLxAuQq27WJIgLHd5cNrJh5MF/PPnwmD+TJ+ZIgOfYeb0XPM0l9PzRHFsjkt5CTjkznxel2AMyBk7aaS3/hKQX5+pgai9y2FWXYrbMt65Xw7hLdffc7b7quMDjPGnivMDMYb+s6FAjKcvhaHTicYvdPWpzwnd3b/vUd4QkohoWKiM8aZ97t4zQdR0VebkpWv9/XtltYnEcTv0ufaqucRt2Jv5Pxo5xfgWXdrYA1Ciss6+/R4oz7Yd3YcyTOcSKt8PILdTuBPMhBuFfjDJ+nykrQONAuQr4mtZv5ifwAOyPfKGlrsNXSYzL14kIIAQGkAvGg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 05:08:39.6795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b488b61-2a32-4971-ec2d-08d822fcfa33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3762
X-Mailman-Approved-At: Wed, 08 Jul 2020 15:21:35 +1000
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

Hi Randy

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

Thank you for the patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  Writeback Layer (wb_layer)
>  --------------------------
