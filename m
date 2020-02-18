Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F81628B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 15:42:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MNqF33WKzDqBx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 01:42:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MNmk2xbPzDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 01:39:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IEa5ZS014200
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:39:57 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y85f3rw0c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:39:57 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Tue, 18 Feb 2020 14:39:54 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 14:39:52 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01IEcuUR40042880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 14:38:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDD54A4051;
 Tue, 18 Feb 2020 14:39:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60FFEA4040;
 Tue, 18 Feb 2020 14:39:51 +0000 (GMT)
Received: from localhost (unknown [9.199.60.10])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 14:39:51 +0000 (GMT)
Date: Tue, 18 Feb 2020 20:09:49 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/kprobes: Remove redundant code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <642c8b4ca59e658be38d8dde00f994e183790a6a.1581687838.git.christophe.leroy@c-s.fr>
In-Reply-To: <642c8b4ca59e658be38d8dde00f994e183790a6a.1581687838.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20021814-0020-0000-0000-000003AB4FEB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021814-0021-0000-0000-000022034BEA
Message-Id: <1582036611.9hm2t8ijhz.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 spamscore=0 suspectscore=0 mlxlogscore=783
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002180114
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
> At the time being we have something like
>=20
> 	if (something) {
> 		p =3D get();
> 		if (p) {
> 			if (something_wrong)
> 				goto out;
> 			...
> 			return;
> 		} else if (a !=3D b) {
> 			if (some_error)
> 				goto out;
> 			...
> 		}
> 		goto out;
> 	}
> 	p =3D get();
> 	if (!p) {
> 		if (a !=3D b) {
> 			if (some_error)
> 				goto out;
> 			...
> 		}
> 		goto out;
> 	}
>=20
> This is similar to
>=20
> 	p =3D get();
> 	if (something) {
> 		if (p) {
> 			if (something_wrong)
> 				goto out;
> 			...
> 			return;
> 		}
> 	}
> 	if (!p) {
> 		if (a !=3D b) {
> 			if (some_error)
> 				goto out;
> 			...
> 		}
> 		goto out;
> 	}
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/kprobes.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)

Good cleanup, thanks.

>=20
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index f8b848aa65bd..7a925eb76ec0 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -276,8 +276,8 @@ int kprobe_handler(struct pt_regs *regs)
>  	kcb =3D get_kprobe_ctlblk();
> =20
>  	/* Check we're not actually recursing */
> +	p =3D get_kprobe(addr);
>  	if (kprobe_running()) {
> -		p =3D get_kprobe(addr);
>  		if (p) {
>  			kprobe_opcode_t insn =3D *p->ainsn.insn;
>  			if (kcb->kprobe_status =3D=3D KPROBE_HIT_SS &&
> @@ -308,22 +308,9 @@ int kprobe_handler(struct pt_regs *regs)
>  			}
>  			prepare_singlestep(p, regs);
>  			return 1;
> -		} else if (*addr !=3D BREAKPOINT_INSTRUCTION) {
> -			/* If trap variant, then it belongs not to us */
> -			kprobe_opcode_t cur_insn =3D *addr;
> -
> -			if (is_trap(cur_insn))
> -				goto no_kprobe;
> -			/* The breakpoint instruction was removed by
> -			 * another cpu right after we hit, no further
> -			 * handling of this interrupt is appropriate
> -			 */
> -			ret =3D 1;
>  		}
> -		goto no_kprobe;

A minot nit -- removing the above goto makes a slight change to the=20
logic. But, see my comments for the next patch.

- Naveen

>  	}
> =20
> -	p =3D get_kprobe(addr);
>  	if (!p) {
>  		if (*addr !=3D BREAKPOINT_INSTRUCTION) {
>  			/*
> --=20
> 2.25.0
>=20
>=20

