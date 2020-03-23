Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D3018F8A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:32:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJKx0clRzDrFY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mHpQ1W6rzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=R9lHmPFV; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mHpP0sCpz8tF1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:09:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mHpN6WvFz9sSG; Tue, 24 Mar 2020 02:09:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.237.72;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=R9lHmPFV; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mHpN3KQSz9sR4
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 02:08:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYCXwIhk7zzqrDt7xYPfOLfqCR/CdEfp8XfM6IVKJIM5kVyFqk/wyQ/2JfFZPiU19TMCXULAbB23TVmdbQzOKXq8NaoTsXzW5hYOxzyq2L37qfYkyGWWeOgwfznd45QMeIajvUWcdKJlOTDaE9o1syL6tZONO+7puT297pISB8BuuXydaQw4QyKNmohhItxv63wSDuNQj8EQHKwY3wuA4vgS1qiCwCvkaZNxU/DaSpAjrnOury6AtWPFj6wJ7wrCUxYqlu/K9fVFCqUohThRugNI3CW2/WSD8RrM6Z2815ZKj51yyRbP91KLjUNHAgTmpBIw772+2MnuDkUxGtI6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bKMUEzc+C7WrjuJp2PZIsnW502Blxi9neCbUm8liSY=;
 b=SiuOF7f7X9xhQI+RXIbN75gLEO26zGLnBaOEG9u6fOl7gBIYqHr+EFoBd6Qw55IYqtoSADZqj+FMUA9M6FwXS54wv07ApGdbl3P0/X6EDVszQp9KiqcAMLlXF6pSCW+NIRmPSSensBjp67NCmEEn6az8ubT9hAI9c6FsLl/fm54GtuMgIXojXwKvideFLneQywtcb36qeO50IE8w+e4o9jpW/LnUryCO5c5If1kLXKukK7FzFT/eJZfm6cKpWYKto8FJUgqppPXtsWsL3bkG/XJlseO4McVnDatKh1NyNxvgevgLJYLILsKPHEouanUdrlmz6YRXKpszfIDxeY3xNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bKMUEzc+C7WrjuJp2PZIsnW502Blxi9neCbUm8liSY=;
 b=R9lHmPFVI8XnBE2cIi5+BSov6F2XNv7Hp9N5e9fAg+9HE2hQnpzj6riUzaqdAGSuNFNLZzffh8pE7gogM3FX2MRYjq+s8s9dgvOvMTXIhnsUJQDo3+BNV5PKoJdd8S0LnddWLf6dtm5rbFT8PibtpkKfJKZZqWwxifDS1PQJwP8=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3265.namprd10.prod.outlook.com (2603:10b6:408:cb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 15:08:56 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 15:08:56 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Re: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+6hWQKiAgAAAbwCAAAadgA==
Date: Mon, 23 Mar 2020 15:08:55 +0000
Message-ID: <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
In-Reply-To: <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.35.92 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cf82f09-49ae-400a-5aa5-08d7cf3c1b7e
x-ms-traffictypediagnostic: BN8PR10MB3265:
x-microsoft-antispam-prvs: <BN8PR10MB3265C288CDAA36D16DF607C1F4F00@BN8PR10MB3265.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(26005)(91956017)(966005)(186003)(8936002)(81166006)(81156014)(6486002)(8676002)(86362001)(6506007)(76116006)(64756008)(66556008)(316002)(5660300002)(110136005)(66476007)(71200400001)(36756003)(6512007)(66946007)(66446008)(478600001)(45080400002)(2906002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3265;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4r/mYDi3l5cVYQ+YioHxIv+TNDhs7joKdk18nt3EG3dypnM9cATz2G0hcRkcaM4kYzE9sSR7T3B/L/lWuMCHoJlJue5HkhtSZVjfe9S0x0o2bUckeCTM/jJ2plVS1K7LRGs6Gh4tZeORc2ST1PpmE4Uvm1PRLMNk/+gTDo0t5mOP7MtAxlijWNOK4qWxA8UfGuao4+15rxiPPagI4aZ72jkP6V0YoCrKHcdunvroYuteSkR8cGNcIhIrakgUtPjUDdxl4pkxUCyWQnwFVVL6Es2U7tXQ0ma7ArII5TSPVppVXFafuHivMIO6/16IV69u+DCf0sYZDBeDJVivPY6WatKesbDxTZkE7liqsTWxY7/lbB0wkOXaJbxwT4Ycx6VTZC2w988twLiuGXY73lWN1sxupPt7bSLGKXe5E7itM8C+r0FlMSo4k4Qy8fzPzc9LCX0NQIThJExGGEVI84hjNpsz5EZpWMJ+ek0smuZmJFYzHKMdAxpE+mh6vKP5OqjJfI8apHl1nF5F/fhYPhadQ==
x-ms-exchange-antispam-messagedata: 2q6S3Yizr0WdAT3CPtfZDT8HZh7+fddkFYMd6ur//KzOiNI03O5ET0OnBKAhEB/HC5fwFhUxieUkfsFHjzMfIsnLHSf5gjKmvqkJahMRyekoYC0C3+q0JbepNqBbW712wBEWY8V3X83m7l8BMSg6xw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6186365B128B5A45993D1C736717F439@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf82f09-49ae-400a-5aa5-08d7cf3c1b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 15:08:56.1528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhkGYcVSGdhmWpOP79gYGoqHRpVCYNCc4rVUUMbrr8dfflAl3vQ3P/stVs8v6Y8jZul28Rh0y1kzDtJt1Rvitw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3265
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIwLTAzLTIzIGF0IDE1OjQ1ICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBMZSAyMy8wMy8yMDIwIMOgIDE1OjQzLCBDaHJpc3RvcGhlIExlcm95IGEgw6lj
cml0IDoNCj4gPiANCj4gPiBMZSAyMy8wMy8yMDIwIMOgIDE1OjE3LCBKb2FraW0gVGplcm5sdW5k
IGEgw6ljcml0IDoNCj4gPiA+IEluIF9fZGllKCksIHNlZSBiZWxvdywgdGhlcmUgaXMgdGhpcyBj
YWxsIHRvIG5vdGlmeV9zZW5kKCkgd2l0aA0KPiA+ID4gU0lHU0VHViBoYXJkY29kZWQsIHRoaXMg
c2VlbXMgb2RkDQo+ID4gPiB0byBtZSBhcyB0aGUgdmFyaWFibGUgImVyciIgaG9sZHMgdGhlIHRy
dWUgc2lnbmFsKGluIG15IGNhc2UgU0lHQlVTKQ0KPiA+ID4gU2hvdWxkIG5vdCBTSUdTRUdWIGJl
IHJlcGxhY2VkIHdpdGggdGhlIHRydWUgc2lnbmFsIG5vLj8NCj4gPiANCj4gPiBBcyBmYXIgYXMg
SSBjYW4gc2VlLCBjb21lcyBmcm9tDQo+ID4gaHR0cHM6Ly9uYW0wMy5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIl
MkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0JTJGY29t
bWl0JTJGJTNGaWQlM0Q2NmZjYjEwNTkmYW1wO2RhdGE9MDIlN0MwMSU3Q0pvYWtpbS5UamVybmx1
bmQlNDBpbmZpbmVyYS5jb20lN0M0MjkxYWMxYjUwMWU0Mjk2ODY5YTA4ZDdjZjM4Y2RiNCU3QzI4
NTY0M2RlNWY1YjRiMDNhMTUzMGFlMmRjOGFhZjc3JTdDMSU3QzAlN0M2MzcyMDU3MTUxODkzNjY5
OTUmYW1wO3NkYXRhPVoyYkZzbURsRDJNS2hMQUNRdmF5azllanowZHFnTUVPbEJUbG9jQW10VGcl
M0QmYW1wO3Jlc2VydmVkPTANCj4gPiANCj4gDQo+IEFuZA0KPiBodHRwczovL25hbTAzLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQua2VybmVs
Lm9yZyUyRnB1YiUyRnNjbSUyRmxpbnV4JTJGa2VybmVsJTJGZ2l0JTJGdG9ydmFsZHMlMkZsaW51
eC5naXQlMkZjb21taXQlMkYlM0ZpZCUzRGFlODcyMjFkM2NlNDlkOWRlMWU0Mzc1NmRhODM0ZmQw
YmYwNWEyYWQmYW1wO2RhdGE9MDIlN0MwMSU3Q0pvYWtpbS5UamVybmx1bmQlNDBpbmZpbmVyYS5j
b20lN0M0MjkxYWMxYjUwMWU0Mjk2ODY5YTA4ZDdjZjM4Y2RiNCU3QzI4NTY0M2RlNWY1YjRiMDNh
MTUzMGFlMmRjOGFhZjc3JTdDMSU3QzAlN0M2MzcyMDU3MTUxODkzNjY5OTUmYW1wO3NkYXRhPTk3
a3l6M1VyODhCaERVVVl6eWE1dCUyRkZRVmhYWXU2cWlIb1c4aHNFZzgxcyUzRCZhbXA7cmVzZXJ2
ZWQ9MA0KPiBzaG93cyBpdCBpcyAod2FzPykgc2ltaWxhciBvbiB4ODYuDQo+IA0KDQpJIHRyaWVk
IHRvIGZvbGxvdyB0aGF0IGNoYWluIHRoaW5raW5nIGl0IHdvdWxkIGVuZCB1cCBzZW5kaW5nIGEg
c2lnbmFsIHRvIHVzZXIgc3BhY2UgYnV0IEkgY2Fubm90IHNlZQ0KdGhhdCBoYXBwZW5zLiBTZWVt
cyB0byBiZSByZWxhdGVkIHRvIGRlYnVnZ2luZy4NCg0KSW4gc2hvcnQsIEkgY2Fubm90IHNlZSBh
bnkgc2lnbmFsIGJlaW5nIGRlbGl2ZXJlZCB0byB1c2VyIHNwYWNlLiBJZiBzbyB0aGF0IHdvdWxk
IGV4cGxhaW4gd2h5DQpvdXIgdXNlciBzcGFjZSBwcm9jZXNzIG5ldmVyIGRpZXMuDQpJcyB0aGVy
ZSBhIHNpZ25hbCBoaWRkZW4gaW4gbWFjaGluZV9jaGVjayBoYW5kbGVyIGZvciBTSUdCVVMgSSBj
YW5ub3Qgc2VlPw0KDQogICAgIEpvY2tlDQo=
