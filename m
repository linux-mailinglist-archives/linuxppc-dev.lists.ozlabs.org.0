Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5436186B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 05:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM2Pj2DX4z3bvK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 13:53:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=oppo.com header.i=@oppo.com header.a=rsa-sha256 header.s=selector1 header.b=D4GE6Eng;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oppo.com (client-ip=40.107.131.51;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=handapeng@oppo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=oppo.com header.i=@oppo.com header.a=rsa-sha256
 header.s=selector1 header.b=D4GE6Eng; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310051.outbound.protection.outlook.com [40.107.131.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM1VZ3FS0z2yqD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 13:12:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzNkW0S1nJpepuLwXdIlM1gZEPvaDwEbV9yBn+CEq6tFlGeqXkLwZcQp22fYv5WGLcFU1Npoap4hfi7jhMxD+31DK+GLGthfDxYKzgGaPSIV3jcVO/5N7xRHcNF25KM723e+jzJZqTTcdfjmeQpmD+NypTgEjgENpbI42A2WMEmh6Oha5LkF7vUUZltzpLCsuFXFINCvth0OsIRRYxOi4Swddrn4fQc8VSBiVHsD+VhFXkDbjaGnqF+MfFkgsrQsMoJLoYumP+J3xANgJmkUoOJCC3zqaKlBpAOhJWpJbPvMs9KQimY+i04lENbZ9RP56aji12yFUPpUEj+Qi/+IPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra/WyENUYPIxzI4nv2Im6DUpL1iDhmn9vCRm9lEXkJs=;
 b=cF5ABDro8OiNtSQBGuuMAZWqbznIpISJZ/T2Mr/E2fCQT4LkcgJ6fsxTVu49L5vSaGy2m+XbQUqynmpS1NsVHpoms2l2lv/M4bTrVKFJ/BAZ4YZI9vheDoMlAPBiHoEuzn/Me2liG46BeM4LnzoO2gOM8eNAe3z8+ZnY5QOqXnpPgjGX33RzthJ36Na8gSn5UZjwksaByGNppsWGbunMqsL/RMUvPIZSoFXwmelHSsREeiUJNdAQjZ9BXcqOVjgdjD6LUfr+mB9kv35UqSl8x8eK7vZf1SJt2+MP6OiaEqmbL3rV3Gik3M1QHMOP6X1A7dJHkgIMWAOTWxz6AYeiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra/WyENUYPIxzI4nv2Im6DUpL1iDhmn9vCRm9lEXkJs=;
 b=D4GE6Eng2fATN33KmEvBqwS0ileMgBqxsvxohIPnMAyyEIQ2vnEmmFnq/kLSaJpOjKyxE3BQZjWeZImDHnKFy3EFXMpX4lAMcxBCcP0ReZvk2ACX2iIkHIv8089INbMvf7dEHoqBJqDFh34MLk+gFC7cnWcbhMzCIFS/rxJmugc=
Received: from TY2PR02MB3709.apcprd02.prod.outlook.com (2603:1096:404:b1::19)
 by TY2PR02MB3421.apcprd02.prod.outlook.com (2603:1096:404:66::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 03:12:40 +0000
Received: from TY2PR02MB3709.apcprd02.prod.outlook.com
 ([fe80::d904:1402:77b8:4765]) by TY2PR02MB3709.apcprd02.prod.outlook.com
 ([fe80::d904:1402:77b8:4765%5]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 03:12:40 +0000
From: =?gb2312?B?uqu088X0KEhhbiBEYXBlbmcp?= <handapeng@oppo.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org"
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Mike Rapoport
 <rppt@kernel.org>, Pekka Enberg <penberg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Arseny Solokha <asolokha@kb.kras.ru>,
 =?gb2312?B?uqu088X0KEhhbiBEYXBlbmcp?= <handapeng@oppo.com>, Arvind Sankar
 <nivedita@alum.mit.edu>, Kees Cook <keescook@chromium.org>, Joerg Roedel
 <jroedel@suse.de>, Christian Brauner <christian.brauner@ubuntu.com>, Kirill
 Tkhai <ktkhai@virtuozzo.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>
Subject: [PATCH] symbol : Make the size of the compile-related array fixed
Thread-Topic: [PATCH] symbol : Make the size of the compile-related array fixed
Thread-Index: AdcybivXL0bXOBP7T6+n0IM9hXFNfw==
Date: Fri, 16 Apr 2021 03:12:40 +0000
Message-ID: <TY2PR02MB3709103991CF81E89C8F1E37CB4C9@TY2PR02MB3709.apcprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none header.from=oppo.com;
x-originating-ip: [58.255.79.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdc98c63-0ad1-4a4b-2b20-08d900857e73
x-ms-traffictypediagnostic: TY2PR02MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR02MB3421B4C563B85F46603650FDCB4C9@TY2PR02MB3421.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:323;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2MoZ0QgEA2HseH+unF+PWetzI//nrtfX5EXksGfJaM50e+KSTkeDOWomrA8myqYgxD10jYfX0dpJfL3mqwsM/mu25K7Bo8ugy0vscBZW22kIMwaTnFjVjLVWs+fA19eU7pWr0xHFwyJqpz4gl7ffNFwY3rIW5y7g1XzDDoW38O+PlsOqsC4cuUyI8BV8wDwBipdnz2qsx7IiCdjA0Sz2jp8OT3HW3heirDSVqqrla4SwJgkaUHBs6Fh0UOXzLqtBs+khc58Pn8KyB1Q3voxzoGDl453skIGu21h8CdknCa3lBDdgHckXO8gV534JgTGwwlPdE9X1mT/b5ngmfvSmgtK17ieFK4Tos+vbCLIxK3icMMiFgU3PSfk1t7x2BOHiph2AyANs1tmhq6jDXbVIMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB3709.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(8676002)(6506007)(186003)(478600001)(33656002)(64756008)(110136005)(921005)(4744005)(7696005)(26005)(85182001)(99936003)(7416002)(5660300002)(4326008)(9686003)(38100700002)(122000001)(86362001)(52536014)(107886003)(2906002)(83380400001)(316002)(66946007)(66476007)(66556008)(71200400001)(66446008)(66616009)(76116006)(8936002)(55016002)(11606007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?SnhvVnc2ajB1OUxoZW5kMWVUQlBjbWttT01adnUyQ09ZVFFnL2d6V3pPM21w?=
 =?gb2312?B?aWhMVTczenBqM01vaXdBSDViOE5NQ1hsd21wZk5OaE5rcmFDNkRDcmF5a2x0?=
 =?gb2312?B?T2s4bVRaanYxclRQellrN3Y4UFM1VkNGUzRMTDB6dVZaOEZ3VkNJS2hDL3NI?=
 =?gb2312?B?YjE5Qm13ZGRaSTNFdk9acXkvRHgreG9PbllMYUZDcnF4RUZFcnhGTDhGZWNP?=
 =?gb2312?B?V3YzQm95R01sM2ljb25pbjU1aHYxelpRd3RyQUd4L0lTUWtwamJ2aXMwZ1NY?=
 =?gb2312?B?Qm5tUEZ4ZnBQZDloRUU0blFmRG1sODgxYjVVUU0wdDh4ZWlwWHYxRmhMUnQy?=
 =?gb2312?B?QTFnRWVnSnJuaTZ4bmsvbTlwRVJDTG5OZ0tjREJJV0FybWRsL1g4UmtyVVNz?=
 =?gb2312?B?R3c0cCswSE5WMDNmYXVESkJXTnQxTGIzaSttN3Y2MjFCdGEvTFExYU13dDZP?=
 =?gb2312?B?bC9RWlYrQVEzTExERCt6RHpnVUpuQUZHeDhZb1liQ2pxMlp6SDVxVnhnc3Z4?=
 =?gb2312?B?WlpDaTdpWGVQblhYRVdUTW1KTXZFL2UwZi9Kamw0OW91V1hPVWdXdHdiMGV0?=
 =?gb2312?B?Q1YxVkdSeWc4bjh5UmY5dVczT3BTcjJINytaN1NEWG9nU2h3cGlIalBPNnhl?=
 =?gb2312?B?Wm1hOUFOT010TzM1b1p4M2FheVBEcTUyY1dTVmx0TGdNSEo5Um9WRG96c2Zp?=
 =?gb2312?B?Y2ZxclRXMnBBWnVVSkFhOWQyOFhNajc3M2ZXaWpKZzhYcXRnSi9ObUNBWEtD?=
 =?gb2312?B?Zy9XTXAxSDVLZm5QNFZadmppbGtGbEc1b3J3WG12SDE0MTA0dWpsenQ1OExr?=
 =?gb2312?B?STBpT29UZE02WDRnWktiSEh1RFhZT0RhaFpBRmpQV1h3cktCYmVndWxVRTJG?=
 =?gb2312?B?c1hPbTZybUlHMnp5bS9KdElxcUpmZzdiVU1mMGp4L1p4VGhUbFU4RmJVZDBv?=
 =?gb2312?B?Q2ZwWCtyMG1sZ0h1RC9yVldjUGRwUit4TTQvT1duOWxYa3N5SjR1K28xWGVt?=
 =?gb2312?B?dnlMdTRqeEFHSUJqTW5md3N4NG9IcjV6aEZJanZXaUV1dXRKUUY3MmhZOEVL?=
 =?gb2312?B?cjBoRnY3QWs4UHdsOCtMUTJYYzByNEFaV3NDQWVBRVltL21Yanc5SWNWTEQw?=
 =?gb2312?B?eGZwYVdUaG5hZTlRQWtQaUVLZWp6UFNDN0J1cEVrVGkvSEVqYTllcFg1S01y?=
 =?gb2312?B?SldGcTlmRG40Ni9iU21qVFBlZmtSVVJyM2c4c3RKcVZBUC82SzhjRGFZVW5r?=
 =?gb2312?B?UDdlMVJEc1J3UytFaDRkTDlKbVV0SEMvMDdPOXNjRCtCbHBBdTQ0a1duUlpE?=
 =?gb2312?B?cldhWVphTVJQbTdkakJweVQ5L0lOZjNmVDFuN0V2ejc0NXFxWDRMQ0ZwTlRr?=
 =?gb2312?B?aktxT01INWNqTU0zaFBFRWVQNWM4eFJKenE1TldTZHE0dXVKU2lTNENkSENH?=
 =?gb2312?B?VE5HbytoZmtGYW9QN2p0RmE5TUYzYjM2OWhRTGd2SmZKZDdhbU5BWmxzYmJn?=
 =?gb2312?B?SDlmOGtOV05RbkZBNjl1YlVaR1NRL2N6NE1kRGZiTUFkYmRubjkxSUtRWThr?=
 =?gb2312?B?VGI4S0RJdXdPWjV1ck9CQVRCTU5EWk9nbkp5bTAveGh3b3E1c2FyZ2VXRFcx?=
 =?gb2312?B?aWw0eW56QkVvMjNKMFFuWjBmalEyS2Fnb1BTOHUwSkd1aVMzdDZBZDZBZkhQ?=
 =?gb2312?B?WkllbmNJWGVpL3NEUGxuNUpYb2gwdTUrT3MydUZDRUtsRDR4Q3o3MTM4YjQy?=
 =?gb2312?Q?BNMqjFsdzAxz0zmTDs=3D?=
Content-Type: multipart/mixed;
 boundary="_004_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_"
MIME-Version: 1.0
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3709.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc98c63-0ad1-4a4b-2b20-08d900857e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 03:12:40.0363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGGYufDSht6IPhKVITuH9saVTFYqi0CNDlqwQMds+56lzY44xcIq2H79AkG0UkN27xG7j2YKd+q0i5ZmrdINSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB3421
X-Mailman-Approved-At: Fri, 16 Apr 2021 13:53:19 +1000
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
Cc: =?gb2312?B?s8KwssfsKEFucWluZyk=?= <chenanqing@oppo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_004_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_
Content-Type: multipart/alternative;
	boundary="_000_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_"

--_000_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KT1BQTw0KDQqxvrXn19PTyrz+vLDG
5Li9vP66rNPQT1BQT7mry761xLGjw9zQxc+io6y99s/e09rTyrz+1rjD97XEytW8/sjLyrnTw6Oo
sPy6rLj2yMu8sMi61+mjqaGjvfvWucjOus7Iy9TazrS+rcrayKi1xMfpv/bPwtLUyM66ztDOyr3K
udPDoaPI57n7xPq07crVwcuxvtPKvP6jrMfrwaK8tNLUtefX09PKvP7NqNaqt6K8/sjLsqLJvrP9
sb7Tyrz+vLDG5Li9vP6how0KDQpUaGlzIGUtbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRh
aW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gT1BQTywgd2hpY2ggaXMgaW50ZW5kZWQg
b25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJv
dmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdh
eSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xv
c3VyZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRo
YW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2
ZSB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25l
IG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQhDQo=

--_000_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=B5=C8=CF=DF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<hr>
<div style=3D"font-size: 12px;"><strong style=3D"color: rgb(0, 107, 55); fo=
nt-family: ArialMT;">OPPO</strong></div>
<div style=3D"font-size: 12px;"><strong style=3D"color: rgb(0, 107, 55); fo=
nt-family: ArialMT; font-size: 14px;"><span style=3D"font-size: 12px;"><br>
</span></strong></div>
<div></div>
<div style=3D"color: rgb(49, 53, 59); font-family: Helvetica; font-variant-=
numeric: normal; font-variant-east-asian: normal; line-height: 22.4px; wido=
ws: 1;">
<span style=3D"color: rgb(202, 202, 200); font-family: ArialMT; font-size: =
12px;">=B1=BE=B5=E7=D7=D3=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0<s=
pan style=3D"font-stretch: normal; line-height: normal;">OPPO</span>=B9=AB=
=CB=BE=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=D3=CA=BC=FE=D6=
=B8=C3=F7=B5=C4=CA=D5=BC=FE=C8=CB=CA=B9=D3=C3=A3=A8=B0=FC=BA=AC=B8=F6=C8=CB=
=BC=B0=C8=BA=D7=E9=A3=A9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=C8=CB=D4=DA=CE=B4=BE=
=AD=CA=DA=C8=A8=B5=C4=C7=E9=BF=F6=CF=C2=D2=D4=C8=CE=BA=CE=D0=CE=CA=BD=CA=B9=
=D3=C3=A1=A3=C8=E7=B9=FB=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC</s=
pan><span style=3D"font-family: ArialMT; color: rgb(202, 202, 200); font-si=
ze: 12px;">=C7=EB=C1=A2=BC=B4=D2=D4=B5=E7=D7=D3=D3=CA=BC=FE=CD=A8=D6=AA=B7=
=A2=BC=FE=C8=CB=B2=A2=C9=BE=B3=FD=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=
=A1=A3</span></div>
<div style=3D"color: rgb(49, 53, 59); font-family: Helvetica; font-variant-=
numeric: normal; font-variant-east-asian: normal; line-height: 22.4px; wido=
ws: 1;">
<p style=3D"margin: 0px; font-stretch: normal; line-height: normal; min-hei=
ght: 15px;">
<span style=3D"color: rgb(202, 202, 200);"><span style=3D"font-size: 12px; =
font-family: ArialMT;">This e-mail and its attachments contain confidential=
 information from OPPO</span><span style=3D"font-size: 12px; font-family: A=
rialMT; font-stretch: normal; line-height: normal;">,</span><span style=3D"=
font-size: 12px; font-family: ArialMT;">&nbsp;which
 is intended only for the person or entity whose address is listed above. A=
ny use of the information contained herein in any way&nbsp;</span><span sty=
le=3D"font-size: 12px; font-family: ArialMT; font-stretch: normal; line-hei=
ght: normal;">(</span><span style=3D"font-size: 12px; font-family: ArialMT;=
">including</span><span style=3D"font-size: 12px; font-family: ArialMT; fon=
t-stretch: normal; line-height: normal;">,</span><span style=3D"font-size: =
12px; font-family: ArialMT;">&nbsp;but
 not limited to</span><span style=3D"font-size: 12px; font-family: ArialMT;=
 font-stretch: normal; line-height: normal;">,</span><span style=3D"font-si=
ze: 12px; font-family: ArialMT;">&nbsp;total or partial disclosure</span><s=
pan style=3D"font-size: 12px; font-family: ArialMT; font-stretch: normal; l=
ine-height: normal;">,</span><span style=3D"font-size: 12px; font-family: A=
rialMT;">&nbsp;reproduction</span><span style=3D"font-size: 12px; font-fami=
ly: ArialMT; font-stretch: normal; line-height: normal;">,</span><span styl=
e=3D"font-size: 12px; font-family: ArialMT;">&nbsp;or
 dissemination</span><span style=3D"font-size: 12px; font-family: ArialMT; =
font-stretch: normal; line-height: normal;">)</span><span style=3D"font-siz=
e: 12px; font-family: ArialMT;">&nbsp;by persons other than the intended re=
cipient</span><span style=3D"font-size: 12px; font-family: ArialMT; font-st=
retch: normal; line-height: normal;">(</span><span style=3D"font-size: 12px=
; font-family: ArialMT;">s</span><span style=3D"font-size: 12px; font-famil=
y: ArialMT; font-stretch: normal; line-height: normal;">)</span><span style=
=3D"font-size: 12px; font-family: ArialMT;">&nbsp;is
 prohibited. If you receive this e-mail in error</span><span style=3D"font-=
size: 12px; font-family: ArialMT; font-stretch: normal; line-height: normal=
;">,</span><span style=3D"font-size: 12px; font-family: ArialMT;">&nbsp;ple=
ase notify the sender by phone or email immediately
 and delete it!</span></span></p>
</div>
<div></div>
</body>
</html>

--_000_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_--

--_004_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_
Content-Type: application/octet-stream;
	name="0001-symbol-Make-the-size-of-the-compile-related-array-fi.patch"
Content-Description:  0001-symbol-Make-the-size-of-the-compile-related-array-fi.patch
Content-Disposition: attachment;
	filename="0001-symbol-Make-the-size-of-the-compile-related-array-fi.patch";
	size=3990; creation-date="Fri, 16 Apr 2021 03:11:14 GMT";
	modification-date="Fri, 16 Apr 2021 03:11:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1NDBlNmE2YzM2ZTYzNzJkNGY5OWVlYjRhNTBjOGVhYTZkNzk4OWIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW4gRGFwZW5nIDxoYW5kYXBlbmdAb3Bwby5jb20+CkRhdGU6
IEZyaSwgMTYgQXByIDIwMjEgMTA6MzY6MzggKzA4MDAKU3ViamVjdDogW1BBVENIXSBzeW1ib2wg
OiBNYWtlIHRoZSBzaXplIG9mIHRoZSBjb21waWxlLXJlbGF0ZWQgYXJyYXkgZml4ZWQKCkZvciB0
aGUgc2FtZSBjb2RlLCB0aGUgbWFjaGluZSdzIHVzZXIgbmFtZSwgaG9zdG5hbWUsIG9yIGNvbXBp
bGF0aW9uIHRpbWUKbWF5IGNhdXNlIHRoZSBrZXJuZWwgc3ltYm9sIGFkZHJlc3MgdG8gYmUgaW5j
b25zaXN0ZW50LCB3aGljaCBpcyBub3QKZnJpZW5kbHkgdG8gc29tZSBzeW1ib2wtZGVwZW5kZW50
IHNvZnR3YXJlLCBzdWNoIGFzIENyYXNoLgoKU2lnbmVkLW9mZi1ieTogSGFuIERhcGVuZyA8aGFu
ZGFwZW5nQG9wcG8uY29tPgotLS0KIGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gva2FzbHJfYm9va2Uu
YyB8IDIgKy0KIGFyY2gvczM5MC9ib290L3ZlcnNpb24uYyAgICAgICAgICAgICB8IDIgKy0KIGFy
Y2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jICAgICB8IDIgKy0KIGFyY2gveDg2L2Jvb3Qv
dmVyc2lvbi5jICAgICAgICAgICAgICB8IDIgKy0KIGluaXQvdmVyc2lvbi5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDQgKystLQogc2NyaXB0cy9ta2NvbXBpbGVfaCAgICAgICAgICAgICAgICAg
IHwgMiArKwogNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL25vaGFzaC9rYXNscl9ib29rZS5jIGIvYXJj
aC9wb3dlcnBjL21tL25vaGFzaC9rYXNscl9ib29rZS5jCmluZGV4IDRjNzRlOGE1NDgyYi4uNDk0
ZWY0MDhlNjBjIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoL2thc2xyX2Jvb2tl
LmMKKysrIGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC9rYXNscl9ib29rZS5jCkBAIC0zNyw3ICsz
Nyw3IEBAIHN0cnVjdCByZWdpb25zIHsKIH07CiAKIC8qIFNpbXBsaWZpZWQgYnVpbGQtc3BlY2lm
aWMgc3RyaW5nIGZvciBzdGFydGluZyBlbnRyb3B5LiAqLwotc3RhdGljIGNvbnN0IGNoYXIgYnVp
bGRfc3RyW10gPSBVVFNfUkVMRUFTRSAiICgiIExJTlVYX0NPTVBJTEVfQlkgIkAiCitzdGF0aWMg
Y29uc3QgY2hhciBidWlsZF9zdHJbQ09NUElMRV9TVFJfTUFYXSA9IFVUU19SRUxFQVNFICIgKCIg
TElOVVhfQ09NUElMRV9CWSAiQCIKIAkJTElOVVhfQ09NUElMRV9IT1NUICIpICgiIExJTlVYX0NP
TVBJTEVSICIpICIgVVRTX1ZFUlNJT047CiAKIHN0cnVjdCByZWdpb25zIF9faW5pdGRhdGEgcmVn
aW9uczsKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9ib290L3ZlcnNpb24uYyBiL2FyY2gvczM5MC9i
b290L3ZlcnNpb24uYwppbmRleCBkMzJlNThiZGRhNmEuLjYyNzQxNmEyN2Q3NCAxMDA2NDQKLS0t
IGEvYXJjaC9zMzkwL2Jvb3QvdmVyc2lvbi5jCisrKyBiL2FyY2gvczM5MC9ib290L3ZlcnNpb24u
YwpAQCAtMyw1ICszLDUgQEAKICNpbmNsdWRlIDxnZW5lcmF0ZWQvY29tcGlsZS5oPgogI2luY2x1
ZGUgImJvb3QuaCIKIAotY29uc3QgY2hhciBrZXJuZWxfdmVyc2lvbltdID0gVVRTX1JFTEVBU0UK
K2NvbnN0IGNoYXIga2VybmVsX3ZlcnNpb25bQ09NUElMRV9TVFJfTUFYXSA9IFVUU19SRUxFQVNF
CiAJIiAoIiBMSU5VWF9DT01QSUxFX0JZICJAIiBMSU5VWF9DT01QSUxFX0hPU1QgIikgIiBVVFNf
VkVSU0lPTjsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jIGIv
YXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2thc2xyLmMKaW5kZXggYjkyZmZmYmU3NjFmLi43Yjcy
YjUxOGE0YzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jCisr
KyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jCkBAIC00Myw3ICs0Myw3IEBACiBl
eHRlcm4gdW5zaWduZWQgbG9uZyBnZXRfY21kX2xpbmVfcHRyKHZvaWQpOwogCiAvKiBTaW1wbGlm
aWVkIGJ1aWxkLXNwZWNpZmljIHN0cmluZyBmb3Igc3RhcnRpbmcgZW50cm9weS4gKi8KLXN0YXRp
YyBjb25zdCBjaGFyIGJ1aWxkX3N0cltdID0gVVRTX1JFTEVBU0UgIiAoIiBMSU5VWF9DT01QSUxF
X0JZICJAIgorc3RhdGljIGNvbnN0IGNoYXIgYnVpbGRfc3RyW0NPTVBJTEVfU1RSX01BWF0gPSBV
VFNfUkVMRUFTRSAiICgiIExJTlVYX0NPTVBJTEVfQlkgIkAiCiAJCUxJTlVYX0NPTVBJTEVfSE9T
VCAiKSAoIiBMSU5VWF9DT01QSUxFUiAiKSAiIFVUU19WRVJTSU9OOwogCiBzdGF0aWMgdW5zaWdu
ZWQgbG9uZyByb3RhdGVfeG9yKHVuc2lnbmVkIGxvbmcgaGFzaCwgY29uc3Qgdm9pZCAqYXJlYSwK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvdmVyc2lvbi5jIGIvYXJjaC94ODYvYm9vdC92ZXJz
aW9uLmMKaW5kZXggYTFhYWFmNmMwNmE2Li4wOGZlYWEyZDdhMTAgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2Jvb3QvdmVyc2lvbi5jCisrKyBiL2FyY2gveDg2L2Jvb3QvdmVyc2lvbi5jCkBAIC0xNCw2
ICsxNCw2IEBACiAjaW5jbHVkZSA8Z2VuZXJhdGVkL3V0c3JlbGVhc2UuaD4KICNpbmNsdWRlIDxn
ZW5lcmF0ZWQvY29tcGlsZS5oPgogCi1jb25zdCBjaGFyIGtlcm5lbF92ZXJzaW9uW10gPQorY29u
c3QgY2hhciBrZXJuZWxfdmVyc2lvbltDT01QSUxFX1NUUl9NQVhdID0KIAlVVFNfUkVMRUFTRSAi
ICgiIExJTlVYX0NPTVBJTEVfQlkgIkAiIExJTlVYX0NPTVBJTEVfSE9TVCAiKSAiCiAJVVRTX1ZF
UlNJT047CmRpZmYgLS1naXQgYS9pbml0L3ZlcnNpb24uYyBiL2luaXQvdmVyc2lvbi5jCmluZGV4
IDkyYWZjNzgyYjA0My4uYWRmYzllOTFiNTZiIDEwMDY0NAotLS0gYS9pbml0L3ZlcnNpb24uYwor
KysgYi9pbml0L3ZlcnNpb24uYwpAQCAtMzUsMTEgKzM1LDExIEBAIHN0cnVjdCB1dHNfbmFtZXNw
YWNlIGluaXRfdXRzX25zID0gewogRVhQT1JUX1NZTUJPTF9HUEwoaW5pdF91dHNfbnMpOwogCiAv
KiBGSVhFRCBTVFJJTkdTISBEb24ndCB0b3VjaCEgKi8KLWNvbnN0IGNoYXIgbGludXhfYmFubmVy
W10gPQorY29uc3QgY2hhciBsaW51eF9iYW5uZXJbQ09NUElMRV9TVFJfTUFYXSA9CiAJIkxpbnV4
IHZlcnNpb24gIiBVVFNfUkVMRUFTRSAiICgiIExJTlVYX0NPTVBJTEVfQlkgIkAiCiAJTElOVVhf
Q09NUElMRV9IT1NUICIpICgiIExJTlVYX0NPTVBJTEVSICIpICIgVVRTX1ZFUlNJT04gIlxuIjsK
IAotY29uc3QgY2hhciBsaW51eF9wcm9jX2Jhbm5lcltdID0KK2NvbnN0IGNoYXIgbGludXhfcHJv
Y19iYW5uZXJbQ09NUElMRV9TVFJfTUFYXSA9CiAJIiVzIHZlcnNpb24gJXMiCiAJIiAoIiBMSU5V
WF9DT01QSUxFX0JZICJAIiBMSU5VWF9DT01QSUxFX0hPU1QgIikiCiAJIiAoIiBMSU5VWF9DT01Q
SUxFUiAiKSAlc1xuIjsKZGlmZiAtLWdpdCBhL3NjcmlwdHMvbWtjb21waWxlX2ggYi9zY3JpcHRz
L21rY29tcGlsZV9oCmluZGV4IDRhZTczNTAzOWRhZi4uMDJiOWQ5ZDU0ZGE5IDEwMDc1NQotLS0g
YS9zY3JpcHRzL21rY29tcGlsZV9oCisrKyBiL3NjcmlwdHMvbWtjb21waWxlX2gKQEAgLTY1LDYg
KzY1LDggQEAgVVRTX1ZFUlNJT049IiQoZWNobyAkVVRTX1ZFUlNJT04gJENPTkZJR19GTEFHUyAk
VElNRVNUQU1QIHwgY3V0IC1iIC0kVVRTX0xFTikiCiAgIExEX1ZFUlNJT049JCgkTEQgLXYgfCBo
ZWFkIC1uMSB8IHNlZCAncy8oY29tcGF0aWJsZSB3aXRoIFteKV0qKS8vJyBcCiAJCSAgICAgIHwg
c2VkICdzL1tbOnNwYWNlOl1dKiQvLycpCiAgIHByaW50ZiAnI2RlZmluZSBMSU5VWF9DT01QSUxF
UiAiJXMiXG4nICIkQ0NfVkVSU0lPTiwgJExEX1ZFUlNJT04iCisKKyAgZWNobyBcI2RlZmluZSBD
T01QSUxFX1NUUl9NQVggNTEyCiB9ID4gLnRtcGNvbXBpbGUKIAogIyBPbmx5IHJlcGxhY2UgdGhl
IHJlYWwgY29tcGlsZS5oIGlmIHRoZSBuZXcgb25lIGlzIGRpZmZlcmVudCwKLS0gCjIuMjcuMAoK

--_004_TY2PR02MB3709103991CF81E89C8F1E37CB4C9TY2PR02MB3709apcp_--
