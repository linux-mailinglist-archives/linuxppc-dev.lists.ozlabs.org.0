Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 253AE758871
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:30:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bYsTsBY1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5DCp0cYsz3bx3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 08:29:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bYsTsBY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R53V60Lykz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 01:56:43 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-403b6b7c0f7so42262771cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689695800; x=1692287800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tjh+qVHNBsaCt+fpZytXbv4JtN2Kf+QfiKBiC+OQp3c=;
        b=bYsTsBY1ioUL9k8drjTPCTw/fEJ0EAlGX5g4owJLPMPxN2CHLKUwbHRdsGU8yNpkgq
         tSJhCUQojCe7iZMsDT/aY34J1oz2QHRzCjLM+KqEBEo9M8BD2KOp45IRPvgTMkckJ6dq
         H9fFQEgiHBZaevHiGZSqEfXqcoEtLjezHUCteBqtpUndGthYRfcrzEkhL4CGHaIFAcmx
         6wdKboUdDaPeOVdQT0aOEr8C1+gySsRWrc1UqrjcLLXuhZDet2FHUgbuPzKGfDMScL/V
         K78x7SFpD7MaWzPqAIp0HWYQyARw7uG7tneLlNjtBlR/Fv5UIeG6Vm/K9G6rR6HJEl7q
         8oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689695800; x=1692287800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjh+qVHNBsaCt+fpZytXbv4JtN2Kf+QfiKBiC+OQp3c=;
        b=WGg8hdRD9YD5GYyRlc4ohnHsqgWjr/klDw1iX/3avF25R8vEPWOVLyqK+K+eyVanhg
         ZKJBBp9oaAbsMFB7lLoCg6KR/37rWTdn4OTWmMWkGqru/Wwhrc5Ws0A1ptiKD/nNY7bh
         BSxF0xNTdTvkhkcL1RMVdugwJg9JH6sE5RUE5BbHNVYyOUQa4vkcAVGv5d9WiOxUhSgD
         C8f79SMj9jQrh/ipVj1GTAUWb2qzH7HoKsc9vDIF+6IXdLUo9li25re7+CUAY/5geD/u
         eNxwqK5+pm2h/qHwdjtPspDb6qFuUR3uRE5OvEyar4OzHFF11OZ/w/zD5GEhkqGHydOz
         7ZEA==
X-Gm-Message-State: ABy/qLZs/AInVKsR7HFCOeE/tj8KN6431w7oNGGkVo39NB+VRtddvInW
	uuY/GynAb1xdwLG3YX9fGl/C/g==
X-Google-Smtp-Source: APBJJlFA9677r6PhZxjwKlQ1fKWxhiNMVqP6N1YqyjTADbRS7wwnXs7xld1btAoYMOwt7mM3Vw+c9w==
X-Received: by 2002:ac8:7dd0:0:b0:403:a814:ef4d with SMTP id c16-20020ac87dd0000000b00403a814ef4dmr21293071qte.49.1689695800050;
        Tue, 18 Jul 2023 08:56:40 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id s21-20020ac87595000000b003e635f80e72sm727847qtq.48.2023.07.18.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 08:56:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qLn42-002YJT-5I;
	Tue, 18 Jul 2023 12:56:38 -0300
Date: Tue, 18 Jul 2023 12:56:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <ZLa2NmwexoxPkS9a@ziepe.ca>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
 <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
 <20230717130831.0f18381a.alex.williamson@redhat.com>
 <ZLW8wEzkhBxd0O0L@ziepe.ca>
 <20230717165203.4ee6b1e6.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717165203.4ee6b1e6.alex.williamson@redhat.com>
X-Mailman-Approved-At: Wed, 19 Jul 2023 08:29:15 +1000
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

On Mon, Jul 17, 2023 at 04:52:03PM -0600, Alex Williamson wrote:
> On Mon, 17 Jul 2023 19:12:16 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> > On Mon, Jul 17, 2023 at 01:08:31PM -0600, Alex Williamson wrote:
> > 
> > > What would that mechanism be?  We've been iterating on getting the
> > > serialization and buffering correct, but I don't know of another means
> > > that combines the notification with a value, so we'd likely end up with
> > > an eventfd only for notification and a separate ring buffer for
> > > notification values.  
> > 
> > All FDs do this. You just have to make a FD with custom
> > file_operations that does what this wants. The uAPI shouldn't be able
> > to tell if the FD is backing it with an eventfd or otherwise. Have the
> > kernel return the FD instead of accepting it. Follow the basic design
> > of eg mlx5vf_save_fops
> 
> Sure, userspace could poll on any fd and read a value from it, but at
> that point we're essentially duplicating a lot of what eventfd provides
> for a minor(?) semantic difference over how the counter value is
> interpreted.  Using an actual eventfd allows the ACPI notification to
> work as just another interrupt index within the existing vfio IRQ
> uAPI.

Yes, duplicated, sort of, whatever the "ack" is to allow pushing a new
value can be revised to run as part of the read.

But I don't really view it as a minor difference. eventfd is a
counter. It should not be abused otherwise, even if it can be made to
work.

It really isn't an IRQ if it is pushing an async message w/data.

Jason
