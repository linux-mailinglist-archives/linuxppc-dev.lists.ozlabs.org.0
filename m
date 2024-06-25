Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E8915EBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 08:14:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bczqh/du;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7ZKX0BvSz3dng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 16:14:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bczqh/du;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7ZJq051fz2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 16:13:30 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P5wjY5027802;
	Tue, 25 Jun 2024 06:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=pMLbcZIkfmFRfthbezC897uG4I0
	nURSyVKsS8MqB7Vw=; b=Bczqh/duFhOa2O+eUCOuOxgo/4OVta06Uuu/7t+BhpU
	e6oSB9/tt3G0HVxsr/iiw68L6776cR/pjwLAaC+gQu6yNNaXQEofrilvb/0ZM8Uf
	RQ8ifYg2v2EO0gssQ4CmErz6n+xfiO3u0YxPDD/yXly6Mlyu0HLv8wrvYgnDMm/V
	BROeWoR0wWuk1jzL4DIrhWW/CNGqX6iYfIKo3xkECGAe9PuZkPZmuxGJkjjEVfWh
	G7KRpHNvJGR1ZO5gaFXTRdE3jSb6S4fqreolb0AbjCzG+ScqaHZF8sCHn7nM0aff
	wx2AZ1yfCyYO5BSgpiNzG/tZ+N50BU1w9FbmFWZk9fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyr7cg0sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 06:13:14 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45P6DETD016079;
	Tue, 25 Jun 2024 06:13:14 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyr7cg0sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 06:13:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45P4xucd019949;
	Tue, 25 Jun 2024 06:13:13 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5mcjya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 06:13:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45P6D7KR44105996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 06:13:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B253820049;
	Tue, 25 Jun 2024 06:13:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34BF520040;
	Tue, 25 Jun 2024 06:13:07 +0000 (GMT)
Received: from localhost (unknown [9.171.10.36])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jun 2024 06:13:06 +0000 (GMT)
Date: Tue, 25 Jun 2024 11:43:06 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/topology: Check if a core is online
Message-ID: <vwwuujb76o26vkce5jd6tnyzzzg4ycktfs2lapkluynhs7hdv7@bejuuqhellfd>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
 <20240612185046.1826891-3-nysal@linux.ibm.com>
 <985e10dd-230b-4325-856f-1229361205d2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985e10dd-230b-4325-856f-1229361205d2@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -oGO8XEZwt9H0oCgxc-J7mg1RBwS7UHc
X-Proofpoint-GUID: hyEvKRbegPIfTRLunqu1SKaZbJrYHCGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_02,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=500 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250044
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 12:36:33AM GMT, Shrikanth Hegde wrote:
> > --- a/arch/powerpc/include/asm/topology.h
> > +++ b/arch/powerpc/include/asm/topology.h
> > @@ -145,6 +145,7 @@ static inline int cpu_to_coregroup_id(int cpu)
> >  
> >  #ifdef CONFIG_HOTPLUG_SMT
> >  #include <linux/cpu_smt.h>
> > +#include <linux/cpumask.h>
> 
> Is this header file needed? 
> I don't see any reference to cpumask related code. 
> 

cpu_online() is defined in that header.

> >  #include <asm/cputhreads.h>
> >  
> >  static inline bool topology_is_primary_thread(unsigned int cpu)
> > @@ -156,6 +157,18 @@ static inline bool topology_smt_thread_allowed(unsigned int cpu)
> >  {
> >  	return cpu_thread_in_core(cpu) < cpu_smt_num_threads;
> >  }
> > +
> 
> This is defined only if CONFIG_HOTPLUG_SMT is true. But this could be 
> generic function which might be used to check if a core is offline in other cases. 
> Would that make sense to keep it out of CONFIG_HOTPLUG_SMT ?
> 

I'm not opposed to the idea, it would also be easy to do that later if there is
another consumer of this function.

Regards
--Nysal

