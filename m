Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351819A9D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 12:57:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sjpQ6DVbzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 21:57:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sjmX1LlMzDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 21:56:12 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031AXpjL015406
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 06:56:09 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304hja5eme-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 06:56:09 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 1 Apr 2020 11:55:50 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 11:55:48 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 031Au3mR42271078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 10:56:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3524852057;
 Wed,  1 Apr 2020 10:56:03 +0000 (GMT)
Received: from localhost (unknown [9.85.74.146])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B246B52052;
 Wed,  1 Apr 2020 10:56:02 +0000 (GMT)
Date: Wed, 01 Apr 2020 16:26:00 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] powerpc test_emulate_step: add testcases for
 divde[.] and divdeu[.] instructions
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200120065426.3259-1-bala24@linux.ibm.com>
 <20200120065426.3259-4-bala24@linux.ibm.com>
In-Reply-To: <20200120065426.3259-4-bala24@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040110-0020-0000-0000-000003BF8E1D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040110-0021-0000-0000-000022183372
Message-Id: <1585738460.fzpd1gjpyj.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=694
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010092
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S wrote:
> add testcases for divde, divde., divdeu, divdeu. emulated
> instructions to cover few scenarios,
>         * with same dividend and divisor to have undefine RT
>           for divdeu[.]
>         * with divide by zero to have undefine RT for both
>           divde[.] and divdeu[.]
>         * with negative dividend to cover -|divisor| < r <=3D 0 if
>           the dividend is negative for divde[.]
>         * normal case with proper dividend and divisor for both
>           divde[.] and divdeu[.]
>=20
> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  arch/powerpc/lib/test_emulate_step.c | 164 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 164 insertions(+)
>=20
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test=
_emulate_step.c
> index 42347067739c..ffeb9b68a31d 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -53,6 +53,14 @@
>  					___PPC_RA(a) | ___PPC_RB(b))
>  #define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
>  					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> +#define TEST_DIVDE(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
> +					___PPC_RA(a) | ___PPC_RB(b))
> +#define TEST_DIVDE_DOT(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
> +					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> +#define TEST_DIVDEU(t, a, b)	(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
> +					___PPC_RA(a) | ___PPC_RB(b))
> +#define TEST_DIVDEU_DOT(t, a, b)(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
> +					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
>=20
>  #define MAX_SUBTESTS	16
>=20
> @@ -837,6 +845,162 @@ static struct compute_test compute_tests[] =3D {
>  				}
>  			}
>  		}
> +	},
> +	{
> +		.mnemonic =3D "divde",
> +		.subtests =3D {
> +			{
> +				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
> +				.instr =3D TEST_DIVDE(20, 21, 22),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MIN,
> +					.gpr[22] =3D LONG_MIN,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D 1L, RB =3D 0",
> +				.instr =3D TEST_DIVDE(20, 21, 22),
> +				.flags =3D IGNORE_GPR(20),
> +				.regs =3D {
> +					.gpr[21] =3D 1L,
> +					.gpr[22] =3D 0,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> +				.instr =3D TEST_DIVDE(20, 21, 22),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MIN,
> +					.gpr[22] =3D LONG_MAX,
> +				}
> +			}
> +		}
> +	},
> +	{
> +		.mnemonic =3D "divde.",
> +		.subtests =3D {
> +			{
> +				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
> +				.instr =3D TEST_DIVDE_DOT(20, 21, 22),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MIN,
> +					.gpr[22] =3D LONG_MIN,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D 1L, RB =3D 0",
> +				.instr =3D TEST_DIVDE_DOT(20, 21, 22),
> +				.flags =3D IGNORE_GPR(20),
> +				.regs =3D {
> +					.gpr[21] =3D 1L,
> +					.gpr[22] =3D 0,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> +				.instr =3D TEST_DIVDE_DOT(20, 21, 22),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MIN,
> +					.gpr[22] =3D LONG_MAX,
> +				}
> +			}
> +		}
> +	},
> +	{
> +		.mnemonic =3D "divdeu",
> +		.subtests =3D {
> +			{
> +				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
> +				.instr =3D TEST_DIVDEU(20, 21, 22),
> +				.flags =3D IGNORE_GPR(20),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MIN,
> +					.gpr[22] =3D LONG_MIN,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D 1L, RB =3D 0",
> +				.instr =3D TEST_DIVDEU(20, 21, 22),
> +				.flags =3D IGNORE_GPR(20),
> +				.regs =3D {
> +					.gpr[21] =3D 1L,
> +					.gpr[22] =3D 0,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> +				.instr =3D TEST_DIVDEU(20, 21, 22),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MIN,
> +					.gpr[22] =3D LONG_MAX,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D LONG_MAX - 1, RB =3D LONG_MAX",
> +				.instr =3D TEST_DIVDEU_DOT(20, 21, 22),
> +				.regs =3D {
> +					.gpr[21] =3D LONG_MAX - 1,
> +					.gpr[22] =3D LONG_MAX,
> +				}
> +			},
> +			{
> +				.descr =3D "RA =3D LONG_MIN + 1, RB =3D LONG_MIN",
> +				.instr =3D TEST_DIVDEU_DOT(20, 21, 22),

I think you meant to use TEST_DIVDEU here ^^^^^ and in the test before,=20
rather than TEST_DIVDEU_DOT.

Apart from them, for this series:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

