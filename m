Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D3914FE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:26:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=gidJjPql;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79HX2Ppwz3dBw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=gidJjPql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f400:7e1a::630; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79Gn6jFmz3cPl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:25:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9dA04ToURW9xwi7FqwmnAfRmrxPs9SJKiAvPcHVVzW6zqiU7QGb3wLv66Gd1S7/accJOXR1gBcLx19FWEywyA1Sg6JPZ7IyE4EugRZcIZXPzvlbEua7O9Dujqg4oriqyfmtLu+Igw7IqJ9hMGxQ1RKsP+gl/C68cWWxIx/uqtVZ7nYlzEAeJ0ZVPfz3L90EdG2ZBgg7o4GGT01XSqKCC+qT7f/ujiWVSaXXRCKePIMmtG/3WcbIeddMNQ9Bv0nAzB5GNHrvy8fWphtlfGljTCX8Y4BIZzegPzSA2cHIwX++JsRsaf/DJHqHIZyZxaAHmyrdjsJ/q0WVpluHZzcmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrdMJsKJ5g45DNCRwnhRxafTkPulpSDIthJ9088ZJ7o=;
 b=Oc7yXsgL1Cw5OCNXU5WuuZuGOUdl4y1jG7HCYylClt7h6cvsuDCDp6Qk/mwMy1aCjBmkSEN0OGjkdJc2A+0e+7EzGlZffeJaEoiu8f+cCFyiVII3sy65sWIsmAPQbSD/jeKCgoyuicyKeonPbJBw5bt8OPzDlPZchugkPhC7QA6q4MvY4Qwmly4L73B9ZJF2KwfOg+FG+2+S9gwd96SJY1SFIIWgvJ9rzXZa+CSzaBilD/TKxGoNdVJGcjtg866CgB/5Zhd5ytqp1VdITdyUXjrGxF+EQbpcN330NJ8YQyJSSnGtAlvDtuTI2myvEBc+3FP9qwg7DwtCLphx2R5xiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrdMJsKJ5g45DNCRwnhRxafTkPulpSDIthJ9088ZJ7o=;
 b=gidJjPqlQt7x/F3v6NSox64k9vWYyL17qX37NYfS2Nc2RUW+lBhHX3O6A/0OV0dxMzeZdgwh31nl9+eMALzhFuFsNIh1zj3HbVbN9Ul38fOzdrA5i9sIkY6dkm89vBHOpeXd1XX4t3O8qodxXZ+sO/S5ETju+e9b/83ZlHCqYIYwlCbxav/quHkWiEmMoX1eT567reseO9nYiXdPoow61MPjkpm7HoSw4xFrawUAxj1SPHVcdj3Fe14aG55TFluBOO8nvwqb3YHDrrynShIx6VrHOxvxQV7+o+qNw0vocup7+roeBHeyE/bVVEVzJiSP0YqzI/+x2pREIzv9b0tyWw==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AS5PR07MB9968.eurprd07.prod.outlook.com (2603:10a6:20b:67d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 14:24:51 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 14:24:51 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v5 16/18] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
Thread-Topic: [PATCH v5 16/18] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
Thread-Index: AQHavWTKohLjHGy8NESGXenYze36VbHXCcEA
Date: Mon, 24 Jun 2024 14:24:51 +0000
Message-ID: <2f9fc4fd-97ad-4eca-94bd-e420a2e6abdc@cs-soprasteria.com>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <92a741b0358fc100ad331760181f66e82781052b.1717955559.git.christophe.leroy@csgroup.eu>
 <ZmqiI5Q8DyyEA0gW@localhost.localdomain>
In-Reply-To: <ZmqiI5Q8DyyEA0gW@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AS5PR07MB9968:EE_
x-ms-office365-filtering-correlation-id: f3ce2625-4c55-4696-2823-08dc945968d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:  =?utf-8?B?eCtrU0o2RjE4SW9nWkJqR3NWLzc0WjFjYzJrQzVTcGRmenpjYUhTdjFib1Ji?=
 =?utf-8?B?WmlXbHlYbnMvMzhSem54THdKaG9PM1lqUVhOdzlxL1RCa3pSMDAxckJlaVAy?=
 =?utf-8?B?TDQ0Q1FGR0s5YkJqYXRIL3dvTm5MYTBnL3FkejlGK2RzT2FJM2JMeDF5TzQ4?=
 =?utf-8?B?YVltcU5TdEZhN3lGRG1RTit4RERST2cwZFlMRDV6cVUyVXRsQnhEd3oxUUQy?=
 =?utf-8?B?SnoxQ0EzY0hYaXZkUjlTalUxZlJGOEZxSXNqYk9sZkVHNDF3ODZxT294c00z?=
 =?utf-8?B?czI1K1pNd2xKWDlBS0ltbTlrMW5BTnFUZUhNOUFFenBEUm1aRWprUWtPdm91?=
 =?utf-8?B?RGZyVWFLT1Z6ekh1T0EweUwzTmNwZXpwK0oxYkl1T1E1R2FFVVVBb3pxRFBP?=
 =?utf-8?B?Y1I4blFQOVZrK1NGak8zNm1DSWJnTnZsWG1uSnlLQ2ZuUXFoejM4MmhxQW9I?=
 =?utf-8?B?b1dzc0lUdzdTVjhLZ1hNcmwrbkVQc3dtWUs5RFd5UkZIRy9FZUI2TjBKUUV5?=
 =?utf-8?B?aUdqRlFqeUF5b3BBTHVlcjZXMGc0czBRcXUvRGZub0luNHBxUmRwR21FaVM5?=
 =?utf-8?B?cnFycGNncFk0K1Vueis4aXBrelRVME9GVTcxRkNQRkhqY0NNbVpmT004V202?=
 =?utf-8?B?ZENlTmhUbFNkd0RIMTlDejBQZ0J5OE1SZjRLMjdhcnZmQytTR0FYQi9LbVY0?=
 =?utf-8?B?THFJWkt4UTJUY1ZBQmR2enoxbVFXL29USmwrZHgzZERFQVhpWDc3V295SDAx?=
 =?utf-8?B?UGJqVGYxQ3dOZXF4T05BdXRCcHhvbjJHK0p6ZnVLSXVDaFQxTkJiUlhGbkxD?=
 =?utf-8?B?UHE4N2VYUXQ0WVlTL2d3cVl0T0NzNldtdjBZYnRkUVB5YzNWS2tSaDZNYWli?=
 =?utf-8?B?cHU0OHdLQnA1Mk1jSXhWWVp3YjJaMnhrL2Z2RTBkV0pESmQvY0M4cEtoMkUr?=
 =?utf-8?B?b2ZFZ0pMMW4rMDhGZ2FtWFF5dkpmMklBVkwyRHA0bEU4bzdGTnRuY3FVRkpm?=
 =?utf-8?B?S0FsTFRUeW9hVmdzMmdTb3djT09ua3RLdGt5aERFTGtXbGlBaTJKWGFFR3Vz?=
 =?utf-8?B?ZUpzREJndDBteGtZYzR4TDBNa01YdEsveXNVS0lIRGFHUmZJMUI0a3FtZnZV?=
 =?utf-8?B?dlFFL0JnYWU3QnhsYWVMSWl2b1Q3TlBsUmhBVCtyalNqTm1DRGdOMW4zbFhT?=
 =?utf-8?B?dE1aaUFMc2I5VUR5Q05vOVRHVG9yUmlCTXpyNlphWG1CL3p3aEtQbWJ0Q01T?=
 =?utf-8?B?SnVEcmZhR2daQkhqMEtzUzRTWThaVEdRcjlmU3ZmdmJnQzlPdXluN1NhQVhL?=
 =?utf-8?B?MnlRalNlSDgwR2hVb00xY0cvc2hwMWhzcG4zY2pOOExGRGZUczl0cUc0TkJ2?=
 =?utf-8?B?b3hRZjRpQ2tIeWNqdFh3eTlBRFZwaUNpMnRVWFJYT05DQ0VZQlZLaWRvdVFO?=
 =?utf-8?B?QlVIN3BjeDBwK2o1THQxVkFBSG4rY1RLS3pNYmxMaUdmSXZLYmlzUFliSUly?=
 =?utf-8?B?NzRKYTZUU3I5Rm9KYzF1VHUwVG5ueFpFTkVOdU5BNFF0YytCc0oxb2ZxVHla?=
 =?utf-8?B?anNsWEpvL0ZES1BYZ1RXelNxbkpxYWE1R0M4THovVDdJbTIrbzhveWRuWm05?=
 =?utf-8?B?QTBaakFLckVLaFJLMC9FZ0xuSHFmbHFUYVVsTzNIL3pVZXFleWtRU2xxUEd5?=
 =?utf-8?B?dnh5U0tYNktYUnJUa3lJS281Z2EybzlHY3llWnlXVWJ3U3VzUUR2UHFpR1dk?=
 =?utf-8?B?ZlBFd0hLbzNMdDFBcjdUYi9vbGQ2Q2JMeDhiOUlJSE1WZkp3SkFqa01HVTEx?=
 =?utf-8?B?UlNrU2VOdTVpSlM3THRqRmpxTWVWRWxkbUJ6QnZrQUs4Z3JvNHk5RXZISUVT?=
 =?utf-8?B?VlkyVVpiOElmTlBib2lhd0FBMnFTTnFUOWx1L2hMZk9UL3c9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NE1XeWcyUkw1cFlVUi91S2JqRmllb1RBbDBVWVpMckFyWitza21JQnVhU1Vy?=
 =?utf-8?B?L0xWWjJIZVF2cjNIeWpOV2tiMXNwT2tsRk9za0hyWExwaHNBRXlqQnYvL0NP?=
 =?utf-8?B?Y2srcExMbVBGa043Yk1OMS9TSHpKekVzdlp0bXRacW5pcThNbGJGNzlCV1Bt?=
 =?utf-8?B?amMvbUU5RjFDS3RRNnVFM2FoUFJwS29ORlFSeTZmTkF6OHlxVitKV3Fqbkcz?=
 =?utf-8?B?YlFTQW0wOVFtNHBDTXpqWlY3d3p4d2NBSlpKSUJsRWw2ZEdmdkFNbmRNMzc5?=
 =?utf-8?B?NENZakNEQlA1eG9HT0lZc010ZXZTZXR2SStqTXlkQkt3REoyNmxwbnhqcXRh?=
 =?utf-8?B?b3Nqd2g3WkhkK3dscEo3U1k5d3lURkdvYVJScW90Wll0NzY2VnJRckp4WGtL?=
 =?utf-8?B?UnJibzFRTXo0RDNjTThWRFBEOWlUUHdPMFFTWGx1V2tuNFhoUXR6OGVDU0tL?=
 =?utf-8?B?Q201cm1ET2RLUlBjZVBYM0xuNHBPc1V5c2U3ZmN1M0pRamNzMTRjcHdLc1I4?=
 =?utf-8?B?NzdKOE5JWmRwV2o4VGdMZTAvcGZrMlZDcmRoVUFiSFZrWldrNEppbXR3eGJO?=
 =?utf-8?B?M3dseDZEWnRiMndWZVJmL2xkVzdSL3VTdG9EelBVcGVTaWc0bTg5Ly9LTDg4?=
 =?utf-8?B?bThNWnUrTGQvS3hya1J4RW9xZDUwdVlwRm9hTjYxUGZaZlR1dEdIelp5TlAr?=
 =?utf-8?B?bjBUMHhOTTlTdExJUkwyV1lBczEzYUl5Zlp2b0xWZk9FTTFVVGJCU1JkQXg2?=
 =?utf-8?B?SjZJbGFOZmZFWE15WjNFN3N4MXQ1b21tOS9yNDlaaDVQUi95M240U0dIQkQz?=
 =?utf-8?B?M0tWZHlyMG9FT2hDL01qTnVtdnphN2p5MVFlZTBPUmloWm5iQmlaNEdmV2N1?=
 =?utf-8?B?RUYxVUwzQzU5RHJtTEEzQ09aWlNSRVNCTEhoR0V2ZjMxYm84YjE2YldYVU1s?=
 =?utf-8?B?WlhVMVFEeHN5VnR2WE1GSncxTEhvSFdLcm9TWVdielhCMEpoQk50eU1ZN3N5?=
 =?utf-8?B?aElFZG0vUTd1RFppZDlWMVpMTnoyOUVJcTJUaTg0TlFvaXRqQytPZFptcjNv?=
 =?utf-8?B?ZE1YblRLQ01VMWxZdFB2RTZYb1dvZ0lZemJ3ZUY4TTZuZEhHMjFXSjQvaERE?=
 =?utf-8?B?QXh5T1k5VC9pSzFlbzFNVzFtQ0VSamd6U3dTMUV3ZmF5Y2QzODRWV1JOanJl?=
 =?utf-8?B?S0g0ekpUbFRFU2pZZHpjQmhZaEZhemJSeEplQWxXb3g4TUkzMlI0RGJNajV3?=
 =?utf-8?B?d0xySHdxenBPc1p2VVFNa3IveGxZUEhRSWNrNVF3M1Y1TGxnV2R3NkMwU3lJ?=
 =?utf-8?B?a0huUFZiN1ZaY1pDRWpEZGs0WnphdGdDSU4wRjFuVVNDbFZCb095UjZyQk0y?=
 =?utf-8?B?QWE2WVBML3NyMjJUeGQ3Nno3T1FtVVp4Vjd5QmNmcE42Zjd2czVyMzJXVjJs?=
 =?utf-8?B?SXlRSnNzeU9hRXdPNXdncC84VmlqRW8zWUtnNlowZ0JPSCtXd29lKzlsWmFj?=
 =?utf-8?B?UUlvS0FSLzQrekZUc2orYmM0aWpHV3N1ajV1RG9CMUhUZkdxV1JoSk51aWdE?=
 =?utf-8?B?aWx5d3NHbmp0ckFmNDM2WjVnY2hHSUFpbXRrMWRHOVc2UEJ4QTlIN2gzZENR?=
 =?utf-8?B?dVl1V1owaUo1dFBWb2toelhIZkxPbmtpRXp5TEhyd29xRVloK2RrUTlSc0tv?=
 =?utf-8?B?RkR1Nm85WG9lbGRicFpVcHhUTTlPamxCaDMwRHEvZW9iamM4NGRMY2NMbWh5?=
 =?utf-8?B?RDM2WlQ3Rk5sMWxRNTFJUi9FYzJaWXJic3VsY3NIRG9WRkxIcEVUQ2VOaTJZ?=
 =?utf-8?B?Q0VJTFNZYi8xYTNZWlZRTkdFbXR2emx2RVc5Sm92MjFHRmw5cVVBaHo4WEJT?=
 =?utf-8?B?SXRGV09BdytZYTlQNit1M1JnOHNBbi9aVlo3S3d2SzcrNlhER3FKMENmOXpv?=
 =?utf-8?B?RDRybmpOSHhJWjJDSWJFVWJSaHdtdTZyM3p4R25wc0NSV2xaaUpWSGxvMlFE?=
 =?utf-8?B?cjJoVzNGQVhFLzlZRzhTYVhjTUpRZVlvVUtZMlo1RkxtVGJUQXovYmJoWUhu?=
 =?utf-8?B?d0QraXNsUzIvQ0dwWEpQTGg1WXJmQUZQVVlmbXYvbWhObHVhWXlHMHdqdEhz?=
 =?utf-8?B?eG14b2xKMldNQzUyVy95U1B6UDFVd1pPUFBhRjIxTTJkQlpSYlgzT015ZWw5?=
 =?utf-8?B?Lytqem9VR2swWXhsam1BS25XWGNIUHo1Z0wrTS9FVmpkOExPMnNvN1hvZDFC?=
 =?utf-8?Q?rCNCTwm9YHjGnvGBjnATrbvkyQI64ZkdtgsVBKVG8A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAF6C231B15D734AA42EC89C0AA01BE1@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ce2625-4c55-4696-2823-08dc945968d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 14:24:51.1254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhoKnEFTb9Gpdn3YhDtBwEAmIG1vcW3OXcRfzeNa14GLrakxlU9iVlKLWd87ZPhfRgDMF9DDI1el2ebXfNIVvMiipOz67cE2cjTKSnR1XGHrzEMs9tPRVuE2L8m7oDFR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB9968
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS5PR07MB9968.eurprd07.prod.outlook.com
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA2LzIwMjQgw6AgMDk6MzksIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgSnVuIDEwLCAyMDI0IGF0IDA3OjU1OjAxQU0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBPbiBib29rM3MvNjQsIHRoZSBvbmx5IHVzZXIgb2YgaHVnZXBkIGlzIGhh
c2ggaW4gNGsgbW9kZS4NCj4+DQo+PiBBbGwgb3RoZXIgc2V0dXBzIChoYXNoLTY0LCByYWRpeC00
LCByYWRpeC02NCkgdXNlIGxlYWYgUE1EL1BVRC4NCj4+DQo+PiBSZXdvcmsgaGFzaC00ayB0byB1
c2UgY29udGlndW91cyBQTUQgYW5kIFBVRCBpbnN0ZWFkLg0KPj4NCj4+IEluIHRoYXQgc2V0dXAg
dGhlcmUgYXJlIG9ubHkgdHdvIGh1Z2UgcGFnZSBzaXplczogMTZNIGFuZCAxNkcuDQo+Pg0KPj4g
MTZNIHNpdHMgYXQgUE1EIGxldmVsIGFuZCAxNkcgYXQgUFVEIGxldmVsLg0KPj4NCj4+IHB0ZV91
cGRhdGUgZG9lc24ndCBrbm93IHBhZ2Ugc2l6ZSwgbGV0cyB1c2UgdGhlIHNhbWUgdHJpY2sgYXMN
Cj4+IGhwdGVfbmVlZF9mbHVzaCgpIHRvIGdldCBwYWdlIHNpemUgZnJvbSBzZWdtZW50IHByb3Bl
cnRpZXMuIFRoYXQncw0KPj4gbm90IHRoZSBtb3N0IGVmZmljaWVudCB3YXkgYnV0IGxldCdzIGRv
IHRoYXQgdW50aWwgY2FsbGVycyBvZg0KPj4gcHRlX3VwZGF0ZSgpIHByb3ZpZGUgcGFnZSBzaXpl
IGluc3RlYWQgb2YganVzdCBhIGh1Z2UgZmxhZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4gLi4u
DQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhhc2hfX3B0ZV91cGRhdGUoc3RydWN0
IG1tX3N0cnVjdCAqbW0sDQo+PiArCQkJCQkgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gKwkJCQkJ
IHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBsb25nIGNsciwNCj4+ICsJCQkJCSB1bnNpZ25lZCBsb25n
IHNldCwNCj4+ICsJCQkJCSBpbnQgaHVnZSkNCj4+ICt7DQo+PiArCXVuc2lnbmVkIGxvbmcgb2xk
Ow0KPj4gKw0KPj4gKwlvbGQgPSBoYXNoX19wdGVfdXBkYXRlX29uZShwdGVwLCBjbHIsIHNldCk7
DQo+PiArDQo+PiArCWlmIChJU19FTkFCTEVEKENPTkZJR19QUENfNEtfUEFHRVMpICYmIGh1Z2Up
IHsNCj4+ICsJCXVuc2lnbmVkIGludCBwc2l6ZSA9IGdldF9zbGljZV9wc2l6ZShtbSwgYWRkcik7
DQo+PiArCQlpbnQgbmIsIGk7DQo+PiArDQo+PiArCQlpZiAocHNpemUgPT0gTU1VX1BBR0VfMTZN
KQ0KPj4gKwkJCW5iID0gU1pfMTZNIC8gUE1EX1NJWkU7DQo+PiArCQllbHNlIGlmIChwc2l6ZSA9
PSBNTVVfUEFHRV8xNkcpDQo+PiArCQkJbmIgPSBTWl8xNkcgLyBQVURfU0laRTsNCj4+ICsJCWVs
c2UNCj4+ICsJCQluYiA9IDE7DQo+IA0KPiBBbHRob3VnaCB0aGF0IG1pZ2h0IGJlIGEgc2FmZSBk
ZWZhdWx0LCBpdCBtaWdodCBjYXJyeSBjb25zZXF1ZW5jZXMgZG93biB0aGUgcm9hZD8NCj4gSXQg
bWlnaHQgbm90LCBidXQgaWYgd2UgcmVhY2ggdGhhdCwgc29tZXRoaW5nIHdlbnQgd3JvbmcsIHNv
IEkgd291bGQgcHV0IGENCj4gV0FSTl9PTl9PTkNFIGF0IGxlYXN0Lg0KDQpBaCByaWdodCB5b3Ug
c2FpZCBpdCBhbHJlYWR5IGFuZCBJIGZvcmdvdCBpdC4NCg0KSXQgaXMgbm93IGluIHY2Lg0KDQo+
IA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2h1Z2V0bGJwYWdlLmMNCj4+ICsr
KyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jDQo+PiBAQCAtNTMsNiAr
NTMsMTYgQEAgaW50IF9faGFzaF9wYWdlX2h1Z2UodW5zaWduZWQgbG9uZyBlYSwgdW5zaWduZWQg
bG9uZyBhY2Nlc3MsIHVuc2lnbmVkIGxvbmcgdnNpZCwNCj4+ICAgCQkvKiBJZiBQVEUgcGVybWlz
c2lvbnMgZG9uJ3QgbWF0Y2gsIHRha2UgcGFnZSBmYXVsdCAqLw0KPj4gICAJCWlmICh1bmxpa2Vs
eSghY2hlY2tfcHRlX2FjY2VzcyhhY2Nlc3MsIG9sZF9wdGUpKSkNCj4+ICAgCQkJcmV0dXJuIDE7
DQo+PiArCQkvKg0KPj4gKwkJICogSWYgaGFzaC00aywgaHVnZXBhZ2VzIHVzZSBzZWVyYWwgY29u
dGlndW91cyBQeEQgZW50cmllcw0KPj4gKwkJICogc28gYmFpbCBvdXQgYW5kIGxldCBtbSBtYWtl
IHRoZSBwYWdlIHlvdW5nIG9yIGRpcnR5DQo+PiArCQkgKi8NCj4+ICsJCWlmIChJU19FTkFCTEVE
KENPTkZJR19QUENfNEtfUEFHRVMpKSB7DQo+PiArCQkJaWYgKCEob2xkX3B0ZSAmIF9QQUdFX0FD
Q0VTU0VEKSkNCj4+ICsJCQkJcmV0dXJuIDE7DQo+PiArCQkJaWYgKChhY2Nlc3MgJiBfUEFHRV9X
UklURSkgJiYgIShvbGRfcHRlICYgX1BBR0VfRElSVFkpKQ0KPj4gKwkJCQlyZXR1cm4gMTsNCj4+
ICsJCX0NCj4gDQo+IFlvdSBtZW50aW9uZWQgdGhhdCB3ZSBuZWVkIHRvIGJhaWwgb3V0IG90aGVy
d2lzZSBvbmx5IHRoZSBmaXJzdCBQeEQgd291bGQgYmUNCj4gdXBkYXRlZC4NCj4gSW4gdGhlIGNv
bW1lbnQgeW91IHNheSB0aGF0IG1tIHdpbGwgdGFrZSBjYXJlIG9mIG1ha2luZyB0aGUgcGFnZSB5
b3VuZw0KPiBvciBkaXJ0eS4NCj4gRG9lcyB0aGlzIG1lYW4gdGhhdCB0aGUgUHhEcyB1bmRlcm5l
YXRoIHdpbGwgbm90IGhhdmUgaXRzIGJpdHMgdXBkYXRlZD8NCj4gICANCj4gDQoNCk5vIGl0IGp1
c3QgbWVhbnMgdGhhdCBtbSB3aWxsIGRvIGl0IHByb3Blcmx5IGJ5IHVzaW5nIA0KaHVnZV9wdGVw
X3NldF9hY2Nlc3NfZmxhZ3MoKQ0KDQpDaHJpc3RvcGhlDQo=
