Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A432970F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqWJh5kN9z3cnd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 19:59:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=VuJezB0t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VuJezB0t; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqWJG32y6z30Nc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 19:58:35 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id x9so14956223otp.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 00:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZedzYRAADqpCRUEjxpUyyJbfTq4kXSXEtgpjDsYUTaM=;
 b=VuJezB0tzWYNW+rVlp2nsM418xSp5+ufG0JWLAq5r5MM0gK8qNtLMnGAtK7yHadsqw
 TmlF+UOZJINweGW5BON+tIaVXtB2L0NH6OKZSjkNpdTma8yO6kGtpqImMC6FondtWL/v
 cYDAzZwQMwxb+qIDEpg/nF96V85V4wG/Rk7rTuvW1Sly7+7/AtTKx2fY7W5p8xkRwCrS
 1Lu3BvWIA04+WZGGBL8Pnq3XNaIYUnKTpX+08p/+LiJLC6k4RMdZrhXt8apJEY6APftp
 sj2e2Blq8v+FSC48imCvzkT7fpDSibVRZDUzuRj+zAvXCexjO4/Qdpr2e4wROPokdGt/
 LKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZedzYRAADqpCRUEjxpUyyJbfTq4kXSXEtgpjDsYUTaM=;
 b=McGM1aHyj0dIufzueeQiq9DoZahcNOiUOybHNwcRhxJcIuBr5ib9o8xeFy2hi1qR3v
 spXBn8p8QyL+Qzy2r6lZrMKQ4jK4d6LQAIsHAQMunt6qAAx4Sr4yHrLI7ONt8KQvlBZy
 qDb9X0rxtM1orA84RCLS254Gmv7gcjEIBxSLYJOe3Ru0YSPvYTQwWCnfIPfg9lbSzzZa
 sZhXqmzW3M3MU/zAFbUyzQUZrd/zo3mx1roMrG5/5HUtVFb6w7PsW4IXBd8PS+j4Ziuq
 b4R0rZmhKNawFdw8+d2tmspUf8JEDEZvrfHvfH5L5m1KxpJZ7Iqic9cxwIXfx0aSB4DA
 KeLw==
X-Gm-Message-State: AOAM532GIssdOuk2nhTttK63TKyN44laPlGhsoWZFYCqURT3B5bStwh7
 XdUyluAq/J+RHRfV27jKeS15WRUMDLnO1RToXLSkkw==
X-Google-Smtp-Source: ABdhPJwyuV/L1oxMIfR9yCj0QXq4vfpZWv+7bnDC4oXhj8Ui6jlu9nIWMXS6e4hKLyGSbTtljGRukRNmhekdkwAAlVM=
X-Received: by 2002:a9d:644a:: with SMTP id m10mr17387529otl.233.1614675511068; 
 Tue, 02 Mar 2021 00:58:31 -0800 (PST)
MIME-Version: 1.0
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
In-Reply-To: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Tue, 2 Mar 2021 09:58:19 +0100
Message-ID: <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Mar 2021 at 09:37, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the ppc32 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.

Nice!

> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the Read/Write linear map to be
> mapped at page granularity.
>
> Unit tests succeed on all tests but one:
>
>         [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/kfence/kfence_test.c:636
>         [   15.053324]     Expected report_matches(&expect) to be true, but is false
>         [   15.068359]     not ok 21 - test_invalid_access

This is strange, given all the other tests passed. Do you mind sharing
the full test log?

Thanks,
-- Marco
