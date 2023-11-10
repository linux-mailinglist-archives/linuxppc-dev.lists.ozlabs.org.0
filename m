Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A47E7795
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 03:35:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=kd8/XLJC;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=LD08jXxN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNG666Y6z3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 13:35:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=kd8/XLJC;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=LD08jXxN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRN1D3p8fz3cV4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 13:23:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3578; q=dns/txt; s=iport;
  t=1699583040; x=1700792640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=B7JYBJU6QBps/roSTVx2aQVbBc5hudjWVLDcr0R6610=;
  b=kd8/XLJC4V75Hb94pNXWAMaTyNITBZZ+tFo7aedpy1YPSYN2GaIKiILe
   NTZaIGDfSw57no+IqTC9p5agC9qPFmqZWHcxnXqXR2b7UvJgPb9/1ymro
   QleSzufvUYS/xgQex4w9nVIfAGq1W4yu7P8YYq6sFUiO7P70vv+MD23io
   4=;
X-CSE-ConnectionGUID: rA/yUPONS0+H8GhtFuuyZQ==
X-CSE-MsgGUID: eVCdmlSYS8iyZeOwmnJ7Jg==
X-IPAS-Result: =?us-ascii?q?A0BGAABDk01lmJpdJa1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBZlJ4WzxIiB4DhE5fiGMDhXqMQxyLJYElA1YPAQEBDQEBRAQBAYUGAocmA?=
 =?us-ascii?q?iY0CQ4BAgICAQEBAQMCAwEBAQEBAQECAQEFAQEBAgEHBBQBAQEBAQEBAR4ZB?=
 =?us-ascii?q?RAOJ4VoDYZFAQEBAQIBEigGAQE3AQQLAgEIDgodARAQIiUCBA4FIoJcgjwjA?=
 =?us-ascii?q?wGhXwGBQAKKKHiBNIEBggkBAQYEBbJtCYFIAYgLAYoKJxuBSUSEPz6CYQKBU?=
 =?us-ascii?q?Q+GQ4cKgh8HMoEKDAkqWYNSgw+KPF0iR3AdAwcDfxArBwQtGwcGCRQYFSMGU?=
 =?us-ascii?q?QQoJAkTEj4EgWOBUQp/Pw8OEYI/IgIHNjYZSIJbFQw0SnYQKgQUF4ESBGobF?=
 =?us-ascii?q?R43ERIXDQMIdB0CESM8AwUDBDMKEg0LIQUUQgNCBkkLAwIaBQMDBIE2BQ0eA?=
 =?us-ascii?q?hAaBg0nAwMTTQIQFAMeHQMDBgMLMQMwgRkMUQNvHzYJPA8MHwI5DScoAjVXB?=
 =?us-ascii?q?RICFgMkHUUDRB1AA3g9NRQbBmehNIEggVoBDxYSgTILNZJ4gmsBrnwKhA2ha?=
 =?us-ascii?q?YNujHOZD5g/ol5LhH8CBAIEBQIOAQEGgWM6gVtwFYMiUhkPjiAMDQmDVo95d?=
 =?us-ascii?q?jsCBwsBAQMJiHCBcQEB?=
IronPort-PHdr: A9a23:VZzn2R8TwOwpAP9uWO3oyV9kXcBvk7zwOghQ7YIolPcSNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqOQNzJ+nxBYf6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:YwMCLK+aKizQdEr+m/dnDrUDmH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mMeD2iAOKnbZWenctp1PYu08U0E7cTdn4VrTAJsqyxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEzmE4E/ra+C9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4upyyHjEAX9gWUtaztMs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi6uCcAF+v1T2PI0MS+7gtgS9jx74
 I0lWZeYEW/FMkBQ8QgQe0EwLs1wAUFJ0KXuZmmCieu19BWFUyvDw+lAEVwnD7RNr46bAUkWn
 RAZACoGYhbGjOWszffgDOJtnc8kasLsOevzuFk5kmqfVqlgEMuFGviWjTNb9G9YasRmEf/YZ
 scddjNHZxXbaBoJMVASYH47tL7z2yGjL2AC9jp5o4I63UPfyQhK4YO9Mcvnd/uVQMN3wWSX8
 zeuE2PRW0FGa4P3JSC+2natgPLfhTvwHY4fCpW89+V2mxuU1GgaAgZQUkG0ycRVkWakUN5Zb
 kcT4Cdr9u459VegSZ/2WBjQTGO4UgA0QfMXAtACzye2kun0symZGkYZUy9zUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6Qnot4SxvvZ0D5ykdfOEc5oRs5D8rL+95s00qeJjp3OOvk0Y2vQGCYL
 yWi9XBm390uYdg3O7JXFG0rbhq2rZTPCwUy/AiSBSSu7xhyY8iuYInABbnnARRoct/xorqp5
 SVsdy2iAAYmUcjleMulG7VlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG4M
 RKO5V0NtMQMYBNGiJObharvUqzGKoC+TbzYugz8MrKin7AoLlbcpXEyDaJu9zqxyhZEfV4D1
 WezKJbwUily5VVPxzutTOBVyq4w2i073gvuqWPTkXyaPU6lTCfNE98taQLWBshgtfPsiFuOq
 b53aZDVoyizpcWjOEE7B6ZJcwBTRZX6bLirw/Fqmhmre1E2QD1xVK+NkdvMueVNxsxoqwsBx
 VnkMmdww1vkjnqBIgKPAk2Popu1NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:XAbKV6xdaa8pyL/WExEFKrPxUOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ6OxoWJPtfZvdnaQFmLX4pd+ZLUfbURiTXfFfBOzZsnzd8kzFh6FgPM
 JbAspD4bLLfCVHZKrBkW6F+pMbsae6GcOT9KfjJhVWPH1Xgshbhm8TZHf/YylLrUt9dOUE/f
 Gnl7J6Tk+bCA4qh7OAdwI4tob41rv2vaOjSyQrQzQg7w6Dhy6p7rnVLzi0ty11bxp/hZ0Z3S
 zgiQLW2oWP2svX9vbb7QDuxqUTvOGk5spIBcSKhMRQAC7rkByUaINoXKDHlCwpocm0gWxa0u
 XkklMFBYBe+nnRdma6rV/GwA/7ygsj7Hfk1BuxnWbjm8rkXzg3YvAxwL6xMyGpr3bIjusMlp
 6j7Fjp7qa/yimwxBgV0uK4EC2CUHDE+kbK39Rj1UC3GrFuG4O55bZvjn+9Vq1wXx4TLOscYb
 VT5Aa23ocKTXqKK3/epWVh29qqQzA6GQqHWFELvoiP3yFRh20R9TpT+CUzpAZJyHsGcegO28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOfyulke+63JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTcmDxodC/BzBSHi0GT7t1sZd7Z5kvaCUfsunDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaXDjHI5YtjeOEqW66UNuJvH9luxLLG5m+Pi7X7ECntarBMruGA==
X-Talos-CUID: =?us-ascii?q?9a23=3AUWynaGoDwiQFwhwMIBCOVZTmUdoMNWzg9FD2GBf?=
 =?us-ascii?q?7KTZGSKG7VEKBypoxxg=3D=3D?=
X-Talos-MUID: 9a23:P2btDQZkWCapueBTugHHiDRmD/ZTs6W/Ok0qjpAAmZamOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 02:22:50 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AA2MnqL025935
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 02:22:49 GMT
X-CSE-ConnectionGUID: /u25q1JGRrKLe7yy31dhbA==
X-CSE-MsgGUID: eGDr26SBToqqmWi0XZvang==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="7784892"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
  by alln-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 02:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlE2M6/zraXxJzO1WT1p5Yo2fuigjBglmBfcnUJZJpvMC94j5AugxLMC/8Qnwo9yp+Xa9xviJd0WEL1Vuz6t0M78od/TsPg25nwfRDPZ8B84djYoZDJWu6+MbaoJayNufXlBRreEhvjcFsq3mCtJzdjd7REG619hnV70SZARTyTYfasuh8MqjwGK6S2tOw6iDYcp8ymP3AXM2gDflWTGQqA2ekosgo4bYsEBQr9c270FKx5LFH3ehDoM/hjLS858YI8Rc0yeWWnexBaMX81NQongGyJrSIPqiRt4LNhH8KrU1wrzbdrlSibAP2RZKW3thk96ExhvRygxew7Zz29xFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXHlYCdqJf2Sg5u51PQkvsB2ASTaVj/Eqw/qJgZXTTQ=;
 b=J3yXeRLbSiUWGu0sr9btAZQswEFvrckp2v7Y5hdpUQK4Zq5yertaNieDk5hHavsIbtoUzGbxtS6VnZkVU/u3IjwYAu5NGThaJprhZdIZxa53UY52rGikm7J+gzrMUjRMPlrmIOBNhriRCzktVNLuBVyrOjFqwHktALPMwTpdTXDW486LrWs4iUORkGq3TzTKyNyW9E8QyTCarDRrDwZBrjEiT/lO4j8ZnTPRX++7QKeHc3WJXgqqv1Cckntr+EU6TPzlhapq3GJhmMTUKIF01PF1s0W6rOpjYf33STH2eCnZdoN//2iCORTcbjvaivKcW4pICyWFfYO/wJo66daXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXHlYCdqJf2Sg5u51PQkvsB2ASTaVj/Eqw/qJgZXTTQ=;
 b=LD08jXxNtfA3jyF/5fY8HJGVkzygQ/WoUSEIGDec56bzrw3OmBfmnv2lXS1fF4aLB2ZhiaHHS96bDKCKimm77qqhE1oZQu3YCaN9y4e8cUJdt4gfZmRL6nxDsibaCQcUT/d8h7ZUAxu22XcUrEo2AbxuON/QrS52+8TnIX+B24U=
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 02:22:27 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8%6]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 02:22:27 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/8] generic command line v6
Thread-Topic: [PATCH 0/8] generic command line v6
Thread-Index: AQHaE3y/55d8FUfbk020UwDeu5551A==
Date: Fri, 10 Nov 2023 02:22:27 +0000
Message-ID: <ZU2T3VPYosP+ZR1b@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231109175142.49428d5f51325680764663bf@linux-foundation.org>
In-Reply-To: <20231109175142.49428d5f51325680764663bf@linux-foundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|PH0PR11MB4950:EE_
x-ms-office365-filtering-correlation-id: 5b67ce5c-ba34-4985-9529-08dbe193e216
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +zhcYj6Fuoy/Qc4nMSsUL1uXCx4Z1rIeE6hRjknjaPnDYEgYsh4snetOqvLFKQmgT8G5He4CJ982A1OMXcQhOIpAwWFll6P0BzfPeoq4l5z300W9QDyo1rf9HJ/1oF/1FOAinGPWdERqxTp5Y8drw1Og0Keg19UsA6qNQwdb5qiCv/IKpS3E9EtMIkObkGaeneYildjiA5iYhecKXnQ36Z7QHILIfcln51bvuIg9R6G5rc56ESLDo5HMRdD0zPTnZm9OprzV01E1raSSrEYR9Z2Gy0RnUBVzcxE+NywbMZMVP6wPjPke8A1LY90zFPFP/4fFGLQwb0OFWf+LWKcp7QtbbJ+nr8idFERsptV3Jm6Ss0+M/YHYCNA1iIdFK7VHQ2PjJQCtj6y4ctvXIADFE9OkM1VPNShoGm/tlGnX6NtaNabQrstgZjrPXS01GVX0guq1AOONzuQV4wy7kWE16dG9fij+VdqPdB1M9s83KNU0AaeZFQVFSYkl/0rffvqm4IdDBl+xei8/Fa4IrQbZAm5YYj+ow7le6aH61y9vIWIvopkryZWLznhjgBkoAkdDqn8jtAscHRSlPGm5Cm5Ln80uPWAvcnqjEpWMhE6RgUzFaFkHvEY8pGewlxAv1mjfLO5epog8BOMghhh4LV82FBLneg095E6QkZzPTVyiwOE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(2906002)(66899024)(83380400001)(86362001)(38070700009)(33716001)(38100700002)(26005)(122000001)(71200400001)(6506007)(76116006)(4326008)(8936002)(8676002)(6512007)(9686003)(66556008)(64756008)(54906003)(41300700001)(66946007)(66446008)(316002)(478600001)(6486002)(6916009)(66476007)(5660300002)(7416002)(41533002)(67856001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?RbZZDjEqfAyAMejfoGvAQTwCxM1j/ck4InsyxTHAG0gkwne7HJkDHHEmoswy?=
 =?us-ascii?Q?JnrmrquKNaXCrBQHtdI4B7vLYD+TG4t1vSKnqBvd1JjtjxhY/TySQey1ri8L?=
 =?us-ascii?Q?moyCVGtvAtNz+EPR0+/EnONnHKcbnbb2FvGESlby8c1hDxwXvi8ZiiUTTxVv?=
 =?us-ascii?Q?kznFKPQuWAt+GTdChUoxk+F/4+iDeMGjV4Qx/qup6PsTrEpfnl5gQwRxyCqS?=
 =?us-ascii?Q?9aOuc8IAZCWeXtAVwpgYG25fNMCE+w6VBsqhlM6L9gY9S9+RcqFdsj3JhMQV?=
 =?us-ascii?Q?0S+ocLF+moER6+zHT5AVGcstlD/+Z8P67cod6q36CtGMpmBQ7jn9/UXu3Jd/?=
 =?us-ascii?Q?XF/fYIwAHSXtQ4ZlLtdbd/snQcwisYZ5uG02hcpj/4ZHSWQUpqP4PyLpRalM?=
 =?us-ascii?Q?f+Gr10KxFVsPqVF0qCic9yuAnIapJix4pKl04MKNCpE01krv5O15dLZVo6Gg?=
 =?us-ascii?Q?+T7StuWRjuZ4xWPy3p1E2hhFl3Rjs8J0KKpQjPnWTeJrv6vVx4ThZq1/2Pj6?=
 =?us-ascii?Q?j7zoD/9NjM0Tc97JEO61o6P9v+fo/cOqijNHysZxjnWMGhMS3bFtA6f67r6R?=
 =?us-ascii?Q?It2cEssc0Nu5fv5ORdW4OEgALiFoDlprlbSxQhDwdoqpx7SIjcTI1w+DHRg/?=
 =?us-ascii?Q?8y+KK/2OfNBFqeh5xTPtfC2mTXpw0UfjY6OC/51zYqCCLMT4yzKbSZEkwTbV?=
 =?us-ascii?Q?+O5Cpe1qoM63/AiWm/MQNGD11fQZNuyDOE2LLl/HKQ3iUqs5P6o1ASD5ihVy?=
 =?us-ascii?Q?uwIxCi1QMRcjrSFLrmqdLPwzg0tAM/LHsP28dyhbIdIgnJ4APGt3YbyK4X9L?=
 =?us-ascii?Q?Nk66G2Z7EohjISfpkG8bYMQ6cR6KweaWzz/ON111KKAtIAPEpr5ZPOt0HVb3?=
 =?us-ascii?Q?QDFC/l6Zpbhe1qdXdnlso7w2ixRf5RrICvS+GlOaOxRaDdV7YiYRvftsor8D?=
 =?us-ascii?Q?nLHg5P0M7+5GJbdRMMb3cUlfA3YRtT/SYPGnpxcX/ALKc3SFH7Jsr+f/3e2f?=
 =?us-ascii?Q?+EuYrwADtsKeTcJ0uajXrHJOzQ09JRxH8UdpROhimuf92lRFQ6oni3tsBMYh?=
 =?us-ascii?Q?57faWlj9wWWWCihf8UR16SkIX2rSkNGEg2Iv865DXHKfuOm1cx0MZUhtJWt5?=
 =?us-ascii?Q?uPdyLlRaKQ6FQCjwSimzgiCOI4jBIU6Y4nWFgJhJmgCQ3reitdR7xWlhTNxz?=
 =?us-ascii?Q?bNIezK+AJSL5uh1ixdLtGfm3OoUZ7ksAYE4qQbyGo+Zg3hLG3ud8yr9uefl7?=
 =?us-ascii?Q?DRBkDJ5PniWHx6Tf/wMpfL0YPBXoA3K4YDIRy0EQQ/BI87pPBWY0RascAifw?=
 =?us-ascii?Q?ppACTA4qugKbWXLSWMv3kPZC/rDOKCLb6TghyaeVgK1faiB7p+9zyVsDlcOW?=
 =?us-ascii?Q?COnwJm16gFezut+FR915jngoJcq/sT2ai4FhUtYJ5de9NYXYQNNTZO8ONc+q?=
 =?us-ascii?Q?Lmlo2e6DdqjAh25fitWq2RkdXOY3GHiNbouRMZ0boS7bRJ2KCTVVadvgRQ65?=
 =?us-ascii?Q?PdsYutWltNBBLwXgGF4NGnbNoCZ+nXzkTLkyUE1KLWxIt97IRQmAOoiIuk9C?=
 =?us-ascii?Q?GdmpDiqUmuaMZc27SNkB1qhYzJYRYOyfNupjzBcD?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3092527A105ADF46AAF5421F010E28FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b67ce5c-ba34-4985-9529-08dbe193e216
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 02:22:27.2043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KK4UR6e7pN9Me3SPGW3ogy0duaxcxJb4VhqtTqpVAHvrZyIt27moF2skLKZ+BT1Q6y+6pDStO6oEQXp2OUNRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
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
Cc: Rob Herring <robh@kernel.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Anderson <sean.anderson@seco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Pratyush Brahma <quic_pbrahma@quicinc.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 09, 2023 at 05:51:42PM -0800, Andrew Morton wrote:
> On Thu,  9 Nov 2023 17:38:04 -0800 Daniel Walker <danielwa@cisco.com> wro=
te:
>=20
> > This release is an up-rev of the v5 patches. No additional features hav=
e
> > been added. Some changes were mode to function names and some changes t=
o
> > Kconfig dependencies. Also updated the config conversion for mips.
> >=20
> > There are a number of people who have expressed interest in these
> > patches either by asking for them to be merge or testing them. If
> > people are so inclined please continue to request them to be merge
> > or to ask the status of the next release. It's helpful to motivate me t=
o
> > release them again and for the maintainers to see the interest
> > generated.
> >=20
> > These patches have been used by Cisco Systems, Inc. on millions of
> > released products to great effect. Hopefully they can be used by the
> > entire Linux eco system.
> >=20
>=20
> fyi, none of the above is suitable for a [0/N] changelog - it's all
> transitory stuff which tells readers nothing much about what the
> patchset does.
=20
I did not think about it this way. It's because I've submitted this so many
times. I guess I assume everyone knows what it is.

> And that info is sorely missed.  I can see that it's a code cleanup,
> but I'm sure Cisco wouldn't expend resources to maintain such a thing.=20
> There's something else here.

I think the prior submissions there was no cover letter, maybe I should jus=
t
achoo that entirely.

> In [1/8] I see "Even with mips and powerpc enhancement the needs of
> Cisco are not met on these platforms" and "This unified implementation
> offers the same functionality needed by Cisco on all platform which we
> enable it on".
>=20
> Well OK, what are these needs?   What functionality changes does this
> patchset offer which Cisco finds useful?  IOW, what were the
> requirements?  What's wrong with the old code and how does this
> patchset fix/enhance that?

The limitation is that you can't append and prepend to the command line at =
the
same time in any of the architectures. Having access to both allows OEMs to=
 deal
with broken bootloaders which can't easily be upgraded. Others have respond=
ed
that they also use these patches for this same reason.

In 2/8 and 3/8 I modify the insert-sys-cert tool to allow modification of t=
he
command line append and prepend after the build. This allow for an SDK
provided with a binary kernel and for the command line append/prepend to st=
ill
be modified identically to how that's done with certificates.

Making all this generic means each platform has a unified set of command li=
ne
services. Cisco uses x86/arm32/arm64/mips/powerpc , and it's nice to have a=
ll
the same features across platforms.

>=20
> I see the patchset updates nothing under Documentation/.  Should it do
> so?  Could it do so?

The only documentation is Kconfig descriptions and commit messages. I suppo=
se it
could have something under Documentation/. The only part which could use mo=
re
documentation are the changes in 2/8 and 3/8. That feature is maybe confusi=
ng
and has limitations which are maybe not clear. Although the same limitation=
 exist for
inserting certificates.

>=20
> I don't know what is the expected merge patch for this work.  I can
> grab them if no other maintainer is in the firing line.

merge patch ? Do you mean merge description ? I think your the maintainer i=
n the
firing line for this one.

Daniel=
