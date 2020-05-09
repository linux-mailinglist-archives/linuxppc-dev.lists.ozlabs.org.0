Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895C1CC274
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 17:38:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KBFB2WM7zDr63
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 01:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=JG+grHef; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KBCR5wVBzDr3D
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 01:37:20 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id b1so3395872qtt.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 08:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=rcivY61FjI8KZB+d1rBbrvH7RkDa2Uc4j8UGF0eae0Y=;
 b=JG+grHefh6HgG+HoX1rFmDt90/y3Ikvg28kVGgdyTr9sorkJyr5DUZaGAqskqMhVL3
 5NIq0QuQj+Du4dphPJH64v4hZL2u92XPhqb3UJnCwAp5L97OqduMn0g1mrEk3xD/DjxS
 N0iMYNPsx73zlAv6mfTV+YbVVC0yRw1IdEYanWV1TggD6vX3b6/y0X0KtUgTbQr4RX6y
 kKDa0L/o+4Wg0w6y33aN1PUOaCcbjDGMDsR0jkQfZwfWl+i/O9BKuEY4Hiqnuv1Ld17l
 7cC3UI1upj540CwbqQZEnOE0d6xsVWttI7A7LwzgMcFOn0OyAd5CEG6yMpEf67KzHFn8
 AWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=rcivY61FjI8KZB+d1rBbrvH7RkDa2Uc4j8UGF0eae0Y=;
 b=HIzL2JG2zdqym7/7JAzlMphLTGTfVz3KBoleqw2F/gjpp+X+8egTqcgQYfIwezPdgT
 r9yzyoJKsAt8ijvB9BcELy9o0Qlt0hiC7RZt+ipQnkdH1f+2sUMdkzdlqObfXw4ahjN9
 haZ6NSqN0S2FxI71O9HdaM51cwk2iMNr8NwSzUeGCPA6Nz+/8gDnm2VTueFfkCkYqvkL
 WCuIsFBthL7Bm9DN0krb4EixXC/OcE78PPdwtNXFnbOwbkgVMAQYUbmFHxOJ6EzurGtC
 soIiLq+0pkYyybRixeKcbi0UDvCOLdxDybBdtw/MNUfY385onKqTG0hs/l8MKgDKERw6
 8BiA==
X-Gm-Message-State: AGi0PuYPdkN++2fnZTy2suhlCULzsNUyiKa13oVBn7lnNfCaJUa3KfDS
 XdixH8b2U9ZF5XYfuK92Odg1FQ==
X-Google-Smtp-Source: APiQypKQZtoOjdL6x8igHPSiWIXN0mgbo3DURqVymEKgCj3FYRUlu1Xh10DYyIYSpBYuw8EWrB3Q4w==
X-Received: by 2002:ac8:3733:: with SMTP id o48mr8387465qtb.149.1589038636813; 
 Sat, 09 May 2020 08:37:16 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id k127sm3766709qkb.35.2020.05.09.08.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 May 2020 08:37:16 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: ioremap() called early from pnv_pci_init_ioda_phb()
Date: Sat, 9 May 2020 11:37:15 -0400
Message-Id: <ABC2D7EE-2C59-4A96-A105-406F424A93AD@lca.pw>
References: <1589013450.02gfmpktnp.astroid@bobo.none>
In-Reply-To: <1589013450.02gfmpktnp.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: iPhone Mail (17D50)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On May 9, 2020, at 4:38 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Your patch to use early_ioremap is faulting? I wonder why?

Yes, I don=E2=80=99t know the reasons either. I suppose not many places in o=
ther parts of the kernel which keep using those addresses from early_ioremap=
() after system booted. Otherwise, we would see those leak warnings elsewher=
e.

Thus, we probably have to audit the code, and if still necessary, call early=
_ioremap() and then early_iounmap() followed by a ioremap() once slab alloca=
tor is available?=
