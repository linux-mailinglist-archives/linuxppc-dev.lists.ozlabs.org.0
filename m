Return-Path: <linuxppc-dev+bounces-1694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313FD98A838
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 17:11:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHPfc53TYz2yGB;
	Tue,  1 Oct 2024 01:11:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.137.80
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727709079;
	cv=none; b=ZTxnA5BuZ4a4+7iMcZHkLd1H0736JL4zx14SHldAz3gba95eEOh2/N4rUqB7ZBJAVUMrR4+xRM50qyogp4wFx5aQpI4AB6nlZDbSQ1INDsXMAGnEYnSh7u9L32TtZQ7XKqVvnFYkyO+nCuL38kpxf+1LuMCye+ENL0idW5sSdf0cB/nlPx5kSoyEmqVaA1cEzQBqI4O8qUU0EnwpQON13WBvFg8PfTrKWC04QjXcqaY8suw1a1LrxEc/hNMCaoNt1iFrsC9klSejYv0HAHvz9uMHj2kFZcc4idognjj7KtIwgRinFArQ8LqEbSSGVHkE5V1g0j3drpqvkbCQaY7ysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727709079; c=relaxed/relaxed;
	bh=ZwdT6krl4va9qUtdXtWBXzOka221nv45rSuGN/xJZks=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EKTqjunlBWX+JnXKdgPWU96zTGTiaKU52Bark1z2EBdA0YQTgOdLxBCaikTkW0/fW5E0oKrjEgOGWFo64O4OKrltUVMBLTnuqtr/TofXZXtqmuAcF6MhWKd8IWhfoLRmeoi03jxVzh+u/v1ccTWPeBwMDcYE7aznBdl6Sxd+rvQ07bLwxoa3Brp+J6TAYaaJRpJM39ONkEMJKqDoWj/h2qL0P9oypWPWsiZonydqXigwL+kK3HpvMDmwA+jXNJG2YCBVVv5TtgokHO1m8Je3x6cfxjRJqefZCKjMsfWk7E44GiCwH1e7//agun6SffFBnrbKpHg3fMArwc2RdA5zUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=riemann.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=riemann.telenet-ops.be (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHPfb0YMbz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 01:11:18 +1000 (AEST)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4XHPfQ2qSqz4wxNc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 17:11:10 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:99bb:7ad4:7fac:370a])
	by albert.telenet-ops.be with cmsmtp
	id JfB92D00Y4pGYif06fB9DU; Mon, 30 Sep 2024 17:11:09 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svI3J-000wex-Ml;
	Mon, 30 Sep 2024 17:11:09 +0200
Date: Mon, 30 Sep 2024 17:11:09 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Kent Overstreet <kent.overstreet@linux.dev>, 
    Herve Codina <herve.codina@bootlin.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: Build regressions/improvements in v6.12-rc1
In-Reply-To: <20240930145322.129875-1-geert@linux-m68k.org>
Message-ID: <6464b079-372d-d3f-d774-a7c05916fbe2@linux-m68k.org>
References: <CAHk-=wiwVOCZsC6a4dLdb1UjL2fS_CnLNjrPL0XGFbDd9C26Cg@mail.gmail.com> <20240930145322.129875-1-geert@linux-m68k.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 30 Sep 2024, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.12-rc1[1] compared to v6.11[2].

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9852d85ec9d492ebef56dc5f229416c925758edc/ (all 131 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/98f7e32f20d28ec452afb208f9cffc08448a2652/ (all 131 configs)
>
>
> *** ERRORS ***
>
> 12 error regressions:
>  + /kisskb/src/fs/bcachefs/backpointers.c: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 504:53
>  + /kisskb/src/fs/bcachefs/bcachefs_format.h: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 332:49, 331:49
>  + /kisskb/src/fs/bcachefs/bkey.h: error: 'const struct bkey' has no member named 'bversion':  => 578:48
>  + /kisskb/src/fs/bcachefs/bkey.h: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 558:27, 557:41, 557:27, 558:41
>  + /kisskb/src/fs/bcachefs/bkey.h: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 557:41, 558:41
>  + /kisskb/src/fs/bcachefs/bkey_methods.c: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 292:65
>  + /kisskb/src/fs/bcachefs/bkey_methods.h: error: 'const struct bkey' has no member named 'bversion':  => 73:31, 73:18
>  + /kisskb/src/fs/bcachefs/bkey_methods.h: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 73:33, 73:20, 73:47, 73:34
>  + /kisskb/src/fs/bcachefs/bkey_methods.h: error: control reaches end of non-void function [-Werror=return-type]:  => 75:1
>  + /kisskb/src/fs/bcachefs/disk_accounting.h: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 40:28, 40:42, 39:50, 39:43
>  + /kisskb/src/fs/bcachefs/disk_accounting.h: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?:  => 39:26, 40:10, 39:33, 40:24

All big-endian platforms (fix available, even on a public mailing list ;-)

>  + /kisskb/src/include/linux/err.h: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]:  => 28:49

powerpc-gcc13/ppc64_book3e_allmodconfig

drivers/soc/fsl/qe/qmc.c: In function 'qmc_qe_init_resources':
include/linux/err.h:28:49: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
       |                                                 ^
include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
    77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |                                             ^
drivers/soc/fsl/qe/qmc.c:1764:13: note: in expansion of macro 'IS_ERR_VALUE'
  1764 |         if (IS_ERR_VALUE(info)) {
       |             ^~~~~~~~~~~~

IS_ERR_VALUE() is meant for pointers (fix available)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

