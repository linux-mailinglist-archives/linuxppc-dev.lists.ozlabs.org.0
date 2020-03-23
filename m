Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ABD18F6FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 15:35:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mH3m4HfSzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:35:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mGgF6DZ1zDqxs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=FH4vQUmu; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mGgD6LsSz8tMV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:17:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mGgD3rwKz9sRN; Tue, 24 Mar 2020 01:17:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.75.77;
 helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=FH4vQUmu; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mGgB4777z9sPF
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 01:17:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+kaOVvvaOVCmZ2NVDwBJKy4Pbv+K2xw4baOC/5xI8SI6iWL2d9DjPzprdtbSJktzndRvSHD4d2jMXPfWxLA3bnisurwWBDr1aIAiv5VxUkM77Ud06VZS4ZEUOOkO8HJb3eI40urRo3dHOgU8D01DZSgSCBFe+6kCrpog0j//iQyZjhWvFjwrnISwmAvSZzVvst6rZ3dP6jk85SKwgw4gtE/4u4O8KxK2Otktsg70N8Xy2y33++G/bn9pR2c3tTLKLBf7rzjckDknqUBrKSJ8XYi+7Ac/AwthhbjUEn87reXxhj7ATePvl3NUu+38oSv92cDVGg7rZek4idLteqPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe53T5atZD/SDxpXXit7cy4yhl2HOVL/zrQhB3mLoqg=;
 b=ZxUtiDCb0EnCIxdGhzR3uOiROOL/9U6PRzbEM6kobnLl6KMe/sxh7n+AsAqV5bsjpCPzSPIxWXIRDQOBq/HWyGLuSEq/sX85fMuMesU/3hUCu6UYUNoows8DIkG+YmujHqDcOGzpNn+mBRM6JKxq6ZSmv89hpBCDya3q+F013UpVSWrEUJ/+jLkwCZNxVDDLIQ21NCebiYJZuUWMQw7yoDPi9Ex+qK46ZcHl6VL94ZHh/LyBIAGgjBC3BuyGn5wSPyiihIsXHoZSKgJJ9mMy97A3F6RJozIPQlGDWbcsD2cvBoTrHf/wRMa2+iOMK/BvG05rNs1g9Rg2Ky8INglsTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe53T5atZD/SDxpXXit7cy4yhl2HOVL/zrQhB3mLoqg=;
 b=FH4vQUmuIDWGMrkxhOE35+KYVbj4l4Yqppmx9YUBoDM736mgshNGWBjwBkeMCT+LEOmm7ZtiEVqgCwh3Wo2mGxz+d98ZOKtZRf7KRWPSX23A2+W60Ys7AIpeCePZc83NDvJ4wI8vGvuBhsfklNkTBuNUW4vZSeh3mo/QkVBQ/PY=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3492.namprd10.prod.outlook.com (2603:10b6:408:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 14:17:36 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:17:36 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+w==
Date: Mon, 23 Mar 2020 14:17:36 +0000
Message-ID: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.35.92 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 714b4eed-ec66-454d-e606-08d7cf34eff8
x-ms-traffictypediagnostic: BN8PR10MB3492:
x-microsoft-antispam-prvs: <BN8PR10MB3492B234292A9844069F5823F4F00@BN8PR10MB3492.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:113;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(81166006)(71200400001)(81156014)(76116006)(8676002)(66556008)(5660300002)(66476007)(2906002)(66946007)(186003)(4744005)(64756008)(26005)(316002)(8936002)(6512007)(6486002)(6506007)(478600001)(36756003)(66446008)(6916009)(86362001)(91956017)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3492;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QBi4GKeeMIKIbdyfVY4k/CNjnAveIE9UV1WP023jSTFBMmcTKFyHfeo14CQvdXDSCqGepK2fYerdJTc0X26XBzRuXQWmGstqQ4PwSOAo+pSNOXlz9mMlbpbgMvBRN9s5EDNhoh/b5gRL6V8S/qQG29qRWj0o6b6PyW9jpo9DCMs5HaZAFJppyE7HYXR7+ogEbz2RSOMa9fqZrCaNcltn1LX/Mobo9Nql/JftabZO4BpFtgRvDt+9646lg8P7ZrpPbS7WsKNEeRSlaMFPpKbAQlVtgA05jrpIypyclkzgXCpgay5HmQeRYep9Ul/ZYVv60VmWTorCvMoqU2gD2RDNeI01m+q+xiuC1XNrJ6d3lYEEcjYr1Q1SY2Xu5h0XdC4dZbLcokfAcKO9NYqWIpAmc1S9MXMx/8JpAfe8oiYTX7qcDOQzvf0z7gwB3X8Lf/MJ
x-ms-exchange-antispam-messagedata: 6P7pX9vWxVf4mJhyd/W6SaqNHcG6g5qXvCC5Q7Z8zJ1+Qe5NazuwlHpRDVEz8p6rGKNQpyus0kV9ovGkEEPfjkCpAMcJlGL5EGPElV2f0dGB9b+nf9Qw3VgaNWxhV4CbsFevp5K6aGLsVe+C4wS4zQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C69244A0676664984188C38D223F7C0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714b4eed-ec66-454d-e606-08d7cf34eff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 14:17:36.5840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fn3cbX3fVWBehlRMrfo7kf5+k5HV60eKRes9ObgjtS7A830GgEyYDG5bp+scr99WnD+ZdsfnyU19OgndLh0FJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3492
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

SW4gX19kaWUoKSwgc2VlIGJlbG93LCB0aGVyZSBpcyB0aGlzIGNhbGwgdG8gbm90aWZ5X3NlbmQo
KSB3aXRoIFNJR1NFR1YgaGFyZGNvZGVkLCB0aGlzIHNlZW1zIG9kZA0KdG8gbWUgYXMgdGhlIHZh
cmlhYmxlICJlcnIiIGhvbGRzIHRoZSB0cnVlIHNpZ25hbChpbiBteSBjYXNlIFNJR0JVUykNClNo
b3VsZCBub3QgU0lHU0VHViBiZSByZXBsYWNlZCB3aXRoIHRoZSB0cnVlIHNpZ25hbCBuby4/DQoN
CiAgSm9ja2UNCg0Kc3RhdGljIGludCBfX2RpZShjb25zdCBjaGFyICpzdHIsIHN0cnVjdCBwdF9y
ZWdzICpyZWdzLCBsb25nIGVycikNCnsNCglwcmludGsoIk9vcHM6ICVzLCBzaWc6ICVsZCBbIyVk
XVxuIiwgc3RyLCBlcnIsICsrZGllX2NvdW50ZXIpOw0KDQoJaWYgKElTX0VOQUJMRUQoQ09ORklH
X0NQVV9MSVRUTEVfRU5ESUFOKSkNCgkJcHJpbnRrKCJMRSAiKTsNCgllbHNlDQoJCXByaW50aygi
QkUgIik7DQoNCglpZiAoSVNfRU5BQkxFRChDT05GSUdfUFJFRU1QVCkpDQoJCXByX2NvbnQoIlBS
RUVNUFQgIik7DQoNCglpZiAoSVNfRU5BQkxFRChDT05GSUdfU01QKSkNCgkJcHJfY29udCgiU01Q
IE5SX0NQVVM9JWQgIiwgTlJfQ1BVUyk7DQoNCglpZiAoZGVidWdfcGFnZWFsbG9jX2VuYWJsZWQo
KSkNCgkJcHJfY29udCgiREVCVUdfUEFHRUFMTE9DICIpOw0KDQoJaWYgKElTX0VOQUJMRUQoQ09O
RklHX05VTUEpKQ0KCQlwcl9jb250KCJOVU1BICIpOw0KDQoJcHJfY29udCgiJXNcbiIsIHBwY19t
ZC5uYW1lID8gcHBjX21kLm5hbWUgOiAiIik7DQoNCglpZiAobm90aWZ5X2RpZShESUVfT09QUywg
c3RyLCByZWdzLCBlcnIsIDI1NSwgU0lHU0VHVikgPT0gTk9USUZZX1NUT1ApDQoJCXJldHVybiAx
Ow0KDQoJcHJpbnRfbW9kdWxlcygpOw0KCXNob3dfcmVncyhyZWdzKTsNCg0KCXJldHVybiAwOw0K
fQ0K
