Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1B54F87C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 15:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPgMV4DGSz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 23:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ig8XOQVS;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=tCWLjTm2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=conor.dooley@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ig8XOQVS;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=tCWLjTm2;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Fri, 17 Jun 2022 18:28:21 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPXHT2mGfz2yL2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:28:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655454501; x=1686990501;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PKJdeGf0KubUtvcKKxxNNvdxS3ItedrQLEGko5ScSjc=;
  b=ig8XOQVSEMEMpzCJI19XE/ZcDXGrzXvbp+wOvmy9YJzC+1aHK7owVulz
   ULmQbRbFsxw968x2mDI34VVqoqJ070H1ZAJzueZsZ+O13ChYUnJ8CKcf/
   Zk3dnZu44kwbYpVa7B/Ym7w084WWTWX155i89SW/7iuDtI1kQET65QJCA
   KLhPexOGA/AcNxILEOfmEFAz8jMR8t2ZsWBTkBLuJ3Ucia+mm5r4yxDnB
   2J+unxMIGdxz8hQSF0EZnseeHDLx121xjHxIAx9O0VDw7bIENwGpPNu/S
   o6hmOZpZjxMvjPrT+zUebtGN70BCZOHPJ2YB42gA2J4yI0VDE1/rQ8Mtt
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="100481744"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jun 2022 01:27:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Jun 2022 01:27:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Jun 2022 01:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVtuMy/zIWTHCtd77pIpc8L5eqOMG6ePRHDOuF2uh/X0GALtqwAIL1rbXby737bj1P8FLm+b1szFEfGZzafXMC0+6tMy0384hmV6PVNF3vkgr7FbmiCMAxNAg0cWLI8ESqfiS1OAZrHaupJMe+ABaz9Ox9Lj/45dliUfczushPBVhz1DxTSLC9C5nHh1OV9YR6hNrdK1iHeeogW1V0RjaSnfIMdKCLG2mB5eebzf1FfB6DMxsioT665ZC2L4aC64KyEprc4LSJzuQ59nsNm9Sal3FgDs3/uB42AX4AU0Kc2YIUg30+dTwLgOkhOegXsbaBu80ZxaceH0Aj1qThdneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKJdeGf0KubUtvcKKxxNNvdxS3ItedrQLEGko5ScSjc=;
 b=JdFDH7Nr5osULmE7+rekHoZ9JTgxtc20nzvYRQN3MofXEWZXeEJe8zQjlFJzyHV0UieVsE9fAcvm7j+DtZsM3/y2tpqgYvzf1DZujOYImKxPg5iKy0G/yKsWROzY97Mtqt6+qXbn1R8rv+XAiCkgLOaOm4AXfYzZ2vDj3lSNvS31+e2d3ezUrg1FJ2L3uCin6gxsy5COQxO5T4wBJ2z+yTtTELGV6mp/FronMFZoM2OE+yLNZBdlHy2DPuvNhLM7K0dB28Rjh7QJcC5UygRU+ELeobpErgnB1Pyg/FW/NLL1vwbCpYWB+0DA69auXkIsl26afEwonB2bAdEi51BS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKJdeGf0KubUtvcKKxxNNvdxS3ItedrQLEGko5ScSjc=;
 b=tCWLjTm2YkT4F7/MeexKuV8UKx3hsAGui0rCXlXnDhDuczXvGJRNGywPrSarA7sBqIpAGiy4HISsmeo6xCueOzTqLvUXlMhWQDgIVxb1gATxFE4w6XX3NKEWZ850jwDXw8TxzEtlzemAtNDcqHy7T+ra3B+lcM7xXQSj7OzALpw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3798.namprd11.prod.outlook.com (2603:10b6:a03:b3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Fri, 17 Jun
 2022 08:27:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Fri, 17 Jun 2022
 08:27:03 +0000
From: <Conor.Dooley@microchip.com>
To: <windhl@126.com>, <christophe.leroy@csgroup.eu>,
	<Conor.Dooley@microchip.com>
Subject: Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Thread-Topic: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
Thread-Index: AQHYgiQFJo0WRKhuOk+qhad+8D5f0Q==
Date: Fri, 17 Jun 2022 08:27:03 +0000
Message-ID: <33668b61-4ae7-f625-0eb3-e15d2119623c@microchip.com>
References: <20220617060827.4004795-1-windhl@126.com>
 <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
 <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
 <f79ebcc1-c060-f861-231d-85c377e2e885@csgroup.eu>
 <64ac3dc9.5bd1.18170bcb6a6.Coremail.windhl@126.com>
In-Reply-To: <64ac3dc9.5bd1.18170bcb6a6.Coremail.windhl@126.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e51b52b-f256-4783-7640-08da503b2856
x-ms-traffictypediagnostic: BYAPR11MB3798:EE_
x-microsoft-antispam-prvs: <BYAPR11MB37987B546087EE87C485BB1C98AF9@BYAPR11MB3798.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b4S3wziIEA1EyFNezMDThvV63qxl6lvP68vsC02OXUlPC7yvCIu77P88/qiXUPxoj7jmHSsAzAdjPg2kCtL/M5mkq+1J6j/VGj9TYmcykbePzvkXrpZCPSC9uVJFRr4dnU6MQOle1W5/Vdg6pY6AA5iMJ1auUrtoD6QNy4ColwLCQ1EUVetFf5WbqqY6JZQhUSk7fYT3Y2etsDuTURnhJeNOGM96uFOy7HwAmxqCOdHJ6xCNpNPrE/wfPcPKA51RKVB+QEA32gERFLaF7m2CEYgFfSfeD3S0tKhki44dYjbIPQ3iB5cTLmoPGycdsNPj2AMeuGwoNOYS+ri2/0VdV2DpRE11hrWJAUbWxffmzEdUMEFmXoZvRv6lm/oJH+9nC1xXaFEpW34aQXgeFYGGr/fxzMsI4udsNFYKK37fOtvJyruzCPlTasgHEnuAYRFA/zxCiomhQ+G/GX/Ag5L4/T4xniU0EeKWSEkWPp9lJPwSJem59yLUNBXPuHYKEj88gw/tUM8kjCqc71qMzlDMTuWFQFBCgNiLPuwwG8wNh++g4WXCpLipnWQgUj9zYMqW1bTueuYcDiNBuse6L0DudyFosWV1SLVLZsPp47lusYrthH9+G29H/ceLbtQRE/TpGM6Nm4s3GHGjX4Nrcx6jXHeT5hoiT8XFwYyTcqgGVPPzVKDDcOjA2bnlQHZY2jT381Jx6gh9btD864YnA2SreL5xmtTIbuoh/22IfIS5ny7wlria86fSPVCBuCpx9DcxSPanvZ0V+bn2n62aWkA+vSbn3Q4QFWLKKf0snBECVDz1VU6Vt5MeAsxOX944WEzeTtWZ/Z8SN169jsPmWiaBayCVzc+BmMeNN+8h7rXrh6c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(26005)(2616005)(186003)(83380400001)(6512007)(31696002)(86362001)(53546011)(6506007)(2906002)(38100700002)(71200400001)(110136005)(316002)(122000001)(36756003)(66556008)(38070700005)(54906003)(8676002)(76116006)(5660300002)(6486002)(66446008)(91956017)(31686004)(64756008)(66476007)(4326008)(8936002)(66946007)(966005)(498600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wlk0dEM1Q3NXUHpiZmFVc2ZMQkw0Y1lHdE5oQkdoell5WEVvakpOS0daV0w2?=
 =?utf-8?B?L1VGbzIwL24vV0JzdDRZeGFmeHZCSm9lQ1pFUDhVRUFKc3BURGJGenF1S0xN?=
 =?utf-8?B?R2FEM0VuMm5WbzVLcDBRdTRlOE5qa2E5cTBhL2R3NU50MVUrWVhMRXQ3RkxX?=
 =?utf-8?B?dEE2OW5pRGRETE1CenBzR3dKSHZDamdVWTBaZnMydlY1Q3lZbEtNTmRES291?=
 =?utf-8?B?T2J0R2lVM3hnRXE2Rk5PVkNlcFRhU1lUalVrR0F4K0ErSjk1U2JhcVh1enlV?=
 =?utf-8?B?ampUbWNYb0ZFUWxiMnppVkxiZTBXU01zL3hFWlNWK2FZbmtpREpvWllHM2o0?=
 =?utf-8?B?Q3dWUHgvNE41WGZWTG1ta01rQW4yYm1BTW9RRVp3NXFOS202WG4vbW04RUlB?=
 =?utf-8?B?d2RsSHVDRDJWb3kxVjE3dUt0OWVuM0VWNFhiRXdqOFlMUUYwbWE0Wkd3WFgx?=
 =?utf-8?B?YzBMdUtvRXJzOHl0NmxlYXN6UkJXM0ZLNjB1SmUyTTU0bExrdHJzNEI4V3Fq?=
 =?utf-8?B?QWFRZHJVQ294N1B4MEJuWFprWEtma25GQkxWQ3BVcEV3Zm1OV2QvbVFqcis3?=
 =?utf-8?B?MGVHWGw2RittZkJNd1NaelgwdTI3UzBpMG1FSWNRbVdJNGFUdUIxQUhQYU1z?=
 =?utf-8?B?NVcrcHZQTFZ0cEFjYjE2MmRoemNSbFNmQkt3eTNHQ1ovbkhNUGYrOStzcVk0?=
 =?utf-8?B?aXRYbDgrOVdYNFFKYm9ndUtGdWVjekhiQU9SbElYUzVZR0hsTldUZWxYYjBs?=
 =?utf-8?B?dmQwbVFuQ1ZjcGdMdDl2S0xwcytuTGhSSEFhSkJZSUE5SkRlY3VlbE5BbmJL?=
 =?utf-8?B?cGpIWjhkbHpYRVFUaW5yRXJPQllvakUzdEZBYUFxRjlmRFlkWlB3cFYxVUh2?=
 =?utf-8?B?NC9qNnNFNk52WXkxcDdZZHg3dXBSdFQ2WktRN3p4WCtTeVdaWm11d3c5SzhE?=
 =?utf-8?B?YU5BWmNsTk9GeEM4VHdicjJjSlg0WnVLaWhZRzZBZm0zSG1uTS92UzZFaTE3?=
 =?utf-8?B?MUVLbXNrWHlOd0xZc0dzYUE4dWw1UXNtOHdpSDN2QmJ5amo0VVJKVVZJWXVD?=
 =?utf-8?B?cHIzUlAyQnpxTm1Fb2c2Q0t6dUNYQWV1aVdHMFFrK2VhWXhZb3ZDWThnRUFp?=
 =?utf-8?B?b3B4MEZmcmVEM29jYnRVSkc0NWFwUUJEejdFdEt3MmVjR3k3czZVaXgxdlo3?=
 =?utf-8?B?MlpIakRyRyttNnBiSXFDSHhoWWNlU0M2cG04a0I3WVRZbnF1UUN4dWxoMWt0?=
 =?utf-8?B?aWlRVGFEMkhQZ3lZZ0JQMEFQZzA1T2lpSm9MbERyaFBPYlpWT2ZiRUl5c3ZK?=
 =?utf-8?B?ZWxxaThFenNmL3ZMSmgwNXRteEc1YXBTMGltc1FBUzcrSy82dWdLZG8wK05G?=
 =?utf-8?B?ZGRFQVVhcGNlYnhJOEdBbEFJMk5aK2g3OVRRWmRtV3FidzRZUC9xRmtwSlBX?=
 =?utf-8?B?dnFoRkx5U3RhVHRPRE5KR2czM3Zvb3N4Qml3RVpSSjh6a0ZJNVJNZ1dMSHBN?=
 =?utf-8?B?V0c5SVJTY0w4U3RHeUpTY2kySi84RWFxQjYrbitQUGp5cjZQRzN0ZisySWFI?=
 =?utf-8?B?WTY4MGt1amRpV1FGbDgzK1VZaXF4a2lGeEdDd0g5MVg1blRrMUsrSCtoTmZI?=
 =?utf-8?B?cUlLOEw4SC95TUYvYUJuVmRWRmE0ZHd1a1lINDUzRUQ0dk1wQTc2TTRGbyt1?=
 =?utf-8?B?eGxtVllxR1lUTlcxajBPSkdRdExCS2NUN1FyckJmQ3RBdk4vK0hGV0hMQVcy?=
 =?utf-8?B?VktYbHR3akUwQmlXWXNQSXZESHJ2VWZYMFVoMWV4WE1oSXA1L1BTWC8rdzc2?=
 =?utf-8?B?NWZQQWpsWGdvRlR5Yng5MnBhY1VWSkY5YWJHSVlvOWN4L0NRWkw4d2FzWkl2?=
 =?utf-8?B?cWxDa3VENFZGSFRrODBKYmEwYXhqN3JYT1hicWZaL25jWEVvQ1VReUl5UzJr?=
 =?utf-8?B?N1piK0twbGlsdWdTS28vMDBtMGwwUmExRG4xMGc1dVJQblFTMzRHWG0yUnVx?=
 =?utf-8?B?YXd3N0ZVYWU3bE5ReDRWZHZqUC9zYU1XU0JMZ0JvRzBDYnZod3grcm9JczlD?=
 =?utf-8?B?Q0VLRStxa1hPSG54dHRxVUk5ZmMwb0N3ZFJPcEQ0ZlZxMVAvTHVHbjY1TCts?=
 =?utf-8?B?UUhQRW9rYk4rNHpmUEtDM1hEejJUOGd4VS9WOW9ZdlpNWnpkOW5VV1BGaEZV?=
 =?utf-8?B?bTdGMTdmOU9oYnAzZmUwRUU1UWV0U0psdE5Cc2RLcDJIVnpqaFB6L2pZNXhK?=
 =?utf-8?B?QVRCc0JvUG5BU3lzUzVPY2swZUlRSmdhZDduVDlxR1lqTVBuMnlCNVdWdUNJ?=
 =?utf-8?B?bUNnTWxJVG12MDRBNEtoeExWQnBZNzZHSXZqRmozS3UzRUlRckRabEJ4cW1D?=
 =?utf-8?Q?0d2DHqpSA1W3KlMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D7577FC5A43614BAA8321E09AEB62A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e51b52b-f256-4783-7640-08da503b2856
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 08:27:03.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEn23KLoFbv0fO9cXFKov4F0wA161yMogMNw5r7InMW1otvKNWnZiLEf/HmGcboN0Lvn/BLrdnZ0ylZ4xhMB9kkybJigkv7kt1v9j/5hwGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3798
X-Mailman-Approved-At: Fri, 17 Jun 2022 23:45:29 +1000
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
Cc: linux-kernel@vger.kernel.org, oss@buserror.net, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMTcvMDYvMjAyMiAwOToxNywgTGlhbmcgSGUgd3JvdGU6DQo+IA0KPiANCj4gDQo+IEF0IDIw
MjItMDYtMTcgMTQ6NTM6MTMsICJDaHJpc3RvcGhlIExlcm95IiA8Y2hyaXN0b3BoZS5sZXJveUBj
c2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTcvMDYvMjAyMiDDoCAwODo0NSwgTGlh
bmcgSGUgYSDDqWNyaXTCoDoNCj4+Pg0KPj4+DQo+Pj4NCj4+PiBBdCAyMDIyLTA2LTE3IDE0OjI4
OjU2LCAiQ2hyaXN0b3BoZSBMZXJveSIgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3Jv
dGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+IExlIDE3LzA2LzIwMjIgw6AgMDg6MDgsIExpYW5nIEhlIGEg
w6ljcml0wqA6DQo+Pj4+PiBJbiBncGlvX2hhbHRfcHJvYmUoKSwgb2ZfZmluZF9tYXRjaGluZ19u
b2RlKCkgd2lsbCByZXR1cm4gYSBub2RlDQo+Pj4+PiBwb2ludGVyIHdpdGggcmVmY291bnQgaW5j
cmVtZW50ZWQuIFdlIHNob3VsZCB1c2Ugb2Zfbm9kZV9wdXQoKSBpbg0KPj4+Pj4gZmFpbCBwYXRo
IG9yIHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9yZS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+ICAgICBjaGFu
Z2Vsb2c6DQo+Pj4+PiAgICAgdjQ6IHJldXNlIGV4aXN0ICdlcnInIGFuZCB1c2UgYSBzaW1wbGUg
Y29kZSBzdHlsZSwgYWR2aXNlZCBieSBDSg0KPj4+Pj4gICAgIHYzOiB1c2UgbG9jYWwgJ2NoaWxk
X25vZGUnIGFkdmlzZWQgYnkgTWljaGFlbC4NCj4+Pj4+ICAgICB2MjogdXNlIGdvdG8tbGFiZWwg
cGF0Y2ggc3R5bGUgYWR2aXNlZCBieSBDaHJpc3RvcGhlIExlcm95Lg0KPj4+Pj4gICAgIHYxOiBh
ZGQgb2Zfbm9kZV9wdXQoKSBiZWZvcmUgZWFjaCBleGl0Lg0KPj4+Pj4NCj4+Pj4+ICAgICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyB8IDM1ICsrKysrKysrKysrKysr
LS0tLS0tLS0tDQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9z
Z3lfY3RzMTAwMC5jDQo+Pj4+PiBpbmRleCA5OGFlNjQwNzUxOTMuLmU0NTg4OTQzZmU3ZSAxMDA2
NDQNCj4+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5j
DQo+Pj4+PiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYw0K
Pj4+Pj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+Pj4+ICAgICB7DQo+Pj4+PiAgICAgCWVudW0gb2Zf
Z3Bpb19mbGFncyBmbGFnczsNCj4+Pj4+ICAgICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0g
cGRldi0+ZGV2Lm9mX25vZGU7DQo+Pj4+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGRfbm9k
ZTsNCj4+Pj4+ICAgICAJaW50IGdwaW8sIGVyciwgaXJxOw0KPj4+Pj4gICAgIAlpbnQgdHJpZ2dl
cjsNCj4+Pj4+ICAgICANCj4+Pj4+IEBAIC03OCwyNiArNzksMjkgQEAgc3RhdGljIGludCBncGlv
X2hhbHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+Pj4+ICAgICAJCXJl
dHVybiAtRU5PREVWOw0KPj4+Pj4gICAgIA0KPj4+Pj4gICAgIAkvKiBJZiB0aGVyZSdzIG5vIG1h
dGNoaW5nIGNoaWxkLCB0aGlzIGlzbid0IHJlYWxseSBhbiBlcnJvciAqLw0KPj4+Pj4gLQloYWx0
X25vZGUgPSBvZl9maW5kX21hdGNoaW5nX25vZGUobm9kZSwgY2hpbGRfbWF0Y2gpOw0KPj4+Pj4g
LQlpZiAoIWhhbHRfbm9kZSkNCj4+Pj4+ICsJY2hpbGRfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hpbmdf
bm9kZShub2RlLCBjaGlsZF9tYXRjaCk7DQo+Pj4+PiArCWlmICghY2hpbGRfbm9kZSkNCj4+Pj4+
ICAgICAJCXJldHVybiAwOw0KPj4+Pj4gICAgIA0KPj4+Pj4gICAgIAkvKiBUZWNobmljYWxseSB3
ZSBjb3VsZCBqdXN0IHJlYWQgdGhlIGZpcnN0IG9uZSwgYnV0IHB1bmlzaA0KPj4+Pj4gICAgIAkg
KiBEVCB3cml0ZXJzIGZvciBpbnZhbGlkIGZvcm0uICovDQo+Pj4+PiAtCWlmIChvZl9ncGlvX2Nv
dW50KGhhbHRfbm9kZSkgIT0gMSkNCj4+Pj4+IC0JCXJldHVybiAtRUlOVkFMOw0KPj4+Pj4gKwlp
ZiAob2ZfZ3Bpb19jb3VudChjaGlsZF9ub2RlKSAhPSAxKSB7DQo+Pj4+PiArCQllcnIgPSAtRUlO
VkFMOw0KPj4+Pj4gKwkJZ290byBlcnJfcHV0Ow0KPj4+Pj4gKwl9DQo+Pj4+PiAgICAgDQo+Pj4+
PiAgICAgCS8qIEdldCB0aGUgZ3BpbyBudW1iZXIgcmVsYXRpdmUgdG8gdGhlIGR5bmFtaWMgYmFz
ZS4gKi8NCj4+Pj4+IC0JZ3BpbyA9IG9mX2dldF9ncGlvX2ZsYWdzKGhhbHRfbm9kZSwgMCwgJmZs
YWdzKTsNCj4+Pj4+IC0JaWYgKCFncGlvX2lzX3ZhbGlkKGdwaW8pKQ0KPj4+Pj4gLQkJcmV0dXJu
IC1FSU5WQUw7DQo+Pj4+PiArCWdwaW8gPSBvZl9nZXRfZ3Bpb19mbGFncyhjaGlsZF9ub2RlLCAw
LCAmZmxhZ3MpOw0KPj4+Pj4gKwlpZiAoIWdwaW9faXNfdmFsaWQoZ3BpbykpIHsNCj4+Pj4+ICsJ
CWVyciA9IC1FSU5WQUw7DQo+Pj4+PiArCQlnb3RvdCBlcnJfcHV0Ow0KPj4+Pg0KPj4+PiBEaWQg
eW91IHRlc3QgdGhlIGJ1aWxkID8NCj4+Pg0KPj4+IFNvcnJ5IGZvciB0aGlzIGZhdWx0Lg0KPj4+
DQo+Pj4gSW4gZmFjdCwgSSBhbSBzdGlsbCBmaW5kaW5nIGFuIGVmZmljaWVudCB3YXkgdG8gYnVp
bGRpbmcgZGlmZmVyZW50IGFyY2ggc291cmNlIGNvZGUgYXMgSSBvbmx5IGhhdmUgeDg2LTY0Lg0K
Pj4+DQo+Pj4gTm93IEkgYW0gdHJ5IHVzaW5nIFFFTVUuDQo+Pj4NCj4+PiBBbnl3YXksIHNvcnJ5
IGZvciB0aGlzIGZhdWx0Lg0KPj4NCj4+IFlvdSBjYW4gZmluZCBjcm9zcyBjb21waWxlcnMgZm9y
IG1vc3QgYXJjaGl0ZWN0dXJlcyBmb3IgeDg2LTY0IGhlcmUgOg0KPj4gaHR0cHM6Ly9taXJyb3Jz
LmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0b29sLw0KPj4NCj4+IENocmlzdG9waGUN
Cj4gDQo+IEhpLCBDaHJpc3RvcGhlIGFuZCBDb25vci4NCj4gDQo+IFNvcnJ5IHRvIHRyb3VibGUg
eW91IGFnYWluLg0KPiANCj4gTm93IEkgb25seSBrbm93IGhvdyB0byBxdWlja2x5IGlkZW50aWZ5
IHRoZSByZWZjb3VudGluZyBidWdzLCBidXQgSSBjYW5ub3QgZWZmaWNpZW50bHkgZ2l2ZSBhIGJ1
aWxkIHRlc3QuDQo+IA0KPiBGb3IgZXhhbXBsZSwgSSB1c2UgdGhlIGNyb3NzIGNvbXBpbGVycyAn
cG93ZXJwYy1saW51eC1nbnUtZ2NjJyB0byBjb21waWxlICdhcmNoL3Bvd2VycGMvcGxhdGZvcm1z
Lzg1eHgvc2d5X2N0czEwMDAuYycgd2l0aCAtZnN5bnRheC1vbmx5IGZsYWcuDQo+IEJ1dCBJIG1l
ZXQgdG9vIG1hbnkgaGVhZGVyIGZpbGUgbWlzc2luZyBlcnJvcnMuIEV2ZW4gaWYgSSBhZGQgc29t
ZSAnaW5jbHVkZScgcGF0aGVzLCBlLmcuLCAuL2FyY2gvcG93ZXJwYy9pbmNsdWRlLCAuL2luY2x1
ZGUsDQo+IHRoZXJlIGFyZSBzdGlsbCB0b28gbWFueSBvdGhlciBlcnJvcnMuDQo+IA0KPiBTbyBp
ZiB0aGVyZSBpcyBhbnkgZWZmaWNpZW50IHdheSB0byBjaGVjayBteSBwYXRjaCBjb2RlIHRvIGF2
b2lkICdnb3RvdCcgZXJyb3IgYWdhaW4uDQoNCmlkayBhbnl0aGluZyBhYm91dCBwb3dlcnBjLCBi
dXQgd2hhdCBJIGZpbmQgaXMgYSBuaWNlIHdheSB0byBnZXQgYSBjb21waWxlcg0KZm9yIGFuIGFy
Y2ggSSBkb24ndCB1c2UgaXMgdG8gc2VhcmNoIG9uIGxvcmUua2VybmVsLm9yZyBmb3IgYSAwZGF5
IHJvYm90DQpidWlsZCBlcnJvciBzaW5jZSBpdCBnaXZlcyBpbnN0cnVjdGlvbnMgZm9yIGJ1aWxk
aW5nIG9uIHRoYXQgYXJjaC4NCkZvciBleGFtcGxlOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXhwcGMtZGV2LzIwMjIwNjA2MDkxMC5yWU5URnFkSS1sa3BAaW50ZWwuY29tLw0KDQoNCklu
IHRoaXMgY2FzZSwgeW91ciBidWcgc2VlbXMgb2J2aW91cz8gWW91IHR5cGVkICJnb3RvdCIgaW5z
dGVhZCBvZiAiZ290byIuDQoNCkhvcGUgdGhhdCBoZWxwcywNCkNvbm9yLg0KDQo+IA0KPiBUaGFu
a3MgYWdhaW4sIENocmlzdG9waGUgYW5kIENvbm9yLg0KPiANCj4gTGlhbmcNCg==
