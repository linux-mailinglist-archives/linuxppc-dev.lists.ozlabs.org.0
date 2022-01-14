Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258148E51F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 08:59:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZtxc0ZmJz30Ly
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 18:59:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OpDe5TMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OpDe5TMn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZtwm3T36z2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 18:59:03 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20E7RZqT025960; 
 Fri, 14 Jan 2022 07:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=Cesl+No+0sOGeGnRqupy1/fhMOaN8mokgd7VZS/yh+o=;
 b=OpDe5TMnxSz6WbTjusmzFOSVHCzXzceNntoZsxF+Dnvom9xDpuu8mQhRetjRiqgmEHZE
 NXjPV7HEg9dR9V1sw5DOVuzn61aIr1TCVne3nZSMLrh7BeqMgSIRkD88vP+xfSjWpv+e
 Ch+1OcMgSg6QcA0fimz+cbP9cz0hK8A8GNC6te7UbIY/HhFOTi9IUgYbmBmdpr+wrWzi
 3zsY5GLUoSRuUIzFeMxbr9JnKiB+axlw3QWxp2f6bvOQ8Q9XOPe4L7rZCWWetVDULmDT
 8TjSoTyg2R4zRuMHlg/o8Z9DqvbL3qNL7t3G6gQ1yXG5SvNPptBXf85N2aaKCuJoyMbA KQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dk4t58g2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 07:58:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20E7koq0021905;
 Fri, 14 Jan 2022 07:58:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjved3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 07:58:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20E7wms638011348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 07:58:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40ACF42041;
 Fri, 14 Jan 2022 07:58:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6C9342042;
 Fri, 14 Jan 2022 07:58:47 +0000 (GMT)
Received: from localhost (unknown [9.43.21.93])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jan 2022 07:58:47 +0000 (GMT)
Date: Fri, 14 Jan 2022 13:28:46 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and
 TMP_REG when possible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <b04c246874b716911139c04bc004b3b14eed07ef.1641817763.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b04c246874b716911139c04bc004b3b14eed07ef.1641817763.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1642147004.dum5th9cvl.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VqQotbyCuTjboUUftVpRbmYP6Cec2Cau
X-Proofpoint-ORIG-GUID: VqQotbyCuTjboUUftVpRbmYP6Cec2Cau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_02,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140052
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> BPF_REG_5, BPF_REG_AX and TMP_REG are mapped on non volatile registers
> because there are not enough volatile registers, but they don't need
> to be preserved on function calls.
>=20
> So when some volatile registers become available, those registers can
> always be reallocated regardless of whether SEEN_FUNC is set or not.
>=20
> Suggested-by: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/net/bpf_jit.h        |  3 ---
>  arch/powerpc/net/bpf_jit_comp32.c | 14 +++++++++++---
>  2 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index b20a2a83a6e7..b75507fc8f6b 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -127,9 +127,6 @@
>  #define SEEN_FUNC	0x20000000 /* might call external helpers */
>  #define SEEN_TAILCALL	0x40000000 /* uses tail calls */
> =20
> -#define SEEN_VREG_MASK	0x1ff80000 /* Volatile registers r3-r12 */
> -#define SEEN_NVREG_MASK	0x0003ffff /* Non volatile registers r14-r31 */
> -
>  #ifdef CONFIG_PPC64
>  extern const int b2p[MAX_BPF_JIT_REG + 2];
>  #else
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit=
_comp32.c
> index d3a52cd42f53..cfec42c8a511 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -77,14 +77,22 @@ static int bpf_jit_stack_offsetof(struct codegen_cont=
ext *ctx, int reg)
>  	return BPF_PPC_STACKFRAME(ctx) - 4;
>  }
> =20
> +#define SEEN_VREG_MASK		0x1ff80000 /* Volatile registers r3-r12 */
> +#define SEEN_NVREG_FULL_MASK	0x0003ffff /* Non volatile registers r14-r3=
1 */
> +#define SEEN_NVREG_TEMP_MASK	0x00001e01 /* BPF_REG_5, BPF_REG_AX, TMP_RE=
G */

Could have been named better: SEEN_NVREG_BPF_VGER_MASK, or such.
Apart from that:
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

