Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E996151CBA9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSCp61xQz3c7G
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=PwCfqkix;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 569 seconds by postgrey-1.36 at boromir;
 Fri, 06 May 2022 05:42:47 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvPHW6qsZz3bft
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 05:42:21 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MiIhU-1oH5uO3YH8-00fPtT; Thu, 05 May 2022 21:25:22 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 38E543C088; Thu,  5 May 2022 21:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651778720; bh=Cwl4zkdeQcVXSxZ/RPcnVgB7zM8oGINbzVc8Y2VMFBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PwCfqkixa12sjKmUlkGN0KNMba5H+CtsWqxRGlVdXRptb7TBIoy0BO7Sc1zRukI0i
 EvUm1lkuiTNGLNT1bpJs98zozgIt6sLhIAOebglqQmNOD+itcraoJUvz+J1M7FySUT
 6hRW+SHN7GBvySLN/CpZb48xBVsXn+jeS7J2nWak=
Date: Thu, 5 May 2022 21:25:20 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 01/15] modpost: mitigate false-negatives for static
 EXPORT_SYMBOL checks
Message-ID: <YnQkoFahOeUVpZhj@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220505072244.1155033-2-masahiroy@kernel.org>
X-Provags-ID: V03:K1:453ge2nHJXg6JLo5cZeMgSEFhVvVa0swhzjR0uQKtW94gAuyPQc
 MTjdF1f5pbFygWaA0SosWLKNmyUdXwFK1CUqAPSkq2SKzmSgl51MwQo6xoMn3Z2qWshs+mq
 zUww0m+Vg1VGGeeohNre8BVjxjh7qSjrYTbvLGMl0VUFNN4UdaEPPhevVoj5lG7DWNaJkaT
 +cWvR/fsod9psxrnhT2vQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1I7YRGCbifg=:wiHGGZsjWiVsWflzSdZlf1
 rnxSHlzLZbMlXQME6NsR23TczHKf6OFgpjIJRweoZDOt+P1A1+Y5ynWZFi1DUzWJOz1sKX0TM
 LRwVI4ERpbHQcSO0gDL6tU6ksEw87Zm+bAHq0WXCrwZsZa6+Y5mRLCIcxUmo329FGyjYNyhdS
 eG7aZnZWvzTXCARfGy1WslzyAgC8o6GEeHvAWVHxXESeqY8upGZMHXEI+uKbObPJTg0fEl3E7
 NAoM9kJuatC3ZzJYV0EFKws1gCXTvip2bVKO/76Y3MvV0BFw8JDmr4hEJVRfSCNsQwoxvETEm
 byFT8g0yFtZ76OUQrjgzr2+eiPV/xAeMTNluTgPdpr4zrzFMZs4/+ugUQNJ15EYFAC0sBYW1W
 Pz3BGAUMOGllW0YjUQYhaqkW9sVp+UOPPJVZCClWZkiUGHSSLpgzeOhEorkO9iKmPcbeis2Hb
 MUJjhwu8LEveg9G2hunBn0D3ktK0vBt0TVPu6g1sSL68SLfVws0jRqa39KUc8HOJ41b06YlIy
 wFd3T3RT5uNwEXWYXjbev/LJZ0jLeMtsZkSbZ9rBnEFgQ/7s0XV+eQAmN0+BWqCDM3dzUO+Ym
 xMlRbF8rqGdgTzXPN8gNZpFvlIHgugQ82P+/XzVVZr46f8pl/L9tlr6VPnEKmAGrgxWPn3PFH
 f73++dR3OrYy55UT1C6nPNpG8/BjWlgNb3gzr+kTvM0/e/n3pIQ1OTs5w4FzgufxvWzg=
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

On Thu, May 05, 2022 at 04:22:30PM +0900 Masahiro Yamada wrote:
> The 'static' specifier and EXPORT_SYMBOL() are an odd combination.
> 
> Since commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
> functions"), modpost tries to detect it, but there are false negatives.
> 
> Here is the sample code.
> 
> [Sample 1]
> 
>   Makefile:
> 
>     obj-m += mymod1.o mymod2.o
> 
>   mymod1.c:
> 
>     #include <linux/export.h>
>     #include <linux/module.h>
>     static void foo(void) {}
>     EXPORT_SYMBOL(foo);
>     MODULE_LICENSE("GPL");
> 
>   mymod2.c:
> 
>     #include <linux/module.h>
>     void foo(void) {}
>     MODULE_LICENSE("GPL");
> 
> mymod1 exports the static symbol 'foo', but modpost cannot catch it
> because it is fooled by the same name symbol in another module, mymod2.
> (Without mymod2, modpost can detect the error in mymod1)
> 
> find_symbol() returns the first symbol found in the hash table with the
> given name. This hash table is global, so it may return a symbol from
> an unrelated module. So, a global symbol in a module may unset the
> 'is_static' flag of another module.
> 
> To mitigate this issue, add sym_find_with_module(), which receives the
> module pointer as the second argument. If non-NULL pointer is passed, it
> returns the symbol in the specified module. If NULL is passed, it is
> equivalent to find_module().
> 
> Please note there are still false positives in the composite module,
> like below (or when both are built-in). I have no idea how to do this
> correctly.
> 
> [Sample 2]  (not fixed by this commit)
> 
>   Makefile:
>     obj-m += mymod.o
>     mymod-objs := mymod1.o mymod2.o
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

I like the detailed commit description!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

> 
> (no changes since v2)
> 
> Changes in v2:
>   - Rename the new func to sym_find_with_module()
> 
>  scripts/mod/modpost.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index b605f4a58759..a55fa2b88a9a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -272,7 +272,7 @@ static void sym_add_unresolved(const char *name, struct module *mod, bool weak)
>  	list_add_tail(&sym->list, &mod->unresolved_symbols);
>  }
>  
> -static struct symbol *find_symbol(const char *name)
> +static struct symbol *sym_find_with_module(const char *name, struct module *mod)
>  {
>  	struct symbol *s;
>  
> @@ -281,12 +281,17 @@ static struct symbol *find_symbol(const char *name)
>  		name++;
>  
>  	for (s = symbolhash[tdb_hash(name) % SYMBOL_HASH_SIZE]; s; s = s->next) {
> -		if (strcmp(s->name, name) == 0)
> +		if (strcmp(s->name, name) == 0 && (!mod || s->module == mod))
>  			return s;
>  	}
>  	return NULL;
>  }
>  
> +static struct symbol *find_symbol(const char *name)
> +{
> +	return sym_find_with_module(name, NULL);
> +}
> +
>  struct namespace_list {
>  	struct list_head list;
>  	char namespace[];
> @@ -2063,8 +2068,9 @@ static void read_symbols(const char *modname)
>  
>  		if (bind == STB_GLOBAL || bind == STB_WEAK) {
>  			struct symbol *s =
> -				find_symbol(remove_dot(info.strtab +
> -						       sym->st_name));
> +				sym_find_with_module(remove_dot(info.strtab +
> +								sym->st_name),
> +						     mod);
>  
>  			if (s)
>  				s->is_static = false;
> -- 
> 2.32.0

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
