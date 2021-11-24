Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753645B96E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 12:46:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzfNZ0xdrz3035
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 22:46:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G/etyyzT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G/etyyzT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=prudo@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=G/etyyzT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=G/etyyzT; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzdZn0vG1z2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 22:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637752203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADWToEtIWQw+24GlwPROw25DRFUtZ4xqccavANYkXhQ=;
 b=G/etyyzT2LxDpJgyYNoEUx1vtY0/ofG7n9iF4chGgivmivfAOqvB1RaqNX4ZvjEChFkvhm
 WKdqpawYYvJhGAybh8GL748Q+VktM0Cl+0+K4mWT2RObiZZSgMZ3bghjdT2lTMwBPG4Bcj
 Svyx+05bppsRwCUTcAW+JCsm2Zr+IVU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637752203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADWToEtIWQw+24GlwPROw25DRFUtZ4xqccavANYkXhQ=;
 b=G/etyyzT2LxDpJgyYNoEUx1vtY0/ofG7n9iF4chGgivmivfAOqvB1RaqNX4ZvjEChFkvhm
 WKdqpawYYvJhGAybh8GL748Q+VktM0Cl+0+K4mWT2RObiZZSgMZ3bghjdT2lTMwBPG4Bcj
 Svyx+05bppsRwCUTcAW+JCsm2Zr+IVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-vJVsBQwrPcihdPXc1AdfdA-1; Wed, 24 Nov 2021 06:09:59 -0500
X-MC-Unique: vJVsBQwrPcihdPXc1AdfdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3914EBAF81;
 Wed, 24 Nov 2021 11:09:57 +0000 (UTC)
Received: from rhtmp (unknown [10.39.192.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCC9219C46;
 Wed, 24 Nov 2021 11:09:52 +0000 (UTC)
Date: Wed, 24 Nov 2021 12:09:50 +0100
From: Philipp Rudo <prudo@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211124120950.57c10a9f@rhtmp>
In-Reply-To: <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
 <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
 <20211112083055.GA34414@kunlun.suse.cz>
 <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
 <20211116095343.GG34414@kunlun.suse.cz>
 <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
 <20211119111823.GC34414@kunlun.suse.cz>
 <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
Organization: Red Hat inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Wed, 24 Nov 2021 22:45:47 +1100
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Nayna <nayna@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 buendgen@de.ibm.com, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mimi,

On Fri, 19 Nov 2021 13:16:20 -0500
Mimi Zohar <zohar@linux.ibm.com> wrote:

> On Fri, 2021-11-19 at 12:18 +0100, Michal Such=C3=A1nek wrote:
> > Maybe I was not clear enough. If you happen to focus on an architecture
> > that supports IMA fully it's great.
> >=20
> > My point of view is maintaining multiple architectures. Both end users
> > and people conecerend with security are rarely familiar with
> > architecture specifics. Portability of documentation and debugging
> > instructions across architectures is a concern.
> >=20
> > IMA has large number of options with varying availablitily across
> > architectures for no apparent reason. The situation is complex and hard
> > to grasp. =20
>=20
> IMA measures, verifies, and audits the integrity of files based on a
> system wide policy.  The known "good" integrity value may be stored in
> the security.ima xattr or more recently as an appended signature.
>=20
> With both IMA kexec appraise and measurement policy rules, not only is
> the kernel image signature verified and the file hash included in the
> IMA measurement list, but the signature used to verify the integrity of
> the kexec kernel image is also included in the IMA measurement list
> (ima_template=3Dima-sig).
>=20
> Even without PECOFF support in IMA, IMA kexec measurement policy rules
> can be defined to supplement the KEXEC_SIG signature verfication.
>
> > In comparison the *_SIG options are widely available. The missing
> > support for KEXEC_SIG on POWER is trivial to add by cut&paste from s390.
> > With that all the documentation that exists already is also trivially
> > applicable to POWER. Any additional code cleanup is a bonus but not
> > really needed to enable the kexec lockdown on POWER. =20
>=20
> Before lockdown was upstreamed, Matthew made sure that IMA signature
> verification could co-exist.   Refer to commit 29d3c1c8dfe7 ("kexec:
> Allow kexec_file() with appropriate IMA policy when locked down").   If
> there is a problem with the downstream kexec lockdown patches, they
> should be fixed.
>=20
> The kexec kselftest might provide some insight into how the different
> signature verification methods and lockdown co-exist.
>=20
> As for adding KEXEC_SIG appended signature support on PowerPC based on
> the s390 code, it sounds reasonable.

Heiko contacted me as you apparently requested that someone from s390
takes part in this discussion. I now spend over a day trying to make
any sens from this discussion but failed. The way I see it is.

On one hand there is KEXEC_SIG which is specifically designed to verify
the signatures of kernel images in kexec_file_load. From the beginning
it was designed in a way that every architecture (in fact even every
image type) can define its own callback function as needed. It's design
is simple and easy to extend and thus was adopted by all architectures,
except ppc, so far.

On the other hand there is IMA which is much more general and also
includes the same functionality like KEXEC_SIG but only on some
architectures in some special cases and without proper documentation.

Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely on all
architectures using the same mechanism and thus reduce maintenance cost.
On the way there he even makes some absolutely reasonable improvements
for everybody.

Why is that so controversial? What is the real problem that should be
discussed here?

Thanks
Philipp

