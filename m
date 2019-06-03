Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43E325AD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 02:26:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HG8B0kp1zDqNk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 10:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o7CZ/sjt"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HG6t00BFzDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 10:25:39 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id i10so2979781iol.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 17:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MExxoXadMOs/4dei2Z/lDA7bd71U6fdxY4xEu+jsw3g=;
 b=o7CZ/sjtAQyde3vaJV6o1j1xVidzz45pjhePp6n+A0ZXxt23TT8Phgnbtr3GpU6tOV
 f7i6MnNbRPY+pxSn93mjBnwRoXk23J96pSfbAlcAQZwQjfkCqXp2Edqbuk6m2nJKHT7o
 1oeS5JNi0W8drJaBh+OHiz0S29DaoVkfO6anZgxcaHd7HA0bN4xjdoQC3CyiWnf74Ooy
 Za4VY6zQLvO2hRpbeNqB3J07ecD0XKxXh7/8GDuPg9ZjlIKvqi+UZ08q/7ijU3FT7Qp4
 wYeBYEUyxNoHWHpvA0mu79tmK4eXbU+M2/X2LoRf04CdKYvsEiBMLsdrqYIxmQ6D1YvR
 MDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MExxoXadMOs/4dei2Z/lDA7bd71U6fdxY4xEu+jsw3g=;
 b=LSYOi48bwBRqa+XvQemm16xbe0ViIS5A9BY4Wi5CY94ceJo2IytjWS7S6injxAIdMT
 ONxtiFgkSZhIrreZ/gzWiHjP3aM1p1dgjO/nUvvqoxRDGABQiDhD+Uu6pQpAAriW0vaE
 yuxLp+hHXdm0Ur8IppU8H+QE0uGBngv1YU8vxPRLRrshQhlRA06V14u3vtQOQEsoc83a
 FlrywOETicBwpG+WHi/7oXk3fiTHh21JCu3IJZ7Ok/dx2J5JwE6NSbTin4878TUNyLLk
 nOFhRwOjmLhD6smMapFshV4I/H52cYlPBrN/Eclb02VGxUi28t3eNecOFD+IMonCZfBt
 eghQ==
X-Gm-Message-State: APjAAAUOHqXO/IfCEfoLuBIynEgXsHMEKMdPPOmJFph4NcfI3u/jkY+S
 3f/feJUTVonQoSq8w2drJSt4ZA81Q+qoqRAGVVY=
X-Google-Smtp-Source: APXvYqyCeUiE6u/jO+gJroKyuBmhsP3Fy9YTtKedxAmY3Uyuem4WhlCLQdLI96UPt7/CBmIGP/ZViQi0dIvYvZejS+k=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr424688iop.293.1559521536432; 
 Sun, 02 Jun 2019 17:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
From: Oliver <oohall@gmail.com>
Date: Mon, 3 Jun 2019 10:25:25 +1000
Message-ID: <CAOSf1CEsWiDyc3rAzNoPwBUUhs4deXt_1MJpuKUV_CP-LJhjhw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/nvdimm: Add support for multibyte read/write for
 metadata
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 2, 2019 at 2:44 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> SCM_READ/WRITE_MEATADATA hcall supports multibyte read/write. This patch
> updates the metadata read/write to use 1, 2, 4 or 8 byte read/write as
> mentioned in PAPR document.
>
> READ/WRITE_METADATA hcall supports the 1, 2, 4, or 8 bytes read/write.
> For other values hcall results H_P3.

You should probably fold the second paragraph here into the first.

> Hypervisor stores the metadata contents in big-endian format and in-order
> to enable read/write in different granularity, we need to switch the contents
> to big-endian before calling HCALL.
>
> Based on an patch from Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 104 +++++++++++++++++-----
>  1 file changed, 82 insertions(+), 22 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0176ce66673f..e33cebb8ee6c 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -97,42 +97,102 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>  }
>
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
> -                       struct nd_cmd_get_config_data_hdr *hdr)
> +                            struct nd_cmd_get_config_data_hdr *hdr)
>  {
>         unsigned long data[PLPAR_HCALL_BUFSIZE];
> +       unsigned long offset, data_offset;
> +       int len, read;
>         int64_t ret;
>
> -       if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
> +       if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>                 return -EINVAL;
>
> -       ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
> -                       hdr->in_offset, 1);
> -
> -       if (ret == H_PARAMETER) /* bad DRC index */
> -               return -ENODEV;
> -       if (ret)
> -               return -EINVAL; /* other invalid parameter */
> -
> -       hdr->out_buf[0] = data[0] & 0xff;
> -
> +       for (len = hdr->in_length; len; len -= read) {
> +
> +               data_offset = hdr->in_length - len;
> +               offset = hdr->in_offset + data_offset;
> +
> +               if (len >= 8)
> +                       read = 8;
> +               else if (len >= 4)
> +                       read = 4;
> +               else if ( len >= 2)
> +                       read = 2;
> +               else
> +                       read = 1;
> +
> +               ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
> +                                 offset, read);
> +
> +               if (ret == H_PARAMETER) /* bad DRC index */
> +                       return -ENODEV;
> +               if (ret)
> +                       return -EINVAL; /* other invalid parameter */
> +
> +               switch (read) {
> +               case 8:
> +                       *(uint64_t *)(hdr->out_buf + data_offset) = be64_to_cpu(data[0]);
> +                       break;
> +               case 4:
> +                       *(uint32_t *)(hdr->out_buf + data_offset) = be32_to_cpu(data[0] & 0xffffffff);
> +                       break;
> +
> +               case 2:
> +                       *(uint16_t *)(hdr->out_buf + data_offset) = be16_to_cpu(data[0] & 0xffff);
> +                       break;
> +
> +               case 1:
> +                       *(uint32_t *)(hdr->out_buf + data_offset) = (data[0] & 0xff);
> +                       break;
> +               }
> +       }
>         return 0;
>  }
>
>  static int papr_scm_meta_set(struct papr_scm_priv *p,
> -                       struct nd_cmd_set_config_hdr *hdr)
> +                            struct nd_cmd_set_config_hdr *hdr)
>  {
> +       unsigned long offset, data_offset;
> +       int len, wrote;
> +       unsigned long data;
> +       __be64 data_be;
>         int64_t ret;
>
> -       if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
> +       if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>                 return -EINVAL;
>
> -       ret = plpar_hcall_norets(H_SCM_WRITE_METADATA,
> -                       p->drc_index, hdr->in_offset, hdr->in_buf[0], 1);
> -
> -       if (ret == H_PARAMETER) /* bad DRC index */
> -               return -ENODEV;
> -       if (ret)
> -               return -EINVAL; /* other invalid parameter */
> +       for (len = hdr->in_length; len; len -= wrote) {
> +
> +               data_offset = hdr->in_length - len;
> +               offset = hdr->in_offset + data_offset;
> +
> +               if (len >= 8) {
> +                       data = *(uint64_t *)(hdr->in_buf + data_offset);
> +                       data_be = cpu_to_be64(data);
> +                       wrote = 8;
> +               } else if (len >= 4) {
> +                       data = *(uint32_t *)(hdr->in_buf + data_offset);
> +                       data &= 0xffffffff;
> +                       data_be = cpu_to_be32(data);
> +                       wrote = 4;
> +               } else if (len >= 2) {
> +                       data = *(uint16_t *)(hdr->in_buf + data_offset);
> +                       data &= 0xffff;
> +                       data_be = cpu_to_be16(data);
> +                       wrote = 2;
> +               } else {
> +                       data_be = *(uint8_t *)(hdr->in_buf + data_offset);
> +                       data_be &= 0xff;
> +                       wrote = 1;
> +               }
> +
> +               ret = plpar_hcall_norets(H_SCM_WRITE_METADATA, p->drc_index,
> +                                        offset, data_be, wrote);
> +               if (ret == H_PARAMETER) /* bad DRC index */
> +                       return -ENODEV;
> +               if (ret)
> +                       return -EINVAL; /* other invalid parameter */
> +       }
>
>         return 0;
>  }
> @@ -154,7 +214,7 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>                 get_size_hdr = buf;
>
>                 get_size_hdr->status = 0;
> -               get_size_hdr->max_xfer = 1;
> +               get_size_hdr->max_xfer = 8;
>                 get_size_hdr->config_size = p->metadata_size;
>                 *cmd_rc = 0;
>                 break;
> --
> 2.21.0

I assume you got the qemu bits sorted out with Shiva? Looks good otherwise.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
