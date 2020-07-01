Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C22112AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 20:28:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xqV21N47zDqxc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 04:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=msnitzer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZwrGxUsJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=dbu174cJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xqS20ljhzDqwm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 04:26:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593627977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gM4o34lY2Q2Fu9DNpo9nmnqeENsycpsv4CwD0QpSKRo=;
 b=ZwrGxUsJXRw2TeInzKH2KaJeb9JWfx1KCCpvaat4ntHZPxEMPcJvHYoCuuE/LqHFxJiATm
 CMR5wsva05+WpEwBxa2VZABOZwF7xw5v+hOJiZDfIOao/Plpqymv/XDTfhwNJQpla9oVwX
 oJV7CI8PfLVPGrg3qAbF5in+Zc6AIVg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593627978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gM4o34lY2Q2Fu9DNpo9nmnqeENsycpsv4CwD0QpSKRo=;
 b=dbu174cJhKEx2dtUzkFRaS0PVVs75PHM5sdDyGwbWiHhIXTmVlc6PhjLIg5DgqKGgfjgfS
 ZfuLVCKw82obJVkHO1/PAXEd/Sr4lW+z2cF6vjNRvVbbMqWYYzzkL+h0brWAQW+oyqwh04
 huwJyNriiIVu+T5fsBL00HXBRE/hoNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-ve54S7gINvapvHMQrfW7sQ-1; Wed, 01 Jul 2020 14:26:14 -0400
X-MC-Unique: ve54S7gINvapvHMQrfW7sQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE0A80183C;
 Wed,  1 Jul 2020 18:26:11 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 244BF5C1D3;
 Wed,  1 Jul 2020 18:26:08 +0000 (UTC)
Date: Wed, 1 Jul 2020 13:24:48 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/20] dm: stop using ->queuedata
Message-ID: <20200701172448.GA27528@redhat.com>
References: <20200701085947.3354405-1-hch@lst.de>
 <20200701085947.3354405-11-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701085947.3354405-11-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
 linux-s390@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-nvdimm@lists.01.org, dm-devel@redhat.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 01 2020 at  4:59am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Instead of setting up the queuedata as well just use one private data
> field.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

