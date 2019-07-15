Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC1669EAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 00:06:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nd0K02pmzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 08:06:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ncy92hj9zDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 08:04:33 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6FLvQSU103955; Mon, 15 Jul 2019 18:04:18 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ts0x82d26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2019 18:04:18 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6FLssOH005937;
 Mon, 15 Jul 2019 22:04:17 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 2tq6x72cu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2019 22:04:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6FM4GoI50331918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 22:04:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE387AE2F0;
 Mon, 15 Jul 2019 22:04:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E60EDAE2C4;
 Mon, 15 Jul 2019 22:04:06 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.238.93])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Jul 2019 22:04:06 +0000 (GMT)
References: <20190323165456-mutt-send-email-mst@kernel.org>
 <87a7go71hz.fsf@morokweng.localdomain>
 <20190520090939-mutt-send-email-mst@kernel.org>
 <877ea26tk8.fsf@morokweng.localdomain>
 <20190603211528-mutt-send-email-mst@kernel.org>
 <877e96qxm7.fsf@morokweng.localdomain>
 <20190701092212-mutt-send-email-mst@kernel.org>
 <87d0id9nah.fsf@morokweng.localdomain>
 <20190715103411-mutt-send-email-mst@kernel.org>
 <874l3nnist.fsf@morokweng.localdomain>
 <20190715163453-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
In-reply-to: <20190715163453-mutt-send-email-mst@kernel.org>
Date: Mon, 15 Jul 2019 19:03:03 -0300
Message-ID: <8736j7neg8.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150246
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

> On Mon, Jul 15, 2019 at 05:29:06PM -0300, Thiago Jung Bauermann wrote:
>>
>> Michael S. Tsirkin <mst@redhat.com> writes:
>>
>> > On Sun, Jul 14, 2019 at 02:51:18AM -0300, Thiago Jung Bauermann wrote:
>> >>
>> >>
>> >> Michael S. Tsirkin <mst@redhat.com> writes:
>> >>
>> >> > So this is what I would call this option:
>> >> >
>> >> > VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS
>> >> >
>> >> > and the explanation should state that all device
>> >> > addresses are translated by the platform to identical
>> >> > addresses.
>> >> >
>> >> > In fact this option then becomes more, not less restrictive
>> >> > than VIRTIO_F_ACCESS_PLATFORM - it's a promise
>> >> > by guest to only create identity mappings,
>> >> > and only before driver_ok is set.
>> >> > This option then would always be negotiated together with
>> >> > VIRTIO_F_ACCESS_PLATFORM.
>> >> >
>> >> > Host then must verify that
>> >> > 1. full 1:1 mappings are created before driver_ok
>> >> >     or can we make sure this happens before features_ok?
>> >> >     that would be ideal as we could require that features_ok fails
>> >> > 2. mappings are not modified between driver_ok and reset
>> >> >     i guess attempts to change them will fail -
>> >> >     possibly by causing a guest crash
>> >> >     or some other kind of platform-specific error
>> >>
>> >> I think VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS is good, but requiring
>> >> it to be accompanied by ACCESS_PLATFORM can be a problem. One reason is
>> >> SLOF as I mentioned above, another is that we would be requiring all
>> >> guests running on the machine (secure guests or not, since we would use
>> >> the same configuration for all guests) to support it. But
>> >> ACCESS_PLATFORM is relatively recent so it's a bit early for that. For
>> >> instance, Ubuntu 16.04 LTS (which is still supported) doesn't know about
>> >> it and wouldn't be able to use the device.
>> >
>> > OK and your target is to enable use with kernel drivers within
>> > guests, right?
>>
>> Right.
>>
>> > My question is, we are defining a new flag here, I guess old guests
>> > then do not set it. How does it help old guests? Or maybe it's
>> > not designed to ...
>>
>> Indeed. The idea is that QEMU can offer the flag, old guests can reject
>> it (or even new guests can reject it, if they decide not to convert into
>> secure VMs) and the feature negotiation will succeed with the flag
>> unset.
>
> OK. And then what does QEMU do? Assume guest is not encrypted I guess?

There's nothing different that QEMU needs to do, with or without the
flag. the perspective of the host, a secure guest and a regular guest
work the same way with respect to virtio.

--
Thiago Jung Bauermann
IBM Linux Technology Center
