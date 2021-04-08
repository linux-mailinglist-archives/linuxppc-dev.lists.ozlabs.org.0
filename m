Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DB358164
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 13:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGJWk429pz30Dc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 21:12:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KqsxxYEi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KqsxxYEi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGJWH0HMnz2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 21:12:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138B3JH5106690; Thu, 8 Apr 2021 07:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=DIllNxFnS4MobjlLyoXeKUSBkebTQEjKPJFQNYbOwdM=;
 b=KqsxxYEiMAUZENnUk90QhouToVy1d/ZSqcVuaOi9FnZm//r0Xrt2fqIKaXt92hbmw2W3
 Z89MHVS/6f+zOqRVoKIV7BIxNvPNmJNEFLP+zjCwjRl3cp9tCvrMSV1HN0h2kciSrGcL
 usyUv+pyNqX0jmPsumbAtyuRXgPig4XtGqnsCtMOOZnx2qwR4c/nlpb5tWK+tOByJPap
 qla8fiqPyK1f3TJc97ajuZ9QQpA4ngZOl2tu8RiA8D4+TyVUrWDpz+48CDl6qlRui7il
 JScjFlMZed2ItVtW0jMv7GNYolES0Belm1MURks0UiP6EGWHvA01HpKKQWKS6K/ky6VL fg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rvmrfs4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 07:11:57 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138BBOCh018240;
 Thu, 8 Apr 2021 11:11:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbw9h21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 11:11:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 138BBV0S34668828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 11:11:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E20F8A405C;
 Thu,  8 Apr 2021 11:11:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E41D8A4054;
 Thu,  8 Apr 2021 11:11:50 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  8 Apr 2021 11:11:50 +0000 (GMT)
Date: Thu, 8 Apr 2021 16:41:50 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
Message-ID: <20210408111150.GK2339179@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
 <20210402031815.GI2339179@linux.vnet.ibm.com>
 <87eefml22p.fsf@linux.ibm.com>
 <20210407164930.GJ2339179@linux.vnet.ibm.com>
 <878s5tlvxr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <878s5tlvxr.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mcgDT41QGUQZLoMwx9wU4eL5Rshn5AbA
X-Proofpoint-ORIG-GUID: mcgDT41QGUQZLoMwx9wU4eL5Rshn5AbA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_02:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080075
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2021-04-07 14:46:24]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> 
> > * Nathan Lynch <nathanl@linux.ibm.com> [2021-04-07 07:19:10]:
> >
> >> Sorry for the delay in following up here.
> >> 
> >
> > No issues.
> >
> >> >> So I'd suggest that pseries_add_processor() be made to update
> >> >> these things when the CPUs are marked present, before onlining them.
> >> >
> >> > In pseries_add_processor, we are only marking the cpu as present. i.e
> >> > I believe numa_setup_cpu() would not have been called. So we may not have a
> >> > way to associate the CPU to the node. Otherwise we will have to call
> >> > numa_setup_cpu() or the hcall_vphn.
> >> >
> >> > We could try calling numa_setup_cpu() immediately after we set the
> >> > CPU to be present, but that would be one more extra hcall + I dont know if
> >> > there are any more steps needed before CPU being made present and
> >> > associating the CPU to the node.
> >> 
> >> An additional hcall in this path doesn't seem too expensive.
> >> 
> >> > Are we sure the node is already online?
> >> 
> >> I see that dlpar_online_cpu() calls find_and_online_cpu_nid(), so yes I
> >> think that's covered.
> >
> > Okay, 
> >
> > Can we just call set_cpu_numa_node() at the end of map_cpu_to_node().
> > The advantage would be the update to numa_cpu_lookup_table and cpu_to_node
> > would happen at the same time and would be in sync.
> 
> I don't know. I guess this question just makes me wonder whether powerpc
> needs to have the additional lookup table. How is it different from the
> generic per_cpu numa_node?

lookup table is for early cpu to node i.e when per_cpu variables may not be
available. This would mean that calling set_numa_node/set_cpu_numa_node from
map_cpu_to_node() may not always be an option, since map_cpu_to_node() does
end up getting called very early in the system.

-- 
Thanks and Regards
Srikar Dronamraju
