Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7032933
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:16:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRFD2tgkzDqQy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:16:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.131.122; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=v-lide@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="WZKU8doD"; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310122.outbound.protection.outlook.com [40.107.131.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRCc1QXpzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:15:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=N8s0CaSF7ax+RuQ37BjMX8mRkdoaiX/SR7f2yRqsh/BLH2Dm8nEpUBdbN7o6eZaQM/6J/pfTrd0QEEb/xJWdJGOUTojDK4rtZ5dxuUss1Mkamxo8YsEZSIUt1hGad788xmEw2YTucVMQKQDKgulPibU1L9vfF6wT7ZnjUGiI3wg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CA6rYCEr9x5blaWaXK8yuaYeYYlTQpmEFoxPCLOsPI=;
 b=DBXoWi38Tm7lASfWrlB5iB+KIf7zUMkRE/0lt/fzpU0BYa6BGRxQcUG2RElLTkGz4TmZfyXHlM6Oic34rlWegAgNjWHAca/dlkRT37PPbFtkXigsWlHuEn49ekvfgOw1wjxTPqBrQ+5FtRwZ0qyMVT1Mjjr8yJzTbRTvNiZRUN8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CA6rYCEr9x5blaWaXK8yuaYeYYlTQpmEFoxPCLOsPI=;
 b=WZKU8doD3IjQUgv8wyJAPspZ9XkXuw26K4+U2O+XPoctsd3kIdSXbeOin0W545K7KJqf3cNNB4Ih2jY5bKaGM6SLFOKmdsCEk3hthqD5kNaqKyVK9/sGf7FwMx/Puk5vKmVrV/a3bss6BCPmUqf92q74An3QmXHBZOPhAz575hw=
Received: from KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM (52.132.240.147) by
 KL1P15301MB0262.APCP153.PROD.OUTLOOK.COM (52.132.240.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.3; Mon, 3 Jun 2019 07:15:17 +0000
Received: from KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM
 ([fe80::94b3:929c:cb30:a005]) by KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM
 ([fe80::94b3:929c:cb30:a005%9]) with mapi id 15.20.1987.003; Mon, 3 Jun 2019
 07:15:17 +0000
From: "Lili Deng (Wicresoft North America Ltd)" <v-lide@microsoft.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, Dexuan-Linux Cui
 <dexuan.linux@gmail.com>
Subject: RE: [next-20190530] Boot failure on PowerPC
Thread-Topic: [next-20190530] Boot failure on PowerPC
Thread-Index: AQHVF9yX3BwniFeSJ0iqHPvcE2BsqqaJRHIAgAAC7PCAADugsA==
Date: Mon, 3 Jun 2019 07:15:17 +0000
Message-ID: <KL1P15301MB029432D948C04440E7250F759E140@KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM>
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
 <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
 <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
 <KL1P15301MB02948DA3C780A2DC4A145E0F9E140@KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <KL1P15301MB02948DA3C780A2DC4A145E0F9E140@KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=v-lide@microsoft.com; 
x-originating-ip: [2404:f801:8050:3:c0::35f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0903708-a713-40cd-1727-08d6e7f33b57
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:KL1P15301MB0262; 
x-ms-traffictypediagnostic: KL1P15301MB0262:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <KL1P15301MB026242BD7AE136D93DE884E29E140@KL1P15301MB0262.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(199004)(189003)(13464003)(14444005)(256004)(478600001)(10290500003)(8990500004)(2940100002)(316002)(14454004)(11346002)(81166006)(81156014)(8676002)(486006)(5660300002)(446003)(8936002)(22452003)(476003)(10090500001)(305945005)(74316002)(52536014)(46003)(7736002)(966005)(229853002)(4326008)(86362001)(53936002)(76176011)(7696005)(6436002)(9686003)(6116002)(99286004)(6306002)(55016002)(33656002)(107886003)(2906002)(64756008)(66446008)(66556008)(66476007)(6246003)(73956011)(66946007)(76116006)(53546011)(6506007)(186003)(110136005)(102836004)(71190400001)(71200400001)(25786009)(54906003)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:KL1P15301MB0262;
 H:KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aixrWrbs8h7B1ylxhqJRyXV0Dg4qCuKyfC0YCpjdlwHDeYc6/8nTgDyidzOx//mimV7E0jD/Zip00hPS9rbAUjwfOt4oyHwchuktNopCtkDbJPFzWAoGm8392OU0bXE13qrjKuClBy3mCIr2UoCjpFwpek+4ygSw2g0XdssRNRae3zsc4DEEFAjdgA9h/2DthJd4DiLUHCDtXfiGNzgX0uD+1CJMY/pUm9C67KMW5GXCGIqF0Cj8vR7sMmMhjqjLkCp3ylTwxElgkUmDVZYv2AMX8NuMoAH6Ghgwy4CRYunGG5LTbLPbTCIgPONF1rRN4PFjU90Yp0Rue+6P2zFho13dK9B94ia8E0ibJ0cz88ZrVBR+m8sZKUggDtcG6SQDzczOMRw2ij9DC7TyKgc/ORO6xbjT5LwIJO61MGjM4C0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0903708-a713-40cd-1727-08d6e7f33b57
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 07:15:17.3758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v-lide@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0262
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

ACK for ' but it fixes the get_swap_device warning messages during the boot=
.'
Double check for kernel panic issue, without this patch, it seems not repro=
 in my local manual environment, so please ignore my previous mail for 'the=
 patch fixes the kernel panic'.
Sorry for the confusion.=20

-----Original Message-----
From: Lili Deng (Wicresoft North America Ltd)=20
Sent: Monday, June 3, 2019 11:24 AM
To: Sachin Sant <sachinp@linux.vnet.ibm.com>; Dexuan-Linux Cui <dexuan.linu=
x@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>; linuxppc-dev@lists.ozlabs.org; l=
inux-next@vger.kernel.org; Dexuan Cui <decui@microsoft.com>
Subject: RE: [next-20190530] Boot failure on PowerPC

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

