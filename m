Return-Path: <linuxppc-dev+bounces-3877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E59E9D52
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 18:45:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6TmV4bKbz2yXf;
	Tue, 10 Dec 2024 04:45:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733766346;
	cv=none; b=YaWuHsLqU/Us2gai2N9Encv2AjplmQM9dDVuO5kTT9bbnFQ88SBmxi67z9ZcezkFbvKOuFf3Asqk0PyKC3xgX7vzEFoiQHFlneq4T0Ba2BxC2Lo1oNX176HJa4ENvkDSFp1WYSMl87jfzGiLsSaAGQegJGfVADxZdSccKLcfVh+Tb8Gay3q3KXd/J+nGBjxT3h+muaTeBsR6mp3AofjjPK9YpH1ynekZ8C7mbh5/B5hSeMXDWu0C3D3j//jb8LwL9Cqmmi4CoJs0vK+L8167ZiowzY2IyrHMGthsIsB/LXi/R6+iTYiOVQcHuD0X6kYtSHHSOaRD+NbisCLBm1gAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733766346; c=relaxed/relaxed;
	bh=hLL+hTR2erfFMDNeV90V786XCRfTp97LfoiOqBvZZGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAjsX4SSMCbDtr3ylWpCEIAFLlkqcjWGbNEP2AQpMN+VBaI6Xe/kla1NxZnLd55s3E9QN9D8UIgKWwHwWrMQXEP+WSxjzporMVsydKX6jSQUoiiDYWTBNB7T7Ee2ok4qghFvGJNwpeSFQYEYO2jnV6WyRjGwSQIW92KK05GvC9vlk6OutmC+wPUeAkhmPk2qioWPMJimRve0h56LkG56FkOljeAHANVGfr6tNxvu99epdBFiEDAN/OHwSPUMaQ9UPshK6UnfljzUFYpg42jtT3R/uNhRVm3m5A21vbxjgmnwPU3VFti85BrW5pvhpSATYiGVd7eQczuq4cn6qslHtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A23AUwkP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A23AUwkP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6TmP1lGnz2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 04:45:41 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725ef0397aeso1058717b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 09:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733766338; x=1734371138; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLL+hTR2erfFMDNeV90V786XCRfTp97LfoiOqBvZZGc=;
        b=A23AUwkPp1nSwlQWR+TObCEFuyANyx29Uhrkx6XLR0L4pCglFAWLIwBS/P/xVLJSlf
         g357N7hqZ0xFQSh4yqvGri6EWUCptZ/vYjyZcG2WZdXUt3JKaGuBVRLBW073BXFsTA4N
         1uXoOgNeJ0Zkr3/UKkroHBIMy5ZfJ6870XmPE311bbinZUrO227bCwAfHR4tU/ugl0lM
         oE3B/8CBGgOsLxbB+eoMkujb2+9pWHT8xdh28rfDqvRjLJDW5Z7MUTjXLUJPryo8rJys
         4oD5XYT4wOYO/moTTkMtKKALu7dbL4Tb6Kgdi0Gf/VsvdUlazStNwRX6l5AnFardmBCE
         kxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766338; x=1734371138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLL+hTR2erfFMDNeV90V786XCRfTp97LfoiOqBvZZGc=;
        b=SI/gvvG+pJncdS8KTuVHjzbjC4W64IYzmur8vMbTeqDHQgOMD6BiDukUwIB7aTJe6O
         nmJacZVSnUwR2vnoKKgsnbxwHD/4qA7n/XBe/VCudSSu/wr4vuZkUteCNiRzOQ50t9sj
         QP8b9eu1zoNBQ6mW62YTTv/dqxR8j9xIhovYEULh562NPVi8sUdNyAYJoa2p1OXpJ2AB
         v3QJI1Z7V1QFWWWCnsQIjChcjQeSxE55Imq2/WJJkx1rFl22/XXxg4lTPur31f0DmNnA
         tqAN3wX2Iz/e1XvC7bbvAApIaPoY1W7CiIe2+PqTv2hcBe46ZjrlUKRjo2lxHJV8Z228
         UMUA==
X-Forwarded-Encrypted: i=1; AJvYcCUsGG06ky9qAMc9GpPnx+ih3JQtAs/TI6/eAiDhwhGB4THFwxi7H/tSYTWkt8rkQ6G717zU4IlMw0fg6is=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWJksey3YBcdqjXF8OoqaeSTUy30GpOKp6x5MJdxBWMhj/rGmD
	G6d3iq39sOvZVCKVudLq/FzYeHGWTIGkwvD3jCWFk/++NYRHwxO8xGipTm6Gy1QSWpXIfpccKwz
	Lk8RN9kDcxcnp5v65UzAgFeJLP2I=
X-Gm-Gg: ASbGncsPaUH2SMK0Gg4UHBTEpcgdEnTUT1Ruvs8EeZUwdUyjbwOomlZSQmkKBnBtbdG
	h2BhtcWqaGI82oAiI1fClP1a5jOu2Y9tMbMBqfm6e+aKtVnBvZR4=
X-Google-Smtp-Source: AGHT+IF6C1kyOIzspL8FJ6lY6T2B7S0Ong/QRjtBPIeAUZMab/0JVUfow4OcO3JdX8i8lSSqgjFzDc6Dn626X5R/OrY=
X-Received: by 2002:a05:6a20:9f9b:b0:1e0:d1db:4d8a with SMTP id
 adf61e73a8af0-1e1870bd5e1mr20198567637.10.1733766338437; Mon, 09 Dec 2024
 09:45:38 -0800 (PST)
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
References: <20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net>
 <20241205-sysfs-const-bin_attr-simple-v1-4-4a4e4ced71e3@weissschuh.net>
In-Reply-To: <20241205-sysfs-const-bin_attr-simple-v1-4-4a4e4ced71e3@weissschuh.net>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 9 Dec 2024 09:45:26 -0800
Message-ID: <CAEf4BzasK+pV69CMcy-pMk1cMf+LhKnXKPm8q6s7gioXnebRNQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] btf: Switch module BTF attribute to sysfs_bin_attr_simple_read()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 5, 2024 at 9:35=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> The generic function from the sysfs core can replace the custom one.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  kernel/bpf/btf.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index e7a59e6462a9331d0acb17a88a4ebf641509c050..69caa86ae6085dce17e95107c=
4497d2d8cf81544 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7870,17 +7870,6 @@ struct btf_module {
>  static LIST_HEAD(btf_modules);
>  static DEFINE_MUTEX(btf_module_mutex);
>
> -static ssize_t
> -btf_module_read(struct file *file, struct kobject *kobj,
> -               struct bin_attribute *bin_attr,
> -               char *buf, loff_t off, size_t len)
> -{
> -       const struct btf *btf =3D bin_attr->private;
> -
> -       memcpy(buf, btf->data + off, len);
> -       return len;
> -}
> -
>  static void purge_cand_cache(struct btf *btf);
>
>  static int btf_module_notify(struct notifier_block *nb, unsigned long op=
,
> @@ -7941,8 +7930,8 @@ static int btf_module_notify(struct notifier_block =
*nb, unsigned long op,
>                         attr->attr.name =3D btf->name;
>                         attr->attr.mode =3D 0444;
>                         attr->size =3D btf->data_size;
> -                       attr->private =3D btf;
> -                       attr->read =3D btf_module_read;
> +                       attr->private =3D btf->data;
> +                       attr->read_new =3D sysfs_bin_attr_simple_read;
>
>                         err =3D sysfs_create_bin_file(btf_kobj, attr);
>                         if (err) {
>
> --
> 2.47.1
>

