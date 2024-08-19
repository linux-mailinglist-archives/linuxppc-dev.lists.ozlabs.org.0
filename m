Return-Path: <linuxppc-dev+bounces-188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AF9576E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 23:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnmZ63Qdgz2y82;
	Tue, 20 Aug 2024 07:53:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=esZZSaFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnkPm1tzNz2y34
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 06:16:10 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a7a843bef98so532372766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724098567; x=1724703367; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6kUf3JuaMLYYiOtuZKtyG5uHrd9gw9QQ5nZ3PFBxZMk=;
        b=esZZSaFlsP02aPqqkdMPFovBJAiGPjDvVidqgnapLWvFd91dhbwC9T7yRmHTFY76BM
         t6QfK9JMlNEOyi9t+3IX24iBWRmNClBLeiwQXbcI8mZzh3XBz+4AE38IgA3OMFt9ndBJ
         mfPk1Cds0gkQhe64Zicst4o79a1yv86y1mxUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724098567; x=1724703367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kUf3JuaMLYYiOtuZKtyG5uHrd9gw9QQ5nZ3PFBxZMk=;
        b=DU03ysDpZpK8dgLelFG0xZMQ0SbGgbLohj0yJXJybu32wtUq+nNUCgKUAg6YOZtJKk
         EkzkFO8887XpAZR6zEyadWRK803tUdVJgFcpnFYRTiFNzETDtsjb7n1/nqC0ndtVrXiD
         EKsKwC6tWUHiQgY343QoLNvcZLPcgDsbTUu7bwZag5nhbBdnt64HFtrhc5TkTEpFXTjG
         5QVzrfyezkOPFRWLRYt5/d/m6xfIoG2Rf7RO0dhiRWMHS9aupF/toeNvTgzgAfCHi7JH
         yrb1Vbm6n9fUeNTSPPgJ57/2K4cfz8rM3PbxLxTmrR4t2d14+BCX5RQpYMdIm3swWixD
         6Z0w==
X-Forwarded-Encrypted: i=1; AJvYcCU2jB8IwLPgL8Cw/IzdVfNBuvW8EuZwvq19QH3GGb4bTeCI7In1ogtvYuHhOBh0zBGSanDrE2xyR3B2zxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSdu3oA5/3TwVxjc3L38ZwJe968gAbwrPbAcJPunYL/nGJqM+j
	4tUNuTOOE26ev9052ogKuSsqeWQ5vYF08miuxATAaEKQRKn+fQi3J/jhHrK53Y+QCt23i6Gg7C/
	DOK/XnQ==
X-Google-Smtp-Source: AGHT+IG3wvzcDc1rqaWfnkWtbv+Jv+MQFFums55CQWGtjObwjQ6TlWQJr+LFXYD+om5qTZVcqlP12g==
X-Received: by 2002:a17:907:94cd:b0:a80:f7a7:5e39 with SMTP id a640c23a62f3a-a83928a985fmr751922166b.3.1724098566686;
        Mon, 19 Aug 2024 13:16:06 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383934559sm671550066b.130.2024.08.19.13.16.06
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 13:16:06 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bed68129a7so3722992a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 13:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4kKHyA2HVfAJDdxihxxUBkq2WjGgNIDqZI63EXuY+x4EsKFOAkVoCOv4QvhTwwx1EY4HDvcPkswZenNM=@lists.ozlabs.org
X-Received: by 2002:a50:c8cb:0:b0:5a3:a9f8:cf20 with SMTP id
 4fb4d7f45d1cf-5beca8c7c0dmr6123102a12.34.1724098565883; Mon, 19 Aug 2024
 13:16:05 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com> <20240819195120.GA1113263@thelio-3990X>
In-Reply-To: <20240819195120.GA1113263@thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Aug 2024 13:15:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
Message-ID: <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, jeffxu@google.com, 
	Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, 
	oliver.sang@intel.com, pedro.falcato@gmail.com, linux-um@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2024 at 12:51, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Yes, that appears to fix it for me. I don't have much to say about the
> rest but others might :)

Ok, I did a quick hack-job to remove that disgusting
install_special_mapping() legacy case.

With this, the old "install_special_mapping()" mess no longer exists,
but I haven't even attempted to compile the result, because I don't
have cross-compile environments for any of the affected architectures.

Except UML. I did at least build it there, but it's not like I tested it.

Adding architecture maintainers and more architecture lists to the
participants. It would be good to actually get this patch tested.
Context for newly added people:

   https://lore.kernel.org/all/CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com/

NOTE! This patch is against my current tree, not the linux-next
changes. But it should entirely remove the case that caused problems
in linux-next.

                      Linus

