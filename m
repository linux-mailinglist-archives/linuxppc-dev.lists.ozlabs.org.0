Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF034BFB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:12:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7s0w4KXcz30G2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=oqrm5Avb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.57; helo=pv50p00im-ztbu10021601.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=oqrm5Avb; dkim-atps=neutral
Received: from pv50p00im-ztbu10021601.me.com (pv50p00im-ztbu10021601.me.com
 [17.58.6.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7s0V6rnCz2yZF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:11:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1616973096; bh=F+acd+wAtwxDeIH3a/XI8b+galC2ktSCYvgePmLFg0o=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=oqrm5AvbsdX312NT8NpR5RU2cYzzJv6BJNTgIA7sVLSRr1XG9v50I9uhv5X/g55sz
 AO+/tbShntRQmm/6Z/UTRNIZyTea4kh+Td1Tb77HgPfltjSbFD965CoxvRhpARRAJN
 qPBuiNurVRZ8IEG4XhY19PDDJdCCDHT8qkcxjl2LO0ZFyLmGugxclSgAsYo3s4zhdP
 XWRB78DQ3OBwkN5IsMKcC3duYT7hlEdl0oTlDF2ZpJqg54eY1cIKFc3FmeonkEwoT4
 WYS3KIDaenewPQrESyltZA4SMS8DftUsCrFyXkaGOsLFxLdJ/vw+HTOk8bRxgo7tX0
 GiRYxvwPE2Tdg==
Received: from 192.168.1.5 (unknown [120.245.2.89])
 by pv50p00im-ztbu10021601.me.com (Postfix) with ESMTPSA id C8A9E6E025D;
 Sun, 28 Mar 2021 23:11:32 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/process: Enhance readability for trap types.
From: Xiongwei Song <sxwjean@me.com>
In-Reply-To: <8de71b45-efea-b493-ee90-b89062e8e30f@csgroup.eu>
Date: Mon, 29 Mar 2021 07:11:29 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C228D50-4378-4477-857A-D34D46BDEF5D@me.com>
References: <20210328143545.24324-1-sxwjean@me.com>
 <8de71b45-efea-b493-ee90-b89062e8e30f@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-28_13:2021-03-26,
 2021-03-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2103280179
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 Xiongwei Song <sxwjean@gmail.com>, haren@linux.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Mar 28, 2021, at 11:21 PM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 28/03/2021 =C3=A0 16:35, Xiongwei Song a =C3=A9crit :
>> From: Xiongwei Song <sxwjean@gmail.com>
>> Define macros to enhance the code readability on ppc trap types.
>=20
> Good idea
>=20
>> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
>> ---
>>  arch/powerpc/kernel/process.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> diff --git a/arch/powerpc/kernel/process.c =
b/arch/powerpc/kernel/process.c
>> index 3231c2df9e26..3bbd3cf353a7 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -1451,6 +1451,10 @@ static void print_msr_bits(unsigned long val)
>>  #define LAST_VOLATILE	12
>>  #endif
>>  +#define TRAP_MC  0x200 /* Machine Check */
>=20
> I think usually we use MCE, so TRAP_MCE would be better

Ok.
>=20
>> +#define TRAP_DSI 0x300 /* DSI exception */
>> +#define TRAP_AM  0x600 /* Alignment exception */
>=20
> Don't know what AM means. TRAP_ALIGN would be more explicit.

No Problem.
>=20
>> +
>=20
> The defines should go in a header file, for instance asm/ptrace.h in =
order to be re-used in other files.

Agree.
>=20
> You should do more. You can find other places to improve with:
>=20
> git grep "trap =3D=3D" arch/powerpc/
> git grep "TRAP(regs) =3D=3D" arch/powerpc/

Just ran =E2=80=9Cgit grep=E2=80=9D, looks like the work is much bigger =
than what I imagined.
>=20
>>  static void __show_regs(struct pt_regs *regs)
>>  {
>>  	int i, trap;
>> @@ -1465,7 +1469,7 @@ static void __show_regs(struct pt_regs *regs)
>>  	trap =3D TRAP(regs);
>>  	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
>>  		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
>> -	if (trap =3D=3D 0x200 || trap =3D=3D 0x300 || trap =3D=3D 0x600) =
{
>> +	if (trap =3D=3D TRAP_MC || trap =3D=3D TRAP_DSI || trap =3D=3D =
TRAP_AM) {
>>  		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
>>  			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, =
regs->dsisr);
>>  		else

Thanks for the response. I will send v2.

 Regards,
Xiongwei=
