Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F3119041
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 20:01:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XTtY2D9lzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 06:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxtx.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=jmforbes@linuxtx.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linuxtx.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxtx.org header.i=@linuxtx.org header.b="JogH2eZ4"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XTqc2ndnzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 05:58:48 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id n9so4447312wmd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxtx.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvDFARgCT0LsrZ/bz1Y3KZ6G13ajYy+ecdz2Y5wO+o4=;
 b=JogH2eZ4Nhc/g73QDo4a7CNVK2d54Ay5JJclQzZ2XGAoWhHww28c40KZpbDE3OUs5Q
 LxqLakbePfjaWEZtzW9qE+6VQDXz+12h9Gbqxe5ZfzfSK4AhbV5cmsUWIltiNmsHHtcx
 hIg67qr9XGmb/1o5Dd+/k1/D7ovJBZmSfJPdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvDFARgCT0LsrZ/bz1Y3KZ6G13ajYy+ecdz2Y5wO+o4=;
 b=UHNiN0Ja/CCdNFBaPoC1ZA/o2Fy92+EpQXC20Pt0nhIInlgkk33WEU9YT+wT8hNo46
 MQ9QF5SFomx9gGKTbB0QZJMN5wGicrXqse62sM7lo7FkpRINUm7UgqjycxLhkbJg2FsK
 7B3y8QeMsHbxtTV/xFVw1BTSSBGS4AAoEugGZ0ujadgvrcQRRl6TfAxCmVrN9frU/qsA
 2qGh+9Ta3hzPTjGMbzpAWKF8GaOttzV03xVoZBb1PMLvnWPi58YKwQB4c8Tdr7SaPWWV
 srTmh/LavcJ9JnAiPlVx4lprrDTJVzZzwOAfRvLeUHVWdxRGPxYzijxDdwL4aEruF1Ey
 4QCg==
X-Gm-Message-State: APjAAAXIOphxymbO3COLv9WaVFtl7NDUVxCiF144MUsTvbaHMliDWCl8
 CDOUMU9yAN0sS6KJ9wsCe+a+wXEtMBz6c0jMacMglw==
X-Google-Smtp-Source: APXvYqwLybqhBx8RzCoka7tiW2rLLq1azZFzhsoPra5zQN6VCVrvOP6LJddIDsb4Qjv9QFK7+ZPUTVF2I/bJPSMqluE=
X-Received: by 2002:a1c:7310:: with SMTP id d16mr6679056wmb.165.1576004324170; 
 Tue, 10 Dec 2019 10:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20191201195728.4161537-1-aurelien@aurel32.net>
 <87zhgbe0ix.fsf@mpe.ellerman.id.au>
 <20191202093752.GA1535@localhost.localdomain>
In-Reply-To: <20191202093752.GA1535@localhost.localdomain>
From: Justin Forbes <jmforbes@linuxtx.org>
Date: Tue, 10 Dec 2019 12:58:33 -0600
Message-ID: <CAFxkdAqg6RaGbRrNN3e_nHfHFR-xxzZgjhi5AnppTxxwdg0VyQ@mail.gmail.com>
Subject: Re: [PATCH] libbpf: fix readelf output parsing on powerpc with recent
 binutils
To: Daniel Borkmann <daniel@iogearbox.net>
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:BPF \(Safe dynamic programs and tools\)" <netdev@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
 Aurelien Jarno <aurelien@aurel32.net>, debian-kernel@lists.debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 3:37 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On Mon, Dec 02, 2019 at 04:53:26PM +1100, Michael Ellerman wrote:
> > Aurelien Jarno <aurelien@aurel32.net> writes:
> > > On powerpc with recent versions of binutils, readelf outputs an extra
> > > field when dumping the symbols of an object file. For example:
> > >
> > >     35: 0000000000000838    96 FUNC    LOCAL  DEFAULT [<localentry>: 8]     1 btf_is_struct
> > >
> > > The extra "[<localentry>: 8]" prevents the GLOBAL_SYM_COUNT variable to
> > > be computed correctly and causes the checkabi target to fail.
> > >
> > > Fix that by looking for the symbol name in the last field instead of the
> > > 8th one. This way it should also cope with future extra fields.
> > >
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  tools/lib/bpf/Makefile | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Thanks for fixing that, it's been on my very long list of test failures
> > for a while.
> >
> > Tested-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Looks good & also continues to work on x86. Applied, thanks!

This actually seems to break horribly on PPC64le with binutils 2.33.1
resulting in:
Warning: Num of global symbols in sharedobjs/libbpf-in.o (32) does NOT
match with num of versioned symbols in libbpf.so (184). Please make
sure all LIBBPF_API symbols are versioned in libbpf.map.

This is the only arch that fails, with x86/arm/aarch64/s390 all
building fine.  Reverting this patch allows successful build across
all arches.

Justin
