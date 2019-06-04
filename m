Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93A33CB3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 03:15:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hv9l5c8pzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:15:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hv8T6RJGzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 11:14:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x541CDvV124251
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 Jun 2019 21:14:14 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2swdyk9mw8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 21:14:14 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 4 Jun 2019 02:14:13 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 02:14:09 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x541E8Gw18284804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 01:14:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA40278064;
 Tue,  4 Jun 2019 01:14:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27B4E7805C;
 Tue,  4 Jun 2019 01:14:04 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.162.142])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  4 Jun 2019 01:14:03 +0000 (GMT)
References: <87zhrj8kcp.fsf@morokweng.localdomain>
 <87womn8inf.fsf@morokweng.localdomain>
 <20190129134750-mutt-send-email-mst@kernel.org>
 <877eefxvyb.fsf@morokweng.localdomain>
 <20190204144048-mutt-send-email-mst@kernel.org>
 <87ef71seve.fsf@morokweng.localdomain>
 <20190320171027-mutt-send-email-mst@kernel.org>
 <87tvfvbwpb.fsf@morokweng.localdomain>
 <20190323165456-mutt-send-email-mst@kernel.org>
 <87a7go71hz.fsf@morokweng.localdomain>
 <20190520090939-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
In-reply-to: <20190520090939-mutt-send-email-mst@kernel.org>
Date: Mon, 03 Jun 2019 22:13:59 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060401-0004-0000-0000-00001517D37A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011210; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01212884; UDB=6.00637431; IPR=6.00993944; 
 MB=3.00027172; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 01:14:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060401-0005-0000-0000-00008BEB7B8D
Message-Id: <877ea26tk8.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040004
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

> On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
>> I rephrased it in terms of address translation. What do you think of
>> this version? The flag name is slightly different too:
>>
>>
>> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
>>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
>>     with the exception that address translation is guaranteed to be
>>     unnecessary when accessing memory addresses supplied to the device
>>     by the driver. Which is to say, the device will always use physical
>>     addresses matching addresses used by the driver (typically meaning
>>     physical addresses used by the CPU) and not translated further. This
>>     flag should be set by the guest if offered, but to allow for
>>     backward-compatibility device implementations allow for it to be
>>     left unset by the guest. It is an error to set both this flag and
>>     VIRTIO_F_ACCESS_PLATFORM.
>
>
> OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
> drivers. This is why devices fail when it's not negotiated.

Just to clarify, what do you mean by unprivileged drivers? Is it drivers
implemented in guest userspace such as with VFIO? Or unprivileged in
some other sense such as needing to use bounce buffers for some reason?

> This confuses me.
> If driver is unpriveledged then what happens with this flag?
> It can supply any address it wants. Will that corrupt kernel
> memory?

Not needing address translation doesn't necessarily mean that there's no
IOMMU. On powerpc we don't use VIRTIO_F_ACCESS_PLATFORM but there's
always an IOMMU present. And we also support VFIO drivers. The VFIO API
for pseries (sPAPR section in Documentation/vfio.txt) has extra ioctls
to program the IOMMU.

For our use case, we don't need address translation because we set up an
identity mapping in the IOMMU so that the device can use guest physical
addresses.

If the guest kernel is concerned that an unprivileged driver could
jeopardize its integrity it should not negotiate this feature flag.
Perhaps there should be a note about this in the flag definition? This
concern is platform-dependant though. I don't believe it's an issue in
pseries.

--
Thiago Jung Bauermann
IBM Linux Technology Center

