Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF31C69BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 09:03:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H6y50nmwzDqvH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 17:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H6wQ3XykzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 17:02:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0466VTBE058709
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 May 2020 03:02:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s2g3rtn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 May 2020 03:02:10 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0466jK10105712
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 May 2020 03:02:09 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s2g3rtmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 03:02:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 046715pD010721;
 Wed, 6 May 2020 07:02:09 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g6f3k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 07:02:09 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 046729g232440794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 May 2020 07:02:09 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDA1028058;
 Wed,  6 May 2020 07:02:08 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98B9A2805E;
 Wed,  6 May 2020 07:02:08 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.87.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  6 May 2020 07:02:08 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 89DA62E336F; Wed,  6 May 2020 12:32:02 +0530 (IST)
Date: Wed, 6 May 2020 12:32:02 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 06/10] powerpc/powernv: opal use new opal call entry
 point if it exists
Message-ID: <20200506070202.GC23268@in.ibm.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
 <20200502111914.166578-7-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502111914.166578-7-npiggin@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_01:2020-05-04,
 2020-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005060046
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
Reply-To: ego@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nicholas,

On Sat, May 02, 2020 at 09:19:10PM +1000, Nicholas Piggin wrote:
> OPAL may advertise new endian-specific entry point which has different
> calling conventions including using the caller's stack, but otherwise
> provides the standard OPAL call API without any changes required to
> the OS.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

[..snip..]

> index 506b1798081a..32857254d268 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -92,6 +92,18 @@ static s64 __opal_call_trace(s64 a0, s64 a1, s64 a2, s64 a3,
>  #define DO_TRACE false
>  #endif /* CONFIG_TRACEPOINTS */
> 
> +struct opal {
> +	u64 base;
> +	u64 entry;
> +	u64 size;
> +	u64 v4_le_entry;
> +};
> +extern struct opal opal;
> +
> +typedef int64_t (*opal_v4_le_entry_fn)(uint64_t r3, uint64_t r4, uint64_t r5,
> +                               uint64_t r6, uint64_t r7, uint64_t r8,
> +                               uint64_t r9, uint64_t r10);
> +
>  static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
>  	     int64_t a4, int64_t a5, int64_t a6, int64_t a7, int64_t opcode)
>  {
> @@ -99,6 +111,30 @@ static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
>  	unsigned long msr = mfmsr();
>  	bool mmu = (msr & (MSR_IR|MSR_DR));
>  	int64_t ret;
> +	opal_v4_le_entry_fn fn;

fn should be initialized to NULL here to ensure correctness when
kernel is built with CONFIG_CPU_BIG_ENDIAN.

> +
> +	if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
> +		fn = (opal_v4_le_entry_fn)(opal.v4_le_entry);
> +
> +	if (fn) {
> +		if (!mmu) {
> +			BUG_ON(msr & MSR_EE);
> +			ret = fn(opcode, a0, a1, a2, a3, a4, a5, a6);
> +			return ret;
> +		}
> +
> +		local_irq_save(flags);
> +		hard_irq_disable(); /* XXX r13 */
> +		msr &= ~MSR_EE;
> +		mtmsr(msr & ~(MSR_IR|MSR_DR));
> +
> +		ret = fn(opcode, a0, a1, a2, a3, a4, a5, a6);
> +
> +		mtmsr(msr);
> +		local_irq_restore(flags);
> +
> +		return ret;
> +	}
> 
>  	msr &= ~MSR_EE;
> 

--
Thanks and Regards
gautham.
