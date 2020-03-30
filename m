Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C721972F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 06:10:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rJrl4WvdzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 15:09:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rJpv0r0nzDqBG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 15:08:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Zocas/Vn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48rJps2kKcz9sPF;
 Mon, 30 Mar 2020 15:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1585541302;
 bh=4LklNUeeFMyLVbYa8fYmKcp69TR6b5eexoc9ScGOfyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zocas/VnMI0Yq2+h0P+WXb7j8aCKussJrXDGL8/yLGvWifovRCrIlgJXhGBIN2SZK
 58q5nACvf00otQivjMDczJl1/qS3j3g0bhPF0sJr0YC7/p08Dvw3QqnJWh0oqLwNDp
 ndMPIEk+5QhCB9SoFPK7oQDcTAnrzAQbH70H0EQjOiA4+7wfWJvtHYYNWypWbQglBj
 ibenXkOktNMKUmo518Soj9GvXnCjI7HzFbgvRu9uadwpCPcNZ5ZKL6IcouKe3HJfCp
 +ELL7ljcepI0833Aeqp9MYo7GXR/OkZmfBZ0dCOeWJ03SLDMopFP/i0RQ8GNaFWVjF
 GeisJZAO3hfaA==
Date: Mon, 30 Mar 2020 15:08:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "H.J. Lu" <hjl.tools@gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200330150819.7f0199a2@canb.auug.org.au>
In-Reply-To: <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
References: <20200330143529.4dafeb34@canb.auug.org.au>
 <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ryc+xrSw9=HsrUjt4DZSlHK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/Ryc+xrSw9=HsrUjt4DZSlHK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi H.J.,

On Sun, 29 Mar 2020 20:53:42 -0700 "H.J. Lu" <hjl.tools@gmail.com> wrote:
>
> Please see my enclosing email.   Is anyone from PPC community reading ema=
ils?

What you really need is an Ack from the PowerPC people for the fix you
suggested and then tha fix should go in the same series that is now
causing the failure (preferably before the problematic (for PowerPC)
patch.

For reference, the change is (white space damaged):

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinu=
x.lds.S
index b4c89a1acebb..076b3e8a849d 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -365,9 +365,12 @@ SECTIONS
        DISCARDS
        /DISCARD/ : {
                *(*.EMB.apuinfo)
-               *(.glink .iplt .plt .rela* .comment)
+               *(.glink .iplt .plt .comment)
                *(.gnu.version*)
                *(.gnu.attributes)
                *(.eh_frame)
+#ifndef CONFIG_RELOCATABLE
+               *(.rela*)
+#endif
        }
 }

--=20
Cheers,
Stephen Rothwell

--Sig_/Ryc+xrSw9=HsrUjt4DZSlHK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BcLMACgkQAVBC80lX
0GwQPgf/UAJzJSpkJX3HeN7EVC2E7DRsnYnVlaR5TqipTOkpmflinpAU+ZvzCh+4
IID5+wHGLt30AwY/f9G4aq0TcvwyF5KD9YGpLOE5exgwXnDJYF3dNHuo1XlNOkYv
hdn+V84g1Ntoz+YdciL+RlvGdpQhJAiDTZK1PgUoQR8frt3VP/agZLwfJzLC8U9j
yCQj7scps5qauXHx9epiqb3pRmZIguHAWVsqY67KYN2+3nQT6T1APr4Uy6hqjkBK
p+PPomrOmFdnvbGsuxbEWIFgNqP2RXM4xOfm8wvEiTXcaIbXRI9PnfwaeWUxgDBE
T1l/9KoYxVURaM0mQOXLXR9P7CEMfw==
=uV8y
-----END PGP SIGNATURE-----

--Sig_/Ryc+xrSw9=HsrUjt4DZSlHK--
