Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B565475D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 16:54:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL17H2Vylz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 00:54:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QXa8KogU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QXa8KogU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL16c01S0z2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 00:53:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 42A4DB800C1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98B0C3411B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:53:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QXa8KogU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654959201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKbSeBuOdlxWzcVReKbVmpA4lJrc6qzgy7XqD/6bAtw=;
	b=QXa8KogUbmnrgICN3mIIm8wPs35V15sU96OJDtVFHsctRC1k8Ogwr/yqw3wXdVHqZjDjmY
	UsNnupyvqNMVzsNmWNeY/PxXlVFmUQmOxc20onLXrCjbYy6bhS2sBnkLkH29WsF88NXR7J
	ab60omI0X6zWmRMVlT8TUz8xp73jQOM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dc64ddf3 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Sat, 11 Jun 2022 14:53:21 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31332df12a6so15839317b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 07:53:21 -0700 (PDT)
X-Gm-Message-State: AOAM531MYUVSIbHqtplTr1UALBGQwmy+cBHUJHV+v8UtYUPizz3a+9aw
	X4uD48Q5+jXNkbf0Ju+8go0vdwOejsaKsZx4rds=
X-Google-Smtp-Source: ABdhPJwVIznr3iPBOVShCFe6E/BZjiQuHFZfe/9f5Zu2mD9Vr+9h/iopjzg3V+juSXJQ+5DDeqF6O5Ha5SbJHQXwPrs=
X-Received: by 2002:a81:4887:0:b0:30c:40bd:3e7b with SMTP id
 v129-20020a814887000000b0030c40bd3e7bmr55918247ywa.396.1654959200598; Sat, 11
 Jun 2022 07:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220611100447.5066-1-Jason@zx2c4.com> <20220611100447.5066-4-Jason@zx2c4.com>
 <80cca718-d637-b48a-ddb3-e6931cd08c24@csgroup.eu>
In-Reply-To: <80cca718-d637-b48a-ddb3-e6931cd08c24@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Jun 2022 16:53:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9ortseAax04+h1TVZAWEYN0uVDAkhzTrBZnQnWzj9xn6A@mail.gmail.com>
Message-ID: <CAHmME9ortseAax04+h1TVZAWEYN0uVDAkhzTrBZnQnWzj9xn6A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc/pseries: wire up rng during setup_arch
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

On Sat, Jun 11, 2022 at 4:45 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> There must be a empty line between declarations and code.

Ack.

> Prototype has to go in a header file

Already voiced disagreement about this in the other thread.

> and should be pSeries maybe
> allthough camelCase in throw up on.

All the rng.c functions use pseries_ in lower case, so I'll stick with
that, as that's where the function is defined.

Jason
