Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D06CAB9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 19:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlfWR40gnz3fRq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 04:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlfVw41hMz3cf4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 04:11:51 +1100 (AEDT)
Received: by mail-ed1-f41.google.com with SMTP id y4so39200920edo.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 10:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKMInRwl0Gc1Ecqdj/dy1/q2BubdqaACdxj2JmQ6+TI=;
        b=VGE4gtdQcV6ToHuTlNU7G8ZYF22rUcnwvfJ53EUe85j87xOyW14D5bH+JRZSfDAXTi
         hEAhCMuKbZY0mLRzQ0KpkoU8wS6j4wWnSI9rS5WkTjGmUJL8tjubK8ebm54qKhnW6ddd
         hlWkuAcYtMpJx6SD/fNA97YB9FASnJrh2dS3L3qdwPbwMkZd60u5bKXvh+46GA9l53IB
         7kYtNz4YqMfnj0WYJE9klIBeO/+XhzG0qNscO/WI8NJsv9+fPDeLPY50ENZxlzrBKoEi
         5HgkSt71gMPyfpX7Nk7mi6+jwECdmuBnSZNS974SvU+Dwf89uIVoYq36boDLI8JLAf6J
         aLKg==
X-Gm-Message-State: AAQBX9fYAXzn4HYSDerKRmbaDtu8bEXD590NKKvSw+yPE6tmVXne52Zp
	Roikodw93xXwTL01d2dUQVGzcxjVLdxv6KTG/CE=
X-Google-Smtp-Source: AKy350bYCVWPVVIvU+DrDIPLJj6ptCcfYC/TjPJYE8B/rXs4vqSjQId7RPLOgscyV/NFdIsOuVle0McskcJJI+S0bjM=
X-Received: by 2002:a50:a6d7:0:b0:4fa:71a2:982b with SMTP id
 f23-20020a50a6d7000000b004fa71a2982bmr6042472edc.0.1679937107869; Mon, 27 Mar
 2023 10:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144703.1541819-1-robh@kernel.org> <20230313042647.gkth7prhopaa7nnq@vireshk-i7>
In-Reply-To: <20230313042647.gkth7prhopaa7nnq@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Mar 2023 19:11:36 +0200
Message-ID: <CAJZ5v0jpp-+PtTLmM9qSP3W-ny0NV3x-bmjJrfMkxxC+5fbxYw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: pmac32: Use of_property_read_bool() for boolean properties
To: Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 5:26=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 10-03-23, 08:47, Rob Herring wrote:
> > It is preferred to use typed property access functions (i.e.
> > of_property_read_<type> functions) rather than low-level
> > of_get_property/of_find_property functions for reading properties.
> > Convert reading boolean properties to to of_property_read_bool().
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/cpufreq/pmac32-cpufreq.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 6.4 material, thanks!
