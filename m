Return-Path: <linuxppc-dev+bounces-8233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C4AA6659
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 00:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpTZv6Yw5z2ygD;
	Fri,  2 May 2025 08:42:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::542"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746137288;
	cv=none; b=dyaPeoF4ngLGDCPZuY4AEMZuku0DPSYJabhSjh/JdRB9oWTxqirOz01zttuYiB+m0kiU4TnAV71F6nJShjQY36jQQIxPVKgwx7BL3HoBe1RCWkesde8Zi/Ug94jNuKJ1JZFo9SmiSZZ71f5ruPG1ONaUCLfT1x5trWIYbFTGKEZZSe08PsnuTJh/fOo1dsYfQiKFo8uRjflR9qTecfIy3wFv38LuzMuy8ITzUrx0fcu8dE7sHHDLKUyLQV45Byt/GtZ9n9dZFE0O+pygPGC7osfVUqQeHJ3yn9tEA+SPo6sjUBSF3YFKXJ58s2eHtYtxH/2ajZ2GP49dLclOltpZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746137288; c=relaxed/relaxed;
	bh=7quJAgqtByXNTdZlZiyaqw3qQ6ApoXnPxA/dYk2LZiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6tT2OdHIMWsS6pFePQtJoJdYDMuLMpnGTSZLxSLAs9lcQMkobzbFMl93Vt/gAEp8iXWCPHaCQCiDdj8QsNVzVYnQhYe1WSigiqVEWH13echWmC92TQEhrgvcMueIYo3K1wP4jmZ4fMMNDS12z5sMd55kLx2SZvwqS3opQnhlUmlf0xXKBKu0x3CTmchCkvE2poKFpzaLa68iXmOJHtUfgfNAw43by/lzgaTppffvTk16mcDuvRI/RQANH1bPZochrw4FIrpMr5IxT5dKCTyDUBJlKqLszU4GCSUcxz1FXdzlaIICkXH0H7KxBagyEjSYnI9y831mJez2HbcBTpLVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IQaimL4A; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IQaimL4A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpSqC4cN8z2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 08:08:07 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso2518147a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 15:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137285; x=1746742085; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7quJAgqtByXNTdZlZiyaqw3qQ6ApoXnPxA/dYk2LZiw=;
        b=IQaimL4AIx1hI6BoEE524l7FnqXiQFAKws/LGbo4+pG0lThko5y2TOWGU/9pmOMKw+
         CGwj7D9lFJgtJALMmCU31LSwcvjCIjtPDHcOYwQY6kyBAk/BAbQqBVNrnHnIxFZz+lmo
         GTBXW0ndxcLkJQ9KXfZYd1WRS7+tZEA11Q3DWhPoP428KrmRlN1JLF7EOmJw/hVAfft4
         o7pe9RkK0PeKdbLUepK+HrgRtke1G1zjYOgTuLBNw58dRmRLtPKwZUuOMqIJywiNjGpF
         PejgSR6B+XzZdyVqLM8EJVEiNH3U+vRLzg/vYiN2IzxZwlf/koDUaURM4mLHszf5DlDl
         NUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137285; x=1746742085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7quJAgqtByXNTdZlZiyaqw3qQ6ApoXnPxA/dYk2LZiw=;
        b=l6sQBHVVjnlSE4LwEbeny03GiJYZKcQpgJgAHo+2bl+LUAlV0rUPnoWZpuUTprQcPr
         Ks4UZIwmlKMe6Gr0PLIdH084wwsfzjg/4/8RUH0X71fTJtwulRmpUx1ktvYnKng/sUnR
         cRl1G5zl86f76s/o++rg8S1Gh9LTxODrXso5y7ozXkIJaRcMacOQFQk0fWcefLwDpF4e
         88P1kyXl0ePLF2yAy/ZFBozCmi8pHsni15Tn4RroOnm15wdvBVraEYyG46n3zC/5Sbpt
         HXtxQuRp0MfqqZcVXrXtN//w+0KmIvywiUmXpjHTeZfF3sX2TParp8oN0nObKrQb6Frt
         zdSA==
X-Forwarded-Encrypted: i=1; AJvYcCX7MijoviaYzRXHCJYhJcLdD9HhsclwOa4Af7QFIe3a803aHBuYJetzuFNlDBL0WM/67bzxiuKqVEs1KG8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPSVleSssJ+xyfEGWEu6Wfs2nEBFfT+jpErBQhSSsTWvzkLg+s
	/fi+2KpJa0e8pehbWTvHTmOdiguGpd3LhSOHYR3K5V8sA0VfeiIYPyg07o5ttVzMvbNcerh0DIV
	8GbiN53K03hQ/9UnJ7B2/FBNRAes=
X-Gm-Gg: ASbGncstRaqRHWVJFcvMVXcvHovYgKuOZ2NBCKh01MfyjiyQXWxh97RSPaUAr2a1vfT
	9zX5ZSRNxAGLaFa/AwSJ3s/xURTOnY1olTuS7e7EG1cGah/VLoIiKjZrx3Ijub+BummpiUnpb67
	DCrRkMN7wJGQ95BPoQor31nVBel2W3DN2fhqOc/YtZwUo=
X-Google-Smtp-Source: AGHT+IEpCphxCqMgTrla7wQvz59TQTpY+aaLkW8rSW5jI9j4mNhEMH7gT93PVUghkBIu58Z86lHq44KdoKbiLLlzMQg=
X-Received: by 2002:a05:6402:27d4:b0:5f4:5a6d:20c9 with SMTP id
 4fb4d7f45d1cf-5fa77d559e6mr348036a12.0.1746137284554; Thu, 01 May 2025
 15:08:04 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-5-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-5-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:07:27 +0200
X-Gm-Features: ATxdqUG83OGzyF1YRlc-RZCuhJkMxQqfI4mWekVT0IBHPEfZLUOvcZSUG01W9MI
Message-ID: <CAP01T75Eg0EA5jmVQs=FFFbkpZPP2rHS-HTO508rQS5CwC2h=A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 04/11] bpf: Return -EFAULT on internal errors
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
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 1 May 2025 at 09:48, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This prevents us from trying to recover from these on speculative paths
> in the future.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

