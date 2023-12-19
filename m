Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 172DB818193
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 07:34:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GHUNt1qM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvRk85RqNz3cST
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 17:34:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GHUNt1qM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvRjJ18Rhz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 17:33:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702967616;
	bh=R/lROIQ+DrOtwuEYqrniGOZ6zIfORHny9dL8QsDnOwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GHUNt1qM5TJLSUCcp4Z0csWIQa/ffReOZRkyC+IT6YdiUiwx7tKW7hS6iI6gC0h+7
	 B0Sj6omz+iMahV8P6Wzmc8DVGFBig6aB4mj4POnnpSwBPNg6xousZ2TAKQrkfcfETE
	 7RPH9xnxiVn46l0u+435mFv1IbDS1Hm95PiuAOdxAWcnMEvSxeFkH2d+dK/9t8wm65
	 yHFhLdKu4P1e0oE+fmCbZ7MeRwfyuobTIl8rmKHnwuf5Ab6MCTNIFRvQ0fkc+EjcKZ
	 AiRKRUk7TeMIdEXavNdigEluCe5PDHR/ham/6BPql32/rWR9yja1hbUsPsg9RogvDt
	 jmuWxSQWCB0RQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SvRjD0f6jz4wxx;
	Tue, 19 Dec 2023 17:33:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Luming Yu
 <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
In-Reply-To: <8734vzsw0q.fsf@kernel.org>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org>
Date: Tue, 19 Dec 2023 17:33:33 +1100
Message-ID: <8734vyn1ky.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> Luming Yu <luming.yu@shingroup.cn> writes:
>
>> Before we have powerpc to use the generic entry infrastructure,
>> the call to fire user return notifier is made temporarily in powerpc
>> entry code.
>>
>
> It is still not clear what will be registered as user return notifier.
> Can you summarize that here?

fire_user_return_notifiers() is defined in kernel/user-return-notifier.c

That's built when CONFIG_USER_RETURN_NOTIFIER=y.

That is not user selectable, it's only enabled by:

arch/x86/kvm/Kconfig:        select USER_RETURN_NOTIFIER

So it looks to me like (currently) it's always a nop and does nothing.

Which makes me wonder what the point of wiring this feature up is :)
Maybe it's needed for some other feature I don't know about?

Arguably we could just enable it because we can, and it currently does
nothing so it's unlikely to break anything. But that also makes it
impossible to test the implementation is correct, and runs the risk that
one day in the future when it does get enabled only then do we discover
it doesn't work.

cheers
