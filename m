Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023068E705
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 05:25:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBRkf6WwMz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 15:25:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GWM1srF0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GWM1srF0;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBRjm0TCjz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 15:24:59 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 24so691724pgt.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 20:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P03OlggRzHLuSZ2ATed+avheebm+eO5F7PlB2QrpWoo=;
        b=GWM1srF0XcnceJgPu1AFXOzfJfBbhpib+Uist8GhWYZFUFDmVfF1gLnQs9WVAIVnoR
         jhSP+A9ReQlkQKjjNeIfkRTflFqX3JTo6t9tRjbiSPpCyReZ2zMKlxFmgQ5jAY3U8ckH
         rf6cw2viebOlriAmomPsWVSibdVjgeVxj4vcEvhNmkYOdJkEv2Xx2AGWV/0RDyiUmvdE
         0WhoCAlAjf+AP29yK2bObAI4wo8erhDGq+3rCPVuePcrYMMY+7SlMhLg+S5PZXFMj2o+
         pz2NZf2d6d116SBSj3xNc/cpsdQpb3xzUAzUak6iLA520USFqSxocMYIh/Cy235Wn41T
         nvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P03OlggRzHLuSZ2ATed+avheebm+eO5F7PlB2QrpWoo=;
        b=snp8hWFhSxdD9CXZeemiAjDIZ4W2SnLHI9mPzzaIhsWv8+0VJZ8WYZrYDoKs1PwGOA
         XT3gFQ/IiCh8cGSOFMleO7iN8I7IUjXptwxKc2NrtMOt/rH5jYkOkSRIVwC7mztc+uxC
         0HZPpYLLI8j5avUrD2WtNcaghgEVfzMAz7XVhtKymQsihsH1HgtgUDnVJkqj1lEv6mHx
         WI2pSqP3PmxHvRww7etnm9CzIVygZ7iD2zzAgGd7+prHgTCl6JchjwOnUgre/sBj+7Ke
         8xfhcw6vEWhpVvOb+V0o2OsUucR7+A7belUypQZoChCDG3o0qDxq1HqLSI5s6czuq3Sy
         3W0Q==
X-Gm-Message-State: AO0yUKWHwHSxheFrtzGfnhz54bZmNOVfkl6KfMrPtr90cXXQ1oYbknqw
	yyodTUPEVMH00dQaMDJ+XE1EQMth0snvVsGyKeo=
X-Google-Smtp-Source: AK7set8RB3+a4NwP63rvUfNIU7bqqO0OMVLYV0T0kpE8DlOz7U4gstR/HobmuPYxzuQihYvhKCMKPKMa74AQCiYtI28=
X-Received: by 2002:a63:b54b:0:b0:478:c84a:ade1 with SMTP id
 u11-20020a63b54b000000b00478c84aade1mr1129473pgo.66.1675830296997; Tue, 07
 Feb 2023 20:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20230208032202.1357949-1-rmclure@linux.ibm.com> <20230208032202.1357949-3-rmclure@linux.ibm.com>
In-Reply-To: <20230208032202.1357949-3-rmclure@linux.ibm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 7 Feb 2023 20:24:45 -0800
Message-ID: <CAMo8BfL9Lfd1Lwkk4Cs5enrhgYutCxzsT2kUYEMUyJ1sqd7XAg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] xtensa: kcsan: Remove kcsan stubs for atomic builtins
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
> A prior patch implemented stubs in place of the __atomic_* builtins in
> generic code, as it is useful for other 32-bit architectures such as
> 32-bit powerpc.
>
> Remove the kcsan-stubs.c translation unit and instead use
> the generic implementation.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V4: New patch
> ---
>  arch/xtensa/lib/Makefile      |  1 -
>  arch/xtensa/lib/kcsan-stubs.c | 54 -----------------------------------
>  kernel/kcsan/Makefile         |  5 +---
>  3 files changed, 1 insertion(+), 59 deletions(-)
>  delete mode 100644 arch/xtensa/lib/kcsan-stubs.c

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
