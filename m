Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 946F64A0AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:22:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SnK301v7zDqN6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:22:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SnC81XP0zDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:17:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45SnC6001Qz9s3l;
 Tue, 18 Jun 2019 22:17:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 1/6] mm: Section numbers use the type "unsigned long"
In-Reply-To: <20190617185757.b57402b465caff0cf6f85320@linux-foundation.org>
References: <20190614100114.311-1-david@redhat.com>
 <20190614100114.311-2-david@redhat.com>
 <20190614120036.00ae392e3f210e7bc9ec6960@linux-foundation.org>
 <701e8feb-cbf8-04c1-758c-046da9394ac1@c-s.fr>
 <20190617185757.b57402b465caff0cf6f85320@linux-foundation.org>
Date: Tue, 18 Jun 2019 22:17:19 +1000
Message-ID: <87pnnbozow.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.com>,
 Mel Gorman <mgorman@techsingularity.net>, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-acpi@vger.kernel.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Arun KS <arunks@codeaurora.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Dan Williams <dan.j.williams@intel.com>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Sat, 15 Jun 2019 10:06:54 +0200 Christophe Leroy <christophe.leroy@c-s=
.fr> wrote:
>> Le 14/06/2019 =C3=A0 21:00, Andrew Morton a =C3=A9crit=C2=A0:
>> > On Fri, 14 Jun 2019 12:01:09 +0200 David Hildenbrand <david@redhat.com=
> wrote:
>> >=20
>> >> We are using a mixture of "int" and "unsigned long". Let's make this
>> >> consistent by using "unsigned long" everywhere. We'll do the same with
>> >> memory block ids next.
>> >>
>> >> ...
>> >>
>> >> -	int i, ret, section_count =3D 0;
>> >> +	unsigned long i;
>> >>
>> >> ...
>> >>
>> >> -	unsigned int i;
>> >> +	unsigned long i;
>> >=20
>> > Maybe I did too much fortran back in the day, but I think the
>> > expectation is that a variable called "i" has type "int".
...
>> Codying style says the following, which makes full sense in my opinion:
>>=20
>> LOCAL variable names should be short, and to the point.  If you have
>> some random integer loop counter, it should probably be called ``i``.
>> Calling it ``loop_counter`` is non-productive, if there is no chance of =
it
>> being mis-understood.
>
> Well.  It did say "integer".  Calling an unsigned long `i' is flat out
> misleading.

I always thought `i` was for loop `index` not `integer`.

But I've never written any Fortran :)

cheers
