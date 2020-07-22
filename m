Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9A22928A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:52:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBSNx3HvDzDr37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:52:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBSF01ySTzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 17:45:40 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M7aqUP051630; Wed, 22 Jul 2020 03:45:32 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrh2c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:45:32 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M7ibSQ018028;
 Wed, 22 Jul 2020 07:45:30 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 32dbmn13pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 07:45:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M7jR8023593376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 07:45:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D1F9A4067;
 Wed, 22 Jul 2020 07:45:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CFC9A405C;
 Wed, 22 Jul 2020 07:45:24 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.146.165])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 07:45:24 +0000 (GMT)
Date: Wed, 22 Jul 2020 00:45:21 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Message-ID: <20200722074521.GA7361@oc0525413822.ibm.com>
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
 <20200722050232.GD3878639@thinks.paulus.ozlabs.org>
 <20200722074205.GH7339@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722074205.GH7339@oc0525413822.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
Subject: RE: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=508 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220052
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: ldufour@linux.ibm.com, aik@ozlabs.ru, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 12:42:05AM -0700, Ram Pai wrote:
> On Wed, Jul 22, 2020 at 03:02:32PM +1000, Paul Mackerras wrote:
> > On Thu, Jul 16, 2020 at 01:32:13AM -0700, Ram Pai wrote:
> > > An instruction accessing a mmio address, generates a HDSI fault.  This fault is
> > > appropriately handled by the Hypervisor.  However in the case of secureVMs, the
> > > fault is delivered to the ultravisor.
> > > 
> > > Unfortunately the Ultravisor has no correct-way to fetch the faulting
> > > instruction. The PEF architecture does not allow Ultravisor to enable MMU
> > > translation. Walking the two level page table to read the instruction can race
> > > with other vcpus modifying the SVM's process scoped page table.
> > > 
> > > This problem can be correctly solved with some help from the kernel.
> > > 
> > > Capture the faulting instruction in SPRG0 register, before executing the
> > > faulting instruction. This enables the ultravisor to easily procure the
> > > faulting instruction and emulate it.
> > 
> > Just a comment on the approach of putting the instruction in SPRG0:
> > these I/O accessors can be used in interrupt routines, which means
> > that if these accessors are ever used with interrupts enabled, there
> > is the possibility of an external interrupt occurring between the
> > instruction that sets SPRG0 and the load/store instruction that
> > faults.  If the handler for that interrupt itself does an I/O access,
> > it will overwrite SPRG0, corrupting the value set by the interrupted
> > code.
> 
> Acutally my proposed code restores the value of SPRG0 before returning back to
> the interrupted instruction. So here is the sequence. I think it works.
> 
>  (1) store sprg0 in register Rx (lets say srpg0 had 0xc. Rx now contains 0xc)
> 
>  (2) save faulting instruction address in sprg0 (lets say the value is 0xa.
> 		 			sprg0 will contain 0xa).

Small correction. sprg0 does not store the address of the faulting
instruction. It stores the isntruction itself. Regardless, the code
should work, I think.

RP
