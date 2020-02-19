Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DB7163A0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 03:21:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MhLM1g6TzDqjj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 13:21:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MhHv3H9szDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 13:19:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=g23dvbrN; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48MhHv0fVfz8syC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 13:19:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48MhHt6nMTz9sRt; Wed, 19 Feb 2020 13:19:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91;
 helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=g23dvbrN; 
 dkim-atps=neutral
X-Greylist: delayed 49086 seconds by postgrey-1.36 at bilbo;
 Wed, 19 Feb 2020 13:19:38 AEDT
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48MhHt1NgHz9sRl
 for <linuxppc-dev@ozlabs.org>; Wed, 19 Feb 2020 13:19:37 +1100 (AEDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 01J2J3hA009577
 for <linuxppc-dev@ozlabs.org>; Wed, 19 Feb 2020 11:19:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01J2J3hA009577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582078744;
 bh=L+jL0JcoNlf0UHKJ6mZ37FrTR7jyH2kKU01xh86AXXk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g23dvbrNn+CXJFzO/H4T175z6mOjwF0INV/f0bINhb9mcvdusGidsv1cxOMuYQcE5
 dorwOxRL5U6mij3bbajdjXTR1cvzX3KNq38+TVybgCkUeFl178rLniUVUAEZhcb73m
 ATzD6+cZtEX+gwOT6BKpMzXZ7LMFAleV7d75NFcRR3wwshczf6/rPard2T0hBcpm3U
 8Zp15jGNTOhHBxN+f8vGNHHhefiqDpSlpObI13fpc8HXQ0xe61XdxOaFGJFMD/QfWG
 mkTTWDdTSt68mk+BvnVZbr/EazQUe8hnYXYGbI7MuX3QVs7MTvS0WUL1fXSGcfqlzI
 YmXb2hleZ810w==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id l6so8262603uap.13
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Feb 2020 18:19:04 -0800 (PST)
X-Gm-Message-State: APjAAAUctmmpVlrJC/sSTRmO5VfL754tnJ8lDkNVsfYXUrJFZuS4+RKo
 A6jmCQQ9wvbMclVUKeKtPkxle6oWsGwB7aUV3Xc=
X-Google-Smtp-Source: APXvYqwY3Ra6AbiEANnmAAI3CumDsPbdXAaz7A9RWbQE4DdUoCwWZ+bdyhN5hO+9NgYA+Ft+U8gWlIQpvopNsZMwv+o=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr12182273uap.95.1582078742909; 
 Tue, 18 Feb 2020 18:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20200219000434.15872-1-mpe@ellerman.id.au>
In-Reply-To: <20200219000434.15872-1-mpe@ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Feb 2020 11:18:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARm+iePH7F-W3ur5=TfhQSAdbOzX-uLm_9Qak-hFZ2EdQ@mail.gmail.com>
Message-ID: <CAK7LNARm+iePH7F-W3ur5=TfhQSAdbOzX-uLm_9Qak-hFZ2EdQ@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 19, 2020 at 9:04 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Some of our phony targets are not marked as such. This can lead to
> confusing errors, eg:
>
>   $ make clean
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $
>
> Fix it by adding them to the PHONY variable which is marked phony in
> the top-level Makefile, or in scripts/Makefile.build for the boot
> Makefile.
>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



-- 
Best Regards
Masahiro Yamada
