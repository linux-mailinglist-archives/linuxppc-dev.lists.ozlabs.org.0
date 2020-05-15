Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B91D5A05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:31:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nz6k17c0zDr0f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:31:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=soleen.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=pasha.tatashin@soleen.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256
 header.s=google header.b=PY8rmKLs; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nyyp0CBwzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:24:33 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id o10so3146113ejn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a36hrCvkPbUg843/bSmumOn78+ipKHZWMg5XvSohP3o=;
 b=PY8rmKLsoOIAWMnudxgpiJvpNf1j1UsqVeSDR8qlbXb2PjKGGE3Wy9ytx1c5odlDP2
 Y7jk9kBiWi7s1ZLcWH8gNy4I4cxa944o1z8d63G/2gVgyWoKuFjsq31zCukSiMz9oVQ/
 q8mhT3nJbRKKl9LI8v8k8kBSrTeWoVS362oOdyavmXQbvC38loTmUXVsni8RSKwK5Cyw
 D2iY8jmZ9218Wo/3qB8puStPuHYFj0i0Zknw9HkhR3zgwqCCuOP12NAqbL4BZqQX6tJu
 ADQT2pCL13mYBwfnUOewfIEfVDaXhfsbM/h3ASSw7rt+zEL5wAewbqddkbJ4mno36n7h
 pQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a36hrCvkPbUg843/bSmumOn78+ipKHZWMg5XvSohP3o=;
 b=X4mh+Mo/l0JadvFvsjWdtRIJB7uYSot1fkUEPt9kOw22T5vK9HFok+uiGFmiAx7lbb
 g2UgDOhe4oPW52v1aKKF3/bXpoME5k002Oyvw6/Xb/oTZ80GirzNikdP+MKir8rIr6f3
 HStC9BhPxr3N5OTETTnBRGutPS35mfAf9OVB/fmyrFEyg/icUwPsYdGcON206lZ8E/8+
 MLACJuuxKIzPeB+4i6l961JpRQvtjLsPErfFFTzNldffPFaOywu4/EwF9YNT3eU2d1QM
 wnsVzNXJOAgXkUeAysQdN4sSPzsuGkAxxR3MN8tli6+pGizqZVslsljlekvdGtJmdZo3
 Vs0g==
X-Gm-Message-State: AOAM530K/QjHenW8d3MO/DNB1Q06BS3yhinyLO8Uy/n3XC6ro1Yyuf5l
 UF4BDi0SXxTapBvRFlqVIbjoWu5To1jiG9q9cuqSAg==
X-Google-Smtp-Source: ABdhPJzjo4HsWFSrpU7PHPWN+VC1EtmQWOEZbJjdzveuqDK930f9zFXRjleWAFRW4YK8ia6ElnSqJyxhw48h+Oaon94=
X-Received: by 2002:a17:906:aed2:: with SMTP id
 me18mr4576716ejb.283.1589570668270; 
 Fri, 15 May 2020 12:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-4-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-4-keescook@chromium.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 15 May 2020 15:23:52 -0400
Message-ID: <CA+CK2bDvsoOMKb_1Q1eAy4mcrDs6hUOtkr+3AM2nXoJD2+q93g@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] printk: Introduce kmsg_dump_reason_str()
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

On Fri, May 15, 2020 at 2:44 PM Kees Cook <keescook@chromium.org> wrote:
>
> The pstore subsystem already had a private version of this function.
> With the coming addition of the pstore/zone driver, this needs to be
> shared. As it really should live with printk, move it there instead.
>
> Link: https://lore.kernel.org/lkml/20200510202436.63222-8-keescook@chromium.org/
> Acked-by: Petr Mladek <pmladek@suse.com>
> Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
