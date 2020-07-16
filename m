Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D500221D14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:14:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6lrC4HNGzDqx9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:14:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6lpL0STYzDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:13:13 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G7272Z146246; Thu, 16 Jul 2020 03:13:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvkv0mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 03:13:07 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G72aZj148595;
 Thu, 16 Jul 2020 03:13:07 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvkv0k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 03:13:07 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G7Bip0026881;
 Thu, 16 Jul 2020 07:13:05 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 327q2y2b94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:13:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G7D2wC22937694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 07:13:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2378E5204E;
 Thu, 16 Jul 2020 07:13:02 +0000 (GMT)
Received: from [9.199.37.124] (unknown [9.199.37.124])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4510052052;
 Thu, 16 Jul 2020 07:13:00 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/sstep: support emulation for vsx vector
 paired storage access instructions
To: Balamuruhan S <bala24@linux.ibm.com>
References: <20200716061558.1532199-1-bala24@linux.ibm.com>
 <20200716061558.1532199-3-bala24@linux.ibm.com>
Message-ID: <bdc051d7-118f-0a2d-918a-f3db2ce31b44@linux.ibm.com>
Date: Thu, 16 Jul 2020 12:42:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716061558.1532199-3-bala24@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_01:2020-07-15,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160049
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, paulus@samba.org,
 sandipan@linux.ibm.com, jniethe5@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bala,

> @@ -709,6 +722,8 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
>   	reg->d[0] = reg->d[1] = 0;
>   
>   	switch (op->element_size) {
> +	case 32:
> +		/* [p]lxvp[x] or [p]stxvp[x] */

This function does not emulate stvxp ^^^^

>   	case 16:
>   		/* whole vector; lxv[x] or lxvl[l] */
>   		if (size == 0)
> @@ -717,7 +732,7 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
>   		if (IS_LE && (op->vsx_flags & VSX_LDLEFT))
>   			rev = !rev;
>   		if (rev)
> -			do_byte_reverse(reg, 16);
> +			do_byte_reverse(reg, size);
>   		break;
>   	case 8:
>   		/* scalar loads, lxvd2x, lxvdsx */
> @@ -793,6 +808,22 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
>   	size = GETSIZE(op->type);
>   
>   	switch (op->element_size) {
> +	case 32:
> +		/* [p]lxvp[x] or [p]stxvp[x] */

This function does not emulate lxvp ^^^^

> +		if (size == 0)
> +			break;
> +		if (IS_LE && (op->vsx_flags & VSX_LDLEFT))
> +			rev = !rev;

Why this if condition ^^^^ ?

> +		if (rev) {
> +			/* reverse 32 bytes */
> +			buf.d[0] = byterev_8(reg->d[3]);
> +			buf.d[1] = byterev_8(reg->d[2]);
> +			buf.d[2] = byterev_8(reg->d[1]);
> +			buf.d[3] = byterev_8(reg->d[0]);
> +			reg = &buf;
> +		}
> +		memcpy(mem, reg, size);
> +		break;
>   	case 16:
>   		/* stxv, stxvx, stxvl, stxvll */
>   		if (size == 0)
> @@ -861,28 +892,33 @@ static nokprobe_inline int do_vsx_load(struct instruction_op *op,
>   				       bool cross_endian)
>   {
>   	int reg = op->reg;
> -	u8 mem[16];
> +	int i, nr_vsx_regs;
> +	u8 mem[32];
>   	union vsx_reg buf;
>   	int size = GETSIZE(op->type);
>   
>   	if (!address_ok(regs, ea, size) || copy_mem_in(mem, ea, size, regs))
>   		return -EFAULT;
>   
> +	nr_vsx_regs = size / sizeof(__vector128);
>   	emulate_vsx_load(op, &buf, mem, cross_endian);
>   	preempt_disable();
>   	if (reg < 32) {
>   		/* FP regs + extensions */
>   		if (regs->msr & MSR_FP) {
> -			load_vsrn(reg, &buf);
> +			for (i = 0; i < nr_vsx_regs; i++)
> +				load_vsrn(reg + i, &buf.v[i]);
>   		} else {
>   			current->thread.fp_state.fpr[reg][0] = buf.d[0];
>   			current->thread.fp_state.fpr[reg][1] = buf.d[1];

Should we change else part as well?

>   		}
>   	} else {
>   		if (regs->msr & MSR_VEC)
> -			load_vsrn(reg, &buf);
> +			for (i = 0; i < nr_vsx_regs; i++)
> +				load_vsrn(reg + i, &buf.v[i]);
> +

Unnecessary line.

>   		else
> -			current->thread.vr_state.vr[reg - 32] = buf.v;
> +			current->thread.vr_state.vr[reg - 32] = buf.v[0];

Same here. else part, should we add:

     if (vsx 32 byte)
         current->thread.vr_state.vr[reg - 32 + 1] = buf.v[1];

>   	}
>   	preempt_enable();
>   	return 0;
> @@ -893,27 +929,31 @@ static nokprobe_inline int do_vsx_store(struct instruction_op *op,
>   					bool cross_endian)
>   {
>   	int reg = op->reg;
> -	u8 mem[16];
> +	int i, nr_vsx_regs;
> +	u8 mem[32];
>   	union vsx_reg buf;
>   	int size = GETSIZE(op->type);
>   
>   	if (!address_ok(regs, ea, size))
>   		return -EFAULT;
>   
> +	nr_vsx_regs = size / sizeof(__vector128);
>   	preempt_disable();
>   	if (reg < 32) {
>   		/* FP regs + extensions */
>   		if (regs->msr & MSR_FP) {
> -			store_vsrn(reg, &buf);
> +			for (i = 0; i < nr_vsx_regs; i++)
> +				store_vsrn(reg + i, &buf.v[i]);
>   		} else {
>   			buf.d[0] = current->thread.fp_state.fpr[reg][0];
>   			buf.d[1] = current->thread.fp_state.fpr[reg][1];
>   		}
>   	} else {
>   		if (regs->msr & MSR_VEC)
> -			store_vsrn(reg, &buf);
> +			for (i = 0; i < nr_vsx_regs; i++)
> +				store_vsrn(reg + i, &buf.v[i]);
>   		else
> -			buf.v = current->thread.vr_state.vr[reg - 32];
> +			buf.v[0] = current->thread.vr_state.vr[reg - 32];
>   	}
>   	preempt_enable();
>   	emulate_vsx_store(op, &buf, mem, cross_endian);
> 

Ravi
