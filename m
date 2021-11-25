Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75645D6EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Bzd6nclz3c69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AcV1JAFY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hSwGBcl1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=prudo@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AcV1JAFY; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hSwGBcl1; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Byz0t2Rz2xX1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:14:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637831667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yh81UVE1ZYrhP/lMOWYxUubcBdiPdKo4kQjVZE8GRMQ=;
 b=AcV1JAFYoo7SkgzLlywjypFGm92ioyGbbh0jh0exxKsq263U93SCJRF8d+fGiVK8xfnhgz
 n/Kc74Vi0+xKVHc6Tbdcan9OBAB9eXx8MLIP/za5yHJr2qqGja6ot2rbgB0+yqlB+iRDQA
 /AUS1REZ6mix1TN06DjiWGIwHS06aYU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637831668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yh81UVE1ZYrhP/lMOWYxUubcBdiPdKo4kQjVZE8GRMQ=;
 b=hSwGBcl1l4s+MhVTq4SIGLBoot4IRE4ASOfaH5HBFvwVk8FQs1V7x8M3VDkV3zAgZZ9yjr
 MfZzIj0jmIsbGcjI30drUtieX8JrQS5jeTa3cgPX+2WZeyNbrhMGfFnfwmwLHQi1ALF7Fm
 22nSivk+yOitH8Y3V1fIyo/xWbtVYm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-OSWOpHYINU-U5tCWRwuWgA-1; Thu, 25 Nov 2021 04:14:24 -0500
X-MC-Unique: OSWOpHYINU-U5tCWRwuWgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E740805747;
 Thu, 25 Nov 2021 09:14:20 +0000 (UTC)
Received: from rhtmp (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F345D6B1;
 Thu, 25 Nov 2021 09:14:16 +0000 (UTC)
Date: Thu, 25 Nov 2021 10:14:12 +0100
From: Philipp Rudo <prudo@redhat.com>
To: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211125101412.25596ee2@rhtmp>
In-Reply-To: <20211124132716.GT34414@kunlun.suse.cz>
References: <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
 <20211112083055.GA34414@kunlun.suse.cz>
 <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
 <20211116095343.GG34414@kunlun.suse.cz>
 <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
 <20211119111823.GC34414@kunlun.suse.cz>
 <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
 <20211124120950.57c10a9f@rhtmp>
 <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
 <20211124132716.GT34414@kunlun.suse.cz>
Organization: Red Hat inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 buendgen@de.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Wed, 24 Nov 2021 14:27:16 +0100
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Wed, Nov 24, 2021 at 08:10:10AM -0500, Mimi Zohar wrote:
> > On Wed, 2021-11-24 at 12:09 +0100, Philipp Rudo wrote: =20
> > > Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely o=
n all
> > > architectures using the same mechanism and thus reduce maintenance co=
st.
> > > On the way there he even makes some absolutely reasonable improvements
> > > for everybody.
> > >=20
> > > Why is that so controversial? What is the real problem that should be
> > > discussed here? =20
> >=20
> > Nothing is controversial with what Michal wants to do.  I've already
> > said, "As for adding KEXEC_SIG appended signature support on PowerPC
> > based on the s390 code, it sounds reasonable." =20
>=20
> Ok, I will resend the series with the arch-specific changes first to be
> independent of the core cleanup.

could you please add the kexec@lists.infradead.org to Cc when you
resend the series. As this is kexec related I think it makes sense to
give them a heads up, too.

Thanks
Philipp

