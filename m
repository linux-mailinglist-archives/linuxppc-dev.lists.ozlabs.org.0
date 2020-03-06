Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B017C388
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:05:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YvB50Q9jzDr7L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 04:05:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yv872RT9zDqv9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 04:03:18 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026Gse2H106590; Fri, 6 Mar 2020 12:03:10 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ykgnfxub8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 12:03:10 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026GwYPx031882;
 Fri, 6 Mar 2020 17:03:09 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 2yffk8a81x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 17:03:09 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026H37Wg53412158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 17:03:08 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA6DC6A047;
 Fri,  6 Mar 2020 17:03:07 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF6D06A04F;
 Fri,  6 Mar 2020 17:03:07 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 17:03:07 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/5] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
In-Reply-To: <1582625516.nbsanohdks.naveen@linux.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-5-git-send-email-ego@linux.vnet.ibm.com>
 <87eeunubp7.fsf@linux.ibm.com> <20200224051447.GC12846@in.ibm.com>
 <1582625516.nbsanohdks.naveen@linux.ibm.com>
Date: Fri, 06 Mar 2020 11:03:07 -0600
Message-ID: <87wo7xju0k.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_05:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=1 mlxlogscore=973 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003060111
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Gautham R Shenoy wrote:
>> On Fri, Feb 21, 2020 at 10:50:12AM -0600, Nathan Lynch wrote:
>>> It's regrettable that we have to wake up potentially idle CPUs in order
>>> to derive correct idle statistics for them, but I suppose the main user
>>> (lparstat) of these interfaces already is causing this to happen by
>>> polling the existing per-cpu purr and spurr attributes.
>>> 
>>> So now lparstat will incur at minimum four syscalls and four IPIs per
>>> CPU per polling interval -- one for each of purr, spurr, idle_purr and
>>> idle_spurr. Correct?
>> 
>> Yes, it is unforunate that we will end up making four syscalls and
>> generating IPI noise, and this is something that I discussed with
>> Naveen and Kamalesh. We have the following two constraints:
>> 
>> 1) These values of PURR and SPURR required are per-cpu. Hence putting
>> them in lparcfg is not an option.
>> 
>> 2) sysfs semantics encourages a single value per key, the key being
>> the sysfs-file. Something like the following would have made far more
>> sense.
>> 
>> cat /sys/devices/system/cpu/cpuX/purr_spurr_accounting
>> purr:A
>> idle_purr:B
>> spurr:C
>> idle_spurr:D
>> 
>> There are some sysfs files which allow something like this. Eg: 
>> /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
>> 
>> Thoughts on any other alternatives?
>
> Umm... procfs?
> /me ducks

I had wondered about perf events but I'm not sure that's any more suitable.


>>> At some point it's going to make sense to batch sampling of remote CPUs'
>>> SPRs.
>
> How did you mean this? It looks like we first need to provide a separate 
> user interface, since with the existing sysfs interface providing 
> separate files, I am not sure if we can batch such reads.

I mean in order to minimize IPI traffic something like: sample/calculate
all of a CPU's purr, idle_purr, spurr, idle_spurr in a single IPI upon a
read of any of the attributes, and cache the result for some time, so
that the anticipated subsequent reads of the other attributes use the
cached results instead of generating more IPIs.

That would keep the current sysfs interface at the cost of imposing a
certain coarseness in the results.

Anyway, that's a mitigation that could be considered if the
implementation in this patch is found to be too expensive in practice.
