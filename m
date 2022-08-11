Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B558858FD10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 15:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Rsj1kKHz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 23:07:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKbXM/vq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKbXM/vq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKbXM/vq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKbXM/vq;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3N3g0wNYz2xXS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 20:15:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660212921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFT37D04zq4LQqw9OKWRNkU7ORSqHvfNUHywXUhX6hQ=;
	b=YKbXM/vqxo2SWffcEXoNy36T4qt1pgsUAnF7q/mrW1qmHHPJ0JkY3Up2H1FD1P5zaZv3Pa
	5Z/W8hvsUvHNjHJFPhzGxP9qNo3Oq2sfnpjhUbdf8qwlMz+hj1sQxKv0VpgXJJweWik0aK
	j8YCYPCI868FPxpmRiUss4hS7GAC5fo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660212921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFT37D04zq4LQqw9OKWRNkU7ORSqHvfNUHywXUhX6hQ=;
	b=YKbXM/vqxo2SWffcEXoNy36T4qt1pgsUAnF7q/mrW1qmHHPJ0JkY3Up2H1FD1P5zaZv3Pa
	5Z/W8hvsUvHNjHJFPhzGxP9qNo3Oq2sfnpjhUbdf8qwlMz+hj1sQxKv0VpgXJJweWik0aK
	j8YCYPCI868FPxpmRiUss4hS7GAC5fo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-3r9tXyoNMV6VRsyGmq1IpA-1; Thu, 11 Aug 2022 06:15:19 -0400
X-MC-Unique: 3r9tXyoNMV6VRsyGmq1IpA-1
Received: by mail-lj1-f199.google.com with SMTP id u7-20020a2e2e07000000b0025e4fbba9f0so5310230lju.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 03:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=AFT37D04zq4LQqw9OKWRNkU7ORSqHvfNUHywXUhX6hQ=;
        b=tkmpkBoYcvT/Dzp6dZPcWv7sVVJP609tfp3WMhIFnQCoCwKF1ctzWUa64ALJD5xbZg
         9iKg60Y1PInmvc3o+d3428WDsi9+09kkUkFaxsILQW7SS1wBvDXVioYxNlIoWKdxmOy6
         mufakZMdyec9pg9LeUWkU/MQqnga16dPuksU6JGv9P7joRovj5SehelQY13Clpc1zxYY
         cYhHnKVjFWGkHc4ZmJOuJiIga3jhh5Og5Tijywfu1j2JFn7NvDhHKoYeD2Xt57OuRwtv
         sBypCQK3HqPUzoJo4HVHDNxHFOdEyzsjH6yE9UXFYoY7KG2KWraxnWC4zwiuEdErNgQZ
         kjVg==
X-Gm-Message-State: ACgBeo0mvXr8o/CrK7Cf6goKtOvP+YSTlOfAnwadpA/ngbK1750foh9c
	cz+lopJpcKUDrIWJysnQwH3Vq/3U49uTQCNIdXEk0zNNEeEo13BWAZM1d4FKxnvZRXqMz2sOIOm
	kaLXxWixaQIsTwRkjsQ3rVvVjTBu71Hbm9twkBJUeyA==
X-Received: by 2002:a05:6512:1189:b0:48b:26d2:b13e with SMTP id g9-20020a056512118900b0048b26d2b13emr11289027lfr.37.1660212918020;
        Thu, 11 Aug 2022 03:15:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7jTPZzSZ4GMRnzcrTCRiqnNxYHvFdJA9ad1ZTevfiXyMPLqL0jmSkWGRT5NKQispK9XZF0wtoPDIyXonqfH/Q=
X-Received: by 2002:a05:6512:1189:b0:48b:26d2:b13e with SMTP id
 g9-20020a056512118900b0048b26d2b13emr11289020lfr.37.1660212917822; Thu, 11
 Aug 2022 03:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <A330513B-21C9-44D2-BA02-853327FC16CE@linux.ibm.com>
In-Reply-To: <A330513B-21C9-44D2-BA02-853327FC16CE@linux.ibm.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 11 Aug 2022 12:15:06 +0200
Message-ID: <CAGxU2F5V-qxurLSZhugvNLWkiDOM83tgKQrEUFB_PLd7=kTH3Q@mail.gmail.com>
Subject: Re: [5.19.0-next-20220811] Build failure drivers/vdpa
To: Sachin Sant <sachinp@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 Aug 2022 23:06:29 +1000
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 11, 2022 at 12:06 PM Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> 5.19.0-next-20220811 linux-next fails to build on IBM Power with
> following error:
>
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c: In function 'vdpasim_blk_handle_req=
':
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: a label can only be pa=
rt of a statement and a declaration is not a statement
>    struct virtio_blk_discard_write_zeroes range;
>    ^~~~~~
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:3: error: expected expression be=
fore 'u32'
>    u32 num_sectors, flags;
>    ^~~
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:3: error: 'num_sectors' undeclar=
ed (first use in this function); did you mean 'bio_sectors'?
>    num_sectors =3D vdpasim32_to_cpu(vdpasim, range.num_sectors);
>    ^~~~~~~~~~~
>    bio_sectors
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:3: note: each undeclared identif=
ier is reported only once for each function it appears in
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:3: error: 'flags' undeclared (fi=
rst use in this function); did you mean 'class'?
>    flags =3D vdpasim32_to_cpu(vdpasim, range.flags);
>    ^~~~~
>    class
> make[3]: *** [scripts/Makefile.build:250: drivers/vdpa/vdpa_sim/vdpa_sim_=
blk.o] Error 1
> make[2]: *** [scripts/Makefile.build:525: drivers/vdpa/vdpa_sim] Error 2
> make[1]: *** [scripts/Makefile.build:525: drivers/vdpa] Error 2
> make[1]: *** Waiting for unfinished jobs=E2=80=A6.
>
> Git bisect points to the following patch
>
> commit d79b32c2e4a4e66d5678410cd45815c1c2375196
> Date:   Wed Aug 10 11:43:47 2022 +0200
>     vdpa_sim_blk: add support for discard and write-zeroes
>

Thanks for the report, I already re-sent a new series with that patch fixed=
:
https://lore.kernel.org/virtualization/20220811083632.77525-1-sgarzare@redh=
at.com/T/#t

And it looks like it's already in Michael's tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next

Thanks,
Stefano

