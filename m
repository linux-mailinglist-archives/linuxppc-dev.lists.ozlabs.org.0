Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA084187E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 02:40:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cunjjfdy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TP7Cw3FG3z3cGL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 12:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cunjjfdy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:7eae::800; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn20800.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::800])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TP7C861vKz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 12:40:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNffiWe9rTGm6PT6vMVQ+jkrlwSae6q0PkVR1kfHkQWl70sozEuPo6hA6XewX4TAAvq31bcNnwk/MYIxDMEvG58oQ5zPH9gaHUoJ6boabzkHQB4b6Ey0kxXhzuHihBlFDLHr8kBaAbCw3PjzE5bfHs1ACzlmYF5fMcM2FjLH7va0VGWeItwi06BvMgCG8K+wFqqW+MCkZKL+quQL6fwIWUIYwsZ9bhw9OIe7mPeiaJZomU+r0oHCnFhkD75ZQ1hFA8HEjduPcSLt1Wyy5BlLqTd05YCDdSCpsAV7NYw85gNkNnpuRjeNICoN8rXs+RtC8CYL49B4H83PFI9VNL07vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TM/mnC4MpU2e/MTlMNhBaePxbHem/jo7MWCtDq9wXk=;
 b=jBQciPK9KrBeFbQmNQCr7YmePJOrsr1QmfDzoIuxt7vQMo4XFUFpnj5FWyuGh64PqHoFdFcR83JVDlqdtnjBUW36fQ4B6dHl2bUlxMIsrudNJHBNxywGK1Nqwv9HA602Xs0CjlSv8C9xvm4RPsVwd8YDDLMx8o5ooXVSVP4B/30Iefb/NwGyf5V+7W/MQx3e2tlInZ8yMogrCErS5YnvUHpXONMMIxaQqKOgyGh+1XV5kMmyP1cK29CFL2ZGHUutjoUX4B86C9tZEEdZFXWKiGsERurwFum0eXZQGXbhMibZcvuWeYcjxIK6+pLN67NsWZopPIY4iWI846GbJ1jd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TM/mnC4MpU2e/MTlMNhBaePxbHem/jo7MWCtDq9wXk=;
 b=cunjjfdyvvL1NJEi43kKI4nuhW3g2WRTJEWZUYAOdQ9l55e3sYpl7DFjHijse7u8kD/wVyEw2OAka8GxQ9jGtHdwzagO5AS86dK5/bfm77DqSF3GO/P9ahC0j+rjkiP5A/5fqijD42D0Swcvo8CG7jxr1XU4Jbflbeusi6mivmSjZevguRY5IjnRarCr6ghOxs+wQMuB3ttJQO1lkqS8IPQJN30rO5AUXeCELtX0mORXETY4QAQdVO7KfLgT5El5zeyCQ1jAzst+1raxruy6QbVSHLMgR0ZuC2OvRuYjTU9DHR7DdJ36mykYb9S9pVCNX0k/+yZyqkj6o0rkqGoA0g==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO6PR02MB7569.namprd02.prod.outlook.com (2603:10b6:303:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 01:39:39 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 01:39:39 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Baoquan He <bhe@redhat.com>
Subject: RE: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP
 ifdef inside CONFIG_KEXEC_CODE ifdef scope
Thread-Topic: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP
 ifdef inside CONFIG_KEXEC_CODE ifdef scope
Thread-Index: AQHaUronjJlmGLvjNUqyTXz++ApJcbDxGaMggABtuACAAAyiMA==
Date: Tue, 30 Jan 2024 01:39:39 +0000
Message-ID:  <SN6PR02MB41575A5568875B85C8AA7F4BD47D2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240129135033.157195-1-bhe@redhat.com>
 <SN6PR02MB41571397201804BD486C6148D47E2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ZbhH+sg1BPi+R0j4@MiWiFi-R3L-srv>
In-Reply-To: <ZbhH+sg1BPi+R0j4@MiWiFi-R3L-srv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [f6gxA1Z1br0jb8qCeGpCoyfarbW4/IE1]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO6PR02MB7569:EE_
x-ms-office365-filtering-correlation-id: 4d09f39f-6c44-4dbd-4e49-08dc213452db
x-ms-exchange-slblob-mailprops:  AlkLxVwsndnviVuw7EOM5d/HS1lrSHYDrnkKpga0rK7XdnLJLvXqLpHbHI/6uL8XWbZSSlTfNb0mRcuYCiOgb9Z3S1oNiJD3+g9saVZi5suy05IIanXm8QI+E1g7YJboGb0WOUBP1TAFyNSYCrJEIFqimsUOQloku002HXLOqaFOQKU5gwPHC4EPoUMpxEuVKilNUVHopYnUSbodJTR/KTJtkVHIVbXySpaHxwMQtmNdOA2w3oST1mCimJ7Kk4oc2AOaE6sIQWRfcgHgexEy2sWIJ2HlDUwS4yhr1YsC9XZz7E34BUel7u9OSHlNmuGpo3nrINXcL6JWd6+Ftf+RNJu/39/k0t7+EQXwfSxl3dqdjEhkx5+Kj5zz7b69juX9ftpDJ55hcAjJNS5IhWHZrPjWgv52+vmMxMrw56//aEiClnMBZ4WWORJxTQ096bckh78MGWz7cAl3pdMNT9b/zjXR1+xjOjEYGV65IERa4sEjBSv8jHWbU7TK7e7JTVOqNbmnqfMcxvE8jo+Q1vXVAP6U3X8zACLBJRZyQ+3RuAG7UDE/8aBiL7o+jlgVFq3pLYAPbXIOsSZDafRa9ENuwPv5bYH56lpPm80eRmIVzn0uKjVgaBinhNGk9ILdwokfhyV91slGFkDxXL7Cx5j9ljRDD4OpszK+Qh77/+daCE9gn5YOChIbT/nb5fQjaYfw8qrRb6uZKZSLMVRm+RUz6KEmQPj9snz+nqv0J+lyzKxGeedF0ojN4/KC5WpCpqtK4Rybv8Ot3BxGIMNQV3AmvzGOgAntnCKy
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Nq2yfBAOjlPUdJ0wql2obPtounD0bj1ubV2nIjfp00vO8jg44W8/Sut4YB6ucy9Lzz8GgWJYGzGmOV5faxvsgjCOcpip0o4XdrXDYc68eOtb/jlpdUr2b9OT+EuUpu6V8yNACOnQ1KHSE5HA1lblBUoJICL44ulHdTluvGnttpQjE/hiQ6/q9aAtj0tkDTjjpajpPX6k7n6cXp3+g132dVOde95TuBfOQhmex4rC2WrIFtkcVlIzeP1kiAcKgNqQCGcP8SQhQaa5GzLkBDJzIK95iTc+Y7wJHLjCxMbRdOppK5VOT10hPHIP0vVk6vgcRE1YfwsHniZFrxqituLgKaMs/66emuwBtDPyPRARKpDRaxTQCJ8ppsOpZi/3aUvMj4EqESwYKWgDCqVXIcxydAm6Qb0es863kq2C6gNxWwEicr1w807suDhOXt7WIOOxJN2AgyJ7XsghIjL+QdS8S8seE9pYY4xqt/kzFwPpTvRTeZmInb8bMfg6ABFHcfOslhH9O1zIjjJHb6UYumDGa2Fw8RhggtHf8V6k+z/5vcal3uhCoNkLYJV5LdF7W3iM
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?LTfswSaTstvgCalujfwqmHxDygK6RvCTKWQBj2gPXebZS2WWGXBVjdfkojbF?=
 =?us-ascii?Q?rwaLL6+fqm/JmQPeOy9VX8iRfq5Xl3lK1bMC19/i65BgeWVSyMK6kjfjYcqn?=
 =?us-ascii?Q?KB2BEj9tSt69BT2FdEJeGVrhB1NjvdXdPAWsc0J014ZYwYis6W2tAPcI5DVY?=
 =?us-ascii?Q?p8bG3CQDzg18qCfVx5cg8Di0w1bsCbY9FI6XHe1YFLLB4cihMAbiHrAG9sB+?=
 =?us-ascii?Q?6HImqPPcy3aaEZ6y1Qb9yz8mkEL7AZzhBSgeSsAy/8P0Lhtu1xzWKhbV0jRc?=
 =?us-ascii?Q?luXoJgO735QO4H0VKVO8f4YVEOoJu7fZLVpVokMJTluKO8REekU/tRslfnmr?=
 =?us-ascii?Q?uVTTbVaffQa7RuHysXexmnuytMPGRL/8X4PrSOSfjUMJsNzrmBBftwnbjYz/?=
 =?us-ascii?Q?Np404xlLVioDfzYKWVp/hWRoAjZA9PZrVgdVvHa6NFY7u5tgXQdiSw0kDi0g?=
 =?us-ascii?Q?/CLYiTzs/wfSUlSUvz/RYWXhik34vkWEvRscBqKsoMM/Fsy9o6CQC91CK3g9?=
 =?us-ascii?Q?ZN5/MPmrsR9j62xLsaY5gNI+bTukDzUyUpnyExSKKP71khsj/RdnIDx9nm6/?=
 =?us-ascii?Q?obCSkhfv70ekl0kTmkcMsOOi9GYnKy997wjpZyxtro5ob2SeHIiVvXSWzsD/?=
 =?us-ascii?Q?+9beM59KE1nrvyBwIL+X1TCnhcvjjxkZhackWex005OaWKn7qYwcHfTP5D9O?=
 =?us-ascii?Q?ZRA2i7ddB2Pn2bFfAGgNQjrOiTfXAHyopGvGR/ypss5Npmuh7O4WD+hhJ2yj?=
 =?us-ascii?Q?Mgplg64uxdXB9zO48Wz9TuMMt8GYftrbqtNJ1jZjTgnUFJ9E13SENXWXbjBu?=
 =?us-ascii?Q?iFBp/W8EYRk1Gzbl+qDavX2Y6q30D0JVM0wAJLX1u+LoK394u9TeoIKVUVUN?=
 =?us-ascii?Q?6fHd/bkImEcdAUBelI4vZ6nHG9btq0k1dVcY8y+Ulzm6a0TrHQFMeE8ulVYj?=
 =?us-ascii?Q?+wQ9pLnCVLmbfpU7yg0Xqo9oi4UQQ1BWAdmilQvv44V1ulZsbX/+TWsVZp4+?=
 =?us-ascii?Q?YYBYGtvBsv1P2aWiZeivGc2YSqcL90czZ3agpxY1l88jHgzoDb2m5kyBr1jm?=
 =?us-ascii?Q?7kierzHXcevcjGQ3RCscEi8XaEn858lVd7be9nmC0RlUhNgN5yIjoHen3DyF?=
 =?us-ascii?Q?1vobYYgTUqbxZ0D9p8aGUznMWxKVQ6O82Sk42IgOZ8p9rnfK+WLWY5JlswPm?=
 =?us-ascii?Q?8zKW2sZe+ffbDwfcvOOW5UNBFUFoHB3yo1j5pQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d09f39f-6c44-4dbd-4e49-08dc213452db
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 01:39:39.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7569
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Baoquan He <bhe@redhat.com>
>=20
> On 01/29/24 at 06:27pm, Michael Kelley wrote:
> > From: Baoquan He <bhe@redhat.com> Sent: Monday, January 29, 2024
> 5:51 AM
> > >
> > > Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested insid=
e
> > > arch/x86/xen/enlighten_hvm.c.
> >
> > Did some words get left out in the above sentence?  It mentions the Xen
> > case, but not the Hyper-V case.  I'm not sure what you intended.
>=20
> Thanks a lot for your careful reviewing.
>=20
> Yeah, I tried to list all affected file names, seems my vim editor threw
> away some words. And I forgot mentioning the change in reboot.c.
>=20
> I adjusted log as below according to your comments, do you think it's OK
> now?

Yes -- looks like everything is included and clear up my confusion.  But
I still have two small nits per below. :-)

Michael

>=20
> =3D=3D=3D
> Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested inside
> CONFIG_KEXEC_CODE ifdef scope in some XEN, HyperV codes.

s/Hyper-V/HyperV/

>=20
> Although the nesting works well too since CONFIG_CRASH_DUMP has
> dependency on CONFIG_KEXEC_CORE, it may cause confusion because there
> are places where it's not nested, and people may think it needs be nested

s/needs to be/needs be/

> even though it doesn't have to.
>=20
> Fix that by moving  CONFIG_CRASH_DUMP ifdeffery of codes out of
> CONFIG_KEXEC_CODE ifdeffery scope.
>=20
> And also put function machine_crash_shutdown() definition inside
> CONFIG_CRASH_DUMP ifdef scope instead of CONFIG_KEXEC_CORE ifdef.
>=20
> And also fix a building error Nathan reported as below by replacing
> CONFIG_KEXEC_CORE ifdef with CONFIG_VMCORE_INFO ifdef.
> ......
> =3D=3D=3D
>=20
> Thanks
> Baoquan

