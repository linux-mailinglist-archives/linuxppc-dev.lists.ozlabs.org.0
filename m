Return-Path: <linuxppc-dev+bounces-10746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F62B1DF4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 00:22:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byhV22cbGz2xQ4;
	Fri,  8 Aug 2025 08:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754605322;
	cv=none; b=Q4ME6UvaiLoEvnDH+QX7wGIAJ9tYYt4ed9gjSMIonb9+u7oqm/ueqqZ487kb3uVrv/vM3hFlkjZZqC66KJzrIWvG0QKRSLn5OQezoIobLH0SBJcnk79ocxdEZHJ/x2VYbA43JMfkH3NNx5E8D09J33i6HOPt5nd84CucmmTXiusv8DyFR0bmZjbupJYr90ygPP0d80jABt5aC7BXH1bGBiJzNLdwcQn4vHL7KcYSnYEeOLQAvpJt8N94HXHr11/Bs2A/aBOV7iJ1pkrGU8YODsjx76Fc23++wZDYMGV95r+x+UW8BEDgFEpRRD/KbOYO2AppZK4dPoO/ACuaXMVq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754605322; c=relaxed/relaxed;
	bh=r+v1685pW9f8pk9h8mH3lG3VKN/7ObemHtRwYuDpHZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbWZG9p3fVa5NP/DULPWkN2ct5uVLTKhG5TVHtXpB1O/QIdFD0xZ7W39b937dziJlNXCMmiL+kUgRDeWhE4LVlgZe0+xcpJtMFk2/U/0PyCsPcj8gjS/KZwctcoX6x0Q8nkOX8v/DIAAau4aVNirYY9WpnAxTlHkdit2jfssI5PMNZCTWzMF7xn4umWJseEcJL+dQKTnXeYDETJ7m3sfoTx7tWvRV8NkfL9aN8Ilzuk7dNVC1KiaWb3teMuYOCLo99CyBU+98bYMqDtlsqwW2LIhk2rOLOJGsz3eZpbGHXz0pvaNU9cgjopJYeKSTbOL6XAc0yshxVmeGOxOhQduUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J3LNqbPY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J3LNqbPY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byhV04h06z2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 08:21:59 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b7886bee77so1179678f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Aug 2025 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754605315; x=1755210115; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+v1685pW9f8pk9h8mH3lG3VKN/7ObemHtRwYuDpHZk=;
        b=J3LNqbPY9jPuNBiw8b0Ur0xkHqSKZmj0a7fFeoMDrBfB4TTIIx7VLJv5utRgpBHlhx
         AaSmPfu7McyaRlLQj1BSpGAnV4FH74Km/1lcdVnclRqAJg2vVsSlSw1FH5f6nJlZ7Ato
         H93YFZ4vqOMvbeUlOt0VNiHmFrUPKbvq/LcH0bRRDGmBAM9eHzUEZ0b094V/Mm0ChAnB
         J74OPoDRkUUQW6OXXb4RST0H+0xHmkm79Sxrh0ZpJdIDuaLDRkvU6lDydfb/BGtv1aR3
         PNzs9vtsX6YDt3Qza9aA+o10G9zq9XJnW+hUYjo8RGzaTNB15gxISR/qvIRVGmmF+5vv
         LDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754605315; x=1755210115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+v1685pW9f8pk9h8mH3lG3VKN/7ObemHtRwYuDpHZk=;
        b=ndxVU2PdYBjLVtoketk5WBAk5yLV0xQmzhExISVkhDdR8di6nNsu8YgTyNyRUGZuRL
         gY0Zg2Ywvpmi4DpLCiIqpNHY+o8wmJMiVjPxLK/Vwfg+GbQGAfpzBnGXtsx5Hn683MXg
         4pxXp75f/T88m94HhEWyNaFpRi2uCvmbYhSylSmTWpuRLzRmNwJiLYu7HOqpO1jSyObE
         EjwmrqKXIw/PgnfRi34epufxebYrNSsM1cu3wHn0xdioqU6lxhu+Y3yPC6JaPIXR6MNh
         DRnKjak4zZ/N8a83bh8NRcExJmzxNp3XPK/WtzYVx9J56YbRoMIoo5EeU+wpP2D+I5R4
         qeDA==
X-Forwarded-Encrypted: i=1; AJvYcCXBx+UadJSB0YU/PdLXaCGZobHAB9iEWQplVvJYYjHwTY4ZlWsy+T3Is/PSwTRkuGmYx+HwXc6YBrapcYk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YytURplIf+M488uOSuR3ql+BHm3vMlRGIkaZBHQ7EAEGYNA8m2c
	POHFHiJeMbyt1OWFGvDcWa7EQjjYCikPfLGLGfKyym/VJK+wmWpvNMJHJ23X24HheaAYjwyEdpz
	beNUn7MqOv5RueEeSUDzA3XsUgj2bG74=
X-Gm-Gg: ASbGncsMKRwY7hijyMbwkwClp82WFoY3uj03uw9Sk0XZonzxo6KAlqDygVoU8X/V56w
	IFvo2ctItpPDFt7h2bzTUWQQ87J0jK3g3MKBrAJ95jjcUjYYmiEWetzHpqLvyP0xRSMPEB/CjVJ
	2pEWuxblhvwHCOHax7EdHP9PiLUvHYjfaa+sqbjS5ldlObtLgU/M6+CJA+NWbaNSjaE4KsrnC7u
	9ewGIK0szdcTVfBU0Jo5l8sRr0lzGHLi1PR
X-Google-Smtp-Source: AGHT+IEUMHq7iW9MQ3cUOdQooyT7Txw/L00E2hEjDh9Gsvi8bdp6Bx2NyxY2bVc2+H/vdUoj0T9e6lrqJ8yqH6vT9m4=
X-Received: by 2002:a05:6000:1785:b0:3b8:d16a:a4a5 with SMTP id
 ffacd0b85a97d-3b900905a8amr671383f8f.0.1754605314929; Thu, 07 Aug 2025
 15:21:54 -0700 (PDT)
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
References: <20250805062747.3479221-1-skb99@linux.ibm.com> <20250805062747.3479221-7-skb99@linux.ibm.com>
In-Reply-To: <20250805062747.3479221-7-skb99@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 7 Aug 2025 15:21:42 -0700
X-Gm-Features: Ac12FXz4ijaJwj8PQscV-ujyMkfM3WbQzkOj7RycHgVLmD9z3oTypfADROiDZ3s
Message-ID: <CAADnVQ+BoEMQ3i01YpzdNPAaL_mdNogkvHp0Ef73TBG8w726Zw@mail.gmail.com>
Subject: Re: [bpf-next 6/6] selftests/bpf: Fix arena_spin_lock selftest failure
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: bpf <bpf@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, sachinpb@linux.ibm.com, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Mykola Lysenko <mykolal@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 4, 2025 at 11:29=E2=80=AFPM Saket Kumar Bhaskar <skb99@linux.ib=
m.com> wrote:
>
> @@ -60,9 +65,16 @@ static void test_arena_spin_lock_size(int size)
>                 return;
>         }
>
> -       skel =3D arena_spin_lock__open_and_load();
> -       if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open_and_load"))
> +       skel =3D arena_spin_lock__open();
> +       if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open"))
>                 return;
> +
> +       skel->rodata->nr_cpus =3D get_nprocs();

...

> --- a/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
> +++ b/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
> @@ -20,8 +20,6 @@
>  #define __arena __attribute__((address_space(1)))
>  #endif
>
> -extern unsigned long CONFIG_NR_CPUS __kconfig;
> -
>  /*
>   * Typically, we'd just rely on the definition in vmlinux.h for qspinloc=
k, but
>   * PowerPC overrides the definition to define lock->val as u32 instead o=
f
> @@ -494,7 +492,7 @@ static __always_inline int arena_spin_lock(arena_spin=
lock_t __arena *lock)
>  {
>         int val =3D 0;
>
> -       if (CONFIG_NR_CPUS > 1024)
> +       if (nr_cpus > 1024)
>                 return -EOPNOTSUPP;

We cannot do this. It will make arena_spin_lock much harder to use.
BPF CI doesn't run on powerpc anyway, but you can document that this
test is disable by creating selftests/bpf/DENYLIST.powerpc.

