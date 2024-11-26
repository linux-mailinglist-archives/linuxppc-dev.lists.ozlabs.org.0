Return-Path: <linuxppc-dev+bounces-3557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6689D908C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 03:57:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy6h34RNFz2yRF;
	Tue, 26 Nov 2024 13:57:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732589875;
	cv=none; b=hRw+/+/3hhzqrOMOMesJf5CNdE+IjQ3oiOE17tbj9MxUPa9lf16Fdc6ZVAYJFbIvviYPfMsU6NWgWBxqSzzIM4LxPKt6FrqEB/M1eukCkCYu+1W2kbV1x8VX5alMQ35sQOp4pOLhHRBnjVhaQtQIMxEQD1b/dR9iHiMfcKBL/dZCH5CJ+eHM3LQlGfOYOzcEA7K9dk8UESFDTY59ZkA2o52DPmngtHcqN7Rk4xcWewuv4qeopvrc+Ge03vYJpI3UfmGJQDw21r6z07QcIJO7Cm6Wwnni+5jHJKIjrXIN16GO6HCF854Et1slJ+Hsn7va3OfOQlFrVeV3dx7T/v7bAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732589875; c=relaxed/relaxed;
	bh=kYITKr1RW0onW7Dxk5ftdG1Sh5lr/y0Q8flJr+qSg70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DDBLjSt1TLn9JYOpCBqgSAAuY40xV7effx3ELKI4MEkM1mBDR93woieFNbooWf9uED5BNcMpenN53tQmUUAjx2IMQED8KERzUEjrB1tExnY/8Msox5AJuvvGna0JLRnz3pAP7wtsfCilnqMqf6WrdTyBVe7YyQYqfwijsM+A6PoU/vOyQRy6Ctr9OlXUlx8H5TdCDoZnFOuVqOBePizxNLBanul8P2nF3zfrAkpibQzEqDTVgXEKkJfxcWpewTRUpspmD6tFWFmNPRSXNWxwVFC+1LukDxhGd6i1InCpj6FsavPSvcF+GKCFuasnyCMLP3ozCpa9ZmQs9uSzdehcuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S+ksIyi6; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S+ksIyi6;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xy6h268snz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 13:57:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732589871;
	bh=kYITKr1RW0onW7Dxk5ftdG1Sh5lr/y0Q8flJr+qSg70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S+ksIyi6MRPxig8HC3KGigDzKt4QNrVpZDjU3XDN1M7VpgwstPM87P70Ver2SwY7+
	 TtkB+z77sKWq/oM9qfPgpzILL9P4l7eTSdSszDDNGeU0ELqzBlu0rMJkzPrw5Pg85Q
	 HhHJtBjP7EWAvW4CsJo/gaU4beuCe9ZpdC2ZOs0m4t3QvgN0WKJm9W3KZmavnBXnsR
	 WXIZ/TbmdrDjWaGWtBYUf6iXMXaDWVe0WzkjZ9ljfCveL/wFLKTxCnOVCWJ7U51+ML
	 Yup98FSYWMxQiM/RHChOuf4FwZFbA0TjeOyzozD6vtiChVF6pXho2HP4wymVhLWLp9
	 pycWaKibCWU6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xy6gy3SSxz4wcT;
	Tue, 26 Nov 2024 13:57:50 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Yang Li
 <yang.lee@linux.alibaba.com>, npiggin@gmail.com, naveen@kernel.org,
 maddy@linux.ibm.com, Christoph Hellwig <hch@lst.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Abaci Robot
 <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] powerpc/machdep: Remove duplicated include in svm.c
In-Reply-To: <563bccb3-d9eb-4001-8c3e-6021c507f636@csgroup.eu>
References: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
 <87msibcmeb.fsf@mpe.ellerman.id.au>
 <563bccb3-d9eb-4001-8c3e-6021c507f636@csgroup.eu>
Date: Tue, 26 Nov 2024 13:57:42 +1100
Message-ID: <87v7wa7lcp.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 07/11/2024 =C3=A0 12:29, Michael Ellerman a =C3=A9crit=C2=A0:
>> Yang Li <yang.lee@linux.alibaba.com> writes:
>>> The header files linux/mem_encrypt.h is included twice in svm.c,
>>> so one inclusion of each can be removed.
>>>
>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D11750
>>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>>> ---
>>>   arch/powerpc/platforms/pseries/svm.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>=20
>> The two includes only appear in linux-next, and they both come from
>> different trees. They are required in each tree to avoid breaking the
>> build.
>>=20
>> So no one can merge this patch until the two trees are merged into mainl=
ine.
>
> That's in linus tree now

Yep thanks.

cheers

