Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C1211BFE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 08:32:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y7Yc34MqzDqLB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 16:32:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y7Ml0lmLzDqM4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 16:23:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06265fN2120331; Thu, 2 Jul 2020 02:23:44 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320s3yv3dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 02:23:44 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0626NggL012800;
 Thu, 2 Jul 2020 06:23:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch5b7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 06:23:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0626MgwA57999794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 06:22:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9812C4C044;
 Thu,  2 Jul 2020 06:22:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6730F4C04A;
 Thu,  2 Jul 2020 06:22:40 +0000 (GMT)
Received: from [9.85.81.233] (unknown [9.85.81.233])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jul 2020 06:22:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <9692404F-A567-479B-BF9B-3624E71639FB@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_CD3873F7-2EA2-4365-9C84-3F96807D1A85"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 02/10] KVM: PPC: Book3S HV: Save/restore new PMU
 registers
Date: Thu, 2 Jul 2020 11:52:37 +0530
In-Reply-To: <20200701111158.GA694641@thinks.paulus.ozlabs.org>
To: Paul Mackerras <paulus@ozlabs.org>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-3-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20200701111158.GA694641@thinks.paulus.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_02:2020-07-01,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 cotscore=-2147483648 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 clxscore=1011 malwarescore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020046
X-Mailman-Approved-At: Thu, 02 Jul 2020 16:30:48 +1000
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_CD3873F7-2EA2-4365-9C84-3F96807D1A85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 01-Jul-2020, at 4:41 PM, Paul Mackerras <paulus@ozlabs.org> wrote:
>=20
> On Wed, Jul 01, 2020 at 05:20:54AM -0400, Athira Rajeev wrote:
>> PowerISA v3.1 has added new performance monitoring unit (PMU)
>> special purpose registers (SPRs). They are
>>=20
>> Monitor Mode Control Register 3 (MMCR3)
>> Sampled Instruction Event Register A (SIER2)
>> Sampled Instruction Event Register B (SIER3)
>>=20
>> Patch addes support to save/restore these new
>> SPRs while entering/exiting guest.
>=20
> This mostly looks reasonable, at a quick glance at least, but I am
> puzzled by two of the changes you are making.  See below.
>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c =
b/arch/powerpc/kvm/book3s_hv.c
>> index 6bf66649..c265800 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1698,7 +1698,8 @@ static int kvmppc_get_one_reg_hv(struct =
kvm_vcpu *vcpu, u64 id,
>> 		*val =3D get_reg_val(id, vcpu->arch.sdar);
>> 		break;
>> 	case KVM_REG_PPC_SIER:
>> -		*val =3D get_reg_val(id, vcpu->arch.sier);
>> +		i =3D id - KVM_REG_PPC_SIER;
>> +		*val =3D get_reg_val(id, vcpu->arch.sier[i]);
>=20
> This is inside a switch (id) statement, so here we know that id is
> KVM_REG_PPC_SIER.  In other words i will always be zero, so what is
> the point of doing the subtraction?
>=20
>> 		break;
>> 	case KVM_REG_PPC_IAMR:
>> 		*val =3D get_reg_val(id, vcpu->arch.iamr);
>> @@ -1919,7 +1920,8 @@ static int kvmppc_set_one_reg_hv(struct =
kvm_vcpu *vcpu, u64 id,
>> 		vcpu->arch.sdar =3D set_reg_val(id, *val);
>> 		break;
>> 	case KVM_REG_PPC_SIER:
>> -		vcpu->arch.sier =3D set_reg_val(id, *val);
>> +		i =3D id - KVM_REG_PPC_SIER;
>> +		vcpu->arch.sier[i] =3D set_reg_val(id, *val);
>=20
> Same comment here.

Hi Paul,

Thanks for reviewing the patch. Yes, true that currently `id` will be =
zero since it is only KVM_REG_PPC_SIER. I have kept the subtraction here =
considering that there will be addition of new registers to switch case.=20=

ex: case KVM_REG_PPC_SIER..KVM_REG_PPC_SIER3

>=20
> I think that new defines for the new registers will need to be added
> to arch/powerpc/include/uapi/asm/kvm.h and
> Documentation/virt/kvm/api.rst, and then new cases will need to be
> added to these switch statements.

Yes, New registers are not yet added to kvm.h=20
I will address these comments and include changes for =
arch/powerpc/include/uapi/asm/kvm.h and Documentation/virt/kvm/api.rst =
in the
next version.

>=20
> By the way, please cc kvm-ppc@vger.kernel.org and kvm@vger.kernel.org
> on KVM patches.

Sure, will include KVM mailing list in the next version

Thanks
Athira=20
>=20
> Paul.


--Apple-Mail=_CD3873F7-2EA2-4365-9C84-3F96807D1A85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 01-Jul-2020, at 4:41 PM, Paul Mackerras &lt;<a =
href=3D"mailto:paulus@ozlabs.org" class=3D"">paulus@ozlabs.org</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">On Wed, Jul 01, 2020 at 05:20:54AM -0400, Athira Rajeev =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">PowerISA v3.1 =
has added new performance monitoring unit (PMU)<br class=3D"">special =
purpose registers (SPRs). They are<br class=3D""><br class=3D"">Monitor =
Mode Control Register 3 (MMCR3)<br class=3D"">Sampled Instruction Event =
Register A (SIER2)<br class=3D"">Sampled Instruction Event Register B =
(SIER3)<br class=3D""><br class=3D"">Patch addes support to save/restore =
these new<br class=3D"">SPRs while entering/exiting guest.<br =
class=3D""></blockquote><br class=3D"">This mostly looks reasonable, at =
a quick glance at least, but I am<br class=3D"">puzzled by two of the =
changes you are making. &nbsp;See below.<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">diff --git =
a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c<br =
class=3D"">index 6bf66649..c265800 100644<br class=3D"">--- =
a/arch/powerpc/kvm/book3s_hv.c<br class=3D"">+++ =
b/arch/powerpc/kvm/book3s_hv.c<br class=3D"">@@ -1698,7 +1698,8 @@ =
static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>*val =3D get_reg_val(id, vcpu-&gt;arch.sdar);<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>break;<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>case KVM_REG_PPC_SIER:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>*val =3D get_reg_val(id, vcpu-&gt;arch.sier);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i =3D id =
- KVM_REG_PPC_SIER;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>*val =3D get_reg_val(id, =
vcpu-&gt;arch.sier[i]);<br class=3D""></blockquote><br class=3D"">This =
is inside a switch (id) statement, so here we know that id is<br =
class=3D"">KVM_REG_PPC_SIER. &nbsp;In other words i will always be zero, =
so what is<br class=3D"">the point of doing the subtraction?<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>break;<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>case KVM_REG_PPC_IAMR:<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>*val =3D =
get_reg_val(id, vcpu-&gt;arch.iamr);<br class=3D"">@@ -1919,7 +1920,8 @@ =
static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>vcpu-&gt;arch.sdar =3D set_reg_val(id, *val);<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>break;<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>case KVM_REG_PPC_SIER:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>vcpu-&gt;arch.sier =3D set_reg_val(id, *val);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i =3D id =
- KVM_REG_PPC_SIER;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>vcpu-&gt;arch.sier[i] =3D =
set_reg_val(id, *val);<br class=3D""></blockquote><br class=3D"">Same =
comment here.<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">Hi Paul,</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
min-height: 14px;" class=3D""><br class=3D""></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;;" class=3D"">Thanks for reviewing the patch. =
Yes, true that currently `id` will be zero since it is only =
KVM_REG_PPC_SIER. I have kept the subtraction here considering that =
there will be addition of new registers to switch case.&nbsp;</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">ex: case =
KVM_REG_PPC_SIER..KVM_REG_PPC_SIER3</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D""><br class=3D""></div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""><br class=3D"">I think that =
new defines for the new registers will need to be added<br class=3D"">to =
arch/powerpc/include/uapi/asm/kvm.h and<br =
class=3D"">Documentation/virt/kvm/api.rst, and then new cases will need =
to be<br class=3D"">added to these switch statements.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">Yes, New registers =
are not yet added to kvm.h&nbsp;</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">I will address these comments and include =
changes for arch/powerpc/include/uapi/asm/kvm.h and =
Documentation/virt/kvm/api.rst in the</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">next version.</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D""><br class=3D""></div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""><br class=3D"">By the way, =
please cc <a href=3D"mailto:kvm-ppc@vger.kernel.org" =
class=3D"">kvm-ppc@vger.kernel.org</a> and <a =
href=3D"mailto:kvm@vger.kernel.org" class=3D"">kvm@vger.kernel.org</a><br =
class=3D"">on KVM patches.<br class=3D""></div></div></blockquote><div><br=
 class=3D""></div><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;;" class=3D"">Sure, =
will include KVM mailing list in the next version</span></div><div><font =
color=3D"#000000" face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></font></div><div><font color=3D"#000000" =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0);" class=3D"">Thanks</span></font></div><div><font color=3D"#000000" =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0);" class=3D"">Athira&nbsp;<br class=3D""></span></font><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D""><br =
class=3D"">Paul.<br class=3D""></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_CD3873F7-2EA2-4365-9C84-3F96807D1A85--

