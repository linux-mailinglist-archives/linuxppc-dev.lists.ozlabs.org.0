Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D1F584967
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 03:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv9M64fr1z3bpW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 11:45:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DkPDztBr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DkPDztBr;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lv9LV0QWMz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 11:44:48 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id oy13so6044837ejb.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 18:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aF9gxkNndIgzxO4AAV2+dCxMOnVAFOcQmkQ7z0dG0LQ=;
        b=DkPDztBrjKGeUM8fYgh3HSkhbfjiQ1Do2/grF7UQtK9v28BIKg0JZ27vfyJNxRzttm
         3vXvuKJWjqWpPD0HunGTmKg/NhUka0O07nOS+qJokOgHQPdsQNSmtpx8CNQ5VNJu9GTM
         K8gFEH2/If39puZptjgci66b3Q5rd3xt58Ic0GZ/UGq7cjIcgzBZmU1KbvsnQzdN+S/5
         1HtH07umLN1aiAf51mXocMACYoRm+LiMYIM8+N472n3L8bnHd+RNI4OqIh9het/5iGir
         S8t12mQM6/hq7GEwheCmjTHUdxAy89NucTWTIQHKzq0Qs/+pAhLDR25D55Mp6YyGd3Y2
         eM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aF9gxkNndIgzxO4AAV2+dCxMOnVAFOcQmkQ7z0dG0LQ=;
        b=cCrbHWxsUB/+OW7C8l3ZKLCrmpNf/XsR4nvCuUfT+jO1be7BeW+2qwMrwl431YKb5V
         Esc5VioGmaZ5vqMnIIvJANlLT0ZrdhjR1bCAflgq6QSC7fQEFJAJ2vVyCWRPqk7fCZZt
         QrWSGsLrK5bev3/oQqO+F9+EmuFH0HvQbSKJdwCkGOe4cpO+pPH9QtuP9jleIB8asqFO
         wyTyGzDnPYpG+JEcNWt3q275vRKE7g3jnHMdVl9iqyiMcnPORlTYFfjsDelJp23ceUOx
         vtavcJ8vKfvhchx3VxHaJh0fu0BhhBT3gHds9QleanmwvflCQjfcFxj/HOzDREPqvgFo
         YPOA==
X-Gm-Message-State: AJIora8AZVo5nJf2rfNX4xO7pL0rGogqELLWyANPvY/loEfqgPUWjuS6
	m98608U21iwr2PB8LH2Gj2DP9rKJEtWQ4vra4cQ=
X-Google-Smtp-Source: AGRyM1vjQcSp2ZAQaomxl7a1v4biiRSbfuqN2bNchtQAYfANA3sZxwrE0GMkEQoF47S8DtLsOTbRn0bVDeMbcPScxsM=
X-Received: by 2002:a17:907:2ccc:b0:72b:6907:fce6 with SMTP id
 hg12-20020a1709072ccc00b0072b6907fce6mr1155919ejc.115.1659059079918; Thu, 28
 Jul 2022 18:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <4A5CBF60-9590-417D-ADE7-7C6FDA8520DB@linux.ibm.com>
In-Reply-To: <4A5CBF60-9590-417D-ADE7-7C6FDA8520DB@linux.ibm.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 28 Jul 2022 18:44:28 -0700
Message-ID: <CAEf4BzZPaYzhH6zoJVMrOyJOPOcs19xUkmmw2y0uRFF5Z_eznA@mail.gmail.com>
Subject: Re: [next-20220721] Build failure powerpc (tools/bpf)
To: Sachin Sant <sachinp@linux.ibm.com>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Andrii Nakryiko <andrii@kernel.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 22, 2022 at 12:04 AM Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> next-20220721 build fails on IBM Power server with following error:
>
> libbpf.c: In function 'bpf_program__attach_ksyscall':
> libbpf.c:10130:45: error: '%s' directive argument is null [-Werror=format-truncation=]
>    snprintf(func_name, sizeof(func_name), "__%s_sys_%s",
>                                              ^~
> cc1: all warnings being treated as errors
> make[4]: *** [/home/linux-next/tools/build/Makefile.build:96: /home/linux-next/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
> make[3]: *** [Makefile:157: /home/linux-next/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
> make[2]: *** [Makefile:55: /home/linux-next/tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
> make[1]: *** [Makefile:76: bpf/resolve_btfids] Error 2
> make: *** [Makefile:1439: tools/bpf/resolve_btfids] Error 2
>
> next-20220719 was good. Git bisect points to following commit
>
> Commit 708ac5bea0ce
>     libbpf: add ksyscall/kretsyscall sections support for syscall kprobes
>
>

This was addressed by [0], thanks for report!

  [0] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=64893e83f916

> Reverting this commit allows me to build the kernel.
>
> Have attached .config used for build.
>
> - Sachin
>
