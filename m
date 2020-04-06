Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 049AE19FB56
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:22:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wy5Z62D5zDqCK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 03:22:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wy0b4QDKzDrLZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 03:17:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036HA5OT100885
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 Apr 2020 13:17:47 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3085w5ngqk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 13:17:47 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.ibm.com>;
 Mon, 6 Apr 2020 18:17:34 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Apr 2020 18:17:31 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 036HGaI932244082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 17:16:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17D275204F;
 Mon,  6 Apr 2020 17:17:41 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.96.131])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 9D06752050;
 Mon,  6 Apr 2020 17:17:39 +0000 (GMT)
Date: Mon, 6 Apr 2020 22:47:37 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mce: Add MCE notification chain
References: <20200330071219.12284-1-ganeshgr@linux.ibm.com>
 <1585879413.ubv3w8ta2y.astroid@bobo.none>
 <a9b03938-5053-3c44-217b-5892533bd38d@linux.ibm.com>
 <1586139348.0tunz2vuxz.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586139348.0tunz2vuxz.astroid@bobo.none>
X-TM-AS-GCONF: 00
x-cbid: 20040617-0012-0000-0000-0000039F7626
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040617-0013-0000-0000-000021DC94B7
Message-Id: <20200406171737.konw6r3x4uywdul3@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_08:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004060134
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
Reply-To: mahesh@linux.ibm.com
Cc: santosh@fossix.org, linuxppc-dev@lists.ozlabs.org,
 mahesh@linux.vnet.ibm.com, Ganesh <ganeshgr@linux.ibm.com>,
 aneesh.kumar@linux.ibm.com, arbab@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-04-06 12:17:22 Mon, Nicholas Piggin wrote:
> Ganesh's on April 4, 2020 11:05 pm:
> > On 4/3/20 7:38 AM, Nicholas Piggin wrote:
> > 
> >> Ganesh Goudar's on March 30, 2020 5:12 pm:
> >>> From: Santosh S <santosh@fossix.org>
> >>>
> >>> Introduce notification chain which lets know about uncorrected memory
> >>> errors(UE). This would help prospective users in pmem or nvdimm subsystem
> >>> to track bad blocks for better handling of persistent memory allocations.
> >>>
> >>> Signed-off-by: Santosh S <santosh@fossix.org>
> >>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> >> Do you have any such users yet? It would be good to refer to an example
> >> user and give a brief description of what it does in its notifier.
> > 
> > Santosh has sent a patch which uses this notification.
> > https://patchwork.ozlabs.org/patch/1265062/
> 
> Okay. So these things are asynchronous after the machine check. I guess
> that's the design of it and memory offlining does something similar by
> the looks, but how do you prevent the memory being allocated for 
> something else before the notifiers run?

We can't. This race even exists today when we call memory_failure(). If
the same memory is allocated again then we may hit another mce on same
address when touched until the subsystem that has resistered for
notification has completed handling the notified address.

Thanks,
-Mahesh.

> 
> >>> @@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_struct *work)
> >>>   	while (__this_cpu_read(mce_ue_count) > 0) {
> >>>   		index = __this_cpu_read(mce_ue_count) - 1;
> >>>   		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
> >>> +		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
> >> Can we really use a blocking notifier here? I'm not sure that we can.
> > 
> > I think we can, do you see any problem?
> 
> No it looks okay after better look, sorry for the noise.
> 
> Thanks,
> Nick

-- 
Mahesh J Salgaonkar

