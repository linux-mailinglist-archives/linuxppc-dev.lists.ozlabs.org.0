Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFE326E9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 05:39:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HLQb0Z4kzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 13:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.131.94; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=v-lide@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="XHM7kckK"; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310094.outbound.protection.outlook.com [40.107.131.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HL4C56t0zDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 13:23:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=cYNvTIjQ9OFaHJTUQeYcVS4IdxL06IOrc674xKJWLTn8TpVuREJW/zqJtt0cIZ5lny3ROaSfFRc+Q56HUli3MkA2BE0qOTva0ds1DMysnan9/yukon5GjpfISvx7gDpCYmBiBDlP8KGKTFas805RtSY3uKlU2xq7voZsplTpS/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3E7S7hN4t7FSvflUrqz7lJlAww7wYqdnk5HSp4V848=;
 b=fkICxAt/uJlWap2z6VA/sYgpX49U0EqCSmxQ+HkaiZp2SEvQk+522QhA+pz89WbIGrz9/jbU0a366u7hg/qK5mjNaSRTcZsFOmBtk8UIpJN9Lqp21xGMzQLrDChwUG8bhKyYzjPoxR8uAlSIsobOxKEzhtpTbztKQpba9w7i3aA=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3E7S7hN4t7FSvflUrqz7lJlAww7wYqdnk5HSp4V848=;
 b=XHM7kckK+Br+/yAYJf+jlcW5SBXuvDKeS8PuVzxVIfvLNPeHy3Bwagtaeqt5KIm16VsaDodNXrfLI8xXWE30WoMziyUVlqlPLJNCX13eP5kaepKj1LRXSSJNd/uVI7zhv8F8DBynhlWW9Iw42rxFf++6gUcRXpbRt45NxZ2VUn8=
Received: from KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM (52.132.240.147) by
 KL1P15301MB0326.APCP153.PROD.OUTLOOK.COM (52.132.241.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.3; Mon, 3 Jun 2019 03:23:34 +0000
Received: from KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM
 ([fe80::94b3:929c:cb30:a005]) by KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM
 ([fe80::94b3:929c:cb30:a005%9]) with mapi id 15.20.1987.003; Mon, 3 Jun 2019
 03:23:34 +0000
From: "Lili Deng (Wicresoft North America Ltd)" <v-lide@microsoft.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, Dexuan-Linux Cui
 <dexuan.linux@gmail.com>
Subject: RE: [next-20190530] Boot failure on PowerPC
Thread-Topic: [next-20190530] Boot failure on PowerPC
Thread-Index: AQHVF9yX3BwniFeSJ0iqHPvcE2BsqqaJRHIAgAAC7PA=
Date: Mon, 3 Jun 2019 03:23:34 +0000
Message-ID: <KL1P15301MB02948DA3C780A2DC4A145E0F9E140@KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM>
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
 <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
 <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
In-Reply-To: <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=v-lide@microsoft.com; 
x-originating-ip: [2404:f801:8050:3:c0::35f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5479348-b296-43b5-eceb-08d6e7d2dc84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:KL1P15301MB0326; 
x-ms-traffictypediagnostic: KL1P15301MB0326:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <KL1P15301MB032601C3E08B63DC5AB737449E140@KL1P15301MB0326.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(346002)(366004)(136003)(376002)(189003)(199004)(13464003)(53936002)(476003)(66446008)(76116006)(186003)(52536014)(64756008)(8990500004)(99286004)(14444005)(256004)(9686003)(66476007)(73956011)(10090500001)(66556008)(66946007)(14454004)(71200400001)(74316002)(6246003)(5660300002)(305945005)(7736002)(6306002)(446003)(55016002)(6436002)(107886003)(11346002)(33656002)(71190400001)(966005)(229853002)(6116002)(4326008)(46003)(68736007)(10290500003)(86362001)(54906003)(110136005)(8676002)(81166006)(2906002)(6506007)(53546011)(81156014)(316002)(486006)(22452003)(76176011)(478600001)(102836004)(7696005)(25786009)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:KL1P15301MB0326;
 H:KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m5QmYYzmhvcm2j1PUIDXdNL0jYLRNAafIvlskADKEq4fQviUC8YXC9ni47+5iqBvv4bpyiEjRvcnI8/7wamC4Yc7kkpYHt4oXpojYWElQNuNxuNr64NjskiOZtINH/qNJPFq7wOg7wlwXmPtcApR88DVh53YZoowMUnm546K5G9nswY07q48awDAFa5mqXZ4Xh/l82oesC34ACNWLAbe6z31Rh+9qp27VdtaxwbRvWrfjgJaI8BD/HYwhKrY/lGd/0W3gT7to4/MfVmbmIa+l3Sh8Svf2RDXJ1+gpuN6hrDsvMbhhkZ6de/eN5Qz2+Ia6vZY0gBv9KFwnsNrVNp+htRG4LnINDfOVOTfRMb8niW1lkFMJEEViogyWU229LvfcCTj9kZ87XSGDtkgBrikQ7BkaFl3zFz15BuluQqiYLw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5479348-b296-43b5-eceb-08d6e7d2dc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 03:23:34.3773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v-lide@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0326
X-Mailman-Approved-At: Mon, 03 Jun 2019 13:38:36 +1000
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
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Dexuan Cui <decui@microsoft.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin,

I verified below patch against Ubuntu 18.04, didn't hit the kernel panic an=
y more, could you please let know how did you verify?

Thanks,
Lili
-----Original Message-----
From: Sachin Sant <sachinp@linux.vnet.ibm.com>=20
Sent: Monday, June 3, 2019 11:12 AM
To: Dexuan-Linux Cui <dexuan.linux@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>; linuxppc-dev@lists.ozlabs.org; l=
inux-next@vger.kernel.org; Dexuan Cui <decui@microsoft.com>; Lili Deng (Wic=
resoft North America Ltd) <v-lide@microsoft.com>
Subject: Re: [next-20190530] Boot failure on PowerPC



> On 31-May-2019, at 11:43 PM, Dexuan-Linux Cui <dexuan.linux@gmail.com> wr=
ote:
>=20
> On Fri, May 31, 2019 at 6:52 AM Michael Ellerman <mpe@ellerman.id.au> wro=
te:
>>>=20
>>> Machine boots till login prompt and then panics few seconds later.
>>>=20
>>> Last known next build was May 24th. Will attempt few builds till May=20
>>> 30 to narrow down this problem.
>>=20
>> My CI was fine with next-20190529 (9a15d2e3fd03e3).
>>=20
>> cheers
>=20
> Hi Sachin,
> It looks this patch may fix the issue:
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml.=
org%2Flkml%2F2019%2F5%2F30%2F1630&amp;data=3D02%7C01%7Cv-lide%40microsoft.c=
om%7C66e1ef6017aa461703f808d6e7d148cd%7C72f988bf86f141af91ab2d7cd011db47%7C=
1%7C1%7C636951283393233385&amp;sdata=3DIJFhtvL2Bd87HCoMZ7oWL%2Bar6NY%2FfPbm=
dCZMT%2BJz5t4%3D&amp;reserved=3D0 , but I'm not sure.

It does not help fix the kernel panic issue, but it fixes the get_swap_devi=
ce warning messages during the boot.

Thanks
-Sachin

