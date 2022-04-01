Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554F4EEB0A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 12:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVGF00CkHz3c1Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 21:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=AVMN0pLD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=AVMN0pLD; dkim-atps=neutral
X-Greylist: delayed 330 seconds by postgrey-1.36 at boromir;
 Fri, 01 Apr 2022 21:11:42 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVGDG4BK7z2xf9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 21:11:42 +1100 (AEDT)
Received: from zn.tnic (p2e55dff8.dip0.t-ipconnect.de [46.85.223.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 287B01EC04E0;
 Fri,  1 Apr 2022 12:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1648807558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=rYRUcibzVb3ckmbYqIdIxEGZb0sFcGrGt8Ae3WW1QWI=;
 b=AVMN0pLDq+zP9Hdb3zEYkqcplHcFnlplTK8v/knUSnFRt9KJuP33WV87y4fh6wbj76GMcH
 X1q/Wc3VuVGGnUrTyXMP2wW3JJjYAgiI/oF+QpIn0ZSY8cTgRUrtmXfllKQNBene6dmrSj
 yPx5XrzSpaYTe6EKfi9yVDcE2Mq4O+w=
Date: Fri, 1 Apr 2022 12:05:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/85xx: Remove fsl,85... bindings
Message-ID: <YkbOg4iLykg0gkKz@zn.tnic>
References: <82a8bc4450a4daee50ee5fada75621fecb3703ff.1648721299.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82a8bc4450a4daee50ee5fada75621fecb3703ff.1648721299.git.christophe.leroy@csgroup.eu>
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
Cc: devicetree@vger.kernel.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Robert Richter <rric@kernel.org>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 31, 2022 at 12:13:10PM +0200, Christophe Leroy wrote:
> Since commit 8a4ab218ef70 ("powerpc/85xx: Change deprecated binding
> for 85xx-based boards"), those bindings are not used anymore.
> 
> A comment in drivers/edac/mpc85xx_edac.c say they are to be removed
> with kernel 2.6.30.
> 
> Remove them now.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/memory-controllers/fsl/fsl,ddr.yaml   |  6 ------
>  .../devicetree/bindings/powerpc/fsl/l2cache.txt    |  6 ------
>  drivers/edac/mpc85xx_edac.c                        | 14 --------------
>  3 files changed, 26 deletions(-)


I'll take it through the EDAC tree of there are no objections.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
