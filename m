Return-Path: <linuxppc-dev+bounces-9211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF2AD17D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 06:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFzXg0c5Lz2xgX;
	Mon,  9 Jun 2025 14:32:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749443522;
	cv=none; b=j4UbbOoJczEuDgkh68fCjS8T4fIwqB+ScAoAIn5JJ71FMH6O58vKg4ZUqtzepDAeg4SW5x5XJNX7KNd/eo1dGNCO+0AzxAW4/X/ei17aJ2681MzywTcewO6tfLZa47JCtf841OhgTRMmf/cNuRFBdHNMPYViE+1rLC7DGS8HO8G8yc2GIGw25MwCyS8ci8Z6HMIzlEZCbo72FzQhtO43czN0Men0vsOSdsTbQiqUcd7K1sXPiayZpv2Z/hsRGuE1b7uQ8/JeHavJooE3t1eVF2jS6udXKeWxdVQvpnhY7vCSwy6PoiC7Pp2LClfo2fjx8zgirLfvF7IIoA1qnByHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749443522; c=relaxed/relaxed;
	bh=AFjIMMuomt4wCKUVw0eh/280n2j/pJGyBO9kzI4Mr7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bs9lL+ZxjBiZQwfWI7R2772rnIbXZOG5PgdRse0dsqYIgH0HDQjs0gMgu4/fTqgff9FM6E20TDDSRgxPCoRkOH+lw7XGx+fwbRiubFhZNxTzoRmRuF+RAkJ5HOi8TKBdKpqEHeYiN15O6WGbX6xr9OznANMTbHuQH5OAQqC6z2W+2DIBASVqtAO8uUWR10T1OIHmUGCxQHTr5Ew8aWudwgQzkdoN8vp28/JT8UflICeBmRNEPd4MhyXWpTSSep4lWHFCzvLNwmDkxM+crd+9TVJuCKGmod9rRXRgnM9mc4RL5D16Xx2P9imYQPvtPhAs9KnZjIGPHfsBqoOb8o1xEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l+bvsY7y; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l+bvsY7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFzXd5Y2hz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 14:32:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2747160008
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 04:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04ABC4CEF5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 04:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443518;
	bh=AFjIMMuomt4wCKUVw0eh/280n2j/pJGyBO9kzI4Mr7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l+bvsY7yDcU3KO9V2w8OQ1kSmETYDFt5Vxm/3aj6Q6GfXaDr7Mq6teG0J0IiG8NLX
	 aYBmPNtqCsDKXLtIHohLvVlYNqWP+73TwjW5RVkwZBkx/94yaaslPO4Be47x5W6lNo
	 5CNCaeDlhxZFRbG4VpVczL49jsDXClh0pSdcz4Q5sc9gGWpyLdMQX7Xa+qSxyFq4Eu
	 AXcf1+F2OenCg6DyC1XYd1ZvutKYEK5tV5t0g7lWFwTm5yqvJgycrDADfqzKqO/x8i
	 s/IulpGvLukiEwPbPMkyxWTUcueS3669gBCG047bwG56iS9m3WqPmEEiLPUoLOk7e8
	 CQkAkvfnEaDXw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553331c3dc7so3897757e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jun 2025 21:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgn+aXGOwUZjloKEpq43gQ6hnwJo2IER87t7Cnhth3FOYQKY/8QgDE7Ly8HnwXC3N0n2/TKWeH9z7cLDo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9vkCS4qGlAer4yfRDjGNIPWgS0hfiexpvC73X/anURgBNN8NR
	fhACdVna/Q5klEDwKWFy/CVfTLly1EJZ/7xq60KARefZvphVHMOF/WmZ7/V43grmMTe2GR58nHc
	rAgzZ34Jlt3SIpEYo/cW+JBXwcDUIJh4=
X-Google-Smtp-Source: AGHT+IFxpU9h9vD+7+ej+rM8HurQ8p5BN3Eg3FHPZV+4WzLJl/wTSGT3OGmNsQs+kraXQvn/FjpYTTJeBoMFKa+XoLM=
X-Received: by 2002:a05:6512:3e0f:b0:553:252f:aded with SMTP id
 2adb3069b0e04-55366bd2438mr2572503e87.6.1749443517484; Sun, 08 Jun 2025
 21:31:57 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250607102005.1965409-1-masahiroy@kernel.org> <875xh5wx0f.fsf@mpe.ellerman.id.au>
In-Reply-To: <875xh5wx0f.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 13:31:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvDJ5-bywrxPoD4hkQp22r0kq_feHJu-S94yOR07jmQw@mail.gmail.com>
X-Gm-Features: AX0GCFtJ6Wfh0kBbQm_-oWzZtVI6SKBm2c6RqpLJ8pPh51aAiKhji_o2fYREqtY
Message-ID: <CAK7LNAQvDJ5-bywrxPoD4hkQp22r0kq_feHJu-S94yOR07jmQw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the
 same choice block
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 9, 2025 at 9:59=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> > choice block.
> >
> > I guess the intent is to display a different prompt depending on
> > CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> > endian, and "Generic (POWER8 and above)" for little endian.
>
> Yeah.
>
> > I stumbled on this tricky use case, and worked around it on Kconfig wit=
h
> > commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()")=
.
> > However, I doubt that supporting multiple entries with the same symbol
> > in a choice block is worth the complexity - this is the only such case
> > in the kernel tree.
> >
> > This commit merges the two entries. Once this cleanup is accepted in
> > the powerpc subsystem, I will proceed to refactor the Kconfig parser.
>
> OK. Sorry for the trouble.
>
> It could be split into two symbols to keep the separate prompts, but it's
> probably not worth the trouble.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

No rush for this patch.
Please take it to your ppc tree.
Thank you.


Best Regards
Masahiro Yamada

