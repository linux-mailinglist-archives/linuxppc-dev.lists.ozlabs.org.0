Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B691A4BB2AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 07:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Mg81CXbz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 17:46:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qZV0hjUQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qZV0hjUQ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0MfM4Prrz3bSs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 17:46:02 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I67saT010564; 
 Fri, 18 Feb 2022 06:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=IA1AY9cipg3esp6LwGICOYnhkYsuFy6ucg5GArdVoJM=;
 b=qZV0hjUQhfBHDn59ShiWqguK09re/q4iGgYE2i7C7OPryozxNQkB570NYV7JLpUH+oGJ
 fgN4CL6I1wI9H20xO7+P06kMu4zgOOHe/avZ0XLDs2ChzSwH2atCVLt7+yTePJ+xuXaz
 rfOG0iUbpt+V9vLI0SGFb/SKnMjXRlc1/ja89w9M58q/CXfvtyTFVehBeCT4GqPtU52q
 tFKRNoGKThN23uC7/LskbCddP0OMjjpcLkyRfjYsPMsHkfiwgef2QNd7EB/x/4Jy5cAx
 YrjFN9FaAjNbzz9Sy3SlqxiDVPpnhuJcJvMMFjqmqobV8zG+n35UBJA33v2gagu23Lr/ 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea55vsasb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 06:45:27 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21I6jQRG000688;
 Fri, 18 Feb 2022 06:45:26 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea55vsary-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 06:45:26 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I6iGbq023941;
 Fri, 18 Feb 2022 06:45:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3e64ha5emq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 06:45:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I6jLP942664210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 06:45:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67BB942057;
 Fri, 18 Feb 2022 06:45:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBBEE42049;
 Fri, 18 Feb 2022 06:45:20 +0000 (GMT)
Received: from localhost (unknown [9.43.9.173])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Feb 2022 06:45:20 +0000 (GMT)
Date: Fri, 18 Feb 2022 12:15:19 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] kprobes: Allow probing on any address belonging to
 ftrace
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
 <78480d05821d45e09fb234f61f9037e26d42f02d.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <78480d05821d45e09fb234f61f9037e26d42f02d.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1645165865.wa8mt7j9o7.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lm9oOolpHVffXAQkDNtUw1azE_iNSm4h
X-Proofpoint-GUID: nxhHuqwpVxD9hMlaonV2Vkpp9_xoooVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_02,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180038
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao wrote:
> On certain architectures, ftrace can reserve multiple instructions at
> function entry. Rather than rejecting kprobe on addresses other than the
> exact ftrace call instruction, use the address returned by ftrace to
> probe at the correct address when CONFIG_KPROBES_ON_FTRACE is enabled.
>=20
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/kprobes.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 94cab8c9ce56cc..0a797ede3fdf37 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1497,6 +1497,10 @@ bool within_kprobe_blacklist(unsigned long addr)
>  static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
>  			const char *symbol_name, unsigned int offset)
>  {
> +#ifdef CONFIG_KPROBES_ON_FTRACE
> +	unsigned long ftrace_addr =3D 0;
> +#endif
> +
>  	if ((symbol_name && addr) || (!symbol_name && !addr))
>  		goto invalid;
> =20
> @@ -1507,6 +1511,14 @@ static kprobe_opcode_t *_kprobe_addr(kprobe_opcode=
_t *addr,
>  	}
> =20
>  	addr =3D (kprobe_opcode_t *)(((char *)addr) + offset);
> +
> +#ifdef CONFIG_KPROBES_ON_FTRACE
> +	if (addr)
> +		ftrace_addr =3D ftrace_location((unsigned long)addr);
> +	if (ftrace_addr)
> +		return (kprobe_opcode_t *)ftrace_addr;
> +#endif

One of the side effects of this is that we'll now allow probes on=20
non-instruction boundary within the full ftrace address range. It's not=20
too much of an issue since we ensure that the probe location eventually=20
lands on the actual ftrace instruction. But, I'm wondering if we should=20
instead allow architectures to opt-in to this, by making this be=20
architecture specific. Architectures can then do whatever validation is=20
necessary.


- Naveen

