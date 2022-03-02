Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CF4C9F1D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 09:26:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7nJz59k5z3bft
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 19:26:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NrKxjS2m;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NklwyYCO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=ming.lei@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NrKxjS2m; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NklwyYCO; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7nJG30MCz3bT0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 19:26:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646209560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YtrInDoeeooDXLH4/ASDNuBM89b2Da/ya3ncv+m8FWA=;
 b=NrKxjS2mZ+3LnBTNJCqK+BpA/wvESboaJuprHaZfPRJe6Vhr9BJ5QjipGwKmKGkpMhGDZN
 tcA4cEpdd6JCOxI1V+8K/WJWZb4DGmZ29Ry5t5KweCDXskl+gZc5TgulC8NcFclj/Lcufz
 E3EHKq9FlGA4zQz7FLTkcP/hCdREJDk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646209561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YtrInDoeeooDXLH4/ASDNuBM89b2Da/ya3ncv+m8FWA=;
 b=NklwyYCOSE4r40w79vertJHQvI8TWTm1tbdz7w23uGg94veV9fVHWDX5AWVvKm5oKMWN40
 L3EBgPsdOwFnQXocyP0TXt4CM0pMh3gNA+D+rK8whR3TocjVbnqF66l5qa03Ltbn1rERQq
 ipH2CggVecl+gEnSKmfGvOIGj4kAbjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-sAHRB3rVNm6CEswhqULziw-1; Wed, 02 Mar 2022 03:25:57 -0500
X-MC-Unique: sAHRB3rVNm6CEswhqULziw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F944824FA7;
 Wed,  2 Mar 2022 08:25:55 +0000 (UTC)
Received: from T590 (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 629027FCE4;
 Wed,  2 Mar 2022 08:25:49 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:25:45 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [next-20220225][Oops][ppc] lvm snapshot merge results kernel
 panics (throtl_pending_timer_fn)
Message-ID: <Yh8qCS5JM8ZbtqY4@T590>
References: <d583adf0-2d98-60b6-620c-722912c05852@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d583adf0-2d98-60b6-620c-722912c05852@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: axboe@kernel.dk, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 linux-next <linux-next@vger.kernel.org>, yukuai3@huawei.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 02, 2022 at 01:31:39PM +0530, Abdul Haleem wrote:
> Greeting's
> 
> Linux next kernel 5.17.0-rc5-next-20220225 crashed on my power 10 LPAR when
> merge lvm snapshot on nvme disk

Please try next-20220301, in which the "bad" patch of 'block: cancel all
throttled bios in del_gendisk()' is dropped.


Thanks,
Ming

