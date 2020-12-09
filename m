Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A18702D3E2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 10:09:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrWSg40GwzDqsM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 20:09:07 +1100 (AEDT)
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
 header.s=pp1 header.b=DVkZknj/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrWQn69RwzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 20:07:29 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9934lq036376; Wed, 9 Dec 2020 04:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=uPZLZFucs64QrPM+4R1abkgq6sji18ilojIc6tWxqoE=;
 b=DVkZknj/c0Hg6F1+Hx7X2BE1YnFeGUKXAGLiIjaejGwitzlMz8PNJGtHwKjmWMomd/hd
 +fN11w9hdXzgjhqBetEjM914LUBPkDnE6q2y+9TzriBTeLkpL5yJDjf9XwyKA/UuwciA
 KMr+RbXmYjmdkuGqAGGp/REsHtH5LPFlZqHZe8hEP0XRDIXRpq54YPCkaKKsoCLBCif2
 mA/2dqZB0AtDhXPtQnjbhWgvQPIm55ZdjPhiVgKJ7w3jH+vKSt+ClKguV1kqi8hquC1h
 802z7DGc6ZDcuYZejOialXhNJeTsIFJSCePFXEWLZJM4sjMxaN7qg7NH+5/CcMXyVIqT Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35apm07tna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:07:20 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B993ODE038125;
 Wed, 9 Dec 2020 04:07:19 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35apm07tmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:07:19 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B98xPj9028195;
 Wed, 9 Dec 2020 09:07:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3581u9bmf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 09:07:18 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B997H1p19792284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 09:07:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7044D136051;
 Wed,  9 Dec 2020 09:07:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB88513605D;
 Wed,  9 Dec 2020 09:07:16 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.49.37])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 09:07:16 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id C63D82E35A0; Wed,  9 Dec 2020 14:37:09 +0530 (IST)
Date: Wed, 9 Dec 2020 14:37:09 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/cacheinfo: Print correct cache-sibling
 map/list for L2 cache
Message-ID: <20201209090709.GB13125@in.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-4-git-send-email-ego@linux.vnet.ibm.com>
 <20201207131138.GJ528281@linux.vnet.ibm.com>
 <20201208175647.GC14206@in.ibm.com>
 <20201209083921.GL528281@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209083921.GL528281@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_07:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Wed, Dec 09, 2020 at 02:09:21PM +0530, Srikar Dronamraju wrote:
> * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-12-08 23:26:47]:
> 
> > > The drawback of this is even if cpus 0,2,4,6 are released L1 cache will not
> > > be released. Is this as expected?
> > 
> > cacheinfo populates the cache->shared_cpu_map on the basis of which
> > CPUs share the common device-tree node for a particular cache.  There
> > is one l1-cache object in the device-tree for a CPU node corresponding
> > to a big-core. That the L1 is further split between the threads of the
> > core is shown using ibm,thread-groups.
> > 
> 
> Yes.
> 
> > The ideal thing would be to add a "group_leader" field to "struct
> > cache" so that we can create separate cache objects , one per thread
> > group. I will take a stab at this in the v2.
> > 
> 
> I am not saying this needs to be done immediately. We could add a TODO and
> get it done later. Your patch is not making it worse. Its just that there is
> still something more left to be done.

Yeah, it needs to be fixed but it may not be a 5.11 target. For now I
will fix this patch to take care of the build errors on !PPC64 !SMT
configs. I will post a separate series for making cacheinfo.c aware of
thread-groups at the time of construction of the cache-chain.

> 
> -- 
> Thanks and Regards
> Srikar Dronamraju
