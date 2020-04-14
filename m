Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7C1A82F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:36:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491qMx0lppzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:36:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TtIiQr/0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qBJ22kgzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:28:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586878082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=929N4Uaz3K3M/ZDt0dcZl9x31tqOtKQmEAdly5c0Mb8=;
 b=TtIiQr/0dEMvm6vpAH3l1GKJkSQ0FuJHPLVLjEgV0qYuhPBh3Kh6a9b/AzzAW+tbsLAgi1
 rHRoj15Txi/3P8rp14+kwkwE+gS14eDqw19bUTW6QlU6c6jvqFFDs0E/vd+bAFrmfv3PBW
 feDuxSF6BHKUocRTAJMXOeJ1K366GNI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4ZsjkL3sNK2MfIMDN5LHdg-1; Tue, 14 Apr 2020 11:28:00 -0400
X-MC-Unique: 4ZsjkL3sNK2MfIMDN5LHdg-1
Received: by mail-qk1-f200.google.com with SMTP id r129so5997232qkd.19
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 08:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fQl7E2J5Id3WK2U6l9dHkxOAqTFLollC0wE6NW6GpKc=;
 b=NKylkqfvR2ty8cw2ZUUn7jXzXgz3+pcag4zISIApwHfnn3Nx8L+Gj2WEKwy7kx3MHF
 gUnqfBO0d6aP19p3MUnVvNDTWyBsxz90xvHeoCyMtAC0SkVjCJFVxxFqn0sZOpjmsb8h
 bL+jHbuFB/umshkiLCajExeY8JHMF2IGYUCnnrzc6NkuI70In2YSr/sNIqnFol2g47UR
 4wMwgOmjh4W8wAskzp1XrLTdnNUHgCnF8SLBnHoLntzDNx1j6O6G0HKb8ONswsV52ADm
 p+ZvQRnNrMr+q2oThP2ynVXFX0wPgQOEnM8TSJznQ3i64YQEE7ZUcXDKHwgESn8GdWGB
 X5BA==
X-Gm-Message-State: AGi0Puai9C5Ul1qULzCAJRak4KxblGB8IsWUhd+Hp7iHgGMP+OAhaBYm
 h5+wdq2JEG7fkidyu9Mtel/S5Ap0SUdxWPtyJ4zI24I9uB8Y0rXFWkAd1jS421p7IcyvQ3Hxw0h
 m0bkVn1e9m/ZifeMAbifVluUA+g==
X-Received: by 2002:a05:620a:556:: with SMTP id
 o22mr9833547qko.166.1586878079982; 
 Tue, 14 Apr 2020 08:27:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypKi4fEpiHK//JOd6coi6+kBQGk2tK7VvXLiOPA/Nm1mgCzbzlmc1ysUQObBrefDJRDgHB3now==
X-Received: by 2002:a05:620a:556:: with SMTP id
 o22mr9833484qko.166.1586878079506; 
 Tue, 14 Apr 2020 08:27:59 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id w2sm4660953qtv.42.2020.04.14.08.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 08:27:58 -0700 (PDT)
Date: Tue, 14 Apr 2020 11:27:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v2 4/4] hugetlbfs: clean up command line processing
Message-ID: <20200414152756.GG38470@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-5-mike.kravetz@oracle.com>
 <20200410203730.GG3172@xz-x1>
 <ce42fa12-023b-7ed2-a60e-7dbf9c530981@oracle.com>
MIME-Version: 1.0
In-Reply-To: <ce42fa12-023b-7ed2-a60e-7dbf9c530981@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 10:59:26AM -0700, Mike Kravetz wrote:
> On 4/10/20 1:37 PM, Peter Xu wrote:
> > On Wed, Apr 01, 2020 at 11:38:19AM -0700, Mike Kravetz wrote:
> >> With all hugetlb page processing done in a single file clean up code.
> >> - Make code match desired semantics
> >>   - Update documentation with semantics
> >> - Make all warnings and errors messages start with 'HugeTLB:'.
> >> - Consistently name command line parsing routines.
> >> - Check for hugepages_supported() before processing parameters.
> >> - Add comments to code
> >>   - Describe some of the subtle interactions
> >>   - Describe semantics of command line arguments
> >>
> >> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> >> ---
> >>  .../admin-guide/kernel-parameters.txt         | 35 ++++---
> >>  Documentation/admin-guide/mm/hugetlbpage.rst  | 44 +++++++++
> >>  mm/hugetlb.c                                  | 96 +++++++++++++++---=
-
> >>  3 files changed, 142 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documen=
tation/admin-guide/kernel-parameters.txt
> >> index 1bd5454b5e5f..de653cfe1726 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -832,12 +832,15 @@
> >>  =09=09=09See also Documentation/networking/decnet.txt.
> >> =20
> >>  =09default_hugepagesz=3D
> >> -=09=09=09[same as hugepagesz=3D] The size of the default
> >> -=09=09=09HugeTLB page size. This is the size represented by
> >> -=09=09=09the legacy /proc/ hugepages APIs, used for SHM, and
> >> -=09=09=09default size when mounting hugetlbfs filesystems.
> >> -=09=09=09Defaults to the default architecture's huge page size
> >> -=09=09=09if not specified.
> >> +=09=09=09[HW] The size of the default HugeTLB page size. This
> >=20
> > Could I ask what's "HW"?  Sorry this is not a comment at all but
> > really a pure question I wanted to ask... :)
>=20
> kernel-parameters.rst includes kernel-parameters.txt and included the mea=
ning
> for these codes.
>=20
>        HW      Appropriate hardware is enabled.
>=20
> Previously, it listed an obsolete list of architectures.

I see. It was a bit confusing since hugepage is not a real hardware,
"CAP (capability)" might be easier, but I get the point now, thanks!

[...]

> >> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentat=
ion/admin-guide/mm/hugetlbpage.rst
> >> index 1cc0bc78d10e..de340c586995 100644
> >> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
> >> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
> >> @@ -100,6 +100,50 @@ with a huge page size selection parameter "hugepa=
gesz=3D<size>".  <size> must
> >>  be specified in bytes with optional scale suffix [kKmMgG].  The defau=
lt huge
> >>  page size may be selected with the "default_hugepagesz=3D<size>" boot=
 parameter.
> >> =20
> >> +Hugetlb boot command line parameter semantics
> >> +hugepagesz - Specify a huge page size.  Used in conjunction with huge=
pages
> >> +=09parameter to preallocate a number of huge pages of the specified
> >> +=09size.  Hence, hugepagesz and hugepages are typically specified in
> >> +=09pairs such as:
> >> +=09=09hugepagesz=3D2M hugepages=3D512
> >> +=09hugepagesz can only be specified once on the command line for a
> >> +=09specific huge page size.  Valid huge page sizes are architecture
> >> +=09dependent.
> >> +hugepages - Specify the number of huge pages to preallocate.  This ty=
pically
> >> +=09follows a valid hugepagesz parameter.  However, if hugepages is th=
e
> >> +=09first or only hugetlb command line parameter it specifies the numb=
er
> >> +=09of huge pages of default size to allocate.  The number of huge pag=
es
> >> +=09of default size specified in this manner can be overwritten by a
> >> +=09hugepagesz,hugepages parameter pair for the default size.
> >> +=09For example, on an architecture with 2M default huge page size:
> >> +=09=09hugepages=3D256 hugepagesz=3D2M hugepages=3D512
> >> +=09will result in 512 2M huge pages being allocated.  If a hugepages
> >> +=09parameter is preceded by an invalid hugepagesz parameter, it will
> >> +=09be ignored.
> >> +default_hugepagesz - Specify the default huge page size.  This parame=
ter can
> >> +=09only be specified once on the command line.  No other hugetlb comm=
and
> >> +=09line parameter is associated with default_hugepagesz.  Therefore, =
it
> >> +=09can appear anywhere on the command line.  If hugepages=3D is the f=
irst
> >> +=09hugetlb command line parameter, the specified number of huge pages
> >> +=09will apply to the default huge page size specified with
> >> +=09default_hugepagesz.  For example,
> >> +=09=09hugepages=3D512 default_hugepagesz=3D2M
> >=20
> > No strong opinion, but considering to the special case of gigantic
> > huge page mentioned below, I'm thinking maybe it's easier to just ask
> > the user to always use "hugepagesz=3DX hugepages=3DY" pair when people
> > want to reserve huge pages.
>=20
> We can ask people to do this.  However, I do not think we can force it at
> this time.  Why?  Mostly because I have seen many instances where people
> only specify 'hugepages=3DX' on the command line to preallocate X huge pa=
ges
> of default size.  So, forcing 'hugepagesz=3DX hugepages=3DY' would break =
those
> users.
>=20
> > For example, some user might start to use this after this series
> > legally:
> >=20
> >     default_hugepagesz=3D2M hugepages=3D1024
>=20
> Well, that 'works' today.  You get that silly error message:
>=20
> HugeTLB: unsupported default_hugepagesz 2097152. Reverting to 2097152
>=20
> But, it does preallocate 1024 huge pages of size 2M.  Because people
> have noticed the silly error message, I suspect this usage,
>=20
> =09default_hugepagesz=3DX hugepages=3DY
>=20
> is in use today and we need to support it.

Fair enough.

[...]

> >> @@ -3209,19 +3209,35 @@ static int __init hugetlb_init(void)
> >>  =09if (!hugepages_supported())
> >>  =09=09return 0;
> >> =20
> >> -=09if (!size_to_hstate(default_hstate_size)) {
> >> -=09=09if (default_hstate_size !=3D 0) {
> >> -=09=09=09pr_err("HugeTLB: unsupported default_hugepagesz %lu. Reverti=
ng to %lu\n",
> >> -=09=09=09       default_hstate_size, HPAGE_SIZE);
> >> -=09=09}
> >> -
> >> +=09/*
> >> +=09 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
> >> +=09 * architectures depend on setup being done here.
> >> +=09 *
> >> +=09 * If a valid default huge page size was specified on the command =
line,
> >> +=09 * add associated hstate if necessary.  If not, set default_hstate=
_size
> >> +=09 * to default size.  default_hstate_idx is used at runtime to iden=
tify
> >> +=09 * the default huge page size/hstate.
> >> +=09 */
> >> +=09hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
> >> +=09if (default_hstate_size)
> >> +=09=09hugetlb_add_hstate(ilog2(default_hstate_size) - PAGE_SHIFT);
> >> +=09else
> >>  =09=09default_hstate_size =3D HPAGE_SIZE;
> >> -=09=09hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
> >> -=09}
> >>  =09default_hstate_idx =3D hstate_index(size_to_hstate(default_hstate_=
size));
> >> +
> >> +=09/*
> >> +=09 * default_hstate_max_huge_pages !=3D 0 indicates a count (hugepag=
es=3D)
> >> +=09 * specified before a size (hugepagesz=3D).  Use this count for th=
e
> >> +=09 * default huge page size, unless a specific value was specified f=
or
> >> +=09 * this size in a hugepagesz/hugepages pair.
> >> +=09 */
> >>  =09if (default_hstate_max_huge_pages) {
> >=20
> > Since we're refactoring this - Could default_hstate_max_huge_pages be
> > dropped directly (in hugepages=3D we can create the default hstate, the=
n
> > we set max_huge_pages of the default hstate there)?  Or did I miss
> > anything important?
>=20
> I do not think that works for 'hugepages=3DX default_hugepagesz=3DY' proc=
essing?
> It seems like there will need to be more work done on default_hugepagesz
> processing.

That was really an awkward kernel cmdline... But I guess you're right.

I think it awkward because it can be also read in sequence as "reserve
X huge pages of default huge page size, then change default value to
Y".  So instead of awkward, maybe "ambiguous".  However I have totally
no clue on how to make this better either - there's really quite a lot
of freedom right now on specifying all these options right now.

Thanks,

--=20
Peter Xu

