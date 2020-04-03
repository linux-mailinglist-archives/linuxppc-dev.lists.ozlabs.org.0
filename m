Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4919DDCA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:19:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v7VV4Nt7zDsPb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 05:18:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v7JK1XDdzDrVb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 05:10:08 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033I8hw1064358; Fri, 3 Apr 2020 14:10:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g88suxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 14:10:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 033I4lKk012897;
 Fri, 3 Apr 2020 18:10:04 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 301x78fqkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 18:10:04 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033IA4uL53281060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 18:10:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC22D124073;
 Fri,  3 Apr 2020 18:10:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEF8B124072;
 Fri,  3 Apr 2020 18:10:02 +0000 (GMT)
Received: from localhost (unknown [9.85.134.35])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 18:10:02 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 6/6] pseries/sysfs: Minimise IPI noise while reading
 [idle_][s]purr
In-Reply-To: <20200403062818.GB9066@in.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-7-git-send-email-ego@linux.vnet.ibm.com>
 <1585734367.oqwn7dzljo.naveen@linux.ibm.com>
 <20200401120127.GC17237@in.ibm.com>
 <1585811157.uig8s95yst.naveen@linux.ibm.com>
 <20200403062818.GB9066@in.ibm.com>
Date: Fri, 03 Apr 2020 13:10:02 -0500
Message-ID: <87o8s88mpx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_14:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=1 adultscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030145
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy <ego@linux.vnet.ibm.com> writes:
> On Thu, Apr 02, 2020 at 01:04:34PM +0530, Naveen N. Rao wrote:
>> >>
>> >>I wonder if we should introduce a sysctl interface to control thresholding.
>> >>It can default to 0, which disables thresholding so that the existing
>> >>behavior continues. Applications (lparstat) can optionally set it to suit
>> >>their use.
>> >
>> >We would be introducing 3 new sysfs interfaces that way instead of
>> >two.
>> >
>> >/sys/devices/system/cpu/purr_spurr_staleness
>> >/sys/devices/system/cpu/cpuX/idle_purr
>> >/sys/devices/system/cpu/cpuX/idle_spurr
>> >
>> >I don't have a problem with this. Nathan, Michael, thoughts on this?

No, I don't think this warrants a tunable when the issue it's intended
to address is still a bit speculative at this point. (Also, note that
this would be a system-wide value, but you could have multiple
concurrent users of the interface with different needs.)


>> >The alternative is to have a procfs interface, something like
>> >/proc/powerpc/resource_util_stats
>> >
>> >which gives a listing similar to /proc/stat, i.e
>> >
>> >      CPUX  <purr>  <idle_purr>  <spurr>  <idle_spurr>
>> >
>> >Even in this case, the values can be obtained in one-shot with a
>> >single IPI and be printed in the row corresponding to the CPU.
>> 
>> Right -- and that would be optimal requiring a single system call, at the
>> cost of using a legacy interface.
>> 
>> The other option would be to drop this patch and to just go with patches 1-5
>> introducing the new sysfs interfaces for idle_[s]purr. It isn't entirely
>> clear how often this would be used, or its actual impact. We can perhaps
>> consider this optimization if and when this causes problems...
>
> I am ok with that. We can revisit the problem if IPI noise becomes
> noticable. However, if Nathan or Michael feel that this problem is
> better solved now, than leaving it for the future, we will have to
> take a call on what the interface is going to be.

While I maintain some concern about the overhead on larger LPARs (150us
per CPU works out to ~0.15s total to serially sample 1024 CPUs, ~0.3s
for 2048 and so on), I am OK with the straightforward addition of the
attributes without any batching or sampling thresholds behind the scenes
for now. I appreciate your consideration of the issue.

If this turns out to be too inefficient then I think we should consider
a non-sysfs mechanism such as chardev+ioctl.
