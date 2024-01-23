Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172E838D0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 12:12:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=M4EDrRJn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK4DH0fk6z3cVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 22:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=M4EDrRJn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::600; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK4CS2xNrz3bnK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 22:11:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivbUs55237YrRBkfYmjkhWkpCTCMY2ZEhDrESJojfeTGfLOlMaJueiJHrCKMK48Xcpt9ttia+Ducf7OkvGTSZ4eyJktn2pOWaKZofoKeKGl+ty2R/LNziPBmILeOfzZIjVRTrtblt6nnOHe0ncH+00l06wG2rjvQlc36X1ObwexbG4IgGSiGm13dETlpcS2X380bgQHSi3fmMDyN+BTR2df/JrrDaG9tlqRWSK1bnaQ+Cd1l3I8v58R5T5U5Dg5gBNMAyGgaT0ku0/il+N66zXPdC7nQ+5VWr0g6PMWuLFAlg7NOv1Y5tgLxyFMy2HfHfUsAvvFaC5FAT5kZ63Yk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzgDhwzv5m0v9oIBjKdbvYZFXoyGenepAN8zLUWDfNY=;
 b=fwnbPfRXzh+854kbHNMP2SD6Xo6UcsEuVBxvafXb54OSqPjBwKFE300oxYJv9FAn/YIfBmjMBI9kOCSI4YEoNxTAuB5UMeRTF9hHWqaXMC50H2aqIsrHp87y8TTepMxilOuXUup28ap5gQ+/Zyz32Byqlf60qEPQvVVJVkbk/fjv3zdMBHgPGn9BuUvGcNsVHyTbqSz9jYeRdkmtguyxVZZgldCPX3Ay3lh0gHwxUpYAXfFCOxH9unpQJosnFbyQytNJTaCJjbSEjnGOfxJm+YgGqknKyzVWNJJllqfoL05xxGWJtGrKzXkkw2U0VZIr7bzooxGkVtLvzQCm9uP9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzgDhwzv5m0v9oIBjKdbvYZFXoyGenepAN8zLUWDfNY=;
 b=M4EDrRJnz+drhVAtj17oByvAmd94c7l78CRgXi5HjojacDTk2uSFPPwTomB7Pz/MG9YMaV8Cr2R66N52v4B42PDCGDWR3WzZ4ZyRWMSt1EjmwYWYKiqab/GwmmwMSRgXnYSZ+dsaKHPcVTOmB8mg5pASBwAPr2CXwuQvcEtY1Krt4GR3rxC6ZGIuxEpZDTPQpUKxRoacYWxw4ankTuNPD5d1SkjnAcW/ODh6CfYHO5CHcQUH9dGEFSaXXgcCoTBao0gbIPplKhDH/S5o8yaqcTwvKjVeDVtrd/Y9Xm2LbExMgwv0tAkzweOmH0qkWKBrIPsxyc97gWl38nskATmfaw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1611.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 11:10:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 11:10:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Thread-Topic: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Thread-Index: AQHaTWsgqyRS0TfRAU20Q9lz/3ZqNbDnNJ2AgAAD9YCAAAY9gA==
Date: Tue, 23 Jan 2024 11:10:52 +0000
Message-ID: <bb1b2935-8643-4667-b331-8242898b13bd@csgroup.eu>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
In-Reply-To: <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1611:EE_
x-ms-office365-filtering-correlation-id: 14e16b4a-059e-4c74-74a0-08dc1c03f67c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SIlob7hgl9PjrROE5rocuAS5EQbdHycYKBX2QyHcRNg8DlGuQooCu2jY9ifMqfMECV71+DBAFiYIBxFTlofDORDeG8RDdSx9q3U5rL/GvR4Z9mAUSTZ6Bs7mnsP0+DHnRBoXoCQuf+miIAjZDGEGy6jqGi4Aa/uDnl78RmZsfvLfgQH77j4wOYw0htnRsAA2wrlLD6JNkGM4v3UTeUZxOLKX9BVAsqzoRptmWrrwHuGAu/4yzAp7B+p4Et2LqvT3M7V3od/d05uQ0NaAnDTHczrHwMu1U7V3yLfP7PTTC2arr1Bvu/C1EHWQZaKw3nmWd+Ytjaj8Ob1fCacFGZsWakH1FUm2bC0G+QXmUAh7nhkHwapAQJCLI3SF2JZ+G/z3Ulbqqtug72IHBmg6k9aREysKkEbHssjpZkLmv7w+PPbMWMC6sgVBqp+E9qpV4PldFxA8LYNCHbtCDts8He6FsIOwWF1ipVyWCBnUqUcy0SAFODADyYRQG/CeUwQSy6I6hAllGEm6JlqNRxIE+Q32QRfPt3mS4BGm3rj/L6ZYF+mqwluBi4zzjqwhMIS/0qFWKWcj4TUZDNTuv8Zxjmw0RoLPmXB/Ftl5x9sd2AXS++fjn6lng2b9AfC5yfeITmy5pYeY/Bjw+MSFDiItJZVhgc35tIDq+weBfin6h29tPhs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(966005)(26005)(6486002)(66574015)(2616005)(6506007)(478600001)(71200400001)(6512007)(53546011)(36756003)(86362001)(31696002)(38070700009)(31686004)(38100700002)(83380400001)(5660300002)(7416002)(4326008)(2906002)(44832011)(41300700001)(110136005)(54906003)(316002)(122000001)(91956017)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UEtFeDNFWHNCaXR1MzFNcW1sZXNWWHpXcVhhbXFzS0lMTi9zMm9JU3pzVncv?=
 =?utf-8?B?WDZCNFE2ZUIxbWFUWU4wRnd0cXQwMHQrWEdjMmpMQi9aNjl5dWg1YWpnNEZR?=
 =?utf-8?B?enp2V1FPaUFacGw5bjllUXNJNTBsQk0wWlh5eGZucVpwTGxHYU15aEpOZEh1?=
 =?utf-8?B?QVVoUjlkclpiTDBjbit1NHJXUzBUSFVuUnd3Zzhxb29weVViUURQNzBxUWNu?=
 =?utf-8?B?WjhlMERialhuSFhWM2p5OEw5U1BVNzhXTlloZVJhMjFPME82dmVNN3c0S2tH?=
 =?utf-8?B?TWpCeGRPUHFKSUcyS2haeWlTS1hmbm0yV0pMSS9qNjk4aEc3Q1RGMmRYVzE1?=
 =?utf-8?B?MzNOd0s2N3QrS015bks4anBkcHFPVkVRcmZ4eFBmcGRVank0WjcxQTlxM2Rz?=
 =?utf-8?B?WmRLV0h5V09hWnVWMWV5eFdHcFlBNlhSQ0lNUnRjcWNuL2xFTWhaZVRVeCtZ?=
 =?utf-8?B?aVZMNldDbHdyb21WaklUTFA3MnBZd2I1TEoxUmdvdE5jZWQ2MmNrdjlZM2ZG?=
 =?utf-8?B?QkVUZnN5cm9MM0xrNVJDN05YeEhvZWpVMjZBckh1YlQ1c2VVNHlRNVVST3hx?=
 =?utf-8?B?Ym9rMitkZ3dJU0N6QzNtbFd3T3lhaUdoY3VuTHEvYkJ5Rjd4TVhQMnovZ2kw?=
 =?utf-8?B?OENlRyttRzRCbnJxaGU4aTF0VkhESy9DSHZiei8wY0ZtdU93eGtkMUxMaXRU?=
 =?utf-8?B?bm5XZ00rTm4ybFQ4eitCUzRwRTFOdkNYYlJCdE5JV1RWdlUyVFpnakJVOTJ1?=
 =?utf-8?B?ci9KWldJTGl6RnQ0blRCNnJBUUd5MDNlUW54cmJhWG90SFFEbUJhY1E0ZTBl?=
 =?utf-8?B?TVdCai80MEprWGpwaDhEbVFpN0Y2RDR4QU54YmFtT09iYVJ5WGlSeHJaSzI1?=
 =?utf-8?B?WlpMUW1ISUNCS1pQcFQ5d3ZCTGEzeWtZS3lvV2xsSXVjMHZxUUtPZTFSU0FE?=
 =?utf-8?B?anUwWnMvUWg3T3ZxZWE5aW5yVzFWZmxKb2RrTmZTSTZVVlJqOHZRMEZaaHZJ?=
 =?utf-8?B?UTNFcXZqUkNJclV6cEJKRU90WU5VYjFnWkVIRkVxUHl4Z2tmKy83bzNzcjg5?=
 =?utf-8?B?NGtldU1obnpKeVNENWZuaHI4dGxxd1k2L2hnU29KWC90NUE0YmVkMDBmWXl5?=
 =?utf-8?B?UDlIc0RHQnRjU3oxNk5yb1FvbTVBcUxieXUyYVRYTW11Y2VXWVJxdklkcFpL?=
 =?utf-8?B?dVdxYW5oUHJQNCs1enFhaW1Zb0JraE5xSXVhZUtReVB0aEUvWVBtWjVtZnQv?=
 =?utf-8?B?aTlCMHpPZGtVTnB1dnhZOXVpMnpIL0h3M2ppYmZ6cE0wdnZPdUNZSURKOVUr?=
 =?utf-8?B?QXVPVk1GdWR6bUdsYnE4UkozaWM4SWdnaEcyKzRDNXZBbVNJQ0UyRXpKVHBM?=
 =?utf-8?B?L1JGYlNXKzNKenloa2o4TzI2OG14b0p1RXFGaW5Bd3FlbUExYkt0aE1ZdzZQ?=
 =?utf-8?B?a1RIdHlwNGgxVFdWMFVVd3VIUkdjc2kxR3dtaGVYZktKaG1QdCs2ZE1wSHpJ?=
 =?utf-8?B?T2Y2NGY4SjhaWGk3K0F0TWNwazNlZHhRV3M1YWxzTVgzNVNMMFczWU1DUzNQ?=
 =?utf-8?B?Rnd0bUpnVHdWNjNzOVU0T3UxUkVBNnZlanlvVHRrRVE2NytBbHgxU05vZ2ZD?=
 =?utf-8?B?bjl3SWo5bGY4alo5VzFtd2ZTZ1l1eHRXYUZ0RzlEdk42QWZJdGRiS3Fab0t6?=
 =?utf-8?B?bHVzOWsyOUlEanVwaDdrNVlLTzh5cGlwL3FDRHo3K0xCTTJ4ZnlvNU5aS3B1?=
 =?utf-8?B?dXA0YlBUMmRxL0tGbFNCVDFGUWtHMWJTNkNpZStWV0kwd0ZIL0liSFY2OUNW?=
 =?utf-8?B?aDhhZkc0NUhjNE1pcVFBTG1JcUUyc2plY0ozak84ZWN6U25zeW1PeUNaQTA3?=
 =?utf-8?B?S3orSGN6OXQ3Vjl3RjVOdk9YVFpOTHRnWVBsZGNtSGVhS2lEZlVZY3Y0OFN6?=
 =?utf-8?B?M3JoWjVBTzBNdlBTVEkvaGpNSzhZQTNOdDU3d2tKRktDUVVRbER4L202czB1?=
 =?utf-8?B?V215V0plNWxSTGZmUHREU3A0cS9jaEdZRW5TRzhjTk8vdi9acTN4bE5GZE1J?=
 =?utf-8?B?MzliWmk4L09wZXd1NWlpSkcrYm1NZnpjekh5Z2ZXMWppU3RHNnBNUTE2SVNv?=
 =?utf-8?Q?UODCYurlo1JGvCNMLec4MgNWv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83FB334A30A6FA4085770125C7C2F7ED@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e16b4a-059e-4c74-74a0-08dc1c03f67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 11:10:52.5177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UBIypUHFPU0a4EW9wP/fukXdQCMH+aSjlN48sHfibqFwAaQ1e2NHxF53VsRMISDupsX4fF483ScFeXHEN5i2M7C8lmK85WMdU3V1cctUvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1611
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andre
 w Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzAxLzIwMjQgw6AgMTE6NDgsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6
DQo+IE9uIDIzLjAxLjI0IDExOjM0LCBSeWFuIFJvYmVydHMgd3JvdGU6DQo+PiBPbiAyMi8wMS8y
MDI0IDE5OjQxLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4+PiBXZSB3YW50IHRvIG1ha2Ug
dXNlIG9mIHB0ZV9uZXh0X3BmbigpIG91dHNpZGUgb2Ygc2V0X3B0ZXMoKS4gTGV0J3MNCj4+PiBz
aW1wbGl5IGRlZmluZSBQRk5fUFRFX1NISUZULCByZXF1aXJlZCBieSBwdGVfbmV4dF9wZm4oKS4N
Cj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQu
Y29tPg0KPj4+IC0tLQ0KPj4+IMKgIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqAg
fCAyICsrDQo+Pj4gwqAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAyICsrDQo+
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggDQo+Pj4gYi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgNCj4+PiBpbmRleCBkNjU3Yjg0YjZiZjcwLi5iZTkxZTM3NmRmNzll
IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPj4+ICsr
KyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPj4+IEBAIC0yMDksNiArMjA5LDgg
QEAgc3RhdGljIGlubGluZSB2b2lkIF9fc3luY19pY2FjaGVfZGNhY2hlKHB0ZV90IA0KPj4+IHB0
ZXZhbCkNCj4+PiDCoCBleHRlcm4gdm9pZCBfX3N5bmNfaWNhY2hlX2RjYWNoZShwdGVfdCBwdGV2
YWwpOw0KPj4+IMKgICNlbmRpZg0KPj4+ICsjZGVmaW5lIFBGTl9QVEVfU0hJRlTCoMKgwqDCoMKg
wqDCoCBQQUdFX1NISUZUDQo+Pj4gKw0KPj4+IMKgIHZvaWQgc2V0X3B0ZXMoc3RydWN0IG1tX3N0
cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZXZhbCwgdW5zaWduZWQgaW50IG5yKTsNCj4+
PiDCoCAjZGVmaW5lIHNldF9wdGVzIHNldF9wdGVzDQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oIA0KPj4+IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgNCj4+PiBpbmRleCA3OWNlNzBmYmI3NTFjLi5kNGIzYmQ5NmUzMzA0IDEwMDY0NA0K
Pj4+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+Pj4gKysrIGIvYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4+PiBAQCAtMzQxLDYgKzM0MSw4IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX3N5bmNfY2FjaGVfYW5kX3RhZ3MocHRlX3QgDQo+Pj4gcHRlLCB1
bnNpZ25lZCBpbnQgbnJfcGFnZXMpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG10ZV9zeW5jX3Rh
Z3MocHRlLCBucl9wYWdlcyk7DQo+Pj4gwqAgfQ0KPj4+ICsjZGVmaW5lIFBGTl9QVEVfU0hJRlTC
oMKgwqDCoMKgwqDCoCBQQUdFX1NISUZUDQo+Pg0KPj4gSSB0aGluayB0aGlzIGlzIGJ1Z2d5LiBB
bmQgc28gaXMgdGhlIGFybTY0IGltcGxlbWVudGF0aW9uIG9mIA0KPj4gc2V0X3B0ZXMoKS4gSXQN
Cj4+IHdvcmtzIGZpbmUgZm9yIDQ4LWJpdCBvdXRwdXQgYWRkcmVzcywgYnV0IGZvciA1Mi1iaXQg
T0FzLCB0aGUgaGlnaCANCj4+IGJpdHMgYXJlIG5vdA0KPj4ga2VwdCBjb250aWdvdXNseSwgc28g
aWYgeW91IGhhcHBlbiB0byBiZSBzZXR0aW5nIGEgbWFwcGluZyBmb3Igd2hpY2ggdGhlDQo+PiBw
aHlzaWNhbCBtZW1vcnkgYmxvY2sgc3RyYWRkbGVzIGJpdCA0OCwgdGhpcyB3b24ndCB3b3JrLg0K
PiANCj4gUmlnaHQsIGFzIHNvb24gYXMgdGhlIFBURSBiaXRzIGFyZSBub3QgY29udGlndW91cywg
dGhpcyBzdG9wcyB3b3JraW5nLCANCj4ganVzdCBsaWtlIHNldF9wdGVzKCkgd291bGQsIHdoaWNo
IEkgdXNlZCBhcyBvcmllbnRhdGlvbi4NCj4gDQo+Pg0KPj4gVG9kYXksIG9ubHkgdGhlIDY0SyBi
YXNlIHBhZ2UgY29uZmlnIGNhbiBzdXBwb3J0IDUyIGJpdHMsIGFuZCBmb3IgdGhpcywNCj4+IE9B
WzUxOjQ4XSBhcmUgc3RvcmVkIGluIFBURVsxNToxMl0uIEJ1dCA1MiBiaXRzIGZvciA0SyBhbmQg
MTZLIGJhc2UgDQo+PiBwYWdlcyBpcw0KPj4gY29taW5nIChob3BlZnVsbHkgdjYuOSkgYW5kIGlu
IHRoaXMgY2FzZSBPQVs1MTo1MF0gYXJlIHN0b3JlZCBpbiANCj4+IFBURVs5OjhdLg0KPj4gRm9y
dHVuYXRlbHkgd2UgYWxyZWFkeSBoYXZlIGhlbHBlcnMgaW4gYXJtNjQgdG8gYWJzdHJhY3QgdGhp
cy4NCj4+DQo+PiBTbyBJIHRoaW5rIGFybTY0IHdpbGwgd2FudCB0byBkZWZpbmUgaXRzIG93biBw
dGVfbmV4dF9wZm4oKToNCj4+DQo+PiAjZGVmaW5lIHB0ZV9uZXh0X3BmbiBwdGVfbmV4dF9wZm4N
Cj4+IHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX25leHRfcGZuKHB0ZV90IHB0ZSkNCj4+IHsNCj4+
IMKgwqDCoMKgcmV0dXJuIHBmbl9wdGUocHRlX3BmbihwdGUpICsgMSwgcHRlX3BncHJvdChwdGUp
KTsNCj4+IH0NCj4+DQo+PiBJJ2xsIGRvIGEgc2VwYXJhdGUgcGF0Y2ggdG8gZml4IHRoZSBhbHJl
YWR5IGJyb2tlbiBhcm02NCBzZXRfcHRlcygpIA0KPj4gaW1wbGVtZW50YXRpb24uDQo+IA0KPiBN
YWtlIHNlbnNlLg0KPiANCj4+DQo+PiBJJ20gbm90IHN1cmUgaWYgdGhpcyB0eXBlIG9mIHByb2Js
ZW0gbWlnaHQgYWxzbyBhcHBseSB0byBvdGhlciBhcmNoZXM/DQo+IA0KPiBJIHNhdyBzaW1pbGFy
IGhhbmRsaW5nIGluIHRoZSBQUEMgaW1wbGVtZW50YXRpb24gb2Ygc2V0X3B0ZXMsIGJ1dCB3YXMg
DQo+IG5vdCBhYmxlIHRvIGNvbnZpbmNlIG1lIHRoYXQgaXQgaXMgYWN0dWFsbHkgcmVxdWlyZWQg
dGhlcmUuDQo+IA0KPiBwdGVfcGZuIG9uIHBwYyBkb2VzOg0KPiANCj4gc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIHB0ZV9wZm4ocHRlX3QgcHRlKQ0KPiB7DQo+ICDCoMKgwqDCoHJldHVybiAo
cHRlX3ZhbChwdGUpICYgUFRFX1JQTl9NQVNLKSA+PiBQVEVfUlBOX1NISUZUOw0KPiB9DQo+IA0K
PiBCdXQgdGhhdCBtZWFucyB0aGF0IHRoZSBQRk5zICphcmUqIGNvbnRpZ3VvdXMuIElmIGhpZ2gg
Yml0cyBhcmUgdXNlZCBmb3IgDQo+IHNvbWV0aGluZyBlbHNlLCB0aGVuIHdlIG1pZ2h0IHByb2R1
Y2UgYSBnYXJiYWdlIFBURSBvbiBvdmVyZmxvdywgYnV0IA0KPiB0aGF0IHNob3VsZG4ndCByZWFs
bHkgbWF0dGVyIEkgY29uY2x1ZGVkIGZvciBmb2xpb19wdGVfYmF0Y2goKSBwdXJwb3NlcywgDQo+
IHdlJ2Qgbm90IGRldGVjdCAiYmVsb25ncyB0byB0aGlzIGZvbGlvIGJhdGNoIiBlaXRoZXIgd2F5
Lg0KDQpZZXMgUEZOcyBhcmUgY29udGlndW91cy4gVGhlIG9ubHkgdGhpbmcgaXMgdGhhdCB0aGUg
UEZOIGlzIG5vdCBsb2NhdGVkIA0KYXQgUEFHRV9TSElGVCwgc2VlIA0KaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuMy1yYzIvc291cmNlL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ub2hhc2gvcHRlLWU1MDAuaCNMNjMNCg0KT24gcG93ZXJwYyBlNTAwIHdlIGhhdmUgMjQgUFRF
IGZsYWdzIGFuZCB0aGUgUlBOIHN0YXJ0cyBhYm92ZSB0aGF0Lg0KDQpUaGUgbWFzayBpcyB0aGVu
IHN0YW5kYXJkOg0KDQojZGVmaW5lIFBURV9SUE5fTUFTSwkofigoMVVMTCA8PCBQVEVfUlBOX1NI
SUZUKSAtIDEpKQ0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IE1heWJlIGl0J3MgbGlrZWx5IGNsZWFu
ZXIgdG8gYWxzbyBoYXZlIGEgY3VzdG9tIHB0ZV9uZXh0X3BmbigpIG9uIHBwYywgSSANCj4ganVz
dCBob3BlIHRoYXQgd2UgZG9uJ3QgbG9zZSBhbnkgb3RoZXIgYXJiaXRyYXJ5IFBURSBiaXRzIGJ5
IGRvaW5nIHRoZSANCj4gcHRlX3BncHJvdCgpLg0KPiANCj4gDQo+IEkgZ3Vlc3MgcHRlX3Bmbigp
IGltcGxlbWVudGF0aW9ucyBzaG91bGQgdGVsbCB1cyBpZiBhbnl0aGluZyBzcGVjaWFsIA0KPiBu
ZWVkcyB0byBoYXBwZW4uDQo+IA0K
