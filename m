Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A06B7BF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 16:31:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb0x52xhkz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 02:31:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ncr.com header.i=@ncr.com header.a=rsa-sha256 header.s=pod1119 header.b=0X7jYTL+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ncr.com (client-ip=148.163.152.55; helo=mx0b-00209e01.pphosted.com; envelope-from=prvs=04369af551=niall.leonard@ncr.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ncr.com header.i=@ncr.com header.a=rsa-sha256 header.s=pod1119 header.b=0X7jYTL+;
	dkim-atps=neutral
X-Greylist: delayed 10778 seconds by postgrey-1.36 at boromir; Mon, 13 Mar 2023 22:53:16 AEDT
Received: from mx0b-00209e01.pphosted.com (mx0b-00209e01.pphosted.com [148.163.152.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZw5m0ZyGz3bZj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 22:53:12 +1100 (AEDT)
Received: from pps.filterd (m0115756.ppops.net [127.0.0.1])
	by mx0b-00209e01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32D6Z5uN022185;
	Mon, 13 Mar 2023 04:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ncr.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pod1119;
 bh=66JyPpTBRuvs5/uq7CNBca0qZQvvFAeNRQQhfwMAPzY=;
 b=0X7jYTL+f86urnqolfdhVdSpZBwMhwpVheLvfcrnhKrzIE7PK5g72abWNCsxT7VXF2W9
 mAPJjJ2vXHi9ibJVO91m9mu2PN4R4XP3Z82w5RBAZzx8uhBB2TVAAXZnC6cPLOGspQJq
 PK1b1aJCY7k+zqVI0bty/KS7v6PvE3MLjJPmhjUVj8BRC/HJKNLl5/wasbIewmCR6PY9
 r0LWShGskpVG+LNTlyXKIZjoUQMDt41U/dxHoYOjKWfklbySTg+LxCp+LGpG44ax/sUI
 UhdCqzeIJxV1GT2sLWUsmGBiIGfDJziTVPpuICAgplC2L84bBPz7XjD393uH+MCEw/a/ iA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0b-00209e01.pphosted.com (PPS) with ESMTPS id 3p8nep4pke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 04:53:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GO/ciR5AVoYPDXTQEQdatnZ4k0cb+03XEDndaDa/2mxtTVLr1yYPCaTvJ44/SVfR4jYSco3rYk+FHeVLPOLfVlqYL/lU0Az1CK5vXxiGu0hSrNnk2/n/5CvUeKRMU25aL0/ApjrILUUk1vHeWDY2X/q4KBfpbkqHwkyzetX0EmNvdyUJz9CYudyQBA+S4zhonP1DjSzqRN3qC763IyV3RH2OE2HJ7wMquBUIWmboH5Fw6hBj41lcpc40gIsVEc2u63+7L3ZX1pr4enQYzv3E7hAKs77RQcTXH74w91rltD8EcID17KsIaQndvWy+ykSfkCuZ3RxWqEZo7Ex5iz896g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66JyPpTBRuvs5/uq7CNBca0qZQvvFAeNRQQhfwMAPzY=;
 b=i8NnwkK8kgwNBSq4ryQRKl+croQ07ZLlJTxbYlcdsFl88F2Fse5hadiXNZljVYCzRIpU/blhsdD6MPyjwI/waloSFro/L2V3dy0aj1AEbklGAyVRMOvZnpc0rMCSemwBD5JsDwn5nt8iw6WVaV2hpmJAQPKzF5WAY1lzzbamHwOG9zdIM72XKwbAim8V72HKs5RvLAvaYIrEqi77jdax4OjXF7KHZS9zL/DDCYUgrAvaF3lWtSeL/mVVxPeUfwjMUWQQZiNrI05pEhEqJf9sDUAmHX/1piWMKMnpbXkQQbSwhD01Uq1yI/i+DwbxrPL9PyJMs1GdGcFt3a7w8+FAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ncr.com; dmarc=pass action=none header.from=ncr.com; dkim=pass
 header.d=ncr.com; arc=none
Received: from MW5PR15MB5218.namprd15.prod.outlook.com (2603:10b6:303:19e::18)
 by CH0PR15MB6250.namprd15.prod.outlook.com (2603:10b6:610:192::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:53:07 +0000
Received: from MW5PR15MB5218.namprd15.prod.outlook.com
 ([fe80::fb77:675c:d292:6325]) by MW5PR15MB5218.namprd15.prod.outlook.com
 ([fe80::fb77:675c:d292:6325%9]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:53:07 +0000
From: "Leonard, Niall" <Niall.Leonard@ncr.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Sean Anderson
	<sean.anderson@seco.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Thread-Topic: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Thread-Index: AQHZUQqF3ZUjIAXZmEGLQH1eU8Yjx67yLYUAgAZC2gA=
Date: Mon, 13 Mar 2023 08:53:07 +0000
Message-ID: <d26bad8d-82ea-ed18-fa3e-081ba0d5dcf6@ncr.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
 <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
 <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
 <CACRpkdaj-0dyqWdSbQbjyUed+khDLi-awgan1BnuDvuY2JBzFQ@mail.gmail.com>
In-Reply-To:  <CACRpkdaj-0dyqWdSbQbjyUed+khDLi-awgan1BnuDvuY2JBzFQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR15MB5218:EE_|CH0PR15MB6250:EE_
x-ms-office365-filtering-correlation-id: faa4f376-e86b-4ece-7631-08db23a05d78
x-from-ncr-tenant: Processed
x-pp-secret: m9yph.359rsj96jnp6w-uuxnb8thy.9r62ir35fve
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  90+z5wICjkXs9GAh4OsqYUwbMt7MXyS32a9GAtbyN0JmCVH9/HRQPsaqax+pct9KC3klKOzZ41HVHH5nYrH845OPVG2RqbzTAfIBik1w9X9c9J7UPx11CJQJeck250lMOABekXK7ZjOLHiFie4H1Sp7RqMxoP41UJRSukESDZe6pkzuSOp/LVEbWwCYOkpe74EcBoif6p7Q6Ya7TUhonwGBNXPA6cYMhWbPviDuhHMzlJa5OVqqrdw0h6NneAoyt6OWBWyb2KolFWDOwriTbFh+DosEeeyJZtqmnIaU6wL/oExicisQfZvdSMpvWL5X8mEOfqJZPrwt8GOSvVttC3wnn47mkQH3adMS6Li3IDi5knPnhSNAOwaF1Y3a2rZqA7wVpm4+bVDGRc7yiOnW1UDZ31h9PvuPfgcc2FildHE23XVegeJe5oywQCiaPWwulZOyBsDXkq0v2dt2P5Xlnv8G/JHarZdnYvRtV7SkCK7SjlVTV/ARmsvxqDgDAWHJhoImyd41A1rwENQApMcIJASu0ngjvmjn1HG60cAh2MFfe9+hUUGC93Ys5zb6wDfWlsQIUOejOYjMD5cPpY4Alia99TCJCKR5FAAI1rEx/pbrT123I9Lvi6MAluj+YIfjT6hfxpExdVMHPkFqKGlW2NMo1WACywKWtQkhjhD0oDhpN/Yty8J7uHMR6244YePj6Vhfo3PTXuKHasJLYnCaZOjCGgAPEFa4x8qaL8E2PB1v+jpjZYDj2vuJXQf5r06A5
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR15MB5218.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(2906002)(122000001)(82960400001)(31686004)(41300700001)(83380400001)(36756003)(7416002)(5660300002)(8676002)(64756008)(66946007)(66556008)(8936002)(76116006)(66446008)(4326008)(66476007)(38070700005)(91956017)(38100700002)(316002)(54906003)(86362001)(31696002)(110136005)(478600001)(186003)(2616005)(53546011)(26005)(6506007)(71200400001)(6512007)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SUFUNjA1VXovRzAvem1TMnNjZXNQeVh3VlZSN2lMWWtZZXYyb1JyOThNSVVN?=
 =?utf-8?B?TWx4L1k1Y0JUbFh1VDA0ZWI2eEhncUNmMTFYdzVXMHZDL2YyTU9Ib1NHYlVP?=
 =?utf-8?B?SGJzck1ZRlVxRk5xYjAyaHhzZGp2UFZBOGZGMTBwNmVReDFJYXJYNzM1Nkdk?=
 =?utf-8?B?Z2FUZ0Q4dkZWK1BIQ1pBZ1VNc0tFWCtXRzF3Z2U2eGpQQ0o4dXdGbHpIQ08v?=
 =?utf-8?B?Vk1tOXVuMTdNWWxiQ1NNbkRlMTZYdGVkUHhrQ041MG9hL0l4QjI4QjhzSDlQ?=
 =?utf-8?B?MTNZemN4Ny9zYnBVeXFqQ2wvaG96L3ZnVS9tUS9jWFo2dk4vTnQvU0JGdGVU?=
 =?utf-8?B?NTYyQXRvRzFDMStERzBIVldoTEZxcWdNR0dHUTNTaklBN20yQWliZHAxUkp0?=
 =?utf-8?B?ZTBvcDI0L09sR1FzV1M2YW53TjZuTkViM1lTSEg4UmtSQXRUQ3U0NmhyTHVv?=
 =?utf-8?B?cVlqK2hrQ0lKb3lsYkc5Q2dhQjlod2RmTjF0U2JTcjd5MHNCL1ZLRFM3L21C?=
 =?utf-8?B?eFFCNmFsZERjOVpBU0gzblQ1QTFVeDQ2ZmJVV2ZRT2xoemxUM2h1K05Ecktr?=
 =?utf-8?B?RWVydVhuVUxueWNYR0J6bTZMSm1CRVdWUlJCSVk5R3hXZUN6azJPVHFldnZH?=
 =?utf-8?B?WFh3ZUozL1RlWExrMFJBN2NON2NoMmk5YkV5SVVxQmM4QjRsNEk1azNNNXJT?=
 =?utf-8?B?cXA5V0kyTjlXSnA5Sk9NQ0pKaFhQOXU3MFlxdFAyYjUwcjZnU2xtUVl1VWQ1?=
 =?utf-8?B?SCt2QjVSY0FyNlBLVFBoQzRDZVFVQlpIKzhuNEp3Vkt2WVZOQ2ZRV2JwMFdy?=
 =?utf-8?B?bXBpbnAxdk1qZzZLYnh0Um1KUlVTUWJ3dGVpa3BiU3BxTkVUSEdNQUZXbldh?=
 =?utf-8?B?SE1ZT2hkcmdUN2tWaUlNaCtrRVdpWEZrcklpRUh2SENicVM1bG1YemZrTXhj?=
 =?utf-8?B?MHdDRkpjZ3J0eVpIbVJpenN6QkI1ZFA5UlJGSW5pVENnUVI1TVJTTlFGd0VX?=
 =?utf-8?B?bDlnR0RYbWdjNnNPd2psTlZscTNwRm9UeUh5ZnZWTUluYUNlZjF5aTg0ZWhK?=
 =?utf-8?B?WjJ5aFF1WDNNbStBa2IwMU9kNHB3Zm1lVVJNTXNES0NHTStqS2JES2N6eHFr?=
 =?utf-8?B?bmtJOVdTMlhjb2JQeVFmWFBoMzAvQnlxT3BjYk05by85QndMQk1XWUVvNXdi?=
 =?utf-8?B?RG9wU0Rlb3AwakVLN1BySlBRVUZYWTJlc210YVFPTVh1Tkk1QTNtVVVabGlu?=
 =?utf-8?B?dmZyYlNpdDhPRHdzVS95d2JMRXpHMXkxUGM0cm1xT0hZQTNVZzlzZy9nSEhN?=
 =?utf-8?B?M2c2cVl1dHVvQWhRNEF5dG9JanREaFNqOUNCcThvWDZsVVpuU2xnbkRpRW1O?=
 =?utf-8?B?TTEzTkovbC91QVZCT2xlU2Qxa1BJRDJuY2RzVEF5NmNyQ3hwb0lHWU1oYkxW?=
 =?utf-8?B?bWd5cWpiNUR0aURadnZ3UmVQNU14bjdERHA1ODFiMTA1M3hwa0VDZWM3MW5Q?=
 =?utf-8?B?cFdLQUROM2lLRjZGeXRXRmNhT0NUTGtPWDBjQ3ZWd3IwRDg1R2ZTaEpuYXhm?=
 =?utf-8?B?ekExSTJiVHYxaWNKUTRjeGVNNmRTWnIwTXFOaFJGczcxSWpBVzNrOUwzRUta?=
 =?utf-8?B?VG0rdGM0WWs2Qk9kVXFWcFNHMzFHTVFwNzZvYmlGQkYwekl2NXJFdnBHT0Qr?=
 =?utf-8?B?ZjUvU09pdCthd0VtUjF4NWx2b3d2WnhzZyt4VTVZNHg2Z0FxbXJMZnlqZUhH?=
 =?utf-8?B?WjBrQjhOWWI5MDdyUHQrcmd2SGlHWDVPY3UyQWZrMk5CRk9MM25aUVhRd3B1?=
 =?utf-8?B?bjUzU29WUCtXRWFGOFZ0bHNUTklNQmRKblZhMzRFZUNjNnNCWjhxK096ZElz?=
 =?utf-8?B?dzZiYytBS2Z0bTRZR29MSEtrbU4xdVlXYkNXQ3ZPTlhWNVR4MWZOUExqQk9p?=
 =?utf-8?B?c05KbEJLd3B4MEJidm5BdnlBaFdxY2RjZUc2YlZ1YlBkYUN4dE9WRDZ4VGVY?=
 =?utf-8?B?c1QxYzNwWmlWY0tnNjQ2M3duRHE3Z3AxSnY2N2QwRVV0NVRTSW53eTB5dGEx?=
 =?utf-8?B?NXBoSlp2VVRXV2krVzdjeTNxclY5dzBlVmd5Z2l0V3hYM0RnZlhSeU1SK2lQ?=
 =?utf-8?Q?rwp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EF824FCB194B04A99821A6A61447558@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?eksxUjRoS1I1Q3ZIZ0VkZ3ZYcDgyRWs3ZGZHaVp4OTN0ZklhUUZua2EvUExl?=
 =?utf-8?B?T3c3L0lQVXpZYWxhYkh5Wkl6V1Rud0g3TFNzSzZHUVlkcWozT1dtVUdHbkFj?=
 =?utf-8?B?Umx0dE9VYzlSZkVVYm5KemxGVWRaNTJ5cjZ6ckZ2d1lBNkxmUFpUdDBqdnhh?=
 =?utf-8?B?ZU91R2lwTXJTa0taNllLY2h1SzAvbkxpaWJ5VlJLTk1XeVRjMFplaWpXaUtU?=
 =?utf-8?B?NlRhVTFXN3k4ZXhKQmFqM3lDVlMyaEp5UzM1RkZwNERnd3RIcXFWNzJ3RU5o?=
 =?utf-8?B?ZUZ3YUJ2MGNEb0xZZGdvZTZ4OXZVejdVRFQwSC9iYm1GM0pkOGNySTFteHo3?=
 =?utf-8?B?VHRVSms0UGcrSWtmNm9aT0w5QkRpQUdtd0JPL01VR1pqRlh3dlAyNlVxdEVX?=
 =?utf-8?B?VEl1KzBaMWwxY0tQd3gxRHR6K0NEWFB3VjhaZENyaDY4UGliTmdoZk1LU0k5?=
 =?utf-8?B?c2pOOWlBV0lnMTRBS2hpWnBWZkxFVUhRWWdTK2UzL3pNaXJHVXhzTzhhd3M3?=
 =?utf-8?B?d3JzaUxGQ0dSYjRGWlpBYnJhTC80ZE1VNHZoTlp4UXFNWWhjSzJMSG9aLy80?=
 =?utf-8?B?Wkxrc0U5ZWNxdTBnQWF6U1FIUUU1ZU9OdnpwWWlGS3gzOG5GdzlkeUY1VEdQ?=
 =?utf-8?B?QVNtNUNPaTdyRG40UWZqcnVSNE9XR0ZWUUx3c0MrK0JaVHRSMjh0cDFtblVK?=
 =?utf-8?B?QzNzNVZZMk5ZYTFpVFlmTW1PN2tPTlZDTDRXd0ZRRDMxZnRRY2gwendXdXUx?=
 =?utf-8?B?QVI4ckVBT2YwNWFjSFJOZW4xam5jSUtlYUVlVHNCaGVxc0UzSHpBVWdwSTIr?=
 =?utf-8?B?R2Y3ME5SeDNiL0Z0Q3lxbUhubFl2a3VWUFRwUzhQUVQzWTdUanJ6OWpTdmhC?=
 =?utf-8?B?TGtKQ2RZVjV6ZVFZMDBLWjVKaHlaZThucUVxU2VwaWdJdWZyRHVEYTR2S2s0?=
 =?utf-8?B?NFIwUlkrSDFQQ0hRMGFCa3ZCQzdhaTNKWU56Uk1oZEc3aWJzYkFCb0JQRkQv?=
 =?utf-8?B?d0JJRXI2TkhUUko4aUg2WHUwQ21ESk1OYXVjNUU4aFQxSGxMWFpKTmJjZHFN?=
 =?utf-8?B?ampoR3RIeW80d0gwRU9SS2ptYWhpMGVRWXU5RE8xTm9zUEhoT3ZzM0pVaUg0?=
 =?utf-8?B?Ritudi9hTWNZUVF2UnhQZ0M2SjFiRml3YmRCQitEZUEyNHZtUXJubXVSSXJI?=
 =?utf-8?B?YmxZTG8vNEpuQ0dUVWxteFdJZ0x0OGtETHpJUWUyOWtzQkNxN3hyMytEdkxq?=
 =?utf-8?B?RzBBUDBIWmF2VTIySHZWL29DaytGRFllRHZTc1FQWi8vWkppVmR0TjVaM1BY?=
 =?utf-8?B?MnFVQ2l1dE1mVktHQ1ZpRXEzTG5UaEQ2NmNLSXg1dWhuM2VhQ3FpYVZqeTY4?=
 =?utf-8?B?cmJwaVhVOVE4ZHc9PQ==?=
X-OriginatorOrg: ncr.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR15MB5218.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa4f376-e86b-4ece-7631-08db23a05d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 08:53:07.2659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae4df1f7-611e-444f-897e-f964e1205171
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/mA+1ZMnWEjFCcvn/k88HifFflujK29x2aVeS3l2Vo6E/1z9S0afQlv4aLj3hhBatGP4I+sRbAbiUNNiKlVjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR15MB6250
X-Proofpoint-ORIG-GUID: zLMBG0t1cAE4qM4FsTDQVq3zNuZigDur
X-Proofpoint-GUID: zLMBG0t1cAE4qM4FsTDQVq3zNuZigDur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_01,2023-03-10_01,2023-02-09_01
X-Mailman-Approved-At: Tue, 14 Mar 2023 02:30:18 +1100
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?utf-8?B?RmVybsOhbmRleiBSb2phcw==?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, Vinod Koul <vkoul@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMDkvMDMvMjAyMyAwOToxNiwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gKkV4dGVybmFsIE1l
c3NhZ2UqIC0gVXNlIGNhdXRpb24gYmVmb3JlIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMN
Cj4gDQo+IE9uIFR1ZSwgTWFyIDcsIDIwMjMgYXQgNDozNeKAr1BNIFNlYW4gQW5kZXJzb24gPHNl
YW4uYW5kZXJzb25Ac2Vjby5jb20+IHdyb3RlOg0KPj4gT24gMy83LzIzIDAzOjQyLCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOg0KPiANCj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMTI2LWdwaW8tbW1pby1maXgtdjItMS0z
ODM5N2FhY2UzNDBAbmNyLmNvbS9fXzshIUluNFFsdyF1UUtHa3Q3ZE81VEEtNTYxWGN1UE5vcXl0
aV9Bb2dxSjBjVjN5bUZaTm9iLVExLVoxeG1jT3ZfMjJKQlA1eE8tT0llbWFDWjFWWTM3bldMSWUx
QVh5T2tpZWckDQo+Pg0KPj4gVGhhbmtzIGZvciBsaW5raW5nIHRvIHRoYXQuDQo+Pg0KPj4gSSBi
ZWxpZXZlIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGFwcGxpZWQgaW5zdGVhZCBvZiB0aGF0IG9uZSBi
ZWNhdXNlDQo+Pg0KPj4gLSBJdCBkb2N1bWVudHMgYWxsIHRoZSByZWdpc3RlcnMsIHdoaWNoIHdl
cmUgcHJldmlvdXNseSBvbmx5IGRvY3VtZW50ZWQNCj4+ICAgIGluIHRoZSBkcml2ZXINCj4+IC0g
SXQgaGFuZGxlcyB0aGUgZW5kaWFubmVzcyBwcm9wZXJ0aWVzLg0KPj4gLSBJdCBjb25zb2xpZGF0
ZXMgdGhlIHZhcmlvdXMgZGVzY3JpcHRpb25zIG9mIHRoaXMgYmluZGluZyBpbnRvIG9uZQ0KPj4g
ICAgc2NoZW1hLg0KPiANCj4gTmlhbGwgYXJlIHlvdSBzZW5kaW5nIGEgdjMgb2YgdGhpcyBwYXRj
aCBzb29uPw0KPiBJbmNsdWRlIFNlYW4gb24gdGhlIHJldmlld2VyIGxpc3QhDQo+IA0KPiBZb3Vy
cywNCj4gTGludXMgV2FsbGVpag0KSSBuZXZlciBnb3QgYXJvdW5kIHRvIHdvcmtpbmcgb24gdGhl
IFYzIHBhdGNoLiBUaGUgaG9sZCB1cCBmb3IgbWUgd2FzIA0KdGhlIGNoYW5nZXMgdG8gdGhlIGJp
bmRpbmdzLg0KSSdtIG5vdyB3b25kZXJpbmcgaWYgSSBzaG91bGQgd2FpdCBvbiBTZWFuJ3MgcGF0
Y2ggYmVpbmcgYWNjZXB0ZWQgYW5kIA0KdGhlbiBJIGNvdWxkIHJlLXN1Ym1pdCB0aGUgZHJpdmVy
IGNoYW5nZXMuDQpXaGF0J3MgdGhlIGNvbnNlbnN1cyA/DQoNClJlZ2FyZHMsDQpOaWFsbC4NCg==
