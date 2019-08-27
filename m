Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC27A9E595
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:24:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HlNf3GRPzDqDr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PI4MI6dQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HlKw1qWyzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:22:12 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n190so12446494pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=JYWxmyEhPbsBmvv+nPYtu/nBwXiHXvQgK5rQfDypsko=;
 b=PI4MI6dQeTJpQwqzU1geGxBGFRQ2yOdOWKfxgg7vth3rAMEY8dlDc7uC08w3e7EvpY
 Yf0JslIqn7mkOGlPB6zAhVON4FnTbcgrF9BCZBoMRS5HNQIsNltxdpxrkgkCGmFfYsaD
 XXXO6jqsEn3VmJsrUuNuazBYHDagI2WL+ZgNp5Em6aXGuXZe+hpxIfKzHkqTvweQfNoj
 GObeTT8uNYCzZ1ysa+M+MbS3TOMizgDnotBF/qwhslEcSVJoQBnTBlUB34znzRjcgsa+
 QsuDLp/eyeEAZzjhOpUTiYDMgyAMa3X9qU5hHYLvB2c2EQIIt/zU/728SngNTvUBoBOp
 3Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=JYWxmyEhPbsBmvv+nPYtu/nBwXiHXvQgK5rQfDypsko=;
 b=BaVp1bx8LgZRL2YIJN9Ohx6sLlz5jycTItkMOnJFDH6naRDXD6TemFcfimO/sKnI52
 v1ox3taFndKoJR7I++XcFdKbxrhOKcH5lPsT/US9YApS/kYG1LcGEguq7pMXU2uj1XIc
 ff2EngiQ1NDJrhElQnjyYwnKkB4lonwW7l/BFeFI7yu3Eq7c9lGW8nIeCI36PdF/Lm83
 MWNRaoghNqIF1T6JFLh9/OlX7wup9YiCBaH3WK2xfxfbE7wA/MA7LiiI/2YehAGEQEBH
 5MrjXx7prD9Xx+LUtWxptVLDzKGpo4PcBagQp0MSNu14zJrahuOmLxBaRQ6Q3ocoCfxI
 pXKA==
X-Gm-Message-State: APjAAAXlvRfagXWn3TfY9wSWm/BcLiR6149SGPCDW8+DeQY4IEF6cctb
 uuImceDcpQgh2kS59hGXFwQ=
X-Google-Smtp-Source: APXvYqwbku8Vso9//Y9Qp/OuZcgbeAdsm041Aha90vSW/gVN2u4ZGNYhXXpeXLm0pzj0yNCZDnK63w==
X-Received: by 2002:a63:595d:: with SMTP id j29mr20935515pgm.134.1566901328492; 
 Tue, 27 Aug 2019 03:22:08 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id ev3sm4073426pjb.3.2019.08.27.03.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:22:06 -0700 (PDT)
Date: Tue, 27 Aug 2019 20:21:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/64s: remove support for kernel-mode syscalls
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-4-npiggin@gmail.com>
 <b6f8ab88-75ec-560d-6d35-9ee7bfdf5e65@c-s.fr>
In-Reply-To: <b6f8ab88-75ec-560d-6d35-9ee7bfdf5e65@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566901235.05q9l1t6dn.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on August 27, 2019 4:14 pm:
> Euh ... That's a duplicate of [PATCH 2/4] "powerpc/64: remove support=20
> for kernel-mode syscalls" ?

Yeah sorry I changed the title and got myself confused.

Thanks,
Nick
=
