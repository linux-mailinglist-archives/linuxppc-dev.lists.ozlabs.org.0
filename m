Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7439910702
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 12:35:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vFCX61CTzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 20:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vF8q0dF7zDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 20:32:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vF8m5zk3z9s9N;
 Wed,  1 May 2019 20:32:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/mpx: fix recursive munmap() corruption
In-Reply-To: <4e1bbb14-e14f-8643-2072-17b4cdef5326@linux.vnet.ibm.com>
References: <20190401141549.3F4721FE@viggo.jf.intel.com>
 <alpine.DEB.2.21.1904191248090.3174@nanos.tec.linutronix.de>
 <87d0lht1c0.fsf@concordia.ellerman.id.au>
 <6718ede2-1fcb-1a8f-a116-250eef6416c7@linux.vnet.ibm.com>
 <4f43d4d4-832d-37bc-be7f-da0da735bbec@intel.com>
 <4e1bbb14-e14f-8643-2072-17b4cdef5326@linux.vnet.ibm.com>
Date: Wed, 01 May 2019 20:32:55 +1000
Message-ID: <87k1faa2i0.fsf@concordia.ellerman.id.au>
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
Cc: mhocko@suse.com, rguenther@suse.de, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 luto@amacapital.net, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 vbabka@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.vnet.ibm.com> writes:
> Le 23/04/2019 =C3=A0 18:04, Dave Hansen a =C3=A9crit=C2=A0:
>> On 4/23/19 4:16 AM, Laurent Dufour wrote:
...
>>> There are 2 assumptions here:
>>>   1. 'start' and 'end' are page aligned (this is guaranteed by __do_mun=
map().
>>>   2. the VDSO is 1 page (this is guaranteed by the union vdso_data_stor=
e on powerpc)
>>=20
>> Are you sure about #2?  The 'vdso64_pages' variable seems rather
>> unnecessary if the VDSO is only 1 page. ;)
>
> Hum, not so sure now ;)
> I got confused, only the header is one page.
> The test is working as a best effort, and don't cover the case where=20
> only few pages inside the VDSO are unmmapped (start >=20
> mm->context.vdso_base). This is not what CRIU is doing and so this was=20
> enough for CRIU support.
>
> Michael, do you think there is a need to manage all the possibility=20
> here, since the only user is CRIU and unmapping the VDSO is not a so=20
> good idea for other processes ?

Couldn't we implement the semantic that if any part of the VDSO is
unmapped then vdso_base is set to zero? That should be fairly easy, eg:

	if (start < vdso_end && end >=3D mm->context.vdso_base)
		mm->context.vdso_base =3D 0;


We might need to add vdso_end to the mm->context, but that should be OK.

That seems like it would work for CRIU and make sense in general?

cheers
