Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF9F3D8A45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 11:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZSTq3MrRz3clg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 19:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir;
 Wed, 28 Jul 2021 19:06:51 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZSTR5MfVz306Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 19:06:51 +1000 (AEST)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFbiK-1mPiro3G0M-00H7tr for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul
 2021 11:01:34 +0200
Received: by mail-wr1-f54.google.com with SMTP id c16so1542758wrp.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 02:01:33 -0700 (PDT)
X-Gm-Message-State: AOAM532tV0CB1jFRUQPbOfTG7RwCVh/e7gOVJpAUs1MEam+jIGwzYYKS
 iwesgl32x5xgYD07rmE7BTXzaBpWNWF7Bg/j12I=
X-Google-Smtp-Source: ABdhPJzsTaVx3R8Xjt7RmEMRCOEETac71shB32aGf6LsvyM2QcF0PWl6f37f55OVAfeM0QRVKWrKMZbildTjD36IfgI=
X-Received: by 2002:adf:e107:: with SMTP id t7mr28823475wrz.165.1627462893205; 
 Wed, 28 Jul 2021 02:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210727131217.15092-1-xianting.tian@linux.alibaba.com>
 <CAK8P3a15ykABd61Rad5iaZtGN=-+Guk0CNyCMK3XD7TgubG7hg@mail.gmail.com>
 <be29127d-8cec-c7b8-ac96-4da94198dc03@linux.alibaba.com>
 <CAK8P3a1O02Ho2dM3F+bUXf9Ze8uRKYzY5fFmRGpszUXg_nrH4w@mail.gmail.com>
 <0d03a42b-b46c-408f-17a4-b6c094c0c29e@linux.alibaba.com>
In-Reply-To: <0d03a42b-b46c-408f-17a4-b6c094c0c29e@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 28 Jul 2021 11:01:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Hde16rbUPAwvtY7t+uE7C4jM8_pQCqTLj=-d4=T2MSg@mail.gmail.com>
Message-ID: <CAK8P3a2Hde16rbUPAwvtY7t+uE7C4jM8_pQCqTLj=-d4=T2MSg@mail.gmail.com>
Subject: Re: [PATCH] virtio-console: avoid DMA from vmalloc area
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nNSNYnNKGGmnlZQB9ey793CdflYFbEBS2mA3fq05NfL8TpgtFzj
 4/yYjrmMZVA3RHkyGVYg4xNFq6yUYAseveiu7mqAFYAzZ5DgkyrQnN7goi9Em/z2eOSEoHG
 iZuic9LdYbtxe4jBBoaVcSiU/So3a+paf1i/BoQViInZBjBmwxsG2Zpv1wAKZuBvd+PJpkL
 y38696P0JEBQvNI/VTMRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YGE8YNLk1Sw=:vT+aOEk8Qh/RW5SpkLaPaD
 sTSJz5SVvtRcmIrFCCJPxwsErrZmGx1RdUEx3nl9LGyY3NlPFSHXYSGEQUiKTQ0DjlcEUXDJy
 1iLsvU8+4FMbUzqcTiOhgH+K1ZzB7o6b/NKrhyUdcfuJD07G7CI9TYj4VDlRNn82mn2mPhctA
 dB+lk+BywLk5Uo5k965pH0In699nkAnBsnLfdzvQEz4fQ8q9eXBuFvZot/MEe027e4YTyTIvO
 miZPayhmAmQovitf17J27RvkRqCbVsQicECTFA9K8E+QGp9ssGlztNbrbeNl5JxmlDj0v92rN
 QfpptbOiQkiG+TqHpjuNbSfVVvqufzbs1tecMQ5j0Bf2bT9ODcDyRx+rER+77JQ5SJk7FENCI
 ak6Hh+4doV9XlGeR5mfM6t1hA2cHoeBt/LBpDeXiRBjQA6MPrYDAj/lMXwEehdARvE22FGUTV
 +yaJnD3/cdWyZDTSwI/9Rd85cMk4kzvt7/oWpdZeHe2/v1sf0GsNfA6biUDRdDzUMVTrjEOaG
 PUQZk5TLLavyzC28QPXfv6r6QJO8Rbqkcb5sVAsrn8EjmqmreA/n+TQPpvWaY4YaQGrWs+Oum
 TXi7GEvLeOifDCKNV0pN8AZkpVAfF0kOrw1o54fI9A9p1wZYGOnMWImIIq0Yt/FqiDwXGDAl1
 9/RU9FAtGSNn8xusQ3Nma3bpp8P7vVb+87N1bt/6quPrtyRSXDgpXD24AvVsmk05u4+3Zw+io
 kPN04IKcIpcx5lv0+d0E/FfseqKBvpdjkgxMb9iNGbzNyWb3nc6EwhElPufhOefq89XPmGMWB
 UlZ+fDWVjhuDzS/Szuhv2dZIAayaXKEQpWbIiFFI1WJeucjXI8hhrB3xryL/0zPA/98NFPO
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
Cc: Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>,
 gregkh <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Omar Sandoval <osandov@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 28, 2021 at 10:28 AM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
> =E5=9C=A8 2021/7/28 =E4=B8=8B=E5=8D=883:25, Arnd Bergmann =E5=86=99=E9=81=
=93:
>
> I checked several hvc backends, like drivers/tty/hvc/hvc_riscv_sbi.c,
> drivers/tty/hvc/hvc_iucv.c, drivers/tty/hvc/hvc_rtas.c, they don't use dm=
a.
>
> I not finished all hvc backends check yet. But I think even if all hvc
> backends don't use dma currently, it is still possible that the hvc
> backend using dma will be added in the furture.
>
> So I agree with you it should better be fixed in the hvc framework,
> solve the issue in the first place.

Ok, sounds good to me, no need to check more backends then.
I see the hvc-console driver is listed as 'Odd Fixes' in the maintainer
list, with nobody assigned other than the ppc kernel list (added to Cc).

Once you come up with a fix in hvc_console.c, please send that to the
tty maintainers, the ppc list and me, and I'll review it.

        Arnd
