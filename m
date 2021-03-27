Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1234B92F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 20:57:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F78kR0WKbz3bnJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 06:57:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oTcDvUNV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=sergei.shtylyov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oTcDvUNV; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F78jy4CDqz2xZ5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 06:56:37 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id f26so11293685ljp.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bQsYw1ulUIO0dY5gSmv/3K4yj4XoeNoUj5DbKPEh9Qw=;
 b=oTcDvUNVUKy9l34jnk2Y6fGNlsSkpob0U6AudT8Jb4AZQ8OeHPq+nUwasmV8okfR2M
 sR+8behyvuMSz9G1EzjXiQj6LC23cs5XP3Vtcv+ivzmEp+gJdLhO3WJ40Yu3TtD1au7A
 T2jV+Uq24Bl7S6ZHZM5oSMX9h9l/f1+MOn3mPiOLuzagBTUVMcux0Bnq5Xe4bP3kjH5q
 cOfrKoS7RFKuRrrys834C8IvbAfjTmLd3SoJ3gcxp2e3UMkXWjaDO2oyj+t/e0vR3RWH
 GnqgmytnivfuzoKSm30v5UZFTROIHD61oXNxfqGvB1wgJHok2AYNnD/KhZd0qbUWpVgO
 h/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bQsYw1ulUIO0dY5gSmv/3K4yj4XoeNoUj5DbKPEh9Qw=;
 b=WDqba/D/hFMyx8E7jauMOAXpXTL9CryfiTP1Wv9NNMP+DNwIl0zt1Q5F8BPaLAcgPG
 5CNW/ehGz07IJKr0dVKgvDYaw324WmllpRD/1VLLEVvt5yNUtry0QUOHAMdn8hwWE+EA
 E3wvDECYsSlzFqsI4StMmx5Eb+AtrULCI3np48sydmLfBmKDrWahZ8Jztwr3Wtzocv7B
 rZHzVC2at4f2K5ePjb7NpfYzEdFi5fRry6iXF33vkMtuZTpXtpLgTw3uEvsQop/2Jdbe
 wIy6ALWI5AVgVPJ3UEWBt7mbgvcPzpLZG9dSdJroR6tEjWyjir6xj2vuRzCOezieP5Kd
 AJQQ==
X-Gm-Message-State: AOAM531L00WoHojrQU3JadxkEATHPDO8/X7jkM8ZRZYldUgqef1oqVB6
 zsrlmIYo4y8hb8s/yKJ12gc=
X-Google-Smtp-Source: ABdhPJxLBeDCGTGncf7vPJx9segmdfmBAwHxFr43PJcjHagfyVIArjRrzp4osMA8qrzDEZfwYnOCVQ==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr12854352ljj.204.1616874991681; 
 Sat, 27 Mar 2021 12:56:31 -0700 (PDT)
Received: from [192.168.1.101] ([31.173.82.142])
 by smtp.gmail.com with ESMTPSA id u14sm1345822lfl.40.2021.03.27.12.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 12:56:31 -0700 (PDT)
Subject: Re: [PATCH 2/4] exec: remove compat_do_execve
To: Christoph Hellwig <hch@lst.de>, "Eric W. Biederman"
 <ebiederm@xmission.com>, Al Viro <viro@zeniv.linux.org.uk>
References: <20210326143831.1550030-1-hch@lst.de>
 <20210326143831.1550030-3-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <596ca191-0176-e991-7318-f9a0f3361cb3@gmail.com>
Date: Sat, 27 Mar 2021 22:56:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326143831.1550030-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Brian Gerst <brgerst@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/21 5:38 PM, Christoph Hellwig wrote:

> Just call compat_do_execve instead.

   compat_do_execveat(), maybe?

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/exec.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/fs/exec.c b/fs/exec.c
> index b63fb020909075..06e07278b456fa 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
[...]
> @@ -2072,7 +2057,7 @@ COMPAT_SYSCALL_DEFINE3(execve, const char __user *, filename,
>  	const compat_uptr_t __user *, argv,
>  	const compat_uptr_t __user *, envp)
>  {
> -	return compat_do_execve(getname(filename), argv, envp);
> +	return compat_do_execveat(AT_FDCWD, getname(filename), argv, envp, 0);
>  }
>  
>  COMPAT_SYSCALL_DEFINE5(execveat, int, fd,

MBR, Sergei
