Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A457251CBBC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:59:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSJq3Vxdz3c7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:59:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=FaLJ+2jW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256
 header.s=mail header.b=FaLJ+2jW; dkim-atps=neutral
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQJN0HTXz3brH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:28:30 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MdwRi-1oLUuu0jeY-00b4o2; Thu, 05 May 2022 22:27:10 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id B61AF3C088; Thu,  5 May 2022 22:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651782424; bh=oGd2e0sWzuw2lfacuEfCkKF+JuznQDoibFgyz7j1FOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FaLJ+2jWftfmPh62O8eA9LWVOpI6bCmG5q2wumrSva1zb8Lt/1da5TlQqhSISYxfV
 3pWN2pxZKshK6qG2ZAlazcmz8TTIL9aTwzrsh4MAmQGR8+JO8wVmXZblUEf84WC++W
 TiErDSzNaNjx6X6fzUMEEHREyY6mRvxkVgjnPEo4=
Date: Thu, 5 May 2022 22:27:04 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 12/15] modpost: simplify the ->is_static initialization
Message-ID: <YnQzGMfWqnP6CMir@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-13-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-13-masahiroy@kernel.org>
X-Provags-ID: V03:K1:LK2u+J2AhRjCi+eMNFHoFnTinbNPkEFuFiOuKWVtzJ00eRjm6z7
 tNvjulmaQd0h6NqxBCm22IwvsWk8KlKkc6Ii6th88VKmMWg5MlEkkUpaXLqSy7hm061+Hs8
 UD92p80tBHi8TG7LLOvYD2q5nEGx/b88ke8OExKVbAFL5cXXGXR/lOQyJDZrWpGGW8T00jj
 JAPWLP7gyGdYvch2xT3Gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OxAiCGOEiWk=:9v6pZlNBsR1l7vFzSHm9UI
 /rD6j6qbY07+oT4+AyXX+8s8GdCCDK9+2h3F1C5GfCE4WbIIm1+MyqDLdz9pQ1kr1drl6HDQL
 mLMC7CawdirGi/+SQAWuOxWNkG06NUrvND+SqkMCsISquldvjozq/TV+y219fr1VGCksL5Tro
 F3em6lKfungyYh6g0OHXZlFaHPlPU5G8jos/UzxAYI2dqTiiu5Zi2YNXJyBVHiyJBDnR4du6f
 oedVr8+AQ86/m7v8tG4KXewdDs+4LunPIEVMcQCZmcQBFkkMPzZAwTYv7b3+5Dkp+eFTafJIL
 DOxPYInPHjDQZ3YpjNA8xpyYu2C/rRM+jb8P02LWzU6paRv/p9pgO/lOQL4oBIFQbqJ1DbtGa
 CRIOFERb8zjO2S7jr1FGl44q4ySvT+X1TJkog7BMk0XG712rdLQ9IxQBh1oaKwTt8kslwrMNc
 QVkL3lXMtoH9dj9fuLZzCnXUT7+sB+8wHMN73LyZWZfQoiCBuM17nLSL0LeRxvP36JCelL7Vl
 5zi8CbPjRaSVVtvh7nK22PIH9epnfrEF3wcpoBeVEThuZ1lEJZOvKSDuZH42mmhK5BCVV6FwG
 wLCpKeZEzfsRzM+O+RKRbUDV03g0i9Qks6wQ4q3MTboCf81M1UyFXm7pDprkdC91RC066O/M4
 nVtIm+BqMUkqLUXR31hp2A+GSF8kq8ZnuaKpMsOLt19fVst3NmNkq7ij/oFYqgxLNoks=
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

On Thu, May 05, 2022 at 04:22:41PM +0900 Masahiro Yamada wrote:
> ->is_static is set to true at allocation, then to false if the symbol
> comes from the dump file.
> 
> It is simpler to use !mod->from_dump as the init value.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>   - New patch
> 
>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e07542a90fc6..4edd5b223f49 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -242,7 +242,7 @@ static struct symbol *alloc_symbol(const char *name)
>  
>  	memset(s, 0, sizeof(*s));
>  	strcpy(s->name, name);
> -	s->is_static = true;
> +
>  	return s;
>  }
>  
> @@ -376,6 +376,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>  
>  	s = alloc_symbol(name);
>  	s->module = mod;
> +	s->is_static = !mod->from_dump;
>  	s->is_gpl_only = gpl_only;
>  	list_add_tail(&s->list, &mod->exported_symbols);
>  	hash_add_symbol(s);
> @@ -2523,7 +2524,6 @@ static void read_dump(const char *fname)
>  			mod->from_dump = true;
>  		}
>  		s = sym_add_exported(symname, mod, gpl_only);
> -		s->is_static = false;
>  		sym_set_crc(s, crc);
>  		sym_update_namespace(symname, namespace);
>  	}
> -- 
> 2.32.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
