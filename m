Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66A92B3F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 11:35:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=he1zNqLl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJG7D0Yv2z3dDq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 19:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=he1zNqLl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJG6W5RcZz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 19:34:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6D3EACE0FB9;
	Tue,  9 Jul 2024 09:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F481C3277B;
	Tue,  9 Jul 2024 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517681;
	bh=P0Tg5HgvkrsbncakOIEEZ4alS4fkZKeRhddMQDXL43c=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=he1zNqLljVoU8atGAg/yb/t+komzyYSyUY+npj0LJK4bw+LtwG11R0MmXeAwmqJVN
	 Gq2dFw2iLKQw4byk3Jns1oIitgwh5VE3CeSemr9ul5IDq1N/fs8QPsVGGzHAXiL+gE
	 3UZnQ54m426HhEP1xEhMFfkflU9qC3krY+KILGS0EzD5qvw5SHqPlXOIOr8/jV1Gru
	 jYvW8eSkQPg/CJxlcbfxZBdTxpt89kvJ78Eed5vR6EsWNw7cxMdLNCnX4W53UCak3D
	 rCRrUuoCATcNZqAmlzOexTCha0d8M49L3Rot3QU4UoktF/cV4sVw3liGPk+RE6qkGp
	 QDJDM1x9covzQ==
Date: Tue, 09 Jul 2024 15:02:13 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: WARNING&Oops in v6.6.37 on ppc64lea - Trying to vfree() bad
 address (00000000453be747)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, matoro
	<matoro_mailinglist_kernel@matoro.tk>
References: <20240705203413.wbv2nw3747vjeibk@altlinux.org>
	<cf736c5e37489e7dc7ffd67b9de2ab47@matoro.tk>
	<2024070904-cod-bobcat-a0d0@gregkh>
In-Reply-To: <2024070904-cod-bobcat-a0d0@gregkh>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1720516964.n61e0dnv80.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: stable@vger.kernel.org, Vitaly Chikunov <vt@altlinux.org>, Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, ltp@lists.linux.it
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kroah-Hartman wrote:
> On Mon, Jul 08, 2024 at 11:16:48PM -0400, matoro wrote:
>> On 2024-07-05 16:34, Vitaly Chikunov wrote:
>> > Hi,
>> >=20
>> > There is new WARNING and Oops on ppc64le in v6.6.37 when running LTP t=
ests:
>> > bpf_prog01, bpf_prog02, bpf_prog04, bpf_prog05, prctl04. Logs excerpt
>> > below. I
>> > see there is 1 commit in v6.6.36..v6.6.37 with call to
>> > bpf_jit_binary_pack_finalize, backported from 5 patch mainline patchse=
t:
>> >=20
>> >   f99feda5684a powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|fr=
ee]
>> >=20

<snip>

>> >=20
>> > And so on. Temporary build/test log is at
>> > https://git.altlinux.org/tasks/352218/build/100/ppc64le/log
>> >=20
>> > Other stable/longterm branches or other architectures does not exhibit=
 this.
>> >=20
>> > Thanks,
>>=20
>> Hi all - this just took down a production server for me, on POWER9 bare
>> metal.  Not running tests, just booting normally, before services even c=
ame
>> up.  Had to perform manual restoration, reverting to 6.6.36 worked.  Als=
o
>> running 64k kernel, unsure if it's better on 4k kernel.
>>=20
>> In case it's helpful, here's the log from my boot:
>> https://dpaste.org/Gyxxg/raw
>=20
> Ok, this isn't good, something went wrong with my backports here.  Let
> me go revert them all and push out a new 6.6.y release right away.

I think the problem is that the series adding support for bpf prog_pack=20
was partially backported. In particular, the below patches are missing=20
from stable v6.6:
465cabc97b42 powerpc/code-patching: introduce patch_instructions()
033ffaf0af1f powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_p=
ack
6efc1675acb8 powerpc/bpf: implement bpf_arch_text_copy

It should be sufficient to revert commit f99feda5684a (powerpc/bpf: use=20
bpf_jit_binary_pack_[alloc|finalize|free]) to allow the above to apply=20
cleanly, followed by cherry picking commit 90d862f370b6 (powerpc/bpf:=20
use bpf_jit_binary_pack_[alloc|finalize|free]) from upstream.

Alternately, commit f99feda5684a (powerpc/bpf: use=20
bpf_jit_binary_pack_[alloc|finalize|free]) can be reverted.


- Naveen

