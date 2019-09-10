Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819BAE8EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 13:14:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SMqg3pmrzDsPf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 21:14:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SMnX08BszDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 21:12:31 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8AAbFQO082112
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:44:26 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux9uqrxqc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:44:26 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Tue, 10 Sep 2019 11:44:24 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 11:44:22 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8AAiLRt54395070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 10:44:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 742594203F;
 Tue, 10 Sep 2019 10:44:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 144E442045;
 Tue, 10 Sep 2019 10:44:21 +0000 (GMT)
Received: from localhost (unknown [9.85.92.121])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 10:44:20 +0000 (GMT)
Date: Tue, 10 Sep 2019 16:14:17 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/watchpoint: Disable watchpoint hit by
 larx/stcx instructions
To: mikey@neuling.org, mpe@ellerman.id.au, Ravi Bangoria
 <ravi.bangoria@linux.ibm.com>
References: <20190910102422.23233-1-ravi.bangoria@linux.ibm.com>
 <20190910102422.23233-3-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20190910102422.23233-3-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19091010-0028-0000-0000-0000039A7159
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091010-0029-0000-0000-0000245CD4A5
Message-Id: <1568111933.eaf72yeuof.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=639 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100108
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria wrote:
> If watchpoint exception is generated by larx/stcx instructions, the
> reservation created by larx gets lost while handling exception, and
> thus stcx instruction always fails. Generally these instructions are
> used in a while(1) loop, for example spinlocks. And because stcx
> never succeeds, it loops forever and ultimately hangs the system.
>=20
> Note that ptrace anyway works in one-shot mode and thus for ptrace
> we don't change the behaviour. It's up to ptrace user to take care
> of this.
>=20
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/kernel/hw_breakpoint.c | 49 +++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw=
_breakpoint.c
> index 28ad3171bb82..9fa496a598ce 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -195,14 +195,32 @@ void thread_change_pc(struct task_struct *tsk, stru=
ct pt_regs *regs)
>  	tsk->thread.last_hit_ubp =3D NULL;
>  }
> =20
> +static bool is_larx_stcx_instr(struct pt_regs *regs, unsigned int instr)
> +{
> +	int ret, type;
> +	struct instruction_op op;
> +
> +	ret =3D analyse_instr(&op, regs, instr);
> +	type =3D GETTYPE(op.type);
> +	return (!ret && (type =3D=3D LARX || type =3D=3D STCX));
> +}
> +
>  /*
>   * Handle debug exception notifications.
>   */
>  static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp=
,
>  			     unsigned long addr)
>  {
> -	int stepped;
> -	unsigned int instr;
> +	unsigned int instr =3D 0;
> +
> +	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
> +		goto fail;
> +
> +	if (is_larx_stcx_instr(regs, instr)) {
> +		printk_ratelimited("Watchpoint: Can't emulate/single-step larx/"
> +				   "stcx instructions. Disabling watchpoint.\n");

The below WARN() uses the term 'breakpoint'. Better to use consistent=20
terminology. I would rewrite the above as:
	printk_ratelimited("Breakpoint hit on instruction that can't be emulated. =
"
				"Breakpoint at 0x%lx will be disabled.\n", addr);

Otherwise:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

- Naveen

> +		goto disable;
> +	}
> =20
>  	/* Do not emulate user-space instructions, instead single-step them */
>  	if (user_mode(regs)) {
> @@ -211,23 +229,22 @@ static bool stepping_handler(struct pt_regs *regs, =
struct perf_event *bp,
>  		return false;
>  	}
> =20
> -	stepped =3D 0;
> -	instr =3D 0;
> -	if (!__get_user_inatomic(instr, (unsigned int *)regs->nip))
> -		stepped =3D emulate_step(regs, instr);
> +	if (!emulate_step(regs, instr))
> +		goto fail;
> =20
> +	return true;
> +
> +fail:
>  	/*
> -	 * emulate_step() could not execute it. We've failed in reliably
> -	 * handling the hw-breakpoint. Unregister it and throw a warning
> -	 * message to let the user know about it.
> +	 * We've failed in reliably handling the hw-breakpoint. Unregister
> +	 * it and throw a warning message to let the user know about it.
>  	 */
> -	if (!stepped) {
> -		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
> -			"0x%lx will be disabled.", addr);
> -		perf_event_disable_inatomic(bp);
> -		return false;
> -	}
> -	return true;
> +	WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
> +		"0x%lx will be disabled.", addr);
> +
> +disable:
> +	perf_event_disable_inatomic(bp);
> +	return false;
>  }
> =20
>  int hw_breakpoint_handler(struct die_args *args)
> --=20
> 2.21.0
>=20
>=20

