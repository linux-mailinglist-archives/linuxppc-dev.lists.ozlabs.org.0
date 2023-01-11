Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FB665884
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 11:04:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsNZk3jNgz3fCq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 21:04:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
X-Greylist: delayed 66 seconds by postgrey-1.36 at boromir; Wed, 11 Jan 2023 21:04:16 AEDT
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsNZ85jTrz3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 21:04:16 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-234-ZV2WA3EvMAe4cAYuGqE3Sg-1; Wed, 11 Jan 2023 10:03:01 +0000
X-MC-Unique: ZV2WA3EvMAe4cAYuGqE3Sg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 11 Jan
 2023 10:02:57 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Wed, 11 Jan 2023 10:02:57 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ingo Molnar' <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: RE: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
Thread-Topic: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
Thread-Index: AQHZJaLQcQ36PXeL+0+vNNlIqTvBHa6Y+0jQ
Date: Wed, 11 Jan 2023 10:02:57 +0000
Message-ID: <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-9-surenb@google.com>
 <20230111001331.cxdeh52vvta6ok2p@offworld>
 <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz> <Y76HTfIeEt8ZOIH3@gmail.com>
In-Reply-To: <Y76HTfIeEt8ZOIH3@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, "leewalsh@google.com" <leewalsh@google.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "edumazet@google.com" <edumazet@google.com>, "jglisse@google.com" <jglisse@google.com>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "arjunroy@google.com" <arjunroy@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, "gurua@google.com" <gurua@google.com>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rientjes@google.com" <rientjes@google.com>, "axelrasmussen
 @google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "soheil@google.com" <soheil@google.com>, "minchan@google.com" <minchan@google.com>, "jannh@google.com" <jannh@google.com>, "liam.howlett@oracle.com" <liam.howlett@oracle.com>, "shakeelb@google.com" <shakeelb@google.com>, "luto@kernel.org" <luto@kernel.org>, "gthelen@google.com" <gthelen@google.com>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, Suren
 Baghdasaryan <surenb@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "posk@google.com" <posk@google.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "peterjung1337@gmail.com" <peterjung1337@gmail.com>, "mgorm an@techsingularity.net" <mgorman@techsingularity.net>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "hughlynch@google.com" <hughlynch@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "tatashin@google.com" <tatashin@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ingo Molnar
> Sent: 11 January 2023 09:54
>=20
> * Michal Hocko <mhocko@suse.com> wrote:
>=20
> > On Tue 10-01-23 16:44:42, Suren Baghdasaryan wrote:
> > > On Tue, Jan 10, 2023 at 4:39 PM Davidlohr Bueso <dave@stgolabs.net> w=
rote:
> > > >
> > > > On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
> > > >
> > > > >This configuration variable will be used to build the support for =
VMA
> > > > >locking during page fault handling.
> > > > >
> > > > >This is enabled by default on supported architectures with SMP and=
 MMU
> > > > >set.
> > > > >
> > > > >The architecture support is needed since the page fault handler is=
 called
> > > > >from the architecture's page faulting code which needs modificatio=
ns to
> > > > >handle faults under VMA lock.
> > > >
> > > > I don't think that per-vma locking should be something that is user=
-configurable.
> > > > It should just be depdendant on the arch. So maybe just remove CONF=
IG_PER_VMA_LOCK?
> > >
> > > Thanks for the suggestion! I would be happy to make that change if
> > > there are no objections. I think the only pushback might have been th=
e
> > > vma size increase but with the latest optimization in the last patch
> > > maybe that's less of an issue?
> >
> > Has vma size ever been a real problem? Sure there might be a lot of tho=
se
> > but your patch increases it by rwsem (without the last patch) which is
> > something like 40B on top of 136B vma so we are talking about 400B in
> > total which even with wild mapcount limits shouldn't really be
> > prohibitive. With a default map count limit we are talking about 2M
> > increase at most (per address space).
> >
> > Or are you aware of any specific usecases where vma size is a real
> > problem?
>=20
> 40 bytes for the rwsem, plus the patch also adds a 32-bit sequence counte=
r:
>=20
>   + int vm_lock_seq;
>   + struct rw_semaphore lock;
>=20
> So it's +44 bytes.

Depend in whether vm_lock_seq goes into a padding hole or not
it will be 40 or 48 bytes.

But if these structures are allocated individually (not an array)
then it depends on how may items kmalloc() fits into a page (or 2,4).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

