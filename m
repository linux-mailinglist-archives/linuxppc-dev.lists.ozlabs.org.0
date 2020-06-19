Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2300D1FFF9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 03:18:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p1CB0hKLzDr86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 11:18:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p19S15TczDrDX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 11:16:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05J13WZA185906; Thu, 18 Jun 2020 21:16:36 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rg0rn1cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 21:16:36 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05J1Akdd021930;
 Fri, 19 Jun 2020 01:16:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 31r1kq0k8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 01:16:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05J1GUQB65470876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 01:16:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3D80AE051;
 Fri, 19 Jun 2020 01:16:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B6C0AE045;
 Fri, 19 Jun 2020 01:16:27 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.71.42])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Jun 2020 01:16:26 +0000 (GMT)
Date: Thu, 18 Jun 2020 18:16:24 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] KVM: PPC: Book3S HV: track the state GFNs
 associated with secure VMs
Message-ID: <20200619011624.GB6772@oc0525413822.ibm.com>
References: <1592471945-24786-1-git-send-email-linuxram@us.ibm.com>
 <1592471945-24786-3-git-send-email-linuxram@us.ibm.com>
 <7f5aea68-0cc5-6ae5-c30e-eee60eff5a92@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f5aea68-0cc5-6ae5-c30e-eee60eff5a92@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_21:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0
 cotscore=-2147483648 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190004
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
Cc: cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org, bharata@linux.ibm.com,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 03:31:06PM +0200, Laurent Dufour wrote:
> Le 18/06/2020 à 11:19, Ram Pai a écrit :
> >

.snip..

> >************************************************************************
> >  1. States of a GFN
> >     ---------------
> >  The GFN can be in one of the following states.
> >diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c

...snip...

> >index 803940d..3448459 100644
> >--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> >+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> >@@ -1100,7 +1100,7 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
> >  	unsigned int shift;
> >  	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START)
> >-		kvmppc_uvmem_drop_pages(memslot, kvm, true);
> >+		kvmppc_uvmem_drop_pages(memslot, kvm, true, false);
> 
> When reviewing the v1 of this series, I asked you the question about
> the fact that the call here is made with purge_gfn = false. Your
> answer was:
> 
> >This function does not know, under what context it is called. Since
> >its job is to just flush the memslot, it cannot assume anything
> >about purging the pages in the memslot.
> 
> Indeed in the case of the memory hotplug operation, this function is
> called to wipe the page from the secure device in the case the pages
> are secured. In that case the purge is required. Indeed, I checked
> the other call to kvmppc_radix_flush_memslot() in
> kvmppc_core_flush_memslot_hv() and I cannot see why in that case too
> purge_gfn should be false, especially when the memslot is reused as
> detailed in __kvm_set_memory_region() around the call to
> kvm_arch_flush_shadow_memslot().
> 
> I'm sorry to not have ask this earlier, but could you please elaborate on this?

You are right. kvmppc_radix_flush_memslot() is getting called everytime with
the intention of disassociating the memslot from that VM. Which implies,
the memslot is intended to be deleted and possibly reused.

I should be calling kvmppc_uvmem_drop_pages() with purge_gfn=true, here
aswell.

I expect some form of problem showing up in memhot-plug/unplug path.

RP

