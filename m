Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B116374E5B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:06:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEXaXxfT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEXaXxfT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0S3w4Dq4z3bv6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:06:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEXaXxfT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEXaXxfT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0S2x2Wcmz30fB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:05:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689048341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sanp52G7qe4emaxcQItrkn4g0y24nEg66UbSkbqz794=;
	b=UEXaXxfTwyfaX0uEvb6m5/F8aqPNZBhOYLiee9J37A3Gf8NIVW32mJSBjzoqeKWFWiRXMi
	Z4dt7Rkqo0X+vC8m+3IM17kovOOElhpnDRLaXw3teJlQiv9kg1lgCaCaOMdgXV8r+65f+0
	FT7rNHfRcpZwqJ7ktMmZws1ggPJfvUM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689048341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sanp52G7qe4emaxcQItrkn4g0y24nEg66UbSkbqz794=;
	b=UEXaXxfTwyfaX0uEvb6m5/F8aqPNZBhOYLiee9J37A3Gf8NIVW32mJSBjzoqeKWFWiRXMi
	Z4dt7Rkqo0X+vC8m+3IM17kovOOElhpnDRLaXw3teJlQiv9kg1lgCaCaOMdgXV8r+65f+0
	FT7rNHfRcpZwqJ7ktMmZws1ggPJfvUM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-YbXn98TsNsGQayQE9TaS3g-1; Tue, 11 Jul 2023 00:05:36 -0400
X-MC-Unique: YbXn98TsNsGQayQE9TaS3g-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635df2bb4b4so55576556d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 21:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689048336; x=1691640336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sanp52G7qe4emaxcQItrkn4g0y24nEg66UbSkbqz794=;
        b=fxPRnhWCJ0SedcEF1CvpdhszXvw+z3in4WFkikK+aW8q7jAz0DU4iz8akaXEgaCq55
         nsvMcMjpWRiDyOBLY6RKib06QYM+Cx+UuGo93NIx+PqW/S5wyGw6X5pgBx5RKVq/eZte
         sDcq8parnl+sQVzdFP0I8BurtByDrMVfYwC279FkriO9xdWx3UNZ07n2lOJ2oqhsazHl
         5UEdAP5f/unKPQSP1CkdtehIFRRjKFjNiOQ61RPI0csTV8MYZf9HxJSIKraDUq3IXz6I
         2rNuIfKdZfopos4OwMNAmSxr0FWnWgYEp+2upsESASsfL4LarFWKoSWzrapkV8O8oVUw
         IU+Q==
X-Gm-Message-State: ABy/qLbnwLkHVUmSGn/6C5lH39EF96e5lfUtGcwXYz23rHD1JLp84vAU
	WmMdpScLtNcKbt+P/V+PlP+S6B6vNAnL9ghnbeItg26Bo3yXmI4qKKdGC4n2j27R59wBpOmJc0y
	h5o9MjSckk8gZl++dUSuAxI+nKtNEw2jifpQQF4WLIQ==
X-Received: by 2002:a0c:e44d:0:b0:62d:ef66:ff1c with SMTP id d13-20020a0ce44d000000b0062def66ff1cmr12076650qvm.24.1689048335874;
        Mon, 10 Jul 2023 21:05:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEGTtnbv4lplqsuwMA0lcF/2QRhbSnqCLDEDGVhD6GZ6v3vRL7xgj3ixm6UdOxJvERNjVYrT8Aw+QUQlev+2Ls=
X-Received: by 2002:a0c:e44d:0:b0:62d:ef66:ff1c with SMTP id
 d13-20020a0ce44d000000b0062def66ff1cmr12076645qvm.24.1689048335643; Mon, 10
 Jul 2023 21:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230708020259.1343736-1-ming.lei@redhat.com> <20230708020259.1343736-3-ming.lei@redhat.com>
 <20230710064109.GB24519@lst.de> <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
In-Reply-To: <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 11 Jul 2023 12:05:24 +0800
Message-ID: <CAF+s44T5Hn5ikNq+YMp2Nucb6rBT=e4VHW8WN8YDhZHe9JmqGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvme-pci: use blk_mq_max_nr_hw_queues() to calculate
 io queues
To: Ming Lei <ming.lei@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Keith Busch <kbusch@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Young <dyoung@redhat.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ming,

Having no [PATCH 1/2] blk-mq: add blk_mq_max_nr_hw_queues() in inbox.
So I reply here.

At first glance, I think that  the cpu hot plug callback hook should
be the remedy for the newly introduced blk_mq_max_nr_hw_queues(),
although it is more complicated.

Consider the scene where nr_cpus=3D4, which can speed up the dumping
process, the blk_mq_max_nr_hw_queues() can not utilize the other three
cpus.


Thanks,

Pingfan

On Mon, Jul 10, 2023 at 5:16=E2=80=AFPM Ming Lei <ming.lei@redhat.com> wrot=
e:
>
> On Mon, Jul 10, 2023 at 08:41:09AM +0200, Christoph Hellwig wrote:
> > On Sat, Jul 08, 2023 at 10:02:59AM +0800, Ming Lei wrote:
> > > Take blk-mq's knowledge into account for calculating io queues.
> > >
> > > Fix wrong queue mapping in case of kdump kernel.
> > >
> > > On arm and ppc64, 'maxcpus=3D1' is passed to kdump command line, see
> > > `Documentation/admin-guide/kdump/kdump.rst`, so num_possible_cpus()
> > > still returns all CPUs.
> >
> > That's simply broken.  Please fix the arch code to make sure
> > it does not return a bogus num_possible_cpus value for these
>
> That is documented in Documentation/admin-guide/kdump/kdump.rst.
>
> On arm and ppc64, 'maxcpus=3D1' is passed for kdump kernel, and "maxcpu=
=3D1"
> simply keep one of CPU cores as online, and others as offline.
>
> So Cc our arch(arm & ppc64) & kdump guys wrt. passing 'maxcpus=3D1' for
> kdump kernel.
>
> > setups, otherwise you'll have to paper over it in all kind of
> > drivers.
>
> The issue is only triggered for drivers which use managed irq &
> multiple hw queues.
>
>
> Thanks,
> Ming
>
>
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
>

