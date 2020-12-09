Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9522D3E28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 10:07:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrWQm2F66zDqrm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 20:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NNWmv2Pr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrWP46KM2zDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 20:06:00 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B991r9G034086; Wed, 9 Dec 2020 04:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=I3DP+EooTBbUgiEInnr4ZpkHrpM8cLPtd5Lu6BGAUxA=;
 b=NNWmv2Prr/VCROsncPoPs+g/3sxMIk3wvtFIb8PR7XIB21m3QmcbgRtbpLQDac70XLMm
 4cS4gmPdwxDYD3I5y+kTQbyfjnJdlyD13vzJ3MEbmTYUFxenZG+PORbtnsRC8Ys46jKx
 EpPuZhTXrK9zk4SucszRbBTJbYE3DGysgg841/m+S1ENv2rnSBqqWbj5Ta6+aNN2WhJ0
 hAKnPUHvsgvdKQ7oiS0O2cUk2QMiwQU/1ijlWeHZGPk71S0Ki9peacEgrbI39wNVi6kq
 PJmMoO+KA5WNssPbcRAhvT63gE1i2CYYIBg2m4wX/FRW4Qa3gXwsG0ELMQXcfDRx/OVV Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35afekanay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:05:51 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B992jrr037913;
 Wed, 9 Dec 2020 04:05:50 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35afekan9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:05:50 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B98qU56000780;
 Wed, 9 Dec 2020 09:05:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3581u9dq7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 09:05:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B995lMx25625020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 09:05:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF96B6A057;
 Wed,  9 Dec 2020 09:05:46 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E4A36A054;
 Wed,  9 Dec 2020 09:05:46 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.49.37])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 09:05:46 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id ADB912E35A0; Wed,  9 Dec 2020 14:35:41 +0530 (IST)
Date: Wed, 9 Dec 2020 14:35:41 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Parse ibm,thread-groups with multiple
 properties
Message-ID: <20201209090541.GA13125@in.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
 <20201207121042.GH528281@linux.vnet.ibm.com>
 <20201208172540.GA14206@in.ibm.com>
 <20201209083541.GK528281@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209083541.GK528281@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_07:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090060
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 09, 2020 at 02:05:41PM +0530, Srikar Dronamraju wrote:
> * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-12-08 22:55:40]:
> 
> > > 
> > > NIT:
> > > tglx mentions in one of his recent comments to try keep a reverse fir tree
> > > ordering of variables where possible.
> > 
> > I suppose you mean moving the longer local variable declarations to to
> > the top and shorter ones to the bottom. Thanks. Will fix this.
> > 
> 
> Yes.
> 
> > > > +	}
> > > > +
> > > > +	if (!tg)
> > > > +		return -EINVAL;
> > > > +
> > > > +	cpu_group_start = get_cpu_thread_group_start(cpu, tg);
> > > 
> > > This whole hunk should be moved to a new function and called before
> > > init_cpu_cache_map. It will simplify the logic to great extent.
> > 
> > I suppose you are referring to the part where we select the correct
> > tg. Yeah, that can move to a different helper.
> > 
> 
> Yes, I would prefer if we could call this new helper outside
> init_cpu_cache_map.
> 
> > > > 
> > > > -	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
> > > > -				GFP_KERNEL, cpu_to_node(cpu));
> > > > +	mask = &per_cpu(cpu_l1_cache_map, cpu);
> > > > +
> > > > +	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> > > > 
> > > 
> > > This hunk (and the next hunk) should be moved to next patch.
> > >
> > 
> > The next patch is only about introducing  THREAD_GROUP_SHARE_L2. Hence
> > I put in any other code in this patch, since it seems to be a logical
> > place to collate whatever we have in a generic form.
> > 
> 
> While I am fine with it, having a pointer that always points to the same
> mask looks wierd.

Sure. Moving some of this to a separate preparatory patch.

> 
> -- 
> Thanks and Regards
> Srikar Dronamraju
