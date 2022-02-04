Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B66BC4A981E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 12:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqszX3lf0z3cTY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 22:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqsyz03gDz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 22:00:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6tR3p580TU4NpnePgrpVVtAWTDERXud06KCdwNQoogRE6tIPzjkTNh0oqA7LNooWeul/yUXHyT22NCXKcN2VTVaSwmsEq+D6fKlRlRnQNiJXNnvyUts99t0D2QlV5nSrU1oBLkjV2K6osfD6vGPhNzQtG+3hE4+Z/irfH4iAa/ZEBWHHL1Koi4WuX6ZawJJqpCPWNAjy2hWw/TM2uzAVfB9yN2Y9x4eEiqFIzLK5iATCHXxKy7KGzF3I5/W0EaTMKGD0dLXew8ww73AXlLIsXv0UJ3KdjAYB/H84kI9BqgcStilhsJ1S2374zcvbvgGAwu9wjNNgbh92P2e6u1KAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1ztgoe8tyTif6wqnn4bqyoHowDYpXVb6w1R4DcwV+w=;
 b=arZX84F8dqwHudFZR8x4jZwUJSUVcm02B26E57+PyUAIGcdezhEZI3yzx+MUxayqDg6zbtN4Uia4FQjyy48W8zn3IxfQtoAa+P1nZySdHKNLZSI+2ujdlAusUbKHNd/6jTcmiFiMnmYJ2pwsotB1O/Y614H11rRgrg1sm7qFl2tur18F1HgZTL1Y10aVNQ/Gm/LnBDmBCFplZazjnEiKZzCosZyWDDN4+Ch432CfolSSQRBNLz96+AWOhY4QS6HgjvOKR+bycv2HccYWLsSTo2m2GcbmCA6l/2rxD/iWi2Ev6BbHLeGq+3PYiTN8JzW1o+d4RcjJ+MmOmFZx/2MDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0562.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 11:00:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4951.016; Fri, 4 Feb 2022
 11:00:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/signal: Fix handling of SA_RESTORER sigaction
 flag
Thread-Topic: [PATCH 1/2] powerpc/signal: Fix handling of SA_RESTORER
 sigaction flag
Thread-Index: AQHYGbEVzFaUPoMu40CPXyzs4RXcO6yDOXgA
Date: Fri, 4 Feb 2022 11:00:32 +0000
Message-ID: <381e3dc3-350c-c373-bc45-8dafd72ec011@csgroup.eu>
References: <afe50d1db63a10fde9547ea08fe1fa68b0638aba.1624618157.git.christophe.leroy@csgroup.eu>
 <87a6f7lynn.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6f7lynn.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d91f2035-c336-4502-afd6-08d9e7cd909b
x-ms-traffictypediagnostic: MR2P264MB0562:EE_
x-microsoft-antispam-prvs: <MR2P264MB05626C64A0FAE83D01A57EE8ED299@MR2P264MB0562.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1gvsEyDqyUfI2Meb79k4w0WLZ9zWeJLsyAwFD3THIz+DgSDLQf4QJKcEjcX0w7yNbrqj+Mb/9qgDczq8+r1NpEN4eVwUQ2JEUfG3Dhvo1CtG3IlIkaXpFs9EvwYV7q+VwFPAxLx8FeorYCQI5utrBglBAoBUBhQcJyRcbzjzKLZJNUetG2LYjIyjC5yA6BiIw3iWwd1MaiL4cqe4GwTp0Ao5qNVhKJwPeTUTc9N0G/UuW55BkPF8vm5RkOdJ0NOGpOy0z06aN9gxtllcTDrvbXrljvpuNLrT/bqYV5EVJYud9CpCq/t8gXKUCCaeLAO8KTljP3ku8vSfKlowr6HAV9LCZxtfuY/9NUajmCoF1uPILwSAtVC3KPf9P2+eEhoscDqlBA2dbmaiZHPbGEClyeGgt6m3NDVFJUtNmXVrIhP+FqohcJqN2sqfslaTMvdzIH+xeLsaze+eLb+beQpwvcpgDacZZMJfde2/A7Ec3vaDm5ortwXY/Jbira5n41kFQ3hP/gGVa9jNDQOVm+S4yHMGIIe+1+J9DaYmKtBxpFjluZluI/kB4RVFAX7RA19eHvUG+H2kpTY8GJs1Si6+jKFRajTEOtx20KOvHKClA3oCf3KtokQth/K/fkqjiOyraqQU1zorf7mw5gV2tj2jK9t66Ri8PkaXI0/H9hc1eS5bfgr3tOcqKbb2Boeidr5f4tHMsDEZSUWe5hd9R7NNxpAE0T21IsW5TkOxxuEV2JXopiIJy1aDuMmMtIO1jqL3ZOnGGfjpej79KXAI3UWkFzQPzL83jmTBoYOhEuUOp14k02DsyCL+pdnf8PTMvBGFh5WK1YuRqaHj90cfXeH7cZFVcUYoGSaSpEEEUeWJNlEqxDl3WPouNJSyXPnVFxHOPkckfzUXgWwzvDDLhOjkCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(966005)(6506007)(6512007)(508600001)(5660300002)(36756003)(31696002)(31686004)(83380400001)(316002)(6916009)(2616005)(64756008)(4326008)(8676002)(8936002)(44832011)(2906002)(91956017)(71200400001)(66476007)(66446008)(38070700005)(38100700002)(26005)(186003)(122000001)(66946007)(66556008)(76116006)(54906003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alFqSEZsYzVnSlpHbDY1bmN4TzJyTk8ycFlXZXN3cEE2bElLUkgzMmhLNlBF?=
 =?utf-8?B?aUpFZXl4a3FPejRrdFl1eTZIMzQyc3NzRkJtNlNjUmZ4Z3YxWXcvdElMUmVp?=
 =?utf-8?B?cVkxSjdnWXQwWW02SGwyVUJuMEFuREJDNkxmdVZ1NGlyWnlDS20zUGViNDVD?=
 =?utf-8?B?YVFVbUJDTjF6Z0RVQWZvNmhUUk43Y0I0OGxFTnJkZzNpUFB4MENFWjZkemMz?=
 =?utf-8?B?OGQ5R1dvUHU1QkErV29UZVpPa0tHR2I5Mm5VRjhNcVUxeUx0ek84bHN3aFho?=
 =?utf-8?B?NmRuYUNJZnMwck05YnRyNHIvd2trL2c3eWRwakJNd3VlMlFnOHlTbzBvUGVa?=
 =?utf-8?B?Y1ZCOU5lcWowZUp2bEtZSDh6c0gyMWNEWVFTR1c0K1FtbnVML2M1QTFUeGtC?=
 =?utf-8?B?dDl1bGVhTXpPb0xSK0RoaVd6bk9XaHozK25DWmJoQnlzZXR0d0tLcXo0TW54?=
 =?utf-8?B?dXBHTWhhdVV5TkpKSGFOSnVZNStzL0VTajdoY0hPYU4zaHh2OFFTWTFzcWJw?=
 =?utf-8?B?d3ovRk8xRTFoZTA3V2RKZzlUYllFWjZVUlFURHdwNCtCc09oQnFIenRsNTRS?=
 =?utf-8?B?SzRMY1FkK2Z6S3hyRHNiQXhOOWhUZm52SmxoQjMrUnFQVDlHYVBVY2V6Y0Zk?=
 =?utf-8?B?S25YT2dOTWdtOEJjWWY0czN3TUFLZlNvNDdrcktMSHYzWHhTdmQyTCs3bjdN?=
 =?utf-8?B?Q010a1lKclJud2FqNjArUUxDMHh4RWs3Q3lFOHBrck5lRmpsZVh5V3R2ZVR3?=
 =?utf-8?B?bjBGMTFhN1laOE4rL1J0M1RJL0FIWE52eE9pQW9ncEcxQllmTjJZMnpHSndX?=
 =?utf-8?B?Q3FKaVQ3NWl3aTRoWDdqdFhEWXY1ZW5nTUlLckhYOWR2RW53N1ZPSkhCS2JS?=
 =?utf-8?B?T3VEcHdOcmZzUWRoOFhleW5VUEFZaGVma0tMTm83WEZTN2dSNUtqYTZZRGVJ?=
 =?utf-8?B?ZkI5eUFxcFJjSWhNRnRDZ2pwamxsWTF5YVA1eVUyeFZOREpKclgzUXZMZStI?=
 =?utf-8?B?MXhOaFlaenk3aHZjYncvbEVtejlGMmdkT1FVMjJIdm5Zb1ROTloyL05oRThG?=
 =?utf-8?B?aDZ0SkJVaWEzY1Y2dkJkMW5wUVJ3U1RUR2NOZEpUR0VDMnJmMm5PYlBPNFRL?=
 =?utf-8?B?c2Rxc2dtdC84MGgxWjk5bEtXcytFSk9GRm5Ic0FBVzlwdENyd2pkeERYd0ow?=
 =?utf-8?B?MmthQkovd2R2dWo5anp1bGErMVozdXJwa2ZTOHlNcVhuVTRPWmdhNXRWbVlQ?=
 =?utf-8?B?TDhVV3dGQWtoYzBKWGwvSlVFNTdDOU9EeGhJL3loN1dnb3lFaWprakdqMHAz?=
 =?utf-8?B?WVoyWjZMS3VtdFo3K2FJNWxGOWlXbUhWa1k0a3dmMldrVndUeDRDUU05NVdr?=
 =?utf-8?B?RktZd2dHWGhWcC9UcExSR0tYMVJaQlJLMVlxSXppb3BudHM0K3oxZEVWMjB1?=
 =?utf-8?B?QWNPKy9RRm5Zelo1Y3BQdVQwY2hBMzNsampkdXVydVVDQmJaVjltVkNrVko4?=
 =?utf-8?B?TXBFamFpNHZGc25YYm1QdmRVMGRMZkRYOTc0ZUptVEN1aktLSU9pd2dFeFJL?=
 =?utf-8?B?MjhBZzFuY2U5L1FTNUwzS0FtZXNGdVRrWHE0dXBSZ1V4aGhmazY4QUJRSkdw?=
 =?utf-8?B?bGJSRWZyMWpSNzg0T2w2SHVhOWd1c0lPZ2ZDeE56TWxhTHF1RlF5SXpYWENw?=
 =?utf-8?B?YmtEM1JpMlFwKzQxU3puSXNiYWllNS9RMzh3ZHI1dzZoR2o4VVVGeE8ybkt4?=
 =?utf-8?B?dC9KSm10b0NmVVFBY2tSaHBFdU1jQnEzOVViU3crUm5vVVBia2twMXVoR0VV?=
 =?utf-8?B?MEovaW1xTzc0S01yeURDNC9sNUJuYkRCSFB0YkVQRE5SSFBwMnRmUzVUY0NB?=
 =?utf-8?B?WVRkYzYwQlFqMUVjNytkaTB0RkxSS2pjQ0FRcTBxcGNyRFFtMUE2MS9rMkZy?=
 =?utf-8?B?N21iU25teFZYWlNYajdDemJmU1I5OHZKSE4xMlk0OENyQUUxU09WUmNpMWIz?=
 =?utf-8?B?YzRKTnpkeVhqZ1NZV3oxTXNhK3ZiS3lkbW5NVE1jVWpaamhXR2FEWmtYYzhm?=
 =?utf-8?B?a0dqTitldzdBd2k5T2ZkM21BYVN4M0Uwd2VxS3pJV3Nab29HUklSdWdEMzJ0?=
 =?utf-8?B?V2lVOEw4SWtORU0xQXh5b2QwTTgvOXo0UGZLZWRHeFNsZVN1TU1CcjBzNzZR?=
 =?utf-8?B?dFhxZnYvNVlCcDhCQm5EUTNySHlWMkJiQUlNRFBnellxb1plelhlb0w5U0Zt?=
 =?utf-8?Q?DVSOIbmXGqNUl2o1iT8B4AJptl+LaXEX8PS/4ePr/I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42F04BE7CE71964686CF75B6448EF6CC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d91f2035-c336-4502-afd6-08d9e7cd909b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 11:00:32.9758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6thl53zYH1QJwFJwsb+G0cZmVW5W1Q82mwnPtUK6G+RcahhJwsvcAiliy0kYjSkkZaCEA5dxvnCtEyB7Xz9FBORJooG9pOFsaNd5tOF5dE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0562
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzAyLzIwMjIgw6AgMTE6MjIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBwb3dlcnBjIGFkdmVydGlzZXMgc3VwcG9ydCBvZiBTQV9SRVNUT1JFUiBzaWdhY3Rpb24g
ZmxhZy4NCj4+DQo+PiBNYWtlIGl0IHRoZSB0cnV0aC4NCj4+DQo+PiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZw0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2ln
bmFsXzMyLmMgfCA4ICsrKysrKy0tDQo+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2lnbmFsXzY0
LmMgfCA0ICsrKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+IA0KPiBIaSBDaHJpc3RvcGhlLA0KPiANCj4gSSBkdWcgaW50byB0aGUgaGlz
dG9yeSBhIGJpdCBvbiB0aGlzLg0KPiANCj4gVGhlIDMyLWJpdCBwb3J0IG9yaWdpbmFsbHkgZGlk
IG5vdCBkZWZpbmUgU0FfUkVTVE9SRVIgaW4NCj4gaW5jbHVkZS9hc20tcHBjL3NpZ25hbC5oLCBi
dXQgaXQgd2FzIGFkZGVkIGluIDIuMS43OS4NCj4gDQo+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9t
cGUvbGludXgtZnVsbGhpc3RvcnkvY29tbWl0LzRlN2U5YzBkNTRmZjU3MjVhNzNkMjIxMGE5NTBm
OGJjMGYyMjUwNzMNCj4gDQo+IFRoYXQgY29tbWl0IGFkZGVkIFNBX1JFU1RPUkVSIHRvIHRoZSBo
ZWFkZXIsIGFkZGVkIGNvZGUgdG8gZ2V0L3NldCBpdCBpbg0KPiBzeXNfc2lnYWN0aW9uKCksIGJ1
dCBkaWRuJ3QgYWRkIGFueSBjb2RlIHRvIHVzZSBpdCBmb3Igc2lnbmFsIGRlbGl2ZXJ5Lg0KPiAN
Cj4gDQo+IFRoZSA2NC1iaXQgcG9ydCB3YXMgbWVyZ2VkIHdpdGggU0FfUkVTVE9SRVIgYWxyZWFk
eSBkZWZpbmVkIGluDQo+IGluY2x1ZGUvYXNtLXBwYzY0L3NpZ25hbC5oOg0KPiANCj4gICAgaHR0
cHM6Ly9naXRodWIuY29tL21wZS9saW51eC1mdWxsaGlzdG9yeS9jb21taXQvYzNhYTk4Nzg1MzNl
NzI0ZjYzOTg1MmMzZDk1MWU2YTE2OWUwNDA4MQ0KPiAgICANCj4gU2ltaWxhcmx5IHRoZXJlIHdh
cyBjb2RlIHRvIHNldC9nZXQgaXQgaW4gc3lzX3NpZ2FjdGlvbigpLCBidXQgbm8gY29kZQ0KPiB0
byB1c2UgaXQgZm9yIHNpZ25hbCBkZWxpdmVyeS4NCj4gDQo+IA0KPiBMYXRlciB0aGUgdHdvIHBv
cnRzIHdlcmUgbWVyZ2VkLCBhbmQgdGhlIGhlYWRlcnMgd2VyZSBtb3ZlZCBhbmQNCj4gZGlzaW50
ZWdyYXRlZCBpbnRvIHVhcGksIHNvIHdlIGVuZCB1cCB0b2RheSB3aXRoIFNBX1JFU1RPUkVSIGRl
ZmluZWQgaW4NCj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFwaS9hc20vc2lnbmFsLmgsIGJ1dCBu
byBjb2RlIHRvIHVzZSBpdC4NCj4gDQo+IFNvIGVzc2VudGlhbGx5IHdlJ3ZlIGhhZCBTQV9SRVNU
T1JFUiBkZWZpbmVkIHNpbmNlIGFuY2llbnQga2VybmVscywgYnV0DQo+IG5ldmVyIGFjdHVhbGx5
IHN1cHBvcnRlZCB1c2luZyBpdCBmb3IgYW55dGhpbmcuDQo+IA0KPiANCj4gT25lIHByb2JsZW0g
d2l0aCBlbmFibGluZyBpdCBub3cgaXMgdGhlcmUncyBubyB3YXkgZm9yIHVzZXJzcGFjZSB0bw0K
PiBkZXRlcm1pbmUgaWYgaXQncyBvbiBhIGZpeGVkIGtlcm5lbCBvciBub3QuIFRoYXQgbWFrZXMg
aXQgdW51c2FibGUgZm9yDQo+IHVzZXJzcGFjZSwgdW5sZXNzIGl0IGRvZXMgdmVyc2lvbiBjaGVj
a3MsIG9yIGlzIGhhcHB5IHRvIGJyZWFrIG9uIGFsbA0KPiBvbGQga2VybmVscyAobm90IGxpa2Vs
eSkuIFdlIGNvdWxkIHNvbHZlIHRoYXQgYnkgZGVmaW5pbmcNCj4gU0FfUkVTVE9SRVJfRklYRUQg
b3Igc29tZXRoaW5nLCBidXQgdGhhdCdzIHNsaWdodGx5IGdyb3NzLg0KPiANCj4gSXQncyBhbHNv
IGRlc2NyaWJlZCBpbiB0aGUgbWFuIHBhZ2UgYXMgIk5vdCBpbnRlbmRlZCBmb3IgYXBwbGljYXRp
b24NCj4gdXNlIiwgaWUuIGl0J3MgaW50ZW5kZWQgZm9yIHVzZSBieSBsaWJjLiBJJ20gbm90IHN1
cmUgdGhlcmUncyBhbnkgdmFsdWUNCj4gaW4gYWRkaW5nIHN1cHBvcnQgZm9yIGl0IHRvIHRoZSBr
ZXJuZWwgdW5sZXNzIHdlIGtub3cgdGhlcmUncyBpbnRlcmVzdA0KPiBmcm9tIGdsaWJjL211c2wg
aW4gdXNpbmcgaXQuDQo+IA0KPiBTbyBteSBpbmNsaW5hdGlvbiBpcyB0aGF0IHdlIHNob3VsZCAq
bm90KiBhZGQgc3VwcG9ydCBmb3IgaXQsIHJhdGhlciB3ZQ0KPiBzaG91bGQgbGVhdmUgaXQgdW5p
bXBsZW1lbnRlZCBhbmQgcmVtb3ZlIFNBX1JFU1RPUkVSIGZyb20gdGhlIGhlYWRlci4NCj4gVGhl
cmUncyBwcmVjZWRlbnQgaW4gcmlzY3YgZm9yIG5vdCBzdXBwb3J0aW5nIGl0IGF0IGFsbC4NCj4g
DQoNCk5vd2FkYXlzLCBzdGFja3MgYXJlIG1hcHBlZCBub2V4ZWMsIHNvIHRoZSBmYWxsYmFjayBz
dGFjayB0cmFtcG9saW5lIA0KY2Fubm90IHdvcmsgYW55bW9yZS4gSWYgYSBwcm9jZXNzIGRvZXNu
J3Qgd2FudCBleGVjIHN0YWNrIGFuZCBkb2Vzbid0IA0Kd2FudCB0byBtYXAgdGhlIFZEU08sIHRo
ZSBTQV9SRVNUT1JFUiBpcyB0aGUgb25seSBhbHRlcm5hdGl2ZSB0byBnZXQgDQpzaWduYWwgd29y
a2luZy4NCg0KT24gc2V2ZXJhbCBhcmNoaXRlY3R1cmVzIGluY2x1ZGluZyBhcm02NCBhbmQgczM5
MCBvbmx5IFZEU08gYW5kIA0KU0FfUkVTVE9SRVIgYXJlIHN1cHBvcnRlZCwgb24gc3RhY2sgc2ln
bmFsIHRyYW1wb2xpbmUgaXMgbm90IHN1cHBvcnRlZCANCmFueW1vcmUuDQoNClNvIG15IGlkZWEg
d2FzIHRvIGZpcnN0IGltcGxlbWVudCBTQV9SRVNUT1JFUiBhbmQgdGhlbiBhcyBhIHNlY29uZCBz
dGVwIA0KdG8gcmV0aXJlIHRoZSBvbiBzdGFjayBzaWduYWwgdHJhbXBvbGluZSB3aGljaCBoYXMg
YmVjb21lIHVzZWxlc3Mgd2l0aCANCm5vZXhlYyBzdGFja3MuDQoNClNlZSANCmh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE3LXJjMS9zb3VyY2UvYXJjaC9hcm02NC9rZXJuZWwv
c2lnbmFsLmMjTDc2MQ0KDQpvciANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1
LjE3LXJjMS9zb3VyY2UvYXJjaC9zMzkwL2tlcm5lbC9zaWduYWwuYyNMMzM3DQoNCkNocmlzdG9w
aGU=
