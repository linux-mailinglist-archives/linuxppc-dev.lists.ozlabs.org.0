Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7FF8FEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 13:49:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C6yB5gR1zF1pY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 23:49:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C6rV1YW0zF3QL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 23:44:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="cPULhkSf"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47C6rT1WXSz9sNT;
 Tue, 12 Nov 2019 23:44:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573562665;
 bh=RUd68kxm240D9gUh61XMXgyLiDeb91CPvTcPzAdkZ1w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cPULhkSfUg/RtpCBZPljztB5e8oWJ97XWfWrWcPxrOurPiBEyaLBsSLrv/CKCeoAQ
 zHEqq0Pfs/vxMEOXxrN7P5U4mORRqF7fJc3jBsUN/my5IctesxQXwSq8f2YfsiMTXD
 ceReDVdWKapCRqpY6P+YCRyFqaMNEnX3TAeo39g3vg6ZlshNule71wJJSpgCecBwFx
 uQoCQyvuls63tXSNm2lJFpb3TM6F1v5pZl4mpBLJHjk1puctp2rDKUF5T6I5PlDCiJ
 0kR7h5SV0iWzlCZ7F66xpd+teAuVK1AWq2GMVWwXqoSAyfahQqDAnd2TR7TN0rYMha
 QU/J37r2V6zFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Prevent page fault issues in the machine
 crash handler
In-Reply-To: <20191031063100.3864-1-clg@kaod.org>
References: <20191031063100.3864-1-clg@kaod.org>
Date: Tue, 12 Nov 2019 23:44:24 +1100
Message-ID: <871rud2riv.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> When the machine crash handler is invoked, all interrupts are masked
> but interrupts which have not been started yet do not have an ESB page
> mapped in the Linux address space. This crashes the 'crash kexec'
> sequence on sPAPR guests.

This sounds like it needs a Fixes/stable tag?

I used these:

  Fixes: 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE inter=
rupt controller")
  Cc: stable@vger.kernel.org # v4.12+

Please tell me if you think that's wrong.

cheers


> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index df832b09e3e9..f5fadbd2533a 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1035,6 +1035,15 @@ static int xive_irq_alloc_data(unsigned int virq, =
irq_hw_number_t hw)
>  	xd->target =3D XIVE_INVALID_TARGET;
>  	irq_set_handler_data(virq, xd);
>=20=20
> +	/*
> +	 * Turn OFF by default the interrupt being mapped. A side
> +	 * effect of this check is the mapping the ESB page of the
> +	 * interrupt in the Linux address space. This prevents page
> +	 * fault issues in the crash handler which masks all
> +	 * interrupts.
> +	 */
> +	xive_esb_read(xd, XIVE_ESB_SET_PQ_01);
> +
>  	return 0;
>  }
>=20=20
> --=20
> 2.21.0
