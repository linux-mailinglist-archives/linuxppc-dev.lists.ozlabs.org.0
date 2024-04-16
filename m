Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A27EE8A6A63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:11:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=HyR9y+hP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJjZF374Rz3vcs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 22:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=HyR9y+hP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 330 seconds by postgrey-1.37 at boromir; Tue, 16 Apr 2024 22:10:51 AEST
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJjYR4WXmz3dVq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 22:10:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713269442; x=1713874242; i=markus.elfring@web.de;
	bh=sw6GZmEfJHOtxMwjc0tAhb+KXK5KwEfpIepkP/GZl2g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HyR9y+hP5G9p0+arBUWoIC0xOqvu05XJTCxevOffkIhaVTUiaMJuNM+s1gg81t9f
	 cfS23Jox0CjCKaSUgQOVp3zFamld+zt0rInLrZOUUBkKYb4T71jSgO3Wruo7ok9gl
	 soEOYgLttUZMu+ZxYVtjJBx+DaPh77X7wZinJeK0DoMWs8RPqWpLUPBf6tELwg/57
	 uWvaaRl+ajgNjY/+G6J2aiGOoocEz13gAoMbWSmGfbfOxZjdzclZ2L+1/A1vElhqG
	 pzkDpb1cyFr1YFf5bPJsHzgXYD6ZTcdDi1uB3+LsmnVypA+kFhBCCjXSrQ1u5Z1ss
	 fE7DgQn9ocdMLjKq7A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFaui-1rxESE3P82-00H38p; Tue, 16
 Apr 2024 14:04:40 +0200
Message-ID: <d3818747-cb02-409f-99a0-7e8c1338b859@web.de>
Date: Tue, 16 Apr 2024 14:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
 <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de> <87plupbm0c.fsf@mail.lhotse>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87plupbm0c.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zKTayE+y3pYrRCZmB87Ixt/657oQ3H2YB0/2sGYhXb1MTtV8tUe
 /Ie+mZa7KKHvaoOkIUKwfc6FAzADz0rFlB5qsj3hUrVYvoigUOWDTZoWRRVyYoMTf8Z8Xed
 dOdN4nUMvdSGDJpS1cuy9DRYnuL237JWBZD1/wbwZoPnfILPLxJQ1hDa9dB3tLMeuG7A4Aq
 bOyXnIhDAh4k3xNmJdezw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ssEZ4LbHNOY=;txq0RqchH5kPdfjgpxuse9c5Md6
 5EXB2L+PLNfB8RRYRzvVobI+JOn/BnJNUKV9VTiXgMh2q8c3EHv+9KUUWzjTwSTbC6Ik9eda9
 WqN3WqSgt/uRKUd5TN+RWpXkOI1evgMExGJvRYEEkjnpX7+E62KPTQJ6cgqr58/nt5OwtnQKy
 h352PxrOnbrzUorsF+zab1L2xjsfTPwmDo3CklRZVfnzpGFxFGPqHqXoBjq4T3c7apbjVLmZ0
 5rVIrBAOnGzaX3Ccnz9q0CaaNZnCOsz0comTi1Pk9YsXQ4XewnCYu+q9fQNLZ1Q0MQfgdYGrT
 SXxpvixCw+6lVTbeRh3yvODJS41HuKZ6g3sicfjtTte+nimx9B2LsmoJS5xcoDZFx1DF45grm
 HuJvNKZ6qkyxe+qIE2Vr552ghmwkTWNvjwY2Z7u1gP/bf2/Z+/0xzzotL55L/e0+gVSo7fDUF
 NskrrXJz5scFc3WVTrXi0FilvKMpgYMSAY247+HC/v0mwzkSE6dw14Njd36kSkjJ1pUQFiuWc
 KeRhrF3QE/rwlQQo0dIEdYBsng91mMFv4ciftorZOJBJ37WPFTxdWNsYQ90gBte6PI5jwYW51
 TqMAeVTvhKWOveiJowoZzm/JB2F/wttn6vVTnQPB0rG+zRlTq0z37BL93Cox4Bbcs+Y2fNQY+
 SdCiZPG0qgUJ1vVcpyY1DBOtFb0uXpA4CrSgHnxDhYerhyEUpHIMAeG/bBBsBdmU94vWgo8hE
 YbG2MYEl3sE1jKapXWeGucMLYR1SHD4oLpNDJRbBoCr4yBFO+3QAbHm6iqpjU4zVktk/s1mPx
 ZXOOqVIwvFkGOzqMfdtblGdqQvJTjnBcB9if5FtSN/06Q=
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>   One function call less in vas_window_alloc() after error detection
>>
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1f1c21cf-c34c-4=
18c-b00c-8e6474f12612@web.de/
>
> It introduced a new goto and label to avoid a kfree(NULL) call, but
> kfree() explicitly accepts NULL and handles it. So it complicates the
> source code for no gain.

I proposed to avoid such a redundant function call for the affected
exception handling.


>>>   Return directly after a failed kasprintf() in map_paste_region()
>>
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/f46f04bc-613c-4=
e98-b602-4c5120556b09@web.de/
>
> Basically the same reasoning. And it also changes the function from
> having two return paths (success and error), to three.

See also a corresponding advice once more from the section =E2=80=9C7) Cen=
tralized exiting of functions=E2=80=9D:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.9-rc4#n532

Regards,
Markus
