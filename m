Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22C4C3F48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 08:48:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4hjD1LF0z3cC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 18:48:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaAZEPh3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DaAZEPh3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4hhR1qRTz3bNs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 18:47:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21P4TuLx026634; 
 Fri, 25 Feb 2022 07:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=AcatjmiBHbccUpcc7TaHOoYhFJm1bkKhJ0c85l+DH3I=;
 b=DaAZEPh3Krjhza8G5X7WYKd5mvXv/agogDXHR/e8pnvGM85o8WzwvZCLfwY+HDfXnFRy
 Y8ds9a4ND6yQoHQ60ARg2PpDRVDRNT7Kmt7U+ONrsJ6Ruy9C+ng7fDmslFkkigRGANA1
 cq4kplfsFDsR8xgHF6aunf5++BnasogwjHciKgpBJVmJ1stDTZjcEsd1S6cAthuZ5g9x
 O80stGMdIEXFAMAXqgxU4pin3FBgrN/iT5FfWgKvzjvmvHeGPj7mipvxxjpk9pH+LYpS
 6CMaxXKTERy4SFazBOQIg3dyPekIWG7BEy5NRhKo2bszG6DYbO//VH+e5bwpYOCsJ5wg wg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edwkf6a25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 07:47:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21P7iwws003036;
 Fri, 25 Feb 2022 07:47:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eaqtjpv2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 07:47:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21P7lLbu35455288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 07:47:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 250B952057;
 Fri, 25 Feb 2022 07:47:21 +0000 (GMT)
Received: from [9.43.16.34] (unknown [9.43.16.34])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9BFE152051;
 Fri, 25 Feb 2022 07:47:16 +0000 (GMT)
Message-ID: <125761cdabbfeaf6615e67d087ec113408f8eb7e.camel@linux.ibm.com>
Subject: Re: [PATCH v6 0/4] Add perf interface to expose nvdimm
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
To: kajoljain <kjain@linux.ibm.com>, Nageswara Sastry
 <rnsastry@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Date: Fri, 25 Feb 2022 13:17:15 +0530
In-Reply-To: <ea6bc468-c7ae-c844-5111-8f0dc3207f89@linux.ibm.com>
References: <20220217163357.276036-1-kjain@linux.ibm.com>
 <ddf18609-84ad-e263-7dff-7b2cc68557ef@linux.ibm.com>
 <ea6bc468-c7ae-c844-5111-8f0dc3207f89@linux.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KIO23H0IT1eV-_hrr8t5UPG0zJq5phzF
X-Proofpoint-ORIG-GUID: KIO23H0IT1eV-_hrr8t5UPG0zJq5phzF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_05,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250038
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
Cc: vaibhav@linux.ibm.com, santosh@fossix.org, maddy@linux.ibm.com,
 tglx@linutronix.de, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-02-25 at 12:08 +0530, kajoljain wrote:
> 
> 
> On 2/25/22 11:25, Nageswara Sastry wrote:
> > 
> > 
> > On 17/02/22 10:03 pm, Kajol Jain wrote:
> > > 
....
> > > 
> > > Changelog
> > 
> > Tested these patches with the automated tests at
> > avocado-misc-tests/perf/perf_nmem.py
> > URL:
> > https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/perf/perf_nmem.py
> > 
> > 
> > 1. On the system where target id and online id were different then
> > not
> > seeing value in 'cpumask' and those tests failed.
> > 
> > Example:
> > Log from dmesg
> > ...
> > papr_scm ibm,persistent-memory:ibm,pmemory@44100003: Region
> > registered
> > with target node 1 and online node 0
> > ...
> 
> Hi Nageswara Sastry,
>        Thanks for testing the patch set. Yes you right, incase target
> node id and online node id is different, it can happen when target
> node is not online and hence can cause this issue, thanks for
> pointing
> it.
> 
> Function dev_to_node will return node id for a given nvdimm device
> which
> can be offline in some scenarios. We should use numa node id return
> by
> numa_map_to_online_node function in that scenario. This function
> incase
> given node is offline, it will lookup for next closest online node
> and
> return that nodeid.
> 
> Can you try with below change and see, if you are still getting this
> issue. Please let me know.
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
> b/arch/powerpc/platforms/pseries/papr_scm.c
> index bdf2620db461..4dd513d7c029 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -536,7 +536,7 @@ static void papr_scm_pmu_register(struct
> papr_scm_priv *p)
>                                 PERF_PMU_CAP_NO_EXCLUDE;
> 
>         /*updating the cpumask variable */
> -       nodeid = dev_to_node(&p->pdev->dev);
> +       nodeid = numa_map_to_online_node(dev_to_node(&p->pdev->dev));
>         nd_pmu->arch_cpumask = *cpumask_of_node(nodeid);
> 
> > 

Can you use p->region->numa_node? 

-aneesh


