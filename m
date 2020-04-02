Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72D19BC2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:06:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tDcn2VSLzDr3y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:06:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tDZz359tzDrMD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:04:42 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03274Wv7069675
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 03:04:40 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304gst3aex-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 03:04:40 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 2 Apr 2020 08:04:27 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 08:04:24 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03274Zpl42467488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 07:04:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3264BA405F;
 Thu,  2 Apr 2020 07:04:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C43B5A4066;
 Thu,  2 Apr 2020 07:04:34 +0000 (GMT)
Received: from localhost (unknown [9.85.74.67])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 07:04:34 +0000 (GMT)
Date: Thu, 02 Apr 2020 12:34:32 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 3/4] powerpc ppc-opcode: move ppc instuction encoding
 from test_emulate_step
To: Balamuruhan S <bala24@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
 <20200320081837.1016820-4-bala24@linux.ibm.com>
 <1585759165.2r0pc78n07.naveen@linux.ibm.com>
 <87ftdmtsy9.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ftdmtsy9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040207-0008-0000-0000-00000368E6D3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040207-0009-0000-0000-00004A8A7199
Message-Id: <1585810752.gtbei2f2gy.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020060
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 paulus@samba.org, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Balamuruhan S wrote:
>>> Few ppc instructions are encoded in test_emulate_step.c, consolidate th=
em to
>>> ppc-opcode.h, fix redefintion errors in bpf_jit caused due to this cons=
olidation.
>>> Reuse the macros from ppc-opcode.h
> ...
>>> diff --git a/arch/powerpc/net/bpf_jit32.h b/arch/powerpc/net/bpf_jit32.=
h
>>> index 4ec2a9f14f84..8a9f16a7262e 100644
>>> --- a/arch/powerpc/net/bpf_jit32.h
>>> +++ b/arch/powerpc/net/bpf_jit32.h
>>> @@ -76,13 +76,13 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
>>>  		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
>>>  			PPC_LBZ(r, r, IMM_L(i)); } } while(0)
>>>=20
>>> -#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) PPC_LD(r, base, =
i);     \
>>> +#define _OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_ENCODE_LD(r, =
base, i));     \
>> 	   ^^^^^
>> Should be PPC_LD_OFFS. For the next version, please also build ppc32 and=
=20
>> booke codebase to confirm that your changes in those areas are fine.
>>
>> PPC_ENCODE_* also looks quite verbose, so perhaps PPC_ENC_* might be=20
>> better. Otherwise, this patchset looks good to me and should help reuse=20
>> some of those macros, especially from the eBPF codebase.
>>
>> Michael,
>> Can you let us know if this looks ok to you? Based on your feedback, we=20
>> will also update the eBPF codebase.
>=20
> I didn't really like the first patch which does the mass renaming. It
> creates a huge amount of churn.
>=20
> I think I'd be happier if this series just did what it needs, and then
> maybe at the end there's a patch to update all the existing names, which
> I may or may not take.

Ok.

>=20
> As far as the naming, currently we have:
>=20
> PPC_INST_FOO - just the opcode
>=20
> PPC_FOO(x) - macro to encode the opcode with x and (usually) also emit a
>             .long and stringify.
>=20
> And you need an in-between that gives you the full instruction but
> without the .long and stringify, right?

Yes.

>=20
> So how about PPC_RAW_FOO() for just the numeric value, without the .long
> and stringify.

Sure, thanks for the feedback -- that makes sense.

>=20
> We also seem to have a lot of PPC_INST_FOO's that are only ever used in
> the PPC_INST macro. I'm inclined to fold those into the PPC_INST macro,
> to avoid people accidentally using the PPC_INST version when they don't
> mean to. But that's a separate issue.

Good point -- I do see many uses of PPC_INST_FOO that can be replaced=20
with PPC_RAW_FOO once we introduce that. We will take a stab at doing=20
this cleanup as a separate patch at the end.


Thanks,
Naveen

