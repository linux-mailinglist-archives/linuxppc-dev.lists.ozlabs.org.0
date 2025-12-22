Return-Path: <linuxppc-dev+bounces-14943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20177CD7386
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 22:45:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZsBf53FBz2xS7;
	Tue, 23 Dec 2025 08:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766410810;
	cv=none; b=Kp9gIom+3hrPZSQND5GQtvEws6uPUt0pZJZ4Wo64128GR0vcy7ph8SGZjNsT/png8Vp55IpqChVg3dvnknvjHzBdGRKgRUWck3P8yqzrkMAC8o6EaOuNHd4AOlMfkemwCxkSaJ62KkQOHkbt5R8ntFseI1uZbaGbjR0mb2iReN+kua4hBKH/C8TMmzX4aRLFdVQoFkjebgAXHweJkNgTl3W+Kb1WHer0Mfrzps9YDkEEDUrlzD7OAsG19erc17+UegsQa7k4Gmy2K/cu+NKLzIsP75bHHOVTrwfEr7AKUfqjeyxrhE9F1lR5X+eKlBNCdG7ptqGso5jO810/y6UXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766410810; c=relaxed/relaxed;
	bh=aU+/ZTMaZSNmvt0fAHRXOTOUyRFgKDEjwhLy2OfysYc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cMrzDXNnOc/IgvQlt4ohId0Mv327/dxNazxLd8pQSdxKcsz+wS9yBvHm5oAmktfy49W/6Rm3lVSSwMD9AVxXChQlvPcw/mLNiYSNLg8CNR5Kp3KehrruEpkkFveEaBIdweENEhGm5CahXiUDc9090j+2wJ/UfuZqhaQGFGrRruJ0qrwLkgtrOztW0ZY6SLgfBWHwFbs0nnKhgs8gVMuUbL/Y5DxyIRnqvOTUog1hxYu+T2z/CJgfl3oAtcuOnPG7b8CO08dRpNjvA1udI5OLSJ+4958CMdRGoK+XC6JQtI8hOeBPIqy71R8+lhz4RuarNlJOzsfY9QLTnUgTPK2sxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZCj0C9be; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=tamird@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZCj0C9be;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=tamird@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZfQd3Rsfz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 00:40:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFE4F60157;
	Mon, 22 Dec 2025 13:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35697C116D0;
	Mon, 22 Dec 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766410805;
	bh=muLgVZCdKaW2U2xDoEdjfO+6X4Y0Pnz9sEwYXNUnPt8=;
	h=From:Subject:Date:To:Cc:From;
	b=ZCj0C9beJef3axNrm2XgnoGLms2pgUlR2mrt44z9HlCo/nXdOZ10ZlKH9eCS4MOqx
	 hu406JUdw7F1SI74nsIBhNeBQ/+f56Ny32VNrnSFeDqqwhQlFZtCN1rrHzq4iWKjdZ
	 qqHK7xpVWuiFKvC9rRrYdincmqDl5IopNBmK4tz8kGXwnBFvHcl6pIkJebxNte4kTH
	 29drDNpdcYtJEBpZN14M8TTTy2io/MJJgWOdEZDEUHR5Io14zL3+tceCxBnI+RlipD
	 TuSDFuo5fAOQIVEpfijBRPUF4br/1Gm/4Jkm7gIdC63dBOHIChv0M460pGJp4QUpx9
	 iWwGwgb0UDRBg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 0/3] bitmap: convert self-test to KUnit
Date: Mon, 22 Dec 2025 14:39:53 +0100
Message-Id: <20251222-bitmap-kunit-convert-v2-0-6a61a5330eff@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7Zgy/EVX3MOwgDLCRGlJWxsN4
 e5WLuDyveR73waenbCHa7aB4yherElApwz03JuJUcbEQIoqRarBQcLSr/h4GQmorYnsAl5oLPK
 yGYiZIU1Xx3d5H9lbl3gWH6z7HC8x/9k/wZijQl2RqpuqKIuhbqell+dZ2wW6fd+/Pj7Q1bgAA
 AA=
X-Change-ID: 20250207-bitmap-kunit-convert-92d3147b2eee
To: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, 
 Kees Cook <kees@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>, 
 Alexander Potapenko <glider@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766410800; l=5806;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=muLgVZCdKaW2U2xDoEdjfO+6X4Y0Pnz9sEwYXNUnPt8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPdMa0k+VR5LYx68pRWGXM8XiWp2v3ywu104Hv6JbMXqGymv1ic7WHGars53bB8FK7u1ctCpS3z
 ghxhcU2RtLQk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is the last remaining "Test Module" kselftest, the rest having been
converted to KUnit.

Relative to v1 this keeps benchmarks out of KUnit in light of Yury's
concerns:

On Sat, Feb 8, 2025 at 12:53 PM Yury Norov <yury.norov@gmail.com> wrote:
>
> [...]
>
> This is my evidence: sometimes people report performance or whatever
> issues on their systems, suspecting bitmaps guilty. I ask them to run
> the bitmap or find_bit test to narrow the problem. Sometimes I need to
> test a hardware I have no access to, and I have to (kindly!) ask
people
> to build a small test and run it. I don't want to ask them to rebuild
> the whole kernel, or even to build something else.
>
> https://lore.kernel.org/all/YuWk3titnOiQACzC@yury-laptop/

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 bitmap

There was a previous attempt[2] to do this in July 2024. Please bear
with me as I try to understand and address the objections from that
time. I've spoken with Muhammad Usama Anjum, the author of that series,
and received their approval to "take over" this work. Here we go...

On 7/26/24 11:45 PM, John Hubbard wrote:
> 
> This changes the situation from "works for Linus' tab completion
> case", to "causes a tab completion problem"! :)
> 
> I think a tests/ subdir is how we eventually decided to do this [1],
> right?
> 
> So:
> 
>     lib/tests/bitmap_kunit.c
> 
> [1] https://lore.kernel.org/20240724201354.make.730-kees@kernel.org

This is true and unfortunate, but not trivial to fix because new
kallsyms tests were placed in lib/tests in commit 84b4a51fce4c
("selftests: add new kallsyms selftests")  *after* the KUnit filename
best practices were adopted.

I propose that the KUnit maintainers blaze this trail using
`string_kunit.c` which currently still lives in lib/ despite the KUnit
docs giving it as an example at lib/tests/.

On 7/27/24 12:24 AM, Shuah Khan wrote:
> 
> This change will take away the ability to run bitmap tests during
> boot on a non-kunit kernel.
> 
> Nack on this change. I wan to see all tests that are being removed
> from lib because they have been converted - also it doesn't make
> sense to convert some tests like this one that add the ability test
> during boot.

This point was also discussed in another thread[3] in which:

On 7/27/24 12:35 AM, Shuah Khan wrote:
> 
> Please make sure you aren't taking away the ability to run these tests during
> boot. 
>
> It doesn't make sense to convert every single test especially when it
> is intended to be run during boot without dependencies - not as a kunit test
> but a regression test during boot.
> 
> bitmap is one example - pay attention to the config help test - bitmap
> one clearly states it runs regression testing during boot. Any test that
> says that isn't a candidate for conversion.
> 
> I am going to nack any such conversions.

The crux of the argument seems to be that the config help text is taken
to describe the author's intent with the fragment "at boot". I think
this may be a case of confirmation bias: I see at least the following
KUnit tests with "at boot" in their help text:
- CPUMASK_KUNIT_TEST
- BITFIELD_KUNIT
- CHECKSUM_KUNIT
- UTIL_MACROS_KUNIT

It seems to me that the inference being made is that any test that runs
"at boot" is intended to be run by both developers and users, but I find
no evidence that bitmap in particular would ever provide additional
value when run by users.

There's further discussion about KUnit not being "ideal for cases where
people would want to check a subsystem on a running kernel", but I find
no evidence that bitmap in particular is actually testing the running
kernel; it is a unit test of the bitmap functions, which is also stated
in the config help text.

David Gow made many of the same points in his final reply[4], which was
never replied to.

Link: https://lore.kernel.org/all/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com/T/#u [0]
Link: https://lore.kernel.org/all/20250207-scanf-kunit-convert-v4-0-a23e2afaede8@gmail.com/T/#u [1]
Link: https://lore.kernel.org/all/20240726110658.2281070-1-usama.anjum@collabora.com/T/#u [2]
Link: https://lore.kernel.org/all/327831fb-47ab-4555-8f0b-19a8dbcaacd7@collabora.com/T/#u [3]
Link: https://lore.kernel.org/all/CABVgOSmMoPD3JfzVd4VTkzGL2fZCo8LfwzaVSzeFimPrhgLa5w@mail.gmail.com/ [4]

Thanks for your attention.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Rebase on v6.19-rc1, dropping the first patch.
- Extract benchmarks into new module and deduplicate
  `test_bitmap_{read,write}_perf`.
- Remove tc_err() and use KUnit assertions.
- Parameterize `test_bitmap_cut` and `test_bitmap_parse{,list}`.
- Drop KUnit boilerplate from BITMAP_KUNIT_TEST help text.
- Drop arch changes.
- Link to v1: https://lore.kernel.org/r/20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com

---
Tamir Duberstein (3):
      test_bitmap: extract benchmark module
      bitmap: convert self-test to KUnit
      bitmap: break kunit into test cases

 MAINTAINERS                           |   3 +-
 lib/Kconfig.debug                     |  16 +-
 lib/Makefile                          |   5 +-
 lib/bitmap_benchmark.c                |  89 +++++
 lib/{test_bitmap.c => bitmap_kunit.c} | 630 ++++++++++++++--------------------
 tools/testing/selftests/lib/Makefile  |   2 +-
 tools/testing/selftests/lib/bitmap.sh |   3 -
 tools/testing/selftests/lib/config    |   1 -
 8 files changed, 360 insertions(+), 389 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250207-bitmap-kunit-convert-92d3147b2eee

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>


