Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B051706D51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 17:52:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLyKG2wvLz3f66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 01:52:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=PxKg2pRC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=PxKg2pRC;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLyJR4XBcz3cCm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 01:51:17 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-561c1ae21e7so10950057b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684338674; x=1686930674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/BiToevvpXZU69/oSETGaqYlCzMkDhIUSch995c2x4=;
        b=PxKg2pRCl/MeEqp5uvc8FI6+YOF8ZQ0EzboQ7hpfbuFJX3IIqChekL0/PSY6f6ZBkZ
         urHQTw8B9Qu+ZY/1vJzTnbXCr75YfIhdSyy686/eLISuhgZHB6UQ3EVsl6FD9v625A/w
         tjxES+HrRzg6bCh5g/2aKxK6aL5WAXk6n5hL6cNQ4DLvHOdkJN6i/f12VZINOcSbVDWY
         Ht8TqiZDvyXTZ0hs/EBmu3kHn7bK+REyjKbHcdjwjITX645yBU2SclzoGsnZb8Qs2uwx
         3eg3Vv2wpF9jKUnxeZFE5DWnz2u2DGzEAq8Ck0m/CDBEkeEBn1RCKj2gBMDNc7cK4SzS
         DFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684338674; x=1686930674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/BiToevvpXZU69/oSETGaqYlCzMkDhIUSch995c2x4=;
        b=RMJ7hD5BouYoT9cDHKvrpSbX3nHI2vUzkG3yjiKBpDKGIR/lECu2CKYG6D8VIo6QVk
         EKEFiiouoCc0t/QyWdKbL03p5LSeSfyQvLNzM4el/4RQQgJVS1ThOidwt3CFXZbNE+QT
         MogoabpLuDlOko9E0MeQZGI7ixxJ0rI/SCmRiZiZRv98gphGDOuRQtUtFi3LTzhcWVOH
         GRBFfm4/NfJQyoZIOxuc3jwo20lxP9ciEK+Jt4H0tUsy3vhUi1eYgb87CEyTLgjbwmWL
         574OOFn44ELNWP7ZBDzkrt5EIq5RYDQrIsj+8gfBo1KWACADQXcNxXHLStuadewuVUDr
         e0aQ==
X-Gm-Message-State: AC+VfDy9HHLsZ996plvR6MhjNzCLGnARX5Ph/8E5rppAyuASGCzSu2Zb
	7MQTtTGm570ydGpMg4NwABA13OfphKHthRGSmB6V
X-Google-Smtp-Source: ACHHUZ7m7iuWUD5omxnx19xTgvLnN/+5Wgfo2oM56GLLAkTkIZomD+UUzUvvSVfeDFHavflonxguaAqx7fdYrFqY+DA=
X-Received: by 2002:a81:53c5:0:b0:55d:c2c3:fbb8 with SMTP id
 h188-20020a8153c5000000b0055dc2c3fbb8mr34245755ywb.40.1684338674184; Wed, 17
 May 2023 08:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230517131102.934196-5-arnd@kernel.org> <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
 <83422cf8-5d77-4e2f-a854-c2b9a9a94d75@app.fastmail.com>
In-Reply-To: <83422cf8-5d77-4e2f-a854-c2b9a9a94d75@app.fastmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 May 2023 11:51:03 -0400
Message-ID: <CAHC9VhQZyxVhDb0uB-+q7H=e++yq0qEAZGssPjepgnZ3i3_pnA@mail.gmail.com>
Subject: Re: [PATCH 4/14] audit: avoid missing-prototype warnings
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, audit@vger.kernel
 .org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023 at 10:51=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Wed, May 17, 2023, at 16:33, Paul Moore wrote:
> > On May 17, 2023 Arnd Bergmann <arnd@kernel.org> wrote:
>
> > We probably should move the audit_serial() and auditsc_get_stamp()
> > away from the watch/mark/tree functions, but that isn't your problem.
> >
> > Anyway, this looks okay to me; do you have a problem if I merge this
> > via the audit/next branch or were you hoping to have this go in
> > through a different tree?
>
> Merging it through your tree is probably best, Andrew can either
> pick the ones that nobody else took, or I can resend the rest.

Easy enough, merged to audit/next, thanks.

--=20
paul-moore.com
