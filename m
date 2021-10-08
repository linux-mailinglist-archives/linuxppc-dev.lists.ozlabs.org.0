Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32E426412
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 07:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQcFN5WFnz3bjT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 16:29:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=DmZ3bBlJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=DmZ3bBlJ; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQcDl077Kz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 16:28:52 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id q19so6738607pfl.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Oct 2021 22:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fRVqtB6tjc3sxvXUb6FPScwW0I2W4WcKV6lwQWDcLCc=;
 b=DmZ3bBlJOasNrb5KADrKm87TITN3NDKvTs+ZM+h0mGXkGv8yuRH2ITtU6l5wtXhJjg
 FfXvz1XmlILKnNdcoQHrztrjUkxDw9bI/71PS/u7zk6yXUGxC9JyEnUgqvMXsL1R6UVP
 W0gU+aQx7Ag7ey4mpODEmfcC+xaMjYqzxZ81E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fRVqtB6tjc3sxvXUb6FPScwW0I2W4WcKV6lwQWDcLCc=;
 b=S5QyC/OQOpwWcWV8dPiTKACoBbwqTU7VQ6/MeW93yjjwfLWgT+zwi6ajiBD0GGfgMF
 7CigY018wtyOdb4HmMvdDOlr5wYrSSknW+EELWv3F6HQq4m7d4jm2HLZcz0ZAb8c0Kjt
 C90x3eHp6JfonO8vnUh91GsqASlJJ3s4erdtSJcOELA5FwRwiNA7eFLrtWT3mZKMZVMN
 PiKK/hDcrhAnri5wJDdfYv5omziP/v47/Mjyi0yflkoA7MT7QEC71vn244qgS8roXyhP
 eRMXdLWXICoRt13xWsebpbqDTNbY/+uf+tfW4wd9+uzQoC5e87lCUpekFt8qeMLBqOpB
 1ptQ==
X-Gm-Message-State: AOAM533tK2cKyzVIt30GMpwdX+gC/ucac0zNYyT9+IUgcoIVT1tdAHu6
 eLZ1TzfSReSqgPGDAkb8uNlqHQ==
X-Google-Smtp-Source: ABdhPJxuoOzh1q8JULgfQ5PGm/uIRI18M05Ij8xii/s2kVbwq4ah888VH5topVgKX2VkoUWDB325lw==
X-Received: by 2002:aa7:8294:0:b0:44c:c0b:d94c with SMTP id
 s20-20020aa78294000000b0044c0c0bd94cmr8323003pfm.24.1633670929752; 
 Thu, 07 Oct 2021 22:28:49 -0700 (PDT)
Received: from localhost ([2001:4479:e300:600:b4a4:1577:dca8:77b9])
 by smtp.gmail.com with ESMTPSA id l18sm1130657pfu.202.2021.10.07.22.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:28:49 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Kai Song <songkai01@inspur.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/eeh:Fix docstrings in eeh
In-Reply-To: <20211004085842.255813-1-songkai01@inspur.com>
References: <20211004085842.255813-1-songkai01@inspur.com>
Date: Fri, 08 Oct 2021 16:28:46 +1100
Message-ID: <87czog9jap.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: paulus@samba.org, Kai Song <songkai01@inspur.com>, oohall@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kai,

Thank you for your patch! I have 3 very minor tweaks and I am otherwise
very happy with it.

Firstly, in your commit name, there should be a space between
"powerpc/eeh:" and "Fix docstrings". You might also want to say "in
eeh.c" rather than "in eeh" because there is eeh code in a number of
other files too.

> We fix the following warnings when building kernel with W=1:
> arch/powerpc/kernel/eeh.c:598: warning: Function parameter or member 'function' not described in 'eeh_pci_enable'
> arch/powerpc/kernel/eeh.c:774: warning: Function parameter or member 'edev' not described in 'eeh_set_dev_freset'
> arch/powerpc/kernel/eeh.c:774: warning: expecting prototype for eeh_set_pe_freset(). Prototype was for eeh_set_dev_freset() instead
> arch/powerpc/kernel/eeh.c:814: warning: Function parameter or member 'include_passed' not described in 'eeh_pe_reset_full'
> arch/powerpc/kernel/eeh.c:944: warning: Function parameter or member 'ops' not described in 'eeh_init'
> arch/powerpc/kernel/eeh.c:1451: warning: Function parameter or member 'include_passed' not described in 'eeh_pe_reset'
> arch/powerpc/kernel/eeh.c:1526: warning: Function parameter or member 'func' not described in 'eeh_pe_inject_err'
> arch/powerpc/kernel/eeh.c:1526: warning: Excess function parameter 'function' described in 'eeh_pe_inject_err'
>
> Signed-off-by: Kai Song <songkai01@inspur.com>
> ---
>  arch/powerpc/kernel/eeh.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index e9b597ed423c..57a6868a41ab 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -589,6 +589,7 @@ EXPORT_SYMBOL(eeh_check_failure);
>  /**
>   * eeh_pci_enable - Enable MMIO or DMA transfers for this slot
>   * @pe: EEH PE
> + * @function : EEH function
I don't think there should be a space between '@function' and ':'.

I know the parameter is called 'function' and I think "EEH function" was
a good guess for the docstring. However, if we look at the way
'function' is used, it is compared with EEH_OPT_xxx constants, and then
it's passed to eeh_ops->set_option(), eeh_pci_enable() is also called in
eeh_pe_set_option() with a parameter called 'option'. So I think maybe
'function' should be described as the "EEH option"?

This is still very unsatisfactory but it's not the fault of your patch -
the EEH codebase is very messy and it's worth fixing the W=1 warnings
even if we don't fully clean up the EEH codebase.

> - * eeh_set_pe_freset - Check the required reset for the indicated device
> - * @data: EEH device
> + * eeh_set_dev_freset - Check the required reset for the indicated device
> + * @edev: EEH device
>   * @flag: return value
>   *

This is good.

>  /**
>   * eeh_pe_reset_full - Complete a full reset process on the indicated PE
>   * @pe: EEH PE
> + * @include_passed: include passed-through devices?
>   *
>   * This function executes a full reset procedure on a PE, including setting
>   * the appropriate flags, performing a fundamental or hot reset, and then
> @@ -937,6 +939,7 @@ static struct notifier_block eeh_device_nb = {

This is OK.

 
>  /**
>   * eeh_init - System wide EEH initialization
> + * @ops: struct to trace EEH operation callback functions

I think "@ops: platform-specific functions for EEH operations" is
probably clearer?

>   *
>   * It's the platform's job to call this from an arch_initcall().
>   */
> @@ -1442,6 +1445,7 @@ static int eeh_pe_reenable_devices(struct eeh_pe *pe, bool include_passed)
>   * eeh_pe_reset - Issue PE reset according to specified type
>   * @pe: EEH PE
>   * @option: reset type
> + * @include_passed: include passed-through devices?
>   *

This is OK.

>   * The routine is called to reset the specified PE with the
>   * indicated type, either fundamental reset or hot reset.
> @@ -1513,12 +1517,12 @@ EXPORT_SYMBOL_GPL(eeh_pe_configure);
>   * eeh_pe_inject_err - Injecting the specified PCI error to the indicated PE
>   * @pe: the indicated PE
>   * @type: error type
> - * @function: error function
> + * @func: error function

This is good.

>   * @addr: address
>   * @mask: address mask
>   *
>   * The routine is called to inject the specified PCI error, which
> - * is determined by @type and @function, to the indicated PE for
> + * is determined by @type and @func, to the indicated PE for

This is good.

When you resend, you can include:
 Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
