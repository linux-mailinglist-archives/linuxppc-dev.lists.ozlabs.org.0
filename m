Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C44404E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 23:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgwTN2365z3c4q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 08:26:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=sel1 header.b=cSxTV46o;
	dkim=pass (1024-bit key; unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=selector1 header.b=ck2M0ZnX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=selinc.com (client-ip=148.163.143.141;
 helo=mx0b-000e8d01.pphosted.com;
 envelope-from=prvs=9936515456=eugene_bordenkircher@selinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=sel1 header.b=cSxTV46o; 
 dkim=pass (1024-bit key;
 unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=selector1 header.b=ck2M0ZnX; 
 dkim-atps=neutral
X-Greylist: delayed 604 seconds by postgrey-1.36 at boromir;
 Sat, 30 Oct 2021 04:24:17 AEDT
Received: from mx0b-000e8d01.pphosted.com (mx0b-000e8d01.pphosted.com
 [148.163.143.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgq6T51R9z2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 04:24:16 +1100 (AEDT)
Received: from pps.filterd (m0136173.ppops.net [127.0.0.1])
 by mx0b-000e8d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TCb05h031144; 
 Fri, 29 Oct 2021 10:24:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=sel1;
 bh=9a1JWR52OWcn5hEXoWNQRblFuMaKYl4MQcqRQv6b6VQ=;
 b=cSxTV46o9oXouul53ZqU4RETkY8n8QIsvXJ2AeZ4uSdHhzBoCK1cdQCR372EjRpCTr/e
 t/MQHb3MysjI2ucLTERNR+oHZK41a+WRqDKMRHdsem9dE1j+GDuQ++uyCQW8f1AVBblI
 ljXIIbbWmZCmWDUIP4Me5pJr7/UbZ22CuL6ycS+uNVHCPC83F3T0YBiXi6TWvv0RZfk9
 EodHlpe3SB2vwvDnHYiO5K8HsEcMdmOQ8QsdVawCxxN88eUAfAPbBwixqMZqYuCPRV9T
 Bh1ZC2Mjs2GtSZsPWjQxDh+VwiPGHVGrbmrWQM8bmho2G/ihuu4NUs2tThWXhpaNzAbk Zw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=Eugene_Bordenkircher@selinc.com
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-000e8d01.pphosted.com with ESMTP id 3c0dxur964-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 10:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwS/hKKN1RPCa4Aqs6NNyhSGr0mFZVOnY36oft6JvpbxiBLuBJYzJE0SNdRMURW0ZzeZ0bSFFeYi29MTPWTbEpxD+nsNnwT0zHzrs1K9J+FDjviV78T2SpvZ5AV03EOGbu+hvfTR+odmVY5yUhoEI1lAW5i+hiWvVYjCD5A12gQXe34OdF6+1AvbkMUmCetLh0O0QpowXuWPkNvYUlZUKIXUwjCCaCDgcED81BigzvHdugKxanTdGpUKZ2R6rut3eILx49zWRvr7K/cj7Be+baZuCbjZ9EiSaTF1dkoaRKSi/fT5l1QBAC81Cy1SfQESD+Q9VNOPYP8YumYzhV85oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9a1JWR52OWcn5hEXoWNQRblFuMaKYl4MQcqRQv6b6VQ=;
 b=miWiIiklQjHPQ2sOFMYIVPz4cc/Zz5zPLHWcIle/CP4xMgctLryoZBdCC75q6uw3OLL19L/l6c2uA9KED3opmuWD+4z5dIYzZ1+9TE12/dxox3ul4whI0EdlTV6d/BxMebmRXf25vgveuDAVjFN3D6e/yUe3TRn3GPYqIH3ixoG52+5QT2PuuGYoWIpx6yOX1b938pobbpLCF9drpCR+sebq9VuGJJjYPbQPGtiqqs68CGfhIh5GJEzjYEEZhQkh3/jc0cgqGMsXwIv3DaoCnRmOvrqJL8KIMlTXa6qAG7MnXpJuyDDmr1SF9f6KySihqt9UxUpVLrT6hLwadK25+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=selinc.com; dmarc=pass action=none header.from=selinc.com;
 dkim=pass header.d=selinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a1JWR52OWcn5hEXoWNQRblFuMaKYl4MQcqRQv6b6VQ=;
 b=ck2M0ZnXAKizD7DcLAzWMQARd6hZgSd52JtsEW2AVuAmViJMJ17fPUzNLIpnHfMG0/9zVivFjmlvK2iEWF6udbY9j3wvO3XIuTHYyaRnugnsKaFXKZe9ahbnoaV83+SiVDVx17wHDxb0dTPdFoASu5amvAUPSkdkrIhpDTGnUHw=
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 (2603:10b6:301:34::25) by MWHPR2201MB1070.namprd22.prod.outlook.com
 (2603:10b6:301:2c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 29 Oct
 2021 17:24:08 +0000
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bdb4:45a6:34cf:fb27]) by MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bdb4:45a6:34cf:fb27%7]) with mapi id 15.20.4628.018; Fri, 29 Oct 2021
 17:24:08 +0000
From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggABIYPQ
Date: Fri, 29 Oct 2021 17:24:08 +0000
Message-ID: <MWHPR2201MB1520D45396628364E91A1FA691879@MWHPR2201MB1520.namprd22.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=selinc.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05d53f6b-10e9-4131-0e57-08d99b00ea84
x-ms-traffictypediagnostic: MWHPR2201MB1070:
x-microsoft-antispam-prvs: <MWHPR2201MB107050B5CFDB51A89A6AEFC291879@MWHPR2201MB1070.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5HqW/+Ccc+mE23dhi5VJoYHVbblTHgRiyFDeG7x9ch9l7+kTgS6iQBk4Iq19sTf2uoKQ/CB1iHsjX1kuJiN4cWjmfPfiU32YhSFdqjn/TMYW9oo3bOcAXP0WjiLgaT0hK7UIdASKvaBVX2Q6nxeqXzuq56B2eteRXviuAcwP9XYGyMnOCnTp/dslxcPDXndReMwde6niWhbTL4ccHmEjhLCEXq8+7VzbJvP1gbRI82wyGsE56y+TRtovDTxwlak2HQNSh1BFWqm66TfjbJKRHzFg39GyRT2t77/nHlr+eXOH3a5EvQiF1usAFX8w+vKEebTdtCibmi/SfvpbDfVSVi541hJZyXdy3nmNWmiZ14/Jl3LexJNUF4yZZoL2QP1lfNfORU4byqO8VGc1wAnweQWO76nsXIWv/5hKNHutVbgNIHaLoc7X4RJdgEi9hYifsrErp7UDg3M0Hku8MvmDp6739I5lJ0W/FgwTvAPeMpsjG1GWaV3HBEt7T3eoW/XoIEIGoHpFw+60xiIQMg6mBxSfYrNPfXjavrqnuzSBrUWCiS2uW7dPnlxB84zguFvUX0r3xB5dpFiLV5zo1rxHdHaYJOaEghHaAcO4uZUh6/ZuFMK0BZCclpmbjfOUFwmMr6iUgYbku+LZkc1rASuP66uqvPPIQs5u48yNGCuzVUsVntgMv96tZ8REhx0XtxhmbRlnkwJj22uxkSnQx324qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2201MB1520.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8936002)(66476007)(33656002)(2940100002)(55016002)(86362001)(83380400001)(71200400001)(110136005)(4326008)(186003)(5660300002)(508600001)(66556008)(76116006)(26005)(316002)(9686003)(66946007)(52536014)(64756008)(38100700002)(8676002)(66446008)(53546011)(7696005)(54906003)(6506007)(122000001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ru4xvOAAS4F60BGYgVV8RgsNMjrw1NdGthfcWuPSVyLxplG1oIq0swRsuZUm?=
 =?us-ascii?Q?4sZAtfm84P/bn00nMzIqCET82Fn6LHbVr7KyJOIE7jagCsyVISB3T2qKjZ8Q?=
 =?us-ascii?Q?rKOivBXw40Cb/D2oJD37qOsmtzgk1rBuCaBvuurQLYmC9cLl0nQCA5id9Gt7?=
 =?us-ascii?Q?4QxPrrRBEwLiBe93/naGaynuyrG8aI0K/qzAT0+/j8rihjYe5jOQOG5QtDw2?=
 =?us-ascii?Q?Rw3AtMFINNcHbA0/maVTuSJnjtPJh3v6kxAlepsneqK0kAoNnqGmeFf/Xqqq?=
 =?us-ascii?Q?RQsQ/Kd9VoI1HVWqZViuh+N2b89aj9J5yYNlvOSAIKjh/IXOSETC0VhqDEGP?=
 =?us-ascii?Q?iAQ5CDK7KCGrIn8SGkrV9RXdZn8nTMWbDJaNW97aM5HhLzrg3M90Bav96K6L?=
 =?us-ascii?Q?cypPue+3+iPj0S3lyH5dpOBMIderJL6a/g4C3UNNLG2cypdSi9hmrCeKPbJI?=
 =?us-ascii?Q?SRCXE7XOfupeMgiyzJiwQkwdiLhVnsDyu1kawFVBRb4xbH89zzQK8L1CJrVI?=
 =?us-ascii?Q?Z8cAZmI3BCA2PFttC7F96/wiFCu/W0ZNcq9Y6zqhEiWJEdPU/Fpy9eBa5mav?=
 =?us-ascii?Q?9E6qP7LxCdiMue+hd/t7XzvayBXHG3ozXLDMrF+EjxKrd4K6Wlq2L+8QWDbO?=
 =?us-ascii?Q?uqlfCcqG75U8pAvvcsfWbj+4vM/DUCcwp9HR6aVKV5OZVbkqGbrf7RQSvGKG?=
 =?us-ascii?Q?YYDlwhiYI2GZ/hUEC6wlN2j/82BkovqUMgR7zKH9Hz/loNHvzUd78KeeI2qh?=
 =?us-ascii?Q?rPln/nzXQir1LnqQa15dCKILcXzixgnpTzVMq6St4rfnI1qCUW/liRjQC8q4?=
 =?us-ascii?Q?INQsA0iAMA/ccgqe3itcEXPYwHkuZu1WmDkopUeTxCkGgujSacOsUzRB5+NW?=
 =?us-ascii?Q?wLkQI89bLpaWbK+x85dEkDW4QOxZ6RvqpHhbUR/t+XptANrPXZjWCjQ6m8IT?=
 =?us-ascii?Q?ARrxgS5G8m91uZc8ZVmwwf7N4wlVn8W3hEVpwYm39z1N1A9LoSgbhSyI+EMK?=
 =?us-ascii?Q?+QIUZWI2uMiF9Tg60ypGoF2g8Twul2KkUgC6L0pBai920JFWdQZQ0usHEL2K?=
 =?us-ascii?Q?IJgNEmyvU7JSNhuw+sdjGLwwvKCah8RMv9opCbGx++rxRQZXawhR70wBK6Zf?=
 =?us-ascii?Q?3sS8hRJYXYrlivDg8GdrGSpQgei3jSv+Ts00GOCsjMcc8Ek7ZQ2F29q1H7lu?=
 =?us-ascii?Q?E8mWtCbAQmzDMQaYlA2qk8LHOXbVzTXVjmlzXizf2Y5EiiNTq9llzNRnIkgv?=
 =?us-ascii?Q?JOw3ALLZFT/Sqh6nJTvyPaEfbG5N2RnmSftiGPMuJ+XU/IZPYr5esvE9T+EP?=
 =?us-ascii?Q?q6xGWYjDkV1Coz/DkM+B4ssUCVXVWPOMpoq0KagZSaHgKMSD7vO/GGYCdAe+?=
 =?us-ascii?Q?stZdIf/tD4AMZEn0FsQN7jTWCCUNSvUQdEHxPUrifaqzEiDU0kqnD50Q6b1j?=
 =?us-ascii?Q?fQ1k44KkSKso5lvT+oY0FRYyULyuJv84K0OTvJK2HcD5j0p7R4E/w8EenSA+?=
 =?us-ascii?Q?4zyE5pA6yFpEsm6DiVrKGXZGD8qD1R7rRB3e8z+GoV5H4kLihuTOnVyap4i2?=
 =?us-ascii?Q?aCTmQHbOFAf71rj398HyCHNWEmpc4FtCHDQ2mzH09stqk+O6x9/3kvlPJwL8?=
 =?us-ascii?Q?Pq/KbOA1Z4SF1zjjTl9hDheO7Ir6YDt5fbKF0eLZ8X/LxA6DKU+KZvEFlkw2?=
 =?us-ascii?Q?unQ7Pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2201MB1520.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d53f6b-10e9-4131-0e57-08d99b00ea84
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:24:08.3185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XXnkPfiNWHl4zMj0Yyii/ae2h6bqLs52hrSYrz7eFZ/DkFlzJr1N/KuCg3mNHflZKJHZpflw+0PxI1qK72WsI+WCxc9l/Zawq6h8ShzNAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1070
X-Proofpoint-ORIG-GUID: Wc1HYvpaZrJ0LgoE1nppN2O6xFWoTW3Y
X-Proofpoint-GUID: Wc1HYvpaZrJ0LgoE1nppN2O6xFWoTW3Y
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290096
X-Mailman-Approved-At: Sat, 30 Oct 2021 08:24:41 +1100
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Typing Greg's email correct this time.  My apologies.

Eugene=20

-----Original Message-----
From: Eugene Bordenkircher=20
Sent: Friday, October 29, 2021 10:14 AM
To: linux-usb@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
Cc: leoyang.li@nxp.com; balbi@kernel.org; gregkh@linuxfoundataion.org
Subject: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to unr=
ecoverable loop.

Hello all,

We've discovered a situation where the FSL udc driver (drivers/usb/gadget/u=
dc/fsl_udc_core.c) will enter a loop iterating over the request queue, but =
the queue has been corrupted at some point so it loops infinitely.  I belie=
ve we have narrowed into the offending code, but we are in need of assistan=
ce trying to find an appropriate fix for the problem.  The identified code =
appears to be in all versions of the Linux kernel the driver exists in.

The problem appears to be when handling a USB_REQ_GET_STATUS request.  The =
driver gets this request and then calls the ch9getstatus() function.  In th=
is function, it starts a request by "borrowing" the per device status_req, =
filling it in, and then queuing it with a call to list_add_tail() to add th=
e request to the endpoint queue.  Right before it exits the function howeve=
r, it's calling ep0_prime_status(), which is filling out that same status_r=
eq structure and then queuing it with another call to list_add_tail() to ad=
d the request to the endpoint queue.  This adds two instances of the exact =
same LIST_HEAD to the endpoint queue, which breaks the list since the prev =
and next pointers end up pointing to the wrong things.  This ends up causin=
g a hard loop the next time nuke() gets called, which happens on the next s=
etup IRQ.

I'm not sure what the appropriate fix to this problem is, mostly due to my =
lack of expertise in USB and this driver stack.  The code has been this way=
 in the kernel for a very long time, which suggests that it has been workin=
g, unless USB_REQ_GET_STATUS requests are never made.  This further suggest=
s that there is something else going on that I don't understand.  Deleting =
the call to ep0_prime_status() and the following ep0stall() call appears, o=
n the surface, to get the device working again, but may have side effects t=
hat I'm not seeing.

I'm hopeful someone in the community can help provide some information on w=
hat I may be missing or help come up with a solution to the problem.  A big=
 thank you to anyone who would like to help out.

Eugene
