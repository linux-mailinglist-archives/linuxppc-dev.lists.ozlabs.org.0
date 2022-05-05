Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C051CBB6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSHN5gdLz3dt7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:57:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=P5JqnzKq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256
 header.s=mail header.b=P5JqnzKq; dkim-atps=neutral
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQCX2pY3z3brS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:24:20 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mz9EL-1o0vC22a9b-00wFu7; Thu, 05 May 2022 22:22:53 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 9326E3C088; Thu,  5 May 2022 22:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651782169; bh=gLnf95DDjaMYGCRgX6K1aWAnNa4DMAQkns7Hsushh60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5JqnzKqtCgrYbwEuOhr7agnhA9+gQXyvraZM/aNsViPYwCcmXRoB0dY8HOQW2LE5
 kRtHvppRbVwP87SX7/jDtlvgKxxbcffwdHVginnFLXVfXr1beojclNn2h078mxS1z1
 9QMmT/PWzqeujd3d3jGPQuxQtQuuSt//isIYhAZI=
Date: Thu, 5 May 2022 22:22:49 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 10/15] genksyms: adjust the output format to modpost
Message-ID: <YnQyGUlhvUIZwoNy@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-11-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-11-masahiroy@kernel.org>
X-Provags-ID: V03:K1:RUI2NxERijqBLuHI7G+nXGlaQN7ojuvdXw0yIKPmaAmlM/WXDvD
 z+undfnS5/BQmDavRN0dHs0z6ogRT8PP96LkZFU2gGTqewRhjkyZjh4El221JnzIHz6JwSJ
 FIhTrT6LlR9hlmohtlQUd6uMFu6QJ7kd2iTahnc9SV5tIegCWreRierRRGI87knT1tQKDev
 5SuWioT/YknSjZKC8ulFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jxZ5y2jNwbs=:j0VaPvAClzfPiR1zMMPS2V
 4Blib3kzqTqZt1lgsARx53lSLe9k1NMGOsYT5OVcHQu4avv8lOHyCqM9ge5kRBsupEaTAiEDp
 YZvw50YwnVmqQi2z5eHO7+xqfM2iaEAj8EwyYJV5eiCo34hRU0J2uw6Ci3L0x4cOjIIPgx9/1
 zrcgC0WyzTJt9xSdNOKt0ektBE71fExhkTfIvbB1iEOfhOHXpF8jd0Ymtb0E8gOpN5eWtnVnB
 wG6sDDKzE74ixKhLuiFNjzicAIlE4GuGpkzVaBidxwpjMmDm2UeZrWYuJPKY7s/x3CCknfg/8
 WZn/PYyJjRa3LU9540K7cbgLBLPtalY1P8OwfhLXDst1Rjrb4WzFa3YuV+2aw6QjxcQr99jxo
 YrA1gYvz6DCU9L+AZTrv+JYfyE7wGJqgW+qy11WUnp1Gobv3OoFfQOBFfqELZonNPBSZ4eE4U
 XtlQV1ubC6gXN8m7nhZY3WwKKOswQGQ+cfwMy9MkT95n+ctFcpxNJrqVNM4T+3z6t8srLnLiu
 0/Mwgj0E1+RWwtUWEpRSSLSBj7QOBfYMDywGzq5JMDZQbXNiB5yMXV7TM7WvPZVi2iO3EYdQQ
 6TMgU4M620I5XBRPj1A7DVrOvt4A/uVy2Y44MtohxyNtOCaq4srTazIQazf69a2RHeiYwmpaJ
 gyM61KOlwm1QMxusvpBmDh/WQ4qBNSIr1JDl4Ir2cAq1H3uxxCTd6skGJOE975VRrmMw=
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

On Thu, May 05, 2022 at 04:22:39PM +0900 Masahiro Yamada wrote:
> Make genksyms output symbol versions in the format modpost expects,
> so the 'sed' is unneeded.
> 
> This commit makes *.symversions completely unneeded.
> 
> I will keep *.symversions in .gitignore and 'make clean' for a while.
> Otherwise, some people might be upset with 'git status'.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>   - New patch
> 
>  scripts/Makefile.build      | 6 ------
>  scripts/genksyms/genksyms.c | 3 +--
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index dff9220135c4..461998a2ad2b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -165,16 +165,10 @@ ifdef CONFIG_MODVERSIONS
>  # o modpost will extract versions from that file and create *.c files that will
>  #   be compiled and linked to the kernel and/or modules.
>  
> -genksyms_format := __crc_\(.*\) = \(.*\);
> -
>  gen_symversions =								\
>  	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
>  		$(call cmd_gensymtypes_$(1),$(KBUILD_SYMTYPES),$(@:.o=.symtypes)) \
> -		    > $@.symversions;						\
> -		sed -n 's/$(genksyms_format)/$(pound)SYMVER \1 \2/p' $@.symversions \
>  			>> $(dot-target).cmd;					\
> -	else									\
> -		rm -f $@.symversions;						\
>  	fi
>  
>  cmd_gen_symversions_c =	$(call gen_symversions,c)
> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 6e6933ae7911..f5dfdb9d80e9 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -680,8 +680,7 @@ void export_symbol(const char *name)
>  		if (flag_dump_defs)
>  			fputs(">\n", debugfile);
>  
> -		/* Used as a linker script. */
> -		printf("__crc_%s = 0x%08lx;\n", name, crc);
> +		printf("#SYMVER %s 0x%08lx\n", name, crc);
>  	}
>  }
>  
> -- 
> 2.32.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
