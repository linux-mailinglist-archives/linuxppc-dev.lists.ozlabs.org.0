Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69413B025C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 19:07:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T7cT5sZCzF37y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 03:07:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T7ZD68m8zF1V6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 03:05:23 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BH2slG063877
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 13:05:21 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2faea7m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 13:05:20 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 11 Sep 2019 18:05:18 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 18:05:16 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BH5FFJ41811982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 17:05:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68E69AE045;
 Wed, 11 Sep 2019 17:05:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE8BEAE056;
 Wed, 11 Sep 2019 17:05:13 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.85.71.74])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 11 Sep 2019 17:05:13 +0000 (GMT)
Date: Wed, 11 Sep 2019 22:35:12 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v3 3/5] powerpc/numa: Use cpu node map of first sibling
 thread
References: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
 <20190906135020.19772-4-srikar@linux.vnet.ibm.com>
 <87lfuurirh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87lfuurirh.fsf@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TM-AS-GCONF: 00
x-cbid: 19091117-0016-0000-0000-000002AA1A15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091117-0017-0000-0000-0000330AA7AA
Message-Id: <20190911165845.GA31643@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110158
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

Hi Nathan, 

Thanks for your reviews.

> > -	if ((nid = numa_cpu_lookup_table[lcpu]) >= 0) {
> > +	nid = numa_cpu_lookup_table[fcpu];
> > +	if (nid >= 0) {
> >  		map_cpu_to_node(lcpu, nid);
> >  		return nid;
> >  	}
> 
> Yes, we need to something like this to prevent a VPHN change that occurs
> concurrently with onlining a core's threads from messing us up.
> 
> Is it a good assumption that the first thread of a sibling group will
> have its mapping initialized first? I think the answer is yes for boot,
> but hotplug... not so sure.
> 
> 
> > @@ -496,6 +501,16 @@ static int numa_setup_cpu(unsigned long lcpu)
> >  	if (nid < 0 || !node_possible(nid))
> >  		nid = first_online_node;
> >  
> > +	/*
> > +	 * Update for the first thread of the core. All threads of a core
> > +	 * have to be part of the same node. This not only avoids querying
> > +	 * for every other thread in the core, but always avoids a case
> > +	 * where virtual node associativity change causes subsequent threads
> > +	 * of a core to be associated with different nid.
> > +	 */
> > +	if (fcpu != lcpu)
> > +		map_cpu_to_node(fcpu, nid);
> > +
> 
> OK, I see that this somewhat addresses my concern above. But changing
> this mapping for a remote cpu is unsafe except under specific
> circumstances. I think this should first assert:
> 
> * numa_cpu_lookup_table[fcpu] == NUMA_NO_NODE
> * cpu_online(fcpu) == false
> 
> to document and enforce the conditions that must hold for this to be OK.

I do understand that we shouldn't be modifying the nid for a different cpu.

We just checked above that the mapping for the first cpu doesnt exist.
If the first cpu (or remote cpu as you coin it) was online, then its
mapping should have existed and we return even before we come here.

nid = numa_cpu_lookup_table[fcpu];
if (nid >= 0) {
	map_cpu_to_node(lcpu, nid);
	return nid;
}

Currently numa_setup_cpus is only called at very early boot and in cpu
hotplug. At hotplug time, the oneline of cpus is serialized. Right? Do we 
see a chance of remote cpu changing its state as we set its nid here?

Also lets say if we assert and for some unknown reason the assertion fails.
How do we handle the failure case?  We cant get out without setting
the nid. We cant continue setting the nid. Should we panic the system given
that the check a few lines above is now turning out to be false? Probably
no, as I think we can live with it.

Any thoughts?

-- 
Thanks and Regards
Srikar Dronamraju

