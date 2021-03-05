Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5E32E0F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 06:01:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsFvd5qTjz3d9M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:01:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sEe2yFiC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sEe2yFiC; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsFv93z5Nz30Jw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 16:01:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DsFv51fBxz9sWC;
 Fri,  5 Mar 2021 16:01:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614920483;
 bh=HADzFLTJiRHajBtjocr0L74hT5U/LhK0mJtw/ouXjxU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sEe2yFiC70JfvnTxe0YgAiMh6nPZoEvi0h5USTs843tRe/5UWfhsI5ZfJlPD+sxY8
 5UoyDp6tzIGvMLKGfBowCZxj+H5gAiPPDfUoUC5MzRMH2Zxs49/SEwXQf16EpAAU4R
 ffP5FzEKJXU7IbAiBS+oIXeJPwi4wY4tJefrzbVG/9BQ+//8Vxw3EvpXwoB8PNNS//
 NxlemWXb2+BNshP5Oi9NpWOViNwMPTW9EEWmXUBh4JGysfFdDoBg7O4auR1uzvBVcQ
 o+naRGI6YtSJqxX+vvyHHxGVm+N8VzQIGyBfrLdBNapOyGO9Xpd4X5qm8mBaN6MGKc
 2pJljh5YD9i4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Marco Elver <elver@google.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
In-Reply-To: <YEDXJ5JNkgvDFehc@elver.google.com>
References: <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com>
Date: Fri, 05 Mar 2021 16:01:15 +1100
Message-ID: <874khqry78.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Marco Elver <elver@google.com> writes:
> On Thu, Mar 04, 2021 at 12:48PM +0100, Christophe Leroy wrote:
>> Le 04/03/2021 =C3=A0 12:31, Marco Elver a =C3=A9crit=C2=A0:
>> > On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
>> > <christophe.leroy@csgroup.eu> wrote:
>> > > Le 03/03/2021 =C3=A0 11:56, Marco Elver a =C3=A9crit :
>> > > >=20
>> > > > Somewhat tangentially, I also note that e.g. show_regs(regs) (which
>> > > > was printed along the KFENCE report above) didn't include the top
>> > > > frame in the "Call Trace", so this assumption is definitely not
>> > > > isolated to KFENCE.
>> > > >=20
>> > >=20
>> > > Now, I have tested PPC64 (with the patch I sent yesterday to modify =
save_stack_trace_regs()
>> > > applied), and I get many failures. Any idea ?
>> > >=20
>> > > [   17.653751][   T58] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> > > [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarded_=
free+0x2e4/0x530
>> > > [   17.654379][   T58]
>> > > [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfence=
-#77):
>> > > [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
>> > > [   17.655775][   T58]  .__slab_free+0x320/0x5a0
>> > > [   17.656039][   T58]  .test_double_free+0xe0/0x198
>> > > [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
>> > > [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>> > > [   17.657161][   T58]  .kthread+0x18c/0x1a0
>> > > [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
>> > > [   17.659869][   T58]
> [...]
>> >=20
>> > Looks like something is prepending '.' to function names. We expect
>> > the function name to appear as-is, e.g. "kfence_guarded_free",
>> > "test_double_free", etc.
>> >=20
>> > Is there something special on ppc64, where the '.' is some convention?
>> >=20
>>=20
>> I think so, see https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64=
abi.html#FUNC-DES
>>=20
>> Also see commit https://github.com/linuxppc/linux/commit/02424d896
>
> Thanks -- could you try the below patch? You'll need to define
> ARCH_FUNC_PREFIX accordingly.
>
> We think, since there are only very few architectures that add a prefix,
> requiring <asm/kfence.h> to define something like ARCH_FUNC_PREFIX is
> the simplest option. Let me know if this works for you.
>
> There an alternative option, which is to dynamically figure out the
> prefix, but if this simpler option is fine with you, we'd prefer it.

We have rediscovered this problem in basically every tracing / debugging
feature added in the last 20 years :)

I think the simplest solution is the one tools/perf/util/symbol.c uses,
which is to just skip a leading '.'.

Does that work?

diff --git a/mm/kfence/report.c b/mm/kfence/report.c
index ab83d5a59bb1..67b49dc54b38 100644
--- a/mm/kfence/report.c
+++ b/mm/kfence/report.c
@@ -67,6 +67,9 @@ static int get_stack_skipnr(const unsigned long stack_ent=
ries[], int num_entries
 	for (skipnr =3D 0; skipnr < num_entries; skipnr++) {
 		int len =3D scnprintf(buf, sizeof(buf), "%ps", (void *)stack_entries[ski=
pnr]);
=20
+		if (buf[0] =3D=3D '.')
+			buf++;
+
 		if (str_has_prefix(buf, "kfence_") || str_has_prefix(buf, "__kfence_") ||
 		    !strncmp(buf, "__slab_free", len)) {
 			/*



cheers
