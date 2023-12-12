Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6480F49C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:27:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=IPjpgDeq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQYQ49nPz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.79; helo=rcdn-iport-8.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqQXS5x7Rz3brB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:27:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2994; q=dns/txt; s=iport;
  t=1702402025; x=1703611625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lcKefbUwqipuZf7j3/0KQGnDnwTO9UpSOeTCzsa59T0=;
  b=IPjpgDeqgpEhhYrqtnEbwNCZDirSFxoA1cBAyLiYr4SqDnYnfK+FUiuW
   ff8fSRvhetlqeoBnKiGLCESWZY+zLELfeHOZ9yCPC0rA1wDgL5ufeevZx
   S6eyWq+L3ESHwyk89WgdZAU47yoMRawEmfiLy4FN+dineQFQLBoPD9YT7
   k=;
X-CSE-ConnectionGUID: QWR42mpMSqing6+wPRsMKg==
X-CSE-MsgGUID: F5D5a4QlQbW058CKiik3eg==
X-IPAS-Result: =?us-ascii?q?A0AkAABclnhlmJNdJa1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBZlJ5XDxIiB4DhE5fiEodA4V6jF+LJYElA1YPAQEBDQEBRAQBAYUGAocuA?=
 =?us-ascii?q?iY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEGAQEFAQEBAgEHBBQBAQEBAQEBAR4ZB?=
 =?us-ascii?q?RAOJ4V1hkYBAQEDEig/EAIBCBgeEBAiJQIEDgUigl6CXwMBoWgBgUACiih4g?=
 =?us-ascii?q?TSBAYIVBbJ5GIEwAYgVAYogJxuBSUSEPz6EQ4ZDBIkaBzKCIYNRkR9bIkZwG?=
 =?us-ascii?q?wMHA38PKwcELRsHBgkUGBUjBlEEKCEJExJAgV6BUgp+Pw8OEYI+IgIHNjYZS?=
 =?us-ascii?q?IJaFQw0SnUQKgQUF4ERBGobEh43ERIXDQMIdB0CMjwDBQMEMwoSDQshBRRCA?=
 =?us-ascii?q?0IGSQsDAhoFAwMEgTMFDR4CEBoGDCcDAxJJAhAUAx4dAwMGAwoxAzCBGQxPA?=
 =?us-ascii?q?2wfNAk8DwwdAjkNJyMCLFYFEgIWAyQaNhEJCygDLwY4AhMMBgYJXiYWCQQnA?=
 =?us-ascii?q?wgEA1QDI30RAwQPA0QdQAN4PTUUGwZnpWUGPhyBAQKBI05kkiwcgyABrUyBO?=
 =?us-ascii?q?AqED54Hg2apdJhDoxeFGAIEAgQFAg4BAQaBYzqBW3AVgyJSGQ+OOZNYdjsCB?=
 =?us-ascii?q?wsBAQMJimEBAQ?=
IronPort-PHdr: A9a23:nXiwXR8lFJ/orP9uWO3oyV9kXcBvk7zwOghQ7YIolPcSNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqOQNzJ+nxBYf6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:7chPga3Q95Qd0lYGXvbD5dtxkn2cJEfYwER7XKvMYLTBsI5bpzwFn
 2BKD2GOP/eDYmukKdB2a4yzpk0F7JaBzdExGlc93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ1yFjmE4E71btANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXV5
 bsen+WFYAX+gmQtaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauG4ycbjG
 o4vZJnglo/o109F5uGNy94XQWVWKlLmBjViv1INM0SUbreukQRpukozHKJ0hU66EFxllfgpo
 DlGncTYpQvEosQglcxFOyS0HR2SMoV/x4Wbe32nlPeKzkvJLTjz+891KWI5aNhwFuZfWQmi9
 NQCIzwLKxuEne/zmev9Qeh3jcNlJ87uVG8dkig/lneCUrB3GtaaH/qiCdxwhF/cguhCFPDfa
 s4GYBJkbQ/LZFtEPVJ/5JcWxbrx2yWnKWYFwL6TjYRqzzXakDV16bLSaIeFUf+LRMYOk0nN8
 woq+EyiX0lFb4bAodafyVqoh+nSjTvjU8ceGaOQ8v9xnEbVwX4XARcNE1yhrpGEZlWWQdlTL
 Qkf/TAj6PFrskeqVdL6GRa/pRZooyLwRfJpLNdmsgSV75HN4gCWWCsbdgRaTf8p4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kd9UEXZNRYPlTXFcJTbp8+XeTJcPYgUjp+uP/YavhdHzXDr32
 T3P9XF4jLQIhslN3KK+lbwmv95OjsaUJuLWzlyLNo5A0u+fTNL8D2BPwQSChcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSD2QQ0Rsh9p2/8qyfLkWVsDNdWeh4B3iEsJ2aBX
 aMvkVoIjHOuFCLzMvApO9rZ5zoCl/ixS7wJqcw4nvIVP8AuL1XYlM2fTUWRxGvq2FM9ir0yP
 IzTcMCnSx4n5VdPklKLqxMm+eZznEgWnDqLLbiilkTP+eTFPha9F+xaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/rddCdglRcCVhWvgbaaV/L4a+H+avI0l4Y9f5yrI6cIsjlKNQ/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:g7WMD6vPRgLZQfBrRFlarr8H7skCCoAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tLxGHdySWVxfJZnPrfKlrbamzDH49mpO
 hdmsdFeafN5DRB/KLHCUyDYqkdKbq8geCVbIXlvgpQpGhRAskKgXYae2Om+w9NNXV77PECZe
 OhD7981kGdkAMsH7yG7xc+Lo/+TvTw5eHbSC9DLSQKrCOJijSl4qP7FR+34jcyOgkk/Z4StU
 L+v0jc/KuMj9GXoyWw64bU1ftrseqk7uEGKN2Hi8ATJDmpoB2vfp5dV7qLuy1wiP2z6X4x+e
 O84SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5fjQnEMBM7LgpNycxqnBQ+O2U4p
 g7mV5xhKAnVC8oWx6Nv+QgYisa0XZcZ0BSytL7wUYvC7f2I4Uh3bD3tHklYqvoWhiKq7zO1I
 JVfZ3hDDE8SyLGU1nJ+mZo29CiRXI1A1OPRVUDoNWc13xMkGl+1FZw/r1Uop4szuN0d3B/3Z
 WODo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E78ef2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjste+596sLvhQ6eDC1zPdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXZ1E2gXvMqMiYEX2kPdlzOrTd2j+1f4jcLeaw9AzWMyjUIbQLQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Aj1mxmGrSn9v3+KRPPeeLIMzmUfkaSCGHyW/1GFa?=
 =?us-ascii?q?5D2k3C6Ktc0S126wxxg=3D=3D?=
X-Talos-MUID: 9a23:rA31oAZt1YSe6+BTmWLA2Tg+DcNR6Zv2VRAmspQHuJKJOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 17:25:54 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 3BCHPs8b015271
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 17:25:54 GMT
X-CSE-ConnectionGUID: qcEnrU0oQVqlDKj6m+DMWw==
X-CSE-MsgGUID: /gWcXM2jQhmSlnbROAUAxA==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.04,270,1695686400"; 
   d="scan'208";a="14841524"
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
  by alln-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 17:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPNj+vIvdfT9J44rLoROZi8KI712DvfysMP2QHwAI7Ls7VmNmi6utGuRc8Q34VBu/ReN96cYokJHXmkVpMHL8CrPebPrKYbCxdTk1FRRAWSBHiDpJGS6R6RIU9BnWvzlTgzRedwdM+XOxLzS3+P5FB36vo3/T01aGT1swfkn2RHXCa1ZKr14omqJzgjDDfFq8yLC2mAxiQb3okF16lEzI01x5iZ/vZN7N0uQf7ezdzJRQyhqen7qRGZNj1YVAyOgC8tVyw1W2JNdjMM78DABxZp9dSgOrih7oM7M2P7UgBDlLn12T5VBECVoQDGfWMyMSqjRN6faLBGyNXHXQBRNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcKefbUwqipuZf7j3/0KQGnDnwTO9UpSOeTCzsa59T0=;
 b=HxxT87d+XpsI9R2YlvkPAI37i71u14mHo7DBPDawEJJTYmswGQr5MBgvcKREDXwsGjkG83fJgcZmL+M5aY+FBB2hodKUHk0fnTh+dJPUAqjgr2A4AuQaL4nzOW/YDB/Gb+oSy6NMvyB2cMcPzgKXPTK2FnHa/vnTtEhyg8ESkFsOLh/SVcbncQoo1NwIZ18rh7ls2icLlqkj6+YezQhr4WJ+N/j3ELEQzgeVz/qAOuav8cYxCWQR65LRT/AarvTvuCF5gosuia+QP/u81NwdoV/jKTaXTjXCxcfKx8KQY79gcEuTESkzoavj4vYLSaqp3axl/sRk7NT5Pjol3xepdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 17:25:50 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8%7]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 17:25:50 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 5/8] drivers: firmware: efi: libstub: enable generic
 commandline
Thread-Topic: [PATCH 5/8] drivers: firmware: efi: libstub: enable generic
 commandline
Thread-Index: AQHaLSBAuqfhbaf+SEOR4+cpctXs3A==
Date: Tue, 12 Dec 2023 17:25:50 +0000
Message-ID: <ZXiXncjsKXzW5gBE@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-6-danielwa@cisco.com>
 <CAMj1kXFK-4mbNd_4La7Jhr_+ygBVyHdJm72vh7S41TGf2FYDdQ@mail.gmail.com>
In-Reply-To:  <CAMj1kXFK-4mbNd_4La7Jhr_+ygBVyHdJm72vh7S41TGf2FYDdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|MW3PR11MB4618:EE_
x-ms-office365-filtering-correlation-id: 048a9a98-880b-48d0-50be-08dbfb3762bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qMrMaeDaZ9tF4aWb+ki2Ilm5JkEdZzoeEvbhaR0Ikv1qhDN4qInUeu+pL+Xy+7/0EF1/glDSOANV268YxjlCNVCrWElqBkiZQ0qdakdf/RdN8HIeZNY+7P9vZlhMyM0TDBrihmeV8eQNcoybLv+KmzJ95YO+I407XbBjKPAMU3IHBMGto80CaDMcujpPggMAp7e+KFYLpVm+v3ah+gU6kCQGwG+W9OMBGLQOuJ7g1OpOvldqSNgqm0UN1hTruINORO5rSR1DLKnVHtNA5b5F7dRuspCZ5+XovdOOjoh0FGouz+8yMg3tizbwmNMxrkitfTOi1Qfjwh8Yygx2A2pa4/gul3xsJJGa/LcUmQp0yGX9fPLT+toZxFJROs3KgGJxdn3Qev4tYKWYjfRHrlIK+bQgmLjVXal5+1/tKb2sGsZkxpwJgilKpy/JEjsh104rWXOweDJzf2/S/gv+zB98UfC+0Z+ea5KmdvFnAB4QjHMRi0ITuH2VUvH38PAzg409LK1cBLOKurN7QVJiqAEStGtBEXuogYGB74T5ZDFSZCQ2Oi4qAEGIvGccipAERKQPOn9H15qShBnbICW0Rr9Vvyao2EUCSogL6+Mqx9B/5aiWiwDDIDCJpbeAqPXA9yoUfx3KpVIhFNWnp+PtmaYJD/VRFfkxWTxZs3U9yM+NtvfqH7FkovupORrAB+Fp46a0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(366004)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(76116006)(6916009)(66476007)(66446008)(64756008)(54906003)(38100700002)(66556008)(86362001)(66946007)(122000001)(6506007)(6512007)(9686003)(6486002)(2906002)(316002)(71200400001)(33716001)(26005)(478600001)(8676002)(5660300002)(4326008)(8936002)(41300700001)(7416002)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?EZKS2w2hk+RJH+Frszkm5gaAVwdHP66lWztimBQH9nlIKnCbVpAiKPcBD5sY?=
 =?us-ascii?Q?O/WSkebSodvFRjCaoy5lxgy6yXC1JZbVdOBum9OZFG0pY+GWieopSPKYyuLu?=
 =?us-ascii?Q?f0I1KFpTU+nZgUn2AZjto3f3XVVesoun75FMXPJupF+fXY2WqEV2w1YRkhDm?=
 =?us-ascii?Q?nKN5FAiC/Mg7NAF8VKbk1V5zX2mh/ar3oRedWmnYUAJrfVleaqlMK5Dw9+f6?=
 =?us-ascii?Q?VaNYgWv1a3B1Q23JdL7y9G2XiIfU5I8nwuVEIzheg0PELK8Dog9qOt3AN+yB?=
 =?us-ascii?Q?vGHljBpA0twWLckcczAser512JVOt06mGTZgW70Y5VRA70Awtf5tVKb4Bk0A?=
 =?us-ascii?Q?1eGRifYqjpRRCi2YmA37KRt0pPyqEo8Wx2EO05Yl5f44O97jKsEESrB/zzH7?=
 =?us-ascii?Q?Iz1Pc+9u5xjX3GuaRktnGUOupEtEMnyhZkBm/UXnIngD2wjCR4GaGIY81dsR?=
 =?us-ascii?Q?/gwls6c96cNFQtW0ANtjb/ooWGNbwmIR2rnNREwpSxnS4ghSP9Gjg7VPYDcS?=
 =?us-ascii?Q?6vgj0caqO0BbLFXkNI5DiUglsCyjTjPkoYqJpP+1CPTsu0bOLJ/a0GOeKKj9?=
 =?us-ascii?Q?SjCC4cYzKpnNgcSPifkrIfX63sSpDVjhzo0O3Sj2zi1hO8VZjfn/T5AVdxXp?=
 =?us-ascii?Q?9G7jUncBlxFEVqWXi6RxBI6Xu+jHpu+vJs7y0YxcrqBRoyE12m3jttFeBJgP?=
 =?us-ascii?Q?34XHSnoDnVnV19r8FZwGt6uz5BU/jyl05f4IB9D+5HXpN+2RbAXbH1mududp?=
 =?us-ascii?Q?s0/Y3CjXcoDbtaSc2LeaslaoZPrjOCSMYZjq1qhumQvnzo9bqE4+sXn+2aAB?=
 =?us-ascii?Q?xt9qRrIJa1tl+v1ytOkr1leYuNn5fipLLSLkw8+t8rC276Cuv/CDNa3ypxmV?=
 =?us-ascii?Q?txbLRaLzFbkFQYATyf2ZTLfipOhOAKhzVdBC8TMoz8fUiipoobWJar6SZnfY?=
 =?us-ascii?Q?05V1AOVR3T1z5UjeLAby+5R3So/mA6kCT0m9mKxLGzUvgwGmrIDjROSYKOhp?=
 =?us-ascii?Q?tUfez+3PXzizVf7GZALLljiFdkKu0E5uu235ruCZXCyOCB9G8l+n2JTTIgFM?=
 =?us-ascii?Q?WdxYgxUNIxS7vFx1Ygv7QbVM+n9gStgsL5Cig7QaNqpxwcE4ipi+nEAdqFOY?=
 =?us-ascii?Q?kpeoRSx7ou3p4NuAMQIhyouF/aLBwWu42esp258SVdrTxELPs61Je6T4zdui?=
 =?us-ascii?Q?1W690RuAgMf6FTx+X7d3kS9fmihSkuX7AVg8siSOpx1br6mPZe9aM9pGReIS?=
 =?us-ascii?Q?EhCO9Ne54I/sn7arJEquutgI0UFQFgOHho+ku47p+jc9Hrr9aGqCidkqkR8a?=
 =?us-ascii?Q?CwhRnVKHaK9WIQ4J+vdshwtYIN7lidIjMeLwh9PWKfS8fsfEkDuv9DzGb2aA?=
 =?us-ascii?Q?qsgHg0eUNGWNWeT+b4gyzovzvWPvNKCTszfS4+od1Ff2x0HLWkUJNuEgk+CT?=
 =?us-ascii?Q?bF6KuHWuDt+b3tFRKNu10hdV3CgY/xBh3IYwWVRAAS7w4JlfDbAzh+QK9iGR?=
 =?us-ascii?Q?WVv9yza3r6mNPS66Cs3hyN2susV3J0BtUVzDgQCYMBReEnyUgYz0DH6l5BUT?=
 =?us-ascii?Q?fCVGmWIeuARfjswXMZ+J6l+rm+8JXQJ0yH+K/wM5oeowMD4RWCDMhUS0kzd2?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9434A757E35DFD469727C9A2E56E9DF6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048a9a98-880b-48d0-50be-08dbfb3762bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 17:25:50.1225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DDfM2VINTaKzaPj8ZIaG50cGJMgK67yN/wzKtuiXCP+MrVKl8Tas+pB54ZLGoOt2W+dDKBPxJVzGbkFazBZpUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
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
Cc: Rob Herring <robh@kernel.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Sean Anderson <sean.anderson@seco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 12, 2023 at 10:55:33AM +0100, Ard Biesheuvel wrote:
> On Fri, 10 Nov 2023 at 02:39, Daniel Walker <danielwa@cisco.com> wrote:
> >
> > This adds code to handle the generic command line changes.
> > The efi code appears that it doesn't benefit as much from this design
> > as it could.
> >
> > For example, if you had a prepend command line with "nokaslr" then
> > you might be helpful to re-enable it in the boot loader or dts,
> > but there appears to be no way to re-enable kaslr or some of the
> > other options.
> >
> > The efi command line handling is incorrect. x86 and arm have an append
> > system however the efi code prepends the command line.
> >
> > For example, you could have a non-upgradable bios which sends
> >
> > efi=3Ddisable_early_pci_dma
> >
> > This hypothetically could have been set because early pci dma caused
> > issues on early versions of the product.
> >
> > Then later the early pci dma was made to work and the company desired
> > to start using it. To override the bios you could set the CONFIG_CMDLIN=
E
> > to,
> >
> > efi=3Dno_disable_early_pci_dma
> >
> > then parsing would normally start with the bios command line, then move
> > to the CONFIG_CMDLINE and you would end up with early pci dma turned on=
.
> >
> > however, current efi code keeps early pci dma off because the bios
> > arguments always override the built in.
> >
> > Per my reading this is different from the main body of x86, arm, and
> > arm64.
> >
> > The generic command line provides both append and prepend, so it
> > alleviates this issue if it's used. However not all architectures use
> > it.
> >
> > It would be desirable to allow the efi stub to have it's builtin comman=
d
> > line to be modified after compile, but I don't see a feasible way to do
> > that currently.
> >
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
>=20
> There are quite some 'might be's and 'hypothetical's in this commit log.
>=20
> Is there an actual use case that you are addressing here? Without
> that, this looks like unnecessary churn to me, tbh.
>=20
> Note that this code executes in the context of platform firmware,
> which may be old and buggy so we should be cautious about making
> unnecessary changes here.

It's been a while since I wrote this patch description, but there is an exa=
mple I
provided in the description. If you intend to enable early pci dma the comm=
and
line parsing may still disable it because of how the parsing works inside t=
he
efi stub. There is an implementation difference between the efi stub and th=
e
architectures which results in this problem. This was not an issue I observ=
ed in
the wild, it was the results of code review of the efi stub.

Maybe the greater issue is that the efi stub seems to have connected itself=
 to
the kernels command line system. If the kernel changes then EFI stub must a=
lso
change.

Daniel=
