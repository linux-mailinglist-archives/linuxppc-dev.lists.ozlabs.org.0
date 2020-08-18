Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89924807F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:25:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW3qy5SMzzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 18:25:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=redhat.com
 (client-ip=205.139.110.120; helo=us-smtp-1.mimecast.com;
 envelope-from=kraxel@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=V1psM2ht; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=V1psM2ht; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW3kD1HwlzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 18:20:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597738801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRKeFFqhITYnbSXGtGade9POSVRhcb2cZ46sEJUQ0Ng=;
 b=V1psM2htvRjLlzR223IF5BBL/6oeR7hn/Jq/kCJuBZxrWJ5fwNFGEU7SLSax95O2V6kW92
 YM6mqH/SWnBqSf+ZfPHmtbI6DWt7fKvrP5HIeYg/zH0PfY8RkqcwkvUj1zQq95WH0/fd0j
 TutYY5YMlkDYBNQiFuxHAZXot9HwS04=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597738801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRKeFFqhITYnbSXGtGade9POSVRhcb2cZ46sEJUQ0Ng=;
 b=V1psM2htvRjLlzR223IF5BBL/6oeR7hn/Jq/kCJuBZxrWJ5fwNFGEU7SLSax95O2V6kW92
 YM6mqH/SWnBqSf+ZfPHmtbI6DWt7fKvrP5HIeYg/zH0PfY8RkqcwkvUj1zQq95WH0/fd0j
 TutYY5YMlkDYBNQiFuxHAZXot9HwS04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-GHy6lS7XOGuVZPVnFtKbbQ-1; Tue, 18 Aug 2020 04:18:34 -0400
X-MC-Unique: GHy6lS7XOGuVZPVnFtKbbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 993EA425CC;
 Tue, 18 Aug 2020 08:18:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A383E2CFC6;
 Tue, 18 Aug 2020 08:18:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 875B111AB5; Tue, 18 Aug 2020 10:18:30 +0200 (CEST)
Date: Tue, 18 Aug 2020 10:18:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [Virtual ppce500] virtio_gpu virtio0: swiotlb buffer is full
Message-ID: <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
 <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
 <9805f81d-651d-d1a3-fd05-fb224a8c2031@xenosoft.de>
 <3162da18-462c-72b4-f8f0-eef896c6b162@xenosoft.de>
 <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 daniel.vetter@ffwll.ch, Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 11:19:58AM +0200, Christian Zigotzky wrote:
> Hello
> 
> I compiled the RC1 of kernel 5.9 today. Unfortunately the issue with the
> VirtIO-GPU (see below) still exists. Therefore we still need the patch (see
> below) for using the VirtIO-GPU in a virtual e5500 PPC64 QEMU machine.

It is fixed in drm-misc-next (commit 51c3b0cc32d2e17581fce5b487ee95bbe9e8270a).

Will cherry-pick into drm-misc-fixes once the branch is 5.9-based, which
in turn should bring it to 5.9-rc2 or -rc3.

take care,
  Gerd

