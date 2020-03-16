Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 365941872BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 19:52:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h55Q3k6PzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 05:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gvgT417vzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 22:47:48 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02GBW6aJ120670
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 07:47:45 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yru8sp1uk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 07:47:44 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Mon, 16 Mar 2020 11:47:43 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Mar 2020 11:47:41 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02GBleM150724990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Mar 2020 11:47:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3C08AE051;
 Mon, 16 Mar 2020 11:47:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B00C9AE04D;
 Mon, 16 Mar 2020 11:47:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.82.40])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Mar 2020 11:47:39 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Fix MCE handling on pseries
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
 <1584157063.g5s75uhbdu.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Mon, 16 Mar 2020 17:17:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1584157063.g5s75uhbdu.astroid@bobo.none>
Content-Type: multipart/alternative;
 boundary="------------F14B1228BC3C71B919C6F1E1"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20031611-0020-0000-0000-000003B53E5E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031611-0021-0000-0000-0000220D9D5A
Message-Id: <d22f9ef9-07db-9615-6420-001b85dd2742@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-16_03:2020-03-12,
 2020-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003160055
X-Mailman-Approved-At: Tue, 17 Mar 2020 05:51:00 +1100
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------F14B1228BC3C71B919C6F1E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/14/20 9:18 AM, Nicholas Piggin wrote:
> Ganesh Goudar's on March 14, 2020 12:04 am:
>> MCE handling on pSeries platform fails as recent rework to use common
>> code for pSeries and PowerNV in machine check error handling tries to
>> access per-cpu variables in realmode. The per-cpu variables may be
>> outside the RMO region on pSeries platform and needs translation to be
>> enabled for access. Just moving these per-cpu variable into RMO region
>> did'nt help because we queue some work to workqueues in real mode, which
>> again tries to touch per-cpu variables.
> Which queues are these? We should not be using Linux workqueues, but the
> powerpc mce code which uses irq_work.

Yes, irq work queues accesses memory outside RMO.
irq_work_queue()->__irq_work_queue_local()->[this_cpu_ptr(&lazy_list) | this_cpu_ptr(&raised_list)]

>> Also fwnmi_release_errinfo()
>> cannot be called when translation is not enabled.
> Why not?

It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
tree node. But yes we can avoid it by storing it rtas_token somewhere but haven't
tried it, here is the backtrace I got when fwnmi_release_errinfo() called from
realmode handler.

[   70.856908] BUG: Unable to handle kernel data access on read at 0xc0000001ffffa8f8
[   70.856918] Faulting instruction address: 0xc000000000853920
[   70.856927] Oops: Kernel access of bad area, sig: 11 [#1]
[   70.856935] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   70.856943] Modules linked in: mcetest_slb(OE+) bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter sg pseries_rng ip_tables xfs libcrc32c sd_mod t10_pi ibmvscsi ibmveth scsi_transport_srp
[   70.856975] CPU: 13 PID: 6480 Comm: insmod Kdump: loaded Tainted: G           OE     5.6.0-rc2-ganesh+ #6
[   70.856985] NIP:  c000000000853920 LR: c000000000853a14 CTR: c0000000000376b0
[   70.856994] REGS: c000000007e4b870 TRAP: 0300   Tainted: G           OE      (5.6.0-rc2-ganesh+)
[   70.857003] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 88000422  XER: 00000009
[   70.857015] CFAR: c000000000853a10 DAR: c0000001ffffa8f8 DSISR: 40000000 IRQMASK: 1
[   70.857015] GPR00: c000000000853a14 c000000007e4bb00 c000000001372b00 c0000001ffffa8c8
[   70.857015] GPR04: c000000000cf8728 0000000000000000 0000000000000002 c008000000420810
[   70.857015] GPR08: 0000000000000000 0000000000000000 0000000000000001 0000000000000001
[   70.857015] GPR12: 0000000000000000 c000000007f92000 c0000001f8113d70 c00800000059070d
[   70.857015] GPR16: 00000000000004f8 c008000000421080 000000000000fff1 c008000000421038
[   70.857015] GPR20: c00000000125eb20 c000000000d1d1c8 c008000000590000 0000000000000000
[   70.857015] GPR24: 4000000000000510 c008000008000000 c0000000012355d8 c008000000420940
[   70.857015] GPR28: c008000008000011 0000000000000000 c000000000cf8728 c00000000169a098
[   70.857097] NIP [c000000000853920] __of_find_property+0x30/0xd0
[   70.857106] LR [c000000000853a14] of_find_property+0x54/0x90
[   70.857113] Call Trace:
[   70.857117] Instruction dump:
[   70.857124] 3c4c00b2 3842f210 2c230000 418200bc 7c0802a6 fba1ffe8 fbc1fff0 7cbd2b78
[   70.857136] fbe1fff8 7c9e2378 f8010010 f821ffc1 <ebe30030> 2fbf0000 409e0014 48000064
[   70.857152] ---[ end trace 13755f7502f3150b ]---
[   70.864199]
[   70.864226] Sending IPI to other CPUs
[   82.011761] ERROR: 15 cpu(s) not responding

>> This patch fixes this by enabling translation in the exception handler
>> when all required real mode handling is done. This change only affects
>> the pSeries platform.
> Not supposed to do this, because we might not be in a state
> where the MMU is ready to be turned on at this point.
>
> I'd like to understand better which accesses are a problem, and whether
> we can fix them all to be in the RMO.

I faced three such access problems,
  * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_queue),
    we can move this inside RMO.
  * calling fwnmi_release_errinfo().
  * And queuing work to irq_work_queue, not sure how to fix this.

> Thanks,
> Nick


--------------F14B1228BC3C71B919C6F1E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/14/20 9:18 AM, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1584157063.g5s75uhbdu.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Ganesh Goudar's on March 14, 2020 12:04 am:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">MCE handling on pSeries platform fails as recent rework to use common
code for pSeries and PowerNV in machine check error handling tries to
access per-cpu variables in realmode. The per-cpu variables may be
outside the RMO region on pSeries platform and needs translation to be
enabled for access. Just moving these per-cpu variable into RMO region
did'nt help because we queue some work to workqueues in real mode, which
again tries to touch per-cpu variables.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Which queues are these? We should not be using Linux workqueues, but the
powerpc mce code which uses irq_work.</pre>
    </blockquote>
    <pre>Yes, irq work queues accesses memory outside RMO.
irq_work_queue()-&gt;__irq_work_queue_local()-&gt;[this_cpu_ptr(&amp;lazy_list) | this_cpu_ptr(&amp;raised_list)]
</pre>
    <blockquote type="cite"
      cite="mid:1584157063.g5s75uhbdu.astroid@bobo.none">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Also fwnmi_release_errinfo()
cannot be called when translation is not enabled.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why not?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
tree node. But yes we can avoid it by storing it rtas_token somewhere but haven't
tried it, here is the backtrace I got when fwnmi_release_errinfo() called from
realmode handler.

[   70.856908] BUG: Unable to handle kernel data access on read at 0xc0000001ffffa8f8
[   70.856918] Faulting instruction address: 0xc000000000853920
[   70.856927] Oops: Kernel access of bad area, sig: 11 [#1]
[   70.856935] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   70.856943] Modules linked in: mcetest_slb(OE+) bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter sg pseries_rng ip_tables xfs libcrc32c sd_mod t10_pi ibmvscsi ibmveth scsi_transport_srp
[   70.856975] CPU: 13 PID: 6480 Comm: insmod Kdump: loaded Tainted: G           OE     5.6.0-rc2-ganesh+ #6
[   70.856985] NIP:  c000000000853920 LR: c000000000853a14 CTR: c0000000000376b0
[   70.856994] REGS: c000000007e4b870 TRAP: 0300   Tainted: G           OE      (5.6.0-rc2-ganesh+)
[   70.857003] MSR:  8000000000001003 &lt;SF,ME,RI,LE&gt;  CR: 88000422  XER: 00000009
[   70.857015] CFAR: c000000000853a10 DAR: c0000001ffffa8f8 DSISR: 40000000 IRQMASK: 1
[   70.857015] GPR00: c000000000853a14 c000000007e4bb00 c000000001372b00 c0000001ffffa8c8
[   70.857015] GPR04: c000000000cf8728 0000000000000000 0000000000000002 c008000000420810
[   70.857015] GPR08: 0000000000000000 0000000000000000 0000000000000001 0000000000000001
[   70.857015] GPR12: 0000000000000000 c000000007f92000 c0000001f8113d70 c00800000059070d
[   70.857015] GPR16: 00000000000004f8 c008000000421080 000000000000fff1 c008000000421038
[   70.857015] GPR20: c00000000125eb20 c000000000d1d1c8 c008000000590000 0000000000000000
[   70.857015] GPR24: 4000000000000510 c008000008000000 c0000000012355d8 c008000000420940
[   70.857015] GPR28: c008000008000011 0000000000000000 c000000000cf8728 c00000000169a098
[   70.857097] NIP [c000000000853920] __of_find_property+0x30/0xd0
[   70.857106] LR [c000000000853a14] of_find_property+0x54/0x90
[   70.857113] Call Trace:
[   70.857117] Instruction dump:
[   70.857124] 3c4c00b2 3842f210 2c230000 418200bc 7c0802a6 fba1ffe8 fbc1fff0 7cbd2b78
[   70.857136] fbe1fff8 7c9e2378 f8010010 f821ffc1 &lt;ebe30030&gt; 2fbf0000 409e0014 48000064
[   70.857152] ---[ end trace 13755f7502f3150b ]---
[   70.864199]
[   70.864226] Sending IPI to other CPUs
[   82.011761] ERROR: 15 cpu(s) not responding
</pre>
    <blockquote type="cite"
      cite="mid:1584157063.g5s75uhbdu.astroid@bobo.none">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch fixes this by enabling translation in the exception handler
when all required real mode handling is done. This change only affects
the pSeries platform.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not supposed to do this, because we might not be in a state
where the MMU is ready to be turned on at this point.

I'd like to understand better which accesses are a problem, and whether
we can fix them all to be in the RMO.</pre>
    </blockquote>
    <pre>I faced three such access problems,
 * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_queue),
   we can move this inside RMO.
 * calling fwnmi_release_errinfo().
 * And queuing work to irq_work_queue, not sure how to fix this.
</pre>
    <blockquote type="cite"
      cite="mid:1584157063.g5s75uhbdu.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Thanks,
Nick
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F14B1228BC3C71B919C6F1E1--

