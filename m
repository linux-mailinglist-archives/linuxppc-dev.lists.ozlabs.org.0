Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B9B18FD8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 20:03:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450LnP4rxqzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 04:03:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450Lm04mGjzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 04:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="a8RjWUcV"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 450Lm01qS6z8wN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 04:02:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 450Lm014Q5z9sBr; Fri, 10 May 2019 04:02:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="a8RjWUcV"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 450Llz4T78z9sBp
 for <linuxppc-dev@ozlabs.org>; Fri, 10 May 2019 04:02:38 +1000 (AEST)
Received: from zn.tnic (p200300EC2F0F5F0071783F241746291C.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:5f00:7178:3f24:1746:291c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 008451EC0AD6;
 Thu,  9 May 2019 20:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1557424948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=LE6rba9B9rU5DbzSHGx/pRi6Lf56AIjnr35aFsMIzx0=;
 b=a8RjWUcVSKawUH6Wjde6La9FXxCtzDNi3YnI+OMK2XcixlBnhA6XEtKqKRhEM0al/llKME
 bU1tU9ahok52xcoqbLYM5JT5mMOMtQEGXfj8qxXlWRAQHBd+V4bCdzy6S6SHtnJ7Y3YFC3
 CGtCAvs1EMUnHirHSl1tVM9zkj/XSgY=
Date: Thu, 9 May 2019 20:02:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] EDAC, mpc85xx: Prevent building as a module
Message-ID: <20190509180220.GH17053@zn.tnic>
References: <20190502141941.12927-1-mpe@ellerman.id.au>
 <20190506065045.GA3901@x250> <20190508101238.GB19015@zn.tnic>
 <87o94bvfxm.fsf@concordia.ellerman.id.au>
 <20190509145534.GD17053@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190509145534.GD17053@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Johannes Thumshirn <morbidrsa@gmail.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, james.morse@arm.com, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 09, 2019 at 04:55:34PM +0200, Borislav Petkov wrote:
> On Fri, May 10, 2019 at 12:52:05AM +1000, Michael Ellerman wrote:
> > Thanks. It would be nice if you could send it as a fix for 5.2, it's the
> > last thing blocking one of my allmodconfig builds. But if you don't
> > think it qualifies as a fix that's fine too, it can wait.
> 
> Sure, no problem. Will do a pull request later.

Hmm, so looking at this more, I was able to produce this config with my
ancient cross-compiler:

CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=m
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_MPC85XX=y

Now, mpc85xx_edac is built-in and edac_core.ko is a module
(CONFIG_EDAC=m) and that should not work - i.e., builtin code calling
module functions. But my cross-compiler is happily building this without
complaint. Or maybe I'm missing something.

In any case, I *think* the proper fix should be to do:

config EDAC_MPC85XX
        bool "Freescale MPC83xx / MPC85xx"
        depends on FSL_SOC && EDAC=y

so that you can't even produce the above invalid .config snippet.

Hmmm?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
