Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1E5A3EE1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 19:34:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MG1052V9Nz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 03:34:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AeNRKChp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.48; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AeNRKChp;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120048.outbound.protection.outlook.com [40.107.12.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MG0zH54lWz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 03:33:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g51UkofqhRnzXonYexr9oHLrI18p5ssiWb9EtV50aVgw3hFUiBu3XBii6/VseFfDxCHF6POSJGfA9iKI430TM+MG475cQ+1XRmWKlwburbU3ZIS47nDAx2GLTuJ730HXy4XHjh12SkgWBdSmMkpfmT+TfgVK9V0vYYWmzD/5p+yg/ANudxmru3VbJQJPS507xfcWk2UR0R1GO6kTbtz832fpfR4vXs2BorFdiBCaWgTqgspEYZAkNkcXLp75uZFVAJ0bMh/luqTUGq6bhlJwnXnk2kSng/qFk6I8+a6ndNo75sBG+BUgzRyLjEJowSpoTkSuxcU2Bz9sTG0XtTP1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3AtVEGnvksZgteFKexFYtwTUYPiJEP/qzmEFPopSUw=;
 b=SgfMf6hCoJiehhESoznQtWc6xnFyaFPXhHuwnu8zOnCXTfRGj1el17z6w16POk1VCnIA7KOFE0+rWgy3ZdR+TLT7aJ0pR0z4+gaVP6Tnz2MGWlaBtV4iVMp1l1HToKtvp6OCevn4WYnd+4F+Qg4rgZYosaghMoCKXc/J2MXTdSl/+2rsdjqHOlMTAbddwl0jWQ+UJcmhlyk0jdvYUby9SO/CMAptlLxZG8iARHCfd6MCrkRiexWo52l6dTi+YzH2UGsautabqNdyZMfJVOX48DPiOwUiCnlXqt1bAWgB6iWADXhBD0kKaUNNQwH93s1iVFvZa1A4Unx6W+X/5KuHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3AtVEGnvksZgteFKexFYtwTUYPiJEP/qzmEFPopSUw=;
 b=AeNRKChpXkC1X862ZPUVLycnYsaZd7qWqb9BRUCE/L+T7f9havPz1QB2wOtuJtzK38Taqlj47h5m6K0x50LeD9/kJ0SGt8xWO3Lz3K9775naiS1avZ4hx3ikm0iQveV5PuK0P1BOmufhq7D0RXsBfH8Eaq8E3mcDFPTizy97Isenp1BU5SRgrjoAxBqwI+dGcgi63biH4Jb7vSrprpoC1rqFJhs53mYrCBboyZdfrnFfTnWrPN8nKTkiwYkg3FqMJ8LK/20fdrg+ACUstgjtLFm+vxi76CEfTDpndtk7Q0NGucP8Zl/mxr1iHQLZhDtyCf78bWLSEBtBD6KDmG/Kwg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Sun, 28 Aug
 2022 17:33:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 17:33:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index: AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+A
Date: Sun, 28 Aug 2022 17:33:08 +0000
Message-ID: <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
In-Reply-To: <20220828095659.4061-1-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4505c7c-1a2e-4e80-aaf4-08da891b5f61
x-ms-traffictypediagnostic: MRZP264MB3066:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  trGxTC11tf1xUyHIDfzKuliDwEvLP9AR4AW61nImJDvTId+JFmfW6ZOsUrLttTjR0klfgjQtzLSrGZKZuJKXOQNQn2iqQay/NTq2tDkeEwCXrFvWliaS0S3XHA7GVniajU+KBKYayGyaxV+gGk2Ln3B81p+8uGkcW2qFTAkLkKynW5yZiH9+ZeQZZHokkgCCBatCvb9GCdEA3koXcOnze3j2zGmxXq4gWEtET6AhywvBKqKnhBJAWygYMnOphE/B048WDR6YkV3h4+mQ0bVclN+taI075HJWy3q+vENv5U1GS1ly+kpQWb1dpRJ8UE3agEP8aiVcGSr/y5YqQYGtnVL5NaQviQXY8vlQ9b7Tyx96fWszwEljILHzB7pm5ILzuZnH0HeTJYtREXkEGftPHyBgyMspeLsNIrO880Akqk0VTcHoeNwpsnZS6qltE6qG8ON4BcimK4QgyKvexcLWDjCxY+FdCG1nhPrNu3HdxC5R1kJ98gZUfMXfArQgieb+D8nfsTZ9fxzqkAjlTKI/P7kHJCzSYgimwZzkc/KQxdLvlsJUpUSLBdf1xCPml3MJ/JlpO0+esEjo1yfdyMR4YekzMjHkvB9PEjbmIwQ4l7Dc+FtKWeqKEp7kYgdsdJnqaf5d2UJznvUlwH0WFpYndo4WRnMx8epOollRQSrQQFZW/f/NmlNln3zgA68jJgAzpqg90coIJKWHLETZtrI1Z+YOZkBlCXvMNpw0O40PGIB3Bm2DX0DNEZf7K8de2NbwB0c6vQ+on/JCUwdyU30o7fwUiDQ+B2OBZaOdOZwV4sKMYmjWbgKgZYBxxiYYIosK+yvS7fuHzYOKyqA3kgkb6g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(366004)(39840400004)(136003)(86362001)(26005)(6512007)(6486002)(31696002)(71200400001)(478600001)(6506007)(41300700001)(186003)(122000001)(38100700002)(38070700005)(83380400001)(2616005)(66476007)(66446008)(64756008)(110136005)(8936002)(66946007)(5660300002)(66556008)(4326008)(8676002)(31686004)(36756003)(316002)(54906003)(2906002)(44832011)(91956017)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SUY2QkppdzlZN29LVzVBdHlsZk9tK1NrL2Q2U2h4S0ordHljdytmMEJQcXI5?=
 =?utf-8?B?ajRXdDVvdEJtaFROS3h2RGFGckpXYVNsV09mcWxaSnRFWlA2aEJ5OFRyQ1pM?=
 =?utf-8?B?TnQwSk8rTVFRTDBYaldXMmFJeWdkNlU3cVpIVUVTZTA5K1JSQytRTlFpVlcw?=
 =?utf-8?B?dno5MWhLZ2RPWjB2NDN4K2pxR2lqSUE5Q2RKMk53TUZLRXhhQzNPcU41RHc5?=
 =?utf-8?B?MmV2cnJuK3J3eXhmYkF5SGpNa0p2S3Y3c1JIaTVDZUJEVWQ0MUJVSER3WkVt?=
 =?utf-8?B?VnQyVS9KazZGL2czZ0NsSG1OMlI0ZVVsKy9xbkdOWDAwT3oyaW9acGFrcmxQ?=
 =?utf-8?B?Q2ZjNWlTTThiRVBId21Ma0F6WDhQWC9sTElNanlIaC8xVzJ3Z0xRR3BOYU9E?=
 =?utf-8?B?TmE5bTkyRkVTRHdmc0s3ZmJlcnJ6QjVXWnl4TDV2V1diWFdhQ2c4UE0yRitO?=
 =?utf-8?B?NTAxT0swS3ZrbWhLYXMvcitLWlVKSzZkNDJGenorYVpzVUxmNWRJenY3N1lE?=
 =?utf-8?B?N1k5MGlKWlRQSDlSN1FVMUZBV3BuNmdmZGk1S1d4UEl4UUZvaHdISy9SdERH?=
 =?utf-8?B?SzBhclNzTGhXL3BqMFA4RGRvZzVKWWhMZnNEZklMaURHWTI1cnhGbFRnWXVP?=
 =?utf-8?B?b05OakFnaEJ3a0FaTUdwTjNpd1lZekpvalJzY0ljaGtzZytNTHRQV1VhNG90?=
 =?utf-8?B?cS9rRDV4YlU2Q0hoRSs0QWJrYWM1dGFBai9mOHVXQUsxa0pJQ1JOMGFOTFVH?=
 =?utf-8?B?VHU1V3dzcUh0dlNBMHZDMUp6QnkrR0dYMEtLNzF0a1ZEUlZtSEJTYlNvRFZx?=
 =?utf-8?B?dHBIeG5zRlFIcFRYWC9jbVNoN1NUbWxBOGc5Y2dlVTl0b1c1bXJHN0hzdkFu?=
 =?utf-8?B?OVNWUjRnRldwVTNmRFpKYkt4UFZob1hKRWdZakpHQmRnWWhSeThid0drVVhY?=
 =?utf-8?B?T2d6YVNyNkhUWm9iRnowMThPRm9wZm0wMldPQSsxYVhiWDJSQU9IVng2clRL?=
 =?utf-8?B?VmFLMTBOTE1GcFdhdnozWERKaTg1c2VMWEtOTTBnOHNsbnBCRzlnejMyaDFp?=
 =?utf-8?B?SE0zWkYzRnFnRkZOeGJJMGZJVlpRaWtnNUNaZlNTMkI2MFdUVXJrR1cweTVu?=
 =?utf-8?B?UG1jN25HemFnemxUaTNFOHltSGpic2pjMjlZREMwY1JkdzdUNXBFQTJTT001?=
 =?utf-8?B?RzNPMHZxOVQwTmZoZ3Zrd0ZwMWl6T2l4aU5ON3Y3bEhDTGVudmN6N21PU0NJ?=
 =?utf-8?B?K2xxaGFqZFJEZWlvMkJiNWhkUTV5YjRyUnZDWVl3YUZMQUpYaW5CdDdBSzVE?=
 =?utf-8?B?THk5UFlrcGM0eWpaR3A1K09SLzR5djlqTy9JTWE3dUFwRTZ2YnRRM29OZFE2?=
 =?utf-8?B?VUU1VTBjK1d2Vmo4WlRid1BZMGNiVWI3cHhUWTFEZitycWpuMGtNYk8xWmpu?=
 =?utf-8?B?L2JhUmo3SkNaOXhkZ3J2VWI1UlByZGRIMWJaNUlEVkt3SjRrdW1ocXM0a0lM?=
 =?utf-8?B?WEl6UEx5UGVvZ0J3N0hqck40SnE4Mk9qM1BRSGVSbjNXTjZJeFhHdWVFRENk?=
 =?utf-8?B?T0RJTzFrdDk1TExVN3RRTnRjZFdFMUxNRjJGVktRY0ZlS1M2ME5UenlQQVV4?=
 =?utf-8?B?Sjk5QUhpeE9sc1J0R0JBQWRBNWFtYlM1TEdjcHhEaUxsZmVORkFGbGNGRmRQ?=
 =?utf-8?B?cmxEUUcwQXMvdmt5a1pPanBDT2lrZnRaSUo3SndkQ3lhb2poOThzRkx1TndU?=
 =?utf-8?B?UFVvNXgxSHowbGhGNXBVR2YvbE5jZDEraVEzNzU1T0IvMG5ITzdIbGZZUUhU?=
 =?utf-8?B?a0ltQkVmc0ljeGt4ODdPMGZ1MzJienAvOG92eFZGOWUrRTRReC85QlpJQ3hv?=
 =?utf-8?B?RjhOVnhkUGtJWE1YOEtVZS9SRjdVN1lOOWEyQXFnRFFVVmIzd0h1aEdtV3Mr?=
 =?utf-8?B?U0h1RitmSDcyOWRpdXhtbXl0T2xBN1NZZ1BZaGlNNEcyN0NCTEk0VTlacXRq?=
 =?utf-8?B?VTlINDdhVHFJbHc4L082TEZ4Zm15NXRYZUZ1aGpZTk53dXhNakVNd1lzN0Nl?=
 =?utf-8?B?bHFPNXJZOVZJOUE0ZWhJQmM5L0dHWkdMM3ZFVElkZXJxRzdlQmpUNXVYVlVu?=
 =?utf-8?B?emFxS2dXVDFIRlNlK2tFM3NjTFdPbmVSQ3kvZUdRdENLeEtLbGhMa0l5RmhK?=
 =?utf-8?Q?StfXZWstr0PJhu09TYHFCV4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EF532033A6CA849826C42214C398B99@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4505c7c-1a2e-4e80-aaf4-08da891b5f61
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 17:33:08.3549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/efMZygVKnPc4QdeILC53KjWz+CTNOi7Ts63Xqkm/VjyQHuSxPZWuFWEL5L2rI8KGeIOY5StNj+jWslGurA6kacmg7bimOUZy/P0ddZJCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3066
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA4LzIwMjIgw6AgMTE6NTYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IFdo
ZW4gQ09ORklHX1RBUkdFVF9DUFUgaXMgc3BlY2lmaWVkIHRoZW4gcGFzcyBpdHMgdmFsdWUgdG8g
dGhlIGNvbXBpbGVyDQo+IC1tY3B1IG9wdGlvbi4gVGhpcyBmaXhlcyBmb2xsb3dpbmcgYnVpbGQg
ZXJyb3Igd2hlbiBidWlsZGluZyBrZXJuZWwgd2l0aA0KPiBwb3dlcnBjIGU1MDAgU1BFIGNhcGFi
bGUgY3Jvc3MgY29tcGlsZXJzOg0KPiANCj4gICAgICBCT09UQVMgIGFyY2gvcG93ZXJwYy9ib290
L2NydDAubw0KPiAgICBwb3dlcnBjLWxpbnV4LWdudXNwZS1nY2M6IGVycm9yOiB1bnJlY29nbml6
ZWQgYXJndW1lbnQgaW4gb3B0aW9uIOKAmC1tY3B1PXBvd2VycGPigJkNCj4gICAgcG93ZXJwYy1s
aW51eC1nbnVzcGUtZ2NjOiBub3RlOiB2YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFy
ZTogODU0MCA4NTQ4IG5hdGl2ZQ0KPiAgICBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290
L01ha2VmaWxlOjIzMTogYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5vXSBFcnJvciAxDQoNCmNvcmVu
ZXQ2NF9zbXBfZGVmY29uZmlnIDoNCg0KICAgQk9PVEFTICBhcmNoL3Bvd2VycGMvYm9vdC9jcnQw
Lm8NCnBvd2VycGM2NC1saW51eC1nY2M6IGVycm9yOiBtaXNzaW5nIGFyZ3VtZW50IHRvICctbWNw
dT0nDQptYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlOjIzNyA6IGFyY2gv
cG93ZXJwYy9ib290L2NydDAub10gDQpFcnJldXIgMQ0KbWFrZTogKioqIFthcmNoL3Bvd2VycGMv
TWFrZWZpbGU6MjUzIDogdUltYWdlXSBFcnJldXIgMg0KDQoNCkNocmlzdG9waGUNCg0KDQo+IA0K
PiBTaW1pbGFyIGNoYW5nZSB3YXMgYWxyZWFkeSBpbnRyb2R1Y2VkIGZvciB0aGUgbWFpbiBwb3dl
cnBjIE1ha2VmaWxlIGluDQo+IGNvbW1pdCA0NDZjZGExYjIxZDkgKCJwb3dlcnBjLzMyOiBEb24n
dCBhbHdheXMgcGFzcyAtbWNwdT1wb3dlcnBjIHRvIHRoZQ0KPiBjb21waWxlciIpLg0KPiANCj4g
Rml4ZXM6IDQwYTc1NTg0ZTUyNiAoInBvd2VycGMvYm9vdDogQnVpbGQgd3JhcHBlciBmb3IgYW4g
YXBwcm9wcmlhdGUgQ1BVIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyA0NDZjZGEx
YjIxZDkgKCJwb3dlcnBjLzMyOiBEb24ndCBhbHdheXMgcGFzcyAtbWNwdT1wb3dlcnBjIHRvIHRo
ZSBjb21waWxlciIpDQo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlIHwgMTQgKysrKysrKysr
Ky0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZSBiL2FyY2gv
cG93ZXJwYy9ib290L01ha2VmaWxlDQo+IGluZGV4IGE5Y2QyZWE0YTg2MS4uMTk1N2EzZGU3YTFj
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPiArKysgYi9hcmNo
L3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPiBAQCAtMzgsMTMgKzM4LDE5IEBAIEJPT1RDRkxBR1Mg
ICAgOj0gLVdhbGwgLVd1bmRlZiAtV3N0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJpZ3JhcGhzIFwN
Cj4gICAJCSAkKExJTlVYSU5DTFVERSkNCj4gICANCj4gICBpZmRlZiBDT05GSUdfUFBDNjRfQk9P
VF9XUkFQUEVSDQo+IC1pZmRlZiBDT05GSUdfQ1BVX0xJVFRMRV9FTkRJQU4NCj4gLUJPT1RDRkxB
R1MJKz0gLW02NCAtbWNwdT1wb3dlcnBjNjRsZQ0KPiArQk9PVENGTEFHUwkrPSAtbTY0DQo+ICAg
ZWxzZQ0KPiAtQk9PVENGTEFHUwkrPSAtbTY0IC1tY3B1PXBvd2VycGM2NA0KPiArQk9PVENGTEFH
UwkrPSAtbTMyDQo+ICAgZW5kaWYNCj4gKw0KPiAraWZkZWYgQ09ORklHX1RBUkdFVF9DUFVfQk9P
TA0KPiArQk9PVENGTEFHUwkrPSAtbWNwdT0kKENPTkZJR19UQVJHRVRfQ1BVKQ0KPiArZWxzZSBp
ZmRlZiBDT05GSUdfUFBDNjRfQk9PVF9XUkFQUEVSDQo+ICtpZmRlZiBDT05GSUdfQ1BVX0xJVFRM
RV9FTkRJQU4NCj4gK0JPT1RDRkxBR1MJKz0gLW1jcHU9cG93ZXJwYzY0bGUNCj4gICBlbHNlDQo+
IC1CT09UQ0ZMQUdTCSs9IC1tMzIgLW1jcHU9cG93ZXJwYw0KPiArQk9PVENGTEFHUwkrPSAtbWNw
dT1wb3dlcnBjNjQNCj4gK2VuZGlmDQo+ICAgZW5kaWYNCj4gICANCj4gICBCT09UQ0ZMQUdTCSs9
IC1pc3lzdGVtICQoc2hlbGwgJChCT09UQ0MpIC1wcmludC1maWxlLW5hbWU9aW5jbHVkZSk=
