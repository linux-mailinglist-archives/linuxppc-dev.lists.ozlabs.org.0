Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBBAB15B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 05:43:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pk0t2SWqzDr7N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 13:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pjyn4zzlzDr6q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 13:41:20 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x863ajMV141132
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Sep 2019 23:41:15 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uuddkbt7b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 23:41:15 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 6 Sep 2019 04:41:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Sep 2019 04:41:13 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x863fCse39125184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 03:41:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 067F34C052;
 Fri,  6 Sep 2019 03:41:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBDEB4C058;
 Fri,  6 Sep 2019 03:41:10 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  6 Sep 2019 03:41:10 +0000 (GMT)
Date: Fri, 6 Sep 2019 09:11:10 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] powerpc/numa: Early request for home node
 associativity
References: <20190829055023.6171-1-srikar@linux.vnet.ibm.com>
 <20190829055023.6171-4-srikar@linux.vnet.ibm.com>
 <87tv9qqzm7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87tv9qqzm7.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19090603-0012-0000-0000-0000034750C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090603-0013-0000-0000-00002181A92A
Message-Id: <20190906034110.GA12412@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-06_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909060039
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >
> > While here, fix a problem where of_node_put could be called even when
> > of_get_cpu_node was not successful.
> 
> of_node_put() handles NULL arguments, so this should not be necessary.
> 

Ok 

> > @@ -875,7 +908,7 @@ void __init mem_topology_setup(void)
> >  	reset_numa_cpu_lookup_table();
> >  
> >  	for_each_present_cpu(cpu)
> > -		numa_setup_cpu(cpu);
> > +		numa_setup_cpu(cpu, false);
> >  }
> 
> I'm open to other points of view here, but I would prefer two separate
> functions, something like vphn_get_nid() for runtime and
> vphn_get_nid_early() (which could be __init) for boot-time
> initialization. Propagating a somewhat unexpressive boolean flag through
> two levels of function calls in this code is unappealing...
> 

Somehow not convinced that we need to duplicate function just to avoid
passing a bool.

If propagating a boolean flag in two levels of function calls is an issue,
we could decipher the logic in numa_setup_cpu itself

Something like this
static int numa_setup_cpu(unsigned long lcpu, bool get_hwid)
{
....

	if (firmware_has_feature(FW_FEATURE_VPHN)) {
		long hwid;

		if (get_hwid)
			hwid = get_hard_smp_processor_id(cpu);
		else
			hwid = cpu_to_phys_id[cpu];

		nid = vphn_get_nid(lcpu, hwid);
	}

....
Would this help?

> Regardless, I have an annoying question :-) Isn't it possible that,
> while Linux is calling vphn_get_nid() for each logical cpu in sequence,
> the platform could change a virtual processor's node assignment,
> potentially causing sibling threads to get different node assignments
> and producing an incoherent topology (which then leads to sched domain
> assertions etc)?
> 

Right, its certainly possible for node assignment to change while we iterate
through the siblings. Do you have an recommendations?

> If so, I think more care is needed. The algorithm should make the vphn
> call only once per cpu node, I think?

I didn't get "once per cpu node", How do we know which all cpus are part of
that cpu node? Or did you mean once per cpu core?

-- 
Thanks and Regards
Srikar Dronamraju

