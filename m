Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C03F6E9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 06:55:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvYZ43t13z2xlD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:55:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=nS8Xfv5N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=nS8Xfv5N; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvX6b6sv7z2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 13:49:41 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id w6so13516024plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 20:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=nS8Xfv5Np514ewOr71qM5OVYQ4om375+9iia5AAYDaK3OM+hzJenuJr7dAU5cYremk
 lMJSdk/H6gRuWyoAZ38Dxo4xTOwzwlYBTQ7mHvrJGvY2eRlpd9btrTwCc/T4R+lnp2Oz
 tfjjB9XYA84IA+sxs7E0+0bjR3ImZY/NCblTCqWV1vz8ngiUx+QRlaWbVMisVRWW3rOO
 yK85Pgi7JMY0nVAg9WrPZrM52PG/5lW+DmvVcQIgBTfNfdcKCdUHJCl4J+hHtwrGzLzq
 JQXK/nMftIjnNhxqPt/IHdPMmbV0SixoX/iiQ7rUV+IDNkS5Y0uflbsJwBJg2KghrkLe
 Gahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=TieUUJFjOoN/39dEXDQeMnzRv77EM89mDH2VGIadgnHYwai/IuQarmHpGYWd4vPX9Y
 dE6bGC8wYHbbZhm3WIBwKsxOIs+GjXjymKRFwseNFE2RL/sfLPst/CuKRtDqlb/g/a+I
 Vvy0P2jfhG3ekWgJDXnUI7ST0vfp+/QReh1NZYfR5PQEfjLbfdYKuw7/FcvZ3dV90cI8
 y9VnnffjgVm9Qmr1m87X45SvjiVAdDljbovbk8cy9NM2Cy+Za+1lC1wrFSIvNAxX5B9R
 XGuIZGs9pEpn9yFlEmUEvS5pxEV9toIJWJNL0PmoeXiSqc6WWRyPlNKiduBw0b6fJkMp
 KEYA==
X-Gm-Message-State: AOAM5309fqL0a+Cc9iKb++z8gTGqjANGedWVb5Nn5P5gS+ak9Y5UAc7t
 JaFw/e5N+Ymt06Oz72FgMNVotQ==
X-Google-Smtp-Source: ABdhPJyuW0xG5fzwlVnm+V74njUWhK4iHoDYuJqptloS8iraqWcj5+LzzcKnLTPVDHS2p7IwfcePKA==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr8241589pjg.75.1629863378109; 
 Tue, 24 Aug 2021 20:49:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q21sm23393107pgk.71.2021.08.24.20.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:42:18 PDT (-0700)
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-fae2ea79-c261-4e5d-8eae-21e60810a957@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 14:54:35 +1000
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org,
 viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, guoren@kernel.org,
 linux-csky@vger.kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com, will@kernel.org,
 ardb@kernel.org, paulus@samba.org, anton.ivanov@cambridgegreys.com,
 jonas@southpole.se, linux-s390@vger.kernel.org, gor@linux.ibm.com,
 ysato@users.sourceforge.jp, krzysztof.kozlowski@canonical.com,
 yifeifz2@illinois.edu, richard@nod.at, masahiroy@kernel.org, x86@kernel.org,
 linux@armlinux.org.uk, ley.foon.tan@intel.com, borntraeger@de.ibm.com,
 mingo@redhat.com, geert@linux-m68k.org, linux-parisc@vger.kernel.org,
 samitolvanen@google.com, u.kleine-koenig@pengutronix.de, shorne@gmail.com,
 linux-snps-arc@lists.infradead.org, jdike@addtoit.com,
 linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, keescook@chromium.org,
 Arnd Bergmann <arnd@arndb.de>, anshuman.khandual@arm.com, hca@linux.ibm.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org,
 stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, bp@alien8.de,
 green.hu@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, andreyknvl@gmail.com,
 chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de,
 bcain@codeaurora.org, nickhu@andestech.com, vgupta@synopsys.com,
 npiggin@gmail.com, linux-mips@vger.kernel.org, davem@davemloft.net,
 frederic@kernel.org, linux-hexagon@vger.kernel.org, colin.king@canonical.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, deller@gmx.de,
 rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Jul 2021 22:22:32 PDT (-0700), masahiroy@kernel.org wrote:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/Kconfig            | 4 +---

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!
