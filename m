Return-Path: <linuxppc-dev+bounces-6745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F41A502C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 15:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7FvG58LSz3btZ;
	Thu,  6 Mar 2025 01:54:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741186474;
	cv=none; b=GkTAMs8/kZRVrJpNM7TGmFgvPfaj9u+YULyjz1oySM3PucZhqy4LZnpg/Kr9gf4/fV92KTikyk45YpcPXzUeeJAuJ5aDh4lehgZK9KQxpoAYCukhIwiFV2vkaps6XCdpR8uNQBge2Vpk/Keca2gKv1Mz34zI7KGC41J/vAawD07ajJKGDJ6wCusPrp4mVr+tRuAjcm/qgpjWLe3BfNdkVerH/yU4EvfiyG++s0p7rJ89/+3pximpP5t1+hIfog4e5CZAkS7BYJGDeavjX8KtW44zRkWLh3SDdEIUQHjOEBp6G8G6QZu2i7FGl62ae9xua6luXm7EcWP/NJYZtuq49A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741186474; c=relaxed/relaxed;
	bh=Cox8z8lPi8h9WF637SHJRl9fGGbJ29Arrtfjq01tB+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCDGMLuOLrcaH2nOn7U4zGVGbIJddVK77qX/laFqNr9QBk0crCVX+9QL0WcyoOujw4qV4eATo9Fqio9l0JckcqEN8x9VXp6dRsmad0igXejCcsgCU3jpxAf0kx3NPhRP87lfHTIWK50auH5zHdCX/8Kb6n/pG9/jrHSAOuvmITss4nvmGhkxsCJXF5CZRV+DMzIemaYXEH5LFd53LnzneKpLtBETrDM8f9wzEUAs8ZSYP+4IfsaPavesTD85kKfXKtY9/gGRcfXOKEC05RJOmSO+Sb25BamUjBAQPHQiubfDx6CkfwY4yplAvYq0qfBS7tv8wVJ78RziHxWMCI6jIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APVgjoA4; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APVgjoA4; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APVgjoA4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APVgjoA4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7FvD454Wz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 01:54:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741186466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cox8z8lPi8h9WF637SHJRl9fGGbJ29Arrtfjq01tB+8=;
	b=APVgjoA4jgGfgoOa6BL+k/bfXU9e7ZIdg14+zqorDSVpV4a8kBNd+ObnySMGJfX3uKWh+Z
	o6DRYUSBeayIs1xJgOBcyakavxgYym6OuqiEKlSPOLb9rt+fhO+XQt6pPartkX7zVD7Sbc
	B4xluKxR2SEiN/kuIVIqKmW1k4lHFVI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741186466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cox8z8lPi8h9WF637SHJRl9fGGbJ29Arrtfjq01tB+8=;
	b=APVgjoA4jgGfgoOa6BL+k/bfXU9e7ZIdg14+zqorDSVpV4a8kBNd+ObnySMGJfX3uKWh+Z
	o6DRYUSBeayIs1xJgOBcyakavxgYym6OuqiEKlSPOLb9rt+fhO+XQt6pPartkX7zVD7Sbc
	B4xluKxR2SEiN/kuIVIqKmW1k4lHFVI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-t9Mnhn0ANlq0fc7b3A4WZg-1; Wed, 05 Mar 2025 09:54:25 -0500
X-MC-Unique: t9Mnhn0ANlq0fc7b3A4WZg-1
X-Mimecast-MFC-AGG-ID: t9Mnhn0ANlq0fc7b3A4WZg_1741186464
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390ddebcbd1so4107422f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 06:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186459; x=1741791259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cox8z8lPi8h9WF637SHJRl9fGGbJ29Arrtfjq01tB+8=;
        b=b+LX365BTnSFfKNAoqQMJirGev1tmbk2QhYaeynabKvQpWpHMDofuT+kMr0DgRRDnH
         aCo+bwkd2uQszdDp4jLdjbSj4FNL8YBUP+lhhI4Blrnvyq0vQXlNfTD/8zUvJoVXlT1q
         2De39+H/G0rmuWfudkEy9g7gH+3LaM1s/N/rCKbscdopUR5LVrfE76LeJ34ZKT8peap6
         7wS3oQsDjQmrdrII3elor6XSFr07K5T5ae5xFCmdY03DgdWTzwTXQZA4fKp5NYDx9VTn
         SSwDObm8cC1CBz0Yfsra1z0+hhB63auwAZpuyrSIULJjEXnxcNiL7loo2oTBMM/SKiiE
         0tBw==
X-Forwarded-Encrypted: i=1; AJvYcCWmsLj32w8/M45ngME1p5c7Rs0BgmabKitrp0nVU8n/wPeHivzwdKG4uwUdT/ETcBJ8Y/A7lzP+s0uC6Pg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEw3EbtJ4wioWicUIKRaAbZRtj2vXsKMmMYomid7hBPtONcgl5
	+BRvzzqnUEtOZ3Gai+rPvd3mNPCImYbyA0VFE4flOxE1NruAtJYPMGKtiTYZqCS1+cURaSDvLix
	vtK9MrbjH5O9s9prhH7raTBg73vp2yv7UwX4wOvIn97poJYDVlzp1+sy7Gkvqr+qRpUZW0/2oW1
	kdyzUCUQUeUWudLgANUgXFEECgV0Z3rak4Q4Repg==
X-Gm-Gg: ASbGncvx8ax4ZblNToI61JbcAZD8oh5Tw6a3cPAM910FBaNqp0/7F7I1iU9lEDPXnOu
	+Qmb5Ld5mXeLmg+tlOzv83pfUEI3fVCc+to+MgPcHa8xjM5lHIZFPZtQ10M/XvHMBJX6ISaco
X-Received: by 2002:a05:6000:136f:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-3911f7bac6bmr2620729f8f.38.1741186458845;
        Wed, 05 Mar 2025 06:54:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4PvVuGKTxjn5+5ksdqhrhoFlLx86CRmMyFCnvhKsn1bSfHEsAqd2/zQT4R+Gyx1q0iDsSyD24ytNHcUzKCCU=
X-Received: by 2002:a05:6000:136f:b0:390:e1c5:fe2 with SMTP id
 ffacd0b85a97d-3911f7bac6bmr2620699f8f.38.1741186458470; Wed, 05 Mar 2025
 06:54:18 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250112095527.434998-4-pbonzini@redhat.com> <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
 <2025030516-scoured-ethanol-6540@gregkh>
In-Reply-To: <2025030516-scoured-ethanol-6540@gregkh>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 5 Mar 2025 15:54:06 +0100
X-Gm-Features: AQ5f1Jq9Q6hjcyw1JQehTB9dj5tz1yQanFW326sta5ahk4Wq43oLtxt1PyaZ6q4
Message-ID: <CABgObfb5U9zwTQBPkPB=mKu-vMrRspPCm4wfxoQpB+SyAnb5WQ@mail.gmail.com>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, seanjc@google.com, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev, Trevor Dickinson <rtd2@xtra.co.nz>, 
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au, 
	Darren Stevens <darren@stevens-zone.net>, Sasha Levin <sashal@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 73BRbRP-cBWSpK8dqmMhovHGn9qIGGGTkZRnzUUXo74_1741186464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,TRACKER_ID
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 5, 2025 at 3:19=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> On Wed, Mar 05, 2025 at 03:14:13PM +0100, Christian Zigotzky wrote:
> > Hi All,
> >
> > The stable long-term kernel 6.12.17 cannot compile with KVM HV support =
for e5500 PowerPC machines anymore.
> >
> > Bug report: https://github.com/chzigotzky/kernels/issues/6
> >
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/=
x5000_defconfig
> >
> > Error messages:
> >
> > arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
> > arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of =
function '__kvm_faultin_pfn' [-Werror=3Dimplicit-function-declaration]
> >    pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> >          ^~~~~~~~~~~~~~~~~
> >   CC      kernel/notifier.o
> > arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of =
function 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-=
Werror=3Dimplicit-function-declaration]
> >   kvm_release_faultin_page(kvm, page, !!ret, writable);
> >
> > After that, I compiled it without KVM HV support.
> >
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/=
e5500_defconfig
> >
> > Please check the error messages.
>
> Odd, what commit caused this problem?

48fe216d7db6b651972c1c1d8e3180cd699971b0

> Any hint as to what commit is missing to fix it?

A big-ass 90 patch series. __kvm_faultin_pfn and
kvm_release_faultin_page were introduced in 6.13, as part of a big
revamp of how KVM does page faults on all architectures.

Just revert all this crap and apply the version that I've just sent
(https://lore.kernel.org/stable/20250305144938.212918-1-pbonzini@redhat.com=
/):

commit 48fe216d7db6b651972c1c1d8e3180cd699971b0
    KVM: e500: always restore irqs

commit 833f69be62ac366b5c23b4a6434389e470dd5c7f
    KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
    Message-ID: <20241010182427.1434605-55-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")

commit f2623aec7fdc2675667042c85f87502c9139c098
    KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_loc=
k
    Message-ID: <20241010182427.1434605-54-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")

commit dec857329fb9a66a5bce4f9db14c97ef64725a32
    KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
    Message-ID: <20241010182427.1434605-53-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")

And this, ladies and gentlemen, is why I always include the apparently
silly Message-ID trailer. Don't you just love how someone, whether
script or human, cherry picked patches 53-55 without even wondering
what was in the 52 before. I'm not sure if it'd be worse for it to be
a human or a script... because if it's a script, surely the same level
of sophistication could have been put into figuring out whether the
thing even COMPILES.

Sasha, this wins the prize for most ridiculous automatic backport
ever. Please stop playing maintainer if you can't be bothered to read
the commit messages for random stuff that you apply.

Paolo


