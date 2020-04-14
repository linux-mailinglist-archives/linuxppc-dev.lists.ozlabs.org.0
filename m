Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC99F1A819C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:12:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491pqq644PzDqnK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:12:07 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=b3jp1BBo; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491p6F561QzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 00:39:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586875170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/idUvfoYv2VU8/UVMnAUxrWOGWxXnFj8btY2BFSx64=;
 b=b3jp1BBoIuQjUeBG35cPsffRFkSyYXuIPbvjy+SET5A5hWE1L7VKSNk0si5mf+DcvaiTn2
 ij4o3AqNH8qwHYOhRK7dgVu4zVt150gsZwci+ZI5iuDLrdzeSdi59pPfbWyX190Rq/kQNR
 jpDk4kRDMelgr4CwUQh9C9y1UGAHihc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-C4q81SqnP3S1cTJDlpTPrA-1; Tue, 14 Apr 2020 10:39:22 -0400
X-MC-Unique: C4q81SqnP3S1cTJDlpTPrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BCA21005510;
 Tue, 14 Apr 2020 14:39:20 +0000 (UTC)
Received: from localhost (ovpn-12-105.pek2.redhat.com [10.72.12.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FCA711D2CE;
 Tue, 14 Apr 2020 14:39:15 +0000 (UTC)
Date: Tue, 14 Apr 2020 22:39:12 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
Message-ID: <20200414143912.GE4247@MiWiFi-R3L-srv>
References: <20200411093009.GH25745@shell.armlinux.org.uk>
 <20200412053507.GA4247@MiWiFi-R3L-srv>
 <20200412080836.GM25745@shell.armlinux.org.uk>
 <87wo6klbw0.fsf@x220.int.ebiederm.org>
 <20200413023701.GA20265@MiWiFi-R3L-srv>
 <871rorjzmc.fsf@x220.int.ebiederm.org>
 <20200414064031.GB4247@MiWiFi-R3L-srv>
 <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
 <20200414092201.GD4247@MiWiFi-R3L-srv>
 <ad060c8a-8afe-3858-0a4f-27ff54ef4c68@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ad060c8a-8afe-3858-0a4f-27ff54ef4c68@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 04/14/20 at 11:37am, David Hildenbrand wrote:
> On 14.04.20 11:22, Baoquan He wrote:
> > On 04/14/20 at 10:00am, David Hildenbrand wrote:
> >> On 14.04.20 08:40, Baoquan He wrote:
> >>> On 04/13/20 at 08:15am, Eric W. Biederman wrote:
> >>>> Baoquan He <bhe@redhat.com> writes:
> >>>>
> >>>>> On 04/12/20 at 02:52pm, Eric W. Biederman wrote:
> >>>>>>
> >>>>>> The only benefit of kexec_file_load is that it is simple enough fr=
om a
> >>>>>> kernel perspective that signatures can be checked.
> >>>>>
> >>>>> We don't have this restriction any more with below commit:
> >>>>>
> >>>>> commit 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC=
_SIG
> >>>>> and KEXEC_SIG_FORCE")
> >>>>>
> >>>>> With KEXEC_SIG_FORCE not set, we can use kexec_load_file to cover b=
oth
> >>>>> secure boot or legacy system for kexec/kdump. Being simple enough i=
s
> >>>>> enough to astract and convince us to use it instead. And kexec_file=
_load
> >>>>> has been in use for several years on systems with secure boot, sinc=
e
> >>>>> added in 2014, on x86_64.
> >>>>
> >>>> No.  Actaully kexec_file_load is the less capable interface, and les=
s
> >>>> flexible interface.  Which is why it is appropriate for signature
> >>>> verification.
> >>>
> >>> Well, everyone has a stance and the corresponding view. You could hav=
e
> >>> wider view from long time maintenance and in upstrem position, and th=
ink
> >>> kexec_file_load is horrible. But I can only see from our work as a fr=
ont
> >>> line engineer to maintain/develop kexec/kdump in RHEL, and think
> >>> kexec_file_load is easier to maintain.
> >>>
> >>> Surely except of multiple kernel image format support. No matter it i=
s
> >>> kexec_load and kexec_file_load, e.g in x86_64, we only support bzImag=
e.
> >>> This is produced from kerel building by default. We have no way to
> >>> support it in our distros and add it into kexec_file_load.
> >>>
> >>> [RFC PATCH] x86/boot: make ELF kernel multiboot-able
> >>> https://lkml.org/lkml/2017/2/15/654
> >>>
> >>>>
> >>>>>> kexec_load in every other respect is the more capable and function=
al
> >>>>>> interface.  It makes no sense to get rid of it.
> >>>>>>
> >>>>>> It does make sense to reload with a loaded kernel on memory hotplu=
g.
> >>>>>> That is simple and easy.  If we are going to handle something in t=
he
> >>>>>> kernel it should simple an automated unloading of the kernel on me=
mory
> >>>>>> hotplug.
> >>>>>>
> >>>>>>
> >>>>>> I think it would be irresponsible to deprecate kexec_load on any
> >>>>>> platform.
> >>>>>>
> >>>>>> I also suspect that kexec_file_load could be taught to copy the dt=
b
> >>>>>> on arm32 if someone wants to deal with signatures.
> >>>>>>
> >>>>>> We definitely can not even think of deprecating kexec_load until
> >>>>>> architecture that supports it also supports kexec_file_load and ev=
eryone
> >>>>>> is happy with that interface.  That is Linus's no regression rule.
> >>>>>
> >>>>> I should pick a milder word to express our tendency and tell our pl=
an
> >>>>> then 'obsolete'. Even though I added 'gradually', seems it doesn't =
help
> >>>>> much. I didn't mean to say 'deprecate' at all when replied.
> >>>>>
> >>>>> The situation and trend I understand about kexec_load and kexec_fil=
e_load
> >>>>> are:
> >>>>>
> >>>>> 1) Supporting kexec_file_load is suggested to add in ARCHes which d=
on't
> >>>>> have yet, just as x86_64, arm64 and s390 have done;
> >>>>> =20
> >>>>> 2) kexec_file_load is suggested to use, and take precedence over
> >>>>> kexec_load in the future, if both are supported in one ARCH.
> >>>>
> >>>> The deep problem is that kexec_file_load is distinctly less expressi=
ve
> >>>> than kexec_load.
> >>>>
> >>>>> 3) Kexec_load is kept being used by ARCHes w/o kexc_file_load suppo=
rt,
> >>>>> and by ARCHes for back compatibility w/ kexec_file_load support.
> >>>>>
> >>>>> For 1) and 2), I think the reason is obvious as Eric said,
> >>>>> kexec_file_load is simple enough. And currently, whenever we got a =
bug
> >>>>> report, we may need fix them twice, for kexec_load and kexec_file_l=
oad.
> >>>>> If kexec_file_load is made by default, e.g on x86_64, we will chang=
e it
> >>>>> in kernel space only, for kexec_file_load. This is what I meant abo=
ut
> >>>>> 'obsolete gradually'. I think for arm64, s390, they will do these t=
oo.
> >>>>> Unless there's some critical/blocker bug in kexec_load, to corrupt =
the
> >>>>> old kexec_load interface in old product.
> >>>>
> >>>> Maybe.  The code that kexec_file_load sucked into the kernel is quit=
e
> >>>> stable and rarely needs changes except during a port of kexec to
> >>>> another architecture.
> >>>>
> >>>> Last I looked the real maintenance effor of kexec and kexec on panic=
 was
> >>>> in the drivers.  So I don't think we can use maintenance to do anyth=
ing.
> >>>
> >>> Not sure if I got it. But if check Lianbo's patches, a lot of effort =
has
> >>> been taken to make SEV work well on kexec_file_load. And we have
> >>> switched to use kexec_file_load in the newly published  Fedora releas=
e
> >>> on x86_64 by default. Before this, Lianbo has investigated and done m=
any
> >>> experiments to make sure the switching is safe. We finally made this
> >>> decision. Next we will do the switch in Enterprise distros. Once thes=
e
> >>> are proved safe, we will suggest customers to use kexec_file_load for
> >>> kexec rebooting too. In the future, we will only care about
> >>> kexec_file_load if everying is going well. But as I have explained
> >>> repeatedly, only caring about kexec_file_load means we will leave
> >>> kexec_load as is, we will not add new feature or improvement patches
> >>> for it.
> >>>
> >>> commit 6a20bd54473e11011bf2b47efb52d0759d412854
> >>> Author: Lianbo Jiang <lijiang@redhat.com>
> >>> Date:   Thu Jan 16 13:47:35 2020 +0800
> >>>
> >>>     kdump-lib: switch to the kexec_file_load() syscall on x86_64 by d=
efault
> >>>
> >>>>
> >>>>> For 3), people can still use kexec_load and develop/fix for it, if =
no
> >>>>> kexec_file_load supported. But 32-bit arm should be a different one=
,
> >>>>> more like i386, we will leave it as is, and fix anything which coul=
d
> >>>>> break it. But people really expects to improve or add feature to it=
? E.g
> >>>>> in this patchset, the mem hotplug issue James raised, I assume Jame=
s is
> >>>>> focusing on arm64, x86_64, but not 32-bit arm. As DavidH commented =
in
> >>>>> another reply, people even don't agree to continue supporting memor=
y
> >>>>> hotplug on 32-bit system. We ever took effort to fix a memory hotpl=
ug
> >>>>> bug on i386 with a patch, but people would rather set it as BROKEN.
> >>>>
> >>>> For memory hotplug just reload.  Userspace already gets good events.
> >>>
> >>> Kexec_file_load is easy to maintain. This is an example.
> >>>
> >>> Lock the hotplug area where kexed-ed kernel is targeted in this patch=
set,
> >>> it's obviously not right. We can't disable memory hotplug just becaus=
e
> >>> kexec-ed kernel is loaded ahead of time.=20
> >>>
> >>> Reloading is also not a good fix. Kexec-ed kernel is targeted at a
> >>> movable area, reloading can avoid kexec rebooting corruption if that
> >>> area is hot removed. But if that area is not removed, locating kernel
> >>> into the hotpluggable area will change the area into ummovable zone.
> >>> Unless we decide to not support memory hotplug in kexec-ed kernel, I
> >>> guess it's very hard. Now in our distros kexec rebooting has been
> >>> supported, the big cloud providers are deploying linux in guest, bugs=
 on
> >>> kexec reboot failure has been reported. They need the memory hotplug =
to
> >>> increase/decrease memory.
> >>>
> >>> The root cause is kexec-ed kernel is targeted at hotpluggable memory
> >>> region. Just avoiding the movable area can fix it. In kexec_file_load=
(),
> >>> just checking or picking those unmovable region to put kernel/initrd =
in
> >>> function locate_mem_hole_callback() can fix it. The page or pageblock=
's
> >>> zone is movable or not, it's easy to know. This fix doesn't need to
> >>> bother other component.
> >>
> >> I don't fully agree. E.g., just because memory is onlined to ZONE_NORM=
AL
> >> does not imply that it cannot get offlined and removed e.g., this is
> >> heavily used on ppc64, with 16MB sections.
> >=20
> > Really? I just know there are two kinds of mem hoplug in ppc, but don't
> > know the details. So in this case, is there any flag or a way to know
> > those memory block are hotpluggable? I am curious how those kernel data
> > is avoided to be put in this area. Or ppc just freely uses it for kerne=
l
> > data or user space data, then try to migrate when hot remove?
>=20
> See
> arch/powerpc/platforms/pseries/hotplug-memory.c:dlpar_memory_remove_by_co=
unt()
>=20
> Under DLAPR, it can remove memory in LMB granularity, which is usually
> 16MB (=3D=3D single section on ppc64). DLPAR will directly online all
> hotplugged memory (LMBs) from the kernel using device_online(), which
> will go to ZONE_NORMAL.
>=20
> When trying to remove memory, it simply scans for offlineable 16MB
> memory blocks (=3D=3Dsection =3D=3D LMB), offlines and removes them. No n=
eed for
> the movable zone and all the involved issues.

Yes, this is a different one, thanks for pointing it out. It sounds like
balloon driver in virt platform, doesn't it?

Avoiding to put kexec kernel into movable zone can't solve this DLPAR
case as you said.

>=20
> Now, the interesting question is, can we have LMBs added during boot
> (not via add_memory()), that will later be removed via remove_memory().
> IIRC, we had BUGs related to that, so I think yes. If a section contains
> no unmovable allocations (after boot), it can get removed.

I do want to ask this question. If we can add LMB into system RAM, then
reload kexec can solve it.=20

Another better way is adding a common function to filter out the
movable zone when search position for kexec kernel, use a arch specific
funciton to filter out DLPAR memory blocks for ppc only. Over there,
we can simply use for_each_drmem_lmb() to do that.

