Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 117267178A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 09:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWLzK54npz3fCK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 17:50:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=wEOslFOP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fjasle.eu (client-ip=212.227.17.10; helo=mout.kundenserver.de; envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=wEOslFOP;
	dkim-atps=neutral
X-Greylist: delayed 633 seconds by postgrey-1.36 at boromir; Wed, 31 May 2023 17:49:46 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWLyL2hKWz3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 17:49:27 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.48.214]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0X0U-1qG8Jq33SO-00wVdq; Wed, 31 May 2023 09:29:30 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 16F453E7CB; Wed, 31 May 2023 09:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1685518165; bh=HpS8LrsnY/89NscygVkPsEBgTNTbHKpEGmsUMP/4T6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wEOslFOPWf2p08nC8zApP5Rcoc6tiv/v6ERy4dGWcUUWrmTuj6q11wGLLkqqrj706
	 WLz0JzJsYSw/tI8bK5P97oE2bMKPLd3buMdXXfQ2Qr59505Ib/EfH3BZx9F1loHHxU
	 zTbg1mJTFRQv59eeJ32gfP9BJgg0wxr3D571i3Bg=
Date: Wed, 31 May 2023 09:29:24 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 RESEND] soc/fsl/qe: fix usb.c build errors
Message-ID: <ZHb3VD4OgqDd2oKR@fjasle.eu>
References: <20230521225216.21795-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230521225216.21795-1-rdunlap@infradead.org>
X-Provags-ID: V03:K1:7aNwyNIJJGSwsSWIPPBCoqlbrWM1lrCsSwYfhj+nxprnIqzghd8
 j/UnBB7xn4z/O3bMZdwCnwu+sllhHuHQ67c9LORIPuBxHfh00uZ5KUPq/5MpX+jjxwUJMAJ
 Y6C00Sq4tZuCPiz6F1aURO30MU18l/y9gyUYnLTRdQvdQFteOKGecgPvTCZxvy6ZWMI0Rl2
 2TGI7d6XRMv9fuzxYZKJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bt27j1T/A2k=;6FcZHhHiDY4t8wzkR4In7P9Exzh
 5Dspe3MZ0WIyYylYinjZGjEjuEtx2+A2vl+8EJ21bR9/xktrWE2phprYeJ0pp9Wv2m06zKoMW
 Mbgsfwf4g3ghTk9l4ZvWar9a6OZoLfgBCqeuvPXIqU9IQTIQc3FWCsaFuuUtwVMD6YoQbdNGO
 BqG17DiLb8m+UrfEE2ptMgm5kfEkisbDvViMbnKuZ+5P4PxTfDMacvcTVIIv4vYDxbJCbISlf
 /7PQ2bSjXwZfAsRjrcVIUg5RzMiAhXILEXXPwFoBkHhW6/STmf+eOnc+DfryqNeCu1MdVZmrF
 juAB2qbSSukvr3HElio3fu82cReQhP4NYl2u0UpNAWs2B2qSnt0Hf7T+1FddPfwHejWCKMGrz
 ZWZadK8uLXRB9n2fYvlDcr/koGuL5ZdFbC97gL3CYcx+bullCxBP9X1ZfDgIiN8sEODkexVGp
 hNhWg/AO+yAGqn11ZM9qxRpe3ffpVh+oZL2K7NEsxDLi0/+7aPUjAgHSPRcbIgERco5PFhrZ8
 lziMDoGAxmuKl7c4vyet+91YsY5/D/6x6Ov7x20t7D5j/a1fluyi5POPtJ9+0KCL1slkXLDqA
 AW3CJ+ywxsX6EWdXy/gVXfVKDu1SRd9qTqReiHAdw2y1elge8ZWD2OcEiVQk3hl6qO4k7uZms
 Zy1/kHTanYyOhYPibIndBCtpkQZyPzSaPB9nljCU+Q==
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
Cc: Kumar Gala <galak@kernel.crashing.org>, kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 21, 2023 at 03:52:16PM -0700 Randy Dunlap wrote:
> Fix build errors in soc/fsl/qe/usb.c when QUICC_ENGINE is not set.
> This happens when PPC_EP88XC is set, which selects CPM1 & CPM.
> When CPM is set, USB_FSL_QE can be set without QUICC_ENGINE
> being set. When USB_FSL_QE is set, QE_USB deafults to y, which
> causes build errors when QUICC_ENGINE is not set. Making
> QE_USB depend on QUICC_ENGINE prevents QE_USB from defaulting to y.
> 
> Fixes these build errors:
> 
> drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
> usb.c:(.text+0x1e): undefined reference to `qe_immr'
> powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to `qe_immr'
> powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to `qe_setbrg'
> powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to `cmxgcr_lock'
> powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to `cmxgcr_lock'
> 
> Fixes: 5e41486c408e ("powerpc/QE: add support for QE USB clocks routing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202301101500.pillNv6R-lkp@intel.com/
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Leo Li <leoyang.li@nxp.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Kumar Gala <galak@kernel.crashing.org>
> ---

I can reproduce the build error and confirm the build dependency fix (but I
have no hardware for testing).

Acked-by: Nicolas Schier <nicolas@jasle.eu>



> v2: drop Anton Vorontsov <avorontsov@ru.mvista.com>; rebase/resend
> 
>  drivers/soc/fsl/qe/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -62,6 +62,7 @@ config QE_TDM
>  
>  config QE_USB
>  	bool
> +	depends on QUICC_ENGINE
>  	default y if USB_FSL_QE
>  	help
>  	  QE USB Controller support

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
