Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62967623A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 22:40:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lGL8szh3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9TRg5123z3cTv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 06:39:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lGL8szh3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=timur@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9TQk57ytz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 06:39:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F009661901
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E975C433CA
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690317547;
	bh=QET1kSGbHT9obYvAR6+ezWstZZZY5nedbQpW/EoZHLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lGL8szh3f16nlAxMhqAeRBXGdPfmiWvmSvk70wiVPaJtjwG0Y4ZIglKeNOy7C4Qjd
	 YCH0f4tWS+/GjuRq+q6u33Uy0my1J4GxOtbzM0NSk4sZ3VU1piY5TP0k9lxO13kaEy
	 bJMtaAOi//iogTvWQaDJycD+wDasywhZ1vAg5CeSA4HfnUshndUS5zj/209TigJP7v
	 lLWNwEZTQrt9f8WPZ7ZhLJj8VBIuBZRx/W6Fpm4t0J7zdD4n43AIXABRU3oqBjIP41
	 tyzry1NfgciTmoM7Zxcmg0z1EGiOwUwMCrm834TulDU8A5uOMcprd3raRGyU8uVBkV
	 F62S76q7HfGRw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5221ee899a0so4904546a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 13:39:07 -0700 (PDT)
X-Gm-Message-State: ABy/qLZORKBuC9eO5xLuoZhfR6eh7aB3ZKh7qhU4wkVY5g4YGYDG3xMG
	OTPROEf1L6afuFr4ttoiRgVc/TkbNMozarG1eSo=
X-Google-Smtp-Source: APBJJlGwzLnxT4QG6DFKXKhAjWsyUsUauvgtUT9uqofHL7y5i0b4PYKutiowXKNr7qL4o9c8igFF4ENciofqpzURL7k=
X-Received: by 2002:a17:906:3f1e:b0:992:4d30:dc4a with SMTP id
 c30-20020a1709063f1e00b009924d30dc4amr12853186ejj.74.1690317545596; Tue, 25
 Jul 2023 13:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230724063341.28198-1-rdunlap@infradead.org>
In-Reply-To: <20230724063341.28198-1-rdunlap@infradead.org>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 25 Jul 2023 15:38:28 -0500
X-Gmail-Original-Message-ID: <CAOZdJXVuvVNzbyTLSiqRoSNdU0aprHoxozZzBahFUghqLvL2kw@mail.gmail.com>
Message-ID: <CAOZdJXVuvVNzbyTLSiqRoSNdU0aprHoxozZzBahFUghqLvL2kw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kumar Gala <galak@kernel.crashing.org>, Timur Tabi <timur@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 24, 2023 at 1:33=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Reconcile devices.txt with serial/ucc_uart.c regarding device number
> assignments. ucc_uart.c supports 4 ports and uses minor devnums
> 46-49, so update devices.txt with that info.
> Then update ucc_uart.c's reference to the location of the devices.txt
> list in the kernel source tree.
>
> Fixes: d7584ed2b994 ("[POWERPC] qe-uart: add support for Freescale QUICCE=
ngine UART")
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Timur Tabi <timur@kernel.org>
> Cc: Kumar Gala <galak@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: linux-serial@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org

Acked-by: Timur Tabi <timur@kernel.org>

One thing does concern me.  The UCC UART driver piggy-backs on the CPM
driver's layout (see cpm_uart.h), but apparently CPM UART supports 6
devices, not four:

#define UART_NR        fs_uart_nr

where fs_uart_nr is defined in enum fs_uart_id.

Unfortunately, it's been so long since I've touched this code, I'm not
sure whether this means anything.
