Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB9A19A8EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:52:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48shLQ5fxwzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sh8B1dTKzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:43:05 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0319Xse5105404
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 05:43:02 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g865c82-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 05:43:02 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 1 Apr 2020 10:42:58 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 10:42:56 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0319gu5P42402256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 09:42:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 717ABA404D;
 Wed,  1 Apr 2020 09:42:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14CA6A4057;
 Wed,  1 Apr 2020 09:42:56 +0000 (GMT)
Received: from localhost (unknown [9.85.74.146])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 09:42:55 +0000 (GMT)
Date: Wed, 01 Apr 2020 15:12:53 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 2/6] powerpc/idle: Add accessor function to always read
 latest idle PURR
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Kamalesh Babulal
 <kamalesh@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vaidyanathan Srinivasan
 <svaidy@linux.vnet.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-3-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1585308760-28792-3-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040109-0028-0000-0000-000003EFF165
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040109-0029-0000-0000-000024B576E8
Message-Id: <1585734073.0qmf6bbdoa.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010078
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gautham,

Gautham R. Shenoy wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>=20
> Currently when CPU goes idle, we take a snapshot of PURR via
> pseries_idle_prolog() which is used at the CPU idle exit to compute
> the idle PURR cycles via the function pseries_idle_epilog().  Thus,
> the value of idle PURR cycle thus read before pseries_idle_prolog() and
> after pseries_idle_epilog() is always correct.
>=20
> However, if we were to read the idle PURR cycles from an interrupt
> context between pseries_idle_prolog() and pseries_idle_epilog() (this wil=
l
> be done in a future patch), then, the value of the idle PURR thus read
> will not include the cycles spent in the most recent idle period.
>=20
> This patch addresses the issue by providing accessor function to read
> the idle PURR such such that it includes the cycles spent in the most
> recent idle period, if we read it between pseries_idle_prolog() and
> pseries_idle_epilog(). In order to achieve it, the patch saves the
> snapshot of PURR in pseries_idle_prolog() in a per-cpu variable,
> instead of on the stack, so that it can be accessed from an interrupt
> context.
>=20
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/idle.h        | 47 +++++++++++++++++++++++++++-=
------
>  arch/powerpc/platforms/pseries/setup.c |  7 +++--
>  drivers/cpuidle/cpuidle-pseries.c      | 15 +++++------
>  3 files changed, 47 insertions(+), 22 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/i=
dle.h
> index 32064a4c..d4bfb6a 100644
> --- a/arch/powerpc/include/asm/idle.h
> +++ b/arch/powerpc/include/asm/idle.h
> @@ -5,10 +5,27 @@
>  #include <asm/paca.h>
>=20
>  #ifdef CONFIG_PPC_PSERIES
> -static inline void pseries_idle_prolog(unsigned long *in_purr)
> +DECLARE_PER_CPU(u64, idle_entry_purr_snap);
> +
> +static inline void snapshot_purr_idle_entry(void)
> +{
> +	*this_cpu_ptr(&idle_entry_purr_snap) =3D mfspr(SPRN_PURR);
> +}
> +
> +static inline void update_idle_purr_accounting(void)
> +{
> +	u64 wait_cycles;
> +	u64 in_purr =3D *this_cpu_ptr(&idle_entry_purr_snap);
> +
> +	wait_cycles =3D be64_to_cpu(get_lppaca()->wait_state_cycles);
> +	wait_cycles +=3D mfspr(SPRN_PURR) - in_purr;
> +	get_lppaca()->wait_state_cycles =3D cpu_to_be64(wait_cycles);
> +}
> +
> +static inline void pseries_idle_prolog(void)
>  {
>  	ppc64_runlatch_off();
> -	*in_purr =3D mfspr(SPRN_PURR);
> +	snapshot_purr_idle_entry();
>  	/*
>  	 * Indicate to the HV that we are idle. Now would be
>  	 * a good time to find other work to dispatch.
> @@ -16,16 +33,28 @@ static inline void pseries_idle_prolog(unsigned long =
*in_purr)
>  	get_lppaca()->idle =3D 1;
>  }
>=20
> -static inline void pseries_idle_epilog(unsigned long in_purr)
> +static inline void pseries_idle_epilog(void)
>  {
> -	u64 wait_cycles;
> -
> -	wait_cycles =3D be64_to_cpu(get_lppaca()->wait_state_cycles);
> -	wait_cycles +=3D mfspr(SPRN_PURR) - in_purr;
> -	get_lppaca()->wait_state_cycles =3D cpu_to_be64(wait_cycles);
> +	update_idle_purr_accounting();
>  	get_lppaca()->idle =3D 0;
> -
>  	ppc64_runlatch_on();
>  }
> +
> +static inline u64 read_this_idle_purr(void)
> +{
> +	/*
> +	 * If we are reading from an idle context, update the
> +	 * idle-purr cycles corresponding to the last idle period.
> +	 * Since the idle context is not yet over, take a fresh
> +	 * snapshot of the idle-purr.
> +	 */
> +	if (unlikely(get_lppaca()->idle =3D=3D 1)) {
> +		update_idle_purr_accounting();
> +		snapshot_purr_idle_entry();
> +	}
> +
> +	return be64_to_cpu(get_lppaca()->wait_state_cycles);
> +}
> +

I think this and read_this_idle_spurr() from the next patch should be=20
moved to Patch 4/6, where they are actually used.

- Naveen

