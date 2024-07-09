Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D8092B0D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 09:08:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fg6vl+ed;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJBsV1NLGz3dFm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 17:08:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fg6vl+ed;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJBrp4mH5z30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 17:07:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4A3661074;
	Tue,  9 Jul 2024 07:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA311C3277B;
	Tue,  9 Jul 2024 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720508855;
	bh=n3KjbNXBrD920Bv9YuVrjRmWR5+79F/h/abJmAqIJIc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=fg6vl+edF8ebJvcXKmZD+GZail+FnR+kTG/E8udsquNCITAUOHzdD6fEQAuNJAGYN
	 zawZgiNRwNTdNvICzQBgULXjFqmUYUoQ8+duJ8vaW1uRGlBAWUhk15WMg63oP3BVE+
	 kHKHE3XditVr1qpegB7cey1yQfxOyIQ5VTeseulghWs4HhX/v4zLDsGyyC/qmPMxnh
	 +5ZaxnNkn3tHpHBU3ZHcaKMdvFZCA2b1zGTJZFkbTDiwJnUPLvddv7SjS1CH98xHC8
	 zW0QuIDwL7ebzEzqpuo0WI8mUoFefCMQiYT6TQW75RMOQk/Abyex2tKin4MnnU416X
	 Hh6/7ZoQfDeVQ==
Date: Tue, 09 Jul 2024 12:28:29 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v3] PowerPC: Replace kretprobe with rethook
To: Abhishek Dubey <adubey@linux.ibm.com>, Masami Hiramatsu
	<mhiramat@kernel.org>
References: <20240627132101.405665-1-adubey@linux.ibm.com>
	<20240702085302.90ab3214b8b6e39614bb8d11@kernel.org>
In-Reply-To: <20240702085302.90ab3214b8b6e39614bb8d11@kernel.org>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1720508281.2dd5hnh2rv.naveen@kernel.org>
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masami Hiramatsu wrote:
> On Thu, 27 Jun 2024 09:21:01 -0400
> Abhishek Dubey <adubey@linux.ibm.com> wrote:
>=20
>> +/* rethook initializer */
>> +int __init arch_init_kprobes(void)
>> +{
>> +	return register_kprobe(&trampoline_p);
>> +}
>=20
> No, please don't use arch_init_kprobes() for initializing rethook, since
> rethook is used from fprobe too (at this moment).
>=20
> If you want to make it relays on kprobes, you have to make a dependency
> in powerpc's kconfig, e.g.
>=20
> select HAVE_RETHOOK if KPROBES
>=20
> But I don't recommend it.

Given that kretprobe has always worked this way on powerpc, I think this
is a fair tradeoff. We get to enable fprobes on powerpc only if kprobes
is also enabled.

Longer term, it would certainly be nice to get rid of that probe, and to
expand the trampoline to directly invoke the rethook callback.


Thanks,
Naveen
