Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8046D070
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 10:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8CGj4w2vz3c71
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 20:55:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KaqJZb0L;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X+MevUrU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=prudo@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KaqJZb0L; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=X+MevUrU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8CG22168z2yn2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 20:55:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638957315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbXsax9ldMWCPX0huGTH/ykVh4lOIdMfM3HnOVtd9Sg=;
 b=KaqJZb0LuY6NBB85KJKxRCDEGPQqTOzRRoqTS4G7LPBT4vm3WjnhZpcylNFngD8Qk8lY/S
 EFSjWOsmpTNDKDmsyIEgvlWacrolFfNc475yPA++v8uXc2YqqnJWD2VuJqKAQpMavLMhYx
 a74SJlBDVs5KGalvyVFVxXFNUCQF868=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638957316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbXsax9ldMWCPX0huGTH/ykVh4lOIdMfM3HnOVtd9Sg=;
 b=X+MevUrUIpSz/TFVO3MRs96NhmBShsaiIs4603iHsj5M6WUTT/wF6XuJ4n3QmHfj6lFCp+
 PmVSdMRXB0toDKVx4AWcc0S1s8jnm9V9+/EE4otBT3f7fwSUuydmGEzZ79cz2wLMlQvtxp
 YLh67+6xdDrP/mFNhLqGcyyTWP6NDRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-MBArii7hOAGNVhEwT_QDGA-1; Wed, 08 Dec 2021 04:55:12 -0500
X-MC-Unique: MBArii7hOAGNVhEwT_QDGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C4231023F4D;
 Wed,  8 Dec 2021 09:55:07 +0000 (UTC)
Received: from rhtmp (unknown [10.39.193.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1B142B178;
 Wed,  8 Dec 2021 09:54:57 +0000 (UTC)
Date: Wed, 8 Dec 2021 10:54:55 +0100
From: Philipp Rudo <prudo@redhat.com>
To: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH v2 0/6] KEXEC_SIG with appended signature
Message-ID: <20211208105455.00085532@rhtmp>
In-Reply-To: <20211207173221.GM117207@kunlun.suse.cz>
References: <cover.1637862358.git.msuchanek@suse.de>
 <20211207171014.2cfc4a54@rhtmp>
 <20211207173221.GM117207@kunlun.suse.cz>
Organization: Red Hat inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-crypto@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Frank van der Linden <fllinden@amazon.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, linux-security-module@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Tue, 7 Dec 2021 18:32:21 +0100
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Tue, Dec 07, 2021 at 05:10:14PM +0100, Philipp Rudo wrote:
> > Hi Michal,
> >=20
> > i finally had the time to take a closer look at the series. Except for
> > the nit in patch 4 and my personal preference in patch 6 the code looks
> > good to me.
> >=20
> > What I don't like are the commit messages on the first commits. In my
> > opinion they are so short that they are almost useless. For example in
> > patch 2 there is absolutely no explanation why you can simply copy the
> > s390 over to ppc. =20
>=20
> They use the same signature format. I suppose I can add a note saying
> that.

The note is what I was asking for. For me the commit message is an
important piece of documentation for other developers (or yourself in a
year). That's why in my opinion it's important to describe _why_ you do
something in it as you cannot get the _why_ by reading the code.

> > Or in patch 3 you are silently changing the error
> > code in kexec from EKEYREJECT to ENODATA. So I would appreciate it if =
=20
>=20
> Not sure what I should do about this. The different implementations use
> different random error codes, and when they are unified the error code
> clearly changes for one or the other.

My complaint wasn't that you change the return code. There's no way to
avoid choosing one over the other. It's again that you don't document
the change in the commit message for others.

> Does anything depend on a particular error code returned?

Not that I know of. At least in the kexec-tools ENODATA and EKEYREJECT
are handled the same way.

Thanks
Philipp


> Thanks
>=20
> Michal
>=20
> > you could improve them a little.
> >=20
> > Thanks
> > Philipp
> >=20
> > On Thu, 25 Nov 2021 19:02:38 +0100
> > Michal Suchanek <msuchanek@suse.de> wrote:
> >  =20
> > > Hello,
> > >=20
> > > This is resend of the KEXEC_SIG patchset.
> > >=20
> > > The first patch is new because it'a a cleanup that does not require a=
ny
> > > change to the module verification code.
> > >=20
> > > The second patch is the only one that is intended to change any
> > > functionality.
> > >=20
> > > The rest only deduplicates code but I did not receive any review on t=
hat
> > > part so I don't know if it's desirable as implemented.
> > >=20
> > > The first two patches can be applied separately without the rest.
> > >=20
> > > Thanks
> > >=20
> > > Michal
> > >=20
> > > Michal Suchanek (6):
> > >   s390/kexec_file: Don't opencode appended signature check.
> > >   powerpc/kexec_file: Add KEXEC_SIG support.
> > >   kexec_file: Don't opencode appended signature verification.
> > >   module: strip the signature marker in the verification function.
> > >   module: Use key_being_used_for for log messages in
> > >     verify_appended_signature
> > >   module: Move duplicate mod_check_sig users code to mod_parse_sig
> > >=20
> > >  arch/powerpc/Kconfig                     | 11 +++++
> > >  arch/powerpc/kexec/elf_64.c              | 14 ++++++
> > >  arch/s390/kernel/machine_kexec_file.c    | 42 ++----------------
> > >  crypto/asymmetric_keys/asymmetric_type.c |  1 +
> > >  include/linux/module_signature.h         |  1 +
> > >  include/linux/verification.h             |  4 ++
> > >  kernel/module-internal.h                 |  2 -
> > >  kernel/module.c                          | 12 +++--
> > >  kernel/module_signature.c                | 56 ++++++++++++++++++++++=
+-
> > >  kernel/module_signing.c                  | 33 +++++++-------
> > >  security/integrity/ima/ima_modsig.c      | 22 ++--------
> > >  11 files changed, 113 insertions(+), 85 deletions(-)
> > >  =20
> >  =20
>=20

