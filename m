Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78E6F745
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 04:45:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sQvQ5q4lzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 12:45:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xp2/lYdr"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sQs402WmzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 12:43:19 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id u25so23387671wmc.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2019 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aCIw0Vy9KSLKWPzknfpX/7qQ/M+ZYVeRzfb1AdszhK8=;
 b=Xp2/lYdri2nLJDOlJfb211oI7elKKCL7sv3olg1Vg53EBJdF8zXcHEjoMwEYKORhJ9
 G9c8gBRAJkUBPoVtHDNKhod7PSDLP7q1j/bhEKpcIyM/Ll9TMeag8Uca/4SaXABE2358
 4TCbeHhOFh6ClxCvpR2MKU0ecVGRHIqEKkMB3Wq/GD/B6+uwE/DWDyRWN6ccHegZXz+j
 /NcCtOj5uhCQyQ5e5tLRkBW1eMw+/BNrQ/JIDwdf3PdPOpOGYD4NU0piXolynZn/pF46
 tYRysmQ6XKiEUN7JE/jCBX3vXMutKXEPrp8EGG2Pq8Yd32/uHs2DGGOoOqo7qwiqWbiR
 3kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aCIw0Vy9KSLKWPzknfpX/7qQ/M+ZYVeRzfb1AdszhK8=;
 b=URmDKyR9brwEL9eHphEpMz7HWnSqO/qMtLqWyUFp+GjyWaIU1xGoh6WsJ7WJEOsoeZ
 bYEMpdJdaVfpqlJyOXd3EweKGTVkIyetS289FREKTh3Pb9VWM8WUY+L6TetU27HLCWh8
 C2FAXMhsvZ0Hqo7q4PTzb4QACKcS5pJKEECJLhjb1qFeZXWyDXgJYNTzdbcLNzhUmZ2f
 CJLMyBBApJZT2mNHuBFWL6nrdVz9JA9phShqEPlehJO2MYO9N/2ovsN8i71KCqU3IWqa
 kZ7QGV+kB1qgTUQk8xz0FsnhxuMAVT9iFEGvl4yXZZYQhZZvxofqRGebnbNngqrXLNg2
 23eg==
X-Gm-Message-State: APjAAAUnoMKCJaTlM6TXx64cGBM8GAuQOSbfECv2ZIMHQm6FQoN1Suvy
 0WFiLo8Otn6wWKPiYMdrxQA=
X-Google-Smtp-Source: APXvYqwLGEAu9/+LcJntGKJF6CScFDMheye52JHREJd6cZFZp7tdNkOE+88+DP4iTwTXAkSiLobYuA==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr30063516wmh.141.1563763395957; 
 Sun, 21 Jul 2019 19:43:15 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id 91sm80347851wrp.3.2019.07.21.19.43.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 19:43:15 -0700 (PDT)
Date: Sun, 21 Jul 2019 19:43:13 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] PCI: rpaphp: Avoid a sometimes-uninitialized warning
Message-ID: <20190722024313.GB55142@archlinux-threadripper>
References: <20190603174323.48251-1-natechancellor@gmail.com>
 <20190603221157.58502-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603221157.58502-1-natechancellor@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 03, 2019 at 03:11:58PM -0700, Nathan Chancellor wrote:
> When building with -Wsometimes-uninitialized, clang warns:
> 
> drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
> used uninitialized whenever 'for' loop exits because its condition is
> false [-Wsometimes-uninitialized]
>         for (j = 0; j < entries; j++) {
>                     ^~~~~~~~~~~
> drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
> here
>         if (fndit)
>             ^~~~~
> drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
> it is always true
>         for (j = 0; j < entries; j++) {
>                     ^~~~~~~~~~~
> drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
> 'fndit' to silence this warning
>         int j, fndit;
>                     ^
>                      = 0
> 
> fndit is only used to gate a sprintf call, which can be moved into the
> loop to simplify the code and eliminate the local variable, which will
> fix this warning.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/504
> Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
> v1 -> v2:
> 
> * Eliminate fndit altogether by shuffling the sprintf call into the for
>   loop and changing the if conditional, as suggested by Nick.
> 
>  drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> index bcd5d357ca23..c3899ee1db99 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
>  	struct of_drc_info drc;
>  	const __be32 *value;
>  	char cell_drc_name[MAX_DRC_NAME_LEN];
> -	int j, fndit;
> +	int j;
>  
>  	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
>  	if (info == NULL)
> @@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
>  
>  		/* Should now know end of current entry */
>  
> -		if (my_index > drc.last_drc_index)
> -			continue;
> -
> -		fndit = 1;
> -		break;
> +		/* Found it */
> +		if (my_index <= drc.last_drc_index) {
> +			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
> +				my_index);
> +			break;
> +		}
>  	}
> -	/* Found it */
> -
> -	if (fndit)
> -		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
> -			my_index);
>  
>  	if (((drc_name == NULL) ||
>  	     (drc_name && !strcmp(drc_name, cell_drc_name))) &&
> -- 
> 2.22.0.rc3
> 

Hi all,

Could someone please pick this up?

Thanks,
Nathan
