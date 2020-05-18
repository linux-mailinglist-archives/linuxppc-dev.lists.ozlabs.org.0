Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D211D75D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:04:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QbkD1W1fzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:04:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a42;
 helo=mail-vk1-xa42.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gI8KKb5w; dkim-atps=neutral
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qbhd13V9zDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:02:56 +1000 (AEST)
Received: by mail-vk1-xa42.google.com with SMTP id p7so2283881vkf.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TnOYIJ1nfLcoOoATov1dQrgNfdtrmD6iK7NVPcue8aw=;
 b=gI8KKb5wg5v2qHES5+bGI2/rAEVGlQyfyhgnrzFvpj0QTqUU0jjur8KfbXqQxC3X0f
 Oj/NDuXfzLcdQd/Ky7f0T/JOKAJ8Vdp4Jp+v5J4MFuikS8hxIRQeSa6WLZPdXf/IvZvo
 aJax/8xpfJCVDt0reyd6pXnSQWAPWO4vhodo/7GrUhA3Wj1q4r9ICNUzfzr9dQ/9X5U8
 BGVDET7wIUJFycZ9kLSGcyKN/B78T3+YBK3P6gqxigN/jDwltMSv58jZGaYPu29V54Cq
 +HblOF0A+hSQXgwsedFi9JHkeOG9e2wBiDvPtaxeU9LaOfh/+XUHNKLwDfRtrMb23t6n
 oUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TnOYIJ1nfLcoOoATov1dQrgNfdtrmD6iK7NVPcue8aw=;
 b=FOK0guzcew4zFMxFGk49SqowzsYqxCDjfHZphmCNXM9YhyEEAhuKnNvIyMHbkLXNHI
 7pEn2uZKQFlUmAv4lR3puVVMF44Gc8sHMQHzqXc3M0ehY/opCK4mIT1cE4XOt/DbL84R
 0hO5LledhNeE+Vt3UOP0YtwzBYj578eDrrwOJNwKsghOpU6b+Mvibfh1bB3rrn2i1GqK
 uLRLLAQvSX0xnPsCM7Bez1Nw4//7U1haDsIS/giMgzrc38LAq1jrdLLxCfrA6mmJo4WZ
 ChOs3ddc1T3VEzu+C0qXe43QZLpz4Bknxy58AdfWaQt9nlvniv1topfVhVCi5u8kGRxP
 sPsw==
X-Gm-Message-State: AOAM530L8vOr7CNZA/7eDDPcm8ZGnU4raw3wfa11PQm4xRHkymQygEvJ
 4us3pbMUQnArpf85q4fnJXyNsCbqtykDas7PdxY=
X-Google-Smtp-Source: ABdhPJwl3t0P8UBkzkdQpBdqsy7c2RThfeVs2tmdfCsbYsQ/Ug1eIUBiEG7XSaPXWJV0OnBR5xJ5kOPd74G5rKrixjc=
X-Received: by 2002:a1f:2bd7:: with SMTP id r206mr818859vkr.28.1589799772920; 
 Mon, 18 May 2020 04:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
In-Reply-To: <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 12:00:01 +0100
Message-ID: <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Benjamin,

On Mon, 18 May 2020 at 01:45, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Sun, 2020-05-17 at 23:05 +0100, Emil Velikov wrote:
> > As mentioned in earlier commit, the riva and nvidia fbdev drivers
> > have
> > seen no love over the years, are short on features and overall below
> > par
> >
> > Users are encouraged to switch to the nouveau drm driver instead.
> >
> > v2: Split configs to separate patch, enable nouveau (Bartlomiej)
>
> Back when I still had these things to play with (years ago) nouveau
> didn't work properly on these ancient machines.
>
I believe you reported issues due to different page size for the CPU/GPU.
Have you tried nouveau recently, there has been a handful of patches
on the topic since your report.

Alternatively, it would make sense you rebase, cleanup and merge your patch.

-Emil
