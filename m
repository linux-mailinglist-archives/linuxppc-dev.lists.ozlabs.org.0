Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C46D1E9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 12:59:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pny3s0lyPz3fRD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 21:59:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BQSXSHYG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::630; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=camelia.groza@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BQSXSHYG;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pny300h4bz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 21:59:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LERNrkC2pue89Et9TMC5+31S5xyN+NrZRGdfOzuF+UNks5r+5aZFI6rqAS2mTk3OibRJeKPmbi7QFpR1b9Dki4yw5jo62s00qskrykCXVvILR4iS4GHOe5oJHLZqht1haW632dU1LPC0O4Kgus6EDkTeXNcaqQ1GHQGAB5nbZjxsMkMV+4UrwZe9leV4I2PCKBPJZbr8DwTcZCt9p5V7Ezx0wT6nEV2uI6RL7EifN8BfvOlqk0A8anyVmhRbIqIrqLW2qqs/xH6cZLC7Gowl/dL2YP4yAPmOiLH1Ya2NU2zL64A3rmgtiTppVZIIKtLIs8lA+eZQFim0jrDcs2x6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMOyN2A1moRRqIV7NL4vuejsyCnuTSd4jihCaqd/WdY=;
 b=L6WG8nIjBs3sVYfyVcbPJT/1aIanYayCvTElpAaCMCkTH5FD0/BZjC0i74h7YVk9JKDacHYhgL92jrVryEy9E2pb0Gwj7vLFqiSiE234V8Rn7KCeDKKm+skyEXV2nJM6ydpeQ3aMJKJ+l7Vl5wFlAJSiv2N5HEjgE9493qFRYEcXde0VZlzY8yrHshh+KnHnwRMydV/oV8xGIfq998S1bi3Qo/EzpE3r0hVYjmHA9jDD47fVktzTE/3Va5qk9x/emfAPrl2YedKuHYaeioqzlBLdO+LKWwdAca/qlNbHShdEFxNFQkq2rn6IbfD3Q0XHX+n7O7HARYIjNN6/rei5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMOyN2A1moRRqIV7NL4vuejsyCnuTSd4jihCaqd/WdY=;
 b=BQSXSHYGF/6aMwk28KGlUtG9nieWiRSGrWfSeZSv17U0cwdInbHGboqdNsCro08p2UMyqtRM8Z22PhdaaYEtCDHkixxzhC8GLo3+tyqdNX2A/UWszjm5CI10K+spt91ojLLD9pyh82LfaCJdKf4wL7zEEeCFIBW2k8lQkibCOdk=
Received: from AM6PR04MB5799.eurprd04.prod.outlook.com (2603:10a6:20b:a9::20)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Fri, 31 Mar
 2023 10:58:44 +0000
Received: from AM6PR04MB5799.eurprd04.prod.outlook.com
 ([fe80::fac3:9cb1:492c:9785]) by AM6PR04MB5799.eurprd04.prod.outlook.com
 ([fe80::fac3:9cb1:492c:9785%4]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 10:58:44 +0000
From: Camelia Alexandra Groza <camelia.groza@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, Leo Li <leoyang.li@nxp.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Thread-Topic: [PATCH 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Thread-Index: AQHZYOJtsilz0/ZTyk+UEV4EcVW4Za8Uuv6g
Date: Fri, 31 Mar 2023 10:58:44 +0000
Message-ID:  <AM6PR04MB57997C946E6AE7F2D87B5C78F28F9@AM6PR04MB5799.eurprd04.prod.outlook.com>
References: <20230327192841.952688-1-sean.anderson@seco.com>
In-Reply-To: <20230327192841.952688-1-sean.anderson@seco.com>
Accept-Language: en-GB, ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5799:EE_|PAXPR04MB9325:EE_
x-ms-office365-filtering-correlation-id: 0e1e1a7b-5575-4ace-5a05-08db31d6e55b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  c6fiLBRER93mYSQKyI9CsU8lhBfqavNfZGdcCoWCk3gDNSU6UufYS0BtynDvgdY8pMC2wPItuIbbhSkadPEYnhKakqUt7w+jgJrJRVBHf4w9QdgpZy/dEH0RfQUxWR6CzSLvYF8dGOjmxnKegRq9h23BrB7iqGNZCevjAMTpQwAhalfLFMpHWsyMAJ8QxU5WRoTWis4GWTam9I1EPRjH0tetgUx/rxK4b5BIK+c8Ws98V1OqHOWeSXeReQwHPJyWer1cLeGFnhVl7A4iVxj25yozsPMOQ1cZAGFgx+yWqrY79TcXmOuWYJGHCK4O46ruMe561K1NvWrrEEcKqiNjgkaNsEh9hrnbAd9xZHLTwcePKKNwzSHIKTIqU/sDyu1mZCahJpr1HJxAcX1v1MAoqDK7FE23KW4x4G/cVOP37KsM3Oaa+vb65PZ0Tb6CVqWDLegyJzQGPdXoHpaHx1gmkMLNfj+i9kwcSRkZPOIt8yEzgxJQNmHLnFEEFYQ6Ex3TRqZFtvhfwEKvOPlfX0PFmor4qbwt00kgMgLT83v81txw6l9mNQ80PxZSoFtfoUPgf5ukGNNeSA9AwlKaAcX56GDsHqumC3EiVAS9o6YuouCaE0xeZZ5hPiHNBLLJzD5N
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(38100700002)(478600001)(110136005)(66556008)(316002)(66946007)(64756008)(66476007)(4326008)(76116006)(54906003)(66446008)(41300700001)(8676002)(52536014)(71200400001)(122000001)(7696005)(8936002)(38070700005)(55016003)(26005)(186003)(9686003)(53546011)(2906002)(6506007)(83380400001)(33656002)(5660300002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?OldC7kW4hpBFuSDn51RIdQo/9ASAI67h1YokPQy5l6JZ/1bPObkADFb7mnIp?=
 =?us-ascii?Q?765SfPlCnfVA/c1e5STtyDeGa0PTo6XRw9dV5aU6zo67VIZ4UfyyyU0luQYq?=
 =?us-ascii?Q?XE25Dtq0uG9u1NCfom/9yrRrL/bMySTCTV2rpZg34yqHNpk09ZMMrAccz9mf?=
 =?us-ascii?Q?P10mGAlLIfdmGQkHJ6mdrorsEi73b8Zz5fm70knIIOSBTW3vwZgxgGsXdpnE?=
 =?us-ascii?Q?wVtsRm7AwRDEi/NFeEG+JfVA9QZ6xiUwC5ayAfxDbgOuyStoGeKLs54qmqmw?=
 =?us-ascii?Q?Q4cbBS4FLtYN2LHlaT1B8qBsz1MTOcJalmbgBnCU8QdtTRkrUd5p7i5UG5ep?=
 =?us-ascii?Q?ZMqgorKOmGe4MzGT5nJZ/Si1gV7cr80hmsoRTptrDk2ogutYjFsmt94ze34L?=
 =?us-ascii?Q?xSaHcMMfyzdI62SWKsGBEDA+CtcFs+KzFk+CpG2v1diDJGsNtjF9Y2w6YEne?=
 =?us-ascii?Q?hPySHZ0fm8rdNUFiV4NnrhkND2ouYYCUd5EtIxjcr5DPuqO4Qo/0QJ1AWoUy?=
 =?us-ascii?Q?JuJxlRgbl5LWKXD/ys75UPsu4r/hvYkFZpOXODop8Ity/14K9fbtNf1kX+fU?=
 =?us-ascii?Q?hIhmBuU/owc0pEm1N/x0UJk+vTJDoJBimb81k7yKZ1OovXeCdX2fWVC8f6pL?=
 =?us-ascii?Q?A/avBQtZJ2eXIuHI1ebKeaEgENQRYxepqGx2Me+mZrBgJOzI+1sNdysdlyQk?=
 =?us-ascii?Q?4jE5LgolRoKwI/Fg3hi+mpw3l+Qq08C+WR/C0GDgE30ta8hhIR3XbrT5Pvrh?=
 =?us-ascii?Q?NtSmc+ala5FKchqbdABU+U3y4SRJb7BuAH6ONhoQjs3ePBM5mwbukzVRzxu5?=
 =?us-ascii?Q?SXwezasfe81EheParKGZixKput17KX8HXsDHEU2J8wDLLHMBb8hZLAgUqRCy?=
 =?us-ascii?Q?M+g+vaaqswKZT15pjDSMzGwiSdaMa6GU1K/AB15IwaEMlMiMTk9Kh/hUGBJA?=
 =?us-ascii?Q?ffPpdO7jHfhZ9pa/BU/FEfqoRsBrF4+2jrvVxxKSLs2AZzLOcFApIfPEado5?=
 =?us-ascii?Q?qtD0g265c8F7exjOlISoQwKGCJQyrlK41otKzKwcj4uiPbucMPMh5CcG6mEN?=
 =?us-ascii?Q?xnWN0DhaMVR6vosJfKoL893WAGxPa2c+ImJjDyN/vUiwVSTt0tRhi0v0wsgm?=
 =?us-ascii?Q?Yt8tkkBaZo/Ac9n2Mo8C/n3wt76/DQxPVKkN39R9KBcXpJM6lmaUGfGmKN0S?=
 =?us-ascii?Q?02fvBopT/w5thwuNeDzm8Gr85GANs8/iOMaiWnX6GRe8kvuxY/+gGINCmdh9?=
 =?us-ascii?Q?ao8pBE+lDALtFGy3iP8YK8Bp8tF/H7mnwAJhl2mKdtnjXG4fTjX7iAGla0xX?=
 =?us-ascii?Q?MW9qtq7HhMfdBjFyICOYOhCyTaMOGv74DkKJ3z6AdeChVmpgX4o4vGnHbCu/?=
 =?us-ascii?Q?gtuRkjM7Bz2i6npx8Mqgjo7TxJ9pXOg+lJQc9OdV3A6g025KUFGU6Nljz9wa?=
 =?us-ascii?Q?MJaAGbVhSNDD8uwHgNQZV1Ix1GWtSMHBkL9NpwhaHoJY0BeI7bAYw4tZxgXf?=
 =?us-ascii?Q?gXk8/mu3iVZNi1vFItmMYtRPu527imKNfZHil91z/K6KpVP+oEyvRhm/BBXA?=
 =?us-ascii?Q?h09iUFP9EJfap3EUGi3jkICdCq5UstVMjq4mAKIr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1e1a7b-5575-4ace-5a05-08db31d6e55b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 10:58:44.3399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMzQHCXl4eaq2L5wua16+L74AhTVK0YhrXVjUmiTXvFmPcl76yOMZKbbsIX2Dji4FpcgJcCGwJtNBOhXlHKfow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
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
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Sean Anderson <sean.anderson@seco.com>
> Sent: Monday, March 27, 2023 22:29
> To: Leo Li <leoyang.li@nxp.com>; linuxppc-dev@lists.ozlabs.org; linux-arm=
-
> kernel@lists.infradead.org
> Cc: Scott Wood <oss@buserror.net>; linux-kernel@vger.kernel.org; David S =
.
> Miller <davem@davemloft.net>; Claudiu Manoil <claudiu.manoil@nxp.com>;
> Roy Pledge <roy.pledge@nxp.com>; Vladimir Oltean
> <vladimir.oltean@nxp.com>; Camelia Alexandra Groza
> <camelia.groza@nxp.com>; Sean Anderson <sean.anderson@seco.com>
> Subject: [PATCH 1/2] soc: fsl: qbman: Always disable interrupts when taki=
ng
> cgr_lock
>=20
> smp_call_function_single disables IRQs when executing the callback. To
> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
> This is already done by qman_update_cgr and qman_delete_cgr; fix the
> other lockers.
>=20
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
>=20
>  drivers/soc/fsl/qbman/qman.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 739e4eee6b75..ff870ca07596 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -1456,7 +1456,7 @@ static void qm_congestion_task(struct work_struct
> *work)
>  	union qm_mc_result *mcr;
>  	struct qman_cgr *cgr;
>=20
> -	spin_lock(&p->cgr_lock);
> +	spin_lock_irq(&p->cgr_lock);
>  	qm_mc_start(&p->p);
>  	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
>  	if (!qm_mc_result_timeout(&p->p, &mcr)) {
> @@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct
> *work)
>  	list_for_each_entry(cgr, &p->cgr_cbs, node)
>  		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
>  			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
> -	spin_unlock(&p->cgr_lock);
> +	spin_unlock_irq(&p->cgr_lock);
>  	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
>  }

There is one more spin_unlock call in qm_congestion_task on the error path =
that needs updating:

if (!qm_mc_result_timeout(&p->p, &mcr)) {
	spin_unlock(&p->cgr_lock);

Regards,
Camelia

> @@ -2440,7 +2440,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32
> flags,
>  	preempt_enable();
>=20
>  	cgr->chan =3D p->config->channel;
> -	spin_lock(&p->cgr_lock);
> +	spin_lock_irq(&p->cgr_lock);
>=20
>  	if (opts) {
>  		struct qm_mcc_initcgr local_opts =3D *opts;
> @@ -2477,7 +2477,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32
> flags,
>  	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
>  		cgr->cb(p, cgr, 1);
>  out:
> -	spin_unlock(&p->cgr_lock);
> +	spin_unlock_irq(&p->cgr_lock);
>  	put_affine_portal();
>  	return ret;
>  }
> --
> 2.35.1.1320.gc452695387.dirty

