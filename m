Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53EA3F11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:37:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrrM1DnpzDr8v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.195; helo=mail-qt1-f195.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrlV1PFlzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:33:09 +1000 (AEST)
Received: by mail-qt1-f195.google.com with SMTP id i4so9027235qtj.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 13:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C2hE6pOXI9YwgYTXoFXhAGtS+qXq/OZAAT0OYkj0YuE=;
 b=Uq705TumSSXuXtKJiKLarq2KYTyIfRP7pvYGpxQ6kWn834iekfsS8sdPILpwu5Pk47
 g6r4ZiIGAJU6PbBk1/6dUYWZMfbznVKTw5xWSHSUo6mOIUst3CkpJ9ovgI9HPr/dw5UA
 Bm8A51aSSXMx4qs5/WC5iPA0SXRSU6w4Tlwp1kuTmSMztR9hTvBMx8Oov95uEbtbdodK
 UU6I39HMtlrdaD5OF5rSaVNxh53gntPGiA5k5L6XDSq2Fj+If1AZcTwiJTAXF9PSca02
 KupBAAqtJfnv8R+j2Q/Op4YMBROhnsLGOeARWVokcjX08/xv1q6GJtaU+Hr3gGyARnSh
 Nuag==
X-Gm-Message-State: APjAAAXWA2mMzoxWtMVqApNllOnKxvhshdbt2CiYlQ7ACEq2vGL2ioCU
 xO7Q+nf8qFlaZwhUtZjFMsaDHHCCcGf++14sU18=
X-Google-Smtp-Source: APXvYqzNLmASV9zbZWIDANsCXyZ0gD0AajjB+nlVkHem8tbUSIpFypUjy64Chv0ThgUcKdpjgNdza02VbGy4KagIrcQ=
X-Received: by 2002:ac8:239d:: with SMTP id q29mr17353365qtq.304.1567197187083; 
 Fri, 30 Aug 2019 13:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a16=ktJm5B3c5-XS7SqVuHBY5+E2FwVUqbdOdWK-AUgSA@mail.gmail.com>
 <20190830202959.3539-1-msuchanek@suse.de>
In-Reply-To: <20190830202959.3539-1-msuchanek@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 22:32:51 +0200
Message-ID: <CAK8P3a2XzubLT4gkAzmu9u17bXB1dznbZm=vGPAzyS74fNa=Kg@mail.gmail.com>
Subject: Re:
To: Michal Suchanek <msuchanek@suse.de>
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Firoz Khan <firoz.khan@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2019 at 10:30 PM Michal Suchanek <msuchanek@suse.de> wrote:
>
> Subject: [PATCH] powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
>
> This partially reverts commit caf6f9c8a326 ("asm-generic: Remove
> unneeded __ARCH_WANT_SYS_LLSEEK macro")
>
> When CONFIG_COMPAT is disabled on ppc64 the kernel does not build.
>
> There is resistance to both removing the llseek syscall from the 64bit
> syscall tables and building the llseek interface unconditionally.
>
> Link: https://lore.kernel.org/lkml/20190828151552.GA16855@infradead.org/
> Link: https://lore.kernel.org/lkml/20190829214319.498c7de2@naga/
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
