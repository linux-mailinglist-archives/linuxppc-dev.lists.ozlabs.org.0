Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCB7CC5DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 16:25:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=f2VwFAzb;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=dE+CC7p4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8x8c1q5Rz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 01:25:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=f2VwFAzb;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=dE+CC7p4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.79; helo=rcdn-iport-8.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 124 seconds by postgrey-1.37 at boromir; Wed, 18 Oct 2023 01:24:27 AEDT
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8x7b38W9z3c8Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 01:24:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=462; q=dns/txt; s=iport;
  t=1697552668; x=1698762268;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5aAWebvPEcDpKtjwQ/nVVboltxcJGpq7ZDfeNGcav3g=;
  b=f2VwFAzbYMSy8RX99uSPJReJ7dWW2Akg4Xs5SefhVq/wB24ia/wAAbOH
   5AJn5Der7NMiXZ/H6hiovl+7VaaP4fjgIMxZGGfqTOPRzuvi+08EyI6zf
   oKe+KvSsaKujtG88q4aVi3ssdbKOlJRteQ+f33Oz8PhEJg+5X6EDwWFq9
   0=;
X-CSE-ConnectionGUID: ghTgn9YrSCK8PwOhAXXmUA==
X-CSE-MsgGUID: W9HmGosNRpOG3145a9Mo+A==
X-IPAS-Result: =?us-ascii?q?A0AtAAAlly5lmJ1dJa1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBZVJ4WyoSSIgeA4ROX4ZAggYghXqMXYskgSUDVg8BAQENAQFEBAEBhQYCh?=
 =?us-ascii?q?xECJjQJDgECAgIBAQEBAwIDAQEBAQEBAQIBAQUBAQECAQcEFAEBAQEBAQEBH?=
 =?us-ascii?q?hkFEA4nhWgNhk0BAQEDEigGAQE3AQ8CAQgOCh4QECIlAgQOJ4Jcgl8DAadVA?=
 =?us-ascii?q?YFAAoooeIE0gQGCCQEBBgQFsmwJGIEwAYgJAYoGJxuBSUSEQD6CYQKBYIZDg?=
 =?us-ascii?q?3aFPQeCVINZiwReIkdwGwMHA4EDECsHBDIbBwYJFhgVJQZRBC0kCRMSPgSBZ?=
 =?us-ascii?q?4FRCoEGPw8OEYJDIgIHNjYZS4JbCRUMNE12ECoEFBeBEQRqHxUeNxESFw0DC?=
 =?us-ascii?q?HYdAhEjPAMFAwQ0ChUNCyEFFEMDRwZKCwMCHAUDAwSBNgUPHgIQGgYOJwMDG?=
 =?us-ascii?q?U0CEBQDHh0DAwYDCzEDMIEeDFkDbB82CUIDRB1AA3g9NRQbBmedQZx7Aa52C?=
 =?us-ascii?q?oQMoWiDWwESjHKYdpg8qCUCBAIEBQIOAQEGgWM6gVtwFTuCZ1IZD44gGYNfj?=
 =?us-ascii?q?3l2OwIHCwEBAwmLSgEB?=
IronPort-PHdr: A9a23:jrwLWxdAXkjhRdfg+9Xc6mp9lGM/fYqcDmcuAtIPkblCdOGk55v9e
 RaZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NBsdA97wMmXbuWb69jsOAlP6PAtxKP7yH9vehsK22uSt8rXYYh5Dg3y2ZrYhZ
 BmzpB/a49EfmpAqar5k0wbAuHJOZ+VQyCtkJEnGmRH664b48Mto8j9bvLQq8MsobA==
IronPort-Data: A9a23:dpj6qqvN6i3QkP9g8AJBEZeC7OfnVE5eMUV32f8akzHdYApBsoF/q
 tZmKWuBb/+OajH0ctAnYdmy9RkA65bSx9EyTwBk/ypgRXgWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0rrav656yAkiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuHYzdJ5xYuajhPsvra90s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDS4pZiYJVOtzAZzsAEPgnXA9JHAatfo23hc9mcU
 7yhv7ToIesiFvWkdOjwz3C0HgkmVZCq9oMrLlCwsfCcyRz3aUDH4KVWE2Y2FL0o/9teVDQmG
 fwwcFjhbziZjO6whbm8UOQp2IIoLdLgO8UUvXQIITPxVKl9B8ucBfSRo4YFg1/chegWdRraT
 8YQbztiaAvJSxZOIVwQTpk5mY9Eg1GmKm0E+QjJ+PdfD277811R1ZfqK/zvYvulHpwJw0/Jg
 2WF1jGsav0dHIXPlWXamp62vcfLnCXmSJoKH/i0++BChFyI2ndVDw8SXFGg5/6jhSaDt8l3M
 UcY/G8lqrI/sRLtRdjmVBr+q3mB1vIBZzZOO+I61A6Lm5vO2C26VlAbaT5oWOwjieZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuO1c49cD9qicgsEFRt3jXznG0gpkmQEYs7QcZZmvWwSG6gm
 WnbxMQrr+xL1ZZj6kmtwbzQb9uRSnXhVAU54EDcWXioq10/b4++bIvu4l/ehRqhEGp7Zgfd1
 JTns5HOhAzrMX1rvHfdKAnqNOr5j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN6FwNtMYLYCX0PPcfj2eN5yICkPmI+TPNCKi8UzaySsMZmPKvpXs3PhfAgwgBbmB1yPtkU
 XtkTSpcJS9KVfs4pNZHb+wcyrQsjjsv3n/eQIuT8vhU+eT2WZJhcp9caAHmRrlgtMus+VyFm
 /4BbJHi40sED4XDjtz/rNR7waYidyZrXPgbaqV/K4a+H+aRMDh/UqCNmuJ8K9MNcmY8vr6gw
 0xRk3RwkTLXrXbGMg6NLHtkbdvSsVxX9BrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:KK8q76PZtRrJLcBcT7P255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UcssREb9expOMG7MArhHQYc2/hRAV7QZniXhILOFvAj0WKC+UyvJ8SazJ8+6U
 4OSdkCNDSdNykcsS++2njHLz9C+qjFzEnLv5aj854Fd2gDAM8QinYcNu/YKDwIeOAsP+tAKH
 Po3Ls8m9PWQwVtUi3UPAhiYwHrnay4qLvWJTQ9K1oM7g6IgTm06Lj8PSS5834lOQ9n8PMJy0
 SAtxb2yJmCnpiApyM00VW9071m3P/ajvdTDs2FjcYYbh/2jByzWYhnU7qe+BgoveCG8j8R4Z
 zxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oPb+WCkxB6N69MZkm1rimg0dVeNHof
 t2NlGixsJq5NT77X/ADu3zJldXf4yP0CAfeKAo/iFiuMAlGcxsRMQkjTZo+dE7bWDHAERNKp
 gwMCkaj8wmLW+yfjTXuHJiz8erWWl2FhCaQlIassjQyDROmmtlpnFoifD3s01wv67VcaM0rd
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzaVwqSHr4kd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXDmy91Y5ZJ+prrgLYCbfRGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/0FYNAz2TFKtFvwLklIYQoU/oAKiSzS5jwW/nXX8TgAYHuGIY=
X-Talos-CUID: 9a23:Wv61P28165Y8xz07fS6Vv0EUJs8jI0zH91zzc3enLmZAeI2QdHbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AycC1mAwdbvWLJN3V8wxC6u2JHHeaqJv/KEUilo4?=
 =?us-ascii?q?ggdGjGncpZ2qU3RGwAaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 14:21:07 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 39HEL6Wt008582
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 14:21:06 GMT
X-CSE-ConnectionGUID: tfJpBOipQKSVv8/3Kimb8Q==
X-CSE-MsgGUID: 2CH32QnOQ165c4yWxazKUQ==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.03,232,1694736000"; 
   d="scan'208";a="5044469"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 14:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gdq2bOP92J4vYyrz18fOtqxQWwwvdedWwmhXE5pGzga7QZpjMnpVaVQBWexN2/EZZehr6IWFB/nac1Kd5QQAQBJJTvLCDHg0SWvsma8sOWsIPnWJzLZy59HVjRlloE1Zvv1SOvKpCod1DLsXRPTHO/5uIWB4OUuxhH1dbSXDfQYFdI/qtHTHM2MzvA0A9kzVHUoOYnvHvg7MiMQC7IEXVDjO4alAhIERfzeTN4DcJPN/SyJbLoB0pF0mOmCy4DInnbG1eaDk99zDkEXzQRTlUEd1nYZUre6vIPVxNjPzQH6NZIA8cvEJVtxA4wwKUfEr/6gd2AGy5O6HwJiiq4J9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aAWebvPEcDpKtjwQ/nVVboltxcJGpq7ZDfeNGcav3g=;
 b=QaHRgmWFKkeQR1K/7p6W3HWKF+4qPz8IewG0ti9mWMn9isVdlOtW5vPIHGw+PQN53gsDsdZvKaWH+E0PUbWU/u6dM7PCDdwZjzhXLFJz7QmRUucFlznfc01+7+uYXTEg3fmjaG87/zqRpWjaHaxXM4E1AYoC60rxTYizW9l4BuYfbvJeOxI7VCcKRwQB05uY2tUAXN3DknefjvKxdGR+EV/zy3+nSFUl9Rp3GkA3Z/CMlW7kkROtR9BNQtyIBTiUHVAKLc5KiP6ifyKjz/MEFYCZwVtDcYN2a6AXCHqRPAoBI6VD66BgQSJPp2A2hR4BYCWYH3EgQ4d799mezBTB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aAWebvPEcDpKtjwQ/nVVboltxcJGpq7ZDfeNGcav3g=;
 b=dE+CC7p4L/bUj3nlL2sbiO1Is0tCqesCjljp4vLrq2ch0Yi3nPFMuVryw2Pm2nzBSTHFxY5TRszMbB3ZU5hs2oX+urSSklCdTvK+gWV4d8G89la3Hl1uMylNlxwtLERLPBIau5FWDRWdcGvqN7bpdLYRTexh/Q2WPjjk51QxbXM=
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 14:21:00 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::b8f8:71:8478:2d51]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::b8f8:71:8478:2d51%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 14:21:00 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Subject: Re: [PATCH 1/4] add generic builtin command line
Thread-Topic: [PATCH 1/4] add generic builtin command line
Thread-Index: AQHZcUkOD6ppc7o7REqMkKuIthkl5Q==
Date: Tue, 17 Oct 2023 14:21:00 +0000
Message-ID: <ZS6YIjZznHMojNLO@goliath>
References: <20230417162415.GF1391488@zorba>
 <4c420081-fe57-d036-ded7-2899c13738ee@quicinc.com>
In-Reply-To: <4c420081-fe57-d036-ded7-2899c13738ee@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|PH7PR11MB6859:EE_
x-ms-office365-filtering-correlation-id: 785d98e9-1200-4c43-d199-08dbcf1c49e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7+S+6f3sK9SWw+zpkBElQVK0TD7OQ+ebTv2H3QDynCnLPiHPy2KXav87IIB3H+EhMsYvKc3MNATemJxfQqORcVxMbpOliSwhAYv/AfqmXmU9qOrWqhIStb+VTfAMreGgK79cRAuA03ijGtj4hg+7XjMAvJxIWKU89CxZqhlpkotRU9HYun5LvyM1dTCxwXdif1DnMdZboqAlonj5LnNq/lYI9ARm7QdBLMxF2K20VmxNVhFfPU1/eG080YrQP7zikEtfi9HYk431w8/aKGFaw6XAdscutAMSoHXi8RVkmieP1JWYbmS9L0Y25gbZcf29iQHMzShjISdEMNAbZb1SCCkxneppMDhjA15a2umrsGwzuykYsxfT/prkfUUvopA6Yys/fYWv0XDJLvbfYNZuYizj3VqMRx14ffuWd8+JFk4Dhq4LQmYLg2Fth6KWsPk8ANiSCD+fWSd3bRvo2CkdfefHrZT7J+idvHcG/eZ+sW6wdtt7Yle16JhojqptN/fi7KjH9goV1Gpo1/YCPcuc6S0LhjFn09A+49TipgOGUNlS51UKYqgpnG/d/1+Ztejf5YXWmK6BVgUZtLvXy2FUQfs8673fJSfVI/JGIImPu4IlATOpdxXFdBssO+HwSiaTClNjvmzV/nCQsRu7/o0clQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(122000001)(33716001)(316002)(6916009)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(26005)(76116006)(71200400001)(6506007)(478600001)(6486002)(38070700005)(9686003)(6512007)(5660300002)(41300700001)(86362001)(7416002)(2906002)(4744005)(83380400001)(4326008)(8676002)(8936002)(38100700002)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?NdjEyNsNGxA/3hf9Iz+NuOFTC17RnTPudrU3BRbMo6eXbvLWMZM83Fn+aaKK?=
 =?us-ascii?Q?GPdgBJdmhjqkG0muoxCLZA36z8iir9ehV7WKYvy+ZYxRdXpd1VeCbU4JzxyW?=
 =?us-ascii?Q?h4ImCdc8yrCEI0X1MGDSqICEkyHKroM63flBB9Jm0xL/Oo2gSvLIQk4rJe0M?=
 =?us-ascii?Q?Eo8qshB5xr/msGOQ/JfZlOzJ0mt0IFwCeArEoOx5m8zkk0RNUWIeIt7CC3CK?=
 =?us-ascii?Q?v1zTLZvFlpQgZq0Ipre/dnDYw0ywA3xu5Uf0Ck3lJbqe3ny/kELQLRcLKSFN?=
 =?us-ascii?Q?uPYxQ/tYRqEq+vB163z57Ds5xPUAzoMdKF8E6Xm1gT527wODlWhzYY3ebmO0?=
 =?us-ascii?Q?7Mq9I8syPSUAifzRNBKfXgXtXPPdJKO6Un31KXN+bbkwJGyzWxZJjDu8xIyV?=
 =?us-ascii?Q?yVpESCrrdbTlaKgdbCa6pghm6Fay3bYVLWsO8Hf1DcU7e9RGaVc0DI6KxmKn?=
 =?us-ascii?Q?I8CHWaB9p1d3D76oPYFLPQ5VWKR15Xcr20CZkUrzAORyCvf+kyR9BgUOvl+L?=
 =?us-ascii?Q?xXXKdf2fJEQKu8YyBL1EdQJvxzzuf7iIU/09qbgqMZNJTmGpNtS+fAy9Yg73?=
 =?us-ascii?Q?qswoaeeJps2kNhdhuR9gsLITc/D6kqHQBd3oiKduoCYW639nXqhjWgFfWm0Q?=
 =?us-ascii?Q?ItkTCFNMCcxvENLB0ODaTWPLqG4Qvxj3Ud21hNzer0qgqdAkqXkbDAMY/6N2?=
 =?us-ascii?Q?EB30o2AZKwo4xTnYJ7ekKIi5pOyPFH2MxuVafn9Rf6roTIaFrSzr4oE1KHRk?=
 =?us-ascii?Q?kVqZMjr7ZFshWiqV63qs7DupC9EPV+MP5AfDMXzJiGgD8mWKMUKPBMuZwSYA?=
 =?us-ascii?Q?o7M9Iez76/byuqj50/I0+xj6FrdZbi4Nhj4BeEWyJWJ/YaR/Gm41i4k6jCE/?=
 =?us-ascii?Q?weLwdMrY0d4UfyzeG50QqE40vs+RVnrCpwFVEiHMuweaQIQgLQac3vVA2ZV9?=
 =?us-ascii?Q?dvLUXsgUxwtZwGJP2bqVq0QGnxpaUrlbNp+emhJopUJcSmWcCpgQQk6gIzmm?=
 =?us-ascii?Q?oAuKbgnXw8NFXMhnWdUiEn33Yf3GY9EP6uvI3+swrV7CtPC31JunzvkYTJvJ?=
 =?us-ascii?Q?+YbFI6+MSqQLAs/x0njcxPa2zyisGAz60pwNAr72SQHmW0NwDn6xrhbwPwXj?=
 =?us-ascii?Q?qZ8Tp6P0QykLdViW/lcmorN0ptdn31RvidgbA0HZiKNTX2cTeli+nYcoIGhv?=
 =?us-ascii?Q?yPLC7C9oevsWpZu8be7po8kQXrXLMUi1VAreKGp2eWgSMcMjqtP5o6xQDpy8?=
 =?us-ascii?Q?RiBZW/ivH935E7xanjPWeCwKBDmhGxPJ9Yp5rf0AorzYaDHecMfScf5z+YQP?=
 =?us-ascii?Q?05huRFbIDDCq09P+XRMzaVpyWHeMVKudtIkF1L4E/PoPUkOtJoCoUYGFWhE5?=
 =?us-ascii?Q?+2lnFyhLkBXG7LkU8XvZM4FLYSZ75mQSyzI4YgNtxWzfktdmNOmZ8XpDv+pa?=
 =?us-ascii?Q?wv+wK9gSQswgwrT6WjbgSJCSNpKCX7B5Wnif++g603/qPoBsk0NB7Dt/kg7/?=
 =?us-ascii?Q?+ihGuYZMuv1kQcWQv4TITpf6lc3Jer8uP2WWh/+AYXrpW/1CHSFiEunzg28W?=
 =?us-ascii?Q?EjTiyGxUU65w/DWAh3GzEs8glO3ecpEZx8WLuwYR?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38490A7D2F951C49A843CF2C73A85C03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785d98e9-1200-4c43-d199-08dbcf1c49e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 14:21:00.8698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFrNWFKQglYX0DsvdEcv5MUCviYzcSjIh+LzQbaFgEGH2621vQzwm2UPthZgBBeU07F9DdZOw05iLqpIaSIl4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
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
Cc: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, Pavan Kondeti <quic_pkondeti@quicinc.com>, "tomas.mudrunka@gmail.com" <tomas.mudrunka@gmail.com>, "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "quic_guptap@quicinc.com" <quic_guptap@quicinc.com>, "maksym.kokhan@globallogic.com" <maksym.kokhan@globallogic.com>, "dwalker@fifo99.com" <dwalker@fifo99.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 17, 2023 at 04:10:42PM +0530, Pratyush Brahma wrote:
> For such a usecase, the CONFIG_CMDLINE_PREPEND seems to be quite useful a=
s
> it would help to stitch bootloader
> and the desired build variant's configs together. Can you please help to
> merge this patch?

Yes, your at least the second person that's asked for it, and it's been on =
my
list for some time to release again. I'll try to release it as soon as poss=
ible.

Daniel=
