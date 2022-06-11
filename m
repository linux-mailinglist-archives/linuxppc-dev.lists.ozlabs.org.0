Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A015475D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 16:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL17z3GpNz3cht
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 00:54:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=cCMlvlL8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=cCMlvlL8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL17735Wtz3ccy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 00:53:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2034760C20
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF96C34116
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:53:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cCMlvlL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654959230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pqfqYStan/I+ZPRU4QEBBVfKsXKknoHw/gVA4DBjss=;
	b=cCMlvlL88ETLh+cy6Ts0vJzddbvibYSmVHTkV3G+hCcnf9RmnMAYubkyW85I7DTWGIjDGa
	A9PphnTqjP140Jy/9wURS+hYtBrr0aGB5XVrpyeEEWbvf5/N8D0cdfccVmQ3uc2YE6+e3J
	hMEXvreG4gWlHSkNEyzHRtBoqRtiySM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 538044c7 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Sat, 11 Jun 2022 14:53:50 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3137eb64b67so15451347b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 07:53:50 -0700 (PDT)
X-Gm-Message-State: AOAM5339S6nm+yZpku51EigzxN/QYQ3vtq2PchCKBc5/9PB0YdCiJR5N
	zrqPPlA4H9BkkaH+agOhZTSsmQdsiAdxMRVZ0AQ=
X-Google-Smtp-Source: ABdhPJwgmnQjNeYtkfIN6xGH9ZFfcVbNxRhMGQJjaIN0Dh1KWfZ5lVm1oeHb/OBW4MjKj2SuINtm8f6mvvXx4Gwkyek=
X-Received: by 2002:a81:6c04:0:b0:313:c938:ba1b with SMTP id
 h4-20020a816c04000000b00313c938ba1bmr7414813ywc.231.1654959229974; Sat, 11
 Jun 2022 07:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220611100447.5066-1-Jason@zx2c4.com> <20220611100447.5066-2-Jason@zx2c4.com>
 <6432586f-9eb9-ac71-7934-c48da09a928e@csgroup.eu> <CAHmME9rBWcdZtJCQ1WZAPOJtnA6u4w0ub4s4M+UW60gMSNgWrQ@mail.gmail.com>
 <YqSqqq0zC7yDOQib@zx2c4.com> <c94deb33-c28e-12c1-e3b1-aebd4249baa3@csgroup.eu>
In-Reply-To: <c94deb33-c28e-12c1-e3b1-aebd4249baa3@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Jun 2022 16:53:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9pNGrSWNuYNV4jZCPiAk5NzNRt3LuZuBMhS-GVobaeiMQ@mail.gmail.com>
Message-ID: <CAHmME9pNGrSWNuYNV4jZCPiAk5NzNRt3LuZuBMhS-GVobaeiMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/microwatt: wire up rng during setup_arch
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Sat, Jun 11, 2022 at 4:49 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Then you have:
>
> arch/powerpc/platforms/powernv/powernv.h
> arch/powerpc/platforms/pseries/pseries.h
>
> and you can add
>
> arch/powerpc/platforms/microwatt/microwatt.h

Oh, terrific, thanks. I'll do that.

Jason
