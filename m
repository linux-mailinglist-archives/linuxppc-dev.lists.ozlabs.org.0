Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75255A459B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 11:01:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGPYS0l34z3c6k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 19:01:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=4OAgZzud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.74; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=4OAgZzud;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120074.outbound.protection.outlook.com [40.107.12.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGPXk4kLYz308b
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 19:00:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AF+mU35/ij9l/HlB/qWAWXgEf0p+gdEUnasTPema2zRMYUR87ePWec81e1kkweaBXJV4q895/0mWfoyyOX/2gq24mABpxKbzhr8s6OptF/VXalT/Zw3hMXH7VORZVEIoxTVmdIYeAQuzoOxQxZi1E2nRdZR3i69d6Aym8oC4uY60EqS/9U6wq49cVb4uZIdcFLbLyc64vTVLKYaEUesXg3ZPgH5PYRLDCxHdhB4QmegBZ+TRVd6pkGWP8h1qYy6vfOJ/QEgFE2suhFLWKiiAFVPR1/olXX3MBUlWOBkqZKwbIhRECwax0TIF2TWIJabEmLvoNuo57C5xoO/whcusIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvSrhCFWxHI6K2Xsqs+b9z1r5F1IfkcUnMsOF+w9Pzg=;
 b=WuQcF9s2koA1jOlq5AIrPqBpl3jspc9GJ6nWX8mbp935RQw9g54Q17t3Pm7np3YqbOqfjKSDlwsb1S/hAVbxCK0hl2f6/Sc7jrAsUPQcm+sm8JG+Ohq9AGQaajNtnmh3tOfTOsxYYXucq65Ansx6q7KTbk7SFRIhX1cmPnCfgD/pVyp+I6zdjT7TLlaiNuo0QWY7jee38yJq/zsxRwSiLWQhUx6RKQzyGz814ljho8/LKsU9dcX0bZGYdIZfiMxMYIXbb2Bb+umME2NZ3A4Z5rvJAU9nlnIH2nhyrXpSX7XUzI9KoFKCpPDsqk8lbYfrr+T4wtai37SfFpaFWS68EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvSrhCFWxHI6K2Xsqs+b9z1r5F1IfkcUnMsOF+w9Pzg=;
 b=4OAgZzudnHuL8LSPMgPnoV+Dh45lxniYML50x4kVMy/letU+tx1L1nrhYXCEn4UE1Oa23JeV7w4dtB1IKtScBe0/EeeNOeLU98t+pCH98V8pYFJ6V5Q4iSFNX1Hy0yYLeWUaQGVi3T5q8x21crcHR4h7gZ1S9eY1niRt7SrVrM8xB74walWIn9y5Kzpy9rx9eukdT0LDzIYOO2MJ+dIrNf2K7D6oUvnYx5v1UY0wCL+y2KOQ9Yc+ApAMKUx0gffTkKdc1FkmWhybcG8ovBhOmvoZ0AvLbTEFJIT1Hl2EHvjNK4qxP+JDglJYdh+wLhFVvMONVXpHBks+YgZoOYWGRw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Mon, 29 Aug
 2022 09:00:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:00:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: clean up binutils version check
Thread-Topic: [PATCH] powerpc: clean up binutils version check
Thread-Index: AQHYujPqAzxj8VR8DU6MKGII5vSUGa3DAv4AgAAHO4CAAozQgA==
Date: Mon, 29 Aug 2022 09:00:02 +0000
Message-ID: <7daf34ca-ed5e-90ea-8ccc-6821127cbd96@csgroup.eu>
References: <20220827164056.3365356-1-masahiroy@kernel.org>
 <58a90319-668f-7c87-4168-e0df10644aa7@csgroup.eu>
 <CAK7LNATJiQc5HMdsct1S5z15-b1fzc5-Y2xtBs6oT17Na79H_w@mail.gmail.com>
In-Reply-To:  <CAK7LNATJiQc5HMdsct1S5z15-b1fzc5-Y2xtBs6oT17Na79H_w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d34188f1-9b94-4b00-6600-08da899cdc49
x-ms-traffictypediagnostic: MRZP264MB2070:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5qg0zFqPZ4TxYkX88/uwNwP3vG14wAvmBHGy5Ay4FdxHiSJKsnwjfd6oYQKH0OHkjBPJOqsRoqQ0tcon0Tx/OCR21x+b3Vx/+ncA9DV1X4VD9guK13vD9pIjfBGZydxiAPUicAaqeHqs1sm2ziNRRZEzto44rEpahSOF9X2lcChUApJbqxzkJ0aSj+rxIX5mYmsF8Lq9xQxFmatFpmtmGB62I8FImcgdXlixI173cVNAlHNbEt4g5PFXJKOCWSOMZKi/Tl0WDwZnMoNQNdMbwdCYO8V3NZidfnqN2n7o4ikPLHDJHCXO5mwHYOEvx8SGYYGk4zgxkcbnQnm8G3JK6gGzJXW0VreCo6gvUuwjVh75y0NvHszaGZbVbMtV/qnZ3PBqxGBjATUBBa/M6AssUAxvI63HRf1nyr3ORM1NZakBgYFgLZnT8fAsfF932nDqlTei6e1Otf0iL4wmAEo6fgKjP1bqdenekB8yecwdnoe7SUreS3wkTaZp4G5MgoE+kcxOmrzf4rJAqn23YE+Ogg/miqN8sCiVljrtHBY4aYJ4GxXs7ZLw65vB/eKMUU/SS03LF6Kp5jmUXDH3GSCEghTrqIxjBlC56Cb33VkHCbZtSHgsKzI0OAbMsFBJKdJl4H1ubviXPBNi3LjdSSVIEDRmEQ8nIw4fP3ZQP5mImHaBcJmW8Vuh2nfBNfe0DDkaY2V9asI5u4bK0ZzXRbZSf57Lhk+zt6yOCfp7cnvxN04A4gpFLeu49B1xNxOZLz5g7ChGAuwvqYTBvo+CEH+7IEmpGXJtoNRdbWay7ZyqiqFQLC/D43GqZLmrduDJgZBI6WQ+gKNDy1OsmnkTVd7q9g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(478600001)(6486002)(83380400001)(6512007)(31686004)(36756003)(6506007)(26005)(2906002)(44832011)(7416002)(5660300002)(6916009)(54906003)(31696002)(8936002)(53546011)(122000001)(86362001)(38100700002)(66574015)(76116006)(38070700005)(66556008)(8676002)(41300700001)(71200400001)(66476007)(91956017)(66446008)(66946007)(64756008)(186003)(4326008)(316002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T3JycEZucGEwd256dGdUaEdENzhXZ1F2NTJLS0MrSGg2cGRNaGtUVUdmSmFG?=
 =?utf-8?B?eW9JU0hGOGZDQ204V1RvNkRPTVdsYlNjMVhpcmlGVFRKWFJZRmY4ck5yanlp?=
 =?utf-8?B?aG44YUpEZlVwMkZLTStkK1k5NmdrcUNaYWltUzA0bnNTMDkrNi9UMFo3bDVY?=
 =?utf-8?B?M3RFSFRuOGdDcDA0Yk9iZEVxVTluRytuOGVodjB2WkRTNkFjZzE5WER0dFBo?=
 =?utf-8?B?bytCRHdaY0lJUEVqd1VzVWFkd3hWcjRNUnh3S2t3K3NYM3o1V1hKcndGY29C?=
 =?utf-8?B?OVhhUVlXbXlpeHNnSlpWbmR2d09sUllJMTQwVjVCM3ZwL2dmYmlXTW52Zitz?=
 =?utf-8?B?THM2TEIwS3hHdDNjQ20xd2ZZdDR6alFUeFVkK254Q0xSWFVBd2Z4TGkzVWJH?=
 =?utf-8?B?RHZWSG02cmNSZStXVldRUThiSWM1UEk4RVJJKzQ5Vk1ZL0FmbzJzWWlERG5F?=
 =?utf-8?B?ZjVTbkx2KzlYSGNjNlU3RU5aZklIK1RYWm0xcS9abjZvNUc4M0g1NDEycjBz?=
 =?utf-8?B?L0pCaDJxUDArTWZObHJrWU5nYjRqWVR1UmRNeEliVzN5VGw0OWI5akk3N3Ux?=
 =?utf-8?B?a3BKazBqdzlKR2dvZmNsNzhvM1JvZDFZbkh6TnlNVGRXRmdlWWZtSStGU2cx?=
 =?utf-8?B?ODl0K2hLRWhzVzZLcXFwY2JLd21FeTNkdUtjSDlUb2Z5QlV4ZW0vUjJTVTVM?=
 =?utf-8?B?RkxCQldnU25LNHNVMDdkcnRVdWQxdXJYUThxanVKeUUrSHZrOVF5WEE4akNr?=
 =?utf-8?B?Y1QwbDdkWGhHSEJrS0ZlRDk2aHkzd1FHU0xCbWI4V1NzbkdMbGJXZGFCWC9a?=
 =?utf-8?B?aDRaYmtFeHdmU2FxWGRMV3l6NlRVMzJleXZKOU84YTZGcytPb241aDZwSVNM?=
 =?utf-8?B?bDBERUs3T1B3aWN3OTFLUE5mQkJDT1VXcG5vREhKTDJxRHh5L2VGL0JMcFVu?=
 =?utf-8?B?QThtYVVHWmdzV1pOVTltVTlJWDZVSytNaVFKNGNEMms4Wm5nanMrT3pLdCtt?=
 =?utf-8?B?eTRNdEVycjl0UHRRZ204aDZFa1Jqd2R3RjZHMFcweWlLT0syNFF0eHNmRFBw?=
 =?utf-8?B?bDJ5cWVFZ3N6R2Fwc1c2OTBOdFhyOEM2R080MlQ5WmFpYkJQYnNPWm1wMTkv?=
 =?utf-8?B?ZWpJN21wM1NyNFBVNXpvVnA0a1pUZzZqVnRQZjNlVmNST3c2QzcxeFovbnRk?=
 =?utf-8?B?WUxOT1krd3MzZGp4WEJ0TFRLRHU0eGllVmV0QURHYlpLeE5OQy9sbk9PdGh1?=
 =?utf-8?B?ODFQNmFGakZESi9jODhXbXdHYnQ5bVJxU0pvUlBZaDBqWENsQzlKMWM1cWlC?=
 =?utf-8?B?dzY1ZytiMzZTOWI5QndyNkhwQjR1V3IwY1c0MzVVMS9MY21JN3BWeW9PaWU2?=
 =?utf-8?B?SW5HZTNHanlqRzM5N3NWTXB0SHBURlc4NW40WmcrdTRjdm12cWV3cEsvOFA5?=
 =?utf-8?B?UldYUUptVEJIa1RTNSs2S2pKNUV2MkZmclpWQkx0MmdmMm16TzlRSmVDOENM?=
 =?utf-8?B?d2lrcEpNTzY5b3dQYytDUUQ0ODA2akNaaDlhOTVMNkNnSHpLMGcvYll3WlFy?=
 =?utf-8?B?SW1aSWlzYW02eGpESlJSRHJaK1B6bEMvOVVickJOTU1HbC9pTHRGUGFWTk5S?=
 =?utf-8?B?K2NROExKQlJWNjFWM3dqNWliTE5ERkhyZmZOQzZiSWZab1BWQ0xsV0c5MGo3?=
 =?utf-8?B?d1Roc0ZUOWlibjB6K1lnNUVWTmhvMnlvOUlQbDBqbVZmMFJCQzAvU2pFUzFH?=
 =?utf-8?B?Vk9qQU14SEd2MnZoWWxpNG95bGpNdDNHWXZudW5FZm5OMmxxTnFmVDNmVjBM?=
 =?utf-8?B?WEhxeGUzQnIrTXI5ZmlJU1VYODhBamttRitoUHBSd2hnZHZPTm5zTDNvUEU2?=
 =?utf-8?B?d1R3eWhjSkNJTmNtWlZmUG5ORkVmQys1WHg3cHZpZ2FyeCs4SW1scTJCc083?=
 =?utf-8?B?Q3ZpdUZMMXZIM2E2N2MzQklYNlBRTGhVTVZoSUkzbWhOaS9uZU5nZlVMeVRj?=
 =?utf-8?B?b250S2kzVHdvTjh1OFgzdk1rSFRLMHJrWmlDUml5SjdUdWpEQWgzWmtEdjA3?=
 =?utf-8?B?Q1ZMWnBRaTFIYUNUUENqei9qWEMvbVZsZzFxdXMyaW5iTTBweUhBRXVlRkt3?=
 =?utf-8?B?T2EvdzlzejFSSUZXUkpUQVBmdCtpR05BLzNRb3JHZENybDlRZXc2S0RQci8y?=
 =?utf-8?Q?J0ofsVsM5mhmIn+L8FfvctY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE83E69CA6BE4644A1BA3B8003214E21@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d34188f1-9b94-4b00-6600-08da899cdc49
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 09:00:02.9410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4eXvsuwBygyxLbwDk9X5w2BYzmWN7naCCGeVNj0XrVDl4r+A5TNu9Upt1vYVVoqHAA636sp50fYsY57CZnF5K9YOM+dHCyMChF+RqbPX/Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2070
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA4LzIwMjIgw6AgMjA6MDMsIE1hc2FoaXJvIFlhbWFkYSBhIMOpY3JpdMKgOg0K
PiBPbiBTdW4sIEF1ZyAyOCwgMjAyMiBhdCAyOjM3IEFNIENocmlzdG9waGUgTGVyb3kNCj4gPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pg0KPj4NCj4+DQo+PiBMZSAyNy8w
OC8yMDIyIMOgIDE4OjQwLCBNYXNhaGlybyBZYW1hZGEgYSDDqWNyaXQgOg0KPj4+IFRoZSBjaGVj
a2JpbiBpbiBhcmNoL3Bvd2VycGMvTWFrZWZpbGUgZXJyb3JzIG91dCBpZiBsZCA8PSAyLjI0Lg0K
Pj4+IFNvLCB0aGUgcmVxdWlyZW1lbnQgb24gUFBDIGlzIGJpbnV0aWxzID49IDIuMjUuIEl0IGlz
IGNsZWFuZXIgdG8NCj4+PiBzcGVjaWZ5IGl0IGluIHNjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5z
aC4gSWYgYmludXRpbHMgPCAyLjI1IGlzDQo+Pj4gdXNlZCwgdGhlIHRvb2xjaGFpbiBjaGVjayB3
aWxsIGZhaWwgaW4gdGhlIEtjb25maWcgc3RhZ2UgZ29pbmcNCj4+PiBmb3J3YXJkLg0KPj4+DQo+
Pj4gU2luY2UgYmludXRpbHMgPj0gMi4yNSBpcyBhbHJlYWR5IHJlcXVpcmVkLCBhbm90aGVyIHZl
cnNpb24gdGVzdA0KPj4+IGZvciAtLXNhdmUtcmVzdG9yZS1mdW5jcyBvbiBQUEM2NCBpcyBhbHdh
eXMgbWV0Lg0KPj4+DQo+Pj4gUFBDIGlzIHRoZSBsYXN0IHVzZXIgb2YgbGQtaWZ2ZXJzaW9uLiBX
aXRoIGFsbCB0aGUgY2FsbGVycyByZW1vdmVkLA0KPj4+IHRoZSBtYWNybyBkZWZpbml0aW9uIGlu
IHNjcmlwdHMvTWFrZWZpbGUuY29tcGlsZXIgY2FuIGdvIGF3YXkuDQo+Pj4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPg0KPj4+IC0tLQ0K
Pj4+DQo+Pj4gICAgYXJjaC9wb3dlcnBjL01ha2VmaWxlICAgICAgIHwgMjEgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+Pj4gICAgYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZSAgIHwgIDggLS0tLS0t
LS0NCj4+PiAgICBzY3JpcHRzL01ha2VmaWxlLmNvbXBpbGVyICAgfCAgNCAtLS0tDQo+Pj4gICAg
c2NyaXB0cy9taW4tdG9vbC12ZXJzaW9uLnNoIHwgIDggKysrKysrKy0NCj4+PiAgICA0IGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL01ha2VmaWxlDQo+
Pj4gaW5kZXggMDI3NDJmYWNmODk1Li5mYjYwNzc1OGVlY2EgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJj
aC9wb3dlcnBjL01ha2VmaWxlDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL01ha2VmaWxlDQo+Pj4g
QEAgLTQ2LDEzICs0Niw3IEBAIFVUU19NQUNISU5FIDo9ICQoc3Vic3QgJChzcGFjZSksLCQobWFj
aGluZS15KSkNCj4+PiAgICBpZmRlZiBDT05GSUdfUFBDMzINCj4+PiAgICBLQlVJTERfTERGTEFH
U19NT0RVTEUgKz0gYXJjaC9wb3dlcnBjL2xpYi9jcnRzYXZyZXMubw0KPj4+ICAgIGVsc2UNCj4+
PiAtaWZlcSAoJChjYWxsIGxkLWlmdmVyc2lvbiwgLWdlLCAyMjUwMCwgeSkseSkNCj4+PiAtIyBI
YXZlIHRoZSBsaW5rZXIgcHJvdmlkZSBzZnByIGlmIHBvc3NpYmxlLg0KPj4+IC0jIFRoZXJlIGlz
IGEgY29ycmVzcG9uZGluZyB0ZXN0IGluIGFyY2gvcG93ZXJwYy9saWIvTWFrZWZpbGUNCj4+PiAg
ICBLQlVJTERfTERGTEFHU19NT0RVTEUgKz0gLS1zYXZlLXJlc3RvcmUtZnVuY3MNCj4+PiAtZWxz
ZQ0KPj4+IC1LQlVJTERfTERGTEFHU19NT0RVTEUgKz0gYXJjaC9wb3dlcnBjL2xpYi9jcnRzYXZy
ZXMubw0KPj4+IC1lbmRpZg0KPj4+ICAgIGVuZGlmDQo+Pj4NCj4+PiAgICBpZmRlZiBDT05GSUdf
Q1BVX0xJVFRMRV9FTkRJQU4NCj4+PiBAQCAtMzk1LDggKzM4OSw2IEBAIHZkc29fcHJlcGFyZTog
cHJlcGFyZTANCj4+PiAgICAgICAgICAgICAgICAkKGJ1aWxkKT1hcmNoL3Bvd2VycGMva2VybmVs
L3Zkc28gaW5jbHVkZS9nZW5lcmF0ZWQvdmRzbzY0LW9mZnNldHMuaCkNCj4+PiAgICBlbmRpZg0K
Pj4+DQo+Pj4gLWFyY2hwcmVwYXJlOiBjaGVja2Jpbg0KPj4+IC0NCj4+PiAgICBhcmNoaGVhZGVy
czoNCj4+PiAgICAgICAgJChRKSQoTUFLRSkgJChidWlsZCk9YXJjaC9wb3dlcnBjL2tlcm5lbC9z
eXNjYWxscyBhbGwNCj4+Pg0KPj4+IEBAIC00MTEsMTYgKzQwMywzIEBAIGVsc2UNCj4+PiAgICAg
ICAgJChldmFsIEtCVUlMRF9DRkxBR1MgKz0gLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQtb2Zmc2V0
PSQoc2hlbGwgYXdrICd7aWYgKCQkMiA9PSAiVEFTS19DQU5BUlkiKSBwcmludCAkJDM7fScgaW5j
bHVkZS9nZW5lcmF0ZWQvYXNtLW9mZnNldHMuaCkpDQo+Pj4gICAgZW5kaWYNCj4+PiAgICBlbmRp
Zg0KPj4+IC0NCj4+PiAtUEhPTlkgKz0gY2hlY2tiaW4NCj4+PiAtIyBDaGVjayB0b29sY2hhaW4g
dmVyc2lvbnM6DQo+Pj4gLSMgLSBnY2MtNC42IGlzIHRoZSBtaW5pbXVtIGtlcm5lbC13aWRlIHZl
cnNpb24gc28gbm90aGluZyByZXF1aXJlZC4NCj4+PiAtY2hlY2tiaW46DQo+Pj4gLSAgICAgQGlm
IHRlc3QgIngke0NPTkZJR19MRF9JU19MTER9IiAhPSAieHkiIC1hIFwNCj4+PiAtICAgICAgICAg
ICAgICJ4JChjYWxsIGxkLWlmdmVyc2lvbiwgLWxlLCAyMjQwMCwgeSkiID0gInh5IiA7IHRoZW4g
XA0KPj4+IC0gICAgICAgICAgICAgZWNobyAtbiAnKioqIGJpbnV0aWxzIDIuMjQgbWlzY29tcGls
ZXMgd2VhayBzeW1ib2xzICcgOyBcDQo+Pj4gLSAgICAgICAgICAgICBlY2hvICdpbiBzb21lIGNp
cmN1bXN0YW5jZXMuJyA7IFwNCj4+PiAtICAgICAgICAgICAgIGVjaG8gICAgJyoqKiBiaW51dGls
cyAyLjIzIGRvIG5vdCBkZWZpbmUgdGhlIFRPQyBzeW1ib2wgJyA7IFwNCj4+PiAtICAgICAgICAg
ICAgIGVjaG8gLW4gJyoqKiBQbGVhc2UgdXNlIGEgZGlmZmVyZW50IGJpbnV0aWxzIHZlcnNpb24u
JyA7IFwNCj4+PiAtICAgICAgICAgICAgIGZhbHNlIDsgXA0KPj4+IC0gICAgIGZpDQo+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9saWIvTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMvbGliL01h
a2VmaWxlDQo+Pj4gaW5kZXggODU2MGM5MTIxODZkLi41ZWIzOTcxY2NiOWMgMTAwNjQ0DQo+Pj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZQ0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9s
aWIvTWFrZWZpbGUNCj4+PiBAQCAtMzgsMTQgKzM4LDYgQEAgb2JqLSQoQ09ORklHX1BQQzMyKSAg
ICAgICAgKz0gZGl2NjQubyBjb3B5XzMyLm8gY3J0c2F2cmVzLm8NCj4+Pg0KPj4+ICAgIG9iai0k
KENPTkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT04pICAgICAgKz0gZXJyb3ItaW5qZWN0Lm8N
Cj4+Pg0KPj4+IC0jIFNlZSBjb3JyZXNwb25kaW5nIHRlc3QgaW4gYXJjaC9wb3dlcnBjL01ha2Vm
aWxlDQo+Pj4gLSMgNjQtYml0IGxpbmtlciBjcmVhdGVzIC5zZnByIG9uIGRlbWFuZCBmb3IgZmlu
YWwgbGluayAodm1saW51eCksDQo+Pj4gLSMgc28gaXQgaXMgb25seSBuZWVkZWQgZm9yIG1vZHVs
ZXMsIGFuZCBvbmx5IGZvciBvbGRlciBsaW5rZXJzIHdoaWNoDQo+Pj4gLSMgZG8gbm90IHN1cHBv
cnQgLS1zYXZlLXJlc3RvcmUtZnVuY3MNCj4+PiAtaWZlcSAoJChjYWxsIGxkLWlmdmVyc2lvbiwg
LWx0LCAyMjUwMCwgeSkseSkNCj4+PiAtZXh0cmEtJChDT05GSUdfUFBDNjQpICAgICAgICArPSBj
cnRzYXZyZXMubw0KPj4+IC1lbmRpZg0KPj4+IC0NCj4+PiAgICBvYmotJChDT05GSUdfUFBDX0JP
T0szU182NCkgKz0gY29weXVzZXJfcG93ZXI3Lm8gY29weXBhZ2VfcG93ZXI3Lm8gXA0KPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweV9wb3dlcjcubyByZXN0YXJ0X3RhYmxl
Lm8NCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLmNvbXBpbGVyIGIvc2Ny
aXB0cy9NYWtlZmlsZS5jb21waWxlcg0KPj4+IGluZGV4IDk0ZDBkNDBjZGRiMy4uNjNlN2Q3OWRk
ODc3IDEwMDY0NA0KPj4+IC0tLSBhL3NjcmlwdHMvTWFrZWZpbGUuY29tcGlsZXINCj4+PiArKysg
Yi9zY3JpcHRzL01ha2VmaWxlLmNvbXBpbGVyDQo+Pj4gQEAgLTY4LDcgKzY4LDMgQEAgY2MtaWZ2
ZXJzaW9uID0gJChzaGVsbCBbICQoQ09ORklHX0dDQ19WRVJTSU9OKTAgJCgxKSAkKDIpMDAwIF0g
JiYgZWNobyAkKDMpIHx8IGUNCj4+PiAgICAjIGxkLW9wdGlvbg0KPj4+ICAgICMgVXNhZ2U6IEtC
VUlMRF9MREZMQUdTICs9ICQoY2FsbCBsZC1vcHRpb24sIC1YLCAtWSkNCj4+PiAgICBsZC1vcHRp
b24gPSAkKGNhbGwgdHJ5LXJ1biwgJChMRCkgJChLQlVJTERfTERGTEFHUykgJCgxKSAtdiwkKDEp
LCQoMiksJCgzKSkNCj4+PiAtDQo+Pj4gLSMgbGQtaWZ2ZXJzaW9uDQo+Pj4gLSMgVXNhZ2U6ICAk
KGNhbGwgbGQtaWZ2ZXJzaW9uLCAtZ2UsIDIyMjUyLCB5KQ0KPj4+IC1sZC1pZnZlcnNpb24gPSAk
KHNoZWxsIFsgJChDT05GSUdfTERfVkVSU0lPTikwICQoMSkgJCgyKTAgXSAmJiBlY2hvICQoMykg
fHwgZWNobyAkKDQpKQ0KPj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL21pbi10b29sLXZlcnNpb24u
c2ggYi9zY3JpcHRzL21pbi10b29sLXZlcnNpb24uc2gNCj4+PiBpbmRleCAyNTA5MjVhYWIxMDEu
LjdkZjlmMjE1MGVhMSAxMDA3NTUNCj4+PiAtLS0gYS9zY3JpcHRzL21pbi10b29sLXZlcnNpb24u
c2gNCj4+PiArKysgYi9zY3JpcHRzL21pbi10b29sLXZlcnNpb24uc2gNCj4+PiBAQCAtMTQsNyAr
MTQsMTMgQEAgZmkNCj4+Pg0KPj4+ICAgIGNhc2UgIiQxIiBpbg0KPj4+ICAgIGJpbnV0aWxzKQ0K
Pj4+IC0gICAgIGVjaG8gMi4yMy4wDQo+Pj4gKyAgICAgaWYgWyAiJFNSQ0FSQ0giID0gcG93ZXJw
YyBdOyB0aGVuDQo+Pg0KPj4gSXNuJ3QgdGhpcyBsaW1pdGF0aW9uIG9ubHkgZm9yIHBwYzY0bGUg
Pw0KPj4NCj4+IFJlZmVyIGNvbW1pdCA2MGUwNjVmNzBiZGIgKCJwb3dlcnBjOiBSZWplY3QgYmlu
dXRpbHMgMi4yNCB3aGVuIGJ1aWxkaW5nDQo+PiBsaXR0bGUgZW5kaWFuIikNCj4gDQo+IA0KPiBJ
IGRvIG5vdCBzZWUgYW55IENPTkZJRyBjaGVjayBpbiB0aGUgY3VycmVudCBjaGVja2Jpbi4NCj4g
DQo+IFJlZmVyIGNvbW1pdCBhM2FkODRkYTA3NjAgKCJwb3dlcnBjL3RvYzogRnV0dXJlIHByb29m
DQo+IGtlcm5lbCB0b2MiKQ0KPiANCg0KVGhhdCdzIG9kZC4gVGhlcmUgaXMgbm8gdG9jIG9uIFBQ
QzMyLg0KDQpDaHJpc3RvcGhl
