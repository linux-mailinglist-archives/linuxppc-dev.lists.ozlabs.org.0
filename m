Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6A1BAAE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 19:14:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499rx64wZMzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 03:14:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499rtz0j1TzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 03:12:42 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RH2JJs101464; Mon, 27 Apr 2020 13:12:11 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mggtdksa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 13:12:11 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RHAsfd015157;
 Mon, 27 Apr 2020 17:12:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5m88v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 17:12:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RHC6CR51642400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 17:12:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0FE3A4040;
 Mon, 27 Apr 2020 17:12:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1224A4051;
 Mon, 27 Apr 2020 17:12:05 +0000 (GMT)
Received: from localhost (unknown [9.85.118.151])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 17:12:05 +0000 (GMT)
Date: Mon, 27 Apr 2020 22:41:58 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
To: Christophe Leroy <christophe.leroy@c-s.fr>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
 <20200424092202.71cfc549@gandalf.local.home>
 <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
 <e743c9db-847a-2612-bf36-c23a57a056c5@c-s.fr>
In-Reply-To: <e743c9db-847a-2612-bf36-c23a57a056c5@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588007337.m8xwhbyyyq.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_12:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270135
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

Christophe Leroy wrote:
>=20
>=20
> On 04/24/2020 06:26 PM, Naveen N. Rao wrote:
>> Steven Rostedt wrote:
>>> On Thu, 23 Apr 2020 17:41:52 +0200
>>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>> > diff --git a/arch/powerpc/kernel/optprobes.c=20
>>>> b/arch/powerpc/kernel/optprobes.c
>>>> > index 024f7aad1952..046485bb0a52 100644
>>>> > --- a/arch/powerpc/kernel/optprobes.c
>>>> > +++ b/arch/powerpc/kernel/optprobes.c
>>>> > @@ -139,52 +139,67 @@ void arch_remove_optimized_kprobe(struct=20
>>>> optimized_kprobe *op)
>>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> >=C2=A0=C2=A0 }
>>>> > > +#define PATCH_INSN(addr, instr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> > +do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> > +=C2=A0=C2=A0=C2=A0 int rc =3D patch_instruction((unsigned int *)(ad=
dr),=20
>>>> instr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> > +=C2=A0=C2=A0=C2=A0 if (rc) {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("%s:%d Error patc=
hing instruction at 0x%pK (%pS):=20
>>>> %d\n", \
>>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 __func__, __LINE__,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (void *)(addr), (void *)(addr), rc);=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>>> > +=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>> > +} while (0)
>>>> > +
>>>> I hate this kind of macro which hides the "return".
>>>>
>>>> What about keeping the return action in the caller ?
>>>>
>>>> Otherwise, what about implementing something based on the use of=20
>>>> goto, on the same model as unsafe_put_user() for instance ?
>>=20
>> Thanks for the review.
>>=20
>> I noticed this as a warning from checkpatch.pl, but this looked compact=20
>> and correct for use in the two following functions. You'll notice that I=
=20
>> added it just before the two functions this is used in.
>>=20
>> I suppose 'goto err' is usable too, but the ftrace code (patch 2) will=20
>> end up with more changes. I'm also struggling to see how a 'goto' is=20
>> less offensive. I think Steve's suggestion below would be the better way=
=20
>> to go, to make things explicit.
>>=20
>=20
> Sure it's be more explicit, but then more lines also. 3 lines for only=20
> one really usefull.
>=20
> With goto, I would look like:
>=20
> diff --git a/arch/powerpc/kernel/optprobes.c=20
> b/arch/powerpc/kernel/optprobes.c
> index 046485bb0a52..938208f824da 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -139,14 +139,14 @@ void arch_remove_optimized_kprobe(struct=20
> optimized_kprobe *op)
>   	}
>   }
>=20
> -#define PATCH_INSN(addr, instr)						     \
> +#define PATCH_INSN(addr, instr, label)						     \
>   do {									     \
>   	int rc =3D patch_instruction((unsigned int *)(addr), instr);	     \
>   	if (rc) {							     \
>   		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
>   				__func__, __LINE__,			     \
>   				(void *)(addr), (void *)(addr), rc);	     \
> -		return rc;						     \
> +		goto label;						     \
>   	}								     \
>   } while (0)

My earlier complaint was that this would still add a flow control=20
statement, so didn't look to immediately address your original concern. =20
However, I suppose introduction of an explicit label makes things a bit=20
better.

In addition:

<snip>
> @@ -291,23 +297,8 @@ int arch_prepare_optimized_kprobe(struct=20
> optimized_kprobe *op, struct kprobe *p)
>   		goto error;
>   	}
>=20
> -	rc =3D patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback)=
;
> -	if (rc) {
> -		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
> -				__func__, __LINE__,
> -				(void *)(buff + TMPL_CALL_HDLR_IDX), rc);
> -		rc =3D -EFAULT;
> -		goto error;
> -	}
> -
> -	rc =3D patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
> -	if (rc) {
> -		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
> -				__func__, __LINE__,
> -				(void *)(buff + TMPL_EMULATE_IDX), rc);
> -		rc =3D -EFAULT;
> -		goto error;
> -	}
> +	PATCH_INSN(buff + TMPL_CALL_HDLR_IDX, branch_op_callback, efault);
> +	PATCH_INSN(buff + TMPL_EMULATE_IDX, branch_emulate_step, efault);

I like how this variant can cover additional uses of patch_instruction()=20
here.

I will use this variant. Thanks for the suggestion!


- Naveen

