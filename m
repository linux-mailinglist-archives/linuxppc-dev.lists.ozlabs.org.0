Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB2A2CD4DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 12:46:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmvFJ75DfzDrHy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 22:46:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=lZsBzGOv; dkim-atps=neutral
X-Greylist: delayed 87240 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Dec 2020 22:39:29 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cmv4x5vlhzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 22:39:28 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f0dc5005cbee08096bf44b9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:c500:5cbe:e080:96bf:44b9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C59381EC01A2;
 Thu,  3 Dec 2020 12:39:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1606995564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=XdizxemelBKbAsfei8gCNazQZJgzDRsHCkqt5ztY6qI=;
 b=lZsBzGOvlsbpcx9tXgxvCEh1XJb1pnnHMUVRGTLeTSjlLWaZeWq8F7cS+iliEUOCEpGCgI
 gE8/wvyamZjbAUq8WI3cR6Q72qFMN4EhZsPX5TKoay00j1utTgZkmMkg5pjbCSmJfDPgf2
 DAALOfaictINiASjQha8FuvIfI+uC9Y=
Date: Thu, 3 Dec 2020 12:39:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] EDAC, mv64x60: Fix error return code in
 mv64x60_pci_err_probe()
Message-ID: <20201203113920.GG3059@zn.tnic>
References: <20201124063009.1529-1-bobo.shaobowang@huawei.com>
 <20201202112515.GC2951@zn.tnic> <87pn3ruo2q.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pn3ruo2q.fsf@mpe.ellerman.id.au>
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
Cc: cj.chengjian@huawei.com, linux-kernel@vger.kernel.org,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, Paul Mackerras <paulus@samba.org>,
 huawei.libin@huawei.com, james.morse@arm.com, mchehab@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 10:27:25PM +1100, Michael Ellerman wrote:
> It's dead code, so drop it.
> 
> I can send a patch if no one else wants to.

Yes please.

I love patches removing code! :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
