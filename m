Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4E767D17
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 10:11:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QSIFGoJV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCcf71yt9z3bVf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 18:11:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QSIFGoJV;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCcdF6fJxz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 18:10:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690618237;
	bh=K9Nu5Mur1VUu1WUTzSv/ImXqpeDJ9TPv/2LQQo1sYIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QSIFGoJV6H8Ihv2zIshooG1Ggr7zvlYF8ylzKx+wur+ekbenPmlijEx3jPFhzkdhM
	 +WKTT8VLXbmuYYd/PJWEg+yUmj0mu17Bg71e/2S7d5IcvAkxJSbVWxDPgZA19dQVUe
	 dQAIBM+a+DPt3E36gO3f1NUBcBy2L8L93lDQZieZH/SJGAa9s5OtVkqDuCFtC/lvM+
	 GQ2cBQh/jLQN0ubpN8Kzvln82vTJA4/Vf3reWUmaA4gf6LbOJfl2OlsjMLE1buEsLT
	 j7dn2oQowirDgwKXH77u2JlctB+7LT43oY/tnW+7Ajs06e+sKC6Encse0tnaGl2Wxr
	 gjZbR9n4rzgLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RCcd91fYnz4wb8;
	Sat, 29 Jul 2023 18:10:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
In-Reply-To: <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
References: <20230620131223.431281-1-omosnace@redhat.com>
 <87edkseqf8.fsf@mail.lhotse>
 <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
Date: Sat, 29 Jul 2023 18:10:36 +1000
Message-ID: <875y63dtoj.fsf@mail.lhotse>
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
Cc: selinux@vger.kernel.org, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Moore <paul@paul-moore.com>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ondrej Mosnacek <omosnace@redhat.com> writes:
> On Fri, Jul 28, 2023 at 4:12=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>> Ondrej Mosnacek <omosnace@redhat.com> writes:
>> > Currently, SELinux doesn't allow distinguishing between kernel threads
>> > and userspace processes that are started before the policy is first
>> > loaded - both get the label corresponding to the kernel SID. The only
>> > way a process that persists from early boot can get a meaningful label
>> > is by doing a voluntary dyntransition or re-executing itself.
>>
>> Hi,
>>
>> This commit breaks login for me when booting linux-next kernels with old
>> userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.
>>
>> The symptom is that login never accepts the root password, it just
>> always says "Login incorrect".
>>
>> Bisect points to this commit.
>>
>> Reverting this commit on top of next-20230726, fixes the problem
>> (ie. login works again).
>>
>> Booting with selinux=3D0 also fixes the problem.
>>
>> Is this expected? The change log below suggests backward compatibility
>> was considered, is 16.04 just too old?
>
> Hi Michael,
>
> I can reproduce it on Fedora 38 when I boot with SELINUX=3Ddisabled in
> /etc/selinux/config (+ a kernel including that commit), so it likely
> isn't caused by the userspace being old. Can you check what you have
> in /etc/selinux/config (or if it exists at all)?

Not sure if you still need it, but /etc/selinux/config doesn't exist in
the 16.04 image.

cheers
