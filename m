Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5395BD3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 15:44:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cpWX2z0pzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 23:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=teo-en-ming-corp.com
 (client-ip=40.107.132.55; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ceo@teo-en-ming-corp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=teo-en-ming-corp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=teoenmingcorp.onmicrosoft.com
 header.i=@teoenmingcorp.onmicrosoft.com header.b="hLGn5b+w"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320055.outbound.protection.outlook.com [40.107.132.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cpQR3K1HzDq67
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 23:39:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96O5MXNkh4e/qcijD4c6DJjt+tR9hQRZiGJBSeoSjto=;
 b=hLGn5b+whvT1gcH1+ZIjz3VPQmwoo0TnEyibQvUMM2WXGovHMTmhxK2YTrOks3e8ghp/cbesZ0/+SwW9C4n+DS3i5ZOZLTFckAxyU9klswf9h5pjPZEzepjLpFAhpbucd1JjIXoIa0S6Z1yYLqWGOnmTfAtwjGERt/sKuKUncBU=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2758.apcprd01.prod.exchangelabs.com (20.177.169.76) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 13:39:53 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 13:39:53 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Can I compile Linux Kernel 5.2-rc7 for PowerPC on Intel/AMD x86
 hardware?
Thread-Topic: Can I compile Linux Kernel 5.2-rc7 for PowerPC on Intel/AMD x86
 hardware?
Thread-Index: AdUwEWXcSp8oXCNpSyC6tLAQx0KDlw==
Date: Mon, 1 Jul 2019 13:39:52 +0000
Message-ID: <SG2PR01MB2141EE2AEA0C727527DAC4B087F90@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7806ff5-866e-468b-77b7-08d6fe2998d9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SG2PR01MB2758; 
x-ms-traffictypediagnostic: SG2PR01MB2758:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <SG2PR01MB27588AD691C6C0FAE5961EC387F90@SG2PR01MB2758.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(39830400003)(346002)(136003)(189003)(199004)(966005)(53936002)(76116006)(14454004)(73956011)(66946007)(186003)(256004)(81166006)(68736007)(7696005)(8676002)(26005)(486006)(476003)(25786009)(55016002)(64756008)(66066001)(6436002)(66556008)(2906002)(81156014)(66446008)(6506007)(6306002)(66476007)(4326008)(9686003)(5640700003)(508600001)(71200400001)(99286004)(86362001)(74316002)(33656002)(2351001)(7736002)(305945005)(52536014)(3846002)(6116002)(4744005)(2501003)(5660300002)(107886003)(316002)(6916009)(102836004)(8936002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB2758;
 H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KS5npNGPiKySEiWfh8WX3e2MeE14J5cB4jS3wIdfRmqACMbrI/seAx3K9HvzBN7wHeWPB8v0bVof1GWZmPu+kArInOsR5BWzlnESdGk6dIcZ3zmfwLi6fpeiVGWtkJWuRTiZUCm3c6ibrJQuypZ8uycclMs13M1uYjIMTHx78APlSz9smw9CzYM8Wjr3kCTsuJidL8Tx1UoJMgXp5u5BjnJ9YXYVGkfv4/Z3dobQU7pM2K2M+YhhkM2JHqGjEiuvN/9vXNU/lZQKOgTFnpqyaASBu3em0QVw8fv22PlMCD9VcSCx8dxFUf5rR2PJnk56yAPnyTF8X8NNBeuy6RHNiQ7Lk/UzZRJ2Pho7B3tG2P+l7WgzHJeE2KlCBC/RHORIZ2K4ppSm/ZFySRfCzgcs3mMQSFvi/IJoyfmMsIsRG4k=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7806ff5-866e-468b-77b7-08d6fe2998d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 13:39:52.9098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2758
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
Cc: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Good evening from Singapore,

Can I compile Linux Kernel 5.2-rc7 for PowerPC on Intel/AMD x86 hardware, f=
or example, AMD Ryzen 9 3950X, with 16 CPU cores and 32 threads?

Is it called cross-compiling?

Thank you.

-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwav=
e.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

