Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147E1B3BDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 11:59:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496bWX1DylzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 19:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GEQtSyjl; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3y+TGTu; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496bTT6CYwzDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 19:57:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhx6+9/yUkF/nk4Uh0ZCbhmd6ofN3B1CpDeYalo2t0o=;
 b=GEQtSyjlpx6CAvWhJp2Ue7KO+p3rLYgJ6ddBCkIjYo9eCuzlekOIbTDa8uM7mSJKDGjx2K
 e8/AWy226xXMwcBEqzxwBeDRfb1c4ULAJ16fYXn6g73AYyw966JL96hZLXRDP0OXwusSeK
 RmFv/IgKVOcCfjm+ivf+qWRn6yOy8XI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhx6+9/yUkF/nk4Uh0ZCbhmd6ofN3B1CpDeYalo2t0o=;
 b=f3y+TGTu7XNIN/d9jAy5h1xQAVWgr3ogeJvtTuH6vn4OEWB8pp4LuuoNPr+dn1HMdBY9Jy
 Ovhk5XBHowovcsQfZsmgcdaRLG7Y6gl0HxQsYKz2EjFUxSi1bfUsDhyCDZDCUdGNd52WYJ
 +0Me5cBz5SpDZEs2FrhWvY3IO81IKlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-w_hNL0WFNgGM7SUHTWPx2A-1; Wed, 22 Apr 2020 05:57:42 -0400
X-MC-Unique: w_hNL0WFNgGM7SUHTWPx2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F71F8018A6;
 Wed, 22 Apr 2020 09:57:40 +0000 (UTC)
Received: from localhost (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A7655C553;
 Wed, 22 Apr 2020 09:57:36 +0000 (UTC)
Date: Wed, 22 Apr 2020 17:57:33 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
Message-ID: <20200422095733.GU4247@MiWiFi-R3L-srv>
References: <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
 <20200415023524.GG4247@MiWiFi-R3L-srv>
 <18cf6afd-c651-25c7-aca3-3ca3c0e07547@redhat.com>
 <20200416140247.GA12723@MiWiFi-R3L-srv>
 <4e1546eb-4416-dc6d-d549-62d1cecccbc8@redhat.com>
 <20200416143634.GH4247@MiWiFi-R3L-srv>
 <2525cc9c-3566-6275-105b-7f4af8f980bc@redhat.com>
 <9a4eb1d7-33bf-8707-9c0c-1ca657c3e502@redhat.com>
 <20200422091718.GT4247@MiWiFi-R3L-srv>
 <b9173744-6be4-5b41-d205-319542d821ba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b9173744-6be4-5b41-d205-319542d821ba@redhat.com>
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

On 04/22/20 at 11:24am, David Hildenbrand wrote:
> On 22.04.20 11:17, Baoquan He wrote:
> > On 04/21/20 at 03:29pm, David Hildenbrand wrote:
> >>>> ACPI SRAT is embeded into efi, need read out the rsdp pointer. If we=
 don't
> >>>> pass the efi, it won't get the SRAT table correctly, if I remember
> >>>> correctly. Yeah, I remeber kvm guest can get memory hotplugged with
> >>>> ACPI only, this won't happen on bare metal though. Need check carefu=
lly.=20
> >>>> I have been using kvm guest with uefi firmwire recently.
> >>>
> >>> Yeah, I can imagine that bare metal is different. kvm only uses ACPI.
> >>>
> >>> I'm also asking because of virtio-mem. Memory added via virtio-mem is
> >>> not part of any efi tables or whatsoever. So I assume the kexec kerne=
l
> >>> will not detect it automatically (good!), instead load the virtio-mem
> >>> driver and let it add memory back to the system.
> >>>
> >>> I should probably play with kexec and virtio-mem once I have some spa=
re
> >>> cycles ... to find out what's broken and needs to be addressed :)
> >>
> >> FWIW, I just gave virtio-mem and kexec/kdump a try.
> >>
> >> a) kdump seems to work. Memory added by virtio-mem is getting dumped.
> >> The kexec kernel only uses memory in the crash region. The virtio-mem
> >> driver properly bails out due to is_kdump_kernel().
> >=20
> > Right, kdump is not impacted later added memory.
> >=20
> >>
> >> b) "kexec -s -l" seems to work fine. For now, the kernel does not seem
> >> to get placed on virtio-mem memory (pure luck due to the left-to-right
> >> search). Memory added by virtio-mem is not getting added to the e820
> >> map. Once the virtio-mem driver comes back up in the kexec kernel, the
> >> right memory is readded.
> >=20
> > kexec_file_load just behaves as you tested. It doesn't collect later
> > added memory to e820 because it uses e820_table_kexec directly to pass
> > e820 to kexec-ed kernel. However, this e820_table_kexec is only updated
> > during boot stage. I tried hot adding DIMM after boot, kexec-ed kernel
> > doesn't have it in e820 during bootup, but it's recoginized and added
> > when ACPI scanning. I think we should update e820_table_kexec when hot
> > add/remove memory, at least for DIMM. Not sure if DLPAR, virtio-mem,
> > balloon will need be added into e820_table_kexec too, and if this is
> > expected behaviour.
> >=20
> > But whatever we do, it won't impact the kexec file_loading, because of
> > the searching strategy bottom up. Just adding them into e820_table_kexe=
c
> > will make it consistent with cold reboot which get recognizes and get
> > them into e820 during bootup.
>=20
> Yeah, I think whatever a cold-booted kernel will see is what kexec-ed
> kernel should see. Not more, not less.
>=20
> Regarding virtio-mem: Not in e820 on cold-boot.
> Regarding DIMMs: DIMMs under KVM will never show up in the e820 map
> IIRC. I think on real HW it can be different.

Yeah, DIMMs under KVM won't show up in e820 map. While this is not feature
of QEMU/KVM, but a defect of it. I ever asked Igor who is developer of
QEMU/KVM guest in this area, why we don't make kvm guest recognize
hotpluggable DIMM and add it into e820 map, he said he had tried to make
it, but this will corrupt guest on HyperV. So he had to revert the
commit on qemu. So I think we can leave it for now for both real HW and
kvm, or update the e820_table_kexec to include added DIMM for both real
HW and KVM. I hope one day KVM dev will find a way to conquer the defect
on HyperV and make the e820map consistent with bare metal. After all,
kvm guest is trying to imitate real HW for the most part.

Anyway, I will think about the e820_table_kexec updating. See if we can
do something about it.

