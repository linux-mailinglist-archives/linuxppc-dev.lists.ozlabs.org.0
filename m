Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A613B51CBAB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSDT442Yz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=BA/UrMfy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256
 header.s=mail header.b=BA/UrMfy; dkim-atps=neutral
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvPZD5b8vz3bpP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 05:55:21 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N3K9E-1nwDkz0qKw-010OY9; Thu, 05 May 2022 21:53:59 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 156A33C088; Thu,  5 May 2022 21:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651780437; bh=dBGPpUTd6f50KRn9utFIdPZJncpaOpFQeh/8wziuA/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BA/UrMfyunASKGi7EkzUpzPsPi2aei9LQHExoWZtA5QFmz+nF8ch9crJVNxlyXlAo
 9/Na54bbnRtHOJVT/Cu1rd++ItUCRwJYL1sK4BZ0RkHyXPHaNQRVN2803zQ7qVDZ9q
 IFpDp5e19gxb+cnRkH0vRcmlOzVJGX4BOzBrpews=
Date: Thu, 5 May 2022 21:53:56 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 02/15] modpost: change the license of EXPORT_SYMBOL to
 bool type
Message-ID: <YnQrVI1r+Unp2vn+@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-3-masahiroy@kernel.org>
 <CAK7LNAREQt5rPGK8zsti_UA-dGFKfqHsVWbSgMLw-yLoeNkJeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAREQt5rPGK8zsti_UA-dGFKfqHsVWbSgMLw-yLoeNkJeA@mail.gmail.com>
X-Provags-ID: V03:K1:eVIKbsZAbmzWlKtPrBj9Mb+vBbXXzsRynicJaMbmbzeysZP9arT
 xtUnuIVyv55qPraP+CQORaltSCsWVTcv/yBmJe397a5RhE4lqPF/7NTAdPbhqJt+3Gh8g92
 ZoO+xpkipSHT4m8eoWenn52JjlnfRIYuJaTzy/dfT9T33OOig4RA8icWKQqDbDJT1r+AETo
 wW4IQZEr5rVf+AzQyOwXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O1718LcMWqY=:suNSu7o6nKuRoYHjwHkK7V
 I5JxHIqIanjGfPigUPLhylAYRpIOBsQUko5BnQ6W4am6/4Rk1hQN6SjvKN5TJ+Ie4NSKLKRUU
 /rCUpt8uxsEkDWvgPp2uG0z6DNKPTzqh8GOV+zc/pZy4BIyyREB8aD/ArpRnIaRaYTcqnn56q
 XUSx9OWW0FgRVVjXnPgkQwU3vCboB03AivsI9pjAaunR2mMKkgjkV9UgoLuBEtCr1gGEQLY5q
 z4gY0BE70xMtqT8byLS8fXfYh0Cd9tmtCdH1UvMI0eN9ObwTzYhaRtzGMaFmzNcYu/HJGpADG
 S8KLRMdZq3HDg9PtUi/8323eqrhjuEFIx9AcoFTVjHgQkAUqar0NTGwnCGXtlJ6By8bb1mW1N
 dlSRIjRe39kgHYAcF4eWrvXUorPWsok/1vGuGljWIdqmDlUxyf6IaxJH9iEdRJZi4QMOYsrru
 GwTY6TZBAAM7xXkzedF/IBOT6zwIoooV1swVFW6ldMo75vnpOkJ7OtLQBARHpTDtcdpjFN9oA
 tonNUBC+ZHeQ8bmR1CcgL4nvBkdAa5mIRaypRTPGCOtPxEvwMhuyASvdQkdxOCbWJbK9uZa9l
 h7U5WP0/B6y9l/upnfY5B/pSb4v9X4o2Cxgjvspp3ACwnhKVDVDlZ1Sgugg3sGpeXE/AU4xsl
 9YYc4OOhpf0rxjgHtRHcZ4fJ+MpGjD+n2/wd9yTekkkDcgbJ19y5X+rdO48X0t3Q0g0c=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 10:48:55PM +0900 Masahiro Yamada wrote:
> On Thu, May 5, 2022 at 4:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Currently, enum export is tristate, but export_unknown does not make
> > sense in any way.
> >
> > If the symbol name starts with "__ksymtab_", but the section name
> > does not start with "___ksymtab+" or "___ksymtab_gpl+", it is not
> > an exported symbol. The variable name just happens to start with
> > "__ksymtab_". Do not call sym_add_exported() in this case.
> >
> > __ksymtab_* is internally by EXPORT_SYMBOL(_GPL) but somebody may
> 
> I mean
> "... is internally used by ..."

Looks good to me; a nice cleanup.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
