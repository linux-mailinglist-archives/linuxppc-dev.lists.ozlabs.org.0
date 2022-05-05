Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A955051CBC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSKW4gzJz3cBT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=p5gWrt/A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256
 header.s=mail header.b=p5gWrt/A; dkim-atps=neutral
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQM33VS7z3bxr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:30:50 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N63JO-1ntTNL2HRw-016TAG; Thu, 05 May 2022 22:29:31 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 71CFD3C088; Thu,  5 May 2022 22:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651782563; bh=wVmgLLHKta8PUSVIgVtK/1NnMmbzgztoT/WwL6D71Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5gWrt/AhpbEjf/JeLl3pOYQGqIkCIEmpciAUncAWUB0EtaDHQuMAzikXCpLS4Ccp
 +yMBf56zg2EUXDLFMzlvawEbbxLcBVdnOFYlf1kDYa0vYG8cMaPq69u9pGenvvliSJ
 9tHzoS/o4jQSB8XRbFhYuJDj6YbPfuM5SvjoU06Q=
Date: Thu, 5 May 2022 22:29:23 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 14/15] kbuild: make built-in.a rule robust against too
 long argument error
Message-ID: <YnQzox0FyZuGmRQ0@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-15-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-15-masahiroy@kernel.org>
X-Provags-ID: V03:K1:g7/GEkNdzZQcHIJUtCmuKgFMiYguYvVDH+d7WyytcfLFvAyhgrE
 5sNn8CrlM3fsZq6LKQytxDubyW6P7Q3FYIzsZp1qwE1V6/OA+NZgqQKbz3DZXaLlagXkvlb
 yapZ1jiodr0qTdSvbPs5M5ciqINjQTHyt5/w5En0gHi9YA8RyUsbitDfT0QwC+goW8RPyW2
 rY+hBNh9hgOUj6XoX40Hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qmh5ea6yBWw=:7D0YyBIUbelpCfX/ybbplC
 02KrkJog2HFhcv2/zIJKx3LPytiUxwOh/5Y2yjqTLGMe37hsQ52pKrLaN4dHHpDqdcr4NQwE6
 QrVjL3gSwdHgsA6T/z3Dbsen8ftOD3G5JN8TwXvty5s15SeZsprEzkN5CoMukx9gK4noS7doH
 MrqBSTit7soJJFUL4XuXdYqXrdfXU5ynZrg3yhIBIM/rk/FhsGXyqCv0CyAqkhQDtA03smYvH
 3g5D0Qp8k7M0uMVSiIs3dG6/zEKMRj0oyGIfGaGvmAJguh173xPREnma3wnnZFZT12bGiyFAO
 +WEBvsl0ocx5cJ6KHg7pOQKAekSgDdQxZ9Yb5X1kb2RF7/J9AcFc0EXt1OBNtlBGrSH2W27LR
 IA7qHL7u5x/mrVaLxhSRuB/8XnG3rMsmEh0a5kLCYb5YveRKABCxO9/XddpP995NK3BvqM5Vb
 hZOvBTQ7wIFxGSb+WFEAIzP1qFYYiPuxI/kEBS02W7Sete3OOGCq4zwqNq0Aa+5Bf5hIDa/wc
 +PQ5dUq3CVSfOt6VE+qDclwYTdXD3f15Dj6ZLdnXA36LHFi6xa+o67KPBYoKpQp4uovGSNTRI
 qQMzTi1/VnxA9wtEC5xEWIGf/ofRjgf89/taY12Kari8DNYkX8PS/XfkHgCpGpSFgxK3YWBLm
 1h8/3xpprDh/Cjvcyy5Lcb9tK9UDEwYXLyuACyYLLJ1h6zm06gLpuByX5X+CsD6zzxrU=
X-Mailman-Approved-At: Fri, 06 May 2022 07:52:56 +1000
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
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 04:22:43PM +0900 Masahiro Yamada wrote:
> Kbuild runs at the top of objtree instead of changing the working
> directory to subdirectories. I think this design is nice overall but
> some commands have a scapability issue.
> 
> The build command of built-in.a is one of them whose length scales with:
> 
>     O(D * N)
> 
> Here, D is the length of the directory path (i.e. $(obj)/ prefix),
> N is the number of objects in the Makefile, O() is the big O notation.
> 
> The deeper directory the Makefile directory is located, the more easily
> it will hit the too long argument error.
> 
> We can make it better. Trim the $(obj)/ by Make's builtin function, and
> restore it by a shell command (sed).
> 
> With this, the command length scales with:
> 
>     O(D + N)
> 
> In-tree modules still have some room to the limit (ARG_MAX=2097152),
> but this is more future-proof for big modules in a deep directory.
> 
> For example, you can build i915 as builtin (CONFIG_DRM_I915=y) and
> compare drivers/gpu/drm/i915/.built-in.a.cmd with/without this commit.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>   - New patch
> 
>  scripts/Makefile.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0436ff94800e..cea48762299c 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -370,7 +370,10 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>  #
>  
>  quiet_cmd_ar_builtin = AR      $@
> -      cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
> +      cmd_ar_builtin = rm -f $@; \
> +		echo $(patsubst $(obj)/%,%,$(real-prereqs)) | \
> +		sed -E 's:([^ ]+):$(obj)/\1:g' | \
> +		xargs $(AR) cDPrST $@
>  
>  $(obj)/built-in.a: $(real-obj-y) FORCE
>  	$(call if_changed,ar_builtin)
> -- 
> 2.32.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
