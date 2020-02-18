Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2461628C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 15:45:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MNtc6RpQzDqrX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 01:45:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MNnq6NH9zDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 01:41:03 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IEZVZI121504
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:41:00 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y89aajekx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:41:00 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Feb 2020 14:40:58 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 14:40:55 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01IEesQW56164594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 14:40:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 863DC11C05B;
 Tue, 18 Feb 2020 14:40:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB0BB11C050;
 Tue, 18 Feb 2020 14:40:53 +0000 (GMT)
Received: from localhost (unknown [9.199.60.10])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 14:40:53 +0000 (GMT)
Date: Tue, 18 Feb 2020 20:10:52 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/kprobes: Reduce depth of a test
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <642c8b4ca59e658be38d8dde00f994e183790a6a.1581687838.git.christophe.leroy@c-s.fr>
 <b67d6705956a1a294af600700115930ff87e643c.1581687838.git.christophe.leroy@c-s.fr>
In-Reply-To: <b67d6705956a1a294af600700115930ff87e643c.1581687838.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20021814-0012-0000-0000-00000387FE91
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021814-0013-0000-0000-000021C48F21
Message-Id: <1582036273.gp0i4o7fv2.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=811 adultscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180114
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

Christophe Leroy wrote:
> 	if (a) {
> 		if (b)
> 			do_something();
> 	}
>=20
> Is equivalent to
>=20
> 	if (a & b)
> 		do_something();
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/kprobes.c | 58 +++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 7a925eb76ec0..d7c80a078c1e 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -277,38 +277,36 @@ int kprobe_handler(struct pt_regs *regs)
> =20
>  	/* Check we're not actually recursing */
>  	p =3D get_kprobe(addr);
> -	if (kprobe_running()) {
> -		if (p) {
> -			kprobe_opcode_t insn =3D *p->ainsn.insn;
> -			if (kcb->kprobe_status =3D=3D KPROBE_HIT_SS &&
> -					is_trap(insn)) {
> -				/* Turn off 'trace' bits */
> -				regs->msr &=3D ~MSR_SINGLESTEP;
> -				regs->msr |=3D kcb->kprobe_saved_msr;
> -				goto no_kprobe;
> -			}
> -			/* We have reentered the kprobe_handler(), since
> -			 * another probe was hit while within the handler.
> -			 * We here save the original kprobes variables and
> -			 * just single step on the instruction of the new probe
> -			 * without calling any user handlers.
> -			 */
> -			save_previous_kprobe(kcb);
> -			set_current_kprobe(p, regs, kcb);
> -			kprobes_inc_nmissed_count(p);
> -			kcb->kprobe_status =3D KPROBE_REENTER;
> -			if (p->ainsn.boostable >=3D 0) {
> -				ret =3D try_to_emulate(p, regs);
> -
> -				if (ret > 0) {
> -					restore_previous_kprobe(kcb);
> -					preempt_enable_no_resched();
> -					return 1;
> -				}
> +	if (kprobe_running() && p) {
> +		kprobe_opcode_t insn =3D *p->ainsn.insn;
> +
> +		if (kcb->kprobe_status =3D=3D KPROBE_HIT_SS && is_trap(insn)) {
> +			/* Turn off 'trace' bits */
> +			regs->msr &=3D ~MSR_SINGLESTEP;
> +			regs->msr |=3D kcb->kprobe_saved_msr;
> +			goto no_kprobe;
> +		}
> +		/* We have reentered the kprobe_handler(), since
> +		 * another probe was hit while within the handler.
> +		 * We here save the original kprobes variables and
> +		 * just single step on the instruction of the new probe
> +		 * without calling any user handlers.
> +		 */
> +		save_previous_kprobe(kcb);
> +		set_current_kprobe(p, regs, kcb);
> +		kprobes_inc_nmissed_count(p);
> +		kcb->kprobe_status =3D KPROBE_REENTER;
> +		if (p->ainsn.boostable >=3D 0) {
> +			ret =3D try_to_emulate(p, regs);
> +
> +			if (ret > 0) {
> +				restore_previous_kprobe(kcb);
> +				preempt_enable_no_resched();
> +				return 1;
>  			}
> -			prepare_singlestep(p, regs);
> -			return 1;
>  		}
> +		prepare_singlestep(p, regs);
> +		return 1;
>  	}
> =20

If we move the below !p case before the check for kprobe_running() right=20
after get_kprobe(), we won't need to check for (p) above and we won't=20
have any change in logic from Patch 1.

>  	if (!p) {


- Naveen

