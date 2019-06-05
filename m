Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94735557
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 04:39:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JY0N32DDzDqLw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 12:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="do9sFGSA"; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JXz43v4KzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 12:38:22 +1000 (AEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x552c0HL012003
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 11:38:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x552c0HL012003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559702281;
 bh=rlXG4KafJ48SszDXPb9veQ1mChqnZopGbbSbM2AtzLc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=do9sFGSAerlXLlmAdSX16PsxOTpmj4q4+5tCuqrjw7CCeYsYi2arHmUMCp1pYJpS/
 WkLe3VUHI0lqsHs3gngDqTQmH2oa9PnaAr/UlagMOij0/IYNM79jdciAmfRzCZs+f9
 PZIl9QDrkDoznEktwi5F82uFXpPKQCvMcofYwbdfQ1jbVy9nSyw0Z0EUTM8bEPp6ed
 M5tgh6OgoUHT3SOo6Xv0QJfr9nCrswHnJqN3mYx4f3j831ZAzRbM2jP1TaXNEp72rT
 lkscAHBGwC/E3il3HxFmY1OWfjggoQdBQuvDMVNtnXoxb2QqsM0g2EQdR/yfDLVLFK
 LHmDJZZV79H3g==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id q64so5185631vsd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 19:38:00 -0700 (PDT)
X-Gm-Message-State: APjAAAVmDVFscqXH5lVEK+B0a+5Ak2w3UMwOLOBK3YDljoQtgJACn5H/
 R3gehGvNtJd5vhTFLQszdJgkuhoXVnX2aM7jRV8=
X-Google-Smtp-Source: APXvYqzyi/PN7usug5PnObKBoqJxKJtYCUFINZdd71aBKnjEu2CMU8+EOU/sdcKVYceeBvsBUi01Xqmwcp/M7j6Sefg=
X-Received: by 2002:a67:f495:: with SMTP id o21mr3047792vsn.54.1559702278042; 
 Tue, 04 Jun 2019 19:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 5 Jun 2019 11:37:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ50Lnz+1hjHg2PK_h7DyfNkY7D1XGL5_VPDe5xLgx2Kw@mail.gmail.com>
Message-ID: <CAK7LNAQ50Lnz+1hjHg2PK_h7DyfNkY7D1XGL5_VPDe5xLgx2Kw@mail.gmail.com>
Subject: Re: [PATCH 00/15] kbuild: refactor headers_install and support
 compile-test of UAPI headers
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, David Howells <dhowells@redhat.com>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Yonghong Song <yhs@fb.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jani Nikula <jani.nikula@intel.com>, Greentime Hu <green.hu@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Michal Marek <michal.lkml@markovi.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, bpf@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 7:15 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
>
> Multiple people have suggested to compile-test UAPI headers.
>
> Currently, Kbuild provides simple sanity checks by headers_check
> but they are not enough to catch bugs.
>
> The most recent patch I know is David Howells' work:
> https://patchwork.kernel.org/patch/10590203/
>
> I agree that we need better tests for UAPI headers,
> but I want to integrate it in a clean way.
>
> The idea that has been in my mind is to compile each header
> to make sure the selfcontainedness.


For convenience, I pushed this series at

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
uapi-header-test-v1

(13/15 was replaced with v2)


If you want to test it quickly, please check-out it, then

  $ make -j8 allmodconfig usr/

(As I noted in the commit log, you need to use
a compiler that provides <stdlib.h>, <sys/time.h>, etc.)


-- 
Best Regards
Masahiro Yamada
