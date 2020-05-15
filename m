Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B383F1D5A3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:42:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NzMv6rtCzDr6w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=soleen.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=pasha.tatashin@soleen.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256
 header.s=google header.b=EQXfVFJ4; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NzKd5690zDr1Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:40:53 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id bs4so3174272edb.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HHca1qoV7do/YHj6VhiHa0wv0gL1FKGrqV5m6xaYOco=;
 b=EQXfVFJ4yz515JshhnvlO7USDVNFwG69NR5tuhWjf7zaSGV2LSZOG/FpNAtUosLSnU
 9ts0wbGytpuSheRP3ZoyHaJVy+JsQ1Z1Cvaptopb1n0wqaABjBwhlg6Tv1gRZWEWU5N7
 Xf1NHtzI2/d6wc9/JoXFFotJC6AdETHGlu7ZPHF46mQb5LSagZDXg01u6m6RSJHqGCsX
 G8zguFhZtGVf+wbDNstxQsF4RSs6m0HY3WenqGd6CGw5+MyM67ss838sKv8JWxkfdLV5
 BSMpNrRreffqc91pQEzZgU61/CDkmb2Sw9K1pJvrh01opTu3O/0yWLHR5K/QMsJImlTO
 jHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHca1qoV7do/YHj6VhiHa0wv0gL1FKGrqV5m6xaYOco=;
 b=MRjvqznpiB91eeB14/9RtZDbW9o5q7I/w/aBVD9HI+IxcuN6LmWxA/uFAxMcLKn/ba
 EN3mOQKDre8WUX4053n0d5yLdm7sdUkDDaa8xglFKIPGZr2YW9qqduxUVPPuGhAHMMYQ
 8y73Ys+E98h/PvPN1/VHeFIrvPTrJkiYNTtPNCwxu5UXOWnqZmzeTjDX9bjAb7K41Iky
 aBoAv+prK2AbIuAL2eOkoZ0HLKVdSeRWMDxhlWAaRInVPzCj9VkZQT4rj8Yp08SiBDZN
 2tcW+JkMHg1NAHwjszW6Xzsj7wBB8TZaZaGpSoMKDl5Gqf0a8MSY7trTEU2TBWUjm1dr
 MvbQ==
X-Gm-Message-State: AOAM530nyDGJiwGQzFQ3hpP3l4fCwOjEjzbn8++np3SPbkpi6NW4MHOV
 gjBmTuhNUbjw+52TiCIRsZLqVqdKG7+HNoBjyzV35w==
X-Google-Smtp-Source: ABdhPJy3hW9KN8C+0k3e1QtNg/q5jcxANsOo4JOf1UIs/QMiOLnU+PzMoJv7/O4icSIDCXxitbkF0rZPLnkBSitoNmc=
X-Received: by 2002:a05:6402:31b1:: with SMTP id
 dj17mr4543330edb.142.1589571650510; 
 Fri, 15 May 2020 12:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-6-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-6-keescook@chromium.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 15 May 2020 15:40:14 -0400
Message-ID: <CA+CK2bCbAb1EN6xa9a-DRfan6Cv3YgZgPJ1buwUaej7jBRv=Kg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert
 dump_oops
To: Kees Cook <keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 pdata.dump_oops = dump_oops;
> +       /* If "max_reason" is set, its value has priority over "dump_oops". */
> +       if (ramoops_max_reason != -1)
> +               pdata.max_reason = ramoops_max_reason;

 (ramoops_max_reason >= 0) might make more sense here, we do not want
negative max_reason even if it was provided by the user.

Otherwise the series looks good.

Thank you,
Pasha
