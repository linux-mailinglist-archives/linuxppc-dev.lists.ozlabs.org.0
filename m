Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A762ABFF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 20:57:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q6J86S7nzDrFS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 04:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.66; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="BFl356L7"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q6Fw3r0zzDrCl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2019 04:55:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh0ohldZv7wVkp1NgrJgOnJbDL8z4GA/ehyrnHN0xSc9CIyhV6F+YeZ7ERmQnfnieq/qSmkCWI3rdqBSUJsSRsuQBctzWDKkaObs1vi34neIE43jRMpXBtJ6ceuXrQznzpVoc/A0YTNUw443kQgVhvog7ZYfsi3Nbz54MEjgVGKdFG9bT3z0PI42vGIpZC1wYl1L9IlgCfnr3PmdoWJcJDvPebaHkalNhA9Ud+O4803l2fT3eV8LehDH1CUUn06fho8PUGt3a/uGSMNZEt9v33A5zngIwcVcrjzgo8vJlbt7163/X1e3E5QY4KFQ55p5Oq9ig8yfEFkimMP50tT90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uePL0Fl9KiU4MbflU18rB+QgfXBF9LwflY7iUWmSbts=;
 b=Ajl3Kx/g/KCkEXE3DE7CN+doEYkTNSDEMkngHItZn2xBVNCt7UQDet0V44SoelP2NbLxOdBnoQ0pzqKjnzwavAG/JHAvnCRxBwydGPCQZe5LN/D0ZtGSQXyiCxZH0d65DLm+GJ/EedfuMdkFguVh6DDtJpup+zZnFcq4N8BQxovOdS9DcwVSCMpsNRM955UsKpIFNOnioJBbTLVw1Vw6ILCyHl7XwQ65Cw71oegFCkVkhfpOYoA3Q+XmAX6Ow60bnKrdz2cOJi6jfwTUZ3d0UazYHpvdTJeAcSC9AzC5M7lYhnEeAlHdtXKEexG0BnRyR7VGLITgluyYkdIIR95SJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uePL0Fl9KiU4MbflU18rB+QgfXBF9LwflY7iUWmSbts=;
 b=BFl356L7Jiw7fkphE+Gs3p6NO9UCkm8clBg5IkLbXy4QIAN4UCwR/5b4/BhDwEgArIrw51AVEGt7w6QSvDsp4OQ4+Vt1jo0H9SSfLrZLERJDDipmLrnTUFuZxXyRnLEh0dG+OXAZdeNO5IfHVcTAHHwnoK9T/bsbdsDMYZueYV4=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6464.eurprd04.prod.outlook.com (20.179.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Fri, 6 Sep 2019 18:55:36 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::fdaf:fd36:2307:c972]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::fdaf:fd36:2307:c972%7]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 18:55:36 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: Youri Querry <youri.querry_1@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciocoi Radulescu
 <ruxandra.radulescu@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v2] soc: fsl: dpio: Add support for QBMan ring bulk
 enqueue.
Thread-Topic: [PATCH v2] soc: fsl: dpio: Add support for QBMan ring bulk
 enqueue.
Thread-Index: AQHVZBxfogPyBrug70O/HGqPQoZScQ==
Date: Fri, 6 Sep 2019 18:55:36 +0000
Message-ID: <VE1PR04MB64639FEDC6D0BFD6BAC3A1DB86BA0@VE1PR04MB6463.eurprd04.prod.outlook.com>
References: <1567710063-922-1-git-send-email-youri.querry_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9e0929e-98ee-40b5-0c5f-08d732fbcdd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6464; 
x-ms-traffictypediagnostic: VE1PR04MB6464:|VE1PR04MB6464:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB646434B57929174EEABAA2C686BA0@VE1PR04MB6464.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(189003)(199004)(91956017)(316002)(52536014)(64756008)(110136005)(2906002)(66446008)(66946007)(6116002)(3846002)(5660300002)(25786009)(66556008)(66476007)(33656002)(76116006)(30864003)(7736002)(2501003)(305945005)(74316002)(8676002)(6246003)(81156014)(81166006)(8936002)(99286004)(14444005)(256004)(6636002)(71190400001)(71200400001)(14454004)(53936002)(102836004)(478600001)(53546011)(55016002)(6506007)(26005)(86362001)(186003)(229853002)(9686003)(476003)(6436002)(2201001)(44832011)(486006)(66066001)(76176011)(53946003)(7696005)(446003)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6464;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ga1RBwICiOrrsbWqpkhRzGa7IAfKvxtwdVlb3J1mzNz/sSOddUqa/wXtxPLtClXWDna78T/dLeecal2zJwa5RjhYqP1NgUxPbEHga9GYfu600L+QD6bTTKCD2/pCSai/3p0MwFQxfivEeNE9o5u0WoYcjAOJ1Y1ZlEun+/tpjxF93YkZQlr/gWMB+TO2C7GVyyenDDW+0LZ8r3vqPjP+W4KH2mPzxWcufWFk7cq7rONlORgqFjIgl9FyZ+NjxG45veP2r46naO9uULxFWbUOicXQFujuyac5pmRkF19pc1JGez0CxDky0/mBNQTp/cI5yWkSCCJppwEPZ94xu7IZXzZOUrQ1vU5048qyCxVdVCRyxxGcxUQthHeXubejhPxjVogj5jf+opESKZG8ecNSed+Eih2CxdW0kX77vV7ur58=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e0929e-98ee-40b5-0c5f-08d732fbcdd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 18:55:36.6021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yg8ISBnk/urOE+64KbchK7gTzbM+1Po/MGeL+eMuMQ8qW+w12l5BK2bg3/UJ/vuZVz17lPjW4z+O63dbxii0og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6464
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

On 9/5/2019 3:01 PM, Youri Querry wrote:=0A=
> The QBMan frame descriptor enqueuing is changed from array=0A=
>  mode (a single frame enqueue at a time) to bulk ring mode.=0A=
>=0A=
> This new mode allows the enqueuing of multiple frames in one operation.=
=0A=
> The original interface is kept but use the bulk enqueue of one frame=0A=
>=0A=
> Signed-off-by: Youri Querry <youri.querry_1@nxp.com>=0A=
Acked-by: Roy Pledge <roy.pledge@nxp.com>=0A=
> ---=0A=
>  drivers/soc/fsl/dpio/dpio-service.c |  69 +++-=0A=
>  drivers/soc/fsl/dpio/qbman-portal.c | 772 ++++++++++++++++++++++++++++++=
++----=0A=
>  drivers/soc/fsl/dpio/qbman-portal.h | 175 +++++++-=0A=
>  3 files changed, 935 insertions(+), 81 deletions(-)=0A=
>=0A=
> diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/d=
pio-service.c=0A=
> index b9539ef..4eb53ee 100644=0A=
> --- a/drivers/soc/fsl/dpio/dpio-service.c=0A=
> +++ b/drivers/soc/fsl/dpio/dpio-service.c=0A=
> @@ -1,7 +1,7 @@=0A=
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)=0A=
>  /*=0A=
>   * Copyright 2014-2016 Freescale Semiconductor Inc.=0A=
> - * Copyright 2016 NXP=0A=
> + * Copyright 2016-2019 NXP=0A=
>   *=0A=
>   */=0A=
>  #include <linux/types.h>=0A=
> @@ -435,6 +435,69 @@ int dpaa2_io_service_enqueue_fq(struct dpaa2_io *d,=
=0A=
>  EXPORT_SYMBOL(dpaa2_io_service_enqueue_fq);=0A=
>  =0A=
>  /**=0A=
> + * dpaa2_io_service_enqueue_multiple_fq() - Enqueue multiple frames=0A=
> + * to a frame queue using one fqid.=0A=
> + * @d: the given DPIO service.=0A=
> + * @fqid: the given frame queue id.=0A=
> + * @fd: the list of frame descriptors enqueued.=0A=
> + * @nb: number of frames to be enqueued=0A=
> + *=0A=
> + * Return the number of enqueued frames (0 if EQCR is busy)=0A=
> + * or -ENODEV if there is no dpio service.=0A=
> + */=0A=
> +int dpaa2_io_service_enqueue_multiple_fq(struct dpaa2_io *d,=0A=
> +				u32 fqid,=0A=
> +				const struct dpaa2_fd *fd,=0A=
> +				int nb)=0A=
> +{=0A=
> +	struct qbman_eq_desc ed;=0A=
> +=0A=
> +	d =3D service_select(d);=0A=
> +	if (!d)=0A=
> +		return -ENODEV;=0A=
> +=0A=
> +	qbman_eq_desc_clear(&ed);=0A=
> +	qbman_eq_desc_set_no_orp(&ed, 0);=0A=
> +	qbman_eq_desc_set_fq(&ed, fqid);=0A=
> +=0A=
> +	return qbman_swp_enqueue_multiple(d->swp, &ed, fd, 0, nb);=0A=
> +}=0A=
> +EXPORT_SYMBOL(dpaa2_io_service_enqueue_multiple_fq);=0A=
> +=0A=
> +/**=0A=
> + * dpaa2_io_service_enqueue_multiple_desc_fq() - Enqueue multiple frames=
=0A=
> + * to different frame queue using a list of fqids.=0A=
> + * @d: the given DPIO service.=0A=
> + * @fqid: the given list of frame queue ids.=0A=
> + * @fd: the list of frame descriptors enqueued.=0A=
> + * @nb: number of frames to be enqueued=0A=
> + *=0A=
> + * Return the number of enqueued frames (0 if EQCR is busy)=0A=
> + * or -ENODEV if there is no dpio service.=0A=
> + */=0A=
> +int dpaa2_io_service_enqueue_multiple_desc_fq(struct dpaa2_io *d,=0A=
> +				u32 *fqid,=0A=
> +				const struct dpaa2_fd *fd,=0A=
> +				int nb)=0A=
> +{=0A=
> +	int i;=0A=
> +	struct qbman_eq_desc_min ed[32];=0A=
> +=0A=
> +	d =3D service_select(d);=0A=
> +	if (!d)=0A=
> +		return -ENODEV;=0A=
> +=0A=
> +	for (i =3D 0; i < nb; i++) {=0A=
> +		qbman_eq_desc_min_clear(&ed[i]);=0A=
> +		qbman_eq_desc_set_no_orp_min(&ed[i], 0);=0A=
> +		qbman_eq_desc_set_min_fq(&ed[i], fqid[i]);=0A=
> +	}=0A=
> +=0A=
> +	return qbman_swp_enqueue_multiple_desc(d->swp, &ed[0], fd, nb);=0A=
> +}=0A=
> +EXPORT_SYMBOL(dpaa2_io_service_enqueue_multiple_desc_fq);=0A=
> +=0A=
> +/**=0A=
>   * dpaa2_io_service_enqueue_qd() - Enqueue a frame to a QD.=0A=
>   * @d: the given DPIO service.=0A=
>   * @qdid: the given queuing destination id.=0A=
> @@ -528,7 +591,7 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_acquire);=0A=
>  =0A=
>  /**=0A=
>   * dpaa2_io_store_create() - Create the dma memory storage for dequeue r=
esult.=0A=
> - * @max_frames: the maximum number of dequeued result for frames, must b=
e <=3D 16.=0A=
> + * @max_frames: the maximum number of dequeued result for frames, must b=
e <=3D 32.=0A=
>   * @dev:        the device to allow mapping/unmapping the DMAable region=
.=0A=
>   *=0A=
>   * The size of the storage is "max_frames*sizeof(struct dpaa2_dq)".=0A=
> @@ -543,7 +606,7 @@ struct dpaa2_io_store *dpaa2_io_store_create(unsigned=
 int max_frames,=0A=
>  	struct dpaa2_io_store *ret;=0A=
>  	size_t size;=0A=
>  =0A=
> -	if (!max_frames || (max_frames > 16))=0A=
> +	if (!max_frames || (max_frames > 32))=0A=
>  		return NULL;=0A=
>  =0A=
>  	ret =3D kmalloc(sizeof(*ret), GFP_KERNEL);=0A=
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/q=
bman-portal.c=0A=
> index c66f5b7..0ed2c8f 100644=0A=
> --- a/drivers/soc/fsl/dpio/qbman-portal.c=0A=
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c=0A=
> @@ -1,13 +1,14 @@=0A=
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)=0A=
>  /*=0A=
>   * Copyright (C) 2014-2016 Freescale Semiconductor, Inc.=0A=
> - * Copyright 2016 NXP=0A=
> + * Copyright 2016-2019 NXP=0A=
>   *=0A=
>   */=0A=
>  =0A=
>  #include <asm/cacheflush.h>=0A=
>  #include <linux/io.h>=0A=
>  #include <linux/slab.h>=0A=
> +#include <linux/spinlock.h>=0A=
>  #include <soc/fsl/dpaa2-global.h>=0A=
>  =0A=
>  #include "qbman-portal.h"=0A=
> @@ -28,6 +29,7 @@=0A=
>  =0A=
>  /* CINH register offsets */=0A=
>  #define QBMAN_CINH_SWP_EQCR_PI      0x800=0A=
> +#define QBMAN_CINH_SWP_EQCR_CI	    0x840=0A=
>  #define QBMAN_CINH_SWP_EQAR    0x8c0=0A=
>  #define QBMAN_CINH_SWP_CR_RT        0x900=0A=
>  #define QBMAN_CINH_SWP_VDQCR_RT     0x940=0A=
> @@ -51,6 +53,8 @@=0A=
>  #define QBMAN_CENA_SWP_CR      0x600=0A=
>  #define QBMAN_CENA_SWP_RR(vb)  (0x700 + ((u32)(vb) >> 1))=0A=
>  #define QBMAN_CENA_SWP_VDQCR   0x780=0A=
> +#define QBMAN_CENA_SWP_EQCR_CI 0x840=0A=
> +#define QBMAN_CENA_SWP_EQCR_CI_MEMBACK 0x1840=0A=
>  =0A=
>  /* CENA register offsets in memory-backed mode */=0A=
>  #define QBMAN_CENA_SWP_DQRR_MEM(n)  (0x800 + ((u32)(n) << 6))=0A=
> @@ -78,6 +82,12 @@=0A=
>  /* opaque token for static dequeues */=0A=
>  #define QMAN_SDQCR_TOKEN    0xbb=0A=
>  =0A=
> +#define QBMAN_EQCR_DCA_IDXMASK          0x0f=0A=
> +#define QBMAN_ENQUEUE_FLAG_DCA          (1ULL << 31)=0A=
> +=0A=
> +#define EQ_DESC_SIZE_WITHOUT_FD 29=0A=
> +#define EQ_DESC_SIZE_FD_START 32=0A=
> +=0A=
>  enum qbman_sdqcr_dct {=0A=
>  	qbman_sdqcr_dct_null =3D 0,=0A=
>  	qbman_sdqcr_dct_prio_ics,=0A=
> @@ -90,6 +100,82 @@ enum qbman_sdqcr_fc {=0A=
>  	qbman_sdqcr_fc_up_to_3 =3D 1=0A=
>  };=0A=
>  =0A=
> +/* Internal Function declaration */=0A=
> +static int qbman_swp_enqueue_ring_mode_direct(struct qbman_swp *s,=0A=
> +					      const struct qbman_eq_desc *d,=0A=
> +					      const struct dpaa2_fd *fd);=0A=
> +static int qbman_swp_enqueue_ring_mode_mem_back(struct qbman_swp *s,=0A=
> +						const struct qbman_eq_desc *d,=0A=
> +						const struct dpaa2_fd *fd);=0A=
> +static int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,=0A=
> +					     const struct qbman_eq_desc *d,=0A=
> +					     const struct dpaa2_fd *fd,=0A=
> +					     uint32_t *flags,=0A=
> +					     int num_frames);=0A=
> +static int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,=0A=
> +					       const struct qbman_eq_desc *d,=0A=
> +					       const struct dpaa2_fd *fd,=0A=
> +					       uint32_t *flags,=0A=
> +					       int num_frames);=0A=
> +static int=0A=
> +qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,=0A=
> +				       const struct qbman_eq_desc_min *d,=0A=
> +				       const struct dpaa2_fd *fd,=0A=
> +				       int num_frames);=0A=
> +static=0A=
> +int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,=0A=
> +					     const struct qbman_eq_desc_min *d,=0A=
> +					     const struct dpaa2_fd *fd,=0A=
> +					     int num_frames);=0A=
> +static int qbman_swp_pull_direct(struct qbman_swp *s,=0A=
> +				 struct qbman_pull_desc *d);=0A=
> +static int qbman_swp_pull_mem_back(struct qbman_swp *s,=0A=
> +				   struct qbman_pull_desc *d);=0A=
> +=0A=
> +const struct dpaa2_dq *qbman_swp_dqrr_next_direct(struct qbman_swp *s);=
=0A=
> +const struct dpaa2_dq *qbman_swp_dqrr_next_mem_back(struct qbman_swp *s)=
;=0A=
> +=0A=
> +static int qbman_swp_release_direct(struct qbman_swp *s,=0A=
> +				    const struct qbman_release_desc *d,=0A=
> +				    const u64 *buffers,=0A=
> +				    unsigned int num_buffers);=0A=
> +static int qbman_swp_release_mem_back(struct qbman_swp *s,=0A=
> +				      const struct qbman_release_desc *d,=0A=
> +				      const u64 *buffers,=0A=
> +				      unsigned int num_buffers);=0A=
> +=0A=
> +/* Function pointers */=0A=
> +int (*qbman_swp_enqueue_ring_mode_ptr)(struct qbman_swp *s,=0A=
> +				       const struct qbman_eq_desc *d,=0A=
> +				       const struct dpaa2_fd *fd)=0A=
> +	=3D qbman_swp_enqueue_ring_mode_direct;=0A=
> +=0A=
> +int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,=0A=
> +				      const struct qbman_eq_desc *d,=0A=
> +				      const struct dpaa2_fd *fd,=0A=
> +				      uint32_t *flags,=0A=
> +					     int num_frames)=0A=
> +	=3D qbman_swp_enqueue_multiple_direct;=0A=
> +=0A=
> +int=0A=
> +(*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,=0A=
> +				       const struct qbman_eq_desc_min *d,=0A=
> +				       const struct dpaa2_fd *fd,=0A=
> +				       int num_frames)=0A=
> +	=3D qbman_swp_enqueue_multiple_desc_direct;=0A=
> +=0A=
> +int (*qbman_swp_pull_ptr)(struct qbman_swp *s, struct qbman_pull_desc *d=
)=0A=
> +			=3D qbman_swp_pull_direct;=0A=
> +=0A=
> +const struct dpaa2_dq *(*qbman_swp_dqrr_next_ptr)(struct qbman_swp *s)=
=0A=
> +			=3D qbman_swp_dqrr_next_direct;=0A=
> +=0A=
> +int (*qbman_swp_release_ptr)(struct qbman_swp *s,=0A=
> +			     const struct qbman_release_desc *d,=0A=
> +			     const u64 *buffers,=0A=
> +			     unsigned int num_buffers)=0A=
> +			=3D qbman_swp_release_direct;=0A=
> +=0A=
>  /* Portal Access */=0A=
>  =0A=
>  static inline u32 qbman_read_register(struct qbman_swp *p, u32 offset)=
=0A=
> @@ -146,6 +232,15 @@ static inline u32 qbman_set_swp_cfg(u8 max_fill, u8 =
wn,	u8 est, u8 rpm, u8 dcm,=0A=
>  =0A=
>  #define QMAN_RT_MODE	   0x00000100=0A=
>  =0A=
> +static inline u8 qm_cyc_diff(u8 ringsize, u8 first, u8 last)=0A=
> +{=0A=
> +	/* 'first' is included, 'last' is excluded */=0A=
> +	if (first <=3D last)=0A=
> +		return last - first;=0A=
> +	else=0A=
> +		return (2 * ringsize) - (first - last);=0A=
> +}=0A=
> +=0A=
>  /**=0A=
>   * qbman_swp_init() - Create a functional object representing the given=
=0A=
>   *                    QBMan portal descriptor.=0A=
> @@ -156,8 +251,12 @@ static inline u32 qbman_set_swp_cfg(u8 max_fill, u8 =
wn,	u8 est, u8 rpm, u8 dcm,=0A=
>   */=0A=
>  struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d)=0A=
>  {=0A=
> -	struct qbman_swp *p =3D kmalloc(sizeof(*p), GFP_KERNEL);=0A=
> +	struct qbman_swp *p =3D kzalloc(sizeof(*p), GFP_KERNEL);=0A=
>  	u32 reg;=0A=
> +	u32 mask_size;=0A=
> +	u32 eqcr_pi;=0A=
> +=0A=
> +	spin_lock_init(&p->access_spinlock);=0A=
>  =0A=
>  	if (!p)=0A=
>  		return NULL;=0A=
> @@ -189,22 +288,39 @@ struct qbman_swp *qbman_swp_init(const struct qbman=
_swp_desc *d)=0A=
>  	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000)=0A=
>  		memset(p->addr_cena, 0, 64 * 1024);=0A=
>  =0A=
> -	reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,=0A=
> -				1, /* Writes Non-cacheable */=0A=
> -				0, /* EQCR_CI stashing threshold */=0A=
> -				3, /* RPM: Valid bit mode, RCR in array mode */=0A=
> -				2, /* DCM: Discrete consumption ack mode */=0A=
> -				3, /* EPM: Valid bit mode, EQCR in array mode */=0A=
> -				1, /* mem stashing drop enable =3D=3D TRUE */=0A=
> -				1, /* mem stashing priority =3D=3D TRUE */=0A=
> -				1, /* mem stashing enable =3D=3D TRUE */=0A=
> -				1, /* dequeue stashing priority =3D=3D TRUE */=0A=
> -				0, /* dequeue stashing enable =3D=3D FALSE */=0A=
> -				0); /* EQCR_CI stashing priority =3D=3D FALSE */=0A=
> -	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000)=0A=
> +	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {=0A=
> +=0A=
> +		reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,=0A=
> +			0, /* Writes Non-cacheable */=0A=
> +			1, /* EQCR_CI stashing threshold */=0A=
> +			3, /* RPM: RCR in array mode */=0A=
> +			2, /* DCM: Discrete consumption ack */=0A=
> +			0, /* EPM: EQCR in ring mode */=0A=
> +			1, /* mem stashing drop enable */=0A=
> +			1, /* mem stashing priority enable */=0A=
> +			1, /* mem stashing enable */=0A=
> +			1, /* dequeue stashing priority enable */=0A=
> +			0, /* dequeue stashing enable */=0A=
> +			0); /* EQCR_CI stashing priority enable */=0A=
> +	} else {=0A=
> +		reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,=0A=
> +			1, /* Writes Non-cacheable */=0A=
> +			0, /* EQCR_CI stashing threshold */=0A=
> +			3, /* RPM: RCR in array mode */=0A=
> +			2, /* DCM: Discrete consumption ack */=0A=
> +			2, /* EPM: EQCR in ring mode */=0A=
> +			1, /* mem stashing drop enable enable */=0A=
> +			1, /* mem stashing priority enable */=0A=
> +			1, /* mem stashing enable */=0A=
> +			1, /* dequeue stashing priority enable */=0A=
> +			0, /* dequeue stashing enable enable */=0A=
> +			0); /* EQCR_CI stashing priority enable */=0A=
> +	}=0A=
> +	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {=0A=
>  		reg |=3D 1 << SWP_CFG_CPBS_SHIFT | /* memory-backed mode */=0A=
>  		       1 << SWP_CFG_VPM_SHIFT |  /* VDQCR read triggered mode */=0A=
>  		       1 << SWP_CFG_CPM_SHIFT;   /* CR read triggered mode */=0A=
> +	}=0A=
>  =0A=
>  	qbman_write_register(p, QBMAN_CINH_SWP_CFG, reg);=0A=
>  	reg =3D qbman_read_register(p, QBMAN_CINH_SWP_CFG);=0A=
> @@ -225,6 +341,30 @@ struct qbman_swp *qbman_swp_init(const struct qbman_=
swp_desc *d)=0A=
>  	 * applied when dequeues from a specific channel are enabled.=0A=
>  	 */=0A=
>  	qbman_write_register(p, QBMAN_CINH_SWP_SDQCR, 0);=0A=
> +=0A=
> +	p->eqcr.pi_ring_size =3D 8;=0A=
> +	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {=0A=
> +		p->eqcr.pi_ring_size =3D 32;=0A=
> +		qbman_swp_enqueue_ring_mode_ptr =3D=0A=
> +			qbman_swp_enqueue_ring_mode_mem_back;=0A=
> +		qbman_swp_enqueue_multiple_ptr =3D=0A=
> +			qbman_swp_enqueue_multiple_mem_back;=0A=
> +		qbman_swp_enqueue_multiple_desc_ptr =3D=0A=
> +			qbman_swp_enqueue_multiple_desc_mem_back;=0A=
> +		qbman_swp_pull_ptr =3D qbman_swp_pull_mem_back;=0A=
> +		qbman_swp_dqrr_next_ptr =3D qbman_swp_dqrr_next_mem_back;=0A=
> +		qbman_swp_release_ptr =3D qbman_swp_release_mem_back;=0A=
> +	}=0A=
> +=0A=
> +	for (mask_size =3D p->eqcr.pi_ring_size; mask_size > 0; mask_size >>=3D=
 1)=0A=
> +		p->eqcr.pi_ci_mask =3D (p->eqcr.pi_ci_mask << 1) + 1;=0A=
> +	eqcr_pi =3D qbman_read_register(p, QBMAN_CINH_SWP_EQCR_PI);=0A=
> +	p->eqcr.pi =3D eqcr_pi & p->eqcr.pi_ci_mask;=0A=
> +	p->eqcr.pi_vb =3D eqcr_pi & QB_VALID_BIT;=0A=
> +	p->eqcr.ci =3D qbman_read_register(p, QBMAN_CINH_SWP_EQCR_CI)=0A=
> +			& p->eqcr.pi_ci_mask;=0A=
> +	p->eqcr.available =3D p->eqcr.pi_ring_size;=0A=
> +=0A=
>  	return p;=0A=
>  }=0A=
>  =0A=
> @@ -378,6 +518,7 @@ enum qb_enqueue_commands {=0A=
>  #define QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT      2=0A=
>  #define QB_ENQUEUE_CMD_IRQ_ON_DISPATCH_SHIFT 3=0A=
>  #define QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT     4=0A=
> +#define QB_ENQUEUE_CMD_DCA_EN_SHIFT          7=0A=
>  =0A=
>  /**=0A=
>   * qbman_eq_desc_clear() - Clear the contents of a descriptor to=0A=
> @@ -389,6 +530,16 @@ void qbman_eq_desc_clear(struct qbman_eq_desc *d)=0A=
>  }=0A=
>  =0A=
>  /**=0A=
> + * qbman_eq_desc_min_clear() - Clear the contents of a minimal=0A=
> + *			   enqueue descriptor to=0A=
> + *                         default/starting state.=0A=
> + */=0A=
> +void qbman_eq_desc_min_clear(struct qbman_eq_desc_min *d)=0A=
> +{=0A=
> +	memset(d, 0, sizeof(*d));=0A=
> +}=0A=
> +=0A=
> +/**=0A=
>   * qbman_eq_desc_set_no_orp() - Set enqueue descriptor without orp=0A=
>   * @d:                the enqueue descriptor.=0A=
>   * @response_success: 1 =3D enqueue with response always; 0 =3D enqueue =
with=0A=
> @@ -403,6 +554,22 @@ void qbman_eq_desc_set_no_orp(struct qbman_eq_desc *=
d, int respond_success)=0A=
>  		d->verb |=3D enqueue_rejects_to_fq;=0A=
>  }=0A=
>  =0A=
> +/**=0A=
> + * qbman_eq_desc_set_no_orp_min() - Set minimal enqueue descriptor witho=
ut orp=0A=
> + * @d:                the enqueue descriptor.=0A=
> + * @response_success: 1 =3D enqueue with response always; 0 =3D enqueue =
with=0A=
> + *                    rejections returned on a FQ.=0A=
> + */=0A=
> +void qbman_eq_desc_set_no_orp_min(struct qbman_eq_desc_min *d,=0A=
> +				  int respond_success)=0A=
> +{=0A=
> +	d->verb &=3D ~(1 << QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT);=0A=
> +	if (respond_success)=0A=
> +		d->verb |=3D enqueue_response_always;=0A=
> +	else=0A=
> +		d->verb |=3D enqueue_rejects_to_fq;=0A=
> +}=0A=
> +=0A=
>  /*=0A=
>   * Exactly one of the following descriptor "targets" should be set. (Cal=
ling any=0A=
>   * one of these will replace the effect of any prior call to one of thes=
e.)=0A=
> @@ -422,6 +589,17 @@ void qbman_eq_desc_set_fq(struct qbman_eq_desc *d, u=
32 fqid)=0A=
>  }=0A=
>  =0A=
>  /**=0A=
> + * qbman_eq_desc_set_min_fq() - set the FQ for the minimal enqueue comma=
nd=0A=
> + * @d:    the enqueue descriptor=0A=
> + * @fqid: the id of the frame queue to be enqueued=0A=
> + */=0A=
> +void qbman_eq_desc_set_min_fq(struct qbman_eq_desc_min *d, u32 fqid)=0A=
> +{=0A=
> +	d->verb &=3D ~(1 << QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT);=0A=
> +	d->tgtid =3D cpu_to_le32(fqid);=0A=
> +}=0A=
> +=0A=
> +/**=0A=
>   * qbman_eq_desc_set_qd() - Set Queuing Destination for the enqueue comm=
and=0A=
>   * @d:       the enqueue descriptor=0A=
>   * @qdid:    the id of the queuing destination to be enqueued=0A=
> @@ -453,41 +631,340 @@ static inline void qbman_write_eqcr_am_rt_register=
(struct qbman_swp *p,=0A=
>  				     QMAN_RT_MODE);=0A=
>  }=0A=
>  =0A=
> +#define QB_RT_BIT ((u32)0x100)=0A=
>  /**=0A=
> - * qbman_swp_enqueue() - Issue an enqueue command=0A=
> + * qbman_swp_enqueue_ring_mode_direct() - Issue an enqueue command=0A=
>   * @s:  the software portal used for enqueue=0A=
>   * @d:  the enqueue descriptor=0A=
>   * @fd: the frame descriptor to be enqueued=0A=
>   *=0A=
> - * Please note that 'fd' should only be NULL if the "action" of the=0A=
> - * descriptor is "orp_hole" or "orp_nesn".=0A=
> + * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.=0A=
> + */=0A=
> +static=0A=
> +int qbman_swp_enqueue_ring_mode_direct(struct qbman_swp *s,=0A=
> +				       const struct qbman_eq_desc *d,=0A=
> +				       const struct dpaa2_fd *fd)=0A=
> +{=0A=
> +	int flags =3D 0;=0A=
> +	int ret =3D qbman_swp_enqueue_multiple_direct(s, d, fd, &flags, 1);=0A=
> +=0A=
> +	if (ret >=3D 0)=0A=
> +		ret =3D 0;=0A=
> +	else=0A=
> +		ret =3D -EBUSY;=0A=
> +	return  ret;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_enqueue_ring_mode_mem_back() - Issue an enqueue command=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  the enqueue descriptor=0A=
> + * @fd: the frame descriptor to be enqueued=0A=
>   *=0A=
>   * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.=0A=
>   */=0A=
> -int qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d=
,=0A=
> -		      const struct dpaa2_fd *fd)=0A=
> +static=0A=
> +int qbman_swp_enqueue_ring_mode_mem_back(struct qbman_swp *s,=0A=
> +					 const struct qbman_eq_desc *d,=0A=
> +					 const struct dpaa2_fd *fd)=0A=
>  {=0A=
> -	struct qbman_eq_desc *p;=0A=
> -	u32 eqar =3D qbman_read_register(s, QBMAN_CINH_SWP_EQAR);=0A=
> +	int flags =3D 0;=0A=
> +	int ret =3D qbman_swp_enqueue_multiple_mem_back(s, d, fd, &flags, 1);=
=0A=
>  =0A=
> -	if (!EQAR_SUCCESS(eqar))=0A=
> -		return -EBUSY;=0A=
> +	if (ret >=3D 0)=0A=
> +		ret =3D 0;=0A=
> +	else=0A=
> +		ret =3D -EBUSY;=0A=
> +	return  ret;=0A=
> +}=0A=
>  =0A=
> -	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));=0A=
> -	memcpy(&p->dca, &d->dca, 31);=0A=
> -	memcpy(&p->fd, fd, sizeof(*fd));=0A=
> +/**=0A=
> + * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command=
=0A=
> + * using one enqueue descriptor=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  the enqueue descriptor=0A=
> + * @fd: table pointer of frame descriptor table to be enqueued=0A=
> + * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NU=
LL=0A=
> + * @num_frames: number of fd to be enqueued=0A=
> + *=0A=
> + * Return the number of fd enqueued, or a negative error number.=0A=
> + */=0A=
> +static=0A=
> +int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,=0A=
> +				      const struct qbman_eq_desc *d,=0A=
> +				      const struct dpaa2_fd *fd,=0A=
> +				      uint32_t *flags,=0A=
> +				      int num_frames)=0A=
> +{=0A=
> +	uint32_t *p =3D NULL;=0A=
> +	const uint32_t *cl =3D (uint32_t *)d;=0A=
> +	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;=0A=
> +	int i, num_enqueued =3D 0;=0A=
> +=0A=
> +	half_mask =3D (s->eqcr.pi_ci_mask>>1);=0A=
> +	full_mask =3D s->eqcr.pi_ci_mask;=0A=
> +=0A=
> +	if (!s->eqcr.available) {=0A=
> +		eqcr_ci =3D s->eqcr.ci;=0A=
> +		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;=0A=
> +		s->eqcr.ci =3D __raw_readl(p) & full_mask;=0A=
> +=0A=
> +		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,=0A=
> +					eqcr_ci, s->eqcr.ci);=0A=
> +		if (!s->eqcr.available)=0A=
> +			return 0;=0A=
> +	}=0A=
>  =0A=
> -	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {=0A=
> -		/* Set the verb byte, have to substitute in the valid-bit */=0A=
> -		dma_wmb();=0A=
> -		p->verb =3D d->verb | EQAR_VB(eqar);=0A=
> -	} else {=0A=
> -		p->verb =3D d->verb | EQAR_VB(eqar);=0A=
> -		dma_wmb();=0A=
> -		qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	num_enqueued =3D (s->eqcr.available < num_frames) ?=0A=
> +			s->eqcr.available : num_frames;=0A=
> +	s->eqcr.available -=3D num_enqueued;=0A=
> +	/* Fill in the EQCR ring */=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		/* Skip copying the verb */=0A=
> +		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);=0A=
> +		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],=0A=
> +		       &fd[i], sizeof(*fd));=0A=
> +		eqcr_pi++;=0A=
>  	}=0A=
>  =0A=
> -	return 0;=0A=
> +	dma_wmb();=0A=
> +=0A=
> +	/* Set the verb byte, have to substitute in the valid-bit */=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		p[0] =3D cl[0] | s->eqcr.pi_vb;=0A=
> +		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {=0A=
> +			struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;=0A=
> +=0A=
> +			d->dca =3D (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |=0A=
> +				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);=0A=
> +		}=0A=
> +		eqcr_pi++;=0A=
> +		if (!(eqcr_pi & half_mask))=0A=
> +			s->eqcr.pi_vb ^=3D QB_VALID_BIT;=0A=
> +	}=0A=
> +=0A=
> +	s->eqcr.pi =3D (s->eqcr.pi + num_enqueued) & full_mask;=0A=
> +=0A=
> +	return num_enqueued;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_enqueue_multiple_mem_back() - Issue a multi enqueue command=
=0A=
> + * using one enqueue descriptor=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  the enqueue descriptor=0A=
> + * @fd: table pointer of frame descriptor table to be enqueued=0A=
> + * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NU=
LL=0A=
> + * @num_frames: number of fd to be enqueued=0A=
> + *=0A=
> + * Return the number of fd enqueued, or a negative error number.=0A=
> + */=0A=
> +static=0A=
> +int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,=0A=
> +					const struct qbman_eq_desc *d,=0A=
> +					const struct dpaa2_fd *fd,=0A=
> +					uint32_t *flags,=0A=
> +					int num_frames)=0A=
> +{=0A=
> +	uint32_t *p =3D NULL;=0A=
> +	const uint32_t *cl =3D (uint32_t *)(d);=0A=
> +	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;=0A=
> +	int i, num_enqueued =3D 0;=0A=
> +	unsigned long irq_flags;=0A=
> +=0A=
> +	spin_lock(&s->access_spinlock);=0A=
> +	local_irq_save(irq_flags);=0A=
> +=0A=
> +	half_mask =3D (s->eqcr.pi_ci_mask>>1);=0A=
> +	full_mask =3D s->eqcr.pi_ci_mask;=0A=
> +	if (!s->eqcr.available) {=0A=
> +		eqcr_ci =3D s->eqcr.ci;=0A=
> +		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI_MEMBACK;=0A=
> +		s->eqcr.ci =3D __raw_readl(p) & full_mask;=0A=
> +		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,=0A=
> +					eqcr_ci, s->eqcr.ci);=0A=
> +		if (!s->eqcr.available) {=0A=
> +			local_irq_restore(irq_flags);=0A=
> +			spin_unlock(&s->access_spinlock);=0A=
> +			return 0;=0A=
> +		}=0A=
> +	}=0A=
> +=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	num_enqueued =3D (s->eqcr.available < num_frames) ?=0A=
> +			s->eqcr.available : num_frames;=0A=
> +	s->eqcr.available -=3D num_enqueued;=0A=
> +	/* Fill in the EQCR ring */=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		/* Skip copying the verb */=0A=
> +		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);=0A=
> +		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],=0A=
> +		       &fd[i], sizeof(*fd));=0A=
> +		eqcr_pi++;=0A=
> +	}=0A=
> +=0A=
> +	/* Set the verb byte, have to substitute in the valid-bit */=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		p[0] =3D cl[0] | s->eqcr.pi_vb;=0A=
> +		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {=0A=
> +			struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;=0A=
> +=0A=
> +			d->dca =3D (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |=0A=
> +				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);=0A=
> +		}=0A=
> +		eqcr_pi++;=0A=
> +		if (!(eqcr_pi & half_mask))=0A=
> +			s->eqcr.pi_vb ^=3D QB_VALID_BIT;=0A=
> +	}=0A=
> +	s->eqcr.pi =3D eqcr_pi & full_mask;=0A=
> +=0A=
> +	dma_wmb();=0A=
> +	qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,=0A=
> +				(QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);=0A=
> +	local_irq_restore(irq_flags);=0A=
> +	spin_unlock(&s->access_spinlock);=0A=
> +=0A=
> +	return num_enqueued;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_enqueue_multiple_desc_direct() - Issue a multi enqueue comm=
and=0A=
> + * using multiple enqueue descriptor=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  table of minimal enqueue descriptor=0A=
> + * @fd: table pointer of frame descriptor table to be enqueued=0A=
> + * @num_frames: number of fd to be enqueued=0A=
> + *=0A=
> + * Return the number of fd enqueued, or a negative error number.=0A=
> + */=0A=
> +static=0A=
> +int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,=0A=
> +					   const struct qbman_eq_desc_min *d,=0A=
> +					   const struct dpaa2_fd *fd,=0A=
> +					   int num_frames)=0A=
> +{=0A=
> +	uint32_t *p;=0A=
> +	const uint32_t *cl;=0A=
> +	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;=0A=
> +	int i, num_enqueued =3D 0;=0A=
> +=0A=
> +	half_mask =3D (s->eqcr.pi_ci_mask>>1);=0A=
> +	full_mask =3D s->eqcr.pi_ci_mask;=0A=
> +	if (!s->eqcr.available) {=0A=
> +		eqcr_ci =3D s->eqcr.ci;=0A=
> +		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;=0A=
> +		s->eqcr.ci =3D __raw_readl(p) & full_mask;=0A=
> +		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,=0A=
> +					eqcr_ci, s->eqcr.ci);=0A=
> +		if (!s->eqcr.available)=0A=
> +			return 0;=0A=
> +	}=0A=
> +=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	num_enqueued =3D (s->eqcr.available < num_frames) ?=0A=
> +			s->eqcr.available : num_frames;=0A=
> +	s->eqcr.available -=3D num_enqueued;=0A=
> +	/* Fill in the EQCR ring */=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		cl =3D (uint32_t *)(&d[i]);=0A=
> +		/* Skip copying the verb */=0A=
> +		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);=0A=
> +		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],=0A=
> +		       &fd[i], sizeof(*fd));=0A=
> +		eqcr_pi++;=0A=
> +	}=0A=
> +=0A=
> +	dma_wmb();=0A=
> +=0A=
> +	/* Set the verb byte, have to substitute in the valid-bit */=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		cl =3D (uint32_t *)(&d[i]);=0A=
> +		p[0] =3D cl[0] | s->eqcr.pi_vb;=0A=
> +		eqcr_pi++;=0A=
> +		if (!(eqcr_pi & half_mask))=0A=
> +			s->eqcr.pi_vb ^=3D QB_VALID_BIT;=0A=
> +	}=0A=
> +	s->eqcr.pi =3D (s->eqcr.pi + num_enqueued) & full_mask;=0A=
> +=0A=
> +	return num_enqueued;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_enqueue_multiple_desc_mem_back() - Issue a multi enqueue co=
mmand=0A=
> + * using multiple enqueue descriptor=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  table of minimal enqueue descriptor=0A=
> + * @fd: table pointer of frame descriptor table to be enqueued=0A=
> + * @num_frames: number of fd to be enqueued=0A=
> + *=0A=
> + * Return the number of fd enqueued, or a negative error number.=0A=
> + */=0A=
> +static=0A=
> +int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,=0A=
> +					     const struct qbman_eq_desc_min *d,=0A=
> +					     const struct dpaa2_fd *fd,=0A=
> +					     int num_frames)=0A=
> +{=0A=
> +	uint32_t *p;=0A=
> +	const uint32_t *cl;=0A=
> +	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;=0A=
> +	int i, num_enqueued =3D 0;=0A=
> +=0A=
> +	half_mask =3D (s->eqcr.pi_ci_mask>>1);=0A=
> +	full_mask =3D s->eqcr.pi_ci_mask;=0A=
> +	if (!s->eqcr.available) {=0A=
> +		eqcr_ci =3D s->eqcr.ci;=0A=
> +		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI_MEMBACK;=0A=
> +		s->eqcr.ci =3D __raw_readl(p) & full_mask;=0A=
> +		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,=0A=
> +					eqcr_ci, s->eqcr.ci);=0A=
> +		if (!s->eqcr.available)=0A=
> +			return 0;=0A=
> +	}=0A=
> +=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	num_enqueued =3D (s->eqcr.available < num_frames) ?=0A=
> +			s->eqcr.available : num_frames;=0A=
> +	s->eqcr.available -=3D num_enqueued;=0A=
> +	/* Fill in the EQCR ring */=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		cl =3D (uint32_t *)(&d[i]);=0A=
> +		/* Skip copying the verb */=0A=
> +		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);=0A=
> +		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],=0A=
> +		       &fd[i], sizeof(*fd));=0A=
> +		eqcr_pi++;=0A=
> +	}=0A=
> +=0A=
> +	/* Set the verb byte, have to substitute in the valid-bit */=0A=
> +	eqcr_pi =3D s->eqcr.pi;=0A=
> +	for (i =3D 0; i < num_enqueued; i++) {=0A=
> +		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));=0A=
> +		cl =3D (uint32_t *)(&d[i]);=0A=
> +		p[0] =3D cl[0] | s->eqcr.pi_vb;=0A=
> +		eqcr_pi++;=0A=
> +		if (!(eqcr_pi & half_mask))=0A=
> +			s->eqcr.pi_vb ^=3D QB_VALID_BIT;=0A=
> +	}=0A=
> +=0A=
> +	s->eqcr.pi =3D eqcr_pi & full_mask;=0A=
> +=0A=
> +	dma_wmb();=0A=
> +	qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,=0A=
> +				(QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);=0A=
> +=0A=
> +	return num_enqueued;=0A=
>  }=0A=
>  =0A=
>  /* Static (push) dequeue */=0A=
> @@ -645,7 +1122,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_d=
esc *d, u32 chid,=0A=
>  }=0A=
>  =0A=
>  /**=0A=
> - * qbman_swp_pull() - Issue the pull dequeue command=0A=
> + * qbman_swp_pull_direct() - Issue the pull dequeue command=0A=
>   * @s: the software portal object=0A=
>   * @d: the software portal descriptor which has been configured with=0A=
>   *     the set of qbman_pull_desc_set_*() calls=0A=
> @@ -653,7 +1130,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_d=
esc *d, u32 chid,=0A=
>   * Return 0 for success, and -EBUSY if the software portal is not ready=
=0A=
>   * to do pull dequeue.=0A=
>   */=0A=
> -int qbman_swp_pull(struct qbman_swp *s, struct qbman_pull_desc *d)=0A=
> +static int qbman_swp_pull_direct(struct qbman_swp *s, struct qbman_pull_=
desc *d)=0A=
>  {=0A=
>  	struct qbman_pull_desc *p;=0A=
>  =0A=
> @@ -671,18 +1148,48 @@ int qbman_swp_pull(struct qbman_swp *s, struct qbm=
an_pull_desc *d)=0A=
>  	p->dq_src =3D d->dq_src;=0A=
>  	p->rsp_addr =3D d->rsp_addr;=0A=
>  	p->rsp_addr_virt =3D d->rsp_addr_virt;=0A=
> +	dma_wmb();=0A=
> +	/* Set the verb byte, have to substitute in the valid-bit */=0A=
> +	p->verb =3D d->verb | s->vdq.valid_bit;=0A=
> +	s->vdq.valid_bit ^=3D QB_VALID_BIT;=0A=
>  =0A=
> -	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {=0A=
> -		dma_wmb();=0A=
> -		/* Set the verb byte, have to substitute in the valid-bit */=0A=
> -		p->verb =3D d->verb | s->vdq.valid_bit;=0A=
> -		s->vdq.valid_bit ^=3D QB_VALID_BIT;=0A=
> -	} else {=0A=
> -		p->verb =3D d->verb | s->vdq.valid_bit;=0A=
> -		s->vdq.valid_bit ^=3D QB_VALID_BIT;=0A=
> -		dma_wmb();=0A=
> -		qbman_write_register(s, QBMAN_CINH_SWP_VDQCR_RT, QMAN_RT_MODE);=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_pull_mem_back() - Issue the pull dequeue command=0A=
> + * @s: the software portal object=0A=
> + * @d: the software portal descriptor which has been configured with=0A=
> + *     the set of qbman_pull_desc_set_*() calls=0A=
> + *=0A=
> + * Return 0 for success, and -EBUSY if the software portal is not ready=
=0A=
> + * to do pull dequeue.=0A=
> + */=0A=
> +static int qbman_swp_pull_mem_back(struct qbman_swp *s,=0A=
> +				   struct qbman_pull_desc *d)=0A=
> +{=0A=
> +	struct qbman_pull_desc *p;=0A=
> +=0A=
> +	if (!atomic_dec_and_test(&s->vdq.available)) {=0A=
> +		atomic_inc(&s->vdq.available);=0A=
> +		return -EBUSY;=0A=
>  	}=0A=
> +	s->vdq.storage =3D (void *)(uintptr_t)d->rsp_addr_virt;=0A=
> +	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)=0A=
> +		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR);=0A=
> +	else=0A=
> +		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR_MEM);=0A=
> +	p->numf =3D d->numf;=0A=
> +	p->tok =3D QMAN_DQ_TOKEN_VALID;=0A=
> +	p->dq_src =3D d->dq_src;=0A=
> +	p->rsp_addr =3D d->rsp_addr;=0A=
> +	p->rsp_addr_virt =3D d->rsp_addr_virt;=0A=
> +=0A=
> +	/* Set the verb byte, have to substitute in the valid-bit */=0A=
> +	p->verb =3D d->verb | s->vdq.valid_bit;=0A=
> +	s->vdq.valid_bit ^=3D QB_VALID_BIT;=0A=
> +	dma_wmb();=0A=
> +	qbman_write_register(s, QBMAN_CINH_SWP_VDQCR_RT, QMAN_RT_MODE);=0A=
>  =0A=
>  	return 0;=0A=
>  }=0A=
> @@ -690,14 +1197,14 @@ int qbman_swp_pull(struct qbman_swp *s, struct qbm=
an_pull_desc *d)=0A=
>  #define QMAN_DQRR_PI_MASK   0xf=0A=
>  =0A=
>  /**=0A=
> - * qbman_swp_dqrr_next() - Get an valid DQRR entry=0A=
> + * qbman_swp_dqrr_next_direct() - Get an valid DQRR entry=0A=
>   * @s: the software portal object=0A=
>   *=0A=
>   * Return NULL if there are no unconsumed DQRR entries. Return a DQRR en=
try=0A=
>   * only once, so repeated calls can return a sequence of DQRR entries, w=
ithout=0A=
>   * requiring they be consumed immediately or in any particular order.=0A=
>   */=0A=
> -const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbman_swp *s)=0A=
> +const struct dpaa2_dq *qbman_swp_dqrr_next_direct(struct qbman_swp *s)=
=0A=
>  {=0A=
>  	u32 verb;=0A=
>  	u32 response_verb;=0A=
> @@ -740,10 +1247,7 @@ const struct dpaa2_dq *qbman_swp_dqrr_next(struct q=
bman_swp *s)=0A=
>  				       QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));=0A=
>  	}=0A=
>  =0A=
> -	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)=0A=
> -		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx));=0A=
> -	else=0A=
> -		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR_MEM(s->dqrr.next_idx));=0A=
> +	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx));=0A=
>  	verb =3D p->dq.verb;=0A=
>  =0A=
>  	/*=0A=
> @@ -785,6 +1289,98 @@ const struct dpaa2_dq *qbman_swp_dqrr_next(struct q=
bman_swp *s)=0A=
>  }=0A=
>  =0A=
>  /**=0A=
> + * qbman_swp_dqrr_next_mem_back() - Get an valid DQRR entry=0A=
> + * @s: the software portal object=0A=
> + *=0A=
> + * Return NULL if there are no unconsumed DQRR entries. Return a DQRR en=
try=0A=
> + * only once, so repeated calls can return a sequence of DQRR entries, w=
ithout=0A=
> + * requiring they be consumed immediately or in any particular order.=0A=
> + */=0A=
> +const struct dpaa2_dq *qbman_swp_dqrr_next_mem_back(struct qbman_swp *s)=
=0A=
> +{=0A=
> +	u32 verb;=0A=
> +	u32 response_verb;=0A=
> +	u32 flags;=0A=
> +	struct dpaa2_dq *p;=0A=
> +=0A=
> +	/* Before using valid-bit to detect if something is there, we have to=
=0A=
> +	 * handle the case of the DQRR reset bug...=0A=
> +	 */=0A=
> +	if (unlikely(s->dqrr.reset_bug)) {=0A=
> +		/*=0A=
> +		 * We pick up new entries by cache-inhibited producer index,=0A=
> +		 * which means that a non-coherent mapping would require us to=0A=
> +		 * invalidate and read *only* once that PI has indicated that=0A=
> +		 * there's an entry here. The first trip around the DQRR ring=0A=
> +		 * will be much less efficient than all subsequent trips around=0A=
> +		 * it...=0A=
> +		 */=0A=
> +		u8 pi =3D qbman_read_register(s, QBMAN_CINH_SWP_DQPI) &=0A=
> +			QMAN_DQRR_PI_MASK;=0A=
> +=0A=
> +		/* there are new entries if pi !=3D next_idx */=0A=
> +		if (pi =3D=3D s->dqrr.next_idx)=0A=
> +			return NULL;=0A=
> +=0A=
> +		/*=0A=
> +		 * if next_idx is/was the last ring index, and 'pi' is=0A=
> +		 * different, we can disable the workaround as all the ring=0A=
> +		 * entries have now been DMA'd to so valid-bit checking is=0A=
> +		 * repaired. Note: this logic needs to be based on next_idx=0A=
> +		 * (which increments one at a time), rather than on pi (which=0A=
> +		 * can burst and wrap-around between our snapshots of it).=0A=
> +		 */=0A=
> +		if (s->dqrr.next_idx =3D=3D (s->dqrr.dqrr_size - 1)) {=0A=
> +			pr_debug("next_idx=3D%d, pi=3D%d, clear reset bug\n",=0A=
> +				 s->dqrr.next_idx, pi);=0A=
> +			s->dqrr.reset_bug =3D 0;=0A=
> +		}=0A=
> +		prefetch(qbman_get_cmd(s,=0A=
> +				       QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));=0A=
> +	}=0A=
> +=0A=
> +	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR_MEM(s->dqrr.next_idx));=0A=
> +	verb =3D p->dq.verb;=0A=
> +=0A=
> +	/*=0A=
> +	 * If the valid-bit isn't of the expected polarity, nothing there. Note=
,=0A=
> +	 * in the DQRR reset bug workaround, we shouldn't need to skip these=0A=
> +	 * check, because we've already determined that a new entry is availabl=
e=0A=
> +	 * and we've invalidated the cacheline before reading it, so the=0A=
> +	 * valid-bit behaviour is repaired and should tell us what we already=
=0A=
> +	 * knew from reading PI.=0A=
> +	 */=0A=
> +	if ((verb & QB_VALID_BIT) !=3D s->dqrr.valid_bit) {=0A=
> +		prefetch(qbman_get_cmd(s,=0A=
> +			 QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));=0A=
> +		return NULL;=0A=
> +	}=0A=
> +	/*=0A=
> +	 * There's something there. Move "next_idx" attention to the next ring=
=0A=
> +	 * entry (and prefetch it) before returning what we found.=0A=
> +	 */=0A=
> +	s->dqrr.next_idx++;=0A=
> +	s->dqrr.next_idx &=3D s->dqrr.dqrr_size - 1; /* Wrap around */=0A=
> +	if (!s->dqrr.next_idx)=0A=
> +		s->dqrr.valid_bit ^=3D QB_VALID_BIT;=0A=
> +=0A=
> +	/*=0A=
> +	 * If this is the final response to a volatile dequeue command=0A=
> +	 * indicate that the vdq is available=0A=
> +	 */=0A=
> +	flags =3D p->dq.stat;=0A=
> +	response_verb =3D verb & QBMAN_RESULT_MASK;=0A=
> +	if (response_verb =3D=3D QBMAN_RESULT_DQ &&=0A=
> +	    (flags & DPAA2_DQ_STAT_VOLATILE) &&=0A=
> +	    (flags & DPAA2_DQ_STAT_EXPIRED))=0A=
> +		atomic_inc(&s->vdq.available);=0A=
> +=0A=
> +	prefetch(qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));=0A=
> +=0A=
> +	return p;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
>   * qbman_swp_dqrr_consume() -  Consume DQRR entries previously returned =
from=0A=
>   *                             qbman_swp_dqrr_next().=0A=
>   * @s: the software portal object=0A=
> @@ -872,7 +1468,7 @@ void qbman_release_desc_set_rcdi(struct qbman_releas=
e_desc *d, int enable)=0A=
>  #define RAR_SUCCESS(rar) ((rar) & 0x100)=0A=
>  =0A=
>  /**=0A=
> - * qbman_swp_release() - Issue a buffer release command=0A=
> + * qbman_swp_release_direct() - Issue a buffer release command=0A=
>   * @s:           the software portal object=0A=
>   * @d:           the release descriptor=0A=
>   * @buffers:     a pointer pointing to the buffer address to be released=
=0A=
> @@ -880,8 +1476,53 @@ void qbman_release_desc_set_rcdi(struct qbman_relea=
se_desc *d, int enable)=0A=
>   *=0A=
>   * Return 0 for success, -EBUSY if the release command ring is not ready=
.=0A=
>   */=0A=
> -int qbman_swp_release(struct qbman_swp *s, const struct qbman_release_de=
sc *d,=0A=
> -		      const u64 *buffers, unsigned int num_buffers)=0A=
> +int qbman_swp_release_direct(struct qbman_swp *s,=0A=
> +			     const struct qbman_release_desc *d,=0A=
> +			     const u64 *buffers, unsigned int num_buffers)=0A=
> +{=0A=
> +	int i;=0A=
> +	struct qbman_release_desc *p;=0A=
> +	u32 rar;=0A=
> +=0A=
> +	if (!num_buffers || num_buffers > 7)=0A=
> +		return -EINVAL;=0A=
> +=0A=
> +	rar =3D qbman_read_register(s, QBMAN_CINH_SWP_RAR);=0A=
> +	if (!RAR_SUCCESS(rar))=0A=
> +		return -EBUSY;=0A=
> +=0A=
> +	/* Start the release command */=0A=
> +	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)=0A=
> +		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR(RAR_IDX(rar)));=0A=
> +	else=0A=
> +		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR_MEM(RAR_IDX(rar)));=0A=
> +	/* Copy the caller's buffer pointers to the command */=0A=
> +	for (i =3D 0; i < num_buffers; i++)=0A=
> +		p->buf[i] =3D cpu_to_le64(buffers[i]);=0A=
> +	p->bpid =3D d->bpid;=0A=
> +=0A=
> +	/*=0A=
> +	 * Set the verb byte, have to substitute in the valid-bit=0A=
> +	 * and the number of buffers.=0A=
> +	 */=0A=
> +	dma_wmb();=0A=
> +	p->verb =3D d->verb | RAR_VB(rar) | num_buffers;=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_release_mem_back() - Issue a buffer release command=0A=
> + * @s:           the software portal object=0A=
> + * @d:           the release descriptor=0A=
> + * @buffers:     a pointer pointing to the buffer address to be released=
=0A=
> + * @num_buffers: number of buffers to be released,  must be less than 8=
=0A=
> + *=0A=
> + * Return 0 for success, -EBUSY if the release command ring is not ready=
.=0A=
> + */=0A=
> +int qbman_swp_release_mem_back(struct qbman_swp *s,=0A=
> +			       const struct qbman_release_desc *d,=0A=
> +			       const u64 *buffers, unsigned int num_buffers)=0A=
>  {=0A=
>  	int i;=0A=
>  	struct qbman_release_desc *p;=0A=
> @@ -904,19 +1545,10 @@ int qbman_swp_release(struct qbman_swp *s, const s=
truct qbman_release_desc *d,=0A=
>  		p->buf[i] =3D cpu_to_le64(buffers[i]);=0A=
>  	p->bpid =3D d->bpid;=0A=
>  =0A=
> -	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {=0A=
> -		/*=0A=
> -		 * Set the verb byte, have to substitute in the valid-bit=0A=
> -		 * and the number of buffers.=0A=
> -		 */=0A=
> -		dma_wmb();=0A=
> -		p->verb =3D d->verb | RAR_VB(rar) | num_buffers;=0A=
> -	} else {=0A=
> -		p->verb =3D d->verb | RAR_VB(rar) | num_buffers;=0A=
> -		dma_wmb();=0A=
> -		qbman_write_register(s, QBMAN_CINH_SWP_RCR_AM_RT +=0A=
> -				     RAR_IDX(rar)  * 4, QMAN_RT_MODE);=0A=
> -	}=0A=
> +	p->verb =3D d->verb | RAR_VB(rar) | num_buffers;=0A=
> +	dma_wmb();=0A=
> +	qbman_write_register(s, QBMAN_CINH_SWP_RCR_AM_RT +=0A=
> +			     RAR_IDX(rar)  * 4, QMAN_RT_MODE);=0A=
>  =0A=
>  	return 0;=0A=
>  }=0A=
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.h b/drivers/soc/fsl/dpio/q=
bman-portal.h=0A=
> index f3ec5d2..f4b6e47 100644=0A=
> --- a/drivers/soc/fsl/dpio/qbman-portal.h=0A=
> +++ b/drivers/soc/fsl/dpio/qbman-portal.h=0A=
> @@ -9,6 +9,13 @@=0A=
>  =0A=
>  #include <soc/fsl/dpaa2-fd.h>=0A=
>  =0A=
> +#define QMAN_REV_4000   0x04000000=0A=
> +#define QMAN_REV_4100   0x04010000=0A=
> +#define QMAN_REV_4101   0x04010001=0A=
> +#define QMAN_REV_5000   0x05000000=0A=
> +=0A=
> +#define QMAN_REV_MASK   0xffff0000=0A=
> +=0A=
>  struct dpaa2_dq;=0A=
>  struct qbman_swp;=0A=
>  =0A=
> @@ -67,6 +74,22 @@ enum qbman_pull_type_e {=0A=
>  #define QBMAN_FQ_XOFF		0x4e=0A=
>  =0A=
>  /* structure of enqueue descriptor */=0A=
> +struct qbman_eq_desc_min {=0A=
> +	u8 verb;=0A=
> +	u8 dca;=0A=
> +	__le16 seqnum;=0A=
> +	__le16 orpid;=0A=
> +	__le16 reserved1;=0A=
> +	__le32 tgtid;=0A=
> +	__le32 tag;=0A=
> +	__le16 qdbin;=0A=
> +	u8 qpri;=0A=
> +	u8 reserved[3];=0A=
> +	u8 wae;=0A=
> +	u8 rspid;=0A=
> +	__le64 rsp_addr;=0A=
> +};=0A=
> +=0A=
>  struct qbman_eq_desc {=0A=
>  	u8 verb;=0A=
>  	u8 dca;=0A=
> @@ -132,8 +155,48 @@ struct qbman_swp {=0A=
>  		u8 dqrr_size;=0A=
>  		int reset_bug; /* indicates dqrr reset workaround is needed */=0A=
>  	} dqrr;=0A=
> +=0A=
> +	struct {=0A=
> +		u32 pi;=0A=
> +		u32 pi_vb;=0A=
> +		u32 pi_ring_size;=0A=
> +		u32 pi_ci_mask;=0A=
> +		u32 ci;=0A=
> +		int available;=0A=
> +		u32 pend;=0A=
> +		u32 no_pfdr;=0A=
> +	} eqcr;=0A=
> +=0A=
> +	spinlock_t access_spinlock;=0A=
>  };=0A=
>  =0A=
> +/* Function pointers */=0A=
> +extern=0A=
> +int (*qbman_swp_enqueue_ring_mode_ptr)(struct qbman_swp *s,=0A=
> +				       const struct qbman_eq_desc *d,=0A=
> +				       const struct dpaa2_fd *fd);=0A=
> +extern=0A=
> +int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,=0A=
> +				      const struct qbman_eq_desc *d,=0A=
> +				      const struct dpaa2_fd *fd,=0A=
> +				      uint32_t *flags,=0A=
> +				      int num_frames);=0A=
> +extern=0A=
> +int (*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,=0A=
> +					   const struct qbman_eq_desc_min *d,=0A=
> +					   const struct dpaa2_fd *fd,=0A=
> +					   int num_frames);=0A=
> +extern=0A=
> +int (*qbman_swp_pull_ptr)(struct qbman_swp *s, struct qbman_pull_desc *d=
);=0A=
> +extern=0A=
> +const struct dpaa2_dq *(*qbman_swp_dqrr_next_ptr)(struct qbman_swp *s);=
=0A=
> +extern=0A=
> +int (*qbman_swp_release_ptr)(struct qbman_swp *s,=0A=
> +			     const struct qbman_release_desc *d,=0A=
> +			     const u64 *buffers,=0A=
> +			     unsigned int num_buffers);=0A=
> +=0A=
> +/* Functions */=0A=
>  struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d);=0A=
>  void qbman_swp_finish(struct qbman_swp *p);=0A=
>  u32 qbman_swp_interrupt_read_status(struct qbman_swp *p);=0A=
> @@ -158,29 +221,25 @@ void qbman_pull_desc_set_wq(struct qbman_pull_desc =
*d, u32 wqid,=0A=
>  void qbman_pull_desc_set_channel(struct qbman_pull_desc *d, u32 chid,=0A=
>  				 enum qbman_pull_type_e dct);=0A=
>  =0A=
> -int qbman_swp_pull(struct qbman_swp *p, struct qbman_pull_desc *d);=0A=
> -=0A=
> -const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbman_swp *s);=0A=
>  void qbman_swp_dqrr_consume(struct qbman_swp *s, const struct dpaa2_dq *=
dq);=0A=
>  =0A=
>  int qbman_result_has_new_result(struct qbman_swp *p, const struct dpaa2_=
dq *dq);=0A=
>  =0A=
>  void qbman_eq_desc_clear(struct qbman_eq_desc *d);=0A=
> +void qbman_eq_desc_min_clear(struct qbman_eq_desc_min *d);=0A=
>  void qbman_eq_desc_set_no_orp(struct qbman_eq_desc *d, int respond_succe=
ss);=0A=
> +void qbman_eq_desc_set_no_orp_min(struct qbman_eq_desc_min *d,=0A=
> +				  int respond_success);=0A=
>  void qbman_eq_desc_set_token(struct qbman_eq_desc *d, u8 token);=0A=
>  void qbman_eq_desc_set_fq(struct qbman_eq_desc *d, u32 fqid);=0A=
> +void qbman_eq_desc_set_min_fq(struct qbman_eq_desc_min *d, u32 fqid);=0A=
>  void qbman_eq_desc_set_qd(struct qbman_eq_desc *d, u32 qdid,=0A=
>  			  u32 qd_bin, u32 qd_prio);=0A=
>  =0A=
> -int qbman_swp_enqueue(struct qbman_swp *p, const struct qbman_eq_desc *d=
,=0A=
> -		      const struct dpaa2_fd *fd);=0A=
> -=0A=
>  void qbman_release_desc_clear(struct qbman_release_desc *d);=0A=
>  void qbman_release_desc_set_bpid(struct qbman_release_desc *d, u16 bpid)=
;=0A=
>  void qbman_release_desc_set_rcdi(struct qbman_release_desc *d, int enabl=
e);=0A=
>  =0A=
> -int qbman_swp_release(struct qbman_swp *s, const struct qbman_release_de=
sc *d,=0A=
> -		      const u64 *buffers, unsigned int num_buffers);=0A=
>  int qbman_swp_acquire(struct qbman_swp *s, u16 bpid, u64 *buffers,=0A=
>  		      unsigned int num_buffers);=0A=
>  int qbman_swp_alt_fq_state(struct qbman_swp *s, u32 fqid,=0A=
> @@ -194,6 +253,61 @@ void qbman_swp_mc_submit(struct qbman_swp *p, void *=
cmd, u8 cmd_verb);=0A=
>  void *qbman_swp_mc_result(struct qbman_swp *p);=0A=
>  =0A=
>  /**=0A=
> + * qbman_swp_enqueue() - Issue an enqueue command=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  the enqueue descriptor=0A=
> + * @fd: the frame descriptor to be enqueued=0A=
> + *=0A=
> + * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.=0A=
> + */=0A=
> +static inline int=0A=
> +qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,=0A=
> +		  const struct dpaa2_fd *fd)=0A=
> +{=0A=
> +	return qbman_swp_enqueue_ring_mode_ptr(s, d, fd);=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_enqueue_multiple() - Issue a multi enqueue command=0A=
> + * using one enqueue descriptor=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  the enqueue descriptor=0A=
> + * @fd: table pointer of frame descriptor table to be enqueued=0A=
> + * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NU=
LL=0A=
> + * @num_frames: number of fd to be enqueued=0A=
> + *=0A=
> + * Return the number of fd enqueued, or a negative error number.=0A=
> + */=0A=
> +static inline int=0A=
> +qbman_swp_enqueue_multiple(struct qbman_swp *s,=0A=
> +			   const struct qbman_eq_desc *d,=0A=
> +			   const struct dpaa2_fd *fd,=0A=
> +			   uint32_t *flags,=0A=
> +			   int num_frames)=0A=
> +{=0A=
> +	return qbman_swp_enqueue_multiple_ptr(s, d, fd, flags, num_frames);=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_enqueue_multiple_desc() - Issue a multi enqueue command=0A=
> + * using multiple enqueue descriptor=0A=
> + * @s:  the software portal used for enqueue=0A=
> + * @d:  table of minimal enqueue descriptor=0A=
> + * @fd: table pointer of frame descriptor table to be enqueued=0A=
> + * @num_frames: number of fd to be enqueued=0A=
> + *=0A=
> + * Return the number of fd enqueued, or a negative error number.=0A=
> + */=0A=
> +static inline int=0A=
> +qbman_swp_enqueue_multiple_desc(struct qbman_swp *s,=0A=
> +				const struct qbman_eq_desc_min *d,=0A=
> +				const struct dpaa2_fd *fd,=0A=
> +				int num_frames)=0A=
> +{=0A=
> +	return qbman_swp_enqueue_multiple_desc_ptr(s, d, fd, num_frames);=0A=
> +}=0A=
> +=0A=
> +/**=0A=
>   * qbman_result_is_DQ() - check if the dequeue result is a dequeue respo=
nse=0A=
>   * @dq: the dequeue result to be checked=0A=
>   *=0A=
> @@ -504,4 +618,49 @@ int qbman_bp_query(struct qbman_swp *s, u16 bpid,=0A=
>  =0A=
>  u32 qbman_bp_info_num_free_bufs(struct qbman_bp_query_rslt *a);=0A=
>  =0A=
> +/**=0A=
> + * qbman_swp_release() - Issue a buffer release command=0A=
> + * @s:           the software portal object=0A=
> + * @d:           the release descriptor=0A=
> + * @buffers:     a pointer pointing to the buffer address to be released=
=0A=
> + * @num_buffers: number of buffers to be released,  must be less than 8=
=0A=
> + *=0A=
> + * Return 0 for success, -EBUSY if the release command ring is not ready=
.=0A=
> + */=0A=
> +static inline int qbman_swp_release(struct qbman_swp *s,=0A=
> +				    const struct qbman_release_desc *d,=0A=
> +				    const u64 *buffers,=0A=
> +				    unsigned int num_buffers)=0A=
> +{=0A=
> +	return qbman_swp_release_ptr(s, d, buffers, num_buffers);=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_pull() - Issue the pull dequeue command=0A=
> + * @s: the software portal object=0A=
> + * @d: the software portal descriptor which has been configured with=0A=
> + *     the set of qbman_pull_desc_set_*() calls=0A=
> + *=0A=
> + * Return 0 for success, and -EBUSY if the software portal is not ready=
=0A=
> + * to do pull dequeue.=0A=
> + */=0A=
> +static inline int qbman_swp_pull(struct qbman_swp *s,=0A=
> +				 struct qbman_pull_desc *d)=0A=
> +{=0A=
> +	return qbman_swp_pull_ptr(s, d);=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * qbman_swp_dqrr_next() - Get an valid DQRR entry=0A=
> + * @s: the software portal object=0A=
> + *=0A=
> + * Return NULL if there are no unconsumed DQRR entries. Return a DQRR en=
try=0A=
> + * only once, so repeated calls can return a sequence of DQRR entries, w=
ithout=0A=
> + * requiring they be consumed immediately or in any particular order.=0A=
> + */=0A=
> +static inline const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbman_sw=
p *s)=0A=
> +{=0A=
> +	return qbman_swp_dqrr_next_ptr(s);=0A=
> +}=0A=
> +=0A=
>  #endif /* __FSL_QBMAN_PORTAL_H */=0A=
=0A=
=0A=
