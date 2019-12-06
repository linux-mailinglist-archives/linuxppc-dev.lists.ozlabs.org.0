Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04A115983
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 00:12:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V7ds5GHyzDqHY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 10:12:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V7bs5wKBzDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 10:10:33 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6N7Y6M115034
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 18:10:28 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9hpew0t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 18:10:27 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 6 Dec 2019 23:10:25 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 23:10:21 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6NAKXV53084264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 23:10:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C49AAE056;
 Fri,  6 Dec 2019 23:10:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 891A0AE04D;
 Fri,  6 Dec 2019 23:10:16 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.215.155])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Dec 2019 23:10:16 +0000 (GMT)
Date: Fri, 6 Dec 2019 15:10:13 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <0b56ce3e-6c32-5f3b-e7cc-0d419a61d71d@ozlabs.ru>
 <20191203040509.GB12354@oc0525413822.ibm.com>
 <a0f19e65-81eb-37bd-928b-7a57a8660e3d@ozlabs.ru>
 <20191203165204.GA5079@oc0525413822.ibm.com>
 <3a17372a-fcee-efbf-0a05-282ffb1adc90@ozlabs.ru>
 <20191204004958.GB5063@oc0525413822.ibm.com>
 <5963ff32-2119-be7c-d1e5-63457888a73b@ozlabs.ru>
 <20191204033618.GA5031@umbus.fritz.box>
 <20191204204232.GE5063@oc0525413822.ibm.com>
 <c2dda233-2a11-a066-5d44-68e2a0b5121e@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2dda233-2a11-a066-5d44-68e2a0b5121e@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19120623-0012-0000-0000-0000037267E0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120623-0013-0000-0000-000021AE31CE
Message-Id: <20191206231013.GA5709@oc0525413822.ibm.com>
Subject: RE: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_07:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=1 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060184
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
Cc: andmike@us.ibm.com, mst@redhat.com, mdroth@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, ram.n.pai@gmail.com, cai@lca.pw,
 tglx@linutronix.de, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de, bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 05, 2019 at 09:26:14AM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 05/12/2019 07:42, Ram Pai wrote:
.snip...
> >>>> Do you still think, secure-VM should use H_PUT_TCE and not
> >>>> H_PUT_TCE_INDIRECT?  And normal VM should use H_PUT_TCE_INDIRECT?
> >>>> Is there any advantage of special casing it for secure-VMs.
> >>>
> >>>
> >>> Reducing the amount of insecure memory at random location.
> >>
> >> The other approach we could use for that - which would still allow
> >> H_PUT_TCE_INDIRECT, would be to allocate the TCE buffer page from the
> >> same pool that we use for the bounce buffers.  I assume there must
> >> already be some sort of allocator for that?
> > 
> > The allocator for swiotlb is buried deep in the swiotlb code. It is 
> > not exposed to the outside-swiotlb world. Will have to do major surgery
> > to expose it.
> > 
> > I was thinking, maybe we share the page, finish the INDIRECT_TCE call,
> > and unshare the page.  This will address Alexey's concern of having
> > shared pages at random location, and will also give me my performance
> > optimization.  Alexey: ok?
> 
> 
> I really do not see the point. I really think we should to 1:1 mapping
> of swtiotlb buffers using the default 32bit window using H_PUT_TCE and
> this should be more than enough, I do not think the amount of code will
> be dramatically different compared to unsecuring and securing a page or
> using one of swtiotlb pages for this purpose. Thanks,

Ok. there are three different issues to be addressed here.

(a) How to map the TCE entries in the TCE table?  Should we use H_PUT_TCE, 
	or H_PUT_INDIRECT_TCE?

(b) How much of the guest memory must be mapped in the TCE table? Should
   it be the entire guest memory? or the memory used by the SWIOTLB?

(c) What mapping window must to be used? Is it the 64bit ddw? or the 
	default 32 bit ddw?

Regardless of how we resolve issue (b) and (c),  we still need to
resolve (a).  The main concern you have about solution (a) is
that, random pages are permanently shared, something that can be
exploited and can cause security issues.  I tend to agree, this
is possible, though I am not sure how. But yes we need to address
this concern, since security is paramount to Secure Virtual Machines.

The way to resolve (a) is  --
(i) grab a page from the SWIOTLB pool and use H_PUT_INDIRECT_TCE
	OR
(ii) simply use H_PUT_TCE.
	OR
(iii) share the page prior to H_PUT_INDIRECT_TCE, and
	unshare the page once done.

Solution (i) has layering violation; as Christoph alluded to in his
previous reply. The swiotlb buffers are meant for I/O and DMA related
actitivy.  We will be abusing these swiotlb pages to communicate TCE
entries to the hypervisor.  Secondly IOMMU code has no idea where its
pages are sourced from and should not know either. I am uncomfortable
going this route. There is some upstream discussion about having a seperate
pool of shared pages on secure VM, https://lkml.org/lkml/2019/11/14/381.
That solution; when ready, may be exploitable here.

I have coded solution (ii)  and it works. But boot path slows down
significantly. Huge amount H_PUT_TCE hcalls. Very hurtful.

I strongly think, solution (iii) is the right way to go. I have coded
it, it works and bootpath is much faster.  However I am not sure if you
have a concern with this solution.

In any case, I am sending my next version of the patch based on solution
(iii).

Once this is addressed, I will address (b) and (c).

RP

