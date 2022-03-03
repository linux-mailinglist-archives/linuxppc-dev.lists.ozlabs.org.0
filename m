Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B334CC358
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 18:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8cgj5LDwz3cXX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 04:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pGP5k/J1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pGP5k/J1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8cfw36ZGz3bTK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 04:00:07 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223GCaQj003886; 
 Thu, 3 Mar 2022 16:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=itpcbzjK39nlPSZrLKm6sN0HYpOeAiBVkiNrQfCit3c=;
 b=pGP5k/J1UZGGJjsgUxCNf7XQCef3umSSBP3Ec5ObDozSdxK2d8uDkKoi6IBFYU89XGUK
 ZXy2XTBUq6mthn2/ZSNUkIW+56ialed69facRuE/GSS98YpOBFGPQZD+J+S8gdePhLI4
 bfB8aEv3wzwadiNfm2tUkRuLLZ+wGSC6gNwcH7kyc2v2REkSZ0QnYWytT0oj6xGKdJTZ
 8Uuppg9KeNPAjGz63vxyBv4Np5b1CXuArkClCC98ysOe6Z5E5ZTlku3RIgX/fNItn+mE
 hHbFKgp/qIy3oOHKrRHez+tidODqA9WUP/BRtw3U+NkdrQijsPJ0hjWXO/OKgfSEG6u2 Hg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejuc7sax5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Mar 2022 16:59:56 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 223GdAvL022629;
 Thu, 3 Mar 2022 16:59:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu98qc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Mar 2022 16:59:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 223GxqZK39715264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Mar 2022 16:59:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E78904C050;
 Thu,  3 Mar 2022 16:59:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C4274C044;
 Thu,  3 Mar 2022 16:59:51 +0000 (GMT)
Received: from localhost (unknown [9.43.78.131])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Mar 2022 16:59:51 +0000 (GMT)
Date: Thu, 03 Mar 2022 22:29:50 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 2/4] powerpc/ftrace: Refactor ftrace_{regs_}caller
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
 <9d7df9e4fc98a86051489f61d3c9bc67f92f7e27.1645099283.git.christophe.leroy@csgroup.eu>
In-Reply-To: <9d7df9e4fc98a86051489f61d3c9bc67f92f7e27.1645099283.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1646326634.jzerx009p9.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ltx9TrRsD3dBRrXl7Q5swveYKQ7wMNg5
X-Proofpoint-GUID: ltx9TrRsD3dBRrXl7Q5swveYKQ7wMNg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-03_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2203030079
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> ftrace_caller() and frace_regs_caller() have now a lot in common.
>=20
> Refactor them using GAS macros.

Thanks for doing this - this looks much better.

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/trace/ftrace_mprofile.S | 147 ++++++--------------
>  1 file changed, 45 insertions(+), 102 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/k=
ernel/trace/ftrace_mprofile.S
> index 76dab07fd8fd..630b2de9957b 100644
> --- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
> +++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
> @@ -32,7 +32,7 @@
>   * Our job is to save the register state into a struct pt_regs (on the s=
tack)
>   * and then arrange for the ftrace function to be called.
>   */
> -_GLOBAL(ftrace_regs_caller)
> +.macro	ftrace_regs_entry allregs
>  	/* Save the original return address in A's stack frame */
>  #ifdef CONFIG_MPROFILE_KERNEL
>  	PPC_STL	r0,LRSAVE(r1)
> @@ -43,7 +43,7 @@ _GLOBAL(ftrace_regs_caller)
>=20
>  	/* Save all gprs to pt_regs */
>  	SAVE_GPR(0, r1)
> -	SAVE_GPRS(2, 11, r1)
> +	SAVE_GPRS(3, 10, r1)
>=20
>  #ifdef CONFIG_PPC64
>  	/* Ok to continue? */
> @@ -52,17 +52,29 @@ _GLOBAL(ftrace_regs_caller)
>  	beq	ftrace_no_trace
>  #endif

The ability to disable ftrace in certain code paths through=20
paca_struct->ftrace_enabled will also be relevant on ppc32 - it will be=20
nice if it can be introduced there.

For this series though:
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

