Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 422041956A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 12:55:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pgKH2QPZzDrCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 22:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pgGl1s95zDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 22:53:19 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RBXGTJ165430
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 07:53:17 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywek0ts9s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 07:53:16 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <atrajeev@linux.vnet.ibm.com>;
 Fri, 27 Mar 2020 11:53:13 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Mar 2020 11:53:11 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02RBq8ox40632700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 11:52:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D90B44C04E;
 Fri, 27 Mar 2020 11:53:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F1C4C044;
 Fri, 27 Mar 2020 11:53:10 +0000 (GMT)
Received: from [9.85.111.41] (unknown [9.85.111.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 27 Mar 2020 11:53:09 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v3] powerpc/perf: Use SIER_USER_MASK while updating
 SPRN_SIER for EBB events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87r1xod3c3.fsf@mpe.ellerman.id.au>
Date: Fri, 27 Mar 2020 17:23:08 +0530
Content-Transfer-Encoding: quoted-printable
References: <1584533181-4331-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87r1xod3c3.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20032711-0028-0000-0000-000003ECCEA3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032711-0029-0000-0000-000024B246A5
Message-Id: <8C50DF8B-1CBB-4365-B068-C8DA5B7D1148@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_03:2020-03-27,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270106
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Mar-2020, at 4:22 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Hi Athira,
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> Sampled Instruction Event Register (SIER), is a PMU register,
>                                                               ^
>                                                               that
>> captures architecture state for a given sample. And sier_user_mask
>           ^                                          ^
>           don't think we need "architecture"         SIER_USER_MASK
>=20
>> defined in commit 330a1eb7775b ("powerpc/perf: Core EBB support for =
64-bit
>> book3s") defines the architected bits that needs to be saved from the =
SPR.
>=20
> Not quite, it defines the bits that are visible to userspace.
>=20
> And I think it's true that for EBB events the bits we need/want to =
save
> are only the user visible bits.
>=20
>> Currently all of the bits from SIER are saved for EBB events. Patch =
fixes
>> this by ANDing the "sier_user_mask" to data from SIER in =
ebb_switch_out().
>> This will force save only architected bits from the SIER.
>=20
> s/architected/user visible/
>=20
>=20
> But, why does it matter? The kernel saves the user visible bits, as =
well
> as the kernel-only bits into the thread struct. And then later the
> kernel restores that value into the hardware before returning to
> userspace.
>=20
> But the hardware enforces the visibility of the bits, so userspace =
can't
> observe any bits that it shouldn't.
>=20
> Or is there some other mechanism whereby userspace can see those bits? =
;)
>=20
> If there was, what would the security implications of that be?

Hi Michael,

Thanks for your comments.=20

In ebb_switch_in, we set PMCC bit [MMCR0 44:45 ] to 10 which means SIER =
( Group B ) register is readable in problem state. Hence the intention =
of the patch was to make sure we are not exposing the bits which the =
userspace shouldn't be reading.=20

But following your comment about "hardware enforcing the visibility of =
bits", I did try an "ebb" experiment which showed that reading SPRN_SIER =
didn't expose any bits other than the user visible bits. Sorry for the =
confusion here.=20

In that case, Can we drop the existing definition of SIER_USER_MASK if =
it is no more needed ?

Thanks
Athira
>=20
> cheers
>=20
>> Fixes: 330a1eb7775b ("powerpc/perf: Core EBB support for 64-bit =
book3s")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> Changelog:
>> v2 -> v3:
>> - Corrected name of SIER register in commit message
>>  as pointed by Segher Boessenkool
>> v1 -> v2:
>> - Make the commit message more clearer.
>>=20
>> arch/powerpc/perf/core-book3s.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 3086055..48b61cc 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -579,7 +579,7 @@ static void ebb_switch_out(unsigned long mmcr0)
>> 		return;
>>=20
>> 	current->thread.siar  =3D mfspr(SPRN_SIAR);
>> -	current->thread.sier  =3D mfspr(SPRN_SIER);
>> +	current->thread.sier  =3D mfspr(SPRN_SIER) & SIER_USER_MASK;
>> 	current->thread.sdar  =3D mfspr(SPRN_SDAR);
>> 	current->thread.mmcr0 =3D mmcr0 & MMCR0_USER_MASK;
>> 	current->thread.mmcr2 =3D mfspr(SPRN_MMCR2) & MMCR2_USER_MASK;
>> --=20
>> 1.8.3.1

