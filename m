Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071439ECC9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 05:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzZzC0Qx0z3bs0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:12:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Sri8V3yc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sri8V3yc; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzZyj1TSMz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 13:11:40 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so1322248pjq.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dTKE13akXye7XOJrSySmUD4YdhMpmg7p/bPzllhdc1c=;
 b=Sri8V3ycW3FJB7nLzmqz0afeW7dxQXb/kAmro1fv/9NZyJ7opSk/eMUz/2X4csIk17
 DBYRhuujk+4AF1N6FdT91gx2Llz7yvu5u5WasuapqNuJaFP/8Znh+DsoGdb5/cBsF1w4
 DcVy7zxIA8DjoyNzKevhu4W86Lz6FT8Kfr1TpBg5MFofUKBC0q4su2fARQehdFg9sv5s
 pm2KAd0gyQ2lOSVjdMu5+aqpZ2g+3ekNZrfb7yyX3QY/U4h8L7BOuyTyhu5zTmgtnheO
 RcYsg6xnTNzTJPQpUsYx8968CPtHGKO4G+kqhv4Oa4bWVBb8FrXjjH38FNWRmTyEcr7s
 yFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dTKE13akXye7XOJrSySmUD4YdhMpmg7p/bPzllhdc1c=;
 b=ZTSgCkmA5udtiNtbLfstUOXns0jGvwdh9Nu1Uc7E9sXfITCgUNWGX0UU5ltjeqAH+y
 GbMM8PFq9mNrNcPvMEPmn6ea2loOqHRNPkulcgR2uOIGDJTDBggVKhY0T/xpw9bjzNo8
 Xu4YhQ2+lgv+3A86U3c8yDES0v5GoD9RPYZ7HEZ39ehkC6DAGhABagVMyHKAVuS6RaiI
 eQakf+j19MCJDTaSduFbFYgpjU2W/iFJT5IBB7nkDy3FZRjgS+P+hzz7q/iK/ZFd3omw
 dIqA2Oz6CLPf0Me7fA8oMVNIKMN/tKDRm5hTQN/mRu09fCdc/lDvddy08dWl7SqoNHfQ
 qv8Q==
X-Gm-Message-State: AOAM532+O2qMHQ5XkGm1I33WusdLSbGQtL9ZpzXnvRWXsZx4zN3mdQgs
 Rjmy5ZpQMYsSTPqv0ZQCnLQ=
X-Google-Smtp-Source: ABdhPJwSOpFSmciqtMoVlA713sykrsY6pkKYM6papRQiSUGgcieRkA25/e0j0f2w2JnCcU3MhZadCA==
X-Received: by 2002:a17:90a:5507:: with SMTP id
 b7mr2395216pji.27.1623121895340; 
 Mon, 07 Jun 2021 20:11:35 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id c21sm9244091pfi.44.2021.06.07.20.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 20:11:34 -0700 (PDT)
Date: Tue, 08 Jun 2021 13:11:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/4] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-3-npiggin@gmail.com>
In-Reply-To: <20210605014216.446867-3-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1623121605.j47gdpccep.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of June 5, 2021 11:42 am:
> Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb mm
> when it is context switched. This can be disabled by architectures that
> don't require this refcounting if they clean up lazy tlb mms when the
> last refcount is dropped. Currently this is always enabled, which is
> what existing code does, so the patch is effectively a no-op.
>=20
> Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Can I give you a couple of incremental patches for 2/4 and 3/4 to=20
improve the implementation requirement comments a bit for benefit of=20
other archs.

Thanks,
Nick
--

Explain the requirements for lazy tlb mm refcounting in the comment,
to help with archs that may want to disable this by some means other
than MMU_LAZY_TLB_SHOOTDOWN.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 1cff045cdde6..39d8c7dcf220 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -419,6 +419,16 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	  shootdowns should enable this.
=20
 # Use normal mm refcounting for MMU_LAZY_TLB kernel thread references.
+# MMU_LAZY_TLB_REFCOUNT=3Dn can improve the scalability of context switchi=
ng
+# to/from kernel threads when the same mm is running on a lot of CPUs (a l=
arge
+# multi-threaded application), by reducing contention on the mm refcount.
+#
+# This can be disabled if the architecture ensures no CPUs are using an mm=
 as a
+# "lazy tlb" beyond its final refcount (i.e., by the time __mmdrop frees t=
he mm
+# or its kernel page tables). This could be arranged by arch_exit_mmap(), =
or
+# final exit(2) TLB flush, for example. arch code must also ensure the
+# _lazy_tlb variants of mmgrab/mmdrop are used when dropping the lazy refe=
rence
+# to a kthread ->active_mm (non-arch code has been converted already).
 config MMU_LAZY_TLB_REFCOUNT
 	def_bool y
=20
--=20
2.23.0

