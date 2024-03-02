Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC6C86F331
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 01:01:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WjwXCEXb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hs1IqQwC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TnMRZ0W2Yz3dX5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 11:00:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WjwXCEXb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hs1IqQwC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TnMQl5636z3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 11:00:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709424008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNn4AYHDxOyYCw1sWBQwABamqz8kdnNfjo/jO2yqNzo=;
	b=WjwXCEXbYcCiRyqCmwldFSAcL4hqps8YznseOe24+DxZPvYlbURCaux09UcQWgtIXEJRy8
	sy/ih1Pb84/2QxPnC4M2zQ4/cRB+ygLRzxgPZ1fNU+5fnYvqtt4MH8slFAk872HD+9z2Q6
	ApVdrxpKqSOmkYhz8kbcXHJer4STyu4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709424009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNn4AYHDxOyYCw1sWBQwABamqz8kdnNfjo/jO2yqNzo=;
	b=Hs1IqQwC0qacAFDDfIuHtV4wrq+KVib7nZ2E78S4eK/GXVb/m3v1ZDiETsCZ3GVJ/9ZDTV
	/L6354fN47UYoh08n+M7Ezz2aO/o7guLPs89+WCv43oXf4W3JntmCC7kK8oFpw9zezFtqC
	RJLrDAbzq6Ba1lWXzHLRIevgvVsKJQg=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-nY8OOg5vOc2-sPRCOFYyBQ-1; Sat, 02 Mar 2024 19:00:06 -0500
X-MC-Unique: nY8OOg5vOc2-sPRCOFYyBQ-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-7d302c6a708so2427356241.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Mar 2024 16:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709424006; x=1710028806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNn4AYHDxOyYCw1sWBQwABamqz8kdnNfjo/jO2yqNzo=;
        b=tdi3fxQZq/KSZq1b677d5GnLady5nVPmwJ1CsvMHnuOv495/yPwETcTyzUIC9BT1nc
         ZBvINeAw+g4dKC2MpCfzp7upvkmqYPQcO6hEi3+BQmy3dtPFnHEpIR0iFkodHl4Torax
         IJdSrLb97c/3wffQo5OLdyZ5x+9lN3NNvLnYSv2SFZKYsUGdezAlIfAFT+kfRVchIWgI
         nZmx7Q/oiOWnVJUsYPIA4xU5w2VVtcp+eKK3RzP96WZXTZ4TSH4v/8hxLjp9+zqFy0ql
         sLV1alKRVTxo1Yg8afEMP3jZcl9F4L+Bvq9nDLZej69HMxAZrtpm1+Lqy9t+IBFI1NU7
         cx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjCaDyXRtByoRtfVo6kQAectc1PZoVgfCIitvFzgPTn5Yob5eF6z234Q2+PywptAhG11Xmlltsgp2QPLpwJiUqFhSkyqcVeuJbxlgu1A==
X-Gm-Message-State: AOJu0YxLf2dhV03eT54pSLXX23l+vBlW2/o9E37E8wJs7K5tBoRutvGQ
	d6wR5JsMkKLL4nN1uJDW4lkydkokJbdq/8sMAHLhTSrrMY1tGJ7cpEnNR6DVOyP68q3VCuX1WKo
	AmZFSEXHC4TW2TtUAgJTNax4TzEgnN2V84+V9KoH9I/7EPnUYOLPk+tw2f0kqUDZNxQr7BK/+bX
	AFAUFHo4ZfgW3EbhmLS0r8j7GC6RoBGNhUAza4QA==
X-Received: by 2002:a05:6102:2e6:b0:472:7619:1a63 with SMTP id j6-20020a05610202e600b0047276191a63mr3804554vsj.35.1709424005598;
        Sat, 02 Mar 2024 16:00:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFByXUW6H7RopND/l/85n7vhh3nESgMcc0/78odRPIE36Mxfh25xt5RnW/nCFHDtnaXb5pilZ920//jFoIFzNY=
X-Received: by 2002:a05:6102:2e6:b0:472:7619:1a63 with SMTP id
 j6-20020a05610202e600b0047276191a63mr3804545vsj.35.1709424005271; Sat, 02 Mar
 2024 16:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20240301203023.2197451-1-jsavitz@redhat.com> <87cysdfsef.fsf@mail.lhotse>
In-Reply-To: <87cysdfsef.fsf@mail.lhotse>
From: Joel Savitz <jsavitz@redhat.com>
Date: Sat, 2 Mar 2024 18:59:49 -0500
Message-ID: <CAL1p7m7nHfLM=koNaFZ0MrrcC6Lyj3VWdC9i8rOWGmrijKR3+Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 1, 2024 at 6:23=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
>
> Hi Joel,
>
> Joel Savitz <jsavitz@redhat.com> writes:
> > On 64-bit powerpc, usage of a non-16MB-aligned value for the mem=3D ker=
nel
> > cmdline parameter results in a system hang at boot.
>
> Can you give us any more details on that? It might be a bug we can fix.

The console freezes after the following output:

  Booting a command list

OF stdout device is: /vdevice/vty@30000000
Preparing to boot Linux version 6.8.0-rc6.memNOfix-00120-g87adedeba51a
(root@ibm-p9z-26-lp11.virt.pnr.lab.eng.rdu2.redhat.com) (gcc (GCC)
11.4.1 20231218 (Red Hat 11.4.1-3), GNU ld version 2.35.2-43.el9) #3
SMP Fri Mar  1 10:45:45 EST 2024
Detected machine type: 0000000000000101
command line: BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@30000003/disk@81000000=
00000000,msdos2)/vmlinuz-6.8.0-rc6.memNOfix-00120-g87adedeba51a
root=3D/dev/mapper/rhel_ibm--p9z--26--lp11-root ro
crashkernel=3D2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G
rd.lvm.lv=3Drhel_ibm-p9z-26-lp11/root
rd.lvm.lv=3Drhel_ibm-p9z-26-lp11/swap mem=3D4198400K
Max number of cores passed to firmware: 256 (NR_CPUS =3D 2048)
Calling ibm,client-architecture-support... done
Ignoring mem=3D0000000101000000 >=3D ram_top.
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 00000000114f0000
  alloc_top    : 0000000020000000
  alloc_top_hi : 0000000020000000
  rmo_top      : 0000000020000000
  ram_top      : 0000000020000000
instantiating rtas at 0x000000001ecb0000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000011500000 -> 0x00000000115017b7
Device tree struct  0x0000000011510000 -> 0x0000000011520000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x000000000a6e0000 ...

>
> > For example, using 'mem=3D4198400K' will always reproduce this issue.
> >
> > This patch fixes the problem by aligning any argument to mem=3D to 16MB
> > corresponding with the large page size on powerpc.
>
> The large page size depends on the MMU, with Radix it's 2MB or 1GB. So
> depending on what's happening 16MB may not be enough.
>
> What system are you testing on?

I'm running a virtual system in PowerVM on an IBM Z mainframe, 8375-42A mod=
el.

Best,
Joel Savitz

>
> cheers
>
> > Fixes: 2babf5c2ec2f ("[PATCH] powerpc: Unify mem=3D handling")
> > Co-developed-by: Gonzalo Siero <gsierohu@redhat.com>
> > Signed-off-by: Gonzalo Siero <gsierohu@redhat.com>
> > Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> > ---
> >  arch/powerpc/kernel/prom.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 0b5878c3125b..8cd3e2445d8a 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -82,8 +82,12 @@ static int __init early_parse_mem(char *p)
> >  {
> >       if (!p)
> >               return 1;
> > -
> > +#ifdef CONFIG_PPC64
> > +     /* Align to 16 MB =3D=3D size of ppc64 large page */
> > +     memory_limit =3D ALIGN(memparse(p, &p), 0x1000000);
> > +#else
> >       memory_limit =3D PAGE_ALIGN(memparse(p, &p));
> > +#endif
> >       DBG("memory limit =3D 0x%llx\n", memory_limit);
> >
> >       return 0;
> > --
> > 2.43.0
>

