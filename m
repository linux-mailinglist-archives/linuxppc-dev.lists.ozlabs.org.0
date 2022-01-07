Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D3487B62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 18:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVqrm27zkz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 04:26:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EoEQlbqp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EoEQlbqp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVqr16ftRz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 04:25:53 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207GU6O6018171; 
 Fri, 7 Jan 2022 17:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=XuGhj7wXqAn25QSjHVfdyxl1QV1SCl2MJdiji0dRGIY=;
 b=EoEQlbqpC/V0sHWyTRY00c0kQasiTGf9hjwXE6Awb6OAfs6Ib801Yusj0DTpmTLQ6vUz
 WUboHaq+emPyI1sMFRs0maTmInhlZN8VjprGMR7PqDk0XQijGh6xyXDtdbGNfTAj1liE
 hgcBIB47OVEMQzWnKQXAG2IT1tYB1vgci21wJcXC9ItJZ7JDTWH+49CKnDlLZGpIeoPt
 8caCMYeBy3rXL0RfgSdrZQmUXBSiUnKbZsXFLSqd03jlVOkGpFUNAZWDEeTbziubnARa
 NhkOK8saBHA/uZo65ltGa+jxDTNz5kk+rpziqDNfq7QBRtcWYxD28+M8scKwTUT9ymNJ TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wfxcp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:25:46 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207Gnshd016718;
 Fri, 7 Jan 2022 17:25:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wfxcn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:25:45 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207HHJsp027114;
 Fri, 7 Jan 2022 17:25:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3de4xbfq5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:25:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207HPfKt46727638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 17:25:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21DFF4C040;
 Fri,  7 Jan 2022 17:25:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9C3B4C044;
 Fri,  7 Jan 2022 17:25:39 +0000 (GMT)
Received: from localhost (unknown [9.43.90.227])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 17:25:39 +0000 (GMT)
Date: Fri, 07 Jan 2022 22:55:37 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/bpf: Use helper for mapping bpf to ppc
 registers on PPC64
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210727065539.299598-1-jniethe5@gmail.com>
 <20210727065539.299598-2-jniethe5@gmail.com>
In-Reply-To: <20210727065539.299598-2-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641575636.et67byesmr.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZTjuDDDuifAh0_a-EhWkzbQWDm_I-JBN
X-Proofpoint-GUID: BgAIYGgZLoPFlwFVyKXSU4DsWLM8DVG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_07,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070113
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe wrote:
> Prepare for doing commit 40272035e1d0 ("powerpc/bpf: Reallocate BPF
> registers to volatile registers when possible on PPC32") on PPC64 in a
> later patch. Instead of directly accessing the const b2p[] array for
> mapping bpf to ppc registers use bpf_to_ppc() which allows per struct
> codegen_context mappings.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/net/bpf_jit.h        |  5 ++
>  arch/powerpc/net/bpf_jit64.h      | 30 +++++-----
>  arch/powerpc/net/bpf_jit_comp32.c |  5 --
>  arch/powerpc/net/bpf_jit_comp64.c | 96 ++++++++++++++++---------------
>  4 files changed, 71 insertions(+), 65 deletions(-)
>=20
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 99fad093f43e..db86fa37f1dd 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -172,6 +172,11 @@ void bpf_jit_build_prologue(u32 *image, struct codeg=
en_context *ctx);
>  void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
>  void bpf_jit_realloc_regs(struct codegen_context *ctx);
>=20
> +static inline int bpf_to_ppc(struct codegen_context *ctx, int reg)
> +{
> +	return ctx->b2p[reg];
> +}
> +
>  #endif

You are following what has been done on ppc32 here, but since ctx is=20
almost always available where b2p[] is used, I'm thinking it might be=20
simpler to convert it into a macro:

#define b2p(i)	ctx->cb2p[i]

We will just need to rename the global b2p array, as well as the one in=20
codegen_context. Everywhere else, it will be a simple b2p[] -> b2p()=20
change.


- Naveen

