Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A611B06DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 04:52:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TNb83QW8zF3r0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 12:52:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VviLB/cT"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TNY81WdBzF3Ps
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 12:50:19 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k13so35782349ioj.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 19:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZmAI5Kneh1f6hodgeBCHENt2raEtEl9n5OlXr4wIQHY=;
 b=VviLB/cTCqGK/W3A1yCJ6xCe6YVWV+WRUIXFf83PIP2Vpjr5fb50LuomDuziamnnIG
 PPbRqD3DIWkXjUeUi/OpyjMtoofvnxzlEpogW7BvR7SEDXjuk1L+a2cGUBp+aPooE4jJ
 MthDx1xDwS+AF3hD65erPj0e37m3Q6T8GsIxHPlW8zEMO3Guf4UshZfLwPO0vquESIR2
 p9d9CZ7+i5Ji8cvE647vQwFNHmePdtqiAEebj382mQidE4AMZS9FxUZMncgguqtOXtai
 VeJU7xwzmlZk4e7HnN3ijjLn7GHrcjOv7nwsnTc1O3sFXhjOnZfzSxPG8ScMRx/K3HI6
 XGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZmAI5Kneh1f6hodgeBCHENt2raEtEl9n5OlXr4wIQHY=;
 b=ck6DBK8/xIRLBFOtNsQ7dUVJkFP8XrrGAFWBBh9RbGuPN8xGdsP3RYS4cEZjOK8YmP
 bNiWlbp3JQWpTX/KqZSaVI+Edq5z/s+i+aFCtFw9khuJHlzfayRmWY/scrcButrAabXg
 3DvGIPQSUd8Ek4Eix1al/XtIhEii8FJeUf+hLh427gLIG7HeMACYt/VpBlpuEWCwms8i
 LTpXeSGvC0fiwkvYKzDMwjaxWAmCZCsuVstcupBY3r3wQgdpT/XXgPwqO3NAMtE6B5Pv
 01I55c1vd+iD2qEZx7oGkymKFhzswFU27EXxtUDirNQ3uC2tfy3uq50cqydENT3/FVuN
 JkPg==
X-Gm-Message-State: APjAAAW9vPKhuHWcSO0iHXqtAiOiDhsbDStXM99cFKW/VsJHRtAX5Fsd
 r4ZnCqjoH0Vb0ZJct4o5HmkPV4FCoOIciAGy+bBT
X-Google-Smtp-Source: APXvYqyBvUS0DpqgnrHnuMsjo2WvP3PtlsGUH3OWaNSiPmImZGbX7e44lcdJ4RT8ryh30aD8HYdiR4IAbnNwjqQoua8=
X-Received: by 2002:a02:9a12:: with SMTP id b18mr40783068jal.70.1568256616579; 
 Wed, 11 Sep 2019 19:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <1568001906-5750-1-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1568001906-5750-1-git-send-email-kernelfans@gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Thu, 12 Sep 2019 10:50:05 +0800
Message-ID: <CAFgQCTtQCSuGszaeoQu3wFozWGvc-mSPBBV31yLwO33OGqshBg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/crashkernel: take mem option into account
To: linuxppc-dev@lists.ozlabs.org
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
Cc: Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NACK it. Due to a miss the updating of printk info. I will send out V2

On Mon, Sep 9, 2019 at 12:05 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> 'mem=" option is an easy way to put high pressure on memory during some
> test. Hence in stead of total mem, the effective usable memory size should
> be considered when reserving mem for crashkernel. Otherwise the boot up may
> experience oom issue.
>
> E.g passing
> crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
> mem=5G.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> To: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/machine_kexec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> index c4ed328..714b733 100644
> --- a/arch/powerpc/kernel/machine_kexec.c
> +++ b/arch/powerpc/kernel/machine_kexec.c
> @@ -114,11 +114,12 @@ void machine_kexec(struct kimage *image)
>
>  void __init reserve_crashkernel(void)
>  {
> -       unsigned long long crash_size, crash_base;
> +       unsigned long long crash_size, crash_base, total_mem_sz;
>         int ret;
>
> +       total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
>         /* use common parsing */
> -       ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> +       ret = parse_crashkernel(boot_command_line, total_mem_sz,
>                         &crash_size, &crash_base);
>         if (ret == 0 && crash_size > 0) {
>                 crashk_res.start = crash_base;
> --
> 2.7.5
>
