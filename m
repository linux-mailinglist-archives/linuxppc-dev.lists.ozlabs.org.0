Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8857AD3FA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 09:37:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rg4C047mzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 17:37:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGexeQOE"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rg2J2RJmzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2019 17:36:07 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id h144so26401417iof.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 00:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Olh0HkYVG6IgKrYs1R7UqQ+ar8IwHjJWfeofMa1TYI4=;
 b=GGexeQOEkl3tskjdTpMvOKbanOMVO+ctS5FByesB6AHlLAeZla0b5yClSgTv/yVLmo
 LEAwE1z33ftJLbjx8VIJd89gM385TBktexe1cqJmFlIk/XANsqqb2+CrxFKXM60jmfH/
 Jd6AN7N+pPZK05pUf/DH3jGOCKrgFHgQes0pQKxZw++ctBb6ryylPuQLc46mtW6NQ4v0
 6+2hhU2QDOp9aow5Rf9DWQ7NYF0FtOPiU7aynQvF7Yy4XpBolqFRyZZpK+FaUzi82iox
 orLWUBg+DHtqJvxcmkjBzAPzHN6YrZI50oKqHU7N1K72w1zQe1BvgokRvon9l5SiHV+n
 HG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Olh0HkYVG6IgKrYs1R7UqQ+ar8IwHjJWfeofMa1TYI4=;
 b=EG6KVjgu038bFglUHpLDCCm9+1braz0oaWYEK/aF/ytvKFQWPHIVHsGzxErGGWDVf+
 IaxjWMlrEsfpwCX3rTgGvtC2Nd54zoDb+jzVVMvBcnvhh4Uvrh+eJx9YdGwviPm5EF5e
 OPBgP7ssQKNCUzfvEPgajA8DJRY6YIHIBbak3ONVykFkJoWpVl6JhlNgD65EoVGxjM8G
 1m9c2SggoetfKDm/zxAp1iuXZywvrf2GAlx8WozlDF5n+sUVWBE81B9tdCGVSD3GEu/f
 EIlWvz0bwWAM4W2bcwVV3U4UeFE9iNmDTCIi5RuaJTZkAUsUQqeZ8iXuZZjBHLzoxSzF
 f4lQ==
X-Gm-Message-State: APjAAAWewEPQnhGrukGCk5/oCnm+kfhzKIjVpJ6PuPYaFRYX+uJSmKVo
 wtgRyennBllnVqH1m4gsngrq2m5G7wIvTVjCvMGhQPA=
X-Google-Smtp-Source: APXvYqwJAimqsXLm63hYJo/MUNGHiSwOBeMuoKcMLaChvm3CGWLo+GSWCgXp2BmdO4IA7+nRrW0kmO0wFRn5YRIyxno=
X-Received: by 2002:a6b:fc02:: with SMTP id r2mr791051ioh.15.1568014564774;
 Mon, 09 Sep 2019 00:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <1568001906-5750-1-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1568001906-5750-1-git-send-email-kernelfans@gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 9 Sep 2019 15:35:53 +0800
Message-ID: <CAFgQCTs_+bOxLKeD8rfqjbkXOeEm7xbSVj0z7pby9M=Qj6Tedg@mail.gmail.com>
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
Here memory_limit is used to esstimation and may be changed.
So I think it is better to use memory_limit here than moving
memblock_enforce_memory_limit() before the call to
reserve_crashkernel()

Thanks,
Pingfan
>         /* use common parsing */
> -       ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> +       ret = parse_crashkernel(boot_command_line, total_mem_sz,
>                         &crash_size, &crash_base);
>         if (ret == 0 && crash_size > 0) {
>                 crashk_res.start = crash_base;
> --
> 2.7.5
>
