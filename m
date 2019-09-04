Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54566A96FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 01:21:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0FN5WBbzDr1d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 09:21:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0BT2LcpzDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 09:18:57 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x84NILmm076578; Wed, 4 Sep 2019 19:18:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2utjrp7v55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 19:18:50 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x84NIbPd079310;
 Wed, 4 Sep 2019 19:18:49 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2utjrp7v4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 19:18:49 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x84NFOhD031518;
 Wed, 4 Sep 2019 23:18:48 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 2uqgh7bm3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 23:18:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x84NImNv52560182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 23:18:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02543112061;
 Wed,  4 Sep 2019 23:18:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9211112064;
 Wed,  4 Sep 2019 23:18:47 +0000 (GMT)
Received: from localhost (unknown [9.85.152.33])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 23:18:47 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: missing doorbell interrupt when onlining cpu
In-Reply-To: <87zhjjr7yw.fsf@linux.ibm.com>
References: <87zhjjr7yw.fsf@linux.ibm.com>
Date: Wed, 04 Sep 2019 18:18:46 -0500
Message-ID: <87woenr6p5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=543 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040226
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
Cc: Gautham R Shenoy <ego.lkml@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:

> I'm hoping for some help investigating a behavior I see when doing cpu
> hotplug under load on P9 and P8 LPARs. Occasionally, while coming online
> a cpu will seem to get "stuck" in idle, with a pending doorbell
> interrupt unserviced (cpu 12 here):
>
> cpuhp/12-70    [012] 46133.602202: cpuhp_enter:          cpu: 0012 target: 205 step: 174 (0xc000000000028920s)
>  load.sh-8201  [014] 46133.602248: sched_waking:         comm=cpuhp/12 pid=70 prio=120 target_cpu=012
>  load.sh-8201  [014] 46133.602251: smp_send_reschedule:  (c000000000052868) cpu=12
>   <idle>-0     [012] 46133.602252: do_idle:              (c000000000162e08)
>  load.sh-8201  [014] 46133.602252: smp_muxed_ipi_message_pass: (c0000000000527e8) cpu=12 msg=1
>  load.sh-8201  [014] 46133.602253: doorbell_core_ipi:    (c00000000004d3e8) cpu=12
>   <idle>-0     [012] 46133.602257: arch_cpu_idle:        (c000000000022d08)
>   <idle>-0     [012] 46133.602259: pseries_lpar_idle:    (c0000000000d43c8)

I should be more explicit that given my tracing configuration I would
expect to see doorbell events etc here e.g.

         <idle>-0     [012] 46133.602086: doorbell_entry:       pt_regs=0xc000000200e7fb50
         <idle>-0     [012] 46133.602087: smp_ipi_demux_relaxed: (c0000000000530f8)
         <idle>-0     [012] 46133.602088: scheduler_ipi:        (c00000000015e4f8)
         <idle>-0     [012] 46133.602091: sched_wakeup:         cpuhp/12:70 [120] success=1 CPU:012
         <idle>-0     [012] 46133.602092: sched_wakeup:         migration/12:71 [0] success=1 CPU:012
         <idle>-0     [012] 46133.602093: doorbell_exit:        pt_regs=0xc000000200e7fb50

but instead cpu 12 goes to idle.
