Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7738D8751
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 18:31:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xoYqQSzi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtK4H3Cd3z3cNt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 02:31:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xoYqQSzi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtK3V1Mcjz3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 02:31:01 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f66ad03847so216055ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717432254; x=1718037054; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odXlTBloBlCtY6mJHNwtLQip4qBpe7S6TT1VIDMgyc0=;
        b=xoYqQSziKAbZ5tvbZLxpWh5GNasau23Mk+vUJp3MXa9weT1OKyoaWniCQq5qVMb35f
         fyhVpCY/llcsc/VGqSaJfhPpRiwKgqVq4xgidgtyhwxMK5a9HM8JQwKdTDAUaeMYeXT7
         vMlj5wa+DagXhfI2EOod4rluYnSeM9GBSyvNAoKGkHUpE2RBR0N2dUp3/MXyoiTskOzp
         YWED7W1wLKG7Bma1ZtVPqptPk/9+hLwUbh5y4LPryOmOfxN+YWzNh8XLMlIX8szzfNWL
         dhQWXJZIiBsUoBFK/g+mvgchTWX0aJHOF3HIsvameGXnMu9OY5CIdlfF/8AeLEP7Puo+
         Utew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717432254; x=1718037054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odXlTBloBlCtY6mJHNwtLQip4qBpe7S6TT1VIDMgyc0=;
        b=XG75b1AhkWv92xkgZ+jS/pwYLFWnjIbW8/HimofU9pB/4JBBLFu5CfbbS4LyLxQCGd
         4IJvANmfDKPYRHZ78SqA+MA0y6SyxO/gpVvkoH8Dhs1L0HSnHvv735I+gPYOIbCbTdwL
         TVEd6DiShBQrB5Pkt7IsMaDjWO9Q7t/zx8uhYv9brUpEp4rnQxwpQfbB3LDEtnkqIWgy
         7HNV4e3vdAx5mETs3m81jbLErD11Dvz5dgDWpbdSUqQKY2NgDUAHSlmEnZE3etPuLqcD
         g670H/zHH3512EjwYHZkmZLNb9n7GAHrJlc14V6SxO8IUkV6n+A1TbT54W8UdvH08MI+
         0flA==
X-Forwarded-Encrypted: i=1; AJvYcCVetUuNHLtxBCXfAppGaHtZQBIxVNYbrW3x7qJGets10Q+zg59BQtmBif4+ZsAbJz6O+7fzVaHdsq6lrz+VLmPAI0bduICMCoLrzsEhSA==
X-Gm-Message-State: AOJu0Yza5khoJD4gFfiW2Kq2cpN+CN6kbKlmYlS7kLtqlOwDSf1njEc0
	kNoHHpwpFGlg6k7Aq3AkrxjnFRPPwdbL4fiR6+h+zqubueMWeVayG4f5yVYlC8Vj1MEI2ZajXyr
	eCx3ZYF8kS1Pq9E0cVQ3ZsfkOsdaWQRaboare
X-Google-Smtp-Source: AGHT+IF2fa/1LAfZ1yVynmIpK6UPK/U7tRzAnLsgwdvETg2psAWTivYFQMlqgasNVrQIEoKOKtlYnJthmscfBKEZuSM=
X-Received: by 2002:a17:902:ee4d:b0:1f3:49f6:a851 with SMTP id
 d9443c01a7336-1f64b655db0mr4340115ad.10.1717432254045; Mon, 03 Jun 2024
 09:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com> <20240601060941.13692-12-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240601060941.13692-12-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Jun 2024 09:30:42 -0700
Message-ID: <CAP-5=fXGPHMF+5cUu42ns0=qm9QCPg0LNUveLLnjdGHPCnVg3w@mail.gmail.com>
Subject: Re: [PATCH V3 11/14] tools/perf: Add support to use libcapstone in powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 11:10=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Now perf uses the capstone library to disassemble the instructions in
> x86. capstone is used (if available) for perf annotate to speed up.
> Currently it only supports x86 architecture. Patch includes changes to
> enable this in powerpc. For now, only for data type sort keys, this
> method is used and only binary code (raw instruction) is read. This is
> because powerpc approach to understand instructions and reg fields uses
> raw instruction. The "cs_disasm" is currently not enabled. While
> attempting to do cs_disasm, observation is that some of the instructions
> were not identified (ex: extswsli, maddld) and it had to fallback to use
> objdump. Hence enabling "cs_disasm" is added in comment section as a
> TODO for powerpc.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/disasm.c | 148 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index d8b357055302..915508d2e197 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -1540,12 +1540,18 @@ static int open_capstone_handle(struct annotate_a=
rgs *args, bool is_64bit,
>  {
>         struct annotation_options *opt =3D args->options;
>         cs_mode mode =3D is_64bit ? CS_MODE_64 : CS_MODE_32;
> +       int ret;
>
>         /* TODO: support more architectures */
> -       if (!arch__is(args->arch, "x86"))
> +       if ((!arch__is(args->arch, "x86")) && (!arch__is(args->arch, "pow=
erpc")))
>                 return -1;
>
> -       if (cs_open(CS_ARCH_X86, mode, handle) !=3D CS_ERR_OK)
> +       if (arch__is(args->arch, "x86"))
> +               ret =3D cs_open(CS_ARCH_X86, mode, handle);
> +       else
> +               ret =3D cs_open(CS_ARCH_PPC, mode, handle);
> +
> +       if (ret !=3D CS_ERR_OK)
>                 return -1;

There looks to be a pretty/more robust capstone_init function in
print_insn.c, should we factor this code out and recycle:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/print_insn.c?h=3Dperf-tools-next#n40

Thanks,
Ian

>         if (!opt->disassembler_style ||
> @@ -1635,6 +1641,139 @@ static void print_capstone_detail(cs_insn *insn, =
char *buf, size_t len,
>         }
>  }
>
> +static int symbol__disassemble_capstone_powerpc(char *filename, struct s=
ymbol *sym,
> +                                       struct annotate_args *args)
> +{
> +       struct annotation *notes =3D symbol__annotation(sym);
> +       struct map *map =3D args->ms.map;
> +       struct dso *dso =3D map__dso(map);
> +       struct nscookie nsc;
> +       u64 start =3D map__rip_2objdump(map, sym->start);
> +       u64 end =3D map__rip_2objdump(map, sym->end);
> +       u64 len =3D end - start;
> +       u64 offset;
> +       int i, fd, count;
> +       bool is_64bit =3D false;
> +       bool needs_cs_close =3D false;
> +       u8 *buf =3D NULL;
> +       struct find_file_offset_data data =3D {
> +               .ip =3D start,
> +       };
> +       csh handle;
> +       char disasm_buf[512];
> +       struct disasm_line *dl;
> +       u32 *line;
> +
> +       if (args->options->objdump_path)
> +               return -1;
> +
> +       nsinfo__mountns_enter(dso->nsinfo, &nsc);
> +       fd =3D open(filename, O_RDONLY);
> +       nsinfo__mountns_exit(&nsc);
> +       if (fd < 0)
> +               return -1;
> +
> +       if (file__read_maps(fd, /*exe=3D*/true, find_file_offset, &data,
> +                           &is_64bit) =3D=3D 0)
> +               goto err;
> +
> +       if (open_capstone_handle(args, is_64bit, &handle) < 0)
> +               goto err;
> +
> +       needs_cs_close =3D true;
> +
> +       buf =3D malloc(len);
> +       if (buf =3D=3D NULL)
> +               goto err;
> +
> +       count =3D pread(fd, buf, len, data.offset);
> +       close(fd);
> +       fd =3D -1;
> +
> +       if ((u64)count !=3D len)
> +               goto err;
> +
> +       line =3D (u32 *)buf;
> +
> +       /* add the function address and name */
> +       scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
> +                 start, sym->name);
> +
> +       args->offset =3D -1;
> +       args->line =3D disasm_buf;
> +       args->line_nr =3D 0;
> +       args->fileloc =3D NULL;
> +       args->ms.sym =3D sym;
> +
> +       dl =3D disasm_line__new(args);
> +       if (dl =3D=3D NULL)
> +               goto err;
> +
> +       annotation_line__add(&dl->al, &notes->src->source);
> +
> +       /*
> +        * TODO: enable disassm for powerpc
> +        * count =3D cs_disasm(handle, buf, len, start, len, &insn);
> +        *
> +        * For now, only binary code is saved in disassembled line
> +        * to be used in "type" and "typeoff" sort keys. Each raw code
> +        * is 32 bit instruction. So use "len/4" to get the number of
> +        * entries.
> +        */
> +       count =3D len/4;
> +
> +       for (i =3D 0, offset =3D 0; i < count; i++) {
> +               args->offset =3D offset;
> +               sprintf(args->line, "%x", line[i]);
> +
> +               dl =3D disasm_line__new(args);
> +               if (dl =3D=3D NULL)
> +                       goto err;
> +
> +               annotation_line__add(&dl->al, &notes->src->source);
> +
> +               offset +=3D 4;
> +       }
> +
> +       /* It failed in the middle */
> +       if (offset !=3D len) {
> +               struct list_head *list =3D &notes->src->source;
> +
> +               /* Discard all lines and fallback to objdump */
> +               while (!list_empty(list)) {
> +                       dl =3D list_first_entry(list, struct disasm_line,=
 al.node);
> +
> +                       list_del_init(&dl->al.node);
> +                       disasm_line__free(dl);
> +               }
> +               count =3D -1;
> +       }
> +
> +out:
> +       if (needs_cs_close)
> +               cs_close(&handle);
> +       free(buf);
> +       return count < 0 ? count : 0;
> +
> +err:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (needs_cs_close) {
> +               struct disasm_line *tmp;
> +
> +               /*
> +                * It probably failed in the middle of the above loop.
> +                * Release any resources it might add.
> +                */
> +               list_for_each_entry_safe(dl, tmp, &notes->src->source, al=
.node) {
> +                       list_del(&dl->al.node);
> +                       free(dl);
> +               }
> +       }
> +       count =3D -1;
> +       goto out;
> +}
> +
>  static int symbol__disassemble_capstone(char *filename, struct symbol *s=
ym,
>                                         struct annotate_args *args)
>  {
> @@ -1987,6 +2126,11 @@ int symbol__disassemble(struct symbol *sym, struct=
 annotate_args *args)
>                         err =3D symbol__disassemble_dso(symfs_filename, s=
ym, args);
>                         if (err =3D=3D 0)
>                                 goto out_remove_tmp;
> +#ifdef HAVE_LIBCAPSTONE_SUPPORT
> +                       err =3D symbol__disassemble_capstone_powerpc(symf=
s_filename, sym, args);
> +                       if (err =3D=3D 0)
> +                               goto out_remove_tmp;
> +#endif
>                 }
>         }
>
> --
> 2.43.0
>
