Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 807433BC02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 20:49:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N2Hb0VnGzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 04:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N2Fr5DkXzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 04:48:16 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5AIfwGZ163750
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 14:48:13 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t1uapujux-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 14:48:12 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <leonardo@linux.ibm.com>;
 Mon, 10 Jun 2019 19:48:11 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 10 Jun 2019 19:48:10 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5AIm9oF28639616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2019 18:48:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 136D2BE051;
 Mon, 10 Jun 2019 18:48:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA044BE054;
 Mon, 10 Jun 2019 18:48:04 +0000 (GMT)
Received: from LeoBras (unknown [9.85.221.234])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jun 2019 18:48:04 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/perf: Use cpumask_last() to determine the
 designated cpu for nest/core units.
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>, mpe@ellerman.id.au
Date: Mon, 10 Jun 2019 15:47:55 -0300
In-Reply-To: <20190610063229.32560-1-anju@linux.vnet.ibm.com>
References: <20190610063229.32560-1-anju@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-OBPBxP5t6SGUuJaRFawp"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061018-0016-0000-0000-000009C0E953
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011243; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216070; UDB=6.00639370; IPR=6.00997170; 
 MB=3.00027254; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-10 18:48:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061018-0017-0000-0000-0000439913CD
Message-Id: <181424243e879218b732034f6014ac4af5c68285.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906100126
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
Cc: ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-OBPBxP5t6SGUuJaRFawp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-06-10 at 12:02 +0530, Anju T Sudhakar wrote:
> Nest and core imc(In-memory Collection counters) assigns a particular
> cpu as the designated target for counter data collection.
> During system boot, the first online cpu in a chip gets assigned as
> the designated cpu for that chip(for nest-imc) and the first online cpu
> in a core gets assigned as the designated cpu for that core(for core-imc)=
.
>=20
> If the designated cpu goes offline, the next online cpu from the same
> chip(for nest-imc)/core(for core-imc) is assigned as the next target,
> and the event context is migrated to the target cpu.
> Currently, cpumask_any_but() function is used to find the target cpu.
> Though this function is expected to return a `random` cpu, this always
> returns the next online cpu.
>=20
> If all cpus in a chip/core is offlined in a sequential manner, starting
> from the first cpu, the event migration has to happen for all the cpus
> which goes offline. Since the migration process involves a grace period,
> the total time taken to offline all the cpus will be significantly high.
>=20
> Example:
> In a system which has 2 sockets, with
> NUMA node0 CPU(s):     0-87
> NUMA node8 CPU(s):     88-175
>=20
> Time taken to offline cpu 88-175:
> real    2m56.099s
> user    0m0.191s
> sys     0m0.000s
>=20
> Use cpumask_last() to choose the target cpu, when the designated cpu
> goes online, so the migration will happen only when the last_cpu in the
> mask goes offline. This way the time taken to offline all cpus in a
> chip/core can be reduced.
>=20
> With the patch,=20
>=20
> Time taken  to offline cpu 88-175:
> real    0m12.207s
> user    0m0.171s
> sys     0m0.000s
>=20
>=20
> Offlining all cpus in reverse order is also taken care because,
> cpumask_any_but() is used to find the designated cpu if the last cpu in
> the mask goes offline. Since cpumask_any_but() always return the first
> cpu in the mask, that becomes the designated cpu and migration will happe=
n
> only when the first_cpu in the mask goes offline.
>=20
> Example:
> With the patch,
>=20
> Time taken to offline cpu from 175-88:
> real    0m9.330s
> user    0m0.110s
> sys     0m0.000s

Seems like a very interesting work.
Out of curiosity, have you used 'chcpu -d' to create your benchmark?

>=20
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> ---
>=20
> Changes from v1:
> 	Modified the commit log with more info.
> ---
>=20
>  arch/powerpc/perf/imc-pmu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index 31fa753..fbfd6e7 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -366,7 +366,14 @@ static int ppc_nest_imc_cpu_offline(unsigned int cpu=
)
>  	 */
>  	nid =3D cpu_to_node(cpu);
>  	l_cpumask =3D cpumask_of_node(nid);
> -	target =3D cpumask_any_but(l_cpumask, cpu);
> +	target =3D cpumask_last(l_cpumask);
> +
> +	/*
> +	 * If this(target) is the last cpu in the cpumask for this chip,
> +	 * check for any possible online cpu in the chip.
> +	 */
> +	if (unlikely(target =3D=3D cpu))
> +		target =3D cpumask_any_but(l_cpumask, cpu);
> =20
>  	/*
>  	 * Update the cpumask with the target cpu and
> @@ -671,7 +678,10 @@ static int ppc_core_imc_cpu_offline(unsigned int cpu=
)
>  		return 0;
> =20
>  	/* Find any online cpu in that core except the current "cpu" */
> -	ncpu =3D cpumask_any_but(cpu_sibling_mask(cpu), cpu);
> +	ncpu =3D cpumask_last(cpu_sibling_mask(cpu));
> +
> +	if (unlikely(ncpu =3D=3D cpu))
> +		ncpu =3D cpumask_any_but(cpu_sibling_mask(cpu), cpu);
> =20
>  	if (ncpu >=3D 0 && ncpu < nr_cpu_ids) {
>  		cpumask_set_cpu(ncpu, &core_imc_cpumask);

--=-OBPBxP5t6SGUuJaRFawp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAlz+pdsACgkQlQYWtz9S
ttR5kRAAtSPaJEU9gZz/zdZ3YtGLIRA4z5TtSLXUwQ0r/ueUeZv+YvJ3U/RhmBwi
BlP9fTy9bn79A+S7VY032ncyNLlK5fvERszIyUplXJWYSyQ6/j1w/JT27myv9gxu
qiXUCFPsuf9m88Yh1XAZvhebE3Z38yeF1UWODzTV+UXjs8CzRCPhkxe2hcqpgtZY
pLi9+s6DfhdVIYlBf9FCDcVIAjLZwwzKdByNNlpO7tMLA3fdYEyP4sS2ZbK9TpYs
a655HZKVIqnhsNbuJCaCcLC9dOtQ2vdQVk1XHc/BgNFwlsUqq+zZzGQKCmoUgi7g
T2t7PMfWxpGU+RiqZZjxkN+iBBnV4W/UJGv6RR3xjX57VL2pDzqcsW5OmhOAoqSy
Me8c77fDQe+PAgn2+SQi9x7arAUu79uEdDd3q29CSAon4ISeaI1FlwMZmem+BSil
/Rl4Fd5c/1fwmOkG08CpyU/EWs1WKmaT85NJ1DxgP5gkgVXi+mmuQJKEOOZT1qYU
uipcOCSLCl31biirOwPuNlsLAP8VJmAnQvAVaTV+Cc9eaEuYKKBo4UOsSYXVViC3
bLMBSYeAlVkAb7Ui5uQcovmWnvprhO88FErrRgM1kxBYhExeV00TbJD9AWMTzord
fPkLSmWIOqxgt3Ykd8KsTydxQQvokVIv7+kI4oKzi+U5A3rtqHw=
=8Iw+
-----END PGP SIGNATURE-----

--=-OBPBxP5t6SGUuJaRFawp--

