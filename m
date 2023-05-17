Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03E706B35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 16:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLwc634vfz3fFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=fu1tzDMU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=fu1tzDMU;
	dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLwbC6PFtz3f4m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 00:33:57 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3f42b4da6e5so4784561cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684334033; x=1686926033;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3oHRvM4+O+XVaUuEdehDkOXM012vn7RckSkGvna424=;
        b=fu1tzDMU/Og/xO2VDVrDn7AMjoYSOOqIHHpkafFQsXAXa7bAquEW8FLCbTstV+4LMK
         WozWorjMKA6Ye6vd/CWIiTxdEYThpduYehQ0CQ0WfYzDYjo3Vb2D2M2rgHnkpqG2DoOG
         hFYTNMutL1PBlKS5Sm6U/taMV6kJ+5c+nFWzW2BnEmFKQvrQZqgN1lt1MaOoYlFovyr9
         7rwdJcPszNNgJz0aUNWpj3BWju7B7DitjFIRX5EHLLPdarguqNTfEhlBsUlRfiyyggcm
         rmyPk1XWlhvVmYgOtYCrVpLjW2EGN4HHxXkb5Vh4zDOUpaw4fdaI2HH4gyNooTHomACq
         60Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684334033; x=1686926033;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3oHRvM4+O+XVaUuEdehDkOXM012vn7RckSkGvna424=;
        b=C3w5slmwiEIOaFVUlLJHysiIxZzG2bcJtYQEcj5/nE+bACogCL6uYlEjSmjQNxT8Ab
         HSgTXxoTEdENjiOfBXR4PZAA1DDWQXnBFbIeCDxUgSw/tOHEK3pFgrpTnvqw7+D/O30k
         lxTxqB7qEx9aQwawkYatfZoh8Edf4xm8jqdfq5dAmj98sK/0QfFcJuqUIoc5FfAS5Lgv
         XnLWUakoklR7umdl+/GlWY8R+VDK5x7oMJAcDMGF8bQ+qcrHFKU0MS9VjgKKO0WgesIZ
         puWwZKFVjh1yOeSVnQOsIt8ntsGMmuxsH8CFvcCPIHQtqagEH5UM4WpZ1G7RVd288YlY
         JLeA==
X-Gm-Message-State: AC+VfDwPkd4DeOBwLv9NXZvT7dacTOvRGjDxXZBrbT4XxrnmKggZ96tT
	6pzpBafQehtICPfgqowH0SzO
X-Google-Smtp-Source: ACHHUZ62YidM3zKdwt9WsXpqyD57MEzZUZPKzKjSHJhQM0a+oKDUHR+Gn6BJRSHZwAJwHcpYfUyurw==
X-Received: by 2002:ac8:5c91:0:b0:3ef:5ba0:7038 with SMTP id r17-20020ac85c91000000b003ef5ba07038mr73060971qta.21.1684334033429;
        Wed, 17 May 2023 07:33:53 -0700 (PDT)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net. [108.26.161.203])
        by smtp.gmail.com with ESMTPSA id d19-20020a05620a159300b0075914b01c29sm645867qkk.70.2023.05.17.07.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:33:52 -0700 (PDT)
Date: Wed, 17 May 2023 10:33:52 -0400
Message-ID: <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 4/14] audit: avoid missing-prototype warnings
References: <20230517131102.934196-5-arnd@kernel.org>
In-Reply-To: <20230517131102.934196-5-arnd@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Dennis Zhou <dennis@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, audit@vger.kernel.or
 g, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On May 17, 2023 Arnd Bergmann <arnd@kernel.org> wrote:
> 
> Building with 'make W=1' reveals two function definitions without
> a previous prototype in the audit code:
> 
> lib/compat_audit.c:32:5: error: no previous prototype for 'audit_classify_compat_syscall' [-Werror=missing-prototypes]
> kernel/audit.c:1813:14: error: no previous prototype for 'audit_serial' [-Werror=missing-prototypes]
> 
> The first one needs a declaration from linux/audit.h but cannot
> include that header without causing conflicting (compat) syscall number
> definitions, so move the it into linux/audit_arch.h.
> 
> The second one is declared conditionally based on CONFIG_AUDITSYSCALL
> but needed as a local function even when that option is disabled, so
> move the declaration out of the #ifdef block.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/audit.h      | 2 --
>  include/linux/audit_arch.h | 2 ++
>  kernel/audit.h             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 31086a72e32a..6a3a9e122bb5 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -130,8 +130,6 @@ extern unsigned compat_dir_class[];
>  extern unsigned compat_chattr_class[];
>  extern unsigned compat_signal_class[];
>  
> -extern int audit_classify_compat_syscall(int abi, unsigned syscall);
> -
>  /* audit_names->type values */
>  #define	AUDIT_TYPE_UNKNOWN	0	/* we don't know yet */
>  #define	AUDIT_TYPE_NORMAL	1	/* a "normal" audit record */
> diff --git a/include/linux/audit_arch.h b/include/linux/audit_arch.h
> index 8fdb1afe251a..0e34d673ef17 100644
> --- a/include/linux/audit_arch.h
> +++ b/include/linux/audit_arch.h
> @@ -21,4 +21,6 @@ enum auditsc_class_t {
>  	AUDITSC_NVALS /* count */
>  };
>  
> +extern int audit_classify_compat_syscall(int abi, unsigned syscall);
> +
>  #endif
> diff --git a/kernel/audit.h b/kernel/audit.h
> index c57b008b9914..94738bce40b2 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -259,8 +259,8 @@ extern struct tty_struct *audit_get_tty(void);
>  extern void audit_put_tty(struct tty_struct *tty);
>  
>  /* audit watch/mark/tree functions */
> -#ifdef CONFIG_AUDITSYSCALL
>  extern unsigned int audit_serial(void);
> +#ifdef CONFIG_AUDITSYSCALL
>  extern int auditsc_get_stamp(struct audit_context *ctx,
>  			      struct timespec64 *t, unsigned int *serial);

We probably should move the audit_serial() and auditsc_get_stamp()
away from the watch/mark/tree functions, but that isn't your problem.

Anyway, this looks okay to me; do you have a problem if I merge this
via the audit/next branch or were you hoping to have this go in
through a different tree?

--
paul-moore.com
