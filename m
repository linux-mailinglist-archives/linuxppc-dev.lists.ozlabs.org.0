Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9B69F58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 01:07:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nfLP4WnZzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 09:07:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nfJZ54TvzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 09:05:34 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6FN2QnQ114931
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 19:05:29 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ts0qcck2u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 19:05:29 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 16 Jul 2019 00:05:28 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 00:05:25 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6FN5Ods53936622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 23:05:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09124112064;
 Mon, 15 Jul 2019 23:05:24 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EA1B112061;
 Mon, 15 Jul 2019 23:05:16 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.238.93])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Jul 2019 23:05:15 +0000 (GMT)
References: <20190520090939-mutt-send-email-mst@kernel.org>
 <877ea26tk8.fsf@morokweng.localdomain>
 <20190603211528-mutt-send-email-mst@kernel.org>
 <877e96qxm7.fsf@morokweng.localdomain>
 <20190701092212-mutt-send-email-mst@kernel.org>
 <87d0id9nah.fsf@morokweng.localdomain>
 <20190715103411-mutt-send-email-mst@kernel.org>
 <874l3nnist.fsf@morokweng.localdomain>
 <20190715163453-mutt-send-email-mst@kernel.org>
 <8736j7neg8.fsf@morokweng.localdomain>
 <20190715181449-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
In-reply-to: <20190715181449-mutt-send-email-mst@kernel.org>
Date: Mon, 15 Jul 2019 20:05:08 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19071523-0064-0000-0000-000003FBF5F2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011435; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01232726; UDB=6.00649485; IPR=6.01014027; 
 MB=3.00027731; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-15 23:05:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071523-0065-0000-0000-00003E466205
Message-Id: <871ryqoq57.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150257
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

> On Mon, Jul 15, 2019 at 07:03:03PM -0300, Thiago Jung Bauermann wrote:
>> 
>> Michael S. Tsirkin <mst@redhat.com> writes:
>> 
>> > On Mon, Jul 15, 2019 at 05:29:06PM -0300, Thiago Jung Bauermann wrote:
>> >>
>> >> Michael S. Tsirkin <mst@redhat.com> writes:
>> >>
>> >> > On Sun, Jul 14, 2019 at 02:51:18AM -0300, Thiago Jung Bauermann wrote:
>> >> >>
>> >> >>
>> >> >> Michael S. Tsirkin <mst@redhat.com> writes:
>> >> >>
>> >> >> > So this is what I would call this option:
>> >> >> >
>> >> >> > VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS
>> >> >> >
>> >> >> > and the explanation should state that all device
>> >> >> > addresses are translated by the platform to identical
>> >> >> > addresses.
>> >> >> >
>> >> >> > In fact this option then becomes more, not less restrictive
>> >> >> > than VIRTIO_F_ACCESS_PLATFORM - it's a promise
>> >> >> > by guest to only create identity mappings,
>> >> >> > and only before driver_ok is set.
>> >> >> > This option then would always be negotiated together with
>> >> >> > VIRTIO_F_ACCESS_PLATFORM.
>> >> >> >
>> >> >> > Host then must verify that
>> >> >> > 1. full 1:1 mappings are created before driver_ok
>> >> >> >     or can we make sure this happens before features_ok?
>> >> >> >     that would be ideal as we could require that features_ok fails
>> >> >> > 2. mappings are not modified between driver_ok and reset
>> >> >> >     i guess attempts to change them will fail -
>> >> >> >     possibly by causing a guest crash
>> >> >> >     or some other kind of platform-specific error
>> >> >>
>> >> >> I think VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS is good, but requiring
>> >> >> it to be accompanied by ACCESS_PLATFORM can be a problem. One reason is
>> >> >> SLOF as I mentioned above, another is that we would be requiring all
>> >> >> guests running on the machine (secure guests or not, since we would use
>> >> >> the same configuration for all guests) to support it. But
>> >> >> ACCESS_PLATFORM is relatively recent so it's a bit early for that. For
>> >> >> instance, Ubuntu 16.04 LTS (which is still supported) doesn't know about
>> >> >> it and wouldn't be able to use the device.
>> >> >
>> >> > OK and your target is to enable use with kernel drivers within
>> >> > guests, right?
>> >>
>> >> Right.
>> >>
>> >> > My question is, we are defining a new flag here, I guess old guests
>> >> > then do not set it. How does it help old guests? Or maybe it's
>> >> > not designed to ...
>> >>
>> >> Indeed. The idea is that QEMU can offer the flag, old guests can reject
>> >> it (or even new guests can reject it, if they decide not to convert into
>> >> secure VMs) and the feature negotiation will succeed with the flag
>> >> unset.
>> >
>> > OK. And then what does QEMU do? Assume guest is not encrypted I guess?
>> 
>> There's nothing different that QEMU needs to do, with or without the
>> flag. the perspective of the host, a secure guest and a regular guest
>> work the same way with respect to virtio.
>
> OK. So now let's get back to implementation. What will
> Linux guest driver do? It can't activate DMA API blindly since that
> will assume translation also works, right?

It can on pseries, because we always have a 1:1 window mapping the whole
guest memory.

> Or do we somehow limit it to just a specific platform?

Yes, we want to accept the new flag only on secure pseries guests.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

