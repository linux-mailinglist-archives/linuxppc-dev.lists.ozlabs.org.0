Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8FAA2CE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 04:38:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KNv43xrtzF0VF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 12:38:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=teo-en-ming-corp.com
 (client-ip=40.107.131.59; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ceo@teo-en-ming-corp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=teo-en-ming-corp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=teoenmingcorp.onmicrosoft.com
 header.i=@teoenmingcorp.onmicrosoft.com header.b="m6F4EfpH"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310059.outbound.protection.outlook.com [40.107.131.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KNsG3rSvzDrQD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 12:36:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi93TOp3ZGr/M4QW8oB0KUFor1cgnUNzojwY7t/ccZXwtBjSzxBWsLCLaxeItZJosS50DtNm4GrspVq6h+P+VUK93bhx18UijOGRwYwKcQdC0bD1TaLX7F+PKeyw4hl050wFBDd1PjDzYSxaKxmP1/3KXH2xsTq8X+H3SIfYj9DOMeD3ZAl3tX+EIbZaGrxuUlRt6btGDOQkQNAX5bOg/slJJx9MSd9uH0N7ZL/VxgZbNGNSiYx6Udc62nP7VwsbxVOvi2mX0ze/fYC0c9J4F7HKqWsGa7Qt12nj9SNA85Ps/rUXjxYLNVG67AqJHAT7ENtARTbEZA0aiEtyhQQdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4isZp/PzGBjqlMvBYOKyg33r5kkCtHtvwX4lv1gu04=;
 b=hPUSMp5sNMOBeCGmG4cjn/rA7FPHarlQBo08UXcnKD2do8YVyOyShm3rDANs2dEzWwpohMnm4wEw8nyGYBIRjSqrL0Bi7qWC/FBbgi+Djm2ZRLB558q4OR9NEDp2Gxqxe/Ahe+LioeC6yL1SYLq+9oV+KxwD1DqiVbLfQUvxPAhM2CGTpR5d5HcpUan5bwX0tzMNEOYdGc3HCWWc73FqcJ53ZmeOBQlrYdIP6EYf7yoqMt2ftInZXbTcL0ePBpRoe0FO7TO7Mbjnk8bKJ31BX68AmJAifQe0Mw4BXyef2mqpWqXIWogtne0d47+qinFfd2o+kWgxN7HBE9d4EBX/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4isZp/PzGBjqlMvBYOKyg33r5kkCtHtvwX4lv1gu04=;
 b=m6F4EfpHN/VnmlIUl/iRVSTAnIw5+FwGbwu5OymnWBe6aNDy6rdjLtRQWnBu2+Enb9gzHjjtbCmeYe+9L1c98nVy7oaIShJj1D9JE+YcezC/rqsg04kBDRVmbsb0yXziBsOQCVdsK0bipeEirBzY+RHA/3N+OBIO8zgGpgY3CeA=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2950.apcprd01.prod.exchangelabs.com (20.177.92.77) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 02:36:25 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::508e:ee77:4ba7:9278]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::508e:ee77:4ba7:9278%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 02:36:25 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts
Thread-Topic: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts
Thread-Index: AdVe27EI4HDS/fvBSqq0rzmnfuNNDA==
Date: Fri, 30 Aug 2019 02:36:25 +0000
Message-ID: <SG2PR01MB2141ED061F3694EC08EE95B187BD0@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b62ebbc3-6533-458e-54de-08d72cf2da78
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SG2PR01MB2950; 
x-ms-traffictypediagnostic: SG2PR01MB2950:
x-ms-exchange-purlcount: 7
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB295098B254E798337D68B59587BD0@SG2PR01MB2950.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39830400003)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(7696005)(6916009)(508600001)(2501003)(25786009)(486006)(81156014)(66556008)(26005)(186003)(66446008)(8936002)(76116006)(33656002)(476003)(66476007)(8676002)(3846002)(66946007)(6116002)(64756008)(14444005)(81166006)(66066001)(256004)(316002)(107886003)(55016002)(86362001)(5640700003)(102836004)(71200400001)(53936002)(2906002)(71190400001)(6506007)(74316002)(9686003)(7736002)(6306002)(14454004)(4326008)(966005)(305945005)(52536014)(6436002)(2351001)(5660300002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB2950;
 H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cjSLXgEf5xubLIqrcD6pY8JgRyHZHLvhdq4I7bMYqW/L8GVcQdwThHTM7bgcJkmAwfTxp8W86xhWOvBIwBaLbHpD1xWVgiSinc8nIiPo6WN84WWD6AnBY4kZLKJRYnffVyiFhGgT8kALMmTJN/xTFA8aD6vKrIw5E/aDdmFHOCT04CPqHQAG89fVrZ+Cul83JGsEIf9dF2BCH1UwR1XBuXjRTI2h+/JhEZdTwypgCF6DWhbJj10gXjcV8NVPHNEVdrNL5xzbbX5fpeO0eliddm3b7tv0pKi/iLDDLSCw9T1F4Hibc446PANiNhw7vx1pQ3rvheqkfrzlPrikoVGmt5yxCVVZdcrKEyBM9KNc9PZ/19Hj/l540GWMDi7TS+NJsgS1+z2xdEqLRooWSAn4vmPy8c9V8xRHHCfj4Qvcto8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62ebbc3-6533-458e-54de-08d72cf2da78
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 02:36:25.3512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGWsoK/k4ff0zGtLWNAbB0oSBpbsC9kVYmbCB5Twwbr+XjMbFUY3WPRa2hZa1UP6dbUIFAAoRayeagh961oxMJt+IheZdLdchAbFOOnoeQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2950
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

Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts

In reverse chronological order:

[1] Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday

Photo #1: At the building of the National Immigration Agency, Ministry of t=
he Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket at the National Immigration Agency, Ministry of the =
Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration Agen=
cy, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt for the submission of document=
s/petition from the National Immigration Agency, Ministry of the Interior, =
Taipei, Taiwan, 5th August 2019

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday (Blogspot)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday (Wordpress)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/

[2] Application for Refugee Status at the United Nations Refugee Agency, Ba=
ngkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at UNHCR Ban=
gkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017





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

