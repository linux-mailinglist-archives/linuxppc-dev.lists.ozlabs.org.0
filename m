Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150C95CC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 13:00:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CSWg1TKWzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 21:00:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="esBS8tvW"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CR5J3G6FzDqvK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 19:56:11 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id o6so3619468oic.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ERy6C+OfX7AwXRit4NjtghifEuheVTJjPNjjGxnVXl4=;
 b=esBS8tvWjvw1oPPxWdzyE63jd94MRLnrUUg4cyouQEMyiYTKxPG+Md74XSdR0Hn9qm
 u/yhAcDom21n1PFzSKCGDVRlC8bwdtOPV5Ga016Y3MfIx+qPtgAqq/l3ZdPMYmiQU647
 6FOJ9xi1gsNq3LaPCHCLn+mUPV3cg7lHqbwFZk1uSrWhaPoT1t9n6MR3QtZbKyLxDSxS
 yOOtBByzrdAPB/lhM3CHw0IMUBqHOuId43QVT2RwUl/2EzvVgf27h3OlZL30SdLIkmOF
 KUilJjflda9G5h40sZPfyzC1FSzsAn8yoWXinP1SG4qMRUqYupzKNJdNoA/N8PfONPNJ
 u4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ERy6C+OfX7AwXRit4NjtghifEuheVTJjPNjjGxnVXl4=;
 b=F/UZVlsWwXPAL74vBhVscyPW2fYz6P/1iyB8uqB44fU7mOCPvGUZSlnBmLaVGbJCoV
 jYZyQgulovp9eW7cYyXVtsIXKOq0Zg5R1gP1VvFcvZrvTbzhy0HnDRBTfI6vgpkOQwIN
 8secd3X0l4zFMdltXQzG9+DWEodGQC1+cfkexNlp2h9wA4Mz2tSQwIhgAMGbkP7XrG1n
 GotMdW7SkIZ2+P1r5nAw8dfydUZO4AABrgCtJiSLiIUZ2bg4XYrpEB0ChFvW6GAkvIXF
 e+Z45TxRZR5NG1eHA9eEg2AaK+VdQ4rdi2KY+bgQVK43omaWKcWD0nxriP7FkSfYhPAv
 abCA==
X-Gm-Message-State: APjAAAVKP1L8elYYZzwpi3+CDM3w21/pKRoMaenevPPkGj4wEbxRqkEP
 49WCZVRNUql8RX45YFjrf4gIczHEN5h7mNs0a9fQTA==
X-Google-Smtp-Source: APXvYqyQ6eoEoVcpR/xbV96cbSTy0dNPpLdj0gQt1oJ++FGqgDPc8X6DViRqQ8kizDCDO6cg+XdDCeC8PkqVTf9p8Pg=
X-Received: by 2002:aca:c396:: with SMTP id
 t144mr11367178oif.172.1566294967836; 
 Tue, 20 Aug 2019 02:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190820024941.12640-1-dja@axtens.net>
In-Reply-To: <20190820024941.12640-1-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Aug 2019 11:55:56 +0200
Message-ID: <CANpmjNMpBAjX4G2GYmM6-z8TfXdbzLCuAMQ-fmGRwEDFMci4Ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kasan: support instrumented bitops combined with
 generic bitops
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Aug 2019 20:49:42 +1000
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
Cc: linux-s390@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Aug 2019 at 04:50, Daniel Axtens <dja@axtens.net> wrote:
>
> Currently bitops-instrumented.h assumes that the architecture provides
> atomic, non-atomic and locking bitops (e.g. both set_bit and __set_bit).
> This is true on x86 and s390, but is not always true: there is a
> generic bitops/non-atomic.h header that provides generic non-atomic
> operations, and also a generic bitops/lock.h for locking operations.
>
> powerpc uses the generic non-atomic version, so it does not have it's
> own e.g. __set_bit that could be renamed arch___set_bit.
>
> Split up bitops-instrumented.h to mirror the atomic/non-atomic/lock
> split. This allows arches to only include the headers where they
> have arch-specific versions to rename. Update x86 and s390.
>
> (The generic operations are automatically instrumented because they're
> written in C, not asm.)
>
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Acked-by: Marco Elver <elver@google.com>

Thanks!
