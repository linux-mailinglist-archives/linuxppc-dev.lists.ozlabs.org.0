Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58F7B5FE3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 06:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S04bD2nSZz3vbD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 15:29:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.176; helo=mail-pg1-f176.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S04Zj5kpSz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 15:28:44 +1100 (AEDT)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-577fb90bb76so237437a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Oct 2023 21:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696307322; x=1696912122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui5vQUghw0mUmrDD+JeX4I/UKJ+qz0BegH6zc5Qe3i4=;
        b=krMDYumvYwwz2PeKh/449n6XZLV4xzQSgyUW+kMODH7tIrKmScNLkSvPohDd/X019T
         tj9arjg8ObDMcB+bQlgoUKWVhl3jW4WKHhh9L7QsqaonOIK6X+b1M1CUQ6kNSIyUdAdQ
         /5TIlrBQNENUSLGXcPNCBfy3Cx/Fpuykz9zKQzHgozZd1anKDl9Oi/I3oOlu0ZdmnSGh
         cfVJRIcKpk1yAcxd1XVxlC4+gbLuR8XfKzpkJLJ3640R5PNmcIeZUIRpg1LMxOfeBoez
         wZD2FuRujOMWUl3bUKmqzpTQDugm02btMN1Y3p8o/nFNKAYpz9US+2Y6SprST62X4nqz
         ni6A==
X-Gm-Message-State: AOJu0YwsRmCvt/zXDKV235H6H1mkHWE8D5CYrsNCZalovPSS83vBsdOt
	0u/F8Z0ALJPBVGvZz4pZ50T0B4dLXMnH11PNq98=
X-Google-Smtp-Source: AGHT+IGAYn6urh4QQpEb1WP35HB4W0615OWmzQRgcXzZodqLzIRl8jDxQ089v8BXwy2w3l14Af6R0W0fKNMmKkKUGXQ=
X-Received: by 2002:a17:90a:e503:b0:26b:56fa:87d3 with SMTP id
 t3-20020a17090ae50300b0026b56fa87d3mr11514638pjy.31.1696307322223; Mon, 02
 Oct 2023 21:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230928075213.84392-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230928075213.84392-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 2 Oct 2023 21:28:30 -0700
Message-ID: <CAM9d7cj0iLdrV6EYmo_oC9M_32fuRVv_geBPz4GJv41jZR5WNQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] tools/perf: Add text_end to "struct dso" to save
 .text section size
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
Cc: irogers@google.com, maddy@linux.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Sep 28, 2023 at 12:52=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Update "struct dso" to include new member "text_end".
> This new field will represent the offset for end of text
> section for a dso. For elf, this value is derived as:
> sh_size (Size of section in byes) + sh_offset (Section file
> offst) of the elf header for text.
>
> For bfd, this value is derived as:
> 1. For PE file,
> section->size + ( section->vma - dso->text_offset)
> 2. Other cases:
> section->filepos (file position) + section->size (size of
> section)
>
> To resolve the address from a sample, perf looks at the
> DSO maps. In case of address from a kernel module, there
> were some address found to be not resolved. This was
> observed while running perf test for "Object code reading".
> Though the ip falls beteen the start address of the loaded
> module (perf map->start ) and end address ( perf map->end),
> it was unresolved.
>
> Example:
>
>     Reading object code for memory address: 0xc008000007f0142c
>     File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     On file address is: 0x1114cc
>     Objdump command is: objdump -z -d --start-address=3D0x11142c --stop-a=
ddress=3D0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     objdump read too few bytes: 128
>     test child finished with -1
>
> Here, module is loaded at:
>     # cat /proc/modules | grep xfs
>     xfs 2228224 3 - Live 0xc008000007d00000
>
> From objdump for xfs module, text section is:
>     text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
>
> Here the offset for 0xc008000007f0142c ie  0x112074 falls out
> .text section which is up to 0x10f7bc.
>
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
>
> To identify such  address, which falls out of text
> section and within module end, added the new field "text_end" to
> "struct dso".
>
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

For the series,
Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung


> ---
> Changelog:
> v2 -> v3:
>  Added Reviewed-by from Adrian
>
>  v1 -> v2:
>  Added text_end for bfd also by updating dso__load_bfd_symbols
>  as suggested by Adrian.
>
>  tools/perf/util/dso.h        | 1 +
>  tools/perf/util/symbol-elf.c | 4 +++-
>  tools/perf/util/symbol.c     | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index b41c9782c754..70fe0fe69bef 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -181,6 +181,7 @@ struct dso {
>         u8               rel;
>         struct build_id  bid;
>         u64              text_offset;
> +       u64              text_end;
>         const char       *short_name;
>         const char       *long_name;
>         u16              long_name_len;
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index 95e99c332d7e..9e7eeaf616b8 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -1514,8 +1514,10 @@ dso__load_sym_internal(struct dso *dso, struct map=
 *map, struct symsrc *syms_ss,
>         }
>
>         if (elf_section_by_name(runtime_ss->elf, &runtime_ss->ehdr, &tshd=
r,
> -                               ".text", NULL))
> +                               ".text", NULL)) {
>                 dso->text_offset =3D tshdr.sh_addr - tshdr.sh_offset;
> +               dso->text_end =3D tshdr.sh_offset + tshdr.sh_size;
> +       }
>
>         if (runtime_ss->opdsec)
>                 opddata =3D elf_rawdata(runtime_ss->opdsec, NULL);
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 3f36675b7c8f..f25e4e62cf25 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -1733,8 +1733,10 @@ int dso__load_bfd_symbols(struct dso *dso, const c=
har *debugfile)
>                         /* PE symbols can only have 4 bytes, so use .text=
 high bits */
>                         dso->text_offset =3D section->vma - (u32)section-=
>vma;
>                         dso->text_offset +=3D (u32)bfd_asymbol_value(symb=
ols[i]);
> +                       dso->text_end =3D (section->vma - dso->text_offse=
t) + section->size;
>                 } else {
>                         dso->text_offset =3D section->vma - section->file=
pos;
> +                       dso->text_end =3D section->filepos + section->siz=
e;
>                 }
>         }
>
> --
> 2.31.1
>
