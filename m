Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583474E593
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 05:56:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e4PmIOL1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Exd++mTM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Rr26664z3c3p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e4PmIOL1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Exd++mTM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Rq71TY2z30fB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 13:55:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689047728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I51Q3nKKNCTWEmMYUHL5yUr4E1b6ZzzA1zlm0zArZHo=;
	b=e4PmIOL1gy8UHIdAbgiTUTJKgPJ52ZqbbsIsmcDPhHCCaKTBPBArSDpIvjnw9GpI7NUcDo
	FJg5Cd1v3uOT9OiLWfl/SWDVZK8XxpipmwPIx/CgzSw9/trApP2kZEI8wkRZAxi4udnuwG
	7XyF573aGl7U0ZbUaO791+EM3mp4gD4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689047729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I51Q3nKKNCTWEmMYUHL5yUr4E1b6ZzzA1zlm0zArZHo=;
	b=Exd++mTMsdlCyuXl2lwGWjlGCi1k5zjMH70ZE7rsW7zKbM448UEewZNBeTOQOqTUGmAjyy
	pGl1DxbD8b074pCf+An9ru/SgEM8HThOwr4pKsytf9Z7dYKZKTR6tFP3ClW7QhUI4d5lgP
	Ifv0oO4sZXukmaGtF+tKvv4Jx8DZ2NM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-PmlFIsK8MGiHRWtWcmscVQ-1; Mon, 10 Jul 2023 23:55:27 -0400
X-MC-Unique: PmlFIsK8MGiHRWtWcmscVQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6355b301c9dso42211536d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 20:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689047727; x=1691639727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I51Q3nKKNCTWEmMYUHL5yUr4E1b6ZzzA1zlm0zArZHo=;
        b=I4wD8Q37RrBsWDi0aHTLM0NAZVNcOrLuNo7RiykoMyujO5HiADeQv9sm5aej1N5wfM
         bRDjDtULrAHNCCbJkpPxsBCprnQMhrN2TB+hbAwuzcfmbzO746k68r6JPv/gE8p0r4uO
         p4k081dNm2Jm+nc2ndOqNTtAuUQxIrG0+Q09qXGzEsyx0doO91HQagROuduQ2RY/nwFt
         ua5/dXwyr7i50AvpjEkFo07hODkPaaUXa5CXpWoDie2H7vQjrki81thiHr0Up3KpW+v1
         J7rMJumqaNI2ggLV3fFkWX08FrilVYTW0xDYL0NyPPw+dRj7m1aBV7pdqVUxJeaXK1nL
         diMQ==
X-Gm-Message-State: ABy/qLYOM3suk61a7Vc6I6qxaPbkELP6oqGqgiLYTRC8jwK25QgRotXW
	uynvx4lGmnnghLP9DQ525WNfOn/Oko2NKg0JXb9e0fiq0hfqW8YAQMoieAJOki7TsukduVX8oD0
	Rd2PNCHHUcMIaFfaOn/99nyfkVnhqUpu/ynlt7Jqnig==
X-Received: by 2002:a0c:8d45:0:b0:62f:ec76:f5b7 with SMTP id s5-20020a0c8d45000000b0062fec76f5b7mr11891466qvb.55.1689047726838;
        Mon, 10 Jul 2023 20:55:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTZhew2EUuIm724AKpM7YWVbIe48FZcuO2pasYKl7L1r04MF0dNfYfUrZnlan7BYQ6w00L0ejYouJH3uMuKwg=
X-Received: by 2002:a0c:8d45:0:b0:62f:ec76:f5b7 with SMTP id
 s5-20020a0c8d45000000b0062fec76f5b7mr11891446qvb.55.1689047726501; Mon, 10
 Jul 2023 20:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230708020259.1343736-1-ming.lei@redhat.com> <20230708020259.1343736-3-ming.lei@redhat.com>
 <20230710064109.GB24519@lst.de> <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
In-Reply-To: <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 11 Jul 2023 11:55:15 +0800
Message-ID: <CAF+s44RuqswbosY9kMDx35crviQnxOeuvgNsuE75Bb0Y2Jg2uw@mail.gmail.com>
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

In fact, num_possible_cpus is not broken.

Quote from admin-guide/kernel-parameters.txt
       maxcpus=3D        [SMP] Maximum number of processors that an SMP ker=
nel
                       will bring up during bootup.  maxcpus=3Dn : n >=3D 0=
 limits
                       the kernel to bring up 'n' processors. Surely after
                       bootup you can bring up the other plugged cpu
by executing
                       "echo 1 > /sys/devices/system/cpu/cpuX/online".
So maxcpus
                       only takes effect during system bootup.
                       While n=3D0 is a special case, it is equivalent to "=
nosmp",
                       which also disables the IO APIC.

Here, as it explained, maxcpus only affects the bootup, later, extra
cpus can be online.

> That is documented in Documentation/admin-guide/kdump/kdump.rst.
>
> On arm and ppc64, 'maxcpus=3D1' is passed for kdump kernel, and "maxcpu=
=3D1"

On aarch64 and x86, nr_cpus=3D1 is used, while on ppc64, due to the
implementation, nr_cpus=3D1 can not be supported.


Thanks,

Pingfan

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

