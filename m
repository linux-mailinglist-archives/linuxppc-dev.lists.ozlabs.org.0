Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CF1AC4E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:06:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4931HP6XqCzDrcP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:06:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WvUBUgGd; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DQJjQS4u; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4931CH3Vs5zDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:03:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587045782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTCnzd2XlgbcxruM8XtC2INeIkYrefeETcNQ6xKyTQc=;
 b=WvUBUgGdYsWHRUeGoQwxJRy9sWrvdRBUJjUaIyLQrbq/U4wXTECru/Y1Z647KAwqoBwfnS
 hMWs6quLNoaJ0+9svQYDhbtaE6W+seWLEKkxDSKCRgUjvH77x3d43vVYIXUlUoHyBLIA9J
 bmWMgwIlXGSrFH1UVFHxw9T4K+nv4fM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587045783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTCnzd2XlgbcxruM8XtC2INeIkYrefeETcNQ6xKyTQc=;
 b=DQJjQS4uf+sxholljzBU/bx3XuHPFf4zuDLxWHaK/A8IHikMRA5Cgtr5WWpGfdhj5uq249
 Um1/mJbwtH6tj842msh45FoRSW+jgK3/qU3YBJrPr5nMfJDML7zoEGFj9pSUdyKDNYv3Zx
 GZT9EwzNuxcujg8aMrkUZ5hRUJHEngU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-PC3eu-rJOkazl1fOhLt66A-1; Thu, 16 Apr 2020 10:02:55 -0400
X-MC-Unique: PC3eu-rJOkazl1fOhLt66A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83520190B2A9;
 Thu, 16 Apr 2020 14:02:53 +0000 (UTC)
Received: from localhost (ovpn-12-36.pek2.redhat.com [10.72.12.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACF605C1C5;
 Thu, 16 Apr 2020 14:02:49 +0000 (UTC)
Date: Thu, 16 Apr 2020 22:02:47 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
Message-ID: <20200416140247.GA12723@MiWiFi-R3L-srv>
References: <20200413023701.GA20265@MiWiFi-R3L-srv>
 <871rorjzmc.fsf@x220.int.ebiederm.org>
 <20200414064031.GB4247@MiWiFi-R3L-srv>
 <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
 <20200414092201.GD4247@MiWiFi-R3L-srv>
 <ad060c8a-8afe-3858-0a4f-27ff54ef4c68@redhat.com>
 <20200414143912.GE4247@MiWiFi-R3L-srv>
 <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
 <20200415023524.GG4247@MiWiFi-R3L-srv>
 <18cf6afd-c651-25c7-aca3-3ca3c0e07547@redhat.com>
MIME-Version: 1.0
In-Reply-To: <18cf6afd-c651-25c7-aca3-3ca3c0e07547@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 04/16/20 at 03:31pm, David Hildenbrand wrote:
> > Not sure if I get the notifier idea clearly. If you mean=20
> >=20
> > 1) Add a common function to pick memory in unmovable zone;
>=20
> Not strictly required IMHO. But, minor detail.
>=20
> > 2) Let DLPAR, balloon register with notifier;
>=20
> Yeah, or virtio-mem, or any other technology that adds/removes memory
> dynamically.
>=20
> > 3) In the common function, ask notified part to check if the picked
> >    unmovable memory is available for locating kexec kernel;
>=20
> Yeah.

These may not be needed, please see below comment.

>=20
> >=20
> > Sounds doable to me, and not complicated.
> >=20
> >> images. It would apply to
> >>
> >> - arm64 and filter out all hotadded memory (IIRC, only boot memory can
> >>   be used).
> >=20
> > Do you mean hot added memory after boot can't be recognized and added
> > into system RAM on arm64?
>=20
> See patch #3 of this patch set, which wants to avoid placing kexec
> binaries on hotplugged memory. But I have no idea what the current plan
> regarding arm64 is (this thread exploded :) ).
>=20
> I would assume that we don't want to place kexec images on any
> hotplugged (or rather: hot(un)pluggable) memory - on any architecture.

Yes, noticed that and James replied to DaveY.

Later, when I was considering to make a draft patch to do the picking of
memory from normal zone, and add a notifier, as we discussed at above, I
suddenly realized that kexec_file_load doesn't have this issue. It
traverse system RAM bottom up to get an available region to put
kernel/initrd/boot_param, etc. I can't think of a system where its
low memory could be unavailable.
>=20
> >=20
> >=20
> >> - powerpc to filter out all LMBs that can be removed (assuming not all
> >>   memory corresponds to LMBs that can be removed, otherwise we're in
> >>   trouble ... :) )
> >> - virtio-mem to filter out all memory it added.
> >> - hyper-v to filter out partially backed memory blocks (esp. the last
> >>   memory block it added and only partially backed it by memory).
> >>
> >> This would make it work for kexec_file_load(), however, I do wonder ho=
w
> >> we would want to approach that from userspace kexec-tools when handlin=
g
> >> it from kexec_load().
> >=20
> > Let's make kexec_file_load work firstly. Since this work is only first
> > step to make kexec-ed kernel not break memory hotplug. After kexec
> > rebooting, the KASLR may locate kernel into hotpluggable area too.
>=20
> Can you elaborate how that would work?

Well, boot memory can be hotplugged or not after boot, they are marked
in uefi tables, the current kexec doesn't save and pass them into 2nd
kenrel, when kexec kernel bootup, it need read them and avoid them to
randomize kernel into.

