Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511C45176F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 23:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtP0R15RRz2yQC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 09:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=GnFn9DKi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.83; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=GnFn9DKi; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtNzc2jmcz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 09:24:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S41ojzLxU+sbdbWkCL2p8oAcERkOxbrfp2DZkweAdZgrdGKEnnj+6S6+U7IIzDo4nJzErBMc54kIieRbVW+DDfnLiFQ4AUJKHQRlOdV5QTF87n67PTi1/6CLFYcrN74VpMgqNGgGkrGKcYRqXMrnj4FQuz8PgAmf5ogYnzKc58Ng1Sj1fiJFYwg5NFxD7+2IOVz4bttE3GMMGSCxh5sjHGVPGKh94BZyAeveoZWeYJ+9kzLILFgsk/7Q4GOTWzmYMlxMDYSFEp9BaUMwNK1Tlr2bfR8KSZmVwqdoiQEg49Wi5daYQ6Fmy7HmFdkTr5b63OvjJGKblpyJBnc9PLrPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/a23Ae0rg2eyAME5aSrgCK4FJUUbm+38YdU90zuCQnw=;
 b=iF1XvPLNHncAKt8nypuvU9rrMjJ8iNh4u4wlabGQNfKQOPidYvA4eGBe9KaB/0zAfcB0b2UMLU0Jyh9xyRJmt2RAW4md4Z7qmPCZ+aqZV+7HkJ7vrtfaaZFAJZ2dlvJU4VTm01rCxv2tvSlTLln23CzZSxpQJEvGzlThrjb4j3ns8AWSyV6LOiZ0O2s6XhRZ+TxiCq/KV88mjclUL5furoOCrUzLOcpognf/ZSp3gFmbdSv8Mo5j/LOidvXaYJleNxIXp6RmVn70Rvddids99WPtWwGDJW0toE1yZEBNTY0rVJMEgidHNseZMIYI2OjUU501+5NUzowuUrekkngJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a23Ae0rg2eyAME5aSrgCK4FJUUbm+38YdU90zuCQnw=;
 b=GnFn9DKiXZOfsp4ap+tXh+107nwVwS6oKoL5J3AfKwIjJXRMcEN2Q4Wo/zQ8Pyrdcf8jhvKLbeWbOKq/etS1z8k3VAXLw3hVNWP85DRnjwUQT7/Bv53cn9Je3xswIobencoAz/9cPeKAwR3sIpg/qy14XxPITFCMZ6oqp2sk6MY=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 22:24:36 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 22:24:36 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
Thread-Topic: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
Thread-Index: AQHX1iIbcPueVtt/aUW4L8kSf69QdKwEfA2AgACzPEA=
Date: Mon, 15 Nov 2021 22:24:36 +0000
Message-ID: <AS8PR04MB8946B4800AE34258F7F2BA688F989@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
 <20211110105952.62013-3-andriy.shevchenko@linux.intel.com>
 <YZJExzxJ4j8g6jEY@smile.fi.intel.com>
In-Reply-To: <YZJExzxJ4j8g6jEY@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42868ce8-1ad7-4ce1-322e-08d9a886b50e
x-ms-traffictypediagnostic: AS8PR04MB8849:
x-microsoft-antispam-prvs: <AS8PR04MB8849CFE337A672E8EBC531D78F989@AS8PR04MB8849.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:356;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p7O6FqZ/hasRBzT4khmzZBaK3E3tOHBpbL77ywqq8Gt+shMSfWl5IN2D9HHEUpJw6eWzH2YrvLhz4zChmlyTMQ+Ev5gFfbs0F0mL8Ta1YKDphMT4UmzxWmpuJYYuAzL6yUTOpMoADX3rvQz3sfqn4vKW4rl6u/KE13l/YXkpCysROwbNR7VoLlGHHCyd4bTdfxSnf/zxSSi7hgpiFounXq9AOTpBygUMx5WDHUVmfcrDnER56TVvRchMPl/LWiuEQK6aB6X1oG2zu5MID+APO3RcsQBlERwhO+iLvUyykxccu5pZ5d62QQf8EFGQ5/q2dsQASn2mmYbdgcXnMiupCgkVkPxwkPkGvj0xphuIIX74WQLeoyuW6XTy4IX8tR8AzO2UtJAZJuOCJIF9M/JYXmh2Xot2Y4CITaWGcyvBp4AbD/5EfOo+xazARfE/r/0u809TWrK7mQI+uA0AH6z5QZhLznjNCeojhFvdMcC4cycc4TP2Osiz02btpnzQyYA1lHqv+SZGLXZueRfMkrOLk8HPX9x6VNerXwYhJCIN/YO26w9yHDn5CYd2gbxoG0f5k1eeQcc0z7WTY1RTBLE7ypqckLgGGqdc6BXWmRT3hVOd+382td/VORwkoHbrkg6nyHNRmTu1o5QjXsjbMK2AUZT5XlwtJeF1IBZC+0DvO/BgKrnegNzTb5EzXJIsHE+6sAw1+uf383AMko2dY5HiqBuQh4Jjqq7tSpZQrRuGKWChIgv9XBbhabOQ661rDODx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(508600001)(122000001)(38070700005)(52536014)(6506007)(8676002)(38100700002)(5660300002)(8936002)(86362001)(2906002)(33656002)(76116006)(7696005)(110136005)(316002)(186003)(66556008)(64756008)(66946007)(66476007)(26005)(53546011)(9686003)(66446008)(4326008)(83380400001)(55016002)(341764005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2C2NQwv4l9IjQMZX87nMAj06jcxGjoX7wlRBfxejNj+quwZxVYUEqFVF/BUf?=
 =?us-ascii?Q?jAKRtRAvVX8V5TA4BP0lbfTp8HAxJhRgGiide+dmBjbi1Q/mJfI9PzrIVXUg?=
 =?us-ascii?Q?i1/ffSha2HTR95U9/0oiOMcVGWhtvf43dMI54A3Z0bxRhv2i6Vi/uI3xS4R4?=
 =?us-ascii?Q?H5iqQkfxP7Yej1zl4+wUGnrCmnGbt4DT8uRL/HCk55709+WYyGaBPFNYbv8b?=
 =?us-ascii?Q?ErL60PBDg+vadnewDizD20D1Tse+YWk6I+Mmow58wU67NIUPDlm3jPt2sIsP?=
 =?us-ascii?Q?R+rxgobpCnVWgyZR9wVBLRwSN9r1G7SUJSd2zH2GRzhgpBNnfpPOnNKKMOta?=
 =?us-ascii?Q?eUTE40JSFdR6/P+Ift1ikqWD+3XWMNVWrfjmnvOQQNSUE3LWtxz2SDp9K8QX?=
 =?us-ascii?Q?BARFd87lWPLEtOAH7sUvkWZf7oo0Gc+ZCuyL1CPGW7qQ/wlYJ6dDbDGQ2/1q?=
 =?us-ascii?Q?MbxkGreMILlFqDvcWI4dp1Ghm6gcGZEGX0kZirvyGmOvR/00YMiol0O9fahd?=
 =?us-ascii?Q?FD7wOOHEvZzICb4SF9z3kQg7Yxmtv8u6TD5AWXiTfHbvpgCH5+CTgqkJGm22?=
 =?us-ascii?Q?YoRLhzXvC8+KfLzsA+RuXRaghzMbfaM3WrqVn8wWKtzvkIlhbwrwNhDF5FHB?=
 =?us-ascii?Q?NTTEMVBH5t4nAmMji4yIhb9sPul+Iw4esqukFOzXsBoQzkc35ngPmN5BT3at?=
 =?us-ascii?Q?S3hX/pa99aHv+pKHZCSLX5q7BiekC8Jc8j1jP6DiFsEfAmc4rN0XUr0CQ05r?=
 =?us-ascii?Q?boIfTJTfFkXIqlolDmI32E6XbdPYtD2COuyTauH91X96CsZHUxjg/2v8dCp/?=
 =?us-ascii?Q?NwFJ4OTxdJGccG6ftSIhh+60u198PGT4SLyYdFfhzAzrtXBCRfu1rFlUgwhi?=
 =?us-ascii?Q?ajBwhVZ5M+YQqNFGzo5Qlk2vQFiluoAkimM5Js7ptz46uDk47aLHOc8rIHge?=
 =?us-ascii?Q?B4LbB86C+PFc9Z3fGLAIR9fwi2uFd0tkkK0zUS2Qpk3t7AxRKVS01BSd1CEj?=
 =?us-ascii?Q?79wwdA5IoRBtT7EheGLkfAhlEya7WnvMVJFthMPlBV0qq3ppUa73F3hLrhN9?=
 =?us-ascii?Q?+fXdTvvX/TAyu4gI0ERJXlPGjS3UxVxJQxWDAvOwhhtzju72kUnYPMD5aQX4?=
 =?us-ascii?Q?29VV2Li94nG680rWuxVuto3XJ4viTcGntxBeq0ATJiNzUkZKpeZLwp04PBzI?=
 =?us-ascii?Q?ygIrKMy2U7T1d4kbdQq64g2DaM30j3cgjJ3zAcjdKR+0ywPRdqb+DpmQ5AAT?=
 =?us-ascii?Q?IX14JKhsZwgQKZbYPi7iSKC6VBHxfWp3IhzJizPjSq8YeWcFBIDgAdM4L/7P?=
 =?us-ascii?Q?WaxY6La7eKjCWiiCT+lRI6ROFK8LK79tvh2jtlLSnhiV8ipERORUCRdi354E?=
 =?us-ascii?Q?6E570Lj/iHjSA+VfURwnScqQe2x3LyGEwVVqBv+rb5rRATzZWfff6QRiQtJc?=
 =?us-ascii?Q?qy/f1lKhYM/wApkeaYZmqSoFwP9lXtmNBU0FPKEDZQPL2idD9dwFbLG2hSUA?=
 =?us-ascii?Q?4ne/kQbhEtgmkFdaIQPUk0CdWSHkTf/rRRU/NU9276U5yH2wNR6HNoH5CPy5?=
 =?us-ascii?Q?gQl2nV9KaB4r+64nbZuhqg2pTsjqNrdIPYrrndil9Z+C9mo+R1GLrLqop1XJ?=
 =?us-ascii?Q?vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42868ce8-1ad7-4ce1-322e-08d9a886b50e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 22:24:36.4743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riONMCzcU0/vJlBCvAsJPacf99LYHi0CKFDULCC/14R1EpMwPTCrvFuzKL/8nvLd3c/t+CSrXfMfZQgV8ea8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849
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
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, November 15, 2021 5:30 AM
> To: linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-ar=
m-
> kernel@lists.infradead.org
> Cc: Leo Li <leoyang.li@nxp.com>; Qiang Zhao <qiang.zhao@nxp.com>
> Subject: Re: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
> inclusions
>=20
> On Wed, Nov 10, 2021 at 12:59:52PM +0200, Andy Shevchenko wrote:
> > When kernel.h is used in the headers it adds a lot into dependency
> > hell, especially when there are circular dependencies are involved.
> >
> > Replace kernel.h inclusion with the list of what is really being used.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: updated Cc list based on previous changes to MAINTAINERS
>=20
> Any comments on this, please?
>=20
> I really want to decrease amount of kernel.h usage in the common headers.
> So others won't copy'n'paste bad example.

There seems to be no problem with the patch although I didn't get time to r=
eally compile with it applied.

Will pick them up later after build test.

Regards,
Leo
