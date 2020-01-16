Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CF13D35A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 06:00:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ysTC2MqnzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ysQt0SXjzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 15:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LcaXjkOr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47ysQs2jvlz9sPW;
 Thu, 16 Jan 2020 15:58:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579150709;
 bh=JxlO1rgBDYN8W6HNpku5cZsQeSFL+dg1CVmFK2aM6ks=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LcaXjkOrBiwzsSk1Y3Dln9PtY+4Xl9I01VKPEaRCP1+pPDze+jtD7off7rs778UO3
 mou3PcoJiMRY2DGrbcEqCbVUu5CF1YGgJVVuEDDeTxkcPgtNokFqdUxcYvkzdowEY2
 Yf9pBynMV+ofhskkHzGzMM05LGuQvrkpYUMExV1zTiCqiIVj5DeNLjTh+yhXcsmE4P
 vRsVc32Mko2fyWqg1dOliAealT1dVBlL5ha4BV6rYHsQ5+O9ZlWO8eGiYD+LepG+Dl
 bYJ+NziBVIaqK8I3I0YojgpckrBXML+0AHl8Vcyu+4U0FbmukbD/FQNOdnBMoznDBx
 RskCREebatXrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 4/5] powerpc/numa: Early request for home node
 associativity
In-Reply-To: <20191216144904.6776-5-srikar@linux.vnet.ibm.com>
References: <20191216144904.6776-1-srikar@linux.vnet.ibm.com>
 <20191216144904.6776-5-srikar@linux.vnet.ibm.com>
Date: Thu, 16 Jan 2020 14:58:34 +1000
Message-ID: <875zhc9ev9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Currently the kernel detects if its running on a shared lpar platform
> and requests home node associativity before the scheduler sched_domains
> are setup. However between the time NUMA setup is initialized and the
> request for home node associativity, workqueue initializes its per node
> cpumask. The per node workqueue possible cpumask may turn invalid
> after home node associativity resulting in weird situations like
> workqueue possible cpumask being a subset of workqueue online cpumask.
>
> This can be fixed by requesting home node associativity earlier just
> before NUMA setup. However at the NUMA setup time, kernel may not be in
> a position to detect if its running on a shared lpar platform. So
> request for home node associativity and if the request fails, fallback
> on the device tree property.
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
> Changelog (v2->v3):
> - Handled comments from Nathan Lynch
>   * Use first thread of the core for cpu-to-node map.
>   * get hardware-id in numa_setup_cpu
>
> Changelog (v1->v2):
> - Handled comments from Nathan Lynch
>   * Dont depend on pacas to be setup for the hwid
>
>
>  arch/powerpc/mm/numa.c | 45 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 63ec0c3c817f..f837a0e725bc 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -461,13 +461,27 @@ static int of_drconf_to_nid_single(struct drmem_lmb=
 *lmb)
>  	return nid;
>  }
>=20=20
> +static int vphn_get_nid(long hwid)
> +{
> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] =3D {0};
> +	long rc;
> +
> +	rc =3D hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);

This breaks the build for some defconfigs.

eg. ppc64_book3e_allmodconfig:

  arch/powerpc/mm/numa.c: In function =E2=80=98vphn_get_nid=E2=80=99:
  arch/powerpc/mm/numa.c:469:7: error: implicit declaration of function =E2=
=80=98hcall_vphn=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    469 |  rc =3D hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);
        |       ^~~~~~~~~~

It needs to be inside #ifdef CONFIG_PPC_SPLPAR.

> +	if (rc =3D=3D H_SUCCESS)
> +		return associativity_to_nid(associativity);
> +
> +	return NUMA_NO_NODE;
> +}
> +
>  /*
>   * Figure out to which domain a cpu belongs and stick it there.
> + * cpu_to_phys_id is only valid between smp_setup_cpu_maps() and
> + * smp_setup_pacas(). If called outside this window, set get_hwid to tru=
e.
>   * Return the id of the domain used.
>   */
> -static int numa_setup_cpu(unsigned long lcpu)
> +static int numa_setup_cpu(unsigned long lcpu, bool get_hwid)

I really dislike this bool.

> @@ -485,6 +499,27 @@ static int numa_setup_cpu(unsigned long lcpu)
>  		return nid;
>  	}
>=20=20
> +	/*
> +	 * On a shared lpar, device tree will not have node associativity.
> +	 * At this time lppaca, or its __old_status field may not be
> +	 * updated. Hence kernel cannot detect if its on a shared lpar. So
> +	 * request an explicit associativity irrespective of whether the
> +	 * lpar is shared or dedicated. Use the device tree property as a
> +	 * fallback.
> +	 */
> +	if (firmware_has_feature(FW_FEATURE_VPHN)) {
> +		long hwid;
> +
> +		if (get_hwid)
> +			hwid =3D get_hard_smp_processor_id(lcpu);
> +		else
> +			hwid =3D cpu_to_phys_id[lcpu];

This should move inside vphn_get_nid(), and just do:

	if (cpu_to_phys_id)
		hwid =3D cpu_to_phys_id[lcpu];
	else
		hwid =3D get_hard_smp_processor_id(lcpu);


> +		nid =3D vphn_get_nid(hwid);
> +	}
> +
> +	if (nid !=3D NUMA_NO_NODE)
> +		goto out_present;
> +
>  	cpu =3D of_get_cpu_node(lcpu, NULL);


cheers
