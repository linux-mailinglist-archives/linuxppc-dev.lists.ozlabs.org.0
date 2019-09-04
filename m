Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF2A77FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 03:04:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NQZ563DqzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 11:03:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.90; helo=conssluserg-05.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="B4uvS7NL"; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NQWQ4lNmzDqhl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 11:01:37 +1000 (AEST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x84116f7005226
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Sep 2019 10:01:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x84116f7005226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1567558867;
 bh=AjEufFzVyVLU2AdLo34FLZlaBTX1x5K/b/SnhbXJ+hk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B4uvS7NLJB3xR6BpqAhfh7z1pYGyymVdo4RP50YZ2dkM7L8KD40tZBYM0NAClKxZ/
 Y1pvINpM/ItKhXAMLAM0sMWmqlay/t3hhF+lb6tM2KGPbeGYJ7FdG+nsjjuCDJyoj4
 mPukkD3zmHux2ARmjSVuGpcPVbN8B8lNTTQcPHWaAhJwnDbTAeQc6Fb1TmN2aWlQbb
 v6SsKmNGe/KgbTOQMFFhjedraDaz/HIK7nPkquhC80snMn7CXlRueQg7NE7pm7OsTg
 qIpfbFEskPu9eh5UETe+A/lCRNK6oElYjTZ7z7IKPAyTmbRV41V8pyFUmj6nmA+4mL
 MVth8LJAUZ+ag==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id r1so9852575vsq.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 18:01:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUtvfMTbYbT4wE0gG7IeyPpkCT+asHxbFGDbgMOUiKnw7pjlUWu
 soTWEv+3SsEq1k7SndyvTsSPHNP3BQU8zG0amrA=
X-Google-Smtp-Source: APXvYqyo1po5O9L9Nq5Ia7qmFmp/ATeXGAcAqwEBQcXBG/9eqEjgCQ08JqpAR6C0b8FHMTdDqWVRRmFm/GoJ9LBHUok=
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr11010457vso.181.1567558866354; 
 Tue, 03 Sep 2019 18:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190904101259.2687cea4@canb.auug.org.au>
In-Reply-To: <20190904101259.2687cea4@canb.auug.org.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Sep 2019 10:00:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=qUi76cF776GcT=UYce5QBo+_24gLwXH7ra15=1xLvQ@mail.gmail.com>
Message-ID: <CAK7LNAT=qUi76cF776GcT=UYce5QBo+_24gLwXH7ra15=1xLvQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Wed, Sep 4, 2019 at 9:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
>
>
> Presumably introduced by commit
>
>   1267f9d3047d ("kbuild: add $(BASH) to run scripts with bash-extension")
>
> and presumably arch/powerpc/tools/unrel_branch_check.sh (which has no
> #! line) is a bash script.  Yeah, is uses '((' and '))'.

Thanks for catching this.


Could you fix it up as follows?
I will squash it for tomorrow's linux-next.


--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -18,7 +18,7 @@ quiet_cmd_relocs_check = CHKREL  $@
 ifdef CONFIG_PPC_BOOK3S_64
       cmd_relocs_check =                                               \
        $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh
"$(OBJDUMP)" "$@" ; \
-       $(CONFIG_SHELL)
$(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$@"
+       $(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh
"$(OBJDUMP)" "$@"
 else
       cmd_relocs_check =                                               \
        $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh
"$(OBJDUMP)" "$@"





> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
