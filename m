Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62612732F61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:04:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQayLtCO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGWM1fjXz3bng
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:04:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQayLtCO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGVS1ZDcz304M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:03:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FC6162134;
	Fri, 16 Jun 2023 11:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B03CC433C8;
	Fri, 16 Jun 2023 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686913404;
	bh=K3lFwyOnVKe+TMdTvX27i4bzBi+CYkU0SDSmg004bso=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=dQayLtCOyPqzP2H1hF4KitPWW/+uNGDZJ1aD7SYu4gFeE3ZHAtwwiBdB/B87hZrKG
	 YDZ5KkNAP8/lXLyFDd5YkbSyhVqw+JqmEPc+7ZvoKlpZLca9X+eYIkbIFLirZqvAnt
	 KIa/Mu/ZJh+wh34K+cvjlQ0CvGvGSF+R5MApYS8ZcnTmFLc7vRwEwRxNB+1BXmv3xN
	 YjxGPq/P8G+rnYxYNiZaE1bcyh+8nrsPxLXcRZXufcNwF5SxX3AiQ+RwOetQvww38G
	 K+AOoh0b115OU+XpyuX6Ozj2Z3fMb1zxTOUq9nQWKcGvA3jxKD89QNj7f+eh8Uj+jE
	 yMEYM5KMxRqUw==
Date: Fri, 16 Jun 2023 16:28:53 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: ppc64le vmlinuz is huge when building with BTF
To: Alan Maguire <alan.maguire@oracle.com>, Dominique Martinet
	<asmadeus@codewreck.org>
References: <ZIqGSJDaZObKjLnN@codewreck.org> <ZIrONqGJeATpbg3Y@krava>
	<ZIr7aaVpOaP8HjbZ@codewreck.org>
	<6b26dfef-016c-43df-07f5-c2f88157d1dc@oracle.com>
	<ZIt11crcIjfyeygA@codewreck.org>
In-Reply-To: <ZIt11crcIjfyeygA@codewreck.org>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1686912543.c6zqyw5s4x.naveen@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>, dwarves@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Cc linuxppc-dev]

Dominique Martinet wrote:
>=20
> Alan Maguire wrote on Thu, Jun 15, 2023 at 03:31:49PM +0100:
>> However the problem I suspect is this:
>>=20
>>  51 .debug_info   0a488b55  0000000000000000  0000000000000000  026f8d20
>>  2**0
>>                   CONTENTS, READONLY, DEBUGGING
>> [...]
>>=20
>> The debug info hasn't been stripped, so I suspect the packaging spec
>> file or equivalent - in perhaps trying to preserve the .BTF section -
>> is preserving debug info too. DWARF needs to be there at BTF
>> generation time in vmlinux but is usually stripped for non-debug
>> packages.
>=20
> Thanks Alan and Eduard!
> I guess I should have checked that first, it helps.
>=20
> We're not stripping anything in vmlinuz for other archs -- the linker
> script already should be including only the bare minimum to decompress
> itself (+compressed useful bits), so I guess it's a Kbuild issue for the
> arch.

For a related discussion, see:
http://lore.kernel.org/CAK18DXZKs2PNmLndeGYqkPxmrrBR=3D6ca3bhyYCj=3DGhyA7dH=
fAQ@mail.gmail.com

> We can add a strip but I unfortunately have no way of testing ppc build,
> I'll ask around the build linux-kbuild and linuxppc-dev lists if that's
> expected; it shouldn't be that bad now that's figured out.

Stripping vmlinux would indeed be the way to go. As mentioned in the=20
above link, fedora also packages a strip'ed vmlinux for ppc64le:
https://src.fedoraproject.org/rpms/kernel/blob/4af17bffde7a1eca9ab164e5de0e=
391c277998a4/f/kernel.spec#_1797


- Naveen

