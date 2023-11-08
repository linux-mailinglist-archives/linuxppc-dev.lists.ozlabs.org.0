Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E91457E5B2A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 17:27:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=FpBliJyH;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=lSv2YE0Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQVqX69kCz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 03:27:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=FpBliJyH;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=lSv2YE0Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.142.93; helo=alln-iport-6.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 124 seconds by postgrey-1.37 at boromir; Thu, 09 Nov 2023 03:26:45 AEDT
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQVpY3mynz3cQH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 03:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=544; q=dns/txt; s=iport;
  t=1699460805; x=1700670405;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7wKJeoPXSn2vezcjQ2TVGJ3jhp/1RiGpcrLulXzpIWA=;
  b=FpBliJyHulK7fh+xohyCrM1nY8uN1dY21Za7ehmAwainPyijuO4EfgzY
   MR+k1dimL/xY4qVblQ2aKXUaxUG9sOV2kPf0XCwH4s+pCDSyUPVaZl38G
   prBN1DCNEcTz2xnYvSAbO8UuGMrAdlgA4qBIyxLnAC9rJ5KmGS+O0qNah
   U=;
X-CSE-ConnectionGUID: O+L3E10FT2KFQEmWMNacZg==
X-CSE-MsgGUID: ZlBqgR0PRhCpvHfymMRgCw==
X-IPAS-Result: =?us-ascii?q?A0ChCQAitUtlmJJdJa1aHgEBCxIMQCWBHwuBZ1J4WyoSS?=
 =?us-ascii?q?IgeA4UthkCCJYV6jEMciyWBJQNWDwEBAQ0BAUQEAQGFBgKHJgImNAkOAQICA?=
 =?us-ascii?q?gEBAQEDAgMBAQEBAQEBAgEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaA2GT?=
 =?us-ascii?q?QEBAQMSKAYBATcBDwIBCBgeEBAiJQIEDieCXIJfAwGfawGBQAKKKHiBNIEBg?=
 =?us-ascii?q?gkBAQYEBbJtCRiBMIgKAYoHJxuBSUSEPz6CYQKBYIZDiG08AwSCVIJ2XY0wX?=
 =?us-ascii?q?iJHcBsDBwN/ECsHBDAbBwYJFBgVIwZRBCgkCRMSPgSBYoFRCn8/Dw4Rgj0iA?=
 =?us-ascii?q?gc2NhlIglsVDDVKdhAqBBQXgRIEahsVHjcREhcNAwh0HQIRIzwDBQMEMwoSD?=
 =?us-ascii?q?QshBRRCA0IGSQsDAhoFAwMEgTYFDR4CEBoGDScDAxNNAhAUAx4dAwMGAwsxA?=
 =?us-ascii?q?zCBGQxRA2wfNgk8DwwfAjkNJygCNU8KBRICFgMnMgNEHUADeD01FBsGZ7wjA?=
 =?us-ascii?q?a58CoQMoWmDW6YTmD6oKAIEAgQFAg4BAQaBYzqBW3AVgyJSGQ+OIBmDX495d?=
 =?us-ascii?q?jsCBwsBAQMJi0oBAQ?=
IronPort-PHdr: A9a23:xWjeAxYiMHCo7w6BdJmkTFD/LTDhhN3EVzX9orIuj7ZIN6O78IunY
 ArU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+YgBOAMirX1TJuTWp6CIKXBD2NA57POPwT4LbicW60/+705bSeA5PwjG6ZOA6I
 BC/tw6ErsANmsMiMvMo1xLTq31UeuJbjW9pPgeVmBDxp4+8qZVi6C9X/fkm8qZ9
IronPort-Data: A9a23:VDbOlKJybqwuNaXKFE+R9JUlxSXFcZb7ZxGr2PjKsXjdYENS3zJSy
 WUYDGmAPP7bZmD0KtkkPoiw9UpSsJLXy9cxTVcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcYZsCCea/0/xWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVvW0
 T/Oi5eHYgT8gmYkajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFYoF3OTqeCCRjZaw4XTrdkTJ5fxlPk5jaOX0+s4vaY1P3
 eYTJDZIZReZiqfvmPSwS/JngYIoK8yD0IE34y47i2qGS6d9B8mfHc0m5vcAtNs0rsxHG/fTY
 9UQQTFudx/HJRZIPz/7DbpnzLn22yinKWMwRFS9l64d+mfplDRL0JP1Lvrba9mvf8p+gRPNz
 o7B1z2pXk5FXDCF8hKB83SxlvfXlmb3VZw6ELyj6uUsh0+Xz2YIThoMWjOGTeKRkEWyXZdUL
 FYZv3N266Mz70esCNL6WnVUvUJooDY7GP4LPrRixj3X6YTtzgOmI04NRQxOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yltyhW7tUcTyBTJSDRLoXTfp8PG4/95u1kOnosJLVf/q3oesSFkc1
 hjT9HBm74j/m/LnwElSwLwqqyinqp6MRQkv60COBiSu7xhyY8iuYInABbnnARRoct/xorqp5
 SVsdy2iAAYmUcrleMulG7RlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG4M
 RSD4FMNtMYNYRNGiJObharvUqzGKoC+TbzYugz8MrKin7AoLlbcpXEyDaJu9zq1wBZEfV4D1
 WezKJbwUily5VVPxzutTOBVyq4w2i073gvuqWPTkXyaPU6lTCfNE98taQLWBshgtf/siFuOq
 b53aZDVoyizpcWjOEE7B6ZJcwBTRZX6bLirw/FqmhmreFQ5RTpxVqOOmtvMueVNxsxoqwsBx
 VnkMmdww1vkjnqBIgKPAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:SoudYa1iILpNS0UzaI1vrAqjBcBxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6KG90cm7LU819fZOkPAs1S/LZnimhILaFvAT0WKE+UyhJ8SezJ8S6U
 4ESdkdNDSeNykGsS+X2njeLz9k+qj4zEnKv5ac854Od3AXV0gI1W4QYWjrdzwTeOAFP+tHKH
 P23Ls+m9PUQwVsUi3NPAh/YwGsnaysqHvOW291OzcXrCO1oXeD7rn8HxKE3hEYfQ9u7N4Zm1
 TtokjS3Inml+u05CP9+gbogqi+nuGP9vJzQOi3zuQFIDTljQilIK57XaeZgTwzqOazrH43jd
 jluX4bToFOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCvBGmZlSfnLimg4dVZBHoe
 V2NlCixsNq5CD77XzADh/zJkpXf3+P0DwfeCgo/iZiuMUlGeJsRMckjTBo+d87bVfHAcYcYa
 tT5AW23ocITbtcBEqp4lVH0ZiiWG8+EQyBRVVHssuJ0yJOlHQ81EcAwtcD901wua7VZqM0rN
 gsCJ4Y3o1mX4sTd+ZwFe0BScy4BijERg/NKnubJRDiGLscM3zAppbr6PFtjdvaN6Ag3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79xyu6H6RrDsLSqfIWpe3/eIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20nkV5xbORAlIYUoUxYAKhuzS+7wW/vXX7bgAYLuzZLWYEEZZl8=
X-Talos-CUID: 9a23:i8xAgm/ldDAeeplSFp6Vv2lXPpsIKyXz8C3zDXaVDFlMbrSee1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A/jXBBAxyZk/AK7c8mBI4ZfeIBVeaqJaqIlkCq80?=
 =?us-ascii?q?+gcmvLTJQNSaYqQ64aZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 16:23:31 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 3A8GNVE8011337
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Nov 2023 16:23:31 GMT
X-CSE-ConnectionGUID: bL9gLLzSROqQaxzl/LzbHw==
X-CSE-MsgGUID: HtHzsQi/RvGh9NpV1J6z+w==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.03,286,1694736000"; 
   d="scan'208";a="7563186"
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
  by alln-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 16:23:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdaXcOQuMm9zz33nX2pSgOWGsMCnzuWRl47sTWh/he+6DchNy3htTeWHVvIetQekSeXHoBxR2i5M650+kZgB6qPxBNIA5ZsMN5KNyuyrJuG5RamyTxL9AsbhMFwPQszeyc65BfMLIYq8N6+MAX2Jh9Izm5/KRqHllcHtYfnfYLx82yixukA+lq8+Yxu5mZtnhpMoETDAoGzVYZFxP3+Y0qP4+6VCWkc366aMkGMr7I1UdNzN/3moY85xc17+dp2Xu6YdXdcfTM40n7Uw7/UxW7O84KYVk2c5dt/W60Fq7gw2TVW5LgiLniJ5jMYTqu0ETzESZlzt77TXKfYRxqiFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wKJeoPXSn2vezcjQ2TVGJ3jhp/1RiGpcrLulXzpIWA=;
 b=TcJfM9BvTvtgQE1KM8eDuZObXl02Q9nrm5HSDBAeYWpqjyxrqZXMfCWmveYjfyZg4h4g4wGzgpX3G9KoTh8EWuiP/ISwAx9HUUVksVyRc+KZXxkh6oDSuzGP/aJtdGhem+g1hIGBBSBHY6+6Zg9ZbFXmmjR0JkmEXrsdlfPVez02KJLWP85ig74yCeT5oZWk2/GygAJ1MXv6G8/JQCLj8atsVa4coWWXEngTHP60qYynWVXM1K9hLZVISZQtpEiZqXZ3S+vPUvNcxVaCbBGglBSsHlVsHSJtnJQVy8bnKLi8fevDQWYzFICar5xqWbDONw8E8/F+kqMOIjxkCKrpuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wKJeoPXSn2vezcjQ2TVGJ3jhp/1RiGpcrLulXzpIWA=;
 b=lSv2YE0ZoNxtz1EwHSvTF1rMNvHjF3fyOobinc3q2v7Htbdlt2ayBMvRXksh3dUxXLCPYEEvJx4j+rGuNvYsdLGUkY8E488oTMQaaFrMKvNKNUZioYOCBX2ti4VzsUQpNmBEcGy+WDXA/C+n8LeHDykq+ib+UcURjjLOtw9vBho=
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:23:28 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8%6]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 16:23:28 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/4] add generic builtin command line
Thread-Topic: [PATCH 1/4] add generic builtin command line
Thread-Index: AQHZcUkOD6ppc7o7REqMkKuIthkl5Q==
Date: Wed, 8 Nov 2023 16:23:28 +0000
Message-ID: <ZUu1/xduF2lxWOmD@goliath>
References: <20230417162415.GF1391488@zorba>
 <4c420081-fe57-d036-ded7-2899c13738ee@quicinc.com>
 <3d127abf-abdc-02e3-7c8b-a39b901ea641@csgroup.eu>
In-Reply-To: <3d127abf-abdc-02e3-7c8b-a39b901ea641@csgroup.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|SA1PR11MB5947:EE_
x-ms-office365-filtering-correlation-id: 967736de-f3e4-49fa-92b6-08dbe0770ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  t/cyji4kZ7/Oge6h8JqRZhWRFVKmbWf3aTi0ufDceYe7dsjLfxwKjJ7k/3shTR/qjSFku/7DSgk+TZkvWrEmaoBa4q3Cwd803jzkf9j9uSILWkWRIY3dSXm1ow/eKadgdFZKuVYF9wow/6bBMzbKXsUBGb4/OWYuBVBQ2K7xWx4YkbjHV3tTTDZ4mYDHdFBvd/qwvWuqczAzmGabkFeD2BdDVDFgAuPeA8dF90woiU12MQzdS5NhXJnK1PpbtKm2WJBXzl/KbCsy1uYYCrdJ8gDHAVT1RI7PD1XAJIDdtrEfTJj90WmmQky6aHzf0a4TAJsMN53LjjEi1ao/5qRe+ziFfC1hAkwaN1HhVY94RhcpSpk/qNz+EBIPaXxcJXfmzkyi1WBHZBUcxWfDzrge00CSYxae+6bhst1QfdYbV+GvjeReTcF57sV//l8w+4qmkX5MyiSjOT4+1plO4N7ky22smLaKXpWUmwaXV6m3G7S9tDb57GzAvpRSm/hohpI5l7ZbJ+tQJ789Ecn/w+XQp0UVeOiqm35mWnaNrWsxh0JaoDy7U15Wb2ruBWPcAvhlCIhItqp9ekh3FOG3ek93NHZcIQ/lSv4fs9CTCpAqlQHoQDt6H7YlLMYN0B1GV3caVeYs1b+NwU1cyIuTr3TNsw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(33716001)(122000001)(38070700009)(76116006)(83380400001)(66946007)(26005)(71200400001)(6506007)(478600001)(66556008)(6486002)(9686003)(6512007)(2906002)(8676002)(8936002)(4326008)(41300700001)(6862004)(38100700002)(5660300002)(4744005)(86362001)(316002)(7416002)(66476007)(64756008)(54906003)(66446008)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?SNTVO72Y4h/r14meuGBI+howSVDRV7ppyluR35Dle/T3FEs1CylOoAk5rxmi?=
 =?us-ascii?Q?Vab1THXPpvXlynbntbIlgQ6aMgVPRUpc9mj+gQBcCBe1+l71PAuu744F6imi?=
 =?us-ascii?Q?2ySkRCBQaB1cJdVtGiui+UO/pP3n1HU7XXGuktBe1MHxoIdrhzfbbgr1qNbd?=
 =?us-ascii?Q?EIuUKt8tzNqv3W172wOf1J7oNhLEaO45WPVuUsAKbEQF7yqpnxYhnq+WXytC?=
 =?us-ascii?Q?EfX3basHLFs6igsC7mWzYdWns4PlY0/ummCCRsXSBvZ7ypCB+VJX6DWxfVb6?=
 =?us-ascii?Q?bZfUlvHSKwezKfotpfhaJA1TaC73DIgtDIh1NiqhKXHo1Qt1WdsiD9jLvO3Y?=
 =?us-ascii?Q?/VD7n3tEdRDL2dRqTEAMTovxIvqP9V9w7raVXKQUvcf8GjM01RHkbOaIeM3D?=
 =?us-ascii?Q?xOdKRvA3LB9M2QO20wvq/je5seAU9LG/GCR1ICI1HVAINr7mJspCTS716B4e?=
 =?us-ascii?Q?xWfYfy530jsXqvuweZCTOPzDmX+agwSLMMrhbGt1Wao+fdnXQhIdS665c3VT?=
 =?us-ascii?Q?VL0M+mACw92gDVfzD64+8soBq76nRzjC4X47J4D6ilCUFC4U1e87IP2Xv1KY?=
 =?us-ascii?Q?dwrj8VHfqfTfIIAvfCyyp8n2EwTsJNLITo5yGcWV7ZwwAc1CoInaCn7vTsl5?=
 =?us-ascii?Q?3uWfpBrGimbumvnyRfeO4HjRr8w+A1jmkGX9LhAsS8rzKTNKr30FXz4NqwDT?=
 =?us-ascii?Q?E8nxajqNxR5hnzdf+KH7WUkoIqudWH58TIK6DaXuMyzhLvwn4dRnXSVDG4ta?=
 =?us-ascii?Q?D6y/dhW0k3tiABghgXI2i15fNNCqoLFZ7297pyuTpjTBI2PYtfdB0IDfyS02?=
 =?us-ascii?Q?ach6Y5PE0wMpDwsfDyiNabvF76I4VcrZNlcrnqKj+j0VA9p+He2IXWjb8rfw?=
 =?us-ascii?Q?7VxudZ7e956zRaNQVyWjxsD5V6lJ36b0uwgY2QX3XvSO8O/W6XW9vuRpqyN/?=
 =?us-ascii?Q?ObJw2NKJ2z6lbvnN/9OwWU6YSCxfFZ4Hp0TKg3Qq39hjTwfKB/jySBSX+v4u?=
 =?us-ascii?Q?DeppJ3FneftTMSKoKAezhVvOfKjN4M4El/lm87JJVYDlnUK/Vd+eMqSdxuAZ?=
 =?us-ascii?Q?kGdS/mJdBRSe0ZXVdaCpVPKnMXwCddNViaiTpxzFOtiI7BH5HPOtUzFAkLUQ?=
 =?us-ascii?Q?bQZaUWJYktQf0FHXeziX/URxWANesJUCMNw3GtwbYHarmNx/VlSibrfGxLlr?=
 =?us-ascii?Q?ADNOiI67GXhpmZB/7L+P+iixgGSi/PzTj0/D6BhZtqLx0twe9uEVaECPZUfN?=
 =?us-ascii?Q?UON34T/v/IPKIa49bYdouPbIZ7RHuJ2XmaoWQwNbXy6/G/b8t3U3grySWdx6?=
 =?us-ascii?Q?C2ngCdJyQx4/W76dA+Za7sOSStPB3sukniSxyPFEICH6LTy9OynhNsMZi7Cq?=
 =?us-ascii?Q?LboiEOWmu7FxJDiRhkbaDa8H5Oj1tl6s07IgOHicY3iYLkAiFQi85qhtBIfQ?=
 =?us-ascii?Q?wHUPeNPBzFzwrp5rqYc89+NsiPusnGW8knC/+BYG9Vc2CZxyf0q6t2n0DXWd?=
 =?us-ascii?Q?a3eRk6F07QUmGuHKIqL6/fbU8DIidfWQ8O7Wv3MIOoWHhP9Anp9jrdzty6/p?=
 =?us-ascii?Q?CdGHrs5xTnJW/3MoOS8LFcfVoKfSR0Ygi7hU2RBL?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A69696CBFFA8694B9FBF3227F37AFD19@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967736de-f3e4-49fa-92b6-08dbe0770ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 16:23:28.8180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KL7NB0g2GRQqfh6P5XMh9D1QwRXER1LrMkB7U8VQnLVBVQ9Tko3W2Gpydb66duVIlRGviasm9H4z/ahyV63y6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, "tomas.mudrunka@gmail.com" <tomas.mudrunka@gmail.com>, "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, Pratyush Brahma <quic_pbrahma@quicinc.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "quic_guptap@quicinc.com" <quic_guptap@quicinc.com>, "maksym.kokhan@globallogic.com" <maksym.kokhan@globallogic.com>, "dwalker@fifo99.com" <dwalker@fifo99.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 08, 2023 at 11:33:37AM +0000, Christophe Leroy wrote:
> As far as I remember, Daniel's proposal had some weaknesses that were=20
> never addressed. At that time I proposed an alternative series that was=20
> addressing most weaknesses, and my series was considered more mature=20
> that Daniel's one by several maintainers. But I never got enough=20
> feedback on it in order to finalise and merge it.

It does something entirely different and doesn't solve the problems .. Cert=
ain
doesn't solve my problems.

Daniel=
