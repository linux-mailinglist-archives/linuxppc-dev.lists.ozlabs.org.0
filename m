Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3544BC6C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 08:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K10mL6yy5z3cTG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 18:38:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsxrcfYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+89c436a5482820edb7f2+6754+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=KsxrcfYa; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K10ld51sRz3bP1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 18:37:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=h57KiAEVSKkzXdNc8Dx5lCWM++DN28M84mRcDiV5fkY=; b=KsxrcfYaerfj7S4ITWFvQAQ0x6
 24aeSlzHZ3cmMdzzDJjwD5MH7BiCBtomrZK+sUouoLD9vIJHuUOIq8hNC2rT9TREsjqowo7ZigLPU
 llG/bACQNWJM62cm7Wc1o0o5yl4BeuJOK1InpRSg6F2nlLE+wMwB6Sr0Gv2APOv6ZKnh4XB2/bx0q
 pO/NM0jEjfo63HNdo4QypAR7fM098sBkqtoJnexaTDGT2EC9VuGERlxc6rMnA1xJW3+p1h+TLVuCS
 Lhtn1UlZlZPW5MAURTUYVTtlIOcC7djUDixNNJ6pg7uXqJlAMgXvaRfk2N49sHxK0dt49GFiuTp9+
 u3rD/Uaw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nLKIh-00GNfs-Pt; Sat, 19 Feb 2022 07:37:03 +0000
Date: Fri, 18 Feb 2022 23:37:03 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Melanie Plageman (Microsoft)" <melanieplageman@gmail.com>
Subject: Re: [PATCH RFC v1 0/5] Add SCSI per device tagsets
Message-ID: <YhCeHweaO5ugY5aC@infradead.org>
References: <20220218184157.176457-1-melanieplageman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218184157.176457-1-melanieplageman@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: tyreld@linux.ibm.com, linux-hyperv@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, mikelley@microsoft.com,
 R-QLogic-Storage-Upstream@marvell.com, paulus@samba.org, kys@microsoft.com,
 wei.liu@kernel.org, sthemmin@microsoft.com, linux-scsi@vger.kernel.org,
 sathya.prakash@broadcom.com, decui@microsoft.com, kashyap.desai@broadcom.com,
 njavali@marvell.com, MPT-FusionLinux.pdl@broadcom.com, haiyangz@microsoft.com,
 mpi3mr-linuxdrv.pdl@broadcom.com, suganath-prabu.subramani@broadcom.com,
 jejb@linux.ibm.com, john.garry@huawei.com, stefanha@redhat.com,
 storagedev@microchip.com, virtualization@lists.linux-foundation.org,
 megaraidlinux.pdl@broadcom.com, sreekanth.reddy@broadcom.com,
 martin.petersen@oracle.com, shivasharan.srikanteshwara@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 sumit.saxena@broadcom.com, andres@anarazel.de, pbonzini@redhat.com,
 don.brace@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 06:41:52PM +0000, Melanie Plageman (Microsoft) wrote:
> Currently a single blk_mq_tag_set is associated with a Scsi_Host. When SCSI
> controllers are limited, attaching multiple devices to the same controller is
> required. In cloud environments with relatively high latency persistent storage,
> requiring all devices on a controller to share a single blk_mq_tag_set
> negatively impacts performance.

So add more controllers instead of completely breaking the architecture.
