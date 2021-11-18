Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556F4557EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 10:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvvSZ0bSSz2ymy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 20:21:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TliHOUG4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvvRx0dRkz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 20:21:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TliHOUG4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvvRv5Fhyz4xdM;
 Thu, 18 Nov 2021 20:21:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637227275;
 bh=uokLabTjJbZv3PCHYNnZVdqGpFZiJI4hbFjHQR1mDlE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TliHOUG4Lo/37oW2+f3vj5lsYuuOd/35jItNCFFT4i3byUmOqcYA0naBWMFD1E3FE
 MKGqeM0zxHze4uHTsEybjfOonPei0fpze486iHXlq/eEE25/SGSar0i+tmP3mMbFCv
 f4EZ+/XDwrCQUJF5Vy8hJa7yxhVhc0NfzvTKqD9YdH1ktwbWsLa15xNpAbwZLfUlnB
 NrV2a93mo1yA6g9cmmusmcJo3ST1V4sgmVYPHPS7cNLRmdmx/ukDZZ0ltYz75ALBvT
 9/GEH+Yb0lvyAtnOk/NydZoiwt9VXxkSfzGor3ZbRNyxD8y0GTevqn72TrvblxRtNb
 6v+5KR05ipJTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/11] powerpc/xive: Introduce xive_core_debugfs_create()
In-Reply-To: <20211105102636.1016378-5-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
 <20211105102636.1016378-5-clg@kaod.org>
Date: Thu, 18 Nov 2021 20:21:13 +1100
Message-ID: <87v90plsza.fsf@mpe.ellerman.id.au>
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> and fix some compile issues when !CONFIG_DEBUG_FS.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/common.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 3d558cad1f19..b71cc1020296 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
...
> @@ -1779,10 +1782,18 @@ static int xive_core_debug_show(struct seq_file *=
m, void *private)
>  }
>  DEFINE_SHOW_ATTRIBUTE(xive_core_debug);
>=20=20
> +static void xive_core_debugfs_create(void)
> +{
> +	debugfs_create_file("xive", 0400, arch_debugfs_dir,
> +			    NULL, &xive_core_debug_fops);
> +}
> +
> +#endif /* CONFIG_DEBUG_FS */
> +
>  int xive_core_debug_init(void)
>  {
> -	if (xive_enabled())
> -		debugfs_create_file("xive", 0400, arch_debugfs_dir,
> -				    NULL, &xive_core_debug_fops);
> +	if (xive_enabled() && IS_ENABLED(CONFIG_DEBUG_FS))
> +		xive_core_debugfs_create();
> +
>  	return 0;
>  }

For skiroot_defconfig this gives me:

  arch/powerpc/sysdev/xive/common.c: In function =E2=80=98xive_core_init=E2=
=80=99:
  arch/powerpc/sysdev/xive/common.c:1676:2: error: implicit declaration of =
function =E2=80=98xive_core_debugfs_create=E2=80=99; did you mean =E2=80=98=
xive_core_debug_init=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   1676 |  xive_core_debugfs_create();
        |  ^~~~~~~~~~~~~~~~~~~~~~~~
        |  xive_core_debug_init
  cc1: all warnings being treated as errors


We need an empty inline stub of xive_core_debugfs_create() for the
CONFIG_DEBUG_FS=3Dn case.

I'm wondering though why do we have xive_core_debug_init() at all, why
don't we just initialise the debugfs files in xive_core_init()?

cheers
