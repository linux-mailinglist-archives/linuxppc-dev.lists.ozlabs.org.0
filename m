Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B336DB193
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 01:58:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rWGR1wjszDqcT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 09:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rWDv0MvnzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 09:57:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3QNiM4E057970
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 19:56:59 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s49t4mktt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 19:56:59 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 27 Apr 2019 00:56:58 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 27 Apr 2019 00:56:53 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3QNupCu10879282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Apr 2019 23:56:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A725DC6057;
 Fri, 26 Apr 2019 23:56:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17FABC6055;
 Fri, 26 Apr 2019 23:56:48 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.148.98])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Apr 2019 23:56:47 +0000 (GMT)
References: <20190129134750-mutt-send-email-mst@kernel.org>
 <877eefxvyb.fsf@morokweng.localdomain>
 <20190204144048-mutt-send-email-mst@kernel.org>
 <87ef71seve.fsf@morokweng.localdomain>
 <20190320171027-mutt-send-email-mst@kernel.org>
 <87tvfvbwpb.fsf@morokweng.localdomain>
 <20190323165456-mutt-send-email-mst@kernel.org>
 <87a7go71hz.fsf@morokweng.localdomain>
 <20190419190258-mutt-send-email-mst@kernel.org>
 <875zr228zf.fsf@morokweng.localdomain>
 <20190424210813-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.0; emacs 26.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
In-reply-to: <20190424210813-mutt-send-email-mst@kernel.org>
Date: Fri, 26 Apr 2019 20:56:43 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19042623-0004-0000-0000-000015048871
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011001; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01194867; UDB=6.00626493; IPR=6.00975701; 
 MB=3.00026613; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-26 23:56:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042623-0005-0000-0000-00008B6B307A
Message-Id: <871s1o1ft0.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904260151
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
Cc: Mike Anderson <andmike@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Jason Wang <jasowang@redhat.com>, Alexey Kardashevskiy <aik@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Michael S. Tsirkin <mst@redhat.com> writes:

> On Wed, Apr 24, 2019 at 10:01:56PM -0300, Thiago Jung Bauermann wrote:
>>
>> Michael S. Tsirkin <mst@redhat.com> writes:
>>
>> > On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
>> >>
>> >> Michael S. Tsirkin <mst@redhat.com> writes:
>> >>
>> >> > On Thu, Mar 21, 2019 at 09:05:04PM -0300, Thiago Jung Bauermann wrote:
>> >> >>
>> >> >> Michael S. Tsirkin <mst@redhat.com> writes:
>> >> >>
>> >> >> > On Wed, Mar 20, 2019 at 01:13:41PM -0300, Thiago Jung Bauermann wrote:
>> >> >> >> >From what I understand of the ACCESS_PLATFORM definition, the host will
>> >> >> >> only ever try to access memory addresses that are supplied to it by the
>> >> >> >> guest, so all of the secure guest memory that the host cares about is
>> >> >> >> accessible:
>> >> >> >>
>> >> >> >>     If this feature bit is set to 0, then the device has same access to
>> >> >> >>     memory addresses supplied to it as the driver has. In particular,
>> >> >> >>     the device will always use physical addresses matching addresses
>> >> >> >>     used by the driver (typically meaning physical addresses used by the
>> >> >> >>     CPU) and not translated further, and can access any address supplied
>> >> >> >>     to it by the driver. When clear, this overrides any
>> >> >> >>     platform-specific description of whether device access is limited or
>> >> >> >>     translated in any way, e.g. whether an IOMMU may be present.
>> >> >> >>
>> >> >> >> All of the above is true for POWER guests, whether they are secure
>> >> >> >> guests or not.
>> >> >> >>
>> >> >> >> Or are you saying that a virtio device may want to access memory
>> >> >> >> addresses that weren't supplied to it by the driver?
>> >> >> >
>> >> >> > Your logic would apply to IOMMUs as well.  For your mode, there are
>> >> >> > specific encrypted memory regions that driver has access to but device
>> >> >> > does not. that seems to violate the constraint.
>> >> >>
>> >> >> Right, if there's a pre-configured 1:1 mapping in the IOMMU such that
>> >> >> the device can ignore the IOMMU for all practical purposes I would
>> >> >> indeed say that the logic would apply to IOMMUs as well. :-)
>> >> >>
>> >> >> I guess I'm still struggling with the purpose of signalling to the
>> >> >> driver that the host may not have access to memory addresses that it
>> >> >> will never try to access.
>> >> >
>> >> > For example, one of the benefits is to signal to host that driver does
>> >> > not expect ability to access all memory. If it does, host can
>> >> > fail initialization gracefully.
>> >>
>> >> But why would the ability to access all memory be necessary or even
>> >> useful? When would the host access memory that the driver didn't tell it
>> >> to access?
>> >
>> > When I say all memory I mean even memory not allowed by the IOMMU.
>>
>> Yes, but why? How is that memory relevant?
>
> It's relevant when driver is not trusted to only supply correct
> addresses. The feature was originally designed to support userspace
> drivers within guests.

Ah, thanks for clarifying. I don't think that's a problem in our case.
If the guest provides an incorrect address, the hardware simply won't
allow the host to access it.

>> >> >> > Another idea is maybe something like virtio-iommu?
>> >> >>
>> >> >> You mean, have legacy guests use virtio-iommu to request an IOMMU
>> >> >> bypass? If so, it's an interesting idea for new guests but it doesn't
>> >> >> help with guests that are out today in the field, which don't have A
>> >> >> virtio-iommu driver.
>> >> >
>> >> > I presume legacy guests don't use encrypted memory so why do we
>> >> > worry about them at all?
>> >>
>> >> They don't use encrypted memory, but a host machine will run a mix of
>> >> secure and legacy guests. And since the hypervisor doesn't know whether
>> >> a guest will be secure or not at the time it is launched, legacy guests
>> >> will have to be launched with the same configuration as secure guests.
>> >
>> > OK and so I think the issue is that hosts generally fail if they set
>> > ACCESS_PLATFORM and guests do not negotiate it.
>> > So you can not just set ACCESS_PLATFORM for everyone.
>> > Is that the issue here?
>>
>> Yes, that is one half of the issue. The other is that even if hosts
>> didn't fail, existing legacy guests wouldn't "take the initiative" of
>> not negotiating ACCESS_PLATFORM to get the improved performance. They'd
>> have to be modified to do that.
>
> So there's a non-encrypted guest, hypervisor wants to set
> ACCESS_PLATFORM to allow encrypted guests but that will slow down legacy
> guests since their vIOMMU emulation is very slow.

Yes.

> So enabling support for encryption slows down non-encrypted guests. Not
> great but not the end of the world, considering even older guests that
> don't support ACCESS_PLATFORM are completely broken and you do not seem
> to be too worried by that.

Well, I guess that would be the third half of the issue. :-)

> For future non-encrypted guests, bypassing the emulated IOMMU for when
> that emulated IOMMU is very slow might be solvable in some other way,
> e.g. with virtio-iommu. Which reminds me, could you look at
> virtio-iommu as a solution for some of the issues?
> Review of that patchset from that POV would be appreciated.

Yes, I will have a look. As you mentioned already, virtio-iommu doesn't
define a way to request iommu bypass for a device so that would have to
be added.

Though to be honest in practice I don't think such a feature in
virtio-iommu would make things easier for us, at least in the short
term. It would take the same effort to define a powerpc-specific
hypercall to accomplish the same thing (easier, in fact since we
wouldn't have to implement the rest of virtio-iommu). In fact, there
already is such hypercall, but it is only defined for VIO devices
(RTAS_IBM_SET_TCE_BYPASS in QEMU). We would have to make it work on
virtio devices as well.

--
Thiago Jung Bauermann
IBM Linux Technology Center

