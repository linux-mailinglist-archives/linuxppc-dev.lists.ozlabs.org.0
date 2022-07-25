Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A925803DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 20:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls7T3702sz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 04:13:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e5MmRycY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.94.49; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=alexander.deucher@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e5MmRycY;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls7SH4Ccjz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 04:12:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrXNKP2eYY4xyxtjPQNt1srlvxfEABUCQA9hebjrdGlPlDtcrip3wji8Rmz5cwVMEHI7D2JGfD+48g4h2q5cgjQlkjEWwQsD99EFCrL6vwdzIRuL/75xLfUYx+UiChn2NmeNRuTUpTEt/BUsIPw91+bCd6N4TF+TmcZSeDXoEdi+G7j3PoHqwFqcmT6Nv4bzFf88PkJRZPGE1lH1qz2k5TDQP2pilIXA9OLMFKgrille47aowCgS9ty6rNGkPrzJyZRlf/fIJ8KPPsRkYisLXttrpIcPqEaRm5ngHwwNPGah3Tuz79jiuicWnkOUku4Vqba81CWYiD1nUg2BnOt9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaNJKdPcaxzbJC/+6YP5dcrEclVTtqnkbhsUhVqu7B0=;
 b=Ahf5nAfIQlHJWVTx9c68r3g1ZU3d6CdRXXoIDEJqSxs1wXeJ/E7EtbCKolgw/Yofq5rZ5zrVrPEqAWfWoZmssLK1QaxBBG8n2msye49qNBiSXqvYeUXT3PcRbQxZNZ1xOqrmBUBvn0u5DS+M+qyuKAV82H12tYk0l6jexHjWFDL13pNqtoF6ogWDiJCu8tWT6gBPAXRpP+6qYZ52eS/f2CJX3RL4Hk44/h4ACZ+lOwCO76ug7hu+C30mjqzanSpMwNepXitnQPoM0prCEu4VYOnrmJTUgqRaDn9Fi19mUFmMyLRb/8WIG6Zg48rqCIAgTIXJiRFDKeG4Dp8yHqmHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaNJKdPcaxzbJC/+6YP5dcrEclVTtqnkbhsUhVqu7B0=;
 b=e5MmRycY625x2aE4Oo+Ny9CJqjn2M0q3pEZQkyiFZsuB90oUOzKrDley9XjXUsgQ3vP8265zt32/d4+P3mSFFWhk7UGqRvl5DOaDe43xMkRV69ESRt9a2DGU5KUBeZd7ui9Vp7WdfNPom+XKgHsZp6dNtRlhMjJA+/Kbr3o7MSA=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BN9PR12MB5212.namprd12.prod.outlook.com (2603:10b6:408:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 18:12:25 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::589b:a1f6:9c87:a8ba]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::589b:a1f6:9c87:a8ba%7]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 18:12:25 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
Thread-Topic: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
Thread-Index: AQHYoCfGKHQdtJmGsUum6CTa+/BPTa2PY22g
Date: Mon, 25 Jul 2022 18:12:25 +0000
Message-ID:  <BL1PR12MB51442913428C33EE5CEA91E0F7959@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220725123918.1903255-1-mpe@ellerman.id.au>
In-Reply-To: <20220725123918.1903255-1-mpe@ellerman.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-07-25T18:10:54Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=8ed7cb56-7270-4ad9-9f60-5340b053bcc9;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-07-25T18:12:23Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid:  3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid:  e66fb564-3818-4534-b630-579ca090f472
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35a2551c-9566-4a9a-aae6-08da6e693a09
x-ms-traffictypediagnostic: BN9PR12MB5212:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2SqqeYH13zHNIzH/oe4EuPOambPTSK+BilXMblrUSd71KunU7stZJQXcdB6ndEFWidyN4N1gDIwc86EjABpzoP/93Nlfw3D9B3IM5lupdrSExN0aIFGb6OmShVF4MflO2h5/KtutXftz/5vvjMqW6iAFzY0pnvhxqXHnLDA5q9kv+T9eWt1LylUZ9OhItLbaJTBRyn3ZDpQKeAwVEC8Zcvxi8jWanfEijdvFrqPI/8gD2SyNmYt+xKD1WT/aO+uasEJzXO+NmaTyQ6/tFbQ/3D8F+La+4fpaUn0xhDp3or4wTPMDKJZPXF82OqVyoa+/gbngSUfCkGdDzV8pCknanNyP7K8EMZJUw9pUG32fBiVwhrpAEhtgczTuCzpdrJUpybqkxfXPFbu6TYE4UEzVblsF+55Eenmluz9pJBCcoUkp5L8mUV8iS6NqE2Tw87RZHugDkYyHnb+V5ET4071blZbzvuRrRfQNYjvZ8C69r8MTbZ2Hd1OHX+YK/ePgrcT7+1LcZPgZZX7OZ5UdJp4OVYwfI/kWXyFtnxmKdWRbhodlrBQ9wgoNR1t9ialjCHD7uXecLnX1tSbYygo9RHWOYErfTnH+E+CAEhaz3XQGpnN/33EQrJajmJbuIXMZ4kRyb6bKJgPxPlXDUTuTUqMrR5VcxVigpyviGAaSynBNMFt/UW+d9Mf8cHaAc7W7NZefZgWaA6Cfe2pOr/xEaNrZSPbnRRQrD4hL5szSQWZhVkLUS1efNXWOLoBJM9QSSkhzFXhlTjnbwf1bvykz8UhJV+/4BmYsSfIJigGjt4JGDeBper+hZ00in4WD1zdUjL60Z0npiIW1G+bvxt19cPI7WQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5144.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(83380400001)(38070700005)(122000001)(52536014)(8936002)(33656002)(86362001)(186003)(9686003)(38100700002)(6506007)(53546011)(7696005)(41300700001)(54906003)(45080400002)(110136005)(478600001)(71200400001)(2906002)(76116006)(5660300002)(8676002)(4326008)(66446008)(66946007)(66476007)(66556008)(64756008)(316002)(55016003)(966005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Erf7+dCSk/NXbKp6v5jRx0vAspO63NM8ExBR8S9HZn3dZohJbVkbznYV8b/w?=
 =?us-ascii?Q?SGetrx3burqutlqckRobogHBPTKMcEXx1ROICTRVSKCarjIThB2piCmPovIf?=
 =?us-ascii?Q?NixoxEwXSnPd2k0EVb2xN1nvITgcqcUcYNfhbO359EqZ7E1GojtsbfgUDCu/?=
 =?us-ascii?Q?Rl3xsjMU/d2nIs+EiCqpx9uTDF08qljjDix9AZEMZZ28Gv+rxGPEuHpuT0Q9?=
 =?us-ascii?Q?K5rXN3u+AqdwL3t/LzoK7ism5PQGEz3qXSDc5x8ckrxo79/u91ivMFDyIktI?=
 =?us-ascii?Q?ZKTQ5Oi5YpWG0n06hUY1XuBTqR4AWIJeHkJgNRMrwRJD5Kub6kLIT+WWfBvq?=
 =?us-ascii?Q?hpyHlly3isr3o8ytwgKWchsRShCGjuj3i6hN/Frm/H0vSliBtzspm1IvPudI?=
 =?us-ascii?Q?55TJefgcrtcNH7NX5yMnTZd7YN0/Rw5YJeJzt2mPgdLoaPhuJxO3mneuZJVC?=
 =?us-ascii?Q?C/qk7VfzHvYiijJej+YyKWnILR/6AvLpDsS44Xr59HAYiyf32pc9dd1EN+Yh?=
 =?us-ascii?Q?FZozQW604MI51/Bs8iYlPRF7VUCrcALEXcOxBJeqWZswAEzH0HfzRdmix6dg?=
 =?us-ascii?Q?FbEc45mPg27aGQ4ouEMuIB1ZMVPH8+vCbFPY69L+OxANvx3Jdh/But6Z6Gmp?=
 =?us-ascii?Q?+Tgf0OwFP2xj74a3e+POGwOIoaBtcXFwxo/v8XTM46IOtD6k6P8RlR0YRef+?=
 =?us-ascii?Q?h2SacHX9oSRntU0SBsS+f6w2KhuYYmGa2l1up7LY0qXlhrFlqXFAdlOyrZFI?=
 =?us-ascii?Q?smkyw7eVwIeL+UurwlMl57ZNlrncPc3W8qKnR9Y1ZZIPfjjDe4rdRH7N/u0I?=
 =?us-ascii?Q?0Sj0IbNul0TW2Ofc9pu0gQzd/osS/eppW3HoQeZNku4W2h2aQMeTxaLtIYbU?=
 =?us-ascii?Q?44bvPM2qYmWifdPesUhqj1M1I/cNDfP5IShsnBQiShg7Pe3C+75BsNMyzt/N?=
 =?us-ascii?Q?YN1Jb1cPEVRw81kYeVqUjxMK+zp2LlJfFMmnPf2TzqRTXTQjD8+2avJt5o8i?=
 =?us-ascii?Q?rql5bfy4yV2Ci020zFpC18sAc7GJRo3K7VCdL/Llk+DP/oWbC4iGIj5fctw+?=
 =?us-ascii?Q?p1rV6faW3ziaVoMbWDVeUts7QFU2J3H71B44+Nf1ySbZtX8Tvkci3CtSwIw5?=
 =?us-ascii?Q?21Xw+U6pNEnlvU6+OuJpw8SDm+PVPAV59pLKQwsQ5MBA6/mWYfo+wbvj4I6b?=
 =?us-ascii?Q?eqLTi2+TnqGgK0w5WcRQ3Lnk5SvJeWnxyVTmcVxozQODD5q0OH91wESNZVku?=
 =?us-ascii?Q?FrRbK0jCQODV9OOvIIrqPYn1wMTQHmf/QDY2gCHSJ8P7EsgM4Ytimy3IiWXH?=
 =?us-ascii?Q?KuuoVuOKp/5lZDE9RaO8PYLfju/+c4nq19BVUs7GQvtGtjGrQdfrZAqHKBVs?=
 =?us-ascii?Q?SqEWLEpM1auLMA95Ek+rxM+Q9Nj//hccVAFxW2zHMkGtEkdpu0jutWH2508p?=
 =?us-ascii?Q?jdTuebYEzuULxA0K7sFYcjeicr2AnOJqn4JL0UBZnPeJ5jTHtKTq0IDzfDsw?=
 =?us-ascii?Q?Ym8UBwdlxTwxflUcYaF0L+XUuanEA3IxVdMTTHZPZund+LxNCK88hUFPIBom?=
 =?us-ascii?Q?VG+OVYfkglwx4pJ/1M3eudqScy9ZG9MPnltLHx+g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a2551c-9566-4a9a-aae6-08da6e693a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 18:12:25.0367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62gSf/4m13XM+TEHNWbJCORAEiMHONsFGg7qRhgM1sMoR0DFKHGEgkrZ217cosiltG6pmbVr+XYtXzk5XCyCVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5212
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
Cc: "dan@danny.cz" <dan@danny.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "tpearson@raptorengineering.com" <tpearson@raptorengineering.com>, "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Public]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Michael Ellerman
> Sent: Monday, July 25, 2022 8:39 AM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: dan@danny.cz; linux-kernel@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; tpearson@raptorengineering.com;
> alexdeucher@gmail.com; torvalds@linux-foundation.org; linux@roeck-
> us.net
> Subject: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
>=20
> Commit d11219ad53dc ("amdgpu: disable powerpc support for the newer
> display engine") disabled the DCN driver for all of powerpc due to unreso=
lved
> build failures with some compilers.
>=20
> Further digging shows that the build failures only occur with compilers t=
hat
> default to 64-bit long double.
>=20
> Both the ppc64 and ppc64le ABIs define long double to be 128-bits, but th=
ere
> are compilers in the wild that default to 64-bits. The compilers provided=
 by
> the major distros (Fedora, Ubuntu) default to 128-bits and are not affect=
ed
> by the build failure.
>=20
> There is a compiler flag to force 128-bit long double, which may be the
> correct long term fix, but as an interim fix only allow building the DCN =
driver if
> long double is 128-bits by default.
>=20
> The bisection in commit d11219ad53dc must have gone off the rails at some
> point, the build failure occurs all the way back to the original commit t=
hat
> enabled DCN support on powerpc, at least with some toolchains.
>=20
> Depends-on: d11219ad53dc ("amdgpu: disable powerpc support for the
> newer display engine")
> Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F2100&amp;data=3D05%7C01%7Calexander.deucher%40amd.com
> %7C3bfc6788a65444cb7ffe08da6e3ee794%7C3dd8961fe4884e608e11a82d994
> e183d%7C0%7C0%7C637943513703402010%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000%7C%7C%7C&amp;sdata=3DMTWp8MSgFBltLYbrPHCAyR8VdVEHakp
> KVMkNEBRx%2FrI%3D&amp;reserved=3D0
> ---
>  arch/powerpc/Kconfig                | 4 ++++
>  drivers/gpu/drm/amd/display/Kconfig | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> Alex, are you OK if I take this via the powerpc tree for v5.19?

No problem.=20
Acked-by: Alex Deucher <alexander.deucher@amd.com>
FWIW, We should have all of this PPC FP stuff cleared up in 5.20.

Alex

>=20
> cheers
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig index
> 7aa12e88c580..287cc2d4a4b3 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -281,6 +281,10 @@ config PPC
>  	# Please keep this list sorted alphabetically.
>  	#
>=20
> +config PPC_LONG_DOUBLE_128
> +	depends on PPC64
> +	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ |
> $(CC) -E
> +-P -)" =3D 1)
> +
>  config PPC_BARRIER_NOSPEC
>  	bool
>  	default y
> diff --git a/drivers/gpu/drm/amd/display/Kconfig
> b/drivers/gpu/drm/amd/display/Kconfig
> index 0ba0598eba20..ec6771e87e73 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>  	bool "AMD DC - Enable new display engine"
>  	default y
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
> -	select DRM_AMD_DC_DCN if X86 && !(KCOV_INSTRUMENT_ALL &&
> KCOV_ENABLE_COMPARISONS)
> +	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128) &&
> +!(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and
> --
> 2.35.3
