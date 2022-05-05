Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9C51CBC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 00:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSLC2GdJz3f58
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 08:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=zqmv8cX5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256
 header.s=mail header.b=zqmv8cX5; dkim-atps=neutral
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQP80fbxz3c7p
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:32:36 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MzQTm-1o06Fv05JY-00vQbk; Thu, 05 May 2022 22:31:31 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 146A93C0A0; Thu,  5 May 2022 22:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651782689; bh=9wlFO3MLyBOpHZvAd84sW/pY49tJqU65GeK3vStuX2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zqmv8cX5aeN75BpS8wlPq/mhxNbMeyV64uEMViipkFTMdKvtNiGWbceJ+6Bh+JWwv
 D/4yHrbTFXWvkyqseXRLrnqsE2YvCZeKLiZHpYNAAZY931HxmxHvb1eVrhZqtPEcHZ
 N+olq3LtWu+5k3HoEQ7JcVJEIpPj6kokDR5VBw80=
Date: Thu, 5 May 2022 22:31:28 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 15/15] kbuild: make *.mod rule robust against too long
 argument error
Message-ID: <YnQ0IHNnQTIsxOxq@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-16-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-16-masahiroy@kernel.org>
X-Provags-ID: V03:K1:ATjjPZxZrxSYHnT3weErv12Bh2cwK2wHc1xFqX4u3bAi/heFx7b
 6P8k3j2vwjJcl03Stj1aUwkOTwe+JjMDsmGjUfomIoBMI9IRoUX5GVrziiH2c+621UgNyjj
 7HP/rVyptQpb5aIpXw+GYaWos4XrsiPnY5/fS3Irm+rP1103LXqYJA/yTGnAqsrsNPONEwQ
 NeGAeBdHijOVBbfFKB66A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3fCxWeqq8qM=:x1Ie/460/d/tEUDvNpS5so
 ZwdXQMrhPFvIJ76JTZeI+3qvibQAZPa2auCxPlZTG7HNMVM/Ms+8tNxK7cnRWJmNC9JIBZN/R
 jycDf23YR9x2XM9wzD1tN8PGq+LjWFIPCF8qmIqOyIha1G3AWnrgXWzwDGEibaxL2w5T/1EGr
 VqdhS/NIQfdRHAy7LGo/2NhPMQmwJQVe+a8M7pkW0dziMW+DHdW2+lg6fBBLy5TYw24PL29gl
 U93VQx9JaiUFA9cyU9Usr/8LyjFbQsGFB+PQtrdkbwkzPvrz7znMPYxv2L7XNiwALtVMvG4Gn
 fdf8wN96hr3DCYvbP4x/T7onJRAzycE4Jw6lz1XTcwPD+fJKBDkT/nUIbOk15r2iZtygf0TjP
 nVxNOfpCfrMMZ128G64u1yLf7w7GzFe7u6eemCFcwt0NRfxPVft4ztjqmqX2aRsFsPrk2rycd
 a8TsEqJJzaOa+LaiSD7y9ZZVGDIMMehf/y0FekjgYQAvLzu3TUdSopZEg81CfWoC4eNm3pBF2
 MxETWqUKr8mXT81Jenk7nkwaxeCGcppdPTUhrBGx1BAIK116Nafgxuui84Afn8DnXDPbS/Goe
 /P8PI+yxECdIA20Co2ZCIy8edFdmMDD978LiMpQaMAJ39knPCG7IP7+iax8Ii4DNrQf624Lic
 KXu7v/rcBu7F8ihMgC7W3ntYhMzzC6MpRxG3u4dZRM9qis/tTKFcIbUiLm+5R1hkoJQo=
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

On Thu, May 05, 2022 at 04:22:44PM +0900 Masahiro Yamada wrote:
> Like built-in.a, the command length of the *.mod rule scales with
> the depth of the directory times the number of objects in the Makefile.
> 
> Add $(obj)/ by the shell command (awk) instead of by Make's builtin
> function.
> 
> In-tree modules still have some room to the limit (ARG_MAX=2097152),
> but this is more future-proof for big modules in a deep directory.
> 
> For example, you can build i915 as a module (CONFIG_DRM_I915=m) and
> compare drivers/gpu/drm/i915/.i915.mod.cmd with/without this commit.
> 
> The issue is more critical for external modules because the M= path
> can be very long as Jeff Johnson reported before [1].
> 
> [1] https://lore.kernel.org/linux-kbuild/4c02050c4e95e4cb8cc04282695f8404@codeaurora.org/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>   - New patch
> 
>  scripts/Makefile.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index cea48762299c..e7b3f329d443 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -266,8 +266,8 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
>  	$(call if_changed_rule,cc_o_c)
>  	$(call cmd,force_checksrc)
>  
> -cmd_mod = echo $(addprefix $(obj)/, $(call real-search, $*.o, .o, -objs -y -m)) | \
> -	$(AWK) -v RS='( |\n)' '!x[$$0]++' > $@
> +cmd_mod = echo $(call real-search, $*.o, .o, -objs -y -m) | \
> +	$(AWK) -v RS='( |\n)' '!x[$$0]++ { print("$(obj)/"$$0) }' > $@
>  
>  $(obj)/%.mod: FORCE
>  	$(call if_changed,mod)
> -- 
> 2.32.0

Thanks!  At work, some colleagues of mine stumbled over that problem, too.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
