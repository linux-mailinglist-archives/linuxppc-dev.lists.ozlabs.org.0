Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F63E5AA63
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 13:24:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bWWD3GwLzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 21:24:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bWTN1LF1zDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 21:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45bWTL6bJsz9s3l;
 Sat, 29 Jun 2019 21:23:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>, Anju T Sudhakar <anju@linux.vnet.ibm.com>
Subject: Re: power9 NUMA crash while reading debugfs imc_cmd
In-Reply-To: <1561726853.5154.100.camel@lca.pw>
References: <1561670472.5154.98.camel@lca.pw>
 <87lfxms8r3.fsf@concordia.ellerman.id.au>
 <715A934D-EE3A-478B-BA77-589C539FC52D@lca.pw>
 <9c87dc72-54f8-8510-c400-1e89779cc88b@linux.vnet.ibm.com>
 <1561726853.5154.100.camel@lca.pw>
Date: Sat, 29 Jun 2019 21:22:53 +1000
Message-ID: <87ef3ck54i.fsf@concordia.ellerman.id.au>
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
Cc: Reza Arbab <arbab@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:
> On Fri, 2019-06-28 at 17:19 +0530, Anju T Sudhakar wrote:
>> On 6/28/19 9:04 AM, Qian Cai wrote:
>> >=20
>> > > On Jun 27, 2019, at 11:12 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>> > >=20
>> > > Qian Cai <cai@lca.pw> writes:
>> > > > Read of debugfs imc_cmd file for a memory-less node will trigger a=
 crash
>> > > > below
>> > > > on this power9 machine which has the following NUMA layout.
>> > >=20
>> > > What type of machine is it?
>> >=20
>> > description: PowerNV
>> > product: 8335-GTH (ibm,witherspoon)
>> > vendor: IBM
>> > width: 64 bits
>> > capabilities: smp powernv opal
>>=20
>>=20
>> Hi Qian Cai,
>>=20
>> Could you please try with this patch:=C2=A0
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/192803.html
>>=20
>> and see if the issue is resolved?
>
> It works fine.
>
> Just feel a bit silly that a node without CPU and memory is still online =
by
> default during boot at the first place on powerpc, but that is probably a
> different issue. For example,

Those are there to represent the memory on your attached GPUs. It's not
onlined by default.

I don't really love that they show up like that, but I think that's
working as expected.

cheers

> # numactl -H
> available: 6 nodes (0,8,252-255)
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 2=
3 24 25
> 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 5=
0 51 52
> 53 54 55 56 57 58 59 60 61 62 63
> node 0 size: 126801 MB
> node 0 free: 123199 MB
> node 8 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 =
84 85
> 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107=
 108
> 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 1=
27
> node 8 size: 130811 MB
> node 8 free: 128436 MB
> node 252 cpus:
> node 252 size: 0 MB
> node 252 free: 0 MB
> node 253 cpus:
> node 253 size: 0 MB
> node 253 free: 0 MB
> node 254 cpus:
> node 254 size: 0 MB
> node 254 free: 0 MB
> node 255 cpus:
> node 255 size: 0 MB
> node 255 free: 0 MB
> node distances:
> node=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A08=C2=A0=C2=A0252=C2=A0=C2=A0253=
=C2=A0=C2=A0254=C2=A0=C2=A0255=C2=A0
> =C2=A0 0:=C2=A0=C2=A010=C2=A0=C2=A040=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0 8:=C2=A0=C2=A040=C2=A0=C2=A010=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0252:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A010=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0253:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A010=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0254:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A010=C2=A0=C2=A080=C2=A0
> =C2=A0255:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A010=C2=A0
>
> # cat /sys/devices/system/node/online=C2=A0
> 0,8,252-255
