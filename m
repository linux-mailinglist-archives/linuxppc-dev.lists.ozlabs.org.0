Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E2187D765
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 00:45:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pxiLr+G9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxLTP3HWmz30h5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 10:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pxiLr+G9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxLSZ5VHbz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 10:44:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710546268;
	bh=DmvrUMNXUtpSZVzaitPWmDSNlpeFznZ95+rmUpDj/bk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pxiLr+G9wiG7ShCCGxO97nJBFeBRkNkYKBAmEE8oi7eDQyyASb3PwlGGzp405JCnD
	 QOOs2fOMa+QktpaFLnFJV1dGPT+UMeapeG08ZRLGmeGrs3r/R2/7xxtVYZh6ZMA6m7
	 PzVqUyA9ej9kCGsSTqzUcMxRCIFvVlyi9sPVUcJd7/YQ+RE7p2KADSiCi1iyj+eXxn
	 BrUMsmuRqyKEmfAIHa8X2efgR5B9RjkDMdDPVi/ltHJHb9bpe/nnqTnbZBBqWVJ1YL
	 nltG8fh3063WnK4ywUhQmftbcikNAktd0Lq9ABQu2vAXiv8Ehhb3LsGaMXY61BhT4D
	 dj9tVuTv980KA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TxLSW4Rr9z4wbr;
	Sat, 16 Mar 2024 10:44:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 dtsen@linux.ibm.com
Subject: Re: Cannot load wireguard module
In-Reply-To: <20240315122005.GG20665@kitsune.suse.cz>
References: <20240315122005.GG20665@kitsune.suse.cz>
Date: Sat, 16 Mar 2024 10:44:25 +1100
Message-ID: <87jzm32h7q.fsf@mail.lhotse>
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
Cc: netdev@vger.kernel.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> I cannot load the wireguard module.
>
> Loading the module provides no diagnostic other than 'No such device'.
>
> Please provide maningful diagnostics for loading software-only driver,
> clearly there is no particular device needed.

Presumably it's just bubbling up an -ENODEV from somewhere.

Can you get a trace of it?

Something like:

  # trace-cmd record -p function_graph -F modprobe wireguard

That should probably show where it's bailing out.

> jostaberry-1:~ # uname -a
> Linux jostaberry-1 6.8.0-lp155.8.g7e0e887-default #1 SMP Wed Mar 13 09:02=
:21 UTC 2024 (7e0e887) ppc64le ppc64le ppc64le GNU/Linux
> jostaberry-1:~ # modprobe wireguard
> modprobe: ERROR: could not insert 'wireguard': No such device
> jostaberry-1:~ # modprobe -v wireguard
> insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/cr=
ypto/chacha-p10-crypto.ko.zst=20
> modprobe: ERROR: could not insert 'wireguard': No such device
=20
What machine is this? A Power10?

cheers
