Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D259017
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:00:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zg360JFvzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:00:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zg131Kz4zDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 11:59:02 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S1vDtd041017; Thu, 27 Jun 2019 21:58:49 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td76ad7mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 21:58:49 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5S1tCOI009374;
 Fri, 28 Jun 2019 01:58:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2t9by7ajaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 01:58:48 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5S1wklw29294852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 01:58:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 989EABE04F;
 Fri, 28 Jun 2019 01:58:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8451BE051;
 Fri, 28 Jun 2019 01:58:42 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.218.134])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 28 Jun 2019 01:58:42 +0000 (GMT)
References: <20190129134750-mutt-send-email-mst@kernel.org>
 <877eefxvyb.fsf@morokweng.localdomain>
 <20190204144048-mutt-send-email-mst@kernel.org>
 <87ef71seve.fsf@morokweng.localdomain>
 <20190320171027-mutt-send-email-mst@kernel.org>
 <87tvfvbwpb.fsf@morokweng.localdomain>
 <20190323165456-mutt-send-email-mst@kernel.org>
 <87a7go71hz.fsf@morokweng.localdomain>
 <20190520090939-mutt-send-email-mst@kernel.org>
 <877ea26tk8.fsf@morokweng.localdomain>
 <20190603211528-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
In-reply-to: <20190603211528-mutt-send-email-mst@kernel.org>
Date: Thu, 27 Jun 2019 22:58:40 -0300
Message-ID: <877e96qxm7.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280014
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

> On Mon, Jun 03, 2019 at 10:13:59PM -0300, Thiago Jung Bauermann wrote:
>>
>>
>> Michael S. Tsirkin <mst@redhat.com> writes:
>>
>> > On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
>> >> I rephrased it in terms of address translation. What do you think of
>> >> this version? The flag name is slightly different too:
>> >>
>> >>
>> >> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
>> >>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
>> >>     with the exception that address translation is guaranteed to be
>> >>     unnecessary when accessing memory addresses supplied to the device
>> >>     by the driver. Which is to say, the device will always use physical
>> >>     addresses matching addresses used by the driver (typically meaning
>> >>     physical addresses used by the CPU) and not translated further. This
>> >>     flag should be set by the guest if offered, but to allow for
>> >>     backward-compatibility device implementations allow for it to be
>> >>     left unset by the guest. It is an error to set both this flag and
>> >>     VIRTIO_F_ACCESS_PLATFORM.
>> >
>> >
>> > OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
>> > drivers. This is why devices fail when it's not negotiated.
>>
>> Just to clarify, what do you mean by unprivileged drivers? Is it drivers
>> implemented in guest userspace such as with VFIO? Or unprivileged in
>> some other sense such as needing to use bounce buffers for some reason?
>
> I had drivers in guest userspace in mind.

Great. Thanks for clarifying.

I don't think this flag would work for guest userspace drivers. Should I
add a note about that in the flag definition?

>> > This confuses me.
>> > If driver is unpriveledged then what happens with this flag?
>> > It can supply any address it wants. Will that corrupt kernel
>> > memory?
>>
>> Not needing address translation doesn't necessarily mean that there's no
>> IOMMU. On powerpc we don't use VIRTIO_F_ACCESS_PLATFORM but there's
>> always an IOMMU present. And we also support VFIO drivers. The VFIO API
>> for pseries (sPAPR section in Documentation/vfio.txt) has extra ioctls
>> to program the IOMMU.
>>
>> For our use case, we don't need address translation because we set up an
>> identity mapping in the IOMMU so that the device can use guest physical
>> addresses.
>
> And can it access any guest physical address?

Sorry, I was mistaken. We do support VFIO in guests but not for virtio
devices, only for regular PCI devices. In which case they will use
address translation.

>> If the guest kernel is concerned that an unprivileged driver could
>> jeopardize its integrity it should not negotiate this feature flag.
>
> Unfortunately flag negotiation is done through config space
> and so can be overwritten by the driver.

Ok, so the guest kernel has to forbid VFIO access on devices where this
flag is advertised.

>> Perhaps there should be a note about this in the flag definition? This
>> concern is platform-dependant though. I don't believe it's an issue in
>> pseries.
>
> Again ACCESS_PLATFORM has a pretty open definition. It does actually
> say it's all up to the platform.
>
> Specifically how will VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION be
> implemented portably? virtio has no portable way to know
> whether DMA API bypasses translation.

The fact that VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION is set
communicates that knowledge to virtio. There is a shared understanding
between the guest and the host about what this flag being set means.

--
Thiago Jung Bauermann
IBM Linux Technology Center
