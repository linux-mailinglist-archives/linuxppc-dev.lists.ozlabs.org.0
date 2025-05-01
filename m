Return-Path: <linuxppc-dev+bounces-8230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5676FAA65D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 23:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpSWh1K0wz2yYf;
	Fri,  2 May 2025 07:54:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::541"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746118619;
	cv=none; b=eWYaBABQcxTLJPI0S6zlrESNoi2OZkWK5cuU/qkk/o+ZgWD0TcyvKcrSg9QNrO7zywmmfY8VXzg8v5hXof2hsVem2iZjXXti/NQVo0pF0FZqebR1qsRUOPaPcuzuzSLOixnTqm7ggQQQUXu9W82hEhBlQO2u5GoJLZhLvAuBtj8TV39+1ACDeKTZWMWji0hSVezjLWGFEaPqcaHsuajs0+PJ8MA5PmYDBYAVY3XxntZg5l8385TBK6a79zugUEVbhTKIQOtvWnXSoeHqg0gEiSzU3nJ3YONOK21agsYCjzOrH2zAX4GfLljivuw4qc6L4/f3m79/A25nKoTz1AEKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746118619; c=relaxed/relaxed;
	bh=pjITccKn52YoXHvMNHp0xjqzTUP9bb6Gv+c2QtvOV0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRJzmG3ySvKcsot8oiGdSTPIAQjD7up25XyG2V2Yx+hg385uwJtZAY8OgeJm5LpVPS7OI0RgxYAW6ZZrmKzolBTg62G6nQuPnCu3rI7GiP4D/Ry0daAOAF9O+odmO6LwSU3eNEjZnl5CSgtFAUozF2Z0/IzqFYVeJ+6CKJCwdKHqfT+T+t8OQJME9V49J/eTnWcmIgi4aWKChcXwP0FNuoMP1xwufHUKyyY/6PNLztQ0iZpJjukuXahTvwCHOM7dmq7Q3rL2Vpizwlg7o4GWq/hKTnKtYc448jIiqKWuJiQbfDtWIh59jI21M3/4sQ4uEGej4+uiC+A00hZzZakFuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KxeFCj8u; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KxeFCj8u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpKw96tHpz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 02:56:56 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so2083990a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746118611; x=1746723411; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjITccKn52YoXHvMNHp0xjqzTUP9bb6Gv+c2QtvOV0Q=;
        b=KxeFCj8uiNPwyHb89oc32hs/oehI2WjwfjlWJckDpAZlrJOEpwF6TA13UDqNpsNId8
         9L53ZqidjhetXlW2QcqWswjH6pkuvA3KcE6DqMby9uKZ4VYHG8E5/s5OvudaVjZ9VHJY
         jdm0NTh++fwkqdLmqFo1w6QUR88Bsj/QqHcNSCrn3V0aelFSwEgVscetx8XNaLzlH1hk
         BDQKdGGRdZdpnBTeq9ICOhu6V0fk+7c7FcWEKa8xr3X0d/TBPErd76YufYsTREGq+/19
         36zESQ6hxz8lQqvtliuaKam4Ua4RpBwz33uawdqjw9iw6+kmmqRycTO3px1vnSMe6ouj
         P5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746118611; x=1746723411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjITccKn52YoXHvMNHp0xjqzTUP9bb6Gv+c2QtvOV0Q=;
        b=swJHXRlpy1SsPH1e2uoMwtNjaRKlPfM/LW4DBQwuf+Nve27wndpFqhhukJ7YX93O9D
         /vQj9tmk2eIgB8BLa/xxopF2L7wd8/FQGVe9L06wSCwPXmlji6/9rV2FiSjnGXA6bOdd
         wuuwHqHr/Hbprqlc9DbZYJcswlcypUlvwJ8sXtCIjqF99o/dS1lpNLS6vBwDuAy6NVL8
         NVm+Cfys0dkQW7keg/UxE1AUpFAdIM7ZPmR7Ik2qaAi5S4PYGycWPvhGDYk9ZL6kSHMO
         M4SYSS8OkNdfxgJN2co1J2EXVCT7iC2ut59oXblfdE5wB/CRmu8iWMlMkpMqVZs3+aw1
         mNUg==
X-Forwarded-Encrypted: i=1; AJvYcCVgCIsYOMn+2G8UiEC805RlWRcHinunPXEKrS+ll65y6CzEQdR21ux6M1EL2Bv2R7fmTOcp2puOwOQIlto=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJhxLA8tVde5YHLAKbr6QWgIIeWpcRx/ICh4aGNrAAyhartXYA
	D6X4qfcYnirJJ8zmXmikZQIb+UUcHwkVxXDTN9SIAhULYY9noItu+6bx/jsAdEAvOFou8PWziOO
	FXiln5S5eTK4veIlVMmm7T8lWTw8=
X-Gm-Gg: ASbGncurQPYI4t5xEExSeR+Mw70jsOFqgnoix81+hS1M6kpewN9dautu9iObpIVsbWc
	cfqrlQNHBKWblZI4Bw8rxsA9lxRmGUEg3PnnnOJ6FnRKSxhWfnEnhiQJMsAAbDiSB5G13rTWxYA
	Iiz3+VmKRG3itTv9Ynv5lwYAbY8bT4Ok4JpHxuNONplxqChR16nmy9Ow==
X-Google-Smtp-Source: AGHT+IECEidvEo999oYKJS7UCLAVVBM0myFbAJ15E7tPIRmjavdQpBC/5/8mZ8iIClrt0F8kscmSCXQGalHJ9fnIAF0=
X-Received: by 2002:a05:6402:524c:b0:5e6:de5:312f with SMTP id
 4fb4d7f45d1cf-5f913507c6dmr3187305a12.23.1746118610475; Thu, 01 May 2025
 09:56:50 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-2-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-2-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 1 May 2025 18:56:13 +0200
X-Gm-Features: ATxdqUF2nyzuV4YsC3PXg7l3hGhLYkWnuNMDOdnMHwkg3TmNkQsrDO9p2L0Wm2o
Message-ID: <CAP01T742Td_U8=fs4DDrxWSdQcXEpGE=T6+WfJqBw_bqpXhb+g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 1 May 2025 at 09:39, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Currently, __xlated_unpriv and __jited_unpriv do not work because the
> BPF syscall will overwrite info.jited_prog_len and info.xlated_prog_len
> with 0 if the process is not bpf_capable(). This bug was not noticed
> before, because there is no test that actually uses
> __xlated_unpriv/__jited_unpriv.
>
> To resolve this, simply restore the capabilities earlier (but still
> after loading the program). Adding this here unconditionally is fine
> because the function first checks that the capabilities were initialized
> before attempting to restore them.
>
> This will be important later when we add tests that check whether a
> speculation barrier was inserted in the correct location.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Fixes: 9c9f73391310 ("selftests/bpf: allow checking xlated programs in verifier_* tests")
> Fixes: 7d743e4c759c ("selftests/bpf: __jited test tag to check disassembly after jit")
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

