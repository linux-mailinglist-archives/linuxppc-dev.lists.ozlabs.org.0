Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 191252D4574
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:32:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrgzK47y7zDqgp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 02:32:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.180.222; helo=9.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 157 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Dec 2020 02:31:01 AEDT
Received: from 9.mo52.mail-out.ovh.net (9.mo52.mail-out.ovh.net
 [87.98.180.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrgxK6W8CzDq9C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 02:31:00 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E87AD221AA3;
 Wed,  9 Dec 2020 16:30:57 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 16:30:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006770f16c1-1227-46f4-b971-904be8e28af8,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
Date: Wed, 9 Dec 2020 16:30:50 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 13/13] powerpc/xive: Improve error reporting of OPAL calls
Message-ID: <20201209163050.46cf2221@bahia.lan>
In-Reply-To: <20201208151124.1329942-14-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-14-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a9162958-9e59-4396-887f-27bbce85211f
X-Ovh-Tracer-Id: 17127470859327216026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 16:11:24 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Introduce a vp_err() macro to standardize error reporting.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/native.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
> index 4902d05ebbd1..42297a131a6e 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -122,6 +122,8 @@ static int xive_native_get_irq_config(u32 hw_irq, u32=
 *target, u8 *prio,
>  	return rc =3D=3D 0 ? 0 : -ENXIO;
>  }
> =20
> +#define vp_err(vp, fmt, ...) pr_err("VP[0x%x]: " fmt, vp, ##__VA_ARGS__)
> +
>  /* This can be called multiple time to change a queue configuration */
>  int xive_native_configure_queue(u32 vp_id, struct xive_q *q, u8 prio,
>  				__be32 *qpage, u32 order, bool can_escalate)
> @@ -149,7 +151,7 @@ int xive_native_configure_queue(u32 vp_id, struct xiv=
e_q *q, u8 prio,
>  				      &esc_irq_be,
>  				      NULL);
>  	if (rc) {
> -		pr_err("Error %lld getting queue info prio %d\n", rc, prio);
> +		vp_err(vp_id, "Failed to get queue %d info : %lld\n", prio, rc);
>  		rc =3D -EIO;
>  		goto fail;
>  	}
> @@ -172,7 +174,7 @@ int xive_native_configure_queue(u32 vp_id, struct xiv=
e_q *q, u8 prio,
>  		msleep(OPAL_BUSY_DELAY_MS);
>  	}
>  	if (rc) {
> -		pr_err("Error %lld setting queue for prio %d\n", rc, prio);
> +		vp_err(vp_id, "Failed to set queue %d info: %lld\n", prio, rc);
>  		rc =3D -EIO;
>  	} else {
>  		/*
> @@ -199,7 +201,7 @@ static void __xive_native_disable_queue(u32 vp_id, st=
ruct xive_q *q, u8 prio)
>  		msleep(OPAL_BUSY_DELAY_MS);
>  	}
>  	if (rc)
> -		pr_err("Error %lld disabling queue for prio %d\n", rc, prio);
> +		vp_err(vp_id, "Failed to disable queue %d : %lld\n", prio, rc);
>  }
> =20
>  void xive_native_disable_queue(u32 vp_id, struct xive_q *q, u8 prio)
> @@ -698,6 +700,8 @@ int xive_native_enable_vp(u32 vp_id, bool single_esca=
lation)
>  			break;
>  		msleep(OPAL_BUSY_DELAY_MS);
>  	}
> +	if (rc)
> +		vp_err(vp_id, "Failed to enable VP : %lld\n", rc);
>  	return rc ? -EIO : 0;
>  }
>  EXPORT_SYMBOL_GPL(xive_native_enable_vp);
> @@ -712,6 +716,8 @@ int xive_native_disable_vp(u32 vp_id)
>  			break;
>  		msleep(OPAL_BUSY_DELAY_MS);
>  	}
> +	if (rc)
> +		vp_err(vp_id, "Failed to disable VP : %lld\n", rc);
>  	return rc ? -EIO : 0;
>  }
>  EXPORT_SYMBOL_GPL(xive_native_disable_vp);
> @@ -723,8 +729,10 @@ int xive_native_get_vp_info(u32 vp_id, u32 *out_cam_=
id, u32 *out_chip_id)
>  	s64 rc;
> =20
>  	rc =3D opal_xive_get_vp_info(vp_id, NULL, &vp_cam_be, NULL, &vp_chip_id=
_be);
> -	if (rc)
> +	if (rc) {
> +		vp_err(vp_id, "Failed to get VP info : %lld\n", rc);
>  		return -EIO;
> +	}
>  	*out_cam_id =3D be64_to_cpu(vp_cam_be) & 0xffffffffu;
>  	*out_chip_id =3D be32_to_cpu(vp_chip_id_be);
> =20
> @@ -755,8 +763,7 @@ int xive_native_get_queue_info(u32 vp_id, u32 prio,
>  	rc =3D opal_xive_get_queue_info(vp_id, prio, &qpage, &qsize,
>  				      &qeoi_page, &escalate_irq, &qflags);
>  	if (rc) {
> -		pr_err("OPAL failed to get queue info for VCPU %d/%d : %lld\n",
> -		       vp_id, prio, rc);
> +		vp_err(vp_id, "failed to get queue %d info : %lld\n", prio, rc);
>  		return -EIO;
>  	}
> =20
> @@ -784,8 +791,7 @@ int xive_native_get_queue_state(u32 vp_id, u32 prio, =
u32 *qtoggle, u32 *qindex)
>  	rc =3D opal_xive_get_queue_state(vp_id, prio, &opal_qtoggle,
>  				       &opal_qindex);
>  	if (rc) {
> -		pr_err("OPAL failed to get queue state for VCPU %d/%d : %lld\n",
> -		       vp_id, prio, rc);
> +		vp_err(vp_id, "failed to get queue %d state : %lld\n", prio, rc);
>  		return -EIO;
>  	}
> =20
> @@ -804,8 +810,7 @@ int xive_native_set_queue_state(u32 vp_id, u32 prio, =
u32 qtoggle, u32 qindex)
> =20
>  	rc =3D opal_xive_set_queue_state(vp_id, prio, qtoggle, qindex);
>  	if (rc) {
> -		pr_err("OPAL failed to set queue state for VCPU %d/%d : %lld\n",
> -		       vp_id, prio, rc);
> +		vp_err(vp_id, "failed to set queue %d state : %lld\n", prio, rc);
>  		return -EIO;
>  	}
> =20
> @@ -827,8 +832,7 @@ int xive_native_get_vp_state(u32 vp_id, u64 *out_stat=
e)
> =20
>  	rc =3D opal_xive_get_vp_state(vp_id, &state);
>  	if (rc) {
> -		pr_err("OPAL failed to get vp state for VCPU %d : %lld\n",
> -		       vp_id, rc);
> +		vp_err(vp_id, "failed to get vp state : %lld\n", rc);
>  		return -EIO;
>  	}
> =20

