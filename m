Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52718F25C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:07:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m9654kH0zDqlF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 21:07:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m94B3mTCzDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:05:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02NA2tS4145545
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 06:05:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0mbvdd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 06:05:27 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 10:05:24 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 10:05:22 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02NA5Mpj37486886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 10:05:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 067EDAE051;
 Mon, 23 Mar 2020 10:05:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77935AE04D;
 Mon, 23 Mar 2020 10:05:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.203.173.30])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 10:05:20 +0000 (GMT)
Subject: Re: [PATCH v4 16/16] powerpc sstep: Add support for prefixed
 fixed-point arithmetic
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 23 Mar 2020 15:35:19 +0530
In-Reply-To: <20200320051809.24332-17-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-17-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032310-0020-0000-0000-000003B96D64
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032310-0021-0000-0000-00002211E770
Message-Id: <220675fc78c8ee750a8e89420625f953cc8c1de6.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_03:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230056
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
Cc: alistair@popple.id.au, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-20 at 16:18 +1100, Jordan Niethe wrote:
> This adds emulation support for the following prefixed Fixed-Point
> Arithmetic instructions:
>   * Prefixed Add Immediate (paddi)
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>

> ---
> v3: Since we moved the prefixed loads/stores into the load/store switch
> statement it no longer makes sense to have paddi in there, so move it
> out.
> ---
>  arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index daef70eb8e22..6862fc019258 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1335,6 +1335,26 @@ int analyse_instr(struct instruction_op *op, const
> struct pt_regs *regs,
>  
>  	switch (opcode) {
>  #ifdef __powerpc64__
> +	case 1:
> +		prefix_r = word & (1ul << 20);
> +		ra = (suffix >> 16) & 0x1f;
> +		rd = (suffix >> 21) & 0x1f;
> +		op->reg = rd;
> +		op->val = regs->gpr[rd];
> +		suffixopcode = suffix >> 26;
> +		prefixtype = (word >> 24) & 0x3;
> +		switch (prefixtype) {
> +		case 2:
> +			if (prefix_r && ra)
> +				return 0;
> +			switch (suffixopcode) {
> +			case 14:	/* paddi */
> +				op->type = COMPUTE | PREFIXED;
> +				op->val = mlsd_8lsd_ea(word, suffix, regs);
> +				goto compute_done;
> +			}
> +		}
> +		break;
>  	case 2:		/* tdi */
>  		if (rd & trap_compare(regs->gpr[ra], (short) word))
>  			goto trap;

