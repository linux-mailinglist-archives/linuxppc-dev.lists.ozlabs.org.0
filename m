Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B11A7745
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 11:24:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491g661QpjzDqJN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:23:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GKFvpm9a; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491g4C66pQzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 19:22:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586856135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXIBT8H4ofR+KqueB20e54Iz8V1B55rl8q1mclMVSFY=;
 b=GKFvpm9aMa8oDYdFWNlhGFPCKpya22eIzaYQbvxxxJ0cix8oAwmgwDWzbL0gf2EWvQZwOs
 0Pue6Nx/TlqkTzABLH/HgRmV3aDnYovPgu7M9k8TxwyLkJx9zXQiU8sAn2NVTPwTnPlykH
 n90kEDfVhJ123aQKi12TQB3XcCrstXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-HLzK-jCTPH-RCJ6lxxOPfg-1; Tue, 14 Apr 2020 05:22:10 -0400
X-MC-Unique: HLzK-jCTPH-RCJ6lxxOPfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 788AF107ACC4;
 Tue, 14 Apr 2020 09:22:08 +0000 (UTC)
Received: from localhost (ovpn-12-105.pek2.redhat.com [10.72.12.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BFDE96B93;
 Tue, 14 Apr 2020 09:22:04 +0000 (UTC)
Date: Tue, 14 Apr 2020 17:22:01 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
Message-ID: <20200414092201.GD4247@MiWiFi-R3L-srv>
References: <20200410121013.03b609fd572504c03a666f4a@linux-foundation.org>
 <20200411034414.GH2129@MiWiFi-R3L-srv>
 <20200411093009.GH25745@shell.armlinux.org.uk>
 <20200412053507.GA4247@MiWiFi-R3L-srv>
 <20200412080836.GM25745@shell.armlinux.org.uk>
 <87wo6klbw0.fsf@x220.int.ebiederm.org>
 <20200413023701.GA20265@MiWiFi-R3L-srv>
 <871rorjzmc.fsf@x220.int.ebiederm.org>
 <20200414064031.GB4247@MiWiFi-R3L-srv>
 <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
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

On 04/14/20 at 10:00am, David Hildenbrand wrote:
> On 14.04.20 08:40, Baoquan He wrote:
> > On 04/13/20 at 08:15am, Eric W. Biederman wrote:
> >> Baoquan He <bhe@redhat.com> writes:
> >>
> >>> On 04/12/20 at 02:52pm, Eric W. Biederman wrote:
> >>>>
> >>>> The only benefit of kexec_file_load is that it is simple enough from=
 a
> >>>> kernel perspective that signatures can be checked.
> >>>
> >>> We don't have this restriction any more with below commit:
> >>>
> >>> commit 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_S=
IG
> >>> and KEXEC_SIG_FORCE")
> >>>
> >>> With KEXEC_SIG_FORCE not set, we can use kexec_load_file to cover bot=
h
> >>> secure boot or legacy system for kexec/kdump. Being simple enough is
> >>> enough to astract and convince us to use it instead. And kexec_file_l=
oad
> >>> has been in use for several years on systems with secure boot, since
> >>> added in 2014, on x86_64.
> >>
> >> No.  Actaully kexec_file_load is the less capable interface, and less
> >> flexible interface.  Which is why it is appropriate for signature
> >> verification.
> >=20
> > Well, everyone has a stance and the corresponding view. You could have
> > wider view from long time maintenance and in upstrem position, and thin=
k
> > kexec_file_load is horrible. But I can only see from our work as a fron=
t
> > line engineer to maintain/develop kexec/kdump in RHEL, and think
> > kexec_file_load is easier to maintain.
> >=20
> > Surely except of multiple kernel image format support. No matter it is
> > kexec_load and kexec_file_load, e.g in x86_64, we only support bzImage.
> > This is produced from kerel building by default. We have no way to
> > support it in our distros and add it into kexec_file_load.
> >=20
> > [RFC PATCH] x86/boot: make ELF kernel multiboot-able
> > https://lkml.org/lkml/2017/2/15/654
> >=20
> >>
> >>>> kexec_load in every other respect is the more capable and functional
> >>>> interface.  It makes no sense to get rid of it.
> >>>>
> >>>> It does make sense to reload with a loaded kernel on memory hotplug.
> >>>> That is simple and easy.  If we are going to handle something in the
> >>>> kernel it should simple an automated unloading of the kernel on memo=
ry
> >>>> hotplug.
> >>>>
> >>>>
> >>>> I think it would be irresponsible to deprecate kexec_load on any
> >>>> platform.
> >>>>
> >>>> I also suspect that kexec_file_load could be taught to copy the dtb
> >>>> on arm32 if someone wants to deal with signatures.
> >>>>
> >>>> We definitely can not even think of deprecating kexec_load until
> >>>> architecture that supports it also supports kexec_file_load and ever=
yone
> >>>> is happy with that interface.  That is Linus's no regression rule.
> >>>
> >>> I should pick a milder word to express our tendency and tell our plan
> >>> then 'obsolete'. Even though I added 'gradually', seems it doesn't he=
lp
> >>> much. I didn't mean to say 'deprecate' at all when replied.
> >>>
> >>> The situation and trend I understand about kexec_load and kexec_file_=
load
> >>> are:
> >>>
> >>> 1) Supporting kexec_file_load is suggested to add in ARCHes which don=
't
> >>> have yet, just as x86_64, arm64 and s390 have done;
> >>> =20
> >>> 2) kexec_file_load is suggested to use, and take precedence over
> >>> kexec_load in the future, if both are supported in one ARCH.
> >>
> >> The deep problem is that kexec_file_load is distinctly less expressive
> >> than kexec_load.
> >>
> >>> 3) Kexec_load is kept being used by ARCHes w/o kexc_file_load support=
,
> >>> and by ARCHes for back compatibility w/ kexec_file_load support.
> >>>
> >>> For 1) and 2), I think the reason is obvious as Eric said,
> >>> kexec_file_load is simple enough. And currently, whenever we got a bu=
g
> >>> report, we may need fix them twice, for kexec_load and kexec_file_loa=
d.
> >>> If kexec_file_load is made by default, e.g on x86_64, we will change =
it
> >>> in kernel space only, for kexec_file_load. This is what I meant about
> >>> 'obsolete gradually'. I think for arm64, s390, they will do these too=
.
> >>> Unless there's some critical/blocker bug in kexec_load, to corrupt th=
e
> >>> old kexec_load interface in old product.
> >>
> >> Maybe.  The code that kexec_file_load sucked into the kernel is quite
> >> stable and rarely needs changes except during a port of kexec to
> >> another architecture.
> >>
> >> Last I looked the real maintenance effor of kexec and kexec on panic w=
as
> >> in the drivers.  So I don't think we can use maintenance to do anythin=
g.
> >=20
> > Not sure if I got it. But if check Lianbo's patches, a lot of effort ha=
s
> > been taken to make SEV work well on kexec_file_load. And we have
> > switched to use kexec_file_load in the newly published  Fedora release
> > on x86_64 by default. Before this, Lianbo has investigated and done man=
y
> > experiments to make sure the switching is safe. We finally made this
> > decision. Next we will do the switch in Enterprise distros. Once these
> > are proved safe, we will suggest customers to use kexec_file_load for
> > kexec rebooting too. In the future, we will only care about
> > kexec_file_load if everying is going well. But as I have explained
> > repeatedly, only caring about kexec_file_load means we will leave
> > kexec_load as is, we will not add new feature or improvement patches
> > for it.
> >=20
> > commit 6a20bd54473e11011bf2b47efb52d0759d412854
> > Author: Lianbo Jiang <lijiang@redhat.com>
> > Date:   Thu Jan 16 13:47:35 2020 +0800
> >=20
> >     kdump-lib: switch to the kexec_file_load() syscall on x86_64 by def=
ault
> >=20
> >>
> >>> For 3), people can still use kexec_load and develop/fix for it, if no
> >>> kexec_file_load supported. But 32-bit arm should be a different one,
> >>> more like i386, we will leave it as is, and fix anything which could
> >>> break it. But people really expects to improve or add feature to it? =
E.g
> >>> in this patchset, the mem hotplug issue James raised, I assume James =
is
> >>> focusing on arm64, x86_64, but not 32-bit arm. As DavidH commented in
> >>> another reply, people even don't agree to continue supporting memory
> >>> hotplug on 32-bit system. We ever took effort to fix a memory hotplug
> >>> bug on i386 with a patch, but people would rather set it as BROKEN.
> >>
> >> For memory hotplug just reload.  Userspace already gets good events.
> >=20
> > Kexec_file_load is easy to maintain. This is an example.
> >=20
> > Lock the hotplug area where kexed-ed kernel is targeted in this patchse=
t,
> > it's obviously not right. We can't disable memory hotplug just because
> > kexec-ed kernel is loaded ahead of time.=20
> >=20
> > Reloading is also not a good fix. Kexec-ed kernel is targeted at a
> > movable area, reloading can avoid kexec rebooting corruption if that
> > area is hot removed. But if that area is not removed, locating kernel
> > into the hotpluggable area will change the area into ummovable zone.
> > Unless we decide to not support memory hotplug in kexec-ed kernel, I
> > guess it's very hard. Now in our distros kexec rebooting has been
> > supported, the big cloud providers are deploying linux in guest, bugs o=
n
> > kexec reboot failure has been reported. They need the memory hotplug to
> > increase/decrease memory.
> >=20
> > The root cause is kexec-ed kernel is targeted at hotpluggable memory
> > region. Just avoiding the movable area can fix it. In kexec_file_load()=
,
> > just checking or picking those unmovable region to put kernel/initrd in
> > function locate_mem_hole_callback() can fix it. The page or pageblock's
> > zone is movable or not, it's easy to know. This fix doesn't need to
> > bother other component.
>=20
> I don't fully agree. E.g., just because memory is onlined to ZONE_NORMAL
> does not imply that it cannot get offlined and removed e.g., this is
> heavily used on ppc64, with 16MB sections.

Really? I just know there are two kinds of mem hoplug in ppc, but don't
know the details. So in this case, is there any flag or a way to know
those memory block are hotpluggable? I am curious how those kernel data
is avoided to be put in this area. Or ppc just freely uses it for kernel
data or user space data, then try to migrate when hot remove?

