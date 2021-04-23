Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF12E369533
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 16:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRcmx5fdXz30Ds
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 00:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OHb9hJ26;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OHb9hJ26; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRcmY0VdWz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 00:55:57 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A14E61463
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619189753;
 bh=R62pLNjA9noFl2JNlwS4diwF3n2+vBGPxhkGlcLJqNU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OHb9hJ26La3xCDjCdmfC0+DTMmtSZqIETEbpFB4o43Tg/CTphiDmkdeR+WrZmRY8R
 Ufvva8FGnrC0dFC++suE5LUFdwceIbXSqdjwrlkfaKIFXP4WzUDu4CLz+8uJd78zUQ
 FnjER9fWRSWtX5UDAX/zukAGdAQUZUSAN3yoqYBZ6J50N+vJbWDnCcYfJOPBeXjQw+
 TTHM8E1HhfKfstD+QeiB+Nz8Zs1HxNzAqUeot1n/54Xeu8LPr9julfcFa1xzISbhXp
 gL5uGd23NSKjolrFBXEsZFFD+NewSw7jEh1PmdNbLc4HTdCJuRQCJ/cTNdatMUurOB
 NVBYxw/+ZvdZQ==
Received: by mail-ej1-f50.google.com with SMTP id n2so74293917ejy.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 07:55:53 -0700 (PDT)
X-Gm-Message-State: AOAM530x8apDw1bcNyfzaHjyDWhzFWPLH3ZkEke9QOAsnq1T3+9kcqsT
 gM85CxxMDiDZKvfybA/5xDGTZ86IVDBqT8pfig==
X-Google-Smtp-Source: ABdhPJyzSYoCrQUp8AZOe/VzsaOGQ7Ex2FewksH/32fJAahVFtRK2yHuqsRqIXD3LON0ZjaWUzCbhgXMiHLQGar8l38=
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr4558298ejd.525.1619189751774; 
 Fri, 23 Apr 2021 07:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <f2186955f310494f10990b5c402ada164d7834b8.1619188632.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f2186955f310494f10990b5c402ada164d7834b8.1619188632.git.christophe.jaillet@wanadoo.fr>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Apr 2021 09:55:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJkR94s107S0yiJpjNWKbi6yuqDcV7DaxbjBF-o80meaA@mail.gmail.com>
Message-ID: <CAL_JsqJkR94s107S0yiJpjNWKbi6yuqDcV7DaxbjBF-o80meaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Fix a memory leak in error handling paths
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, gustavoars@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 9:40 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If we exit the for_each_of_cpu_node loop early, the reference on the
> current node must be decremented, otherwise there is a leak.
>
> Fixes: a94fe366340a ("powerpc: use for_each_of_cpu_node iterator")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Strangely, the commit above added the needed of_node_put in one place but
> missed 2 other places!

Well, maintained it in one place and forgot to add in the other two.

> This is strange, so maybe I misunderstand something. Review carefully
> ---
>  arch/powerpc/platforms/powermac/feature.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

I don't really think patch 2 is worthwhile but that's up to the
powerpc maintainers.

Rob
