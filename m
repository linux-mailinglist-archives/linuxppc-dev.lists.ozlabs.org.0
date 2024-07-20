Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609B938197
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 16:16:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RDCGrYkF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WR7rD0kNJz2xPZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jul 2024 00:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RDCGrYkF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WR7qX0R1rz30XZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2024 00:15:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8C60CE0974
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 14:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6506CC4AF0E
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721484931;
	bh=siC36GPXr2aNokMak0PbQR2qdcyg1ve7YXRSuhNJEbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RDCGrYkFHBvehj29UDRcl3t1EHsB51xf7GFo5CKB+uCbnDQtMfOicE33zGH7obU16
	 jVTtgFsRzB3DbZepcD2yJrIKvGGKY/+bb8sS+JmtXmlmXTRV6VdHtLMMfmnOa1q8+C
	 HrWen2hKhk2s0Je4ox5loQTIQviQ3g0ZK3c24Soc84jYZj0UYDa4aEQ33k7A2nUTGa
	 b+aRyZ9coYkE58bdz9EiXRzyaHFOWkWs0Wkt6VRBWOeLEadXb7ny85sg+jbP2vt4YR
	 SrtG4gsnkQGC2WvKsrbktxEE5pFxP7rJdHBytYr/64QJTDQdpZRvJdNKjfgL1frJK4
	 XqHQrYOlg0dKA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eec7e43229so38641821fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 07:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV4WvTyfABZVTwC8zHPI0KSxGPW/CtolzTibkw+fN7i0/Fa/CyH3YEQA8NmBqHI69/u7KDnlDrnw0gcDBmxYIET0sCXYmXkgQII3i9qg==
X-Gm-Message-State: AOJu0YzCvnWn8zaMuKr6lNimi22sJ33kDkAUSat3jfHxdgsg9MN0N5HA
	y1LYHqi2brleOH6Vd2HqnTmxjMTNI013KD0GKPwrc9tF1IbgUVzLGotv0hXZkjcwgLjykMKO/nt
	Bjy2EMK+9PY/LOyOO3fMBd92TAOo=
X-Google-Smtp-Source: AGHT+IEhxz5OQdjF+IMtXBi+my/g5+ok7BZORmWpYKrgQ6H3SidmmywUXep47MVnf2ny1Eir5dgtPfQ95aC55PC0NSg=
X-Received: by 2002:a2e:9816:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2ef16733722mr18077141fa.6.1721484929979; Sat, 20 Jul 2024
 07:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240613133711.2867745-1-zhengyejian1@huawei.com>
 <20240613133711.2867745-3-zhengyejian1@huawei.com> <CAK7LNAQaLc6aDK85qQtPHoCkQSGyL-TxXjpgJTfehe2Q1=jMSA@mail.gmail.com>
 <c87eeb9c-5f54-480c-17c2-01339416b1b9@huawei.com>
In-Reply-To: <c87eeb9c-5f54-480c-17c2-01339416b1b9@huawei.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 20 Jul 2024 23:14:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARiR5z9hPRG932T7YjRWqkX_qZ7WKmbxx7iTo2w5YJojQ@mail.gmail.com>
Message-ID: <CAK7LNARiR5z9hPRG932T7YjRWqkX_qZ7WKmbxx7iTo2w5YJojQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] kallsyms: Emit symbol at the holes in the text
To: Zheng Yejian <zhengyejian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: mark.rutland@arm.com, kees@kernel.org, dave.hansen@linux.intel.com, james.clark@arm.com, hpa@zytor.com, x86@kernel.org, christophe.leroy@csgroup.eu, peterz@infradead.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, yhs@fb.com, linux-trace-kernel@vger.kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, rostedt@goodmis.org, nathan@kernel.org, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, jpoimboe@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, mcgrof@kernel.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2024 at 12:45=E2=80=AFPM Zheng Yejian <zhengyejian1@huawei.=
com> wrote:
>
> On 2024/7/16 16:33, Masahiro Yamada wrote:
> > On Thu, Jun 13, 2024 at 10:36=E2=80=AFPM Zheng Yejian <zhengyejian1@hua=
wei.com> wrote:
> >>
> >> When a weak type function is overridden, its symbol will be removed
> >> from the symbol table, but its code will not be removed. Besides,
> >> due to lacking of size for kallsyms, kernel compute function size by
> >> substracting its symbol address from its next symbol address (see
> >> kallsyms_lookup_size_offset()). These will cause that size of some
> >> function is computed to be larger than it actually is, just because
> >> symbol of its following weak function is removed.
> >>
> >> This issue also causes multiple __fentry__ locations to be counted in
> >> the some function scope, and eventually causes ftrace_location() to fi=
nd
> >> wrong __fentry__ location. It was reported in
> >> Link: https://lore.kernel.org/all/20240607115211.734845-1-zhengyejian1=
@huawei.com/
> >>
> >> Peter suggested to change scipts/kallsyms.c to emit readily
> >> identifiable symbol names for all the weak junk, eg:
> >>
> >>    __weak_junk_NNNNN
> >>
> >> The name of this kind symbol needs some discussion, but it's temporari=
ly
> >> called "__hole_symbol_XXXXX" in this patch:
> >> 1. Pass size info to scripts/kallsyms  (see mksysmap());
> >> 2. Traverse sorted function symbols, if one function address plus its
> >>     size less than next function address, it means there's a hole, the=
n
> >>     emit a symbol "__hole_symbol_XXXXX" there which type is 't'.
> >>
> >> After this patch, the effect is as follows:
> >>
> >>    $ cat /proc/kallsyms | grep -A 3 do_one_initcall
> >>    ffffffff810021e0 T do_one_initcall
> >>    ffffffff8100245e t __hole_symbol_XXXXX
> >>    ffffffff810024a0 t __pfx_rootfs_init_fs_context
> >>
> >> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> >> Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
> >
> >
> >
> > With my quick test, "t__hole_symbol_XXXXX" was encoded
> > into the following 10-byte stream.
> >
> > .byte 0x09, 0x94, 0xbf, 0x18, 0xf3, 0x3d, 0xce, 0xd1, 0xd1, 0x58
> >
> >
> >
> > Now "t__hole_symbol_XXXXX" is the most common symbol name.
> > However, 10 byte is consumed for every instance of
> > "t__hole_symbol_XXXXX".
> >
> > This is much less efficient thanI had expected,
> > although I did not analyze the logic of this inefficiency.
> >
> Hi, Masahiro!
>
> In my local test, "t__hole_symbol_XXXXX" was finally encoded
> into just one byte. See "kallsyms_token_table" in the .tmp_vmlinux.kallsy=
ms2.S:
>
>    kallsyms_token_table:
>          [...]
>          .asciz  "t__hole_symbol_XXXXX"
>          .asciz  "hole_symbol_XXXXX"
>          .asciz  "e_symbol_XXXXX"
>          .asciz  "XXXXX"
>          .asciz  "XXX"
>          .asciz  "e_symbol_"
>          .asciz  "ymbol_"
>          .asciz  "ymb"
>          .asciz  "hol"
>          .asciz  "ol_"
>          .asciz  "pfx"
>          .asciz  "pf"
>          .asciz  "e_s"
>          .asciz  "ym"
>          .asciz  "t__"
>          .asciz  "_s"
>          .asciz  "ol"
>          .asciz  "__"
>          .asciz  "XX"
>
> But it would still takes up several tokens due to substrings of
> "t__hole_symbol_XXXXX" would also become the most common ones.
> After this patch, the number of "t__hole_symbol_XXXXX" will be ~30% of th=
e total.
>
> >
> >
> >
> >
> >
> >
> >> ---
> >>   scripts/kallsyms.c      | 101 ++++++++++++++++++++++++++++++++++++++=
+-
> >>   scripts/link-vmlinux.sh |   4 +-
> >>   scripts/mksysmap        |   2 +-
> >>   3 files changed, 102 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> >> index 6559a9802f6e..5c4cde864a04 100644
> >> --- a/scripts/kallsyms.c
> >> +++ b/scripts/kallsyms.c
> >> @@ -35,6 +35,7 @@
> >>   struct sym_entry {
> >>          struct sym_entry *next;
> >>          unsigned long long addr;
> >> +       unsigned long long size;
> >>          unsigned int len;
> >>          unsigned int seq;
> >>          unsigned int start_pos;
> >> @@ -74,6 +75,7 @@ static int token_profit[0x10000];
> >>   static unsigned char best_table[256][2];
> >>   static unsigned char best_table_len[256];
> >>
> >> +static const char hole_symbol[] =3D "__hole_symbol_XXXXX";
> >>
> >>   static void usage(void)
> >>   {
> >> @@ -130,8 +132,16 @@ static struct sym_entry *read_symbol(FILE *in, ch=
ar **buf, size_t *buf_len)
> >>          size_t len;
> >>          ssize_t readlen;
> >>          struct sym_entry *sym;
> >> +       unsigned long long size =3D 0;
> >>
> >>          errno =3D 0;
> >> +       /*
> >> +        * Example of expected symbol format:
> >> +        * 1. symbol with size info:
> >> +        *    ffffffff81000070 00000000000001d7 T __startup_64
> >> +        * 2. symbol without size info:
> >> +        *    0000000002a00000 A text_size
> >> +        */
> >>          readlen =3D getline(buf, buf_len, in);
> >>          if (readlen < 0) {
> >>                  if (errno) {
> >> @@ -145,9 +155,24 @@ static struct sym_entry *read_symbol(FILE *in, ch=
ar **buf, size_t *buf_len)
> >>                  (*buf)[readlen - 1] =3D 0;
> >>
> >>          addr =3D strtoull(*buf, &p, 16);
> >> +       if (*buf =3D=3D p || *p++ !=3D ' ') {
> >> +               fprintf(stderr, "line format error: unable to parse ad=
dress\n");
> >> +               exit(EXIT_FAILURE);
> >> +       }
> >> +
> >> +       if (*p =3D=3D '0') {
> >> +               char *str =3D p;
> >>
> >> -       if (*buf =3D=3D p || *p++ !=3D ' ' || !isascii((type =3D *p++)=
) || *p++ !=3D ' ') {
> >> -               fprintf(stderr, "line format error\n");
> >> +               size =3D strtoull(str, &p, 16);
> >> +               if (str =3D=3D p || *p++ !=3D ' ') {
> >> +                       fprintf(stderr, "line format error: unable to =
parse size\n");
> >> +                       exit(EXIT_FAILURE);
> >> +               }
> >> +       }
> >> +
> >> +       type =3D *p++;
> >> +       if (!isascii(type) || *p++ !=3D ' ') {
> >> +               fprintf(stderr, "line format error: unable to parse ty=
pe\n");
> >>                  exit(EXIT_FAILURE);
> >>          }
> >>
> >> @@ -182,6 +207,7 @@ static struct sym_entry *read_symbol(FILE *in, cha=
r **buf, size_t *buf_len)
> >>                  exit(EXIT_FAILURE);
> >>          }
> >>          sym->addr =3D addr;
> >> +       sym->size =3D size;
> >>          sym->len =3D len;
> >>          sym->sym[0] =3D type;
> >>          strcpy(sym_name(sym), name);
> >> @@ -795,6 +821,76 @@ static void sort_symbols(void)
> >>          qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
> >>   }
> >>
> >> +static int may_exist_hole_after_symbol(const struct sym_entry *se)
> >
> >
> > The return type should be bool.
> >
>
> Yes!
>
> >
> >
> >> +{
> >> +       char type =3D se->sym[0];
> >> +
> >> +       /* Only check text symbol or weak symbol */
> >> +       if (type !=3D 't' && type !=3D 'T' &&
> >> +           type !=3D 'w' && type !=3D 'W')
> >> +               return 0;
> >> +       /* Symbol without size has no hole */
> >> +       return se->size !=3D 0;
> >> +}
> >> +
> >> +static struct sym_entry *gen_hole_symbol(unsigned long long addr)
> >> +{
> >> +       struct sym_entry *sym;
> >> +       static size_t len =3D sizeof(hole_symbol);
> >> +
> >> +       /* include type field */
> >> +       sym =3D malloc(sizeof(*sym) + len + 1);
> >> +       if (!sym) {
> >> +               fprintf(stderr, "unable to allocate memory for hole sy=
mbol\n");
> >> +               exit(EXIT_FAILURE);
> >> +       }
> >> +       sym->addr =3D addr;
> >> +       sym->size =3D 0;
> >> +       sym->len =3D len;
> >> +       sym->sym[0] =3D 't';
> >> +       strcpy(sym_name(sym), hole_symbol);
> >> +       sym->percpu_absolute =3D 0;
> >> +       return sym;
> >> +}
> >> +
> >> +static void emit_hole_symbols(void)
> >> +{
> >> +       unsigned int i, pos, nr_emit;
> >> +       struct sym_entry **new_table;
> >> +       unsigned int new_cnt;
> >> +
> >> +       nr_emit =3D 0;
> >> +       for (i =3D 0; i < table_cnt - 1; i++) {
> >> +               if (may_exist_hole_after_symbol(table[i]) &&
> >> +                   table[i]->addr + table[i]->size < table[i+1]->addr=
)
> >> +                       nr_emit++;
> >> +       }
> >> +       if (!nr_emit)
> >> +               return;
> >> +
> >> +       new_cnt =3D table_cnt + nr_emit;
> >> +       new_table =3D malloc(sizeof(*new_table) * new_cnt);
> >
> >
> > Do you need to allocate another huge table?
> >
> > You can use realloc() to append the room for nr_emit
> > if you iterate the table in the reverse order.
> >
>
> Yes, it would be much better. If it turns out to be the
> "emit hole symbol" solution, I'll change it to that in the next version,
> actually, I forgot to mark this series as "RFC".


"__hole_symbol_XXXXX" is too much.

You can use the empty symbol type/name as a special case
to represent the hole.


--=20
Best Regards
Masahiro Yamada
