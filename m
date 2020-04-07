Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE4A1A0E67
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:32:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xSyD42jwzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 23:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xSpR11mmzDqCs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:25:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48xSpH4Kf8z9BL6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:25:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 48xSpH1KhBz9sSc; Tue,  7 Apr 2020 23:25:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48xSpG3P0sz9sR4;
 Tue,  7 Apr 2020 23:25:42 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037D54XW133505; Tue, 7 Apr 2020 09:25:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082peeqkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 09:25:34 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 037D6PVl140797;
 Tue, 7 Apr 2020 09:25:34 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082peeqkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 09:25:34 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 037DKhne004126;
 Tue, 7 Apr 2020 13:25:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 306hv6eduf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 13:25:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 037DPVK153215506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 13:25:31 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE56BE054;
 Tue,  7 Apr 2020 13:25:31 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9ACFBE051;
 Tue,  7 Apr 2020 13:25:30 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.49.248])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 13:25:30 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 3D6C62E3231; Tue,  7 Apr 2020 18:55:26 +0530 (IST)
Date: Tue, 7 Apr 2020 18:55:26 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC/PATCH  2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before
 guest entry
Message-ID: <20200407132526.GB950@in.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585880159.w3mc2nk6h3.astroid@bobo.none>
 <20200403093103.GA20293@in.ibm.com>
 <20200406095819.GC2945@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406095819.GC2945@umbus.fritz.box>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_05:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=800 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070109
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

On Mon, Apr 06, 2020 at 07:58:19PM +1000, David Gibson wrote:
> On Fri, Apr 03, 2020 at 03:01:03PM +0530, Gautham R Shenoy wrote:
> > On Fri, Apr 03, 2020 at 12:20:26PM +1000, Nicholas Piggin wrote:
> > > Gautham R. Shenoy's on March 31, 2020 10:10 pm:
> > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > 
> > > > ISA v3.0 allows the guest to execute a stop instruction. For this, the
> > > > PSSCR[ESL|EC] bits need to be cleared by the hypervisor before
> > > > scheduling in the guest vCPU.
> > > > 
> > > > Currently we always schedule in a vCPU with PSSCR[ESL|EC] bits
> > > > set. This patch changes the behaviour to enter the guest with
> > > > PSSCR[ESL|EC] bits cleared. This is a RFC patch where we
> > > > unconditionally clear these bits. Ideally this should be done
> > > > conditionally on platforms where the guest stop instruction has no
> > > > Bugs (starting POWER9 DD2.3).
> > > 
> > > How will guests know that they can use this facility safely after your
> > > series? You need both DD2.3 and a patched KVM.
> > 
> > 
> > Yes, this is something that isn't addressed in this series (mentioned
> > in the cover letter), which is a POC demonstrating that the stop0lite
> > state in guest works.
> > 
> > However, to answer your question, this is the scheme that I had in
> > mind :
> > 
> > OPAL:
> >    On Procs >= DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"
> > 
> > Hypervisor Kernel:
> >     1. If "idle-stop-guest" dt-cpu-feature is discovered, then
> >        we set bool enable_guest_stop = true;
> > 
> >     2. During KVM guest entry, clear PSSCR[ESL|EC] iff
> >        enable_guest_stop == true.
> > 
> >     3. In kvm_vm_ioctl_check_extension(), for a new capability
> >        KVM_CAP_STOP, return true iff enable_guest_top == true.
> > 
> > QEMU:
> >    Check with the hypervisor if KVM_CAP_STOP is present. If so,
> >    indicate the presence to the guest via device tree.
> 
> Nack.  Presenting different capabilities to the guest depending on
> host capabilities (rather than explicit options) is never ok.  It
> means that depending on the system you start on you may or may not be
> able to migrate to other systems that you're supposed to be able to,

I agree that blocking migration for the unavailability of this feature
is not desirable. Could you point me to some other capabilities in KVM
which have been implemented via explicit options?

The ISA 3.0 allows the guest to execute the "stop" instruction. If the
Hypervisor hasn't cleared the PSSCR[ESL|EC] then, guest executing the
"stop" instruction in the causes a Hypervisor Facility Unavailable
Exception, thus giving the hypervisor a chance to emulate the
instruction. However, in the current code, when the hypervisor
receives this exception, it sends a PROGKILL to the guest which
results in crashing the guest.

Patch 1 of this series emulates wakeup from the "stop"
instruction. Would the following scheme be ok?

OPAL:
	On Procs >= DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"

Hypervisor Kernel:

	   If "idle-stop-guest" dt feature is available, then, before
	   entering the guest, the hypervisor clears the PSSCR[EC|ESL]
	   bits allowing the guest to safely execute stop instruction.

	   If "idle-stop-guest" dt feature is not available, then, the
	   Hypervisor sets the PSSCR[ESL|EC] bits, thereby causing a
	   guest "stop" instruction execution to trap back into the
	   hypervisor. We then emulate a wakeup from the stop
	   instruction (Patch 1 of this series).

Guest Kernel:
      If (cpu_has_feature(CPU_FTR_ARCH_300)) only then use the
      stop0lite cpuidle state.

This allows us to migrate the KVM guest across any POWER9
Hypervisor. The minimal addition that the Hypervisor would need is
Patch 1 of this series.
	   



--
Thanks and Regards
gautham.

