Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A268E704
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 05:24:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBRjY1RTsz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 15:24:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bz6RSRSO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bz6RSRSO;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBRhY57j8z2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 15:23:55 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id ea13so3004389pfb.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 20:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwckPzzpAfCiiq4nczjtD5+CfSxL2gLGQ05Qh9vCh7o=;
        b=Bz6RSRSOPmxuVwz6B0Oe83p8SIQx3wB2q52iXk0yQDOirVJt6sDknz//TgRXU9rX1N
         pmVE/p2r5cIYXVU0XOGgApKWEM1LnUuAYSIik/RCtZFVnVgyEj0kN3AQceRVCjSX5etO
         IsF0o4NKXCJl/u5k4odty4wBrRdg0cmYkAx81YjCIrek7KDCpeol3tiVBjs7TZwR2fLa
         st9ANEcaJPOzVrXIje9X/WkHqi/eQICEXG6rjnHhzfE/7GckM/NpZ8h0HX2Fc2CrrrNw
         fSAs2txO53xdCFZDWuHsa53YOioaTURYH92PMevJa1M130BFiiN9s/0Nz14j8RsxpcDS
         /UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwckPzzpAfCiiq4nczjtD5+CfSxL2gLGQ05Qh9vCh7o=;
        b=SZIoR7l//pX8uWiyCJ30sLZsBZEtL3tT4uynxvjot6MvBb8jDQR62j2Ybxn6kcoTuB
         d44Fv+eqp9GbOoV1RKGDxbArErK8nLhxG4PxNqScZJieZxj3fgxhY5KhaaG7Nx6ubfqK
         cIjtx9rJ1399EOQPIsQEvJT4vX9J3FRSVH93vsw6Z/8t545lg6kljGZedb5QEzs9AWLE
         rXcPwzVXVaz4fCbv2d0fZ82xkIK5C5xLIq96iY42UTU5t6Qy0d5rt0oUs69uYpodJbSd
         xLzBK7Dnw/KpxpHHSvSth+oTk2W2iafkgk1hKp0TnLVenT5kQvRRJ+Jh1ORqHDtsrHt/
         o0Nw==
X-Gm-Message-State: AO0yUKVXXh5U+yQyjPLHje/9ZgP5RAEpvjLUZ+8Zo+FZO4SJYTJ1Et+X
	7cKeGau0kcXA6PoFUNy3RZENVq1W7r0QljMK2gQ=
X-Google-Smtp-Source: AK7set9bEtzV65PTBeYIkXgXf9bddryQqJLhFkR+zQpm+gO+JZ8lC12Z3FZOvL/dTQgQhXyM9rzDp2tV8S/qKVV2CLM=
X-Received: by 2002:a63:6f8d:0:b0:4fa:bd95:3913 with SMTP id
 k135-20020a636f8d000000b004fabd953913mr1223387pgc.1.1675830232494; Tue, 07
 Feb 2023 20:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20230208032202.1357949-1-rmclure@linux.ibm.com> <20230208032202.1357949-2-rmclure@linux.ibm.com>
In-Reply-To: <20230208032202.1357949-2-rmclure@linux.ibm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 7 Feb 2023 20:23:41 -0800
Message-ID: <CAMo8BfLFR6Oza0TPZy32PkEYqGhEvwtQvM=KGwdBgXuXv9Lr+A@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] kcsan: Add atomic builtin stubs for 32-bit systems
To: Rohan McLure <rmclure@linux.ibm.com>
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
Cc: chris@zankel.net, elver@google.com, linux-xtensa@linux.xtensa.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 7, 2023 at 7:22 PM Rohan McLure <rmclure@linux.ibm.com> wrote:
>
> KCSAN instruments calls to atomic builtins, and will in turn call these
> builtins itself. As such, architectures supporting KCSAN must have
> compiler support for these atomic primitives.
>
> Since 32-bit systems are unlikely to have 64-bit compiler builtins,
> provide a stub for each missing builtin, and use BUG() to assert
> unreachability.
>
> In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements these
> locally, but does not advertise the fact with preprocessor macros. To
> avoid production of duplicate symbols, do not build the stubs on xtensa.
> A future patch will remove the xtensa implementation of these stubs.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v4: New patch
> ---
>  kernel/kcsan/Makefile |  3 ++
>  kernel/kcsan/stubs.c  | 78 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 kernel/kcsan/stubs.c

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
