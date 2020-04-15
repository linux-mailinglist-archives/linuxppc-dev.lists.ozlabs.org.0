Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059C1A90F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 04:37:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49262K23WVzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 12:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=APFa9xqE; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49260Y0qWkzDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 12:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586918135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3o4+0HgEBD0h2Go+GpB2trM6HPRj5m5yAn/gvrKMuxQ=;
 b=APFa9xqEU7VJnr5z77+7garh9xZJicWbh8t09e0TJZFnTGntQzcGi4Th+/DAUx5vGA4RkQ
 NQbqq9RHjfyYw70vVPhL18FLZayMSnEyEFAFNYBU6hUHP7HKqcFNwd9AApluUdfl5rGICQ
 6dPv0Btuetb95sqrC+JZ3xtdNH9Sv1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-WOza4ysLPQyg0KcN4VE8gg-1; Tue, 14 Apr 2020 22:35:33 -0400
X-MC-Unique: WOza4ysLPQyg0KcN4VE8gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 890218017F3;
 Wed, 15 Apr 2020 02:35:30 +0000 (UTC)
Received: from localhost (ovpn-12-27.pek2.redhat.com [10.72.12.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B9A899DEE;
 Wed, 15 Apr 2020 02:35:26 +0000 (UTC)
Date: Wed, 15 Apr 2020 10:35:24 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
Message-ID: <20200415023524.GG4247@MiWiFi-R3L-srv>
References: <20200412080836.GM25745@shell.armlinux.org.uk>
 <87wo6klbw0.fsf@x220.int.ebiederm.org>
 <20200413023701.GA20265@MiWiFi-R3L-srv>
 <871rorjzmc.fsf@x220.int.ebiederm.org>
 <20200414064031.GB4247@MiWiFi-R3L-srv>
 <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
 <20200414092201.GD4247@MiWiFi-R3L-srv>
 <ad060c8a-8afe-3858-0a4f-27ff54ef4c68@redhat.com>
 <20200414143912.GE4247@MiWiFi-R3L-srv>
 <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/14/20 at 04:49pm, David Hildenbrand wrote:
> >>>>> The root cause is kexec-ed kernel is targeted at hotpluggable memor=
y
> >>>>> region. Just avoiding the movable area can fix it. In kexec_file_lo=
ad(),
> >>>>> just checking or picking those unmovable region to put kernel/initr=
d in
> >>>>> function locate_mem_hole_callback() can fix it. The page or pageblo=
ck's
> >>>>> zone is movable or not, it's easy to know. This fix doesn't need to
> >>>>> bother other component.
> >>>>
> >>>> I don't fully agree. E.g., just because memory is onlined to ZONE_NO=
RMAL
> >>>> does not imply that it cannot get offlined and removed e.g., this is
> >>>> heavily used on ppc64, with 16MB sections.
> >>>
> >>> Really? I just know there are two kinds of mem hoplug in ppc, but don=
't
> >>> know the details. So in this case, is there any flag or a way to know
> >>> those memory block are hotpluggable? I am curious how those kernel da=
ta
> >>> is avoided to be put in this area. Or ppc just freely uses it for ker=
nel
> >>> data or user space data, then try to migrate when hot remove?
> >>
> >> See
> >> arch/powerpc/platforms/pseries/hotplug-memory.c:dlpar_memory_remove_by=
_count()
> >>
> >> Under DLAPR, it can remove memory in LMB granularity, which is usually
> >> 16MB (=3D=3D single section on ppc64). DLPAR will directly online all
> >> hotplugged memory (LMBs) from the kernel using device_online(), which
> >> will go to ZONE_NORMAL.
> >>
> >> When trying to remove memory, it simply scans for offlineable 16MB
> >> memory blocks (=3D=3Dsection =3D=3D LMB), offlines and removes them. N=
o need for
> >> the movable zone and all the involved issues.
> >=20
> > Yes, this is a different one, thanks for pointing it out. It sounds lik=
e
> > balloon driver in virt platform, doesn't it?
>=20
> With DLPAR there is a hypervisor involved (which manages the actual HW
> DIMMs), so yes.
>=20
> >=20
> > Avoiding to put kexec kernel into movable zone can't solve this DLPAR
> > case as you said.
> >=20
> >>
> >> Now, the interesting question is, can we have LMBs added during boot
> >> (not via add_memory()), that will later be removed via remove_memory()=
.
> >> IIRC, we had BUGs related to that, so I think yes. If a section contai=
ns
> >> no unmovable allocations (after boot), it can get removed.
> >=20
> > I do want to ask this question. If we can add LMB into system RAM, then
> > reload kexec can solve it.=20
> >=20
> > Another better way is adding a common function to filter out the
> > movable zone when search position for kexec kernel, use a arch specific
> > funciton to filter out DLPAR memory blocks for ppc only. Over there,
> > we can simply use for_each_drmem_lmb() to do that.
>=20
> I was thinking about something similar. Maybe something like a notifier
> that can be used to test if selected memory can be used for kexec

Not sure if I get the notifier idea clearly. If you mean=20

1) Add a common function to pick memory in unmovable zone;
2) Let DLPAR, balloon register with notifier;
3) In the common function, ask notified part to check if the picked
   unmovable memory is available for locating kexec kernel;

Sounds doable to me, and not complicated.

> images. It would apply to
>=20
> - arm64 and filter out all hotadded memory (IIRC, only boot memory can
>   be used).

Do you mean hot added memory after boot can't be recognized and added
into system RAM on arm64?


> - powerpc to filter out all LMBs that can be removed (assuming not all
>   memory corresponds to LMBs that can be removed, otherwise we're in
>   trouble ... :) )
> - virtio-mem to filter out all memory it added.
> - hyper-v to filter out partially backed memory blocks (esp. the last
>   memory block it added and only partially backed it by memory).
>=20
> This would make it work for kexec_file_load(), however, I do wonder how
> we would want to approach that from userspace kexec-tools when handling
> it from kexec_load().

Let's make kexec_file_load work firstly. Since this work is only first
step to make kexec-ed kernel not break memory hotplug. After kexec
rebooting, the KASLR may locate kernel into hotpluggable area too.

