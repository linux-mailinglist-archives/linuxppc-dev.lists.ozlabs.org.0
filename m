Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE9A9CC4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 11:11:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H5ph0GKCzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 19:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H5mF3vS4zDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 19:09:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46H5mF0btVz8t0m
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 19:09:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46H5mD6xtkz9sNF; Mon, 26 Aug 2019 19:09:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46H5mD1GRQz9s7T
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 19:09:14 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7Q970i9010236; Mon, 26 Aug 2019 05:09:11 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umbsy1ney-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 05:09:11 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7Q95F2F025282;
 Mon, 26 Aug 2019 09:09:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 2ujvv6bxrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 09:09:10 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7Q999lt43909422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 09:09:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BFD378063;
 Mon, 26 Aug 2019 09:09:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01A7878060;
 Mon, 26 Aug 2019 09:09:08 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.156])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 09:09:08 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 7BDCE2E3C81; Mon, 26 Aug 2019 14:39:05 +0530 (IST)
Date: Mon, 26 Aug 2019 14:39:05 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
Message-ID: <20190826090905.GA1792@in.ibm.com>
References: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=955 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260102
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
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Sachin,


On Sat, Aug 24, 2019 at 09:34:41PM +0530, Sachin Sant wrote:
> linux-next is currently broken on POWER8 non virtualized. Kernel
> fails to reach login prompt with following kernel warning
> repeatedly shown during boot.
> 
> The problem dates back atleast till next-20190816. 
> 
> [   40.285606] WARNING: CPU: 1 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
> [   40.285609] Modules linked in: kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg ipmi_powernv ipmi_devintf powernv_rng uio_pdrv_genirq uio leds_powernv ipmi_msghandler powernv_op_panel ibmpowernv ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
> [   40.285643] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.3.0-rc5-next-20190823-autotest-autotest #1
> [   40.285644] NIP:  c0000000000b5f40 LR: c000000000055498 CTR: c0000000000b5ef0
> [   40.285646] REGS: c0000007f5527980 TRAP: 0700   Not tainted  (5.3.0-rc5-next-20190823-autotest-autotest)
> [   40.285646] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
> [   40.285650] CFAR: c000000000055494 IRQMASK: 1 
> [   40.285650] GPR00: c000000000055498 c0000007f5527c10 c00000000148b200 0000000000000000 
> [   40.285650] GPR04: 0000000000000000 c0000007fa897d80 c0000007fa90c800 00000007f9980000 
> [   40.285650] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fa90c800 
> [   40.285650] GPR12: c0000000000b5ef0 c0000007ffffee00 0000000000000800 c000000ffffc11d0 
> [   40.285650] GPR16: 0000000000000001 c000000001035280 0000000000000000 c0000000015303c0 
> [   40.285650] GPR20: c000000000052d60 0000000000000001 c0000007f54cd800 c0000007f54cd880 
> [   40.285650] GPR24: 0000000000080000 c0000007f54cd800 c0000000014bdf78 c0000000014c20d8 
> [   40.285650] GPR28: 0000000000000002 c0000000014c2538 0000000000000001 c0000007f54cd800 
> [   40.285662] NIP [c0000000000b5f40] pnv_smp_cpu_kill_self+0x50/0x2d0
> [   40.285664] LR [c000000000055498] cpu_die+0x48/0x64
> [   40.285665] Call Trace:
> [   40.285667] [c0000007f5527c10] [c000000000f85f10] ppc64_tlb_batch+0x0/0x1220 (unreliable)
> [   40.285669] [c0000007f5527df0] [c000000000055498] cpu_die+0x48/0x64
> [   40.285672] [c0000007f5527e10] [c0000000000226a0] arch_cpu_idle_dead+0x20/0x40
> [   40.285674] [c0000007f5527e30] [c00000000016bd2c] do_idle+0x37c/0x3f0
> [   40.285676] [c0000007f5527ed0] [c00000000016bfac] cpu_startup_entry+0x3c/0x50
> [   40.285678] [c0000007f5527f00] [c000000000055198] start_secondary+0x638/0x680
> [   40.285680] [c0000007f5527f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
> [   40.285680] Instruction dump:
> [   40.285681] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
> [   40.285684] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
> [   40.285687] ---[ end trace 72c90a064122d9e4 ]—

Could you please share the test-case that you were running and the
command line parameter ?


> 
> Relevant code snippet :
> 156         /*
> 157          * This hard disables local interurpts, ensuring we have no lazy
> 158          * irqs pending.
> 159          */
> 160         WARN_ON(irqs_disabled());  <<===
> 161         hard_irq_disable();
> 162         WARN_ON(lazy_irq_pending());
> 
> Thanks
> -Sachin
> 
