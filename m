Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2351C502
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 10:32:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4539tG40N4zDqLk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 18:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4539rm057gzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 18:31:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="Q9XTjB2O"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4539rl6CFmz8tRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 18:31:35 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4539rl5vVnz9sNk; Tue, 14 May 2019 18:31:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="Q9XTjB2O"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4539rl2QFVz9sNf
 for <linuxppc-dev@ozlabs.org>; Tue, 14 May 2019 18:31:30 +1000 (AEST)
Received: from zn.tnic (p200300EC2F29E5001D7DC1D592351BAD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f29:e500:1d7d:c1d5:9235:1bad])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AE2F61EC0400;
 Tue, 14 May 2019 10:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1557822685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=HG0WXJqrGZ2lLUm72OEL8UR46M7kssXY79lj4QERGYE=;
 b=Q9XTjB2O4Pk+EDquI9si6mSAkW3USOL9kM8Gf2tpb2ksW0CfsoQcV4932+tnGJqAkhKUqI
 +1+PxbCHKBno1kt6RScQ4lPyNvb9clKxofuSCh3vlqMrQE6b2ucN0odj9PdUgtKoUlRgQ7
 iFrI1NWRgxSAx6vAO5cRTqJnxBd6WZA=
Date: Tue, 14 May 2019 10:31:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] EDAC, mpc85xx: Prevent building as a module
Message-ID: <20190514083110.GA31140@zn.tnic>
References: <20190502141941.12927-1-mpe@ellerman.id.au>
 <20190506065045.GA3901@x250> <20190508101238.GB19015@zn.tnic>
 <87o94bvfxm.fsf@concordia.ellerman.id.au>
 <20190509145534.GD17053@zn.tnic> <20190509180220.GH17053@zn.tnic>
 <87bm0avb03.fsf@concordia.ellerman.id.au>
 <20190510141320.GB29927@zn.tnic> <20190510182512.GG29927@zn.tnic>
 <87d0klttpy.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87d0klttpy.fsf@concordia.ellerman.id.au>
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

On Tue, May 14, 2019 at 04:50:49PM +1000, Michael Ellerman wrote:
> Looks good. I even booted it :)

Cool, thanks!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
