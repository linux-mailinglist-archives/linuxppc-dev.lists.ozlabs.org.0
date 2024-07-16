Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF29321EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 10:34:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=poX45BcN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNXS92Pnfz3cZ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 18:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=poX45BcN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNXRS2bQyz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 18:34:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38DCC61208
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 08:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B32C4AF48
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721118849;
	bh=eN5SJXM/h5WzuVg+O4VaQqJXzMPxq2eMEmP7BAucE9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=poX45BcN6huIBRUiugOnTWdsPI0VMSTvmUP1i0VWy6/z8ze/gY8ZHbRd9gj8PplhA
	 GpAMerjWZWZtqJKS9xkaAFSMkvnbbBXiRjs9BWjsL/8qUMo51me/Q2awjKb+sUhXOj
	 ANrBIbApsjv0k4rKmqQUCcQvurGMq8qKBr0+IBdaqIW8dchzCx11RZ+M4R1wouGcFX
	 xnx433W66z8b/4zs3Z9pLXzljkyAXT1C6UT9gSLaVmZeWXjQQ5rOfu38v3SWxqYF8Y
	 7rElvStqXnvnLrQFFR6MyM4SQrIClzhjE7QDEF6lBxnHTrs7q+R2dwZiGz7wBO2tIS
	 xbD5k2uBMSXkg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea8320d48so4011125e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 01:34:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcmPclQpUY97EU8DO7/c5oCfeZzS3e32KF14Uhlk2PfeRUrd8SzlppojjcsFUHAKhlEcmSrYUPlPehsX2hIcC6j1AWLHpuJXYRnYX13A==
X-Gm-Message-State: AOJu0YzbxyPC841Yk8HZhJ1JQkflt6giC4RluMJV807o5Eq6bEQg6J3O
	Rlqnri3vMhY/bKBjzDI0oquUmepWhQkqex7qLGRmaILsJMJjLf4/JHVP3hgwgmJSGV52Nu3oAzx
	dzyukwDrVicf9E8RjjArxOV/xOtA=
X-Google-Smtp-Source: AGHT+IEJMEziyjXCZ+o/Kwe/ryELKeCMHEDmr/h4lYHCXz5h03acFXPEX243JN7E+7jHFSE236uANaCB17OJ3QX7F4c=
X-Received: by 2002:a05:6512:15a5:b0:52c:8275:6292 with SMTP id
 2adb3069b0e04-52edf8dcef2mr378100e87.34.1721118847333; Tue, 16 Jul 2024
 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240613133711.2867745-1-zhengyejian1@huawei.com> <20240613133711.2867745-3-zhengyejian1@huawei.com>
In-Reply-To: <20240613133711.2867745-3-zhengyejian1@huawei.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jul 2024 17:33:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQaLc6aDK85qQtPHoCkQSGyL-TxXjpgJTfehe2Q1=jMSA@mail.gmail.com>
Message-ID: <CAK7LNAQaLc6aDK85qQtPHoCkQSGyL-TxXjpgJTfehe2Q1=jMSA@mail.gmail.com>
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

On Thu, Jun 13, 2024 at 10:36=E2=80=AFPM Zheng Yejian <zhengyejian1@huawei.=
com> wrote:
>
> When a weak type function is overridden, its symbol will be removed
> from the symbol table, but its code will not be removed. Besides,
> due to lacking of size for kallsyms, kernel compute function size by
> substracting its symbol address from its next symbol address (see
> kallsyms_lookup_size_offset()). These will cause that size of some
> function is computed to be larger than it actually is, just because
> symbol of its following weak function is removed.
>
> This issue also causes multiple __fentry__ locations to be counted in
> the some function scope, and eventually causes ftrace_location() to find
> wrong __fentry__ location. It was reported in
> Link: https://lore.kernel.org/all/20240607115211.734845-1-zhengyejian1@hu=
awei.com/
>
> Peter suggested to change scipts/kallsyms.c to emit readily
> identifiable symbol names for all the weak junk, eg:
>
>   __weak_junk_NNNNN
>
> The name of this kind symbol needs some discussion, but it's temporarily
> called "__hole_symbol_XXXXX" in this patch:
> 1. Pass size info to scripts/kallsyms  (see mksysmap());
> 2. Traverse sorted function symbols, if one function address plus its
>    size less than next function address, it means there's a hole, then
>    emit a symbol "__hole_symbol_XXXXX" there which type is 't'.
>
> After this patch, the effect is as follows:
>
>   $ cat /proc/kallsyms | grep -A 3 do_one_initcall
>   ffffffff810021e0 T do_one_initcall
>   ffffffff8100245e t __hole_symbol_XXXXX
>   ffffffff810024a0 t __pfx_rootfs_init_fs_context
>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>



With my quick test, "t__hole_symbol_XXXXX" was encoded
into the following 10-byte stream.

.byte 0x09, 0x94, 0xbf, 0x18, 0xf3, 0x3d, 0xce, 0xd1, 0xd1, 0x58



Now "t__hole_symbol_XXXXX" is the most common symbol name.
However, 10 byte is consumed for every instance of
"t__hole_symbol_XXXXX".

This is much less efficient thanI had expected,
although I did not analyze the logic of this inefficiency.







> ---
>  scripts/kallsyms.c      | 101 +++++++++++++++++++++++++++++++++++++++-
>  scripts/link-vmlinux.sh |   4 +-
>  scripts/mksysmap        |   2 +-
>  3 files changed, 102 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 6559a9802f6e..5c4cde864a04 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -35,6 +35,7 @@
>  struct sym_entry {
>         struct sym_entry *next;
>         unsigned long long addr;
> +       unsigned long long size;
>         unsigned int len;
>         unsigned int seq;
>         unsigned int start_pos;
> @@ -74,6 +75,7 @@ static int token_profit[0x10000];
>  static unsigned char best_table[256][2];
>  static unsigned char best_table_len[256];
>
> +static const char hole_symbol[] =3D "__hole_symbol_XXXXX";
>
>  static void usage(void)
>  {
> @@ -130,8 +132,16 @@ static struct sym_entry *read_symbol(FILE *in, char =
**buf, size_t *buf_len)
>         size_t len;
>         ssize_t readlen;
>         struct sym_entry *sym;
> +       unsigned long long size =3D 0;
>
>         errno =3D 0;
> +       /*
> +        * Example of expected symbol format:
> +        * 1. symbol with size info:
> +        *    ffffffff81000070 00000000000001d7 T __startup_64
> +        * 2. symbol without size info:
> +        *    0000000002a00000 A text_size
> +        */
>         readlen =3D getline(buf, buf_len, in);
>         if (readlen < 0) {
>                 if (errno) {
> @@ -145,9 +155,24 @@ static struct sym_entry *read_symbol(FILE *in, char =
**buf, size_t *buf_len)
>                 (*buf)[readlen - 1] =3D 0;
>
>         addr =3D strtoull(*buf, &p, 16);
> +       if (*buf =3D=3D p || *p++ !=3D ' ') {
> +               fprintf(stderr, "line format error: unable to parse addre=
ss\n");
> +               exit(EXIT_FAILURE);
> +       }
> +
> +       if (*p =3D=3D '0') {
> +               char *str =3D p;
>
> -       if (*buf =3D=3D p || *p++ !=3D ' ' || !isascii((type =3D *p++)) |=
| *p++ !=3D ' ') {
> -               fprintf(stderr, "line format error\n");
> +               size =3D strtoull(str, &p, 16);
> +               if (str =3D=3D p || *p++ !=3D ' ') {
> +                       fprintf(stderr, "line format error: unable to par=
se size\n");
> +                       exit(EXIT_FAILURE);
> +               }
> +       }
> +
> +       type =3D *p++;
> +       if (!isascii(type) || *p++ !=3D ' ') {
> +               fprintf(stderr, "line format error: unable to parse type\=
n");
>                 exit(EXIT_FAILURE);
>         }
>
> @@ -182,6 +207,7 @@ static struct sym_entry *read_symbol(FILE *in, char *=
*buf, size_t *buf_len)
>                 exit(EXIT_FAILURE);
>         }
>         sym->addr =3D addr;
> +       sym->size =3D size;
>         sym->len =3D len;
>         sym->sym[0] =3D type;
>         strcpy(sym_name(sym), name);
> @@ -795,6 +821,76 @@ static void sort_symbols(void)
>         qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
>  }
>
> +static int may_exist_hole_after_symbol(const struct sym_entry *se)


The return type should be bool.



> +{
> +       char type =3D se->sym[0];
> +
> +       /* Only check text symbol or weak symbol */
> +       if (type !=3D 't' && type !=3D 'T' &&
> +           type !=3D 'w' && type !=3D 'W')
> +               return 0;
> +       /* Symbol without size has no hole */
> +       return se->size !=3D 0;
> +}
> +
> +static struct sym_entry *gen_hole_symbol(unsigned long long addr)
> +{
> +       struct sym_entry *sym;
> +       static size_t len =3D sizeof(hole_symbol);
> +
> +       /* include type field */
> +       sym =3D malloc(sizeof(*sym) + len + 1);
> +       if (!sym) {
> +               fprintf(stderr, "unable to allocate memory for hole symbo=
l\n");
> +               exit(EXIT_FAILURE);
> +       }
> +       sym->addr =3D addr;
> +       sym->size =3D 0;
> +       sym->len =3D len;
> +       sym->sym[0] =3D 't';
> +       strcpy(sym_name(sym), hole_symbol);
> +       sym->percpu_absolute =3D 0;
> +       return sym;
> +}
> +
> +static void emit_hole_symbols(void)
> +{
> +       unsigned int i, pos, nr_emit;
> +       struct sym_entry **new_table;
> +       unsigned int new_cnt;
> +
> +       nr_emit =3D 0;
> +       for (i =3D 0; i < table_cnt - 1; i++) {
> +               if (may_exist_hole_after_symbol(table[i]) &&
> +                   table[i]->addr + table[i]->size < table[i+1]->addr)
> +                       nr_emit++;
> +       }
> +       if (!nr_emit)
> +               return;
> +
> +       new_cnt =3D table_cnt + nr_emit;
> +       new_table =3D malloc(sizeof(*new_table) * new_cnt);


Do you need to allocate another huge table?

You can use realloc() to append the room for nr_emit
if you iterate the table in the reverse order.







> +       if (!new_table) {
> +               fprintf(stderr, "unable to allocate memory for new table\=
n");
> +               exit(EXIT_FAILURE);
> +       }
> +
> +       pos =3D 0;
> +       for (i =3D 0; i < table_cnt; i++) {
> +               unsigned long long addr;
> +
> +               new_table[pos++] =3D table[i];
> +               if ((i =3D=3D table_cnt - 1) || !may_exist_hole_after_sym=
bol(table[i]))
> +                       continue;
> +               addr =3D table[i]->addr + table[i]->size;
> +               if (addr < table[i+1]->addr)
> +                       new_table[pos++] =3D gen_hole_symbol(addr);
> +       }
> +       free(table);
> +       table =3D new_table;
> +       table_cnt =3D new_cnt;
> +}
> +
>  static void make_percpus_absolute(void)
>  {
>         unsigned int i;
> @@ -854,6 +950,7 @@ int main(int argc, char **argv)
>         if (absolute_percpu)
>                 make_percpus_absolute();
>         sort_symbols();
> +       emit_hole_symbols();
>         if (base_relative)
>                 record_relative_base();
>         optimize_token_table();
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 518c70b8db50..8e1373902bfe 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -189,11 +189,11 @@ kallsyms_step()
>  }
>
>  # Create map file with all symbols from ${1}
> -# See mksymap for additional details
> +# See mksysmap for additional details
>  mksysmap()
>  {
>         info NM ${2}
> -       ${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
> +       ${NM} -nS "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
>  }
>
>  sorttable()
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index c12723a04655..7a4415f21143 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -2,7 +2,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # sed script to filter out symbols that are not needed for System.map,
> -# or not suitable for kallsyms. The input should be 'nm -n <file>'.
> +# or not suitable for kallsyms. The input should be 'nm -nS <file>'.
>  #
>  # System.map is used by module-init tools and some debugging
>  # tools to retrieve the actual addresses of symbols in the kernel.
> --
> 2.25.1
>
>


--=20
Best Regards
Masahiro Yamada
