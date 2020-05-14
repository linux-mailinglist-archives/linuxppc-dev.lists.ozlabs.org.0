Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CF1D3D80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:30:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NM7q6pP3zDqy9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 05:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NLRH1GVVzDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 04:58:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EIdSpF055409; Thu, 14 May 2020 14:58:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kq446q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 14:58:21 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EImK2Y079555;
 Thu, 14 May 2020 14:58:21 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kq4468-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 14:58:21 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EIonLD013393;
 Thu, 14 May 2020 18:58:20 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3100ubrvft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 18:58:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04EIwJ2Q30409116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 18:58:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB922805C;
 Thu, 14 May 2020 18:58:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6748E28058;
 Thu, 14 May 2020 18:58:19 +0000 (GMT)
Received: from localhost (unknown [9.85.205.196])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 18:58:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v3 2/2] powerpc/rtas: Implement reentrant rtas call
In-Reply-To: <20200514011245.127174-3-leobras.c@gmail.com>
References: <20200514011245.127174-1-leobras.c@gmail.com>
 <20200514011245.127174-3-leobras.c@gmail.com>
Date: Thu, 14 May 2020 13:58:18 -0500
Message-ID: <878shu2vjp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_06:2020-05-14,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 cotscore=-2147483648 mlxlogscore=999 adultscore=0 clxscore=1011
 suspectscore=1 spamscore=0 phishscore=0 priorityscore=1501 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005140160
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
Cc: Leonardo Bras <leobras.c@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Leonardo Bras <leobras.c@gmail.com> writes:
> +/**
> + * rtas_call_reentrant() - Used for reentrant rtas calls
> + * @token:	Token for desired reentrant RTAS call
> + * @nargs:	Number of Input Parameters
> + * @nret:	Number of Output Parameters
> + * @outputs:	Array of outputs
> + * @...:	Inputs for desired RTAS call
> + *
> + * According to LoPAR documentation, only "ibm,int-on", "ibm,int-off",
> + * "ibm,get-xive" and "ibm,set-xive" are currently reentrant.
> + * Reentrant calls need their own rtas_args buffer, so not using rtas.args, but
> + * PACA one instead.
> + *
> + * Return:	-1 on error,
> + *		First output value of RTAS call if (nret > 0),
> + *		0 otherwise,
> + */
> +
> +int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
> +{
> +	va_list list;
> +	struct rtas_args *args;
> +	int i;
> +
> +	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
> +		return -1;
> +
> +	/* We use the per-cpu (PACA) rtas args buffer */
> +	args = &local_paca->reentrant_args;
> +
> +	va_start(list, outputs);
> +	va_rtas_call_unlocked(args, token, nargs, nret, list);
> +	va_end(list);
> +
> +	if (nret > 1 && outputs)
> +		for (i = 0; i < nret - 1; ++i)
> +			outputs[i] = be32_to_cpu(args->rets[i + 1]);

Doesn't this need to be more careful about preemption and exceptions?
I.e. the args structure in the paca needs to be protected from
concurrent use somehow, like any per-cpu data structure.

local_irq_save/restore while accessing local_paca->reentrant_args here
would be sufficient I think?
