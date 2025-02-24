Return-Path: <linuxppc-dev+bounces-6433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F585A42ED8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 22:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1ts71PdNz2yGY;
	Tue, 25 Feb 2025 08:19:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740431947;
	cv=none; b=oYIpW/3OfkWftWUTHEO6eLe62/2PnKc8mJJKC3TzE/kzjUhbrTMQaGnZwyCrso1pLyKo2SXv0Hj3gadYjwTB+G2AI2m7lMyzLQVkGw7Dzg6JWYyV7d7ElUAziO06d1bp3RzS81Am0X5Gh1pW/uA0S68OeEGQAEy6ldQGlqUpl3zI8ukkvtmFhqGbIfGJUwZfj0kIpvCiasVlbaNJ0DXnu+ULIrmcY3nVPHlGp/O7xtU2rn4FMnKTLj/Xegm7Kx93tcThBajw6L2qxHI74IGMT3lPgQCv7wJTkcg/ypqgiFrSPul/qkM4N/ADkRTAyy7/mRJ1fbhk3CaHCMj3WmDrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740431947; c=relaxed/relaxed;
	bh=b4ChK7d4tTnyUI2qkV4nzn6rGiBQ0dJ69F8Ua/liB9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Eaw/+ncmuzjhLFNLJDsWNuQWNc8UdoXrMJ7LT+0nCNNrBV00NHUImrcEHrgSC2FBpIsDlRTY0ymJqfas/HvC9gILWryuFNvUx4Xk7OJjmCSgqcS2KwGfsGwyXALtDWbHi8IkrvAQmtRhXeauOIfAN9Q3TFq0vRRotfJ4jW7eqrfC22rBLKD7btTOZTDNv+8LtpMWY5FbwmdesJfRSI2unOX0PtVa3nvp4xlKxgIBf2Op3OFiez6KkyQSpP8K2y0sxiZ0iuIJhXCmp9VPLo4VlH1+1M8TeT+d6k/JAOAUgM34qYQxLL8zjJ5f9m9KI+cDqEPZhU9Ov/fXVgxUfEim0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zdz01f+h; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zdz01f+h; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zdz01f+h;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zdz01f+h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1ts60DJJz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 08:19:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740431941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b4ChK7d4tTnyUI2qkV4nzn6rGiBQ0dJ69F8Ua/liB9M=;
	b=Zdz01f+hZyHKoiUN9SUBx/Gh0FdjHjNckiE5gryQdLpn5eJupb9URl99cHVRzhS3BnSw0B
	kySJyDP7rWqk4P/JUmGAIZ80elyHIXTHLtSmaaQZkPZumvtTWDCbwq8B2KZXTZ9LbtlWk4
	Z0jdLU167Ab9fAOKSlQ+E+2tAMlbKbY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740431941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b4ChK7d4tTnyUI2qkV4nzn6rGiBQ0dJ69F8Ua/liB9M=;
	b=Zdz01f+hZyHKoiUN9SUBx/Gh0FdjHjNckiE5gryQdLpn5eJupb9URl99cHVRzhS3BnSw0B
	kySJyDP7rWqk4P/JUmGAIZ80elyHIXTHLtSmaaQZkPZumvtTWDCbwq8B2KZXTZ9LbtlWk4
	Z0jdLU167Ab9fAOKSlQ+E+2tAMlbKbY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-bxIDml2MNuWnlOExSW5O-Q-1; Mon, 24 Feb 2025 16:18:57 -0500
X-MC-Unique: bxIDml2MNuWnlOExSW5O-Q-1
X-Mimecast-MFC-AGG-ID: bxIDml2MNuWnlOExSW5O-Q_1740431937
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abb9d1c8113so367214466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 13:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740431937; x=1741036737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4ChK7d4tTnyUI2qkV4nzn6rGiBQ0dJ69F8Ua/liB9M=;
        b=HIDnVqMffUgmn1ymx0oT06xMavhv/IEvtQJGd31HN+Q6+NulG++8XGrYUH/qGG3bD6
         exWMspHJ5sENFsYItPfBFk+BPgTHW9aSKBvAMU6E4EgTxpSYigq5ElUKJR9R7hqipqV3
         alDp8+mG3nkQ+ogTW2oHwSCWZunQY1dzDWEyrXa0P2Dk6tJ4SQF3XAYoQnd//LJwOS3W
         vTcNqyIpXBMFsV6R/Sj57VV9tXbMTCMUUBllh70O+i5H5tLtCHd8ca1BKPQKKOH3TlvD
         nNMwY3+vPqzQJ8Jo5Xnf+0SGUz2omkSf6/OPc2J9ATqRH8rzmXrcpf0DyQtWY39cp9ch
         CaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVglzy0m11s3t1P63LZkY9n2mgDye6Q7sIJAlK48JehyE8AfB+yKBfpeN8hwrf38a1ycmDD8TNkY0MmTaQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ2jP/MAhLOkoL7/R462bEjxkiefMJThIrw0rW9mGu9FUTodB1
	3HqOa3KS0fkp665cSXsa439rOaPu8ewunSCRIboHTUd3HmaaARvM6jB02CTQZh8isUwjcoBqv5K
	/Hq8JOUsXa1vD9b+3cQACsRyHJ9Mw4epgP0XkcRL8B3k99ou4WDpfTtp9dpDo6eo=
X-Gm-Gg: ASbGncsgOQgA5U62RY5njELpmCOKTKb+p3heevXp2ZLqtveFIDvT73dfI93wEywopvb
	Bct054FAT+mzyjoE69FVv78/+aqH4TRAr2//1SQtlkPX3ydWqgHjaNCe/bCcnIBmxFaYaph1FIp
	2pu0j3/g0StFvRctk3dWyTSrxsf36Q8LpXkkk0ltn/ncb38vbdB6zShoqNL8ScQLC9ymJCoA03K
	js+98uICO3ySm+Zco9bvQ25HlfQP/N3rt8c82g8She5Rpon4hYhLZrlUVD6Wr7kmovPBQcNjDcu
	uO1P5ylm8g==
X-Received: by 2002:a17:906:3151:b0:aba:5e50:6984 with SMTP id a640c23a62f3a-abc099ead3amr1385572566b.2.1740431936616;
        Mon, 24 Feb 2025 13:18:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYEBC44CLKnEsK0LbK9e6zpwdED/WRkdl8e2EWDOlyh5Ynisvb1G99K7KkazLO1N5pYn2zMA==
X-Received: by 2002:a17:906:3151:b0:aba:5e50:6984 with SMTP id a640c23a62f3a-abc099ead3amr1385570066b.2.1740431936166;
        Mon, 24 Feb 2025 13:18:56 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:441:1929:22c5:4595:d9bc:489e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20134fdsm23497166b.94.2025.02.24.13.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:18:55 -0800 (PST)
Date: Mon, 24 Feb 2025 16:18:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH v2 00/13] cpumask: cleanup cpumask_next_wrap()
 implementation and usage
Message-ID: <20250224161832-mutt-send-email-mst@kernel.org>
References: <20250128164646.4009-1-yury.norov@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <20250128164646.4009-1-yury.norov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RCbixF01Y5S6Oy_5SkkCaFI8hB1rc1hmGF7phW7KkOo_1740431937
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 11:46:29AM -0500, Yury Norov wrote:
> cpumask_next_wrap() is overly complicated, comparing to it's generic
> version find_next_bit_wrap(), not mentioning it duplicates the above.
> It roots to the times when the function was used in the implementation
> of for_each_cpu_wrap() iterator. The function has 2 additional parameters
> that were used to catch loop termination condition for the iterator.
> (Although, only one is needed.)
> 
> Since 4fe49b3b97c262 ("lib/bitmap: introduce for_each_set_bit_wrap()
> macro"), for_each_cpu_wrap() is wired to corresponding generic
> wrapping bitmap iterator, and additional complexity of
> cpumask_next_wrap() is not needed anymore.
> 
> All existing users call cpumask_next_wrap() in a manner that makes
> it possible to turn it to a straight and simple alias to
> find_next_bit_wrap().
> 
> This series replaces historical 4-parameter cpumask_next_wrap() with a
> thin 2-parameter wrapper around find_next_bit_wrap().
> 
> Where it's possible to use for_each_cpu_wrap() iterator, the code is
> switched to use it because it's always preferable to use iterators over
> open loops.
> 
> This series touches various scattered subsystems and To-list for the
> whole series is quite a long. To minimize noise, I send cover-letter and
> key patches #5 and 6 to every person involved. All other patches are sent
> individually to those pointed by scripts/get_maintainers.pl.
> 
> I'd like to move the series with my bitmap-for-next branch as a whole.


virtio-net changes are straight-forward, so

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> v1: https://lore.kernel.org/netdev/20241228184949.31582-1-yury.norov@gmail.com/T/
> v2:
>  - rebase on top of today's origin/master;
>  - drop #v1-10: not needed since v6.14 @ Sagi Grinberg;
>  - #2, #3: fix picking next unused CPU @ Nick Child;
>  - fix typos, cleanup comments @ Bjorn Helgaas, Alexander Gordeev;
>  - CC Christoph Hellwig for the whole series.
> 
> Yury Norov (13):
>   objpool: rework objpool_pop()
>   virtio_net: simplify virtnet_set_affinity()
>   ibmvnic: simplify ibmvnic_set_queue_affinity()
>   powerpc/xmon: simplify xmon_batch_next_cpu()
>   cpumask: deprecate cpumask_next_wrap()
>   cpumask: re-introduce cpumask_next{,_and}_wrap()
>   cpumask: use cpumask_next_wrap() where appropriate
>   padata: switch padata_find_next() to using cpumask_next_wrap()
>   s390: switch stop_machine_yield() to using cpumask_next_wrap()
>   scsi: lpfc: switch lpfc_irq_rebalance() to using cpumask_next_wrap()
>   scsi: lpfc: rework lpfc_next_{online,present}_cpu()
>   PCI: hv: Switch hv_compose_multi_msi_req_get_cpu() to using
>     cpumask_next_wrap()
>   cpumask: drop cpumask_next_wrap_old()
> 
>  arch/powerpc/xmon/xmon.c            |  6 +--
>  arch/s390/kernel/processor.c        |  2 +-
>  drivers/net/ethernet/ibm/ibmvnic.c  | 18 +++++---
>  drivers/net/virtio_net.c            | 12 ++---
>  drivers/pci/controller/pci-hyperv.c |  3 +-
>  drivers/scsi/lpfc/lpfc.h            | 23 +++-------
>  drivers/scsi/lpfc/lpfc_init.c       |  2 +-
>  include/linux/cpumask.h             | 69 ++++++++++++++++++++---------
>  include/linux/objpool.h             |  7 ++-
>  kernel/padata.c                     |  2 +-
>  lib/cpumask.c                       | 37 +---------------
>  11 files changed, 81 insertions(+), 100 deletions(-)
> 
> -- 
> 2.43.0


