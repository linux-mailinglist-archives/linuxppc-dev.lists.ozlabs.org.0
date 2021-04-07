Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B8357262
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 18:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFr401Dm9z302t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 02:50:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PkkQQG5D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PkkQQG5D; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFr3R1Jx5z2yym
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 02:49:54 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137GkQJH099492; Wed, 7 Apr 2021 12:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=DVglUePn2mo2HuidKepE6u1D9B1Xs08izaWtLpJecKQ=;
 b=PkkQQG5D+wbz0givGugJjvn2DqAWHXpmMPesN5zLVJxjfD+639uWMUmFBlNnLLyeWvlR
 TWmw3wyDDGnB0bDKA48xqJvymvU6Pj6dBU8gACupCvBX620NG+6oUtrXExeYkgCbBkvo
 xIrUIPyhA/g+9+Yh3KcC85mVDw9BnibL0LiVRLxaL7MEOJ1aHGkiZkrU/4mTQY6wkptq
 VWiMLG7xiMoWclxI1uliRwPGLNiKieVba98+HSsbn2nK9bGGMAGGZv36s3fqPhq9xAM1
 PdI0qjCYhWf0wjRLChV21S21cqVTUF636U8YcI9x46l7nZXbP9Ti4/7SXoJ2eTqwtlmu 2g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpjxt74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 12:49:38 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137GhVDl020064;
 Wed, 7 Apr 2021 16:49:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 37rvc5gfjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 16:49:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 137GnCc925035242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 16:49:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E9345204E;
 Wed,  7 Apr 2021 16:49:33 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2581D5204F;
 Wed,  7 Apr 2021 16:49:31 +0000 (GMT)
Date: Wed, 7 Apr 2021 22:19:30 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
Message-ID: <20210407164930.GJ2339179@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
 <20210402031815.GI2339179@linux.vnet.ibm.com>
 <87eefml22p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87eefml22p.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NFScKcWjMeOERj0hSVTRwbHtnVsjxiSY
X-Proofpoint-GUID: NFScKcWjMeOERj0hSVTRwbHtnVsjxiSY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104070112
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

* Nathan Lynch <nathanl@linux.ibm.com> [2021-04-07 07:19:10]:

> Sorry for the delay in following up here.
> 

No issues.

> >> So I'd suggest that pseries_add_processor() be made to update
> >> these things when the CPUs are marked present, before onlining them.
> >
> > In pseries_add_processor, we are only marking the cpu as present. i.e
> > I believe numa_setup_cpu() would not have been called. So we may not have a
> > way to associate the CPU to the node. Otherwise we will have to call
> > numa_setup_cpu() or the hcall_vphn.
> >
> > We could try calling numa_setup_cpu() immediately after we set the
> > CPU to be present, but that would be one more extra hcall + I dont know if
> > there are any more steps needed before CPU being made present and
> > associating the CPU to the node.
> 
> An additional hcall in this path doesn't seem too expensive.
> 
> > Are we sure the node is already online?
> 
> I see that dlpar_online_cpu() calls find_and_online_cpu_nid(), so yes I
> think that's covered.

Okay, 

Can we just call set_cpu_numa_node() at the end of map_cpu_to_node().
The advantage would be the update to numa_cpu_lookup_table and cpu_to_node
would happen at the same time and would be in sync.

-- 
Thanks and Regards
Srikar Dronamraju
