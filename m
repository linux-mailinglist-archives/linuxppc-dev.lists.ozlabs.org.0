Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36D6223BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:13:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6ZQn2Drfz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=16ZbTJTx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.53; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=16ZbTJTx;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90053.outbound.protection.outlook.com [40.107.9.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZPm0Dt7z307C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:12:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUHj/W4hVpIUPlJBRKxLiDFhdFEOzCBWzX7VBDqTU6tOTRc0Jaw19KRlt0YhHTKINA5+V4tGgy/OETP39WJwRq1y0kSec4jsAAWVZmsQPqzgiTfEa7iMMYJbvPKp7yOIdbXSGuguLnJnZZsDnb+2L+GndUSqYK8YnPpO8Z2QcF87qKXUvJZDZCxo4ybb11RG1nktS/TWya3G4+lY9fWpGK32+FcxhHG3aWccUhN45K+n6KqNN834vR9p0UcNRQ/THzuo8Hi5knFaOIe6XQFHz6D4h+Wm2kPKFogmnyoJcBcAV4xUEGh/+rfW5iD3qfNynophzCZuKJGQp8WqStXmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7AQVu4WBX1yF+UsJMHREStfvkazvd12/UlFBL8n/rA=;
 b=VMwjWOvrEbHXI2u6s1bEVb6PRam2eeEKvz6L3x9GnOzrZ5mn8rP98N9PtJwgB7jgzmtIlwlUUkxkcWSzqkF3rxLHdnuh6FGehx3Y6pSSF3jn3fr8w7Kwx0jILjhFSh4fs5k5QsB335MB8WC4gVe3jESv82N9B9p+2UJHgzynVAuAmaE60dNJMtwcS0D77Du5IugGCaAuTmXsd2M1IJWfFmtCKrz4Gn84Q+UOoE0s6aXMzNbKLLXRiivCXwFXij9aJK9+7yeOgZ4ehcfO2cMbtPUiDb2itrLPV+kNcCGisEkHWz2M1fPz30f5cvMMqqLSWhAUwFesN7Uy1hh3+6rPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7AQVu4WBX1yF+UsJMHREStfvkazvd12/UlFBL8n/rA=;
 b=16ZbTJTx4Fz8jUIWmo1Eu6oZVNedwlk3aOoW6mgYSb4iRPmkHzSf3P+q7n4VKWsUR5szXM2nCmMBt640L01z7iGgu9NYwnYNejcEnQY8RS7oQnr2D7NLgieTeYpAZs2eQGk2Ycw6j6faZtMc2i5alz+oQ5Kuvfqt6HddhgvgpGplYdVQp1s84E7Rex7ymKWA5zMcizw5CA0IGtiXYMHUQIf7noSposAiHKvC70ZDcja4TL/CbkOoxyHFAxf1LUOAqy7y3hgnOttco7x9GXFe52zmb27/x7BAec/2lKWwKuiYTeMPYHfrzQhlls8eleL6uN1ABsJPGJmiJKIhHREN5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1865.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 06:12:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:12:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 2/9] powerpc/code-patching: Use WARN_ON and fix check
 in poking_init
Thread-Topic: [PATCH v10 2/9] powerpc/code-patching: Use WARN_ON and fix check
 in poking_init
Thread-Index: AQHY8/b4oNVXFI2N5kKYXjxtrZNXYq42HHOA
Date: Wed, 9 Nov 2022 06:12:06 +0000
Message-ID: <9790e4a7-4d28-6040-a80b-39ab2674dd51@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-3-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1865:EE_
x-ms-office365-filtering-correlation-id: f589c531-7d69-4ac6-d2a8-08dac21953f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3weQ6I4U0XH6IFoDXymRN/46E8Lw8lzEOzHzl3d45cEblgD1k1xrTJTExkrRMzaINpG6EmgBcJR7F4S26gtgBW1MyU6/JJ8jGXIv9rFu7sa015yQcrwV5/Db9reHLh1/owrFPB44hSsdzLMaCQTB26G2Z1tKCTRZaClppO3VDp0in8jUvdgDw6rblQuR9yb9kWeTNp4LuuGVq9wxVXN0c6ur3vP2NqsCTSyslRdTK5GHW1m5mKffuGstwdSoY2NORqWfxz5q0US9soh8Vg76YAJokvBpx6uDKxScfXBDNXXX1Mqb9J5UzcBv+E6gthlgs1cQg2zGmbYACj7etif+bYSfEJohao9KwY9Hz1vjJHF3y+nE+de43EFctoqhcBFCeJaHTc3yX+TUgmm9hoPd4ZynFzLq3p2qzHGYaRfU8O45BxEo063uq8SgEART3dVPBxWpn3KgH+VWUBB7pgKsAiuwooSRN2+1EHQjMDWN8som5mLf5yzAlTJzaKMolPJyFGs+O34u1lLssXcHdq0LfScQ5Vbli0EuFsVf9B3PAeBQa2GJW4eUc295DkR4FJOrx7sLY5X0TXtKERrnQzpOpMuIW9i54uIEcDKjIDg/6iQTi+ZqFSu+cCxP2arbMTffHTRA8/HB3+7jZXK97/nt1WXGIzeomRb7nkNNtgk4HFZMqbPCjj2kxql8EBKmlBXUSslMwrFlnBvhqcF2tbNbSYIkAfAy9lAFM1Wiqzp3lAqTYIkHKQgaID9cRom4Avkh0UEBjw8SoHlcXEQz1Efyij7Ho+f0SNVxg3lHImlkmOKUx21E1GwRsdpfUGe/8uNrB6bF1SeDyCQkQOpWO63Hjw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(91956017)(8676002)(86362001)(66946007)(4326008)(66446008)(64756008)(66476007)(76116006)(31696002)(316002)(66556008)(6506007)(6486002)(478600001)(2616005)(66574015)(186003)(26005)(36756003)(54906003)(110136005)(38100700002)(6512007)(38070700005)(83380400001)(122000001)(8936002)(71200400001)(5660300002)(44832011)(31686004)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MHJ6akJkcENlNzVoZDdNd0VITjdLWmttQkZQTEhkeWFEVWVIVEZxMDBlVDB2?=
 =?utf-8?B?ZUNKZlBnNmN4bzgzN1hpQloxSmRwcm5EWExDSWQvN2xZSEZKUGtpV0dTWElI?=
 =?utf-8?B?R0JsUjcyT3ZpT1BjRFBuNkFoT0NjWnNvVzB6YVh0ZC9ZN3hQRFk1M3dCb3E3?=
 =?utf-8?B?MEt1UEpOQVlZMmZoUmlKUmZJTnZFMzVNTHpmb1NDdDFITFVXTkl2UDlBN0xi?=
 =?utf-8?B?OEh1ek84Ky8zZG5Sa05oZ2JUK3VCbHlVRGNPVEtsS0JtS0Z2dWhJUnduVU5O?=
 =?utf-8?B?eU5PMEs5ZGk4aHF4TXZzcHE0aFEvdDhpVFFsZS83TVJoYXBwVThGVWxGZmc0?=
 =?utf-8?B?cW91M2NWaWwwT1BxbjN2ZzdFUllHVXdHVksrSnhCalZUekgzREtVRXFORElL?=
 =?utf-8?B?bE9FNFBMQ2liR2JDbWMxZ0hFeER4ZVpreVpMMGtPdk1MYmsxU1IzRHJFQkdy?=
 =?utf-8?B?WDg0TTE0Z0tIWm1QT1RKZWFRZDRuWW82YnVXRmFSTy9KVGo5alpsd2k3eGRy?=
 =?utf-8?B?TGlZdUlQZ0JaZFpmU3NsVGR4c3VyM3h5M0xjb2ptMXBmN2tYbHRBT2hNZ1Z3?=
 =?utf-8?B?WXRjeDNkQ0I4SlJTb043RXo5MC92N2lsL2szUXFyV1g4NzMvamFraHlGWitD?=
 =?utf-8?B?dStKMUxSSUE0dlNiQThac1Fkd0xsY1gvb2h5QUoxcFZYNG5GRUp1T2hzZVN4?=
 =?utf-8?B?WEZaZW9DU3hBdklRZXNRak9UTUI2YjFxbTN4eXNIYzNtVXhXR0Y2c3VKaWFI?=
 =?utf-8?B?dUNENVlPelZ2d1pJTmxMV0RraG42bmpUVkhQOUxPODdKYjgwTk9jNjZveHJX?=
 =?utf-8?B?Q0dxWHdaVVNlT2tNZU9CcEt6WE12dXpOTm9NUUV2RjErRDJqU0xiZHlqMlcx?=
 =?utf-8?B?ek5VdDloMWUrejdxZjY4Vm1FdDhGU3JJT0lkdHYxeEhNTUxiOWlEZGNtU2xY?=
 =?utf-8?B?aDA4aFp1eHhGelIzVGVPRW5NNUZvMHdMeTYxV00vVmxuWDVld0tNZ0oxYjZY?=
 =?utf-8?B?WGIySDBQS3M2bWdHVEc1Q3J0RzNuOW43NXRlKzdpQkVHSW5EUlNQaURTK3F1?=
 =?utf-8?B?SFNDRDcvUXMvd3VYckVjMmtKUmhWUVhVbVRZNkdsaEpCUC95ZWNrcXVBM1Fz?=
 =?utf-8?B?Z3BFY0MrMlAyTEJqZW1VQUtYbDdMcGR4Rk11YmFmYTBSVUxHanZHU051bTlF?=
 =?utf-8?B?N2F3M3JVRy94N3VzODkraVFEUGxNcHh6N3ZNeEhiZ0lkcVYwRDRFM3lIRmwv?=
 =?utf-8?B?ZWFNWTFHSTRNZmI4alJvNno4emY4Mm1zWm16MXI2bnJFNmVySzlUOVlWcjdh?=
 =?utf-8?B?bGgraGtkclQySnR6MzNubGJZdXh1VERMMytBWXI0NG50NWNzRDJKWjdLRjJr?=
 =?utf-8?B?bjU2S083R2pYVWFKZkFZL3ZORjlFVFUwTVhEcjBWZEhtS0dGaE1RTDl6YjFW?=
 =?utf-8?B?TmU0cUpRWkNlR2JQUlU4RnlWSGo0Ujh0MlQrbWRYbHd5MGlZUzZqS2o1aEFM?=
 =?utf-8?B?eWJaNmxFR2J3VUtudklRSXJQeHlUeUhJQ090SEprb3dwZ2QybmF1cHR5S294?=
 =?utf-8?B?Nlc0R1BHdWRFRlpHVkNMNXM0OUg5RXlQMUJseFhxRm9kL2hyWDJhcUhrYnVU?=
 =?utf-8?B?cTFsSk1HMHAvZFNXUXhSd2ZLWGZtL2lOM1BBT1RLT2FpVmhWYjN2ZzdjaVps?=
 =?utf-8?B?eC81aERURmJJNXovUkNvV3RURGkybURRVGtBVHljcGY0eVByRis4RU5Pd3VY?=
 =?utf-8?B?OG02ZDNhU0QzcmR0ckFXYU1qQU80QVU4eEtwbmQzb2lYTGxLNnBmTGY3YURT?=
 =?utf-8?B?RjZ4a1JuYUJ4YndzYmx0a3JVdTlBbjgzS2ZpSnpsQ29nZFdvN1NxdFhqTFJO?=
 =?utf-8?B?WG5KSEhCVmZYczd6YXE3Tzd4a0ZWd1hxdDZ3dERXQWw1WFJ0WUdwNlhlWGRs?=
 =?utf-8?B?WDBGK1BwQXZ1STNMdEZ4MkMxOWR6Q3FFWGlUWVRVNkJtODdKVlZBbEZMbTd5?=
 =?utf-8?B?a1NwakZMaHdKcmp5QnNVM21uMlNDRXh6c002TTVmNXJJQkJ4WDQ3MlVycjZs?=
 =?utf-8?B?aWxsSWxsUUxJVmlLS1FZeU9nM3lDU1JMK09pcW5BYktlMG0zbHVvTUs5RDVD?=
 =?utf-8?B?K0cxYmF0TjUxOVJ0R05DM3pUMlk5eEtEeWI3bVRVb1JTd3hKWCtFOC9aMFJV?=
 =?utf-8?Q?RgmwR3pjO8xYKHyQuUtpjdY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BAEDAB19F3B6849A2F31D56A777A1DA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f589c531-7d69-4ac6-d2a8-08dac21953f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:12:06.4441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLFQuMd9ZVjqM68Omfh+8qgCdGCjKFE8kEoSGMYbZCeZszz3VmghWBNiHe4rTroi/K7t/enUzrlyFRCL1s2WnFA1IErb6HYS3dOR7bEcr2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1865
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
QlVHX09OKCkgd2hlbiBmYWlsaW5nIHRvIGluaXRpYWxpc2UgdGhlIGNvZGUgcGF0Y2hpbmcgd2lu
ZG93IGlzDQo+IHVubmVjZXNzYXJ5LCBhbmQgdXNlIG9mIEJVR19PTiBpcyBkaXNjb3VyYWdlZC4g
V2UgZG9uJ3Qgc2V0DQo+IHBva2luZ19pbml0X2RvbmUgaW4gdGhpcyBjYXNlLCBzbyBmYWlsdXJl
IHRvIGluaXQgdGhlIGJvb3QgQ1BVIHdpbGwNCj4gcmVzdWx0IGluIGEgc3RyaWN0IFJXWCBlcnJv
ciB3aGVuIGEgZm9sbG93aW5nIHBhdGNoX2luc3RydWN0aW9uIHVzZXMNCj4gcmF3X3BhdGNoX2lu
c3RydWN0aW9uLiBJZiBpdCBvbmx5IGZhaWxzIGZvciBsYXRlciBDUFVzLCB0aGV5IHdvbid0IGJl
DQo+IG9ubGluZWQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCj4gVGhlIHJldHVybiB2YWx1ZSBv
ZiBjcHVocF9zZXR1cF9zdGF0ZSgpIGlzIGFsc28gPj0gMCBvbiBzdWNjZXNzLA0KPiBzbyBjaGVj
ayBmb3IgPCAwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGlu
dXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gdjEwOgkqIERvbid0IG1lbnRpb24gY2FsbGVy
IHJlY292ZXJ5DQo+IAkqIERvbid0IHNldCBwb2tpbmdfaW5pdF9kb25lIG9uIGZhaWx1cmUNCj4g
CSogQWRkIHNldHVwIHJldHVybiBjb2RlIGNvbW1lbnQgZnJvbSBsYXRlciBwYXRjaA0KPiAJKiBS
ZXZpZXdlZC1ieSBub3QgYXBwbGllZCBiZWNhdXNlIG9mIGFib3ZlIGNoYW5nZXMNCj4gdjk6CSog
UmV3b3JkIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gd2h5IGluaXQgZmFpbHVyZSBpcyBub3Qg
ZmF0YWwNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgfCAxNyAr
KysrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBh
dGNoaW5nLmMgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiBpbmRleCBhZDBj
ZjMxMDhkZDAuLjMwNTVlZWY3ZGNkYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9j
b2RlLXBhdGNoaW5nLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMN
Cj4gQEAgLTgxLDE2ICs4MSwxNyBAQCBzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfZG93bih1bnNp
Z25lZCBpbnQgY3B1KQ0KPiAgIA0KPiAgIHN0YXRpYyBfX3JvX2FmdGVyX2luaXQgREVGSU5FX1NU
QVRJQ19LRVlfRkFMU0UocG9raW5nX2luaXRfZG9uZSk7DQo+ICAgDQo+IC0vKg0KPiAtICogQWx0
aG91Z2ggQlVHX09OKCkgaXMgcnVkZSwgaW4gdGhpcyBjYXNlIGl0IHNob3VsZCBvbmx5IGhhcHBl
biBpZiBFTk9NRU0sIGFuZA0KPiAtICogd2UganVkZ2UgaXQgYXMgYmVpbmcgcHJlZmVyYWJsZSB0
byBhIGtlcm5lbCB0aGF0IHdpbGwgY3Jhc2ggbGF0ZXIgd2hlbg0KPiAtICogc29tZW9uZSB0cmll
cyB0byB1c2UgcGF0Y2hfaW5zdHJ1Y3Rpb24oKS4NCj4gLSAqLw0KPiAgIHZvaWQgX19pbml0IHBv
a2luZ19pbml0KHZvaWQpDQo+ICAgew0KPiAtCUJVR19PTighY3B1aHBfc2V0dXBfc3RhdGUoQ1BV
SFBfQVBfT05MSU5FX0RZTiwNCj4gLQkJInBvd2VycGMvdGV4dF9wb2tlOm9ubGluZSIsIHRleHRf
YXJlYV9jcHVfdXAsDQo+IC0JCXRleHRfYXJlYV9jcHVfZG93bikpOw0KPiArCWludCByZXQgPSBj
cHVocF9zZXR1cF9zdGF0ZShDUFVIUF9BUF9PTkxJTkVfRFlOLA0KPiArCQkJCSAgICAicG93ZXJw
Yy90ZXh0X3Bva2U6b25saW5lIiwNCj4gKwkJCQkgICAgdGV4dF9hcmVhX2NwdV91cCwNCj4gKwkJ
CQkgICAgdGV4dF9hcmVhX2NwdV9kb3duKTsNCj4gKw0KPiArCS8qIGNwdWhwX3NldHVwX3N0YXRl
IHJldHVybnMgPj0gMCBvbiBzdWNjZXNzICovDQo+ICsJaWYgKFdBUk5fT04ocmV0IDwgMCkpDQo+
ICsJCXJldHVybjsNCj4gKw0KPiAgIAlzdGF0aWNfYnJhbmNoX2VuYWJsZSgmcG9raW5nX2luaXRf
ZG9uZSk7DQo+ICAgfQ0KPiAgIA==
