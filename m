Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A272379E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 15:18:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456zxD5jBMzDqK6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 23:18:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456zvN4DN3zDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 23:17:04 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id a132so8701643qkb.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 06:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bZcyqtPfiR8OnSe7X+YvU6P3WmrTts8Lp+0qyg4aj2M=;
 b=bm2RForvRCp3lByqzd0b7uMmFtRh8dnQ0aS0BvqUFyizNYd4bjC0BzUwN6bwX9XcaY
 NFcasdDN+kaAJIo08QR5vs22v0p2s2u4dGe8WTwuHSia2WObiiq86sxBQ8Sr3YK60a1Y
 GAcpIpsQaK7eNirh5Dg/CMmgL1zP5A/0znqkx+Offiq5mXj3Sgf3PXArqEEi+Zp6uEE0
 v2GJA+HWWPfw6lwYze2xFjeutrA9X4lqZ+n+zPQxPRoShgCfFEQEazuPmWiTWP/M+OrS
 0F9RE1ru/Gn/B2DnfMTLSOzmobmqR6gejy78LZGzlPTJz4kusNTyoierdDq1Wdxa95Xw
 FICw==
X-Gm-Message-State: APjAAAVO3os2uq1Zf7B0yartFDlXdKsEWV11wuEf2Lt2qEcy0Bw+8RLq
 vqCTl0STrQifIBNWicbcT4tkYg==
X-Google-Smtp-Source: APXvYqw0FqLkxwDq3if4j/PtdUGJI5ox1BH3UIwaju3gNcXX5ayK/jpLunGqH+2wq+Rcle7lAXdfbA==
X-Received: by 2002:a37:4c02:: with SMTP id z2mr46791719qka.1.1558358222050;
 Mon, 20 May 2019 06:17:02 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
 [173.76.105.71])
 by smtp.gmail.com with ESMTPSA id d16sm11577917qtd.73.2019.05.20.06.16.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 20 May 2019 06:17:00 -0700 (PDT)
Date: Mon, 20 May 2019 09:16:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190520090939-mutt-send-email-mst@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7go71hz.fsf@morokweng.localdomain>
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

On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
> I rephrased it in terms of address translation. What do you think of
> this version? The flag name is slightly different too:
> 
> 
> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
>     with the exception that address translation is guaranteed to be
>     unnecessary when accessing memory addresses supplied to the device
>     by the driver. Which is to say, the device will always use physical
>     addresses matching addresses used by the driver (typically meaning
>     physical addresses used by the CPU) and not translated further. This
>     flag should be set by the guest if offered, but to allow for
>     backward-compatibility device implementations allow for it to be
>     left unset by the guest. It is an error to set both this flag and
>     VIRTIO_F_ACCESS_PLATFORM.


OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
drivers. This is why devices fail when it's not negotiated.

This confuses me.
If driver is unpriveledged then what happens with this flag?
It can supply any address it wants. Will that corrupt kernel
memory?

-- 
MST
