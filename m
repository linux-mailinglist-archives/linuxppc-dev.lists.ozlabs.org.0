Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1875FD588
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 09:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp1P631vlz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 18:29:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JIDbEhwQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.85; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JIDbEhwQ;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp1N42QRtz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 18:28:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFUqGmAG1G6X1IybS8vPitFFoYBu00ljq3ury07W2Zm2J7knPAQXA69oldacRYpE6R/U26Uhe26NzJz7umNf/03qJLutP8cObqugZLZJUns8leOBkBuuiQrcEAv3my7c38RZdTbxohZky0NURft+ZNW5HjPQO5pLZfFwxujga6NLYqmPaFI7dl7D1lc7e1R4d7fn1WuSpsHLPPAhsgRVj+lavLnyYCLl1HjmRiNHUKxURKyo8q93qIOluNTILM4yGN/rChpGoXAq8lHvPq8JSUaOu+O58t03SFpfCJxxm+pOZ4qJJW4TqjLF4+RKeWVXm6MBMYxLqkvoyK6MNF37EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MxxYdF3rCuWhNT1Upx5AHDUcbFC3OJ4ZcHTwX5RQaY=;
 b=doaI0iyEwWnIPhgPQuWltAXaU/F5r5ClOgLqALG44NVNb2lOWF/7thbjV7vVOt+RXQF/ZtnN64UG7rnKBW6AECJXnSQRWlncGFG+WkCawK28B+TQaP7OGmPsvj41PFbeLxIRrvqQndGHWTgK+z+rRx2R1nAWJ08dQrQvh6rN22MGJ60mvNRCQ68/y0VvHg0dZUbQqH9zg6GYa8Iru+Hc+FCe1qbanhz9nxXE8BVMYh9eJ2qFXTaxSI28g+4byMkASKppbFEQDvY/hY52k1ovhl7IqtQe+xJmUT6Qg/sTYmT0/tdTgzkNKQKHtz8FuQsdgpkPFmvoKdCv7ALo/rvCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MxxYdF3rCuWhNT1Upx5AHDUcbFC3OJ4ZcHTwX5RQaY=;
 b=JIDbEhwQ763LgjSam05U/65aBCCRqw7S8dM8c8AG+V8Byd2dBNAErcgEIL/PL8pU0vvAJtMKQSrMwfsEbC5z3sHRnczprd7Oy9S1+phvR2EHsgiwQaPqLlxnEUec8Eoo61X5yuLeQ21jzdi5SqISP4vgVK+jXi26wwc6XviM+c24kzopgZg+ytfsU14f5BFcZdTNbtXcdMhVgZeXi06p/AFjQM7WclWUMgdriEwlR8fafqtQwhIhynhROFju6n2jI0jYTR5eSG5ib0ztpKvC5iBJTWCaVrhyAbhYydtPkK51M2mOLGUdm4d7PCjmZ1V6bPBzOxm4j+7xTdKlup1xNw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1851.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 07:28:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:28:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Andrew Donnellan
	<ajd@linux.ibm.com>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Thread-Topic: Issues with the first PowerPC updates for the kernel 6.1
Thread-Index: AQHY3geW3ZkxvjVPNkGDuJz9qE3ZxK4KZDIAgAGDaQCAAAcAgA==
Date: Thu, 13 Oct 2022 07:28:14 +0000
Message-ID: <c91416ef-f450-9111-a0b1-4e04070ac309@csgroup.eu>
References: <ed1c9254f651a211bd03b1678da7506479901fa1.camel@linux.ibm.com>
 <B5BA2A96-7D15-4074-B977-169B905D5F25@xenosoft.de>
In-Reply-To: <B5BA2A96-7D15-4074-B977-169B905D5F25@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1851:EE_
x-ms-office365-filtering-correlation-id: 71317918-a5fd-4eb1-7193-08daacec7d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /uS1SHaNM9nWCiN5mwM9balOQm/UkhqG5kmpxLhSnljaGsv/ih1kQiW/OaUY9wCr6HASMfFdLTk1v0XWYGrCmMddKIH081Ca8PZmDETp8sG2H8Jq95wWubSr+yqUpF4dNOoJzuxdiG+T5DHYKAf4pcQhXG6IlYzB5ZoF9dXZ1rNn/OK+Zq37GWxMSxGS+AaqXnVJ7k5DOIeAU/k/p3lcBGBakJV++lZbMlS6DfATdz8Z55FDxxw+DMBVc9LmYJe48REjOdzCtgNLjZ0PIqeLLBPD7hDPytRPZW6BADcD3lVEuyFAJ5z6xd0HCpmb1JuK7e0sbEypofR73/8Tx9C3SyI9V/SSfbw2SJ9MoRvpBlXTmln3z9fAntOPBv6KM7+6YApEPpgAtHhMpUxN0AetWvSm+XBGQgMU8dasMcaME9X1ud88BxRefAnpLOEbDXSYEqkxSUKjUjCkiIJ7+k2zG86eaqDEJvcpO+vWC2opSWruAx7pC4bxs+IM6IkFyy14rH2V5JWCOsGM8imIiWlC0HK13KUtvDA7yQhlOUtxQlSCbLaggdSIy64R2TW5gZDhM3IrREa3ymY7U4kRiZXDaekzZiHxcsZdKmzehMHam41zi0lHDllapbeCDDwmwLwyerZa2TCyv99hQa8hC/PRtFGUc/Wg7FRNUUSYVtpuY/u5ssR8P96Uw4ErKxgz5WAcS2f8+gpuP2/Pa4FwS6VIZTOIEima9tSxqQ9XhjtqTyVkmkGV9DBv/s99gylB77Jd2aqC7SvzPkvRec2sndtaOSLn5+QvDoXjLWCbMcXDpy+Xk3fUXat3GFCmEQLThFDb/s2wYJIm3UGc4ytddtBuzutiXyM0lG9T7dsrR26YlnU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(451199015)(2616005)(186003)(83380400001)(38070700005)(31696002)(86362001)(122000001)(38100700002)(44832011)(7416002)(5660300002)(4001150100001)(2906002)(15650500001)(41300700001)(4326008)(8936002)(8676002)(64756008)(478600001)(6512007)(26005)(6506007)(6486002)(316002)(66446008)(66476007)(66556008)(66946007)(91956017)(76116006)(966005)(71200400001)(54906003)(110136005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MnBOSWkzY2JUeGhsYXlhNDZQK2JCc2E3MHk5M3l0dzgxS1JnckMzMmFOcWVL?=
 =?utf-8?B?Y01YWVNobFNLY3VzaDlWWFVJQ3dvUTNsTVlOdXdFVkdQVThIZGtVOGxxTjEw?=
 =?utf-8?B?bjNmaUlFZXhpZGZ5WHU3c3Ard2NoSVZHSS9NaWs5QnczaWs5YkIxZzB2Tmsr?=
 =?utf-8?B?ZXU1UE5helFyQUxVY0NwMXlxS0pVL1RpVTNQVTRuZ01qOVBFMU90MTltNWdN?=
 =?utf-8?B?MHRIUzFPVFdiaWJFUjFwM3BzZVpHdU5xbVRGbUFvQnJHQkVSS05YVG1ESVh1?=
 =?utf-8?B?WDhKUFdVTnVRYTFXeE1mODZKdXNLVDVuU2lHNXBmNjJueG5XL3pFRDFLUmdi?=
 =?utf-8?B?UTdBNjc4ZGx3SFJWNXRWZzZJK0dULy9pZzFIVlNIdHU4cmxTUXdoSlR1ajUz?=
 =?utf-8?B?T0lEQUpna0JLdWpRTDVHQTNLZVg0ZjdPMFpTUDFBL01Xb1plRVptNndPRE83?=
 =?utf-8?B?N3RlZjY5bzRNQjFxOFJpbkRtNEp6WnpQR1YyaGNGTVVIWjhHUzdOTk12ZXNQ?=
 =?utf-8?B?QWxiL3hRdkYwRE4xbnNPUzQ1ZjFVcUFXMkRnYTdBL21CUHNMNzdWOTVRWXgz?=
 =?utf-8?B?cVhrZjQ3OHZFRmlURTQzRk9hNDVqaXJJUGpobXVOQS9teEhDMHEvS2ZLM2xx?=
 =?utf-8?B?ek9NMmZJZldzenA1dklrREpib1piOU02d3Vuc0ZZZ2I3VzNhM2FubW81QzFp?=
 =?utf-8?B?dmZrOWxrbm9CVTFYL3AwbWptdDIzY0owSFpzTys0azAwWk5adGlOamdpZVVI?=
 =?utf-8?B?Yi81L09VOGUvMWtqVUNsb1RNeEJxRFgzdmN3OVU0Mk80dUwxekJETFRTN1JT?=
 =?utf-8?B?M0JkZm5kTXR6cWh3cDVhQjBObDQrQTc2cW4wSEtwQm1FdkRwMnoweCtKU0J4?=
 =?utf-8?B?SnFmS1pZYmVzSitpNG9mejNZTGNFbVgwdjFVYXRkZmVVWnFBRmxOL0xaQWRo?=
 =?utf-8?B?UDN4UEl0M3VZQ1VnWGgrc29XYmVJU2lJLysyR1lOVFZHTnJyOENSWVFJcGRu?=
 =?utf-8?B?NzJSWXo0aExFZTAyc1BVRkpPMWVmWTBSVTNYclRBVmdmMExaS1hrbkJ5TFQ1?=
 =?utf-8?B?ZFJEWGt5NWxGQk05VE9BUE5OeWhxOEtZcDZnV2dQNmc3S05rdUJsbUVGTlBr?=
 =?utf-8?B?bG1wdFM4OHkyRGRJRE1EZnRHV0FTTS95akRYWk9wK1BGRjltT0ZsYWNGWUli?=
 =?utf-8?B?eW5oQ2RuSWViL2wrNmZuQlBpQW1SR1psanh4T2JWNTg0Y0VwV01pbFdwUlp4?=
 =?utf-8?B?NjlYanh5Yk1rN251S045ekU4THArbUJWZGVpRU92bUxXWDFVcFRMQnZ0enUr?=
 =?utf-8?B?cksrTGd5THV1NnIzR2d5M2ZWcGk2NlpIelFiRitRQlg4ODRoa2I3OHdPU0Q5?=
 =?utf-8?B?SFBzSzhwRWljbThBZU92azljRlY5UEswZkw5T0E4NW9GTm9DcW5ja2hvRjJn?=
 =?utf-8?B?ejhIb0lHNnlibzNUUkhLNGxkWjIyNWduZm1Vc2dDTXlPUjNSK3F4SVQvbEpP?=
 =?utf-8?B?Nk9LUXZac1pSOWFCcGdhR01aREFZZFBqRUZzNXljZE5UalJOejM2SWp3bE9y?=
 =?utf-8?B?MDhmTG91S0ZiN1dQclZaS29RbG91bldCRXBKendaUU52KzdPS0JiNW5XSnNC?=
 =?utf-8?B?U0xhNFFSTHIzamgzNmtzdU9QZFpWMFUyeHFkN29GanYyTVkzQUpkTS9PWmZ2?=
 =?utf-8?B?V1YyVml6TVZtT25PVTd2N0hmcWJmbEZwR1Q4K01aTkJPSSt1angwLzF4K2py?=
 =?utf-8?B?SXM2SWMrVFBaUyswMEVtV3JyNm5oN2lKc0ZyVjM3Q2Y4bS94RTU0dTl3Mndh?=
 =?utf-8?B?UlR1Y0pEd0tkYzRNMERIM3FwUEpEa2phTXZYU2Q3emx2VDAvMGlwRWY0K0lE?=
 =?utf-8?B?RWJrYUZDbjFqbnhVM2lXZXlzVUhKNTRpTHVFRW1oQmxKVkNRZUFwSG95Y0Rh?=
 =?utf-8?B?L0hwcW1xd1hLamNrdFZwbkR0L01jaDkvTkhycE5jMGp0TEtEdzRxRWNHdWc2?=
 =?utf-8?B?T2N1RUhJK0s2MXVrRTN6RTZIbnA5cUovd3Q2RjlZVEFJVjZyVWQzMVZhSHZL?=
 =?utf-8?B?SXB0eHRFUXVETUYvc09MU29TMTVFdjh5Z2IvVlN6YTZUMFB2bWtXbDFQWW9s?=
 =?utf-8?B?dHBwQ3lCM2dJTUx6TTZySVZ3ckZFbnp0QWVMV0xQT3RZODhUSHVkbGZPL2cr?=
 =?utf-8?Q?iT8hgdXppz8987Ft7Y8WjCA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EFA4E75540D8E42A10145BD2E4226F4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 71317918-a5fd-4eb1-7193-08daacec7d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 07:28:14.3994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ngQvv+Bpz6wdJD9I3dKTMd5etngAw3m7RXzbfxyYz36Fj93kxBur/t3gy/fz5jCNhUpJTcrQzR8HaNXxNSwCpoAkBvtNRn3N0Wi0Kax9jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1851
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEwLzIwMjIgw6AgMDk6MDMsIENocmlzdGlhbiBaaWdvdHpreSBhIMOpY3JpdMKg
Og0KPiBIaSBBbmRyZXcsDQo+IA0KPiBEb2VzIHRoaXMgcGF0Y2ggYWxzbyBhZmZlY3QgNjQtYml0
IGtlcm5lbHM/DQo+IA0KPiBXZSB1c2Ugb2Z0ZW4gMzItYml0IHVzZXJsYW5kcyB3aXRoIDY0LWJp
dCBrZXJuZWxzLg0KDQpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCBpdCB3YXMgYWxyZWFkeSBjb3Jy
ZWN0IGZvciAzMi1iaXQgdXNlcmxhbmRzIHdpdGggDQo2NCBiaXQga2VybmVscywgYWthIGNvbXBh
dC4NCg0KVGhlIHBhdGNoIGFwcGxpZXMgdGhlIHNhbWUgYXBwcm9hY2ggZm9yIDMyIGJpdCBrZXJu
ZWxzLCBhcyBleHBsYWluZWQgaW4gDQp0aGUgY29tbWl0IG1lc3NhZ2UgOiAiRml4IHRoaXMgYnkg
aGF2aW5nIDMyLWJpdCBrZXJuZWxzIHNoYXJlIHRob3NlIA0Kc3lzY2FsbCBkZWZpbml0aW9ucyB3
aXRoIGNvbXBhdC4iDQoNCkNocmlzdG9waGUNCg0KPiANCj4gQ2hlZXJzLA0KPiBDaHJpc3RpYW4N
Cj4gDQo+PiBPbiAxMi4gT2N0IDIwMjIsIGF0IDA5OjU2LCBBbmRyZXcgRG9ubmVsbGFuIDxhamRA
bGludXguaWJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4g77u/T24gV2VkLCAyMDIyLTEwLTEyIGF0IDA4
OjUxICswMjAwLCBDaHJpc3RpYW4gWmlnb3R6a3kgd3JvdGU6DQo+Pj4gSGkgQWxsLA0KPj4+DQo+
Pj4gSSB1c2UgdGhlIE5lbW8gYm9hcmQgd2l0aCBhIFBBU2VtaSBQQTZUIENQVSBhbmQgaGF2ZSBz
b21lIGlzc3Vlcw0KPj4+IHNpbmNlIHRoZSBmaXJzdCBQb3dlclBDIHVwZGF0ZXMgZm9yIHRoZSBr
ZXJuZWwgNi4xLg0KPj4+DQo+Pj4gSSBzdWNjZXNzZnVsbHkgY29tcGlsZWQgdGhlIGdpdCBrZXJu
ZWwgd2l0aCB0aGUgZmlyc3QgUG93ZXJQQyB1cGRhdGVzDQo+Pj4gdHdvIGRheXMgYWdvLg0KPj4+
DQo+Pj4gVW5mb3J0dW5hdGVseSB0aGlzIGtlcm5lbCBpcyByZWFsbHkgZGFuZ2Vyb3VzLiBNYW55
IHRoaW5ncyBmb3INCj4+PiBleGFtcGxlIE5ldHdvcmsgTWFuYWdlciBhbmQgTGlnaHRETSBkb24n
dCB3b3JrIGFueW1vcmUgYW5kIHByb2R1Y2VkDQo+Pj4gc2V2ZXJhbCBnaWdhYnl0ZSBvZiBjb25m
aWcgZmlsZXMgdGlsbCB0aGUgcGFydGl0aW9uIGhhcyBiZWVuIGZpbGxlZC4NCj4+Pg0KPj4+IEkg
ZGVsZXRlZCBzb21lIGZpbGVzIGxpa2UgdGhlIHJlc29sdi5jb25mIHRoYXQgaGFkIGEgc2l6ZSBv
dmVyIDIwMA0KPj4+IEdCIQ0KPj4+DQo+Pj4gVW5mb3J0dW5hdGVseSwgTWludFBQQyB3YXMgc3Rp
bGwgZGFtYWdlZC4gRm9yIGV4YW1wbGUgTGlnaHRETSBkb2Vzbid0DQo+Pj4gd29yayBhbnltb3Jl
IGFuZCB0aGUgTUFURSBkZXNrdG9wIGRvZXNuJ3QgZGlzcGxheSBhbnkgaWNvbnMgYW55bW9yZQ0K
Pj4+IGJlY2F1c2UgQ2FqYSB3YXNuJ3QgYWJsZSB0byByZXNlcnZlIG1lbW9yeSBhbnltb3JlLg0K
Pj4+DQo+Pj4gSW4gdGhpcyBjYXNlLCBiaXNlY3RpbmcgaXNuJ3QgYW4gb3B0aW9uIGFuZCBJIGhh
dmUgdG8gd2FpdCBzb21lDQo+Pj4gd2Vla3MuIEl0IGlzIHJlYWxseSBkaWZmaWN1bHQgdG8gZmlu
ZCB0aGUgaXNzdWUgaWYgdGhlIHVzZXJsYW5kIHdpbGwNCj4+PiBkYW1hZ2VkIGFnYWluIGFuZCBh
Z2Fpbi4NCj4+DQo+PiBDb3VsZCB5b3UgdHJ5IHdpdGgNCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjEwMTIwMzUzMzUuODY2NDQw
LTEtbnBpZ2dpbkBnbWFpbC5jb20vDQo+PiB0byBzZWUgaWYgeW91ciBpc3N1ZXMgYXJlIHJlbGF0
ZWQgdG8gdGhhdD8NCj4+DQo+PiBBbmRyZXcNCj4+DQo+PiAtLSANCj4+IEFuZHJldyBEb25uZWxs
YW4gICAgT3pMYWJzLCBBREwgQ2FuYmVycmENCj4+IGFqZEBsaW51eC5pYm0uY29tICAgSUJNIEF1
c3RyYWxpYSBMaW1pdGVkDQo+Pg0KPiA=
