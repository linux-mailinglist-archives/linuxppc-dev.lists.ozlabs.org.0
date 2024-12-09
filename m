Return-Path: <linuxppc-dev+bounces-3876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A69E9D3E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 18:44:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6TkM5QV9z2yNt;
	Tue, 10 Dec 2024 04:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733766235;
	cv=none; b=esruv1rUhWGmBrHxprvrCPmZw5DLPJkhXu2tMVwnZUxhJbWfdjx14oOnsCQN+8M+7BC8dck1dJyysB0/NONAbHd+VBdkDyutwm+11erZtDv/5d2Q2nJOrwa2A7tanXwF+sBTQrjdnRYGvxWncaOU2i2OlOqjptCYJyPVtMlDxvtAO2BnfDTB0ydsPjb7mm5CA/v/JK+UK6TKdCQHCQjS8ZOR504HSMoNlGHQ1+/N26JmcLZ6is/CCvJb74mWXjAr4Dm490rfmlDVjjjz094rWY/hiq0HPZOvRwnpNEGgsiWtT9nDWu2DDMMHEuzK7uwJ5mNOfS71/kSwpz1JxYgrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733766235; c=relaxed/relaxed;
	bh=d8t4rQo4GlIJNr1Ck0WNYMLnLZ4WaSFJXClmAi03iA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cq+DdLp3uy+OAy5WR+tCZI1HACylsV1tMuJ9h6HCqLwjy2JPU3AGG1dd9PN8GJniatO1Dr09YyivV+PnxcxNk/VYQg3FavrYC3Bue3lqyyOtegar/py4zn/aFuxd1ty5pzqQHF68BGJvur45S136FFxsYT11QEzTVgzQ8JtIG5De0FuTdUGTIkQnf49QbySIeBfXel4jyYs8tvJcTLMuGUSC11TDc5LwsRhios3jhel1E+6iaaNWipHU+2k5rP3NS0Mw/VuquNGKDJfz4Dm9hShZbFx/mtAk67RQx8OrFC9RGCRkJUgJ75iiv2h73dlH4OWbRUpf8gov9lgfZMEOLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T5POOHB5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T5POOHB5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6TkL3Jwkz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 04:43:52 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2167141dfa1so28455ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 09:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733766228; x=1734371028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8t4rQo4GlIJNr1Ck0WNYMLnLZ4WaSFJXClmAi03iA4=;
        b=T5POOHB5lVkhJ/yLfZvN4CEFOCQ4STIwxzdy41wN19n1RUgFq0vUuVJYcbxkBT4EiG
         X5dz7Js//dMHL4LwOTgSpIU1x6nVV2Jsb3mrQf4PoXHyTFG2rndhWNYSxFfKavDSJs3S
         oo+6eozq6CrQUQYiaHbnQszL9N1AZRFR51X5/WO2oPzmleWahMT1Bx13iGtp8p6J5Kl+
         noVGOZYSkVHftFyg7McZtedneZ+B1vW2c9a3LJEjJxvwYqG6pEFD8OZ27nXbVXipR2Pl
         gEEQmNHiPiFlzKxFD40lgAZUKxo1KMAd/e3UYk9kNVneWJ8sEXFSiEc7SvJS4ZhCe1fx
         YDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766228; x=1734371028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8t4rQo4GlIJNr1Ck0WNYMLnLZ4WaSFJXClmAi03iA4=;
        b=A2knB0TF06dNzXDirTRvtzn+0orPdm8FCh6AnYOBoNB2yYvdacxfLoCsGqQGp2uzdv
         QtTyXKA1TMtALXwkRKRDP9Z+nHZGz+NSzpDpbrCaFb7FO3qpcyrjWzwSQzG3kVpVslnm
         Q+2Mg2A8jcZ5kKllxRe3aFhFfdOMw60KCI1dlYdO7ZbhPubU8kq9wcRlB6sQDlSJbkJ6
         KRpgJJKxFnt3RCQbMon2DFtC3oiNWRZ5329EO/YJcZ3EnZqpn3VfV2U11QJJ8zzWDjwt
         thlbix5q4yNwPm/4hVXQiCdjkIbLeIqVX5ysLbyJ6wc+hpJodkZU4jSKtt04MG76gpo1
         URuw==
X-Forwarded-Encrypted: i=1; AJvYcCULth6ukhH7m2qjS+0Pa48zwD/JRQyokhhbz9XuSkJko56QvMFJhUr059cBsxowzpSuxso+nBOcgRQOHP8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+ejPreEASj4mO18mWCpwGQ3UMqNzPJrR7LSMaih99bzQ0JqIQ
	LBrZ6ttOFnzVc2HzVGnhadeJLoZF3PeeLHFffmB8+i/x0svkKSONBVaLQCjl/tTIkN9x+42DozJ
	LN+I3ITOLcrN59Luwn35wUuaQWvE=
X-Gm-Gg: ASbGncvFJOeKm3VQAqji/OqyQqvAUlhICcKvjAUkSg1zUFs3Lja7UtPwfyvKNztElrq
	Fq5pVg2BoIhGFIr3NobsHtjTB3yAuSSYexRi07JuaFi4OO78=
X-Google-Smtp-Source: AGHT+IF0BTr20MkxNzRSFNpph/h8vHNhmBKsOAPeY6Y0QdSHKlV0GxM2a08SVsbCGBad04gFH5w/DXOJoS3+X7u/Wjg=
X-Received: by 2002:a17:902:f541:b0:216:4676:dfb5 with SMTP id
 d9443c01a7336-21670a3f62cmr3456875ad.21.1733766228322; Mon, 09 Dec 2024
 09:43:48 -0800 (PST)
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
 <20241205-sysfs-const-bin_attr-simple-v1-3-4a4e4ced71e3@weissschuh.net>
In-Reply-To: <20241205-sysfs-const-bin_attr-simple-v1-3-4a4e4ced71e3@weissschuh.net>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 9 Dec 2024 09:43:36 -0800
Message-ID: <CAEf4BzYtD-njaaSr8zHK3ay0hzWFHamJ+DEqoXOcjM9LDdY4Zw@mail.gmail.com>
Subject: Re: [PATCH 3/4] btf: Switch vmlinux BTF attribute to sysfs_bin_attr_simple_read()
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
>
> ---
> This is a replacement for [0], as Alexei was not happy about BIN_ATTR_SIM=
PLE_RO()
>
> [0] https://lore.kernel.org/lkml/20241122-sysfs-const-bin_attr-bpf-v1-1-8=
23aea399b53@weissschuh.net/
> ---
>  kernel/bpf/sysfs_btf.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
> index fedb54c94cdb830a4890d33677dcc5a6e236c13f..81d6cf90584a7157929c50f62=
a5c6862e7a3d081 100644
> --- a/kernel/bpf/sysfs_btf.c
> +++ b/kernel/bpf/sysfs_btf.c
> @@ -12,24 +12,16 @@
>  extern char __start_BTF[];
>  extern char __stop_BTF[];
>
> -static ssize_t
> -btf_vmlinux_read(struct file *file, struct kobject *kobj,
> -                struct bin_attribute *bin_attr,
> -                char *buf, loff_t off, size_t len)
> -{
> -       memcpy(buf, __start_BTF + off, len);
> -       return len;
> -}
> -
>  static struct bin_attribute bin_attr_btf_vmlinux __ro_after_init =3D {
>         .attr =3D { .name =3D "vmlinux", .mode =3D 0444, },
> -       .read =3D btf_vmlinux_read,
> +       .read_new =3D sysfs_bin_attr_simple_read,
>  };
>
>  struct kobject *btf_kobj;
>
>  static int __init btf_vmlinux_init(void)
>  {
> +       bin_attr_btf_vmlinux.private =3D __start_BTF;
>         bin_attr_btf_vmlinux.size =3D __stop_BTF - __start_BTF;
>
>         if (bin_attr_btf_vmlinux.size =3D=3D 0)
>
> --
> 2.47.1
>

