Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348A20AD83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 09:47:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tTW86xhqzDr0w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 17:47:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tTTD47V7zDqws
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 17:45:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05Q7XZTI161988; Fri, 26 Jun 2020 03:45:47 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux04b7p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 03:45:43 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05Q7dnSQ023977;
 Fri, 26 Jun 2020 07:45:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 31uurtewu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 07:45:26 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05Q7jNCZ7143812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 07:45:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E5E86A04F;
 Fri, 26 Jun 2020 07:45:25 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D94016A057;
 Fri, 26 Jun 2020 07:45:24 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.217.126])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 07:45:24 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 3B8122E4AB5; Fri, 26 Jun 2020 13:15:21 +0530 (IST)
Date: Fri, 26 Jun 2020 13:15:21 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show cpumask
Message-ID: <20200626074521.GA13159@in.ibm.com>
References: <20200624101754.169612-1-kjain@linux.ibm.com>
 <20200624101754.169612-3-kjain@linux.ibm.com>
 <20200624105603.GD31972@in.ibm.com>
 <a6a626e6-22eb-f1c2-4356-dfe1caf8db46@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6a626e6-22eb-f1c2-4356-dfe1caf8db46@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_04:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 cotscore=-2147483648
 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006260054
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 suka@us.ibm.com, anju@linux.vnet.ibm.com, Kajol Jain <kjain@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 24, 2020 at 05:58:31PM +0530, Madhavan Srinivasan wrote:
> 
> 
> On 6/24/20 4:26 PM, Gautham R Shenoy wrote:
> >Hi Kajol,
> >
> >On Wed, Jun 24, 2020 at 03:47:54PM +0530, Kajol Jain wrote:
> >>Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.
> >>
> >>command:# cat /sys/devices/hv_24x7/cpumask
> >>0
> >Since this sysfs interface is read-only, and the user cannot change
> >the CPU which will be making the HCALLs to obtain the 24x7 counts,
> >does the user even need to know if currently CPU X is the one which is
> >going to make HCALLs to retrive the 24x7 counts ? Does it help in any
> >kind of trouble-shooting ?
> Primary use to expose the cpumask is for the perf tool.
> Which has the capability to parse the driver sysfs folder
> and understand the cpumask file. Having cpumask
> file will reduce the number of perf commandline
> parameters (will avoid "-C" option in the perf tool
> command line). I can also notify the user which is
> the current cpu used to retrieve the counter data.

Fair enough. Can we include this in the patch description ?

> 
> >It would have made sense if the interface was read-write, since a user
> >can set this to a CPU which is not running user applications. This
> >would help in minimising jitter on those active CPUs running the user
> >applications.
> 
> With cpumask backed by hotplug
> notifiers, enabling user write access to it will
> complicate the code with more additional check.
> CPU will come to play only if the user request for
> counter data. If not, then there will be no HCALLs made
> using the CPU.

Well, I was wondering if you could make the interface writable because
I couldn't think of the use of a read-only interface. With the
perf-use case you have provided, I guess it makes sense. I am ok with
it being a read-only interface.

> 
> Maddy

--
Thanks and Regards
gautham.
