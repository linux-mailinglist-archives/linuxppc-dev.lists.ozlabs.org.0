Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51B14DB73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 14:21:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487gx81LwkzDqX2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 00:21:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487gsy4PnHzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 00:19:01 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00UD7qYV081955
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 08:18:59 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xueh76kpv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 08:18:58 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 30 Jan 2020 13:18:56 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 Jan 2020 13:18:55 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00UDI2Xj50266594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 13:18:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24C56AE053;
 Thu, 30 Jan 2020 13:18:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3A54AE04D;
 Thu, 30 Jan 2020 13:18:52 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 30 Jan 2020 13:18:52 +0000 (GMT)
Date: Thu, 30 Jan 2020 18:48:52 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v4] powerpc/smp: Use nid as fallback for package_id
References: <20200129135121.24617-1-srikar@linux.vnet.ibm.com>
 <20200130105747.GD1988@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200130105747.GD1988@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20013013-4275-0000-0000-0000039C6E1A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20013013-4276-0000-0000-000038B08BE8
Message-Id: <20200130131852.GB28610@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_03:2020-01-28,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300094
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-01-30 16:27:47]:

> On Wed, Jan 29, 2020 at 07:21:21PM +0530, Srikar Dronamraju wrote:
> 
> [..snip..]
> 
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1185,10 +1185,34 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
> >  	}
> >  }
> > 
> > +int get_physical_package_id(int cpu)
> > +{
> > +	int ppid = cpu_to_chip_id(cpu);
> > +
> > +#ifdef CONFIG_PPC_SPLPAR
> > +	/*
> > +	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
> > +	 * defined. Hence we would return the chip-id as the
> > +	 * get_physical_package_id.
> > +	 */
> > +	if (ppid == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
> > +		struct device_node *np = of_get_cpu_node(cpu, NULL);
> > +
> > +		if (np) {
> > +			ppid = of_node_to_nid(np);
> > +			of_node_put(np);
> > +		}
> > +	}
> > +#endif /* CONFIG_PPC_SPLPAR */
> > +
> > +	return ppid;
> > +}
> >  static void add_cpu_to_masks(int cpu)
> >  {
> >  	int first_thread = cpu_first_thread_sibling(cpu);
> > -	int chipid = cpu_to_chip_id(cpu);
> > +	int ppid = get_physical_package_id(cpu);
> >  	int i;
> > 
> >  	/*
> > @@ -1217,11 +1241,11 @@ static void add_cpu_to_masks(int cpu)
> >  	for_each_cpu(i, cpu_l2_cache_mask(cpu))
> >  		set_cpus_related(cpu, i, cpu_core_mask);
> > 
> > -	if (chipid == -1)
> > +	if (ppid == -1)
> >  		return;
> 
> Can get_physical_package_id() return -1 ?
> 

Yes, it can return -1,
1. A System doesnt have CONFIG_PPC_SPLPAR: cpu_to_chip_id() might return -1.
2. A System with CONFIG_PPC_SPLPAR: Still can return -1 for following cases.
	a. Not having firmware feature FW_FEATURE_LPAR
	b. If for some reason, of_get_cpu_node property is not present.

> > 
> >  	for_each_cpu(i, cpu_online_mask)
> > -		if (cpu_to_chip_id(i) == chipid)
> > +		if (get_physical_package_id(i) == ppid)
> >  			set_cpus_related(cpu, i, cpu_core_mask);
> >  }

-- 
Thanks and Regards
Srikar Dronamraju

