Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB7B34558B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Frv2zw6z3c8T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:37:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=JqVG9Oh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=JqVG9Oh2; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Fq41J6Sz30Bw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:35:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4Fq309lCz9sW1; Tue, 23 Mar 2021 13:35:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616466959;
 bh=2kfSreEfH+nJfxXsLlaxLYjo4wAQxD2RREwfr0zjpFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JqVG9Oh2f2CXMez/zZjE68LyCMKvWlgO8VuVu/Ib6QG7foxFyPohqeX+igs7T9n7q
 f4mix3uf4m8mhf+nC6u1ZPN6cokMMvHCeiUiWREXCWda3g4X0EW5HFFlDX26TDjPmM
 9jAqDQ3zBI5v/YyLd/qN8jEcVlZ/vdBXG3IaS10Y=
Date: Tue, 23 Mar 2021 13:34:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v6 5/6] KVM: PPC: Book3S HV: Add
 KVM_CAP_PPC_RPT_INVALIDATE capability
Message-ID: <YFlTs/G9oKqJbBKN@yekko.fritz.box>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-6-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R/F4QHJkQivBKsaB"
Content-Disposition: inline
In-Reply-To: <20210311083939.595568-6-bharata@linux.ibm.com>
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--R/F4QHJkQivBKsaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:09:38PM +0530, Bharata B Rao wrote:
> Now that we have H_RPT_INVALIDATE fully implemented, enable
> support for the same via KVM_CAP_PPC_RPT_INVALIDATE KVM capability
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
>  arch/powerpc/kvm/powerpc.c     |  3 +++
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 22 insertions(+)
>=20
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 1a2b5210cdbf..d769cef5f904 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6227,6 +6227,24 @@ KVM_RUN_BUS_LOCK flag is used to distinguish betwe=
en them.
>  This capability can be used to check / enable 2nd DAWR feature provided
>  by POWER10 processor.
> =20
> +7.24 KVM_CAP_PPC_RPT_INVALIDATE
> +------------------------------
> +
> +:Capability: KVM_CAP_PPC_RPT_INVALIDATE
> +:Architectures: ppc
> +:Type: vm
> +
> +This capability indicates that the kernel is capable of handling
> +H_RPT_INVALIDATE hcall.
> +
> +In order to enable the use of H_RPT_INVALIDATE in the guest,
> +user space might have to advertise it for the guest. For example,
> +IBM pSeries (sPAPR) guest starts using it if "hcall-rpt-invalidate" is
> +present in the "ibm,hypertas-functions" device-tree property.
> +
> +This capability is enabled for hypervisors on platforms like POWER9
> +that support radix MMU.
> +
>  8. Other capabilities.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index a2a68a958fa0..be33b5321a76 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -682,6 +682,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>  		r =3D !!(hv_enabled && kvmppc_hv_ops->enable_dawr1 &&
>  		       !kvmppc_hv_ops->enable_dawr1(NULL));
>  		break;
> +	case KVM_CAP_PPC_RPT_INVALIDATE:
> +		r =3D 1;
> +		break;
>  #endif
>  	default:
>  		r =3D 0;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index f6afee209620..2b2370475cec 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1078,6 +1078,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_DIRTY_LOG_RING 192
>  #define KVM_CAP_X86_BUS_LOCK_EXIT 193
>  #define KVM_CAP_PPC_DAWR1 194
> +#define KVM_CAP_PPC_RPT_INVALIDATE 195
> =20
>  #ifdef KVM_CAP_IRQ_ROUTING
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R/F4QHJkQivBKsaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZU7MACgkQbDjKyiDZ
s5JhIhAAz+EYMl6D7R/Sq629K/gEpJd5rxo0oL5r/Sc+R1c5cU28JcsYsPp3LIt2
6ivj3BJmMytPTbLINEQsO07D/6JrpxSvDwpuDn9LnB7YlQxE5H+9Qod+fZjvVY7D
Q81FaWpWjGC1IUecPAortygI2jTff+2k4KbnceuwPo5mBNP/ej2oYxELsHkbWIUd
MhlCLcK/n6MUX24XlcnhmKVN0ymNBSt6WLIb94kE4Oxz4d29IaWKWNXY1z+uOYyJ
0fIfjn+JnHKM3wEiutUpT6Sxf2Dr0FdFVRZtOHuxJsOk152FBDIjohPHGPsA2BLj
vo5rzWialNHFsqVjRIm5QeOMMAPBNVZ8zmJFr3SkAfHw8Kra2z91BLuDBF6fddKe
GK4nxHYf+STJx1DE8xWbMaDjz0bQPu8/uJ5+lg3OGlRyLqRhS/82BLeJ5LgJpMxA
lflMa78/Cct5a5n6LYVH7mej2jzzjhq8AZrz08eS5FISetVtLa6Mnqbi3sF8twcF
5F9/Lys/tW54ACCEulXEEQl7u/kMqLmzhZyWZOfs4UrzhmvGCnisQp+xjhjzLqx5
OuosdjyjaB/TyOixxtX2aVD0jgBSMV80CPbs8oHAabvPrmOnrApd0It1zA7NZtZZ
CIM1fM3Eb8CSniZSgO3kuEGKrBMtHg2z27FpzZY6MjqDDoSdQF8=
=rB5k
-----END PGP SIGNATURE-----

--R/F4QHJkQivBKsaB--
