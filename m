Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB599D74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 19:43:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DsMc61LhzDrD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 03:43:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DsHm0mtCzDrQ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:40:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MHd5CF096779
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 13:40:13 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhy8wgvr7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 13:40:13 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 18:40:11 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 18:40:08 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7MHe7jG22806866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 17:40:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42FE14C05C;
 Thu, 22 Aug 2019 17:40:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A7814C046;
 Thu, 22 Aug 2019 17:40:06 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 22 Aug 2019 17:40:06 +0000 (GMT)
Date: Thu, 22 Aug 2019 23:10:05 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/numa: Early request for home node
 associativity
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
 <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
 <87ftltruf7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87ftltruf7.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19082217-0016-0000-0000-000002A1A3CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082217-0017-0000-0000-00003301DE58
Message-Id: <20190822174005.GA31809@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220158
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2019-08-22 12:17:48]:

> Hi Srikar,

Thanks Nathan for the review.

> 
> > However home node associativity requires cpu's hwid which is set in
> > smp_setup_pacas. Hence call smp_setup_pacas before numa_setup_cpus.
> 
> But this seems like it would negatively affect pacas' NUMA placements?
> 
> Would it be less risky to figure out a way to do "early" VPHN hcalls
> before mem_topology_setup, getting the hwids from the cpu_to_phys_id
> array perhaps?
> 

Do you mean for calls from mem_topology_setup(), stuff we use cpu_to_phys_id
but for the calls from ppc_numa_cpu_prepare() we use the
get_hard_smp_processor_id()?

Thats doable.

> 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 88b5157..7965d3b 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -461,6 +461,21 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> >  	return nid;
> >  }
> >  
> > +static int vphn_get_nid(unsigned long cpu)
> > +{
> > +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
> > +	long rc;
> > +
> > +	/* Use associativity from first thread for all siblings */
> 
> I don't understand how this comment corresponds to the code it
> accompanies.


Okay will rephrase
> 
> 
> > +	rc = hcall_vphn(get_hard_smp_processor_id(cpu),
> > +				VPHN_FLAG_VCPU, associativity);
> > +
> > +	if (rc == H_SUCCESS)
> > +		return  associativity_to_nid(associativity);
>                       ^^ extra space
> 
> > @@ -490,7 +505,18 @@ static int numa_setup_cpu(unsigned long lcpu)
> >  			goto out;
> >  	}
> >  
> > -	nid = of_node_to_nid_single(cpu);
> > +	/*
> > +	 * On a shared lpar, the device tree might not have the correct node
> > +	 * associativity.  At this time lppaca, or its __old_status field
> 
> Sorry but I'm going to quibble with this phrasing a bit. On SPLPAR the
> CPU nodes have no affinity information in the device tree at all. This
> comment implies that they may have incorrect information, which is
> AFAIK not the case.
> 

Okay will clarify.

-- 
Thanks and Regards
Srikar Dronamraju

