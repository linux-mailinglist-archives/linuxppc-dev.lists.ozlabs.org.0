Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDD488F02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 04:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXKXh3xCsz2yN4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:47:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZkBdaF0X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXKX25z8zz2xDg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 14:47:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZkBdaF0X; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JXKX14swqz4xdd;
 Mon, 10 Jan 2022 14:47:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1641786434;
 bh=LocqTwodVt/kEQFBOJj7f+zi/hSB5CLQZtSRLVFk1tE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZkBdaF0X/WBOyJ09Fjgh14uY1B9II8rI2zb8mSCwBYeJnuNEabENAtIWOc9SA8iNj
 F9L3KnZ+m609lxj/Seb/ldNDHGULzK7ftZi15Mb1RnjQqXIt2cm+rD9vnzY2gtViT0
 LNSznOChEZkcXrpkvoRYAN34F/+InBlW2Ydbv5UoJPuSU5Cqvmw1DM//ZA6DgPwPDz
 I8DJgzoy6JDDwDOeU/e+HSBtwK3ZFs+S3JZolggjwA07jcCBLKDqCSMZYBYNHHzWvI
 Nwh2hC7oya6m/n6uthyV7k6o0EL91rLiSBQI0sa0yPuw3RZPuJrH32N7OYbF8AoBmN
 QxmS3+CpG3Vdg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Borkmann <daniel@iogearbox.net>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH 00/13] powerpc/bpf: Some fixes and updates
In-Reply-To: <4893ddd3-f0ef-003b-3445-57ce5dc1b065@iogearbox.net>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <f4f3437d-084f-0858-8795-76e4a0fa5627@iogearbox.net>
 <1641540707.ewk8tpqmvl.naveen@linux.ibm.com>
 <4893ddd3-f0ef-003b-3445-57ce5dc1b065@iogearbox.net>
Date: Mon, 10 Jan 2022 14:47:12 +1100
Message-ID: <875yqs2qwv.fsf@mpe.ellerman.id.au>
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
Cc: ykaliuta@redhat.com, johan.almbladh@anyfinetworks.com,
 Jiri Olsa <jolsa@redhat.com>, song@kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Borkmann <daniel@iogearbox.net> writes:
> On 1/7/22 8:36 AM, Naveen N. Rao wrote:
>> Daniel Borkmann wrote:
>>> On 1/6/22 12:45 PM, Naveen N. Rao wrote:
>>>> A set of fixes and updates to powerpc BPF JIT:
>>>> - Patches 1-3 fix issues with the existing powerpc JIT and are tagged
>>>> =C2=A0=C2=A0 for -stable.
>>>> - Patch 4 fixes a build issue with bpf selftests on powerpc.
>>>> - Patches 5-9 handle some corner cases and make some small improvement=
s.
>>>> - Patches 10-13 optimize how function calls are handled in ppc64.
>>>>
>>>> Patches 7 and 8 were previously posted, and while patch 7 has no
>>>> changes, patch 8 has been reworked to handle BPF_EXIT differently.
>>>
>>> Is the plan to route these via ppc trees? Fwiw, patch 1 and 4 look gene=
ric
>>> and in general good to me, we could also take these two via bpf-next tr=
ee
>>> given outside of arch/powerpc/? Whichever works best.
>>=20
>> Yes, I would like to route this through the powerpc tree. Though patches=
 1 and 4 are generic, they primarily affect powerpc and I do not see confli=
cting changes in bpf-next. Request you to please ack those patches so that =
Michael can take it through the powerpc tree.
>
> Ok, works for me. I presume this will end up in the upcoming merge window
> anyway, so not too long time until we can sync these back to bpf/bpf-next
> trees then.

Hmm. This series landed a little late for me to get it into linux-next
before the merge window opened.

It's mostly small and includes some bug fixes, so I'm not saying it
needs to wait for the next merge window, but I would like it to get some
testing in linux-next before I ask Linus to pull it.

When would you need it all merged into Linus' tree in order to sync up
with the bpf tree for the next cycle? I assume as long as it's merged
before rc1 that would be sufficient?

cheers
