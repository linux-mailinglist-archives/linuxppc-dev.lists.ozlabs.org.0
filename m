Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525A51CBB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSJ70Z3Qz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:58:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=PAx9fB2N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 351 seconds by postgrey-1.36 at boromir;
 Fri, 06 May 2022 06:27:01 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQGY5c7tz2yHt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:26:57 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MGgRW-1na0dH2Qr4-00DsuE; Thu, 05 May 2022 22:19:45 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 2B3143C088; Thu,  5 May 2022 22:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651781982; bh=bg+HVLXZ4GeOEztHmsf/QJzV8C4FIObgcJiyzv+H0UM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PAx9fB2NHoFbOqmE6IzPcukGKSh96UrYF6rKFC9M4htsjy3UYGxuyQw6ayrvxTE1R
 HbcOqeXamS48kIlbn2I5kDCN6+f+R7SaFOehW4a61Ip56uWYLaDwyN2s4imiUAzFuE
 aezSEmR+YT6F+jpOeNEh8WPL0bXstai+AlPRU1oA=
Date: Thu, 5 May 2022 22:19:42 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 09/15] kbuild: stop merging *.symversions
Message-ID: <YnQxXsVKDZwj9ML7@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-10-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-10-masahiroy@kernel.org>
X-Provags-ID: V03:K1:kLv07Zu9KjSI8dVtarU8l8sxPufYBTVjB5tuKOltZ/T9hk437XX
 vNQ8NEBvRXubh7ts7FDOU2bMa4E55pDRJDTQNO77MACY5JbN+i20cUNkkZfWpaF6VKXKNsO
 K6ZEEHtGEvsnSVoXklrgpTo5J5l7CIEDsKJ4KoactoMHkKWNef3Lt1Zb6Uqthrmqhijy68i
 o6vPO+d07ACl7HYX2WrsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:56j5w0uERFs=:Wggqn7OV2pf59GbefNHbFd
 6JWdxDjkW+WHjXfpQtCqgcNB9i2IFsyDAiJyG0AxiGLxNvJ6i2ir1XZSTc6nO/FY0SlijwzUO
 pzmR60aFfNt4xtO2jC4gnKvbJKF8k7DI7SjqRfoX8Ssd6cBHDwYXUMZmOAOlCvdLSnmTN0PsX
 qsXVhLiGxXiY2CllNYxPTpUIo83DeZkAnuvO+Qez/JOnjSgqrLbMwiX/3dYuYposNQ1KZnfjg
 WagRGhO1+fHzcV8ZAY1lY/yBXZfv7Q7tp3eSSKS8I9MTmt+2c765tHT8BLKPe3Chn6G7cnKJx
 1p6lRT5cEaLvmuIqW3CCERkC/MSiy0FGGtX0s48/2j/noowEvLR2O5f29oS7cpdJ4ym+xfgyu
 4XNp370h75YCiIcQSa0aOT+CZ4M58EKsWrph0mgL/FyV9unHju86T20wOBmgEwb9SZn4Zg1b+
 FNWsNHrL6+hqDxR3tTLoyYuNiRvkvphfpr+mpjYQWEv5IWLV2MyEvTUbsBwWVDSVyFLC/ZIeb
 LWHLdd9y+D/7AnaKA2KE3Z5zS0i/hw7Rh5dzB0A7TcPuKe2/0Ka86qwUU07Qs2KGp7KKEoqj1
 4lhNtcjY6h2qqROwf31BSNp3imh0XLdOMTbHN3l3wI1Xyo/cecKyK3mnQ5vDoNI1ksXBS54+5
 y5oDfX1J5s2wN9E1yym9+wRaA3GrskUoHlx2gq0fo98zuVawhPKvMmdIGJ3pJUe0DFmc=
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

On Thu, May 05, 2022 at 04:22:38PM +0900 Masahiro Yamada wrote:
> Now modpost reads symbol versions from .*.cmd files.
> 
> These merged *.symversions are not used any more.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> (no changes since v1)
> 
>  scripts/Makefile.build  | 21 ++-------------------
>  scripts/link-vmlinux.sh | 15 ---------------
>  2 files changed, 2 insertions(+), 34 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ddd9080fc028..dff9220135c4 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -390,17 +390,6 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
>  $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
>  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>  
> -# combine symversions for later processing
> -ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> -      cmd_update_lto_symversions =					\
> -	rm -f $@.symversions						\
> -	$(foreach n, $(filter-out FORCE,$^),				\
> -		$(if $(shell test -s $(n).symversions && echo y),	\
> -			; cat $(n).symversions >> $@.symversions))
> -else
> -      cmd_update_lto_symversions = echo >/dev/null
> -endif
> -
>  #
>  # Rule to compile a set of .o files into one .a file (without symbol table)
>  #
> @@ -408,11 +397,8 @@ endif
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
>  
> -quiet_cmd_ar_and_symver = AR      $@
> -      cmd_ar_and_symver = $(cmd_update_lto_symversions); $(cmd_ar_builtin)
> -
>  $(obj)/built-in.a: $(real-obj-y) FORCE
> -	$(call if_changed,ar_and_symver)
> +	$(call if_changed,ar_builtin)
>  
>  #
>  # Rule to create modules.order file
> @@ -432,16 +418,13 @@ $(obj)/modules.order: $(obj-m) FORCE
>  #
>  # Rule to compile a set of .o files into one .a file (with symbol table)
>  #
> -quiet_cmd_ar_lib = AR      $@
> -      cmd_ar_lib = $(cmd_update_lto_symversions); $(cmd_ar)
>  
>  $(obj)/lib.a: $(lib-y) FORCE
> -	$(call if_changed,ar_lib)
> +	$(call if_changed,ar)
>  
>  ifneq ($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT),)
>  quiet_cmd_link_multi-m = AR [M]  $@
>  cmd_link_multi-m =						\
> -	$(cmd_update_lto_symversions);				\
>  	rm -f $@; 						\
>  	$(AR) cDPrsT $@ @$(patsubst %.o,%.mod,$@)
>  else
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 2742b7dd089a..07333181938b 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -56,20 +56,6 @@ gen_initcalls()
>  		> .tmp_initcalls.lds
>  }
>  
> -# If CONFIG_LTO_CLANG is selected, collect generated symbol versions into
> -# .tmp_symversions.lds
> -gen_symversions()
> -{
> -	info GEN .tmp_symversions.lds
> -	rm -f .tmp_symversions.lds
> -
> -	for o in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
> -		if [ -f ${o}.symversions ]; then
> -			cat ${o}.symversions >> .tmp_symversions.lds
> -		fi
> -	done
> -}
> -
>  # Link of vmlinux.o used for section mismatch analysis
>  # ${1} output file
>  modpost_link()
> @@ -299,7 +285,6 @@ cleanup()
>  	rm -f .btf.*
>  	rm -f .tmp_System.map
>  	rm -f .tmp_initcalls.lds
> -	rm -f .tmp_symversions.lds
>  	rm -f .tmp_vmlinux*
>  	rm -f System.map
>  	rm -f vmlinux
> -- 
> 2.32.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
