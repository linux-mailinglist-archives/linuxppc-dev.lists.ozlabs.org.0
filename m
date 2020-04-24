Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFB1B7DD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 20:28:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4982jy5RnRzDqRZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 04:28:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4982gj14hmzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 04:26:40 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OI3n32112473
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 14:26:39 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmv3g346-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 14:26:38 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 24 Apr 2020 19:26:10 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Apr 2020 19:26:07 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03OIQWVG61538480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 18:26:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 256E65204E;
 Fri, 24 Apr 2020 18:26:32 +0000 (GMT)
Received: from localhost (unknown [9.85.74.26])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AA3065204F;
 Fri, 24 Apr 2020 18:26:31 +0000 (GMT)
Date: Fri, 24 Apr 2020 23:56:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
To: Christophe Leroy <christophe.leroy@c-s.fr>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
 <20200424092202.71cfc549@gandalf.local.home>
In-Reply-To: <20200424092202.71cfc549@gandalf.local.home>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20042418-0012-0000-0000-000003AA6D38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042418-0013-0000-0000-000021E7C648
Message-Id: <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240134
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

Steven Rostedt wrote:
> On Thu, 23 Apr 2020 17:41:52 +0200
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>  =20
>> > diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/opt=
probes.c
>> > index 024f7aad1952..046485bb0a52 100644
>> > --- a/arch/powerpc/kernel/optprobes.c
>> > +++ b/arch/powerpc/kernel/optprobes.c
>> > @@ -139,52 +139,67 @@ void arch_remove_optimized_kprobe(struct optimiz=
ed_kprobe *op)
>> >   	}
>> >   }
>> >  =20
>> > +#define PATCH_INSN(addr, instr)						     \
>> > +do {									     \
>> > +	int rc =3D patch_instruction((unsigned int *)(addr), instr);	     \
>> > +	if (rc) {							     \
>> > +		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
>> > +				__func__, __LINE__,			     \
>> > +				(void *)(addr), (void *)(addr), rc);	     \
>> > +		return rc;						     \
>> > +	}								     \
>> > +} while (0)
>> > + =20
>>=20
>> I hate this kind of macro which hides the "return".
>>=20
>> What about keeping the return action in the caller ?
>>=20
>> Otherwise, what about implementing something based on the use of goto,=20
>> on the same model as unsafe_put_user() for instance ?

Thanks for the review.

I noticed this as a warning from checkpatch.pl, but this looked compact=20
and correct for use in the two following functions. You'll notice that I=20
added it just before the two functions this is used in.

I suppose 'goto err' is usable too, but the ftrace code (patch 2) will=20
end up with more changes. I'm also struggling to see how a 'goto' is=20
less offensive. I think Steve's suggestion below would be the better way=20
to go, to make things explicit.

>=20
> #define PATCH_INSN(addr, instr) \
> ({
> 	int rc =3D patch_instruction((unsigned int *)(addr), instr);	     \
> 	if (rc)								     \
> 		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
> 				__func__, __LINE__,			     \
> 				(void *)(addr), (void *)(addr), rc);	     \
> 	rc;								     \
> })
>=20
>=20
> Then you can just do:
>=20
> 	ret =3D PATCH_INSN(...);
> 	if (ret)
> 		return ret;
>=20
> in the code.

That's really nice. However, in this case, I guess I can simply use an=20
inline function? The primary reason I used the macro was for including a=20
'return' statement in it.


Thanks for the review!
- Naveen

