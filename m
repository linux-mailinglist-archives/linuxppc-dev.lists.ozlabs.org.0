Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38253D942
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 04:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LG0nt4WZhz3blp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 12:25:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
X-Greylist: delayed 2305 seconds by postgrey-1.36 at boromir; Sun, 05 Jun 2022 12:24:41 AEST
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LG0nP3df3z302N
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 12:24:41 +1000 (AEST)
Received: from [2601:449:8480:af0::de51]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <oss@buserror.net>)
	id 1nxfJ4-00D9V8-IG; Sat, 04 Jun 2022 20:43:54 -0500
Message-ID: <198e1080c142048ce6c8705a569fe0a0461e3682.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Masahiro Yamada <masahiroy@kernel.org>, Michael Ellerman
	 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Sat, 04 Jun 2022 20:43:53 -0500
In-Reply-To: <20220604085050.4078927-1-masahiroy@kernel.org>
References: <20220604085050.4078927-1-masahiroy@kernel.org>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0::de51
X-SA-Exim-Rcpt-To: masahiroy@kernel.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org, paulus@samba.org, christophe.leroy@csgroup.eu, diana.craciun@nxp.com, frank.rowand@sony.com, yanaijie@huawei.com, robh@kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [PATCH] powerpc: get rid of #include <generated/compile.h>
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: Rob Herring <robh@kernel.org>, Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org, Diana Craciun <diana.craciun@nxp.com>, Paul Mackerras <paulus@samba.org>, Frank Rowand <frank.rowand@sony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2022-06-04 at 17:50 +0900, Masahiro Yamada wrote:
> You cannot include <generated/compile.h> here because it is generated
> in init/Makefile but there is no guarantee that it happens before
> arch/powerpc/mm/nohash/kaslr_booke.c is compiled for parallel builds.
> 
> The places where you can reliably include <generated/compile.h> are:
> 
>   - init/          (because init/Makefile can specify the dependency)
>   - arch/*/boot/   (because it is compiled after vmlinux)
> 
> Commit f231e4333312 ("hexagon: get rid of #include <generated/compile.h>")
> fixed the last breakage at that time, but powerpc re-added this.
> 
> <genearated/compile.h> was unneeded because 'build_str' is almost the
> same as 'linux_banner' defined in init/version.c
> 
> Let's copy the solution from MIPS.
> (get_random_boot() in arch/mips/kernel/relocate.c)
> 
> Fixes: 6a38ea1d7b94 ("powerpc/fsl_booke/32: randomize the kernel image
> offset")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> If this gets into the mainline before -rc2 or -rc3,
> I will base my kbuild work on top of this.
> 
> 
>  arch/powerpc/mm/nohash/kaslr_booke.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Acked-by: Scott Wood <oss@buserror.net>

-Scott


