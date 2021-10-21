Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D874358BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 04:53:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZX920PzNz307W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 13:53:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UhDprwNN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UhDprwNN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZX8F02JDz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 13:52:28 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L2kuDt010962; 
 Wed, 20 Oct 2021 22:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xNp+TAEZkkIWEGvh85DnT3jeYhB5uHlVeHhePbUDj/0=;
 b=UhDprwNNGB2C+NfNwAXf/pbbcm0WcGs9fGlS/hYIyUhJ6Pg/PE7FC58PaU6BxXbIO8YI
 j0Uo2noGKRGHZLaanEF6VBJ52eUo5Vm3OPHd32u/cSFCStf/yjAY5Hf2f9FFyPN1U94f
 u5dErznDNh8RwzpF7+TLPQFWA6GDV+evXyn+8/kxgEwFN/bWCKoERthDFvOZhEvuTPbX
 zZ4CJDeJFHw8KMvyP0I5DkcdrDEI3Tr9vNz0C3cl0n2G6OT68ujleHth4zqv8UMxVFM0
 l3PBmSNniCTfhA+pV1womvz7Nbu6+Fhxmtm57cZ6HXO80xq+o3B4NcQ/abzNoXe5/QiN GA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3btyqq837m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 22:52:19 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19L2RdRb010044;
 Thu, 21 Oct 2021 02:52:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3bqpcby8vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 02:52:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19L2qDcq2818802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 02:52:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B42414C046;
 Thu, 21 Oct 2021 02:52:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2571E4C04A;
 Thu, 21 Oct 2021 02:52:12 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.191.202])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 21 Oct 2021 02:52:11 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [V4 0/2] tools/perf: Add instruction and data address registers
 to extended regs in powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YW7yjZE8LKvgjapw@kernel.org>
Date: Thu, 21 Oct 2021 08:22:02 +0530
Message-Id: <43CD6E77-526E-4B6A-972A-1D194242CECD@linux.vnet.ibm.com>
References: <20211018114948.16830-1-atrajeev@linux.vnet.ibm.com>
 <YW7yjZE8LKvgjapw@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ToJFIJJvJEhG4XE95ZfR08i1bY2heTzB
X-Proofpoint-GUID: ToJFIJJvJEhG4XE95ZfR08i1bY2heTzB
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210010
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Oct-2021, at 10:00 PM, Arnaldo Carvalho de Melo <acme@kernel.org> w=
rote:
>=20
> Em Mon, Oct 18, 2021 at 05:19:46PM +0530, Athira Rajeev escreveu:
>> Patch set adds PMU registers namely Sampled Instruction Address Register
>> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
>> in PowerPC. These registers provides the instruction/data address and
>> adding these to extended regs helps in debug purposes.
>>=20
>> Patch 1/2 refactors the existing macro definition of
>> PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to make it more
>> readable.
>> Patch 2/2 includes perf tools side changes to add the SPRs to
>> sample_reg_mask to use with -I? option.
>=20
> Thanks, applied.
>=20
> - Arnaldo

Thanks Arnaldo.

Athira
>=20
>=20
>> Changelog:
>> Change from v3 -> v4:
>> - Spilt tools side patches separately since kernel side
>>  changes are in powerpc/next. There is no code wise changes
>>  from v3.
>>  Link to previous version:
>>  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D265811=
&state=3D*
>>=20
>>  Kernel patches are taken to powerpc/next:
>>  [1/4] powerpc/perf: Refactor the code definition of perf reg extended m=
ask
>>  https://git.kernel.org/powerpc/c/02b182e67482d9167a13a0ff19b55037b70b21=
ad
>>  [3/4] powerpc/perf: Expose instruction and data address registers as pa=
rt of extended regs
>>  https://git.kernel.org/powerpc/c/29908bbf7b8960d261dfdd428bbaa656275e80=
f3
>>=20
>> Change from v2 -> v3:
>> Addressed review comments from Michael Ellerman
>> - Fixed the macro definition to use "unsigned long long"
>>  which otherwise will cause build error with perf on
>>  32-bit.
>> - Added Reviewed-by from Daniel Axtens for patch3.
>>=20
>> Change from v1 -> v2:
>> Addressed review comments from Michael Ellerman
>> - Refactored the perf reg extended mask value macros for
>>  PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to
>>  make it more readable. Also moved PERF_REG_EXTENDED_MAX
>>  along with enum definition similar to PERF_REG_POWERPC_MAX.
>>=20
>> Athira Rajeev (2):
>>  tools/perf: Refactor the code definition of perf reg extended mask in
>>    tools side header file
>>  tools/perf: Add perf tools support to expose instruction and data
>>    address registers as part of extended regs
>>=20
>> .../arch/powerpc/include/uapi/asm/perf_regs.h | 28 ++++++++++++-------
>> tools/perf/arch/powerpc/include/perf_regs.h   |  2 ++
>> tools/perf/arch/powerpc/util/perf_regs.c      |  2 ++
>> 3 files changed, 22 insertions(+), 10 deletions(-)
>>=20
>> --=20
>> 2.33.0
>=20
> --=20
>=20
> - Arnaldo

