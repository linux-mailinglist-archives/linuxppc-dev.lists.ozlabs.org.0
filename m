Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F771A2F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 20:26:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450zF60h6HzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 04:26:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450zCk35kxzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 04:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="YsCbwMOR"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 450zCk2JnYz8wN4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 04:25:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 450zCk26v3z9s9N; Sat, 11 May 2019 04:25:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="YsCbwMOR"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 450zCj5vq3z9sBK
 for <linuxppc-dev@ozlabs.org>; Sat, 11 May 2019 04:25:17 +1000 (AEST)
Received: from zn.tnic (p200300EC2F0F4000329C23FFFEA6A903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:4000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 753011EC0AB0;
 Fri, 10 May 2019 20:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1557512712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=wbJqN8BDou+FYSJ+nPq4MO6fRTRxmjFCtFcdN3ttYwM=;
 b=YsCbwMORzUVovHKrA9SYFUFxy1jzmMWZVQ6LbCmuKBYwyNcMWhKkBo9VdLFTMB95epYwC7
 vgBrSs9JVHyMRZiWEueTAkxxcxl6j7L1XI10fYkqI637Z1DBInIeG+H0zgLTT1QPMbVfGO
 BtQVFrbVBo3RdkOXQZuXozTYqnYBOrE=
Date: Fri, 10 May 2019 20:25:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] EDAC, mpc85xx: Prevent building as a module
Message-ID: <20190510182512.GG29927@zn.tnic>
References: <20190502141941.12927-1-mpe@ellerman.id.au>
 <20190506065045.GA3901@x250> <20190508101238.GB19015@zn.tnic>
 <87o94bvfxm.fsf@concordia.ellerman.id.au>
 <20190509145534.GD17053@zn.tnic> <20190509180220.GH17053@zn.tnic>
 <87bm0avb03.fsf@concordia.ellerman.id.au>
 <20190510141320.GB29927@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190510141320.GB29927@zn.tnic>
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

On Fri, May 10, 2019 at 04:13:20PM +0200, Borislav Petkov wrote:
> On Fri, May 10, 2019 at 08:50:52PM +1000, Michael Ellerman wrote:
> > Yeah that looks better to me. I didn't think about the case where EDAC
> > core is modular.
> > 
> > Do you want me to send a new patch?
> 
> Nah, I'll fix it up.

I've pushed it here:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/commit/?h=edac-fix-for-5.2

in case you wanna throw your build tests on it. My dingy cross-compiler
can't do much really.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
