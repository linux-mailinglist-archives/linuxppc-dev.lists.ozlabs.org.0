Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F84B586F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 18:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyB2M3ynfz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 04:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fa5I1wVY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fa5I1wVY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyB1Z0zP9z3bV1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 04:25:05 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EGSjSN003835; 
 Mon, 14 Feb 2022 17:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=2ATdRhGIdt3IikCuBoJzIIS6QUQpdSLFv9+n8HIFUAA=;
 b=fa5I1wVY2XE1eDlODAl+hPLSC1oAKu+Uze9HfmB2pHJuuwl/5A/EDUrXVA2sP9Mj9P7r
 2s6OcWwkjI1+Gs7TbLjqY+cA7Sx3CFgSEHRycrKLbBQWcbAnCKG4L8yDWjms8m34emjo
 h4QWeeF+S6O7zfSd7a4eEsbYv9eMLoOtBPS5wcjgxd3oKsdrJJNrdY5PzUMYM3PzlqKm
 GVJVJO8bkdlL8ypNle/o+mSxri8Mjqss60khsdI6fKSr1nQdAZ5YoML/wDZ0yKFIRDD0
 YYC4r+nNGGwftKR/jin82s/KlvE77TNuN+Z6dxn3ideewRUJt2EiXepnXlTvi1Ste6z7 HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e6rt1bw5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 17:24:35 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EFm37V023200;
 Mon, 14 Feb 2022 17:24:34 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e6rt1bw3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 17:24:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EHDxpS020374;
 Mon, 14 Feb 2022 17:24:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645jfqyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 17:24:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21EHE6N039846210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 17:14:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DC2611C04A;
 Mon, 14 Feb 2022 17:24:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FDD611C058;
 Mon, 14 Feb 2022 17:24:25 +0000 (GMT)
Received: from localhost (unknown [9.43.124.167])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 17:24:25 +0000 (GMT)
Date: Mon, 14 Feb 2022 22:54:23 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 11/13] powerpc/ftrace: directly call of function graph
 tracer by ftrace caller
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <04d196585ff81bde06a000bd9c633a33a5b21130.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <04d196585ff81bde06a000bd9c633a33a5b21130.1640017960.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644859156.qdgqumennn.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bTui_nuOsmI9W12M2-4XlB8dlhf2liOJ
X-Proofpoint-ORIG-GUID: gDpM-TUpELCV1vUCWRDB_CC3w726px2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_07,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140102
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> Modify function graph tracer to be handled directly by the standard
> ftrace caller.
>=20
> This is made possible as powerpc now supports
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS.
>=20
> This change simplifies the call of function graph ftrace.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/ftrace.h             |  6 ++
>  arch/powerpc/kernel/trace/ftrace.c            | 11 ++++
>  arch/powerpc/kernel/trace/ftrace_32.S         | 53 +--------------
>  .../powerpc/kernel/trace/ftrace_64_mprofile.S | 64 +------------------
>  4 files changed, 20 insertions(+), 114 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm=
/ftrace.h
> index 45c3d6f11daa..70b457097098 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -38,6 +38,12 @@ static __always_inline void ftrace_instruction_pointer=
_set(struct ftrace_regs *f
>  {
>  	regs_set_return_ip(&fregs->regs, ip);
>  }
> +
> +struct ftrace_ops;
> +
> +#define ftrace_graph_func ftrace_graph_func
> +void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
> +		       struct ftrace_ops *op, struct ftrace_regs *fregs);
>  #endif
>  #endif /* __ASSEMBLY__ */
> =20
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index ce673764cb69..74a176e394ef 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -917,6 +917,9 @@ static int ftrace_modify_ftrace_graph_caller(bool ena=
ble)
>  	unsigned long stub =3D (unsigned long)(&ftrace_graph_stub);
>  	ppc_inst_t old, new;
> =20
> +	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_ARGS))
> +		return 0;
> +
>  	old =3D ftrace_call_replace(ip, enable ? stub : addr, 0);
>  	new =3D ftrace_call_replace(ip, enable ? addr : stub, 0);
> =20
> @@ -955,6 +958,14 @@ unsigned long prepare_ftrace_return(unsigned long pa=
rent, unsigned long ip,
>  out:
>  	return parent;
>  }

For x86, commit 0c0593b45c9b4e ("x86/ftrace: Make function graph use=20
ftrace directly") also adds recursion check before the call to=20
function_graph_enter() in prepare_ftrace_return(). Do we need that on
powerpc as well?


- Naveen

