Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD8229052
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 08:05:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBQ0q6qYFzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 16:04:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPgk3fNczDqtZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:50:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M5Yj5O072650; Wed, 22 Jul 2020 01:50:04 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vrnad9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 01:50:03 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M5lQhh028381;
 Wed, 22 Jul 2020 05:50:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 32brq82dma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 05:50:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06M5mZ5P62390556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 05:48:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8EF211C04A;
 Wed, 22 Jul 2020 05:49:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 117E511C04C;
 Wed, 22 Jul 2020 05:49:56 +0000 (GMT)
Received: from [9.85.103.169] (unknown [9.85.103.169])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 05:49:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <4E79629C-CB5B-450F-B00B-04267FAF1F13@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_373E7DF6-25B7-4763-98BF-D1995093FADF"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v3 02/15] KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
Date: Wed, 22 Jul 2020 11:19:53 +0530
In-Reply-To: <87y2ncqi5s.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-3-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20200721035420.GA3819606@thinks.paulus.ozlabs.org>
 <B83C440A-1AC4-4737-8AB1-EB9A6B8A474B@linux.vnet.ibm.com>
 <87y2ncqi5s.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_02:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220040
X-Mailman-Approved-At: Wed, 22 Jul 2020 16:03:31 +1000
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
Cc: ego@linux.vnet.ibm.com, Michael Neuling <mikey@neuling.org>,
 maddy@linux.vnet.ibm.com, kvm@vger.kernel.org, svaidyan@in.ibm.com,
 kvm-ppc@vger.kernel.org, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_373E7DF6-25B7-4763-98BF-D1995093FADF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 22-Jul-2020, at 10:07 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>>> On 21-Jul-2020, at 9:24 AM, Paul Mackerras <paulus@ozlabs.org> =
wrote:
>>> On Fri, Jul 17, 2020 at 10:38:14AM -0400, Athira Rajeev wrote:
>>>> Currently `kvm_vcpu_arch` stores all Monitor Mode Control registers
>>>> in a flat array in order: mmcr0, mmcr1, mmcra, mmcr2, mmcrs
>>>> Split this to give mmcra and mmcrs its own entries in vcpu and
>>>> use a flat array for mmcr0 to mmcr2. This patch implements this
>>>> cleanup to make code easier to read.
>>>=20
>>> Changing the way KVM stores these values internally is fine, but
>>> changing the user ABI is not.  This part:
>>>=20
>>>> diff --git a/arch/powerpc/include/uapi/asm/kvm.h =
b/arch/powerpc/include/uapi/asm/kvm.h
>>>> index 264e266..e55d847 100644
>>>> --- a/arch/powerpc/include/uapi/asm/kvm.h
>>>> +++ b/arch/powerpc/include/uapi/asm/kvm.h
>>>> @@ -510,8 +510,8 @@ struct kvm_ppc_cpu_char {
>>>>=20
>>>> #define KVM_REG_PPC_MMCR0	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)
>>>> #define KVM_REG_PPC_MMCR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x11)
>>>> -#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
>>>> -#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
>>>> +#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
>>>> +#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
>>>=20
>>> means that existing userspace programs that used to work would now =
be
>>> broken.  That is not acceptable (breaking the user ABI is only ever
>>> acceptable with a very compelling reason).  So NAK to this part of =
the
>>> patch.
>>=20
>> Hi Paul
>>=20
>> Thanks for checking the patch. I understood your point on user ABI =
breakage that this particular change can cause.
>> I will retain original KVM_REG_PPC_MMCRA and KVM_REG_PPC_MMCR2 order =
in `kvm.h`
>> And with that, additionally I will need below change ( on top of =
current patch ) for my clean up updates for kvm cpu MMCR to work,
>> Because now mmcra and mmcrs will have its own entries in vcpu and is =
not part of the mmcr[] array
>> Please suggest if this looks good
>=20
> I did the same patch I think in my testing branch, it's here:
>=20
> =
https://github.com/linuxppc/linux/commit/daea78154eff1b7e2f36be05a8f95feb5=
a588912 =
<https://github.com/linuxppc/linux/commit/daea78154eff1b7e2f36be05a8f95feb=
5a588912>
>=20
>=20
> Can you please check that matches what you sent.

Hi Michael,

Yes, it matches. Thanks for making this change.

>=20
> cheers
>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c =
b/arch/powerpc/kvm/book3s_hv.c
>> index 3f90eee261fc..b10bb404f0d5 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1679,10 +1679,13 @@ static int kvmppc_get_one_reg_hv(struct =
kvm_vcpu *vcpu, u64 id,
>>        case KVM_REG_PPC_UAMOR:
>>                *val =3D get_reg_val(id, vcpu->arch.uamor);
>>                break;
>> -       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR2:
>> +       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
>>                i =3D id - KVM_REG_PPC_MMCR0;
>>                *val =3D get_reg_val(id, vcpu->arch.mmcr[i]);
>>                break;
>> +       case KVM_REG_PPC_MMCR2:
>> +               *val =3D get_reg_val(id, vcpu->arch.mmcr[2]);
>> +               break;
>>        case KVM_REG_PPC_MMCRA:
>>                *val =3D get_reg_val(id, vcpu->arch.mmcra);
>>                break;
>> @@ -1906,10 +1909,13 @@ static int kvmppc_set_one_reg_hv(struct =
kvm_vcpu *vcpu, u64 id,
>>        case KVM_REG_PPC_UAMOR:
>>                vcpu->arch.uamor =3D set_reg_val(id, *val);
>>                break;
>> -       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR2:
>> +       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
>>                i =3D id - KVM_REG_PPC_MMCR0;
>>                vcpu->arch.mmcr[i] =3D set_reg_val(id, *val);
>>                break;
>> +       case KVM_REG_PPC_MMCR2:
>> +               vcpu->arch.mmcr[2] =3D set_reg_val(id, *val);
>> +               break;
>>        case KVM_REG_PPC_MMCRA:
>>                vcpu->arch.mmcra =3D set_reg_val(id, *val);
>>                break;
>> =E2=80=94
>>=20
>>=20
>>>=20
>>> Regards,
>>> Paul.


--Apple-Mail=_373E7DF6-25B7-4763-98BF-D1995093FADF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 22-Jul-2020, at 10:07 AM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Athira Rajeev &lt;</span><a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">atrajeev@linux.vnet.ibm.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; writes:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" class=3D"">On=
 21-Jul-2020, at 9:24 AM, Paul Mackerras &lt;<a =
href=3D"mailto:paulus@ozlabs.org" class=3D"">paulus@ozlabs.org</a>&gt; =
wrote:<br class=3D"">On Fri, Jul 17, 2020 at 10:38:14AM -0400, Athira =
Rajeev wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Currently=
 `kvm_vcpu_arch` stores all Monitor Mode Control registers<br =
class=3D"">in a flat array in order: mmcr0, mmcr1, mmcra, mmcr2, =
mmcrs<br class=3D"">Split this to give mmcra and mmcrs its own entries =
in vcpu and<br class=3D"">use a flat array for mmcr0 to mmcr2. This =
patch implements this<br class=3D"">cleanup to make code easier to =
read.<br class=3D""></blockquote><br class=3D"">Changing the way KVM =
stores these values internally is fine, but<br class=3D"">changing the =
user ABI is not. &nbsp;This part:<br class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D"">diff --git =
a/arch/powerpc/include/uapi/asm/kvm.h =
b/arch/powerpc/include/uapi/asm/kvm.h<br class=3D"">index =
264e266..e55d847 100644<br class=3D"">--- =
a/arch/powerpc/include/uapi/asm/kvm.h<br class=3D"">+++ =
b/arch/powerpc/include/uapi/asm/kvm.h<br class=3D"">@@ -510,8 +510,8 @@ =
struct kvm_ppc_cpu_char {<br class=3D""><br class=3D"">#define =
KVM_REG_PPC_MMCR0<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)<br =
class=3D"">#define KVM_REG_PPC_MMCR1<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(KVM_REG_PPC | KVM_REG_SIZE_U64 | =
0x11)<br class=3D"">-#define KVM_REG_PPC_MMCRA<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)<br class=3D"">-#define =
KVM_REG_PPC_MMCR2<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)<br =
class=3D"">+#define KVM_REG_PPC_MMCR2<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(KVM_REG_PPC | KVM_REG_SIZE_U64 | =
0x12)<br class=3D"">+#define KVM_REG_PPC_MMCRA<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)<br =
class=3D""></blockquote><br class=3D"">means that existing userspace =
programs that used to work would now be<br class=3D"">broken. &nbsp;That =
is not acceptable (breaking the user ABI is only ever<br =
class=3D"">acceptable with a very compelling reason). &nbsp;So NAK to =
this part of the<br class=3D"">patch.<br class=3D""></blockquote><br =
class=3D"">Hi Paul<br class=3D""><br class=3D"">Thanks for checking the =
patch. I understood your point on user ABI breakage that this particular =
change can cause.<br class=3D"">I will retain original KVM_REG_PPC_MMCRA =
and KVM_REG_PPC_MMCR2 order in `kvm.h`<br class=3D"">And with that, =
additionally I will need below change ( on top of current patch ) for my =
clean up updates for kvm cpu MMCR to work,<br class=3D"">Because now =
mmcra and mmcrs will have its own entries in vcpu and is not part of the =
mmcr[] array<br class=3D"">Please suggest if this looks good<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I did the same patch I think in my testing branch, it's =
here:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><a =
href=3D"https://github.com/linuxppc/linux/commit/daea78154eff1b7e2f36be05a=
8f95feb5a588912" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://github.com/linuxppc/linux/commit/daea78154eff1b7e2f36be=
05a8f95feb5a588912</a><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Can you please check that matches what you sent.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div>Hi =
Michael,</div><div><br class=3D""></div><div>Yes, it matches. Thanks for =
making this change.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">cheers</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">diff --git =
a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c<br =
class=3D"">index 3f90eee261fc..b10bb404f0d5 100644<br class=3D"">--- =
a/arch/powerpc/kvm/book3s_hv.c<br class=3D"">+++ =
b/arch/powerpc/kvm/book3s_hv.c<br class=3D"">@@ -1679,10 +1679,13 @@ =
static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case =
KVM_REG_PPC_UAMOR:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;*val =3D get_reg_val(id, =
vcpu-&gt;arch.uamor);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case KVM_REG_PPC_MMCR0 ... =
KVM_REG_PPC_MMCR2:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case KVM_REG_PPC_MMCR0 ... =
KVM_REG_PPC_MMCR1:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;i =3D id - KVM_REG_PPC_MMCR0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;*val =3D get_reg_val(id, =
vcpu-&gt;arch.mmcr[i]);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case KVM_REG_PPC_MMCR2:<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;*val =3D get_reg_val(id, vcpu-&gt;arch.mmcr[2]);<br class=3D"">+=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;break;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case =
KVM_REG_PPC_MMCRA:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;*val =3D get_reg_val(id, =
vcpu-&gt;arch.mmcra);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">@@ -1906,10 +1909,13 @@ =
static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case =
KVM_REG_PPC_UAMOR:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;vcpu-&gt;arch.uamor =3D set_reg_val(id, =
*val);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case KVM_REG_PPC_MMCR0 ... =
KVM_REG_PPC_MMCR2:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case KVM_REG_PPC_MMCR0 ... =
KVM_REG_PPC_MMCR1:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;i =3D id - KVM_REG_PPC_MMCR0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;vcpu-&gt;arch.mmcr[i] =3D set_reg_val(id, =
*val);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case KVM_REG_PPC_MMCR2:<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;vcpu-&gt;arch.mmcr[2] =3D set_reg_val(id, *val);<br class=3D"">+=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;break;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case =
KVM_REG_PPC_MMCRA:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;vcpu-&gt;arch.mmcra =3D set_reg_val(id, =
*val);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">=E2=80=94<br =
class=3D""><br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D"">Regards,<br =
class=3D"">Paul.</blockquote></blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_373E7DF6-25B7-4763-98BF-D1995093FADF--

