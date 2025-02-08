Return-Path: <linuxppc-dev+bounces-5984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AECEA2D51D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 10:07:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqlN80sM8z2xFq;
	Sat,  8 Feb 2025 20:07:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739005640;
	cv=none; b=TJZdDwNhMCA+Z4zFyqubT91wmN2ti5sp54aUvzy5YxLt/OBu1GxKuywZOJCuWL9KUfEipQkrNF3aKcvW0NnJkhg5hIG19ufIAfHxkxepl/yStUv2abIM3TOkPsONr7zWSxZVo9Ndbb9mQxAVVHRNKNrNCx9uhcO5SuKqXzhBPfEudTLTO8Od35EaDnKpuS01+w/p2OoU11OA1U5dnkUhmVRTt0KtIHcLzhLzxsM0tMAFhhIl1YlJ+PdxdrpP/qiqOWb5t8C589wCP/ARi+NXPoaLDCK2eanUgl/9AbC/9C7BmVGNZkrjqBllDh4jcYCuYe2tyZZKSwxztlMnMWZWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739005640; c=relaxed/relaxed;
	bh=uLMcBNpPfYTp6qgf7tF7pnQDfs5cG2YErCopmVmbxz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+cQq4edjZ1O7zcz14vUqNVjjdgK8ZEHt8Ih9yPBqs5K6uoOg+0nGm7ghfuLxw9DbOjdKcO2Yy6TvJv8mB1TNlgAdDJJK93sOnqrqXN4eb6b+Ac8ayFp+lA91PHylvN2YICgxsWglaR/Yy4mBFpziti00HpLYN473A2xwLOgOqWpwnJtt+XcVfIRZHVdLYr3h8HOZgeF2JE89J0c59Fk+haFDwtUTszO5ANh0qHr6m3t3QgvoRF8FFqWeH4XcgvTU52UqiLczjhMqEBwSSIJRdemhGzWUKJQy3ZQmpVqT8fLYJHQ5/8lHP3ZyZe6XmNgRv02IvKXUiVMUMRSJd3gmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=d3BThiaz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=d3BThiaz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqlN62l1kz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 20:07:17 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e429a885f6so47004596d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739005634; x=1739610434; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLMcBNpPfYTp6qgf7tF7pnQDfs5cG2YErCopmVmbxz4=;
        b=d3BThiaznJDdB2tR+thi7eeLxLb3mHdCgM0zBwWGH3AMpDcbvlZ+00+KOAN67DID5C
         CSCKCubXa1z2NZcUsNInsh/xMD8h6YzTEue4+dLcEZuw19KqxYAaRvDnCnrdKV83ujVl
         /VdECQ/mdKe4uVj0dSUW9xEaS4T+BVWu8MKxjpPhBrFFChoeFLHFmi+azcysUDbzICvG
         oUl9daz0W5c1zdimQINFFaLw2GLkzOjD6VHYIGGqk0IVrSDacIHrYKc9HLU5azWMOIhx
         nEihlyuemzuo775ubKcUukDwnoT7h9K2xyOIT5uKaQMR0LjE2xtgRPxToOyQkv+lrwuo
         fWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739005634; x=1739610434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLMcBNpPfYTp6qgf7tF7pnQDfs5cG2YErCopmVmbxz4=;
        b=hEvZlj8P878gSO0BajOIRf1oyZvTRrVAf5rXBK5fk76QeZwVATUEvNmjtHMzyM97V1
         sjvEA+jvir3zbFci1nHgQM9P5325vashgXnvRxxAcx5zERDy+BQMIYvM3XKllf5jlk61
         Yl4S89pe0Wcx2qCw0WqxOxK2cvaH7VOvcztywDzPgNEBhAqYNUi/hUB9pV+nHXZYN3QY
         AJ0ZKqG85nePxS1jWZt2f/FQ2YCQt+h8+9L5TzMxbEIR8SR8FdECSzQuilTvEKilNFgU
         d9kb4x1ROVIwfgV/JhcBAvtZE6KGGPrVui5iavjW0zV5rhjP2TYItJmkBqQOvZHrRDbD
         jmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoi23HlPgko70ZyN6vWTWM5N1J29TeBwaPLby16pvFIdYl/RWit3dRtI4wdAUw0wG4WxIRLFgoXWUTXdg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKHrTafLoR/kmcFFELgn+SuPEFwbQWUv1ZQZSsqZ9/1Tsz/vJH
	EL21NyxTLV79hkrUTccQE4cFeXBLSm/b4WQC5baWmrlDeQve3cH/ppamWAm7UL3XiVOiqaigUiI
	G9YB6tBRPVwJfQhLJhi1TlxkIJiZatT9Xtnr2
X-Gm-Gg: ASbGncu854iGd9E/K970kaPW0CSZKDvtRPB0SkLVvATtMGUPzsVlQdiKhQ8fHqTyrhj
	MrCjZ/Nt5ewTzN7MPj/OjmxhNiLLtrHMg7RMERgfex7EVEvjQKB+dwbaLI/JLiAWmEoH+gxDujQ
	==
X-Google-Smtp-Source: AGHT+IGGjm1BHv1q6DcYSZtFg+gX1FR5xb9+FmO8FSPRQtOAIi7uPzK0/ylPOU8sUfAgv1roarF5FKBmLy1fCvExlKw=
X-Received: by 2002:a05:6214:f61:b0:6d8:8874:2127 with SMTP id
 6a1803df08f44-6e4455d2f1dmr99888976d6.5.1739005634150; Sat, 08 Feb 2025
 01:07:14 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 8 Feb 2025 17:07:01 +0800
X-Gm-Features: AWEUYZmlRH8tdcpeDGrA0LEyt2sjTXuwo1DU6Q_ufDIrKVWTu9PqwaiwfRNtQsw
Message-ID: <CABVgOSne6yfQ7NmSPkYSci6Ej1tKsijqKaZxR7NsLfPcDEq99g@mail.gmail.com>
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
To: Tamir Duberstein <tamird@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000020471a062d9dcd23"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--00000000000020471a062d9dcd23
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 04:14, Tamir Duberstein <tamird@gmail.com> wrote:
>
> This is one of just 3 remaining "Test Module" kselftests (the others
> being printf and scanf), the rest having been converted to KUnit.

Thanks a lot, Tamir: these are great!

>
> I tested this using:
>
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 bitmap.

I have also tested this across several architectures, including arm,
m68k, i386, x86_64, powerpc64, and UML, and it works well here.

For anyone put off by the long command, testing it under UML is
$ ./tools/testing/kunit/kunit.py run bitmap

It should also automatically run on boot for any kernel with it
built-in, and run when the module is loaded if it's enabled as a
module.

>
> I've already sent out a conversion series for each of printf[0] and scanf[1].
>
> There was a previous attempt[2] to do this in July 2024. Please bear
> with me as I try to understand and address the objections from that
> time. I've spoken with Muhammad Usama Anjum, the author of that series,
> and received their approval to "take over" this work. Here we go...
>
> On 7/26/24 11:45 PM, John Hubbard wrote:
> >
> > This changes the situation from "works for Linus' tab completion
> > case", to "causes a tab completion problem"! :)
> >
> > I think a tests/ subdir is how we eventually decided to do this [1],
> > right?
> >
> > So:
> >
> >     lib/tests/bitmap_kunit.c
> >
> > [1] https://lore.kernel.org/20240724201354.make.730-kees@kernel.org
>
> This is true and unfortunate, but not trivial to fix because new
> kallsyms tests were placed in lib/tests in commit 84b4a51fce4c
> ("selftests: add new kallsyms selftests")  *after* the KUnit filename
> best practices were adopted.
>
> I propose that the KUnit maintainers blaze this trail using
> `string_kunit.c` which currently still lives in lib/ despite the KUnit
> docs giving it as an example at lib/tests/.
>
> On 7/27/24 12:24 AM, Shuah Khan wrote:
> >
> > This change will take away the ability to run bitmap tests during
> > boot on a non-kunit kernel.
> >
> > Nack on this change. I wan to see all tests that are being removed
> > from lib because they have been converted - also it doesn't make
> > sense to convert some tests like this one that add the ability test
> > during boot.
>
> This point was also discussed in another thread[3] in which:
>
> On 7/27/24 12:35 AM, Shuah Khan wrote:
> >
> > Please make sure you aren't taking away the ability to run these tests during
> > boot.
> >
> > It doesn't make sense to convert every single test especially when it
> > is intended to be run during boot without dependencies - not as a kunit test
> > but a regression test during boot.
> >
> > bitmap is one example - pay attention to the config help test - bitmap
> > one clearly states it runs regression testing during boot. Any test that
> > says that isn't a candidate for conversion.
> >
> > I am going to nack any such conversions.
>
> The crux of the argument seems to be that the config help text is taken
> to describe the author's intent with the fragment "at boot". I think
> this may be a case of confirmation bias: I see at least the following
> KUnit tests with "at boot" in their help text:
> - CPUMASK_KUNIT_TEST
> - BITFIELD_KUNIT
> - CHECKSUM_KUNIT
> - UTIL_MACROS_KUNIT
>
> It seems to me that the inference being made is that any test that runs
> "at boot" is intended to be run by both developers and users, but I find
> no evidence that bitmap in particular would ever provide additional
> value when run by users.

I admit to never quite understanding the "at boot" wording as an
objection here, as KUnit tests can run at boot (and do by default),
and are often regression tests. I'd not object if anyone wanted this
stated more clearly in the new config option's help text, though.

The line between 'developers' and 'users' in the kernel world is
necessarily thin, but I equally think users who would want to be able
to run test modules are unlikely to be unable to run KUnit tests if
they so desire. The only difficulty (which I admit could be annoying)
is that it's not possible to run the test against a kernel built with
CONFIG_KUNIT=n. Personally, I have my doubts that anyone is deriving
value from running test_bitmap against a system which was not compiled
for testing -- particularly since it's now quite common for distros to
ship kernels to users with CONFIG_KUNIT=m (IIRC, Red Hat is doing
this, and Android at least were considering it).

> There's further discussion about KUnit not being "ideal for cases where
> people would want to check a subsystem on a running kernel", but I find
> no evidence that bitmap in particular is actually testing the running
> kernel; it is a unit test of the bitmap functions, which is also stated
> in the config help text.

Again, I think the only issue here is the CONFIG_KUNIT=n argument
above. This is a real issue, but I can't imagine a case where someone
has a running system which has broken due to an issue in the bitmap
code which can't easily be reproduced on a fresh kernel with
CONFIG_KUNIT enabled. (Though that could just be a limitation of my
imagination, so if that has happened to someone, I'd love to hear the
story!)

>
> David Gow made many of the same points in his final reply[4], which was
> never replied to.
>
> Link: https://lore.kernel.org/all/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com/T/#u [0]
> Link: https://lore.kernel.org/all/20250207-scanf-kunit-convert-v4-0-a23e2afaede8@gmail.com/T/#u [1]
> Link: https://lore.kernel.org/all/20240726110658.2281070-1-usama.anjum@collabora.com/T/#u [2]
> Link: https://lore.kernel.org/all/327831fb-47ab-4555-8f0b-19a8dbcaacd7@collabora.com/T/#u [3]
> Link: https://lore.kernel.org/all/CABVgOSmMoPD3JfzVd4VTkzGL2fZCo8LfwzaVSzeFimPrhgLa5w@mail.gmail.com/ [4]
>
> Thanks for your attention.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

My only remaining concerns are that:
- We've not misinterpreted any of the objections to the previous
versions (and ideally that everyone's happy, or at least contentedly
resigned, for this to go through),
- This goes upstream in a way that minimises the conflicts in the
various defconfigs. Given the number of these ports, it'd be great to
either get them to all go through in the same tree or otherwise make
sure the resolutions (while trivial) are as non-annoying as possible.

Cheers,
-- David


> Tamir Duberstein (3):
>       bitmap: remove _check_eq_u32_array
>       bitmap: convert self-test to KUnit
>       bitmap: break kunit into test cases
>
>  MAINTAINERS                           |   2 +-
>  arch/m68k/configs/amiga_defconfig     |   1 -
>  arch/m68k/configs/apollo_defconfig    |   1 -
>  arch/m68k/configs/atari_defconfig     |   1 -
>  arch/m68k/configs/bvme6000_defconfig  |   1 -
>  arch/m68k/configs/hp300_defconfig     |   1 -
>  arch/m68k/configs/mac_defconfig       |   1 -
>  arch/m68k/configs/multi_defconfig     |   1 -
>  arch/m68k/configs/mvme147_defconfig   |   1 -
>  arch/m68k/configs/mvme16x_defconfig   |   1 -
>  arch/m68k/configs/q40_defconfig       |   1 -
>  arch/m68k/configs/sun3_defconfig      |   1 -
>  arch/m68k/configs/sun3x_defconfig     |   1 -
>  arch/powerpc/configs/ppc64_defconfig  |   1 -
>  lib/Kconfig.debug                     |  24 +-
>  lib/Makefile                          |   2 +-
>  lib/{test_bitmap.c => bitmap_kunit.c} | 454 +++++++++++++---------------------
>  tools/testing/selftests/lib/bitmap.sh |   3 -
>  tools/testing/selftests/lib/config    |   1 -
>  19 files changed, 195 insertions(+), 304 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-bitmap-kunit-convert-92d3147b2eee
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

--00000000000020471a062d9dcd23
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgAPPLJ3cgSDlsglGRO6tCCmaeYIvi
FY8hA9kqiR0HAiUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MjA4MDkwNzE0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAGUb2ckzlUVED4IMJDbMwD/GLsokpW5tlQYRB1mKq9TpYGQ+
31IUsQH1TqjSgBGRwtvgki8DQ0zbgLJmUbup3+3MYrQT5g7FhL/t0PSkTzdRxYO3T7FiYCU/IQmt
o+LPDiHSGdPmnb6KJhPPo/BDmFL67n88+AF2YXv6w80R2l7hz8u9nQ5/U7dwGmElw9MF5W+in6m5
pdNvmzgGYFu8nnHijwfPmLq460q5w9IEa1NA+sSOeIn8Xq63lTulYYV/XsnS3jStCUCuDtOvm7wC
ziaxaliS5iVMjEzzkN0Vng7dG+UlfPeCXqp6d4yELH5hmBnKs+RkQ0msMzL4YFcAkus=
--00000000000020471a062d9dcd23--

