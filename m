Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C36232C7EF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 08:43:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckxzx1XjzzDrKd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SoSC/vGy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckxsw5t9szDrFH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 18:38:12 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AU7WhBW011633
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xF7zC0Jhh6ixgjFLrcvaH4VzXkjx+KVaPDLctlgJRnY=;
 b=SoSC/vGyPyP57bAlw35IZLqXIMRFRe7GaDRJdMjlfROx0fv+qRR+0IG3DfQ+csPDy9BJ
 eT0kWSQWtuTc3vUdx+4qJuZWt4Ct/nUJ2qNAQHgXQwgHPCzmDi7RtRkFkU+YOG3o89S9
 f5dLGUIXrx07RlRCCT95hMWIls2kw7Y+sPYj9fBxobGYSm5N/5DnU5APpK+91tF5wT/R
 HbOt0QNR5gRXuLFw5nMsw9ui/cqW/xzKgOARBteWJucycjxm/+JIVbWePaIorx0vyU5n
 vGketVcJZVUQZ2Bfk2eserNJh3giVtYald7huQphUYQ8m5I2QadSUMvhjS7cd3cli4+2 DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354p4ay8ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:38:08 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AU7XYr4013835
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:38:07 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354p4ay8ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 02:38:07 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AU7QVRh002178;
 Mon, 30 Nov 2020 07:38:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 353e68s61t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 07:38:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AU7bv3P61211058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 07:37:57 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D04C6E04E;
 Mon, 30 Nov 2020 07:38:03 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E58A06E04C;
 Mon, 30 Nov 2020 07:38:01 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.58.227])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 07:38:01 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 05/19] powerpc: interrupt handler wrapper functions
In-Reply-To: <20201128144114.944000-6-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-6-npiggin@gmail.com>
Date: Mon, 30 Nov 2020 13:07:59 +0530
Message-ID: <87o8jfpa5k.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_02:2020-11-26,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=820 priorityscore=1501 malwarescore=0
 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011300045
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

.....
 +#endif
> +DECLARE_INTERRUPT_HANDLER(emulation_assist_interrupt);
> +DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);

Can we add comments here explaining why some of these handlers need to remain RAW()?

> +DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
> +DECLARE_INTERRUPT_HANDLER_RET(do_hash_fault);
> +DECLARE_INTERRUPT_HANDLER_RET(do_page_fault);
> +DECLARE_INTERRUPT_HANDLER(do_bad_page_fault);
> +
> +DECLARE_INTERRUPT_HANDLER_ASYNC(timer_interrupt);
> +DECLARE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi);
> +DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async);
> +DECLARE_INTERRUPT_HANDLER_RAW(performance_monitor_exception);

Same for this.

> +DECLARE_INTERRUPT_HANDLER(WatchdogException);
> +DECLARE_INTERRUPT_HANDLER(unknown_exception);
> +DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
> +
> +void replay_system_reset(void);
> +void replay_soft_interrupts(void);
> +
> +#endif /* _ASM_POWERPC_INTERRUPT_H */
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 2f566c1a754c..335d6fd589a7 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -131,6 +131,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
>  /* Convert timebase ticks to nanoseconds */
>  unsigned long long tb_to_ns(unsigned long long tb_ticks);
>  
> +void timer_broadcast_interrupt(void);
> +
>  /* SPLPAR */
>  void accumulate_stolen_time(void);
>  
> 

-aneesh
