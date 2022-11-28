Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13680639F08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 02:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL7XM6rl1z3dvc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 12:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fKxEdncm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fKxEdncm;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL7WT3x9mz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 12:42:28 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id p12so8784104plq.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 17:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bskDi/tzRvAHv5SpbGwEfMZB0mlS9VwAzcLgi2nmEqc=;
        b=fKxEdncm6i6dH21EDg1abGc/1ZFVTcEPRZivNKjFDsP4CNqe6quDiYkWUVVL4VzrLy
         HuHXo7maSyTZnMsXD1twdLXbO4oAHEiHRJIbntPPd8UbMhhQtFGhuBpDJ2l86gg6aDOg
         sWdVMy6k1d6j7UnjG7UdNdtXIQO/GNjfOUkW+uP9+0tV+YPDWHAo+DoJL7OAiRQRnVV9
         e8BW+3BecvkbeXsSq5HlR1Hrc2GQZDbnCYOOTAm4iLzDPSpg1cQbzQMIhb9G/Y1l5ynI
         ZgFJpoWwsLFNHNKUlbm7GR98V/KPF0xTKOqagcC3xnjc2Q61q9lhdeIAc5hAravByWtG
         8nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bskDi/tzRvAHv5SpbGwEfMZB0mlS9VwAzcLgi2nmEqc=;
        b=reIXUb8wh5hK20VEfkm6bmpHOFDDt+lKgCfU9pJYn0kxbgotAZUHC+KpK/OzDEfTzt
         GqiXOsno3Amc4CqVuwLwQ0br8t7YFXvR5hGsSLGozbOaax7YYfz68H3cOzY/oIM1b0w5
         G9ziSFVYsqk03+UWufkT1QqyMECCTLEWaP+WEKxukr4eCe3lUWpNjQ4jWLi/f6xAafQo
         ciNVdCpNRygQDy7R0Lsum07kmk3iugqeXlqUflMLt8WQ0AXKnXRrJo3lkHQVQ8UERHHL
         D7RgeEeVZj7Bij50itLVltwbwu1PIRo8G0HFRdgFwW+JFjV0tdbEK6hkIjkX65u7zp6T
         eJKg==
X-Gm-Message-State: ANoB5pnkORnFFsD0/MycI9t1UPyCAOJ+TYpE1HdTRqJEDe6lsEQE1NQH
	6t5Z8OrR9QDEVER9JPzhXqcrhxP+HSo=
X-Google-Smtp-Source: AA0mqf7p1Dj3lfa+7izUEoKmIVMtjvW+rrqAk++++KuWg2E/0uqsVuV52kB6ZSV0eOBFzZqBesbx5g==
X-Received: by 2002:a17:90a:7847:b0:219:d47:eec8 with SMTP id y7-20020a17090a784700b002190d47eec8mr13956374pjl.178.1669599745874;
        Sun, 27 Nov 2022 17:42:25 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b00186ad73e2d5sm7439364plg.208.2022.11.27.17.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 17:42:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 11:42:21 +1000
Message-Id: <CONJPOMT85Y6.1OYP0BGZY6IG3@bobo>
Subject: Re: [PATCH v2 1/4] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS
 Kconfig
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Rohan McLure"
 <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
 <e436f57a-41fa-b91a-80cd-2f5ece074421@csgroup.eu>
In-Reply-To: <e436f57a-41fa-b91a-80cd-2f5ece074421@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 8, 2022 at 12:28 AM AEST, Christophe Leroy wrote:
>
>
> Le 07/11/2022 =C3=A0 04:31, Rohan McLure a =C3=A9crit=C2=A0:
> > Add Kconfig option for enabling clearing of registers on arrival in an
> > interrupt handler. This reduces the speculation influence of registers
> > on kernel internals. The option will be consumed by 64-bit systems that
> > feature speculation and wish to implement this mitigation.
> >=20
> > This patch only introduces the Kconfig option, no actual mitigations.
>
> If that has to do with speculation, do we need a new Kconfig option ?=20
> Can't we use CONFIG_PPC_BARRIER_NOSPEC for that ?

NOSPEC barrier adds runtime-patchable hardware barrier and that config
is a build implementation detail. Also that spec barrier is for bounds
checks speculation that is easy to get the kernel to do something like
speculatively branch to arbitrary address.

Interrupt/syscall register sanitization is more handwavy. It could be
a bandaid for cases where the above speculation barrier was missed
for exampel. But at some point, at least for syscalls, registers have to
contain some values influenced by userspace so if we were paranoid
we would have to put barriers before every branch while any registers
contained a value from userspace.

A security option menu might be a good idea though. There's some other
build time options like rop protection that we might want to add.

Thanks,
Nick

