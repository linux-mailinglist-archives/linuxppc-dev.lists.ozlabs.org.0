Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092F706A26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLvb7665Yz3f8d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.43; helo=mail-ed1-f43.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLvZb6CTpz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:48:22 +1000 (AEST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-504d149839bso196111a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 06:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684331296; x=1686923296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktinit9wKE6dNmLgC8Q+hzsuqEwfbXOj0+wtuIuj7PA=;
        b=QXFVV1s82zfd9ik7BuZkax+XIWSZA9MIiSFk02e67XpLLzuA1RuWiEpfiUKXwH9pGy
         eYgIhW1lOX3JHWwxAe6fX114GZZcw49Kpu5EdP+tWVK7TEnE9ImRZSqIez8zr5zsS0DZ
         xveMKMrlM4Cd+e4eJ+LIkqa1cg5+MCj7Ub9qVAMV0fge5iRMBByTPv/S8B9Ipr+4+OXN
         mFHY1KWS/rPXArfmVw3CGTSg5UUecu4MBEL003OxVjRcM89Xt6TOWovkOjGa+i3nm/H2
         MMkAIUjoenctnS1NuNRtGMGcX9Bc5Ei7lmE4jhhG1Ah+D/j4+J3+1TMfNd5EFEhvgAkP
         s/Jg==
X-Gm-Message-State: AC+VfDyDXFCr73TmYBdrGex21lA0+MfynGD+q90pNICCDV2/ASkHYGuU
	oWHCCFQfP17EqAxlwoYdc4hQn3LP+qVWANae16Y=
X-Google-Smtp-Source: ACHHUZ6M9EgcbaCbKF8EZaqyFXATppYniPvZEHcewZCPT/QYkFrutGUliTGcVVnKvC2nG18eSQY5J4nCD2m1yx3JtWA=
X-Received: by 2002:a17:906:778a:b0:92e:f520:7762 with SMTP id
 s10-20020a170906778a00b0092ef5207762mr2003855ejm.6.1684331295491; Wed, 17 May
 2023 06:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230517131102.934196-1-arnd@kernel.org> <20230517131102.934196-11-arnd@kernel.org>
In-Reply-To: <20230517131102.934196-11-arnd@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 17 May 2023 15:48:04 +0200
Message-ID: <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023 at 3:12=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arch_resume_nosmt() has a __weak definition, plus an x86
> specific override, but no prototype that ensures the two have
> the same arguments. This causes a W=3D1 warning:
>
> arch/x86/power/hibernate.c:189:5: error: no previous prototype for 'arch_=
resume_nosmt' [-Werror=3Dmissing-prototypes]
>
> Add the prototype in linux/suspend.h, which is included in
> both places.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Do you want me to pick this up?

If not

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  include/linux/suspend.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index f16653f7be32..bc911fecb8e8 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -472,6 +472,8 @@ static inline int hibernate_quiet_exec(int (*func)(vo=
id *data), void *data) {
>  }
>  #endif /* CONFIG_HIBERNATION */
>
> +int arch_resume_nosmt(void);
> +
>  #ifdef CONFIG_HIBERNATION_SNAPSHOT_DEV
>  int is_hibernate_resume_dev(dev_t dev);
>  #else
> --
> 2.39.2
>
