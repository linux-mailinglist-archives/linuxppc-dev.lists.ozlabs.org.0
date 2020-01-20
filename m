Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A0A143138
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 19:01:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481fbz4mP7zDqgX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:01:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=XMd8vjuG; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481fZ469qyzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 04:59:24 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F03FF0075FD4DB0C8DF3C59.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f03:ff00:75fd:4db0:c8df:3c59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2D4FA1EC08E5;
 Mon, 20 Jan 2020 18:59:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1579543147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=E8yvJahz8u60P3zYVn0P6etm4lyGGmfJf6bH0Xyy7nU=;
 b=XMd8vjuGkhMwuiJurJoolyqiOtsuPzlfQU9iSQRoOmrWlSkUGJb7hosQbL9t8FQ7PxTbpQ
 nn4Vc78yUd31Ad58e/FLUN/VcuvyrOQ2n3W2x0sz9j4qUl0ivg4dxbMn/3PvPE2AyqacLa
 OudmraXK5SPyti2iMRgwYV4piS2dsb8=
Date: Mon, 20 Jan 2020 18:59:01 +0100
From: Borislav Petkov <bp@alien8.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 00/10] Impveovements for random.h/archrandom.h
Message-ID: <20200120175901.GB576@zn.tnic>
References: <20200110145422.49141-1-broonie@kernel.org>
 <20200110155153.GG19453@zn.tnic> <20200110170559.GA304349@mit.edu>
 <20200120172627.GH6852@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200120172627.GH6852@sirena.org.uk>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 "Theodore Y. Ts'o" <tytso@mit.edu>, herbert@gondor.apana.org.au,
 x86@kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 20, 2020 at 05:26:27PM +0000, Mark Brown wrote:
> I think the important thing here is that *someone* takes the patches.
> We've now got Ted and Borislav both saying they're OK applying the
> patches, an additional proposal that Andrew takes the patches, nobody
> saying anything negative about applying the patches and yet the patches
> are not applied.  The random tree sounds like a sensible enough tree to
> take this so if Ted picks them up perhaps that's most sensible?

Yes, Ted, pls pick them up so that we're done with this.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
