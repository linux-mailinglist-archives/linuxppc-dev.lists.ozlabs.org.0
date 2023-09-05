Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3E79200E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 04:42:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZIOJMltw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfqYX4VZrz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 12:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZIOJMltw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfqXh2nnvz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 12:42:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693881732;
	bh=pxYavWyHIILBMbSvm/Pwfoqtu9hQU+mMItCWZbXAaZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZIOJMltwAk3J990XwhHwxDfrDGnM0Y02S+0T6etKu+GI+mVG+rzYd9kqbhCMrooX7
	 k8LTDPFBIXUHHbU1i0OKv3DO0Py5kxLDIM2WGfeBxUq9laOrZIbPRxkuIr0fBQ8Rni
	 Zer3H3VDG/9ztoD7PevZ5qh8PjN9s0p9qZeFQPqIyPiQ8EjSm8VsGs06Rj5nMVnO5I
	 3L/U/0TXS8gdT9XL9lFw+vYqqtfu8+fklpAhsEjc837ebAMMR+809z+5cn/sjRbK9s
	 I0vw0+cd/0teHdxAw1SU8YKs/WAxoORHAo87vfpAZvtafOitnGwEH1VkjrW9XLxFHN
	 x6pDWn/SZXVxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RfqXg61g5z4wb0;
	Tue,  5 Sep 2023 12:42:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Nathan Lynch
 <nathanl@linux.ibm.com>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
In-Reply-To: <20230904072037.GN8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz> <8734zz3hci.fsf@mail.lhotse>
 <20230831103811.GF8826@kitsune.suse.cz> <87r0nj1lzr.fsf@mail.lhotse>
 <20230831114431.GH8826@kitsune.suse.cz>
 <875y4vytxe.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20230904072037.GN8826@kitsune.suse.cz>
Date: Tue, 05 Sep 2023 12:42:11 +1000
Message-ID: <877cp5ibng.fsf@mail.lhotse>
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Thu, Aug 31, 2023 at 12:59:25PM -0500, Nathan Lynch wrote:
...
>> You (Michal) seem to favor a kernel-user ABI where user space is allowed
>> to invoke arbitrary RTAS functions by name. But we already have that in
>> the form of the rtas() syscall. (User space looks up function tokens by
>> name in the DT.) The point of the series is that we need to move away
>> from that. It's too low-level and user space has to use /dev/mem when
>> invoking any of the less-simple RTAS functions.
>
> We don't have that, directly accessing /dev/mem does not really work.
> And that's what needs fixing in my view.
>
> The rtas calls are all mechanically the same, the function implemented
> here should be able to call any of them if there was a way to specify
> the call.
>
> Given that there is desire to have access to multiple calls I don't
> think it makes sense to allocate a separate device with different name
> for each.

I think it does make sense.

We explicitly don't want a general "call any RTAS function" API.

We want tightly scoped APIs that do one thing, or a family of related
things, but not anything & everything.

Having different devices for each of those APIs means permissions can be
granted separately on those devices. So a user/group can be given access
to the "papr-vpd" device, but not some other unrelated device that also
happens to expose an RTAS service (eg. error injection).

cheers
