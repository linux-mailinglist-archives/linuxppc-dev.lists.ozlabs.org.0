Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A4F756FF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:43:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Jk8Ffu+z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4cYT5gn2z2ytk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 08:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Jk8Ffu+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4bt30PjSz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 08:12:24 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6686708c986so5125330b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 15:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689631939; x=1692223939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfZGdLayIsQ4EXLbarw1/OO0pNLBzQdwR1vEqsrzGII=;
        b=Jk8Ffu+zgnI1CsgL7PShvnMc/G0hm1hbh3TPz5Fbc34BI/VC6K+YvpO0Dtz1Q06LcE
         vf29m9vckcSQeAqUEVUy2hQg3wChzTMiZjPdUNSWsPB40TqlA/Z3Z90RDeI/5eGEIh5a
         oHIWxzri1XJMuhuB2UIvkNGwKQM8BtpRM8RbCOHyQCc7eetsY5S+VbcO2iAUIljyLIvn
         7DgUtRFxxg3tnphZnCaerMskJ/OIgXT3e8pOBne6YWSI+yYb8YG43ww6ejPC+GReMaLK
         AQZU6DLVDF3nw8hq4CMA6FGa2JzmC2rObjfL+xz46TVHFpF838cUJw0/Qyn0hTY2P629
         8fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689631939; x=1692223939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfZGdLayIsQ4EXLbarw1/OO0pNLBzQdwR1vEqsrzGII=;
        b=JoxN57yRvp2uSWpne4TBgeWVwqeiRnTPreniMuL1FDjOZz7Gpo3MZKdFkGCXUKOGEu
         3WWbxLoL6l5pERcGE1nHH2pCXbcpmdrHA/gFNyLYwGKchTq93yY/hrhhhRyKyzGZICwc
         /S4Y5YFQLEFsWyBmRUL1VeUxoNMb1x/3MjsqWSh6wvnMYcWL0QWM9lfrDhDz9SD6SjP5
         kEHHWNCXCo04YSOYlN357y00D3g7GhYxi7JLTKi9yxMg57Y8DGOkr+GedinP85lIm1Xv
         18KJJKHgDNJjCb5H6vImzOhRVKFlSMWXcCXcUFuweVx7BHz7dP7LghhJ4QUD13oOPY8X
         CQ4A==
X-Gm-Message-State: ABy/qLamSJudYtywqcQaBClsbkmYxIsq9VQSoJmS3gUCSQzhYJNluaJv
	Py+SXf9SMV7rwYEmtql9z72oxw==
X-Google-Smtp-Source: APBJJlGZQPlE97VCyl6VDpxaBgXkuk8Xeb/cb5kTAa5gNdx+KBrLI5Ve+dnBz8NdMBvhTebPf2Gh3g==
X-Received: by 2002:a05:6a00:2307:b0:668:81c5:2f8a with SMTP id h7-20020a056a00230700b0066881c52f8amr19367164pfh.17.1689631939323;
        Mon, 17 Jul 2023 15:12:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id q185-20020a632ac2000000b0055fedbf1938sm278952pgq.31.2023.07.17.15.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 15:12:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qLWS0-002PFZ-GX;
	Mon, 17 Jul 2023 19:12:16 -0300
Date: Mon, 17 Jul 2023 19:12:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <ZLW8wEzkhBxd0O0L@ziepe.ca>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
 <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
 <20230717130831.0f18381a.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717130831.0f18381a.alex.williamson@redhat.com>
X-Mailman-Approved-At: Tue, 18 Jul 2023 08:42:26 +1000
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>, Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, netdev@vger.kernel.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marcin Wojtas <mw@semihalf.com>, Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>, x86@kernel.org, Halil Pasic <pasic@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Moritz Fischer <mdf@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>, Xu Yilun
  <yilun.xu@intel.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Dominik Behr <dbehr@chromium.org>, intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shakeel Butt <shakeelb@google.com>, kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Christian Brauner <brauner@kernel.org>, Grzegorz Jaszczyk <jaz@semihalf.com>, Od
 ed Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org, Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 17, 2023 at 01:08:31PM -0600, Alex Williamson wrote:

> What would that mechanism be?  We've been iterating on getting the
> serialization and buffering correct, but I don't know of another means
> that combines the notification with a value, so we'd likely end up with
> an eventfd only for notification and a separate ring buffer for
> notification values.

All FDs do this. You just have to make a FD with custom
file_operations that does what this wants. The uAPI shouldn't be able
to tell if the FD is backing it with an eventfd or otherwise. Have the
kernel return the FD instead of accepting it. Follow the basic design
of eg mlx5vf_save_fops

Jason
