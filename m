Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 747781A652D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 12:29:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4914c10DpyzDqSw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 20:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4914XF1W71zDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 20:26:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4914XF0284z8swp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 20:26:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4914XD6QtQz9sSb; Mon, 13 Apr 2020 20:26:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4914XD1vQVz9sSY;
 Mon, 13 Apr 2020 20:26:04 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03DA4Gag177095; Mon, 13 Apr 2020 06:25:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30b7gvb3qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 06:25:55 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03DA4mLi179154;
 Mon, 13 Apr 2020 06:25:55 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30b7gvb3qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 06:25:55 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03DAAvkx020918;
 Mon, 13 Apr 2020 10:25:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 30b5h5ymkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 10:25:54 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03DAPsm146858750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 10:25:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAC9228059;
 Mon, 13 Apr 2020 10:25:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A4DE28058;
 Mon, 13 Apr 2020 10:25:53 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.63.84])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Apr 2020 10:25:53 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 268E72E2DC4; Mon, 13 Apr 2020 15:55:49 +0530 (IST)
Date: Mon, 13 Apr 2020 15:55:49 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC/PATCH  2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before
 guest entry
Message-ID: <20200413102549.GA22532@in.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585880159.w3mc2nk6h3.astroid@bobo.none>
 <20200403093103.GA20293@in.ibm.com>
 <20200406095819.GC2945@umbus.fritz.box>
 <20200407132526.GB950@in.ibm.com>
 <20200408022957.GC44664@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408022957.GC44664@umbus.fritz.box>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_03:2020-04-12,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 mlxscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130079
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello David,

On Wed, Apr 08, 2020 at 12:29:57PM +1000, David Gibson wrote:
> On Tue, Apr 07, 2020 at 06:55:26PM +0530, Gautham R Shenoy wrote:
> > Hello David,
> > 
> > On Mon, Apr 06, 2020 at 07:58:19PM +1000, David Gibson wrote:
> > > On Fri, Apr 03, 2020 at 03:01:03PM +0530, Gautham R Shenoy wrote:
> > > > On Fri, Apr 03, 2020 at 12:20:26PM +1000, Nicholas Piggin wrote:
> > > > > Gautham R. Shenoy's on March 31, 2020 10:10 pm:
> > > > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > > > 
> > > > > > ISA v3.0 allows the guest to execute a stop instruction. For this, the
> > > > > > PSSCR[ESL|EC] bits need to be cleared by the hypervisor before
> > > > > > scheduling in the guest vCPU.
> > > > > > 
> > > > > > Currently we always schedule in a vCPU with PSSCR[ESL|EC] bits
> > > > > > set. This patch changes the behaviour to enter the guest with
> > > > > > PSSCR[ESL|EC] bits cleared. This is a RFC patch where we
> > > > > > unconditionally clear these bits. Ideally this should be done
> > > > > > conditionally on platforms where the guest stop instruction has no
> > > > > > Bugs (starting POWER9 DD2.3).
> > > > > 
> > > > > How will guests know that they can use this facility safely after your
> > > > > series? You need both DD2.3 and a patched KVM.
> > > > 
> > > > 
> > > > Yes, this is something that isn't addressed in this series (mentioned
> > > > in the cover letter), which is a POC demonstrating that the stop0lite
> > > > state in guest works.
> > > > 
> > > > However, to answer your question, this is the scheme that I had in
> > > > mind :
> > > > 
> > > > OPAL:
> > > >    On Procs >= DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"
> > > > 
> > > > Hypervisor Kernel:
> > > >     1. If "idle-stop-guest" dt-cpu-feature is discovered, then
> > > >        we set bool enable_guest_stop = true;
> > > > 
> > > >     2. During KVM guest entry, clear PSSCR[ESL|EC] iff
> > > >        enable_guest_stop == true.
> > > > 
> > > >     3. In kvm_vm_ioctl_check_extension(), for a new capability
> > > >        KVM_CAP_STOP, return true iff enable_guest_top == true.
> > > > 
> > > > QEMU:
> > > >    Check with the hypervisor if KVM_CAP_STOP is present. If so,
> > > >    indicate the presence to the guest via device tree.
> > > 
> > > Nack.  Presenting different capabilities to the guest depending on
> > > host capabilities (rather than explicit options) is never ok.  It
> > > means that depending on the system you start on you may or may not be
> > > able to migrate to other systems that you're supposed to be able to,
> > 
> > I agree that blocking migration for the unavailability of this feature
> > is not desirable. Could you point me to some other capabilities in KVM
> > which have been implemented via explicit options?
> 
> TBH, most of the options for the 'pseries' machine type are in this
> category: cap-vsx, cap-dfp, cap-htm, a bunch related to various
> Spectre mitigations, cap-hpt-max-page-size (maximum page size for hash
> guests), cap-nested-hv, cap-large-decr, cap-fwnmi, resize-hpt (HPT
> resizing extension), ic-mode (which irq controllers are available to
> the guest).


Thanks. I will follow this suit.

> 
> > The ISA 3.0 allows the guest to execute the "stop" instruction.
> 
> So, this was a bug in DD2.2's implementation of the architecture?

Yes, the previous versions could miss wakeup events when stop was
executed in HV=0,PR=0 mode. So, the hypervisor had to block that.


> 
> > If the
> > Hypervisor hasn't cleared the PSSCR[ESL|EC] then, guest executing the
> > "stop" instruction in the causes a Hypervisor Facility Unavailable
> > Exception, thus giving the hypervisor a chance to emulate the
> > instruction. However, in the current code, when the hypervisor
> > receives this exception, it sends a PROGKILL to the guest which
> > results in crashing the guest.
> > 
> > Patch 1 of this series emulates wakeup from the "stop"
> > instruction. Would the following scheme be ok?
> > 
> > OPAL:
> > 	On Procs >= DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"
> > 
> > Hypervisor Kernel:
> > 
> > 	   If "idle-stop-guest" dt feature is available, then, before
> > 	   entering the guest, the hypervisor clears the PSSCR[EC|ESL]
> > 	   bits allowing the guest to safely execute stop instruction.
> > 
> > 	   If "idle-stop-guest" dt feature is not available, then, the
> > 	   Hypervisor sets the PSSCR[ESL|EC] bits, thereby causing a
> > 	   guest "stop" instruction execution to trap back into the
> > 	   hypervisor. We then emulate a wakeup from the stop
> > 	   instruction (Patch 1 of this series).
> > 
> > Guest Kernel:
> >       If (cpu_has_feature(CPU_FTR_ARCH_300)) only then use the
> >       stop0lite cpuidle state.
> > 
> > This allows us to migrate the KVM guest across any POWER9
> > Hypervisor. The minimal addition that the Hypervisor would need is
> > Patch 1 of this series.
> 
> That could be workable.  Some caveats, though:
> 
>  * How does the latency of the trap-and-emulate compare to the guest
>    using H_CEDE in the first place?  i.e. how big a negative impact
>    will this have for guests running on DD2.2 hosts?


The wakeup latency of trap-and-emulated stop0lite (referred to as
"stop0lite Emulated" in the tables below) the compares favorably
compared to H_CEDE. It is in the order of 5-6us while the wakeup
latency of H_CEDE is ~25-30us.

======================================================================
Wakeup Latency measured using a timer (in ns) [Lower is better]
======================================================================
Idle state |  Nr samples |  Min    | Max    | Median | Avg   | Stddev|
----------------------------------------------------------------------
snooze     |   60        |  787    | 1059   |  938   | 937.4 | 42.27 |
----------------------------------------------------------------------
stop0lite  |   60        |  770    | 1182   |  948   | 946.4 | 67.41 |
----------------------------------------------------------------------
stop0lite  |   60        | 2378    | 7659   | 5006   |5093.6 |1578.7 |  
Emulated   |             |         |        |        |       |       |
----------------------------------------------------------------------
Shared CEDE|   60        | 9550    | 36694  | 29219  |28564.1|3545.9 |
======================================================================


======================================================================
Wakeup latency measured using an IPI (in ns) [Lower is better]
======================================================================
Idle state |  Nr    |  Min    | Max    | Median | Avg     | Stddev   |
           |samples |         |        |        |         |          |
----------------------------------------------------------------------
snooze     |   60   |     2089|    4228|    2259|  2342.31|    316.56|
----------------------------------------------------------------------
stop0lite  |   60   |     1947|    3674|    2653|  2610.57|    266.73|
----------------------------------------------------------------------
stop0lite  |   60   |     3580|    8154|    5596|  5644.95|   1368.44|
Emulated   |        |         |        |        |         |          |
----------------------------------------------------------------------
Shared CEDE|   60   |    20147|   36305|   21827| 26762.65|   6875.01|
======================================================================

> 
>  * We'll only be able to enable this in a new qemu machine type
>    version (say, pseries-5.1.0).  Otherwise a guest could start
>    thinking it can use stop states, then be migrated to an older qemu
>    or host kernel without the support and crash.

That makese sense. In fact in the case of not being able to backport
Patch 1 to all the older hypervisor kernels, we will need a way of
gating the guest from using stop-states and then migrating onto an
older hypervisor kernel. Associating this with a new qemu machine type
version should solve this problem, assuming that all the newer qemus
will also be running on newer hypervisor kernels.



> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

--
Thanks and Regards
gautham.
