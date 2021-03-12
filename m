Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 615AB338353
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 02:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxTSD2sMXz3dDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 12:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YQwP50AF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XLuVmvsC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=dgibson@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YQwP50AF; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XLuVmvsC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxTRk4BH5z3cLb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 12:55:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615514138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W75qg3A+18IW0Ab9lXSDws7sc4b8UPx0TijdkPTOKuc=;
 b=YQwP50AFcaoTCrs5v6J+PvstahfVU2lzV27oS4JkAcyX2NEebmeubBBpYGlivdxfzNfZxx
 r+3KYyj0AHXs5AMoEaRuuQ6HZYsYEduiSlXPTA3Jpr+ZrJKFzOzAlj1y/4Vwx3TmgnehTz
 12dtiSBzAK49tgRjIikg6APAfRMeFVk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615514139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W75qg3A+18IW0Ab9lXSDws7sc4b8UPx0TijdkPTOKuc=;
 b=XLuVmvsCQ+FNJMrYEbfETN8a3PKoMk1UEgnD6IYuMleDeRErVOb+xPUxLu5uqdGMaRFRVY
 Pg6sqqTRhpM6yM9oBbdCcxaY/pHzNinjhCnXmD2WtpXcmURXiEoQ64UM7PAJpYi5KFb08K
 J0Uyrzp3xU6j3j7yA+uVOHWiusd+idA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-4s3GmlXWMvS-Q5dPlyiQyA-1; Thu, 11 Mar 2021 20:55:35 -0500
X-MC-Unique: 4s3GmlXWMvS-Q5dPlyiQyA-1
Received: by mail-pj1-f72.google.com with SMTP id e15so7630351pjg.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 17:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Z5CTa2IF35bcRbs4RXMAF8l3VVl+04Ig/+0m6wggE1Q=;
 b=eoAoVQX8vZXvm9JDAHd02G5E96KfBXaNxzmNfOq9NsUKBgsRhQK0a/7cXCPaWpjy7w
 j5JQkmSDTpL+SS5GjbCqrPABVUuTChzPVgTx1Xb6X3Gx0MtBccmU0xqYSsA3LEY6mq08
 OQZuoAomJ0uX2oKQH0Rp0HiF5YrI2kuQ9usKSpTg9W1LNpuvQ6/lGq1qdMB7g/kK8sdh
 WH6ilCNMdJK14IYbXyuASdnMNGWH1Jj/Av36mNxBlgpb92t5kUJvq358J+Rehh4986C4
 2cwKRgLgNtQQVPd+nnF5QHkPIuhgNU1RU+R6baBjhE+kGL0wARxnB4ZggswD5zzsr5TI
 4zpg==
X-Gm-Message-State: AOAM532u3rPfC425hY8Kmny0tLUgP3v4sJa0QjfN1DtDYwH4/xhvIH9e
 Ix2Fuk1ik/Eiuzj0KPBxy/pcgBiCJcpwaeHHFn9B907IvFCEUExt52dTLF5M77Ksh5eKAZmVm8F
 hVVWbdi+GE217rhLvgCqz8Ly60w==
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id
 p14-20020a170902e74eb02900e5bde42b80mr11275441plf.44.1615514133857; 
 Thu, 11 Mar 2021 17:55:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJympsk+LidDvK5EeYm6Stjm37exit/hbmSiiiIDl+mA4zFHfnIDUv+reofvNjPwOgOnFGkTOQ==
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id
 p14-20020a170902e74eb02900e5bde42b80mr11275419plf.44.1615514133506; 
 Thu, 11 Mar 2021 17:55:33 -0800 (PST)
Received: from yekko.fritz.box ([2001:4479:e200:1100:3c24:4d96:ea81:be55])
 by smtp.gmail.com with ESMTPSA id b9sm3377547pgn.42.2021.03.11.17.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 17:55:33 -0800 (PST)
Date: Fri, 12 Mar 2021 12:55:27 +1100
From: David Gibson <dgibson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
Message-ID: <20210312125527.61bc269c@yekko.fritz.box>
In-Reply-To: <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org>
 <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
 <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
 <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgibson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Mar 2021 18:26:35 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 3/9/21 6:08 PM, Daniel Henrique Barboza wrote:
> >=20
> >=20
> > On 3/9/21 12:33 PM, C=C3=A9dric Le Goater wrote: =20
> >> On 3/8/21 6:13 PM, Greg Kurz wrote: =20
> >>> On Wed, 3 Mar 2021 18:48:50 +0100
> >>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>> =20
> >>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
> >>>> target for a source located on the same chip when possible. This fie=
ld
> >>>> is assigned on the PowerNV platform using the "ibm,chip-id" property
> >>>> on pSeries under KVM when NUMA nodes are defined but it is undefined=
 =20
> >>>
> >>> This sentence seems to have a syntax problem... like it is missing an
> >>> 'and' before 'on pSeries'. =20
> >>
> >> ah yes, or simply a comma.
> >> =20
> >>>> under PowerVM. The XIVE source structure has a similar field
> >>>> 'src_chip' which is only assigned on the PowerNV platform.
> >>>>
> >>>> cpu_to_node() returns a compatible value on all platforms, 0 being t=
he
> >>>> default node. It will also give us the opportunity to set the affini=
ty
> >>>> of a source on pSeries when we can localize them.
> >>>> =20
> >>>
> >>> IIUC this relies on the fact that the NUMA node id is =3D=3D to chip =
id
> >>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
> >>> with this change. =20
> >>
> >> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
> >> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Daniel
> >> in Cc:) =20
>  [...] =20
> >>
> >> On PowerNV, Linux uses "ibm,associativity" property of the CPU to find
> >> the node id. This value is built from the chip id in OPAL, so the
> >> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-id"
> >> property are unlikely to be different.
> >>
> >> cpu_to_node(cpu) is used in many places to allocate the structures
> >> locally to the owning node. XIVE is not an exception (see below in the
> >> same patch), it is better to be consistent and get the same informatio=
n
> >> (node id) using the same routine.
> >>
> >>
> >> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
> >> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skiboot
> >> unifies the controllers of the system to only expose one the OS. This
> >> is problematic and should be changed but it's another topic.
> >>
> >> =20
> >>> On the other hand, you have the pSeries case under PowerVM that
> >>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT. =20
> >>
> >> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no meani=
ng
> >> under PAPR. xc->chip_id on pseries (PowerVM) will contains an invalid
> >> chip id.
> >>
> >> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
> >> always correct btw) =20
> >=20
> >=20
> > If you have a way to reliably reproduce this, let me know and I'll fix =
it
> > up in QEMU. =20
>=20
> with :
>=20
>    -smp 4,cores=3D1,maxcpus=3D8 -object memory-backend-ram,id=3Dram-node0=
,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-node0 -=
object memory-backend-ram,id=3Dram-node1,size=3D2G -numa node,nodeid=3D1,cp=
us=3D2-3,cpus=3D6-7,memdev=3Dram-node1
>=20
> # dmesg | grep numa
> [    0.013106] numa: Node 0 CPUs: 0-1
> [    0.013136] numa: Node 1 CPUs: 2-3
>=20
> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> =09=09ibm,chip-id =3D <0x01>;
> =09=09ibm,chip-id =3D <0x02>;
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x03>;
>=20
> with :
>=20
>   -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 -object memory-backend-ram,id=
=3Dram-node0,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=
=3Dram-node0 -object memory-backend-ram,id=3Dram-node1,size=3D2G -numa node=
,nodeid=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1
>=20
> # dmesg | grep numa
> [    0.013106] numa: Node 0 CPUs: 0-1
> [    0.013136] numa: Node 1 CPUs: 2-3
>=20
> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x00>;
>=20
> I think we should simply remove "ibm,chip-id" since it's not used and
> not in the PAPR spec.

As I mentioned to Daniel on our call this morning, oddly it *does*
appear to be used in the RHEL kernel, even though that's 4.18 based.
This patch seems to have caused a minor regression; not in the
identification of NUMA nodes, but in the number of sockets shown be
lscpu, etc.  See https://bugzilla.redhat.com/show_bug.cgi?id=3D1934421
for more information.

Since the value was used by some PAPR kernels - even if they shouldn't
have - I think we should only remove this for newer machine types.  We
also need to check what we're not supplying that the guest kernel is
showing a different number of sockets than specified on the qemu
command line.

>=20
> Thanks,
>=20
> C.
>=20
> =20
>=20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>=20


--=20
David Gibson <dgibson@redhat.com>
Principal Software Engineer, Virtualization, Red Hat

