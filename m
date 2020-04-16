Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56161AC6C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:44:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49327Q37jdzDrBs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:44:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QUO2DId8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OZI4N/j3; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4931yF3nLSzDrgy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:36:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587047807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0AQKjbn71RmutxWIXxMLzth6Yh927BEPNgXbgaoIzU=;
 b=QUO2DId82mxUxjOYpDb4wtYFj85mWkN6DIqKHa87pftXWWlgZIvsFSM+xpvYsYVqpXqx6f
 m2MmsGIIvsZUBk52BBBPSRHsD6M+8XT0k28fvZGRziWOFmcXQyp0FWwBXdPXEbAS3avxFt
 TwnyWJv1lYeGfkZgREGZfuMWit+3F3c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587047808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0AQKjbn71RmutxWIXxMLzth6Yh927BEPNgXbgaoIzU=;
 b=OZI4N/j34HjHEV0AWiAmgX5451XPBBm2l6DrXu+APUJWtxXpnaY2M49qpRAPUZkmzsZT9s
 7d52/mivmGlNJ+iroJh56qo833F+f319kLq9TfMFe+l/YEtRni8DJ8Z7MIMb+0iB6txUIx
 eOqaWOzf+ctzGbONo7RwPeK9yqTk3PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-TnQyCV7VNAmASBbrHR-Zfw-1; Thu, 16 Apr 2020 10:36:42 -0400
X-MC-Unique: TnQyCV7VNAmASBbrHR-Zfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E1F18CA240;
 Thu, 16 Apr 2020 14:36:40 +0000 (UTC)
Received: from localhost (ovpn-12-36.pek2.redhat.com [10.72.12.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2A6619C70;
 Thu, 16 Apr 2020 14:36:36 +0000 (UTC)
Date: Thu, 16 Apr 2020 22:36:34 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
Message-ID: <20200416143634.GH4247@MiWiFi-R3L-srv>
References: <20200414064031.GB4247@MiWiFi-R3L-srv>
 <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
 <20200414092201.GD4247@MiWiFi-R3L-srv>
 <ad060c8a-8afe-3858-0a4f-27ff54ef4c68@redhat.com>
 <20200414143912.GE4247@MiWiFi-R3L-srv>
 <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
 <20200415023524.GG4247@MiWiFi-R3L-srv>
 <18cf6afd-c651-25c7-aca3-3ca3c0e07547@redhat.com>
 <20200416140247.GA12723@MiWiFi-R3L-srv>
 <4e1546eb-4416-dc6d-d549-62d1cecccbc8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4e1546eb-4416-dc6d-d549-62d1cecccbc8@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: piliu@redhat.com, Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bhupesh Sharma <bhsharma@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 kexec@lists.infradead.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, linux-mm@kvack.org,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/16/20 at 04:09pm, David Hildenbrand wrote:
> >>> Sounds doable to me, and not complicated.
> >>>
> >>>> images. It would apply to
> >>>>
> >>>> - arm64 and filter out all hotadded memory (IIRC, only boot memory c=
an
> >>>>   be used).
> >>>
> >>> Do you mean hot added memory after boot can't be recognized and added
> >>> into system RAM on arm64?
> >>
> >> See patch #3 of this patch set, which wants to avoid placing kexec
> >> binaries on hotplugged memory. But I have no idea what the current pla=
n
> >> regarding arm64 is (this thread exploded :) ).
> >>
> >> I would assume that we don't want to place kexec images on any
> >> hotplugged (or rather: hot(un)pluggable) memory - on any architecture.
> >=20
> > Yes, noticed that and James replied to DaveY.
> >=20
> > Later, when I was considering to make a draft patch to do the picking o=
f
> > memory from normal zone, and add a notifier, as we discussed at above, =
I
> > suddenly realized that kexec_file_load doesn't have this issue. It
> > traverse system RAM bottom up to get an available region to put
> > kernel/initrd/boot_param, etc. I can't think of a system where its
> > low memory could be unavailable.
>=20
> kexec_walk_memblock() has the option for "kbuf->top_down". Only
> kexec_walk_resources() seems to ignore it.

Yeah, that top down searching is done in a found low mem area. Means
firstly search an available region bottom up, then put kernel top down
in that region. The reason is our iomem res is linked with singly linked
list. So we can only search bottom up efficiently.

kexec_load is doing the real top down searching, so kernel will be put
at the top of system ram. I ever tried to change it to support top down
searching for kexec_file_load too with patches, since QE and customers
are often confused with this difference when debugging.

Andrew may remeber this, he suggested me to change the singly linked list=
=20
to doubly linked list for iomem res, then do the top down searching for
kexec_file_load. I tried with some effort, the change introduced too much
code change, I just gave up finally.

http://archive.lwn.net:8080/devicetree/20180718024944.577-1-bhe@redhat.com/

I can see that top down searching for kexec can avoid the highly used
low memory region, esp under 4G, for dma, kinds of firmware reserving,
etc. And customers/QE of kexec get used to it. I can change kexec_file_load
to top down too with a simple way if people really complain it. But now,=20
seems bottom up is not bad too.

>=20
> So I think in case of memblocks (e.g., arm64), this still applies?

Yeah, aren't you trying to remove it? I haven't read your patches
carefully, maybe I got it wrong. And arm64 even can't support the hot added
memory being able to recorded into firmware, seems it's not so ready,=20
won't they change that design in the future?
>=20
> >>
> >>>
> >>>
> >>>> - powerpc to filter out all LMBs that can be removed (assuming not a=
ll
> >>>>   memory corresponds to LMBs that can be removed, otherwise we're in
> >>>>   trouble ... :) )
> >>>> - virtio-mem to filter out all memory it added.
> >>>> - hyper-v to filter out partially backed memory blocks (esp. the las=
t
> >>>>   memory block it added and only partially backed it by memory).
> >>>>
> >>>> This would make it work for kexec_file_load(), however, I do wonder =
how
> >>>> we would want to approach that from userspace kexec-tools when handl=
ing
> >>>> it from kexec_load().
> >>>
> >>> Let's make kexec_file_load work firstly. Since this work is only firs=
t
> >>> step to make kexec-ed kernel not break memory hotplug. After kexec
> >>> rebooting, the KASLR may locate kernel into hotpluggable area too.
> >>
> >> Can you elaborate how that would work?
> >=20
> > Well, boot memory can be hotplugged or not after boot, they are marked
> > in uefi tables, the current kexec doesn't save and pass them into 2nd
> > kenrel, when kexec kernel bootup, it need read them and avoid them to
> > randomize kernel into.
>=20
> What about e.g., memory hotplugged by ACPI? I would assume, that the
> kexec kernel will not make use of that (IOW detected that) until the
> ACPI driver comes up and re-detects + adds that memory.
>=20
> Or how would that machinery work in case we have a DIMM hotplugged via AC=
PI?

ACPI SRAT is embeded into efi, need read out the rsdp pointer. If we don't
pass the efi, it won't get the SRAT table correctly, if I remember
correctly. Yeah, I remeber kvm guest can get memory hotplugged with
ACPI only, this won't happen on bare metal though. Need check carefully.=20
I have been using kvm guest with uefi firmwire recently.

