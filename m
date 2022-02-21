Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E155F4BE3DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 18:57:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2VQD33xNz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 04:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=john.garry@huawei.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1014 seconds by postgrey-1.36 at boromir;
 Tue, 22 Feb 2022 04:57:30 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2VPk35bNz30DX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 04:57:25 +1100 (AEDT)
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K2Twb3c5Sz67WcM;
 Tue, 22 Feb 2022 01:35:43 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Mon, 21 Feb 2022 18:40:25 +0100
Received: from [10.47.94.94] (10.47.94.94) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 21 Feb
 2022 17:40:23 +0000
Message-ID: <9e7925d6-067c-0b3a-a788-f036272496e6@huawei.com>
Date: Mon, 21 Feb 2022 17:40:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH RFC v1 0/5] Add SCSI per device tagsets
To: "Melanie Plageman (Microsoft)" <melanieplageman@gmail.com>,
 <mikelley@microsoft.com>, <jejb@linux.ibm.com>, <kys@microsoft.com>,
 <martin.petersen@oracle.com>, <mst@redhat.com>, <benh@kernel.crashing.org>,
 <decui@microsoft.com>, <don.brace@microchip.com>,
 <R-QLogic-Storage-Upstream@marvell.com>, <haiyangz@microsoft.com>,
 <jasowang@redhat.com>, <kashyap.desai@broadcom.com>, <mpe@ellerman.id.au>,
 <njavali@marvell.com>, <pbonzini@redhat.com>, <paulus@samba.org>,
 <sathya.prakash@broadcom.com>, <shivasharan.srikanteshwara@broadcom.com>,
 <sreekanth.reddy@broadcom.com>, <stefanha@redhat.com>,
 <sthemmin@microsoft.com>, <suganath-prabu.subramani@broadcom.com>,
 <sumit.saxena@broadcom.com>, <tyreld@linux.ibm.com>, <wei.liu@kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <megaraidlinux.pdl@broadcom.com>,
 <mpi3mr-linuxdrv.pdl@broadcom.com>, <storagedev@microchip.com>,
 <virtualization@lists.linux-foundation.org>, <linux-hyperv@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <MPT-FusionLinux.pdl@broadcom.com>
References: <20220218184157.176457-1-melanieplageman@gmail.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <20220218184157.176457-1-melanieplageman@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.94.94]
X-ClientProxiedBy: lhreml718-chm.china.huawei.com (10.201.108.69) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
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
Cc: andres@anarazel.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/02/2022 18:41, Melanie Plageman (Microsoft) wrote:
> For example: a device provisioned with high IOPS and BW limits on the same
> controller as a smaller and slower device can starve the slower device of tags.
> This is especially noticeable when the slower device's workload has low I/O
> depth tasks.

If you check hctx_may_queue() in the block code then it is noticeable 
that a fair allocation of HW queue depth is allocated per request queue 
to ensure we don't get starvation.

Thanks,
John
