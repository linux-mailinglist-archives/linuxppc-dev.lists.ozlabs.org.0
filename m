Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA41ABCB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 11:22:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492tys2W1RzDrSL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:21:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=cohuck@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Zgz/eeB9; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gC6PUpVg; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492tLk35CmzDrNR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:54:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587027242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBOSp8KoaqgQUXlL6khiQxh82SbQfD3UXPaPxlc3NpI=;
 b=Zgz/eeB9LNPsw+fRyve48eAo2hSl40TxZq64+zG7TY4Yk5GzCSMvkkcBe41GyHVR2o7ywk
 /C47T5N81IhUOGsPSCUYZ/WHvsucskYR9u2+JHXgKTZ3vAa4HFpyqkLGYbqh/sJ+nPpcOG
 qYOLABRQBYR+LVLED7K8O+M5LZK8rH0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587027243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBOSp8KoaqgQUXlL6khiQxh82SbQfD3UXPaPxlc3NpI=;
 b=gC6PUpVg1VUXH99HAvRfv32y+vQGI1Ld3pvVEYUseLs69LlT80/857edi4CHbMsOHqFbhK
 Gu0S8U0P1YwO5z8h1DItTxg+AiJxtf0PJxJx7JlI67BoyPUdFm8OwsvDaCHE2sROMhYvmI
 Klo5EKrfRHOwW3EZYzO4lkUmjHnlWP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-MuypNbuHM0uD0I3hVYYtuw-1; Thu, 16 Apr 2020 04:50:46 -0400
X-MC-Unique: MuypNbuHM0uD0I3hVYYtuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994A818C35A6;
 Thu, 16 Apr 2020 08:50:42 +0000 (UTC)
Received: from gondolin (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 330E27E7C4;
 Thu, 16 Apr 2020 08:50:22 +0000 (UTC)
Date: Thu, 16 Apr 2020 10:50:19 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
Message-ID: <20200416105019.51191d79.cohuck@redhat.com>
In-Reply-To: <8b92fb5b-5138-0695-fb90-6c36b8dfad00@linux.alibaba.com>
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
 <878sivx67g.fsf@vitty.brq.redhat.com>
 <1000159f971a6fa3b5bd9e5871ce4d82@kernel.org>
 <8b92fb5b-5138-0695-fb90-6c36b8dfad00@linux.alibaba.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Thu, 16 Apr 2020 19:18:11 +1000
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
Cc: christoffer.dall@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 david@redhat.com, heiko.carstens@de.ibm.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, hpa@zytor.com, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Marc Zyngier <maz@kernel.org>, joro@8bytes.org, x86@kernel.org,
 borntraeger@de.ibm.com, mingo@redhat.com, julien.thierry.kdev@gmail.com,
 thuth@redhat.com, gor@linux.ibm.com, suzuki.poulose@arm.com,
 kvm-ppc@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 sean.j.christopherson@intel.com, james.morse@arm.com, pbonzini@redhat.com,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Apr 2020 16:45:33 +0800
Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:

> On 2020/4/16 16:28, Marc Zyngier wrote:
> > On 2020-04-16 08:03, Vitaly Kuznetsov wrote: =20
> >> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:
> >> =20
> >>> In earlier versions of kvm, 'kvm_run' is an independent structure
> >>> and is not included in the vcpu structure. At present, 'kvm_run'
> >>> is already included in the vcpu structure, so the parameter
> >>> 'kvm_run' is redundant.
> >>>
> >>> This patch simplify the function definition, removes the extra
> >>> 'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure
> >>> if necessary.
> >>>
> >>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> >>> ---
> >>>
> >>> v2 change:
> >>> =C2=A0 remove 'kvm_run' parameter and extract it from 'kvm_vcpu'
> >>>
> >>> =C2=A0arch/mips/kvm/mips.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
> >>> =C2=A0arch/powerpc/kvm/powerpc.c |=C2=A0 3 ++-
> >>> =C2=A0arch/s390/kvm/kvm-s390.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> >>> =C2=A0arch/x86/kvm/x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 11 ++++++-----
> >>> =C2=A0include/linux/kvm_host.h=C2=A0=C2=A0 |=C2=A0 2 +-
> >>> =C2=A0virt/kvm/arm/arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +++---
> >>> =C2=A0virt/kvm/kvm_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> >>> =C2=A07 files changed, 17 insertions(+), 13 deletions(-)

> > Overall, there is a large set of cleanups to be done when both the vcpu=
=20
> > and the run
> > structures are passed as parameters at the same time. Just grepping the=
=20
> > tree for
> > kvm_run is pretty instructive.
> >=20
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M. =20
>=20
> Sorry, it's my mistake, I only compiled the x86 platform, I will submit=20
> patch again.

I think it's completely fine (and even preferable) to do cleanups like
that on top.

[FWIW, I compiled s390 here.]

