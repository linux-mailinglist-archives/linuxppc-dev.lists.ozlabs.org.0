Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E2697B10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 12:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGxBw2SyRz3f2p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 22:47:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGxBJ6xsgz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 22:46:48 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGxBH56hqz4x7w;
	Wed, 15 Feb 2023 22:46:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGxBG64dGz4x5W;
	Wed, 15 Feb 2023 22:46:46 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, Stefan Berger
 <stefanb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Subject: Re: [PATCH v6 24/26] powerpc/pseries: Implement secvars for dynamic
 secure boot
In-Reply-To: <22172b58cd5353324d14b733aeac51e365597070.camel@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
 <20230210080401.345462-25-ajd@linux.ibm.com>
 <f35e9ba1-5fdb-4cfa-5b41-cc55307dcd45@linux.ibm.com>
 <87pmadvm0n.fsf@mpe.ellerman.id.au>
 <22172b58cd5353324d14b733aeac51e365597070.camel@linux.ibm.com>
Date: Wed, 15 Feb 2023 22:46:42 +1100
Message-ID: <87zg9f5exp.fsf@mpe.ellerman.id.au>
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On Mon, 2023-02-13 at 22:32 +1100, Michael Ellerman wrote:
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(&flags, data, size=
of(flags));
>> >=20
>> > conversion from bytestream to integer: I think in this case it
>> > would be better to use
>> >=20
>> > flags =3D cpu_to_be64p((__u64*)data);
>> >=20
>> > so that the flags always in hypervisor/big endian format
>>=20
>> I don't think it's correct to byte swap the flags here. They must be
>> in big endian format, but that's up to the caller.
>
> That was what I initially thought, until I went and tested it properly
> and found it was indeed broken (at least in our qemu environment, this
> is slightly tricky for me to test right now on real hardware with real
> PowerVM) depending on kernel endianness.
>
> - Userspace writes the flags into the buffer in BE order
>
> - The first 8 bytes of the buffer are memcpy()ed, in BE order, into
> flags (a u64)
>
> - plpar_hcall9() is called with flags as an argument, loaded into r9
>
> - r9 is moved to r8 before jumping into the hypervisor
>
> On a BE system, this works fine. On an LE system, this results in the
> bytes in the flags variable being loaded into the register in LE order,
> so the conversion is necessary.

Ah yep of course. So although the flags are written by userspace as part
of the data as a stream of bytes, they're passed to the HV via a
register.

I've had this patch in next for a few days and don't want to rebase it.
So can you send a follow-up patch to fix the flags endianess, with a
nice changelog and comment :)

cheers
