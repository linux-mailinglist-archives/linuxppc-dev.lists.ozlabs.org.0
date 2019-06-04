Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CAC34EA9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 19:23:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JJfH21ZlzDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 03:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JJcl2ggzzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 03:21:42 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x54HIMkK051699
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 13:21:38 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swu4bwayu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 13:21:37 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Tue, 4 Jun 2019 18:21:36 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 18:21:35 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x54HLY2B37880220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 17:21:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 504AD28066;
 Tue,  4 Jun 2019 17:21:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D7F928059;
 Tue,  4 Jun 2019 17:21:34 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jun 2019 17:21:34 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Simplify cpu readd to use drc_index
In-Reply-To: <69336ea3-7937-17cc-8082-d4ad782d7e8c@linux.vnet.ibm.com>
References: <20190516023706.50118-1-tyreld@linux.ibm.com>
 <8736leky3x.fsf@linux.ibm.com>
 <05a4295b-dea5-bea2-5fd3-c8fbee7bac48@linux.vnet.ibm.com>
 <87tvdpjhju.fsf@linux.ibm.com>
 <69336ea3-7937-17cc-8082-d4ad782d7e8c@linux.vnet.ibm.com>
Date: Tue, 04 Jun 2019 12:21:28 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060417-0064-0000-0000-000003E9A3BD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011215; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213199; UDB=6.00637625; IPR=6.00994267; 
 MB=3.00027182; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 17:21:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060417-0065-0000-0000-00003DBD9A79
Message-Id: <87tvd5mfl3.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=833 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040110
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
Cc: mingming.cao@ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.vnet.ibm.com> writes:
> On 05/20/2019 08:01 AM, Nathan Lynch wrote:
>> Kernel implementation details aside, how do you change the cpu-node
>> relationship at runtime without breaking NUMA-aware applications? Is
>> this not a fundamental issue to address before adding code like this?
>> 
>
> If that is the concern then hotplug in general already breaks
> them. Take for example the removal of a faulty processor and then
> adding a new processor back.  It is quite possible that the new
> processor is in a different NUMA node. Keep in mind that in this
> scenario the new processor and threads gets the same logical cpu ids
> as the faulty processor we just removed.

Yes, the problem is re-use of a logical CPU id with a node id that
differs from the one it was initially assigned, and there are several
ways to get into that situation on this platform. We probably need to be
more careful in how we allocate a spot in the CPU maps for a newly-added
processor. I believe the algorithm is simple first-fit right now, and it
doesn't take into account prior NUMA relationships.


> Now we have to ask the question who is right and who is wrong. In this
> case the kernel data structures reflect the correct NUMA
> topology. However, did the NUMA aware application or libnuma make an
> assumption that specific sets of logical cpu ids are always in the
> same NUMA node?

Yes, and that assumption is widespread because people tend to develop on
an architecture where this kind of stuff doesn't happen (at least not
yet).

And I don't really agree that the current behavior reflects what is
actually going on. When Linux running in a PowerVM LPAR receives a
notification to change the NUMA properties of a processor at runtime,
it's because the platform has changed the physical characteristics of
the partition. I.e. you're now using a different physical processor,
with different relationships to the other resources in the system. Even
if it didn't destabilize the kernel (by changing the result of
cpu_to_node() when various subsystems assume it will be static),
continuing to use the logical CPU ids on the new processor obscures what
has actually happened. And we have developers that have told us that
this behavior - changing the logical cpu<->node relationship at runtime
- is something their existing NUMA-aware applications cannot handle.

