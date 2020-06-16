Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CB61FA523
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 02:29:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m8G1452jzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 10:29:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ujLlWxkA; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m8Cy6nbJzDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 10:27:26 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id g7so14605449oti.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 17:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QgmGpiw00RUbPn0dElJPKuqibpwqFCkOpmWT1FnzDzI=;
 b=ujLlWxkA3umisMZR0JmcKobuKsBtboPaJ1F78cCiizIXQG3HlvznN0deX6FpfW2lWv
 8FpnkainaGzGTHgPSz7kI6VtW6wIVMWMeuekpXFImudZ5mxZ5qyPkySTvQ9+mtXX3zMT
 PJ2CQLqdn0Naj/4OLo4svM8VbdOiN3ZAzg3XVyeBBqSFCyRS8rB2haQ+9YnimvsJlENx
 IYLNQ5f6izdFwPUbY3nQ9S1xnIyFhgIUKHNrIyKRkx9jWCEIWYwEl3Z23kK+EfXkah8O
 RZJAaI/oK3Qy1mQQ2aUzklteTeksJdbBMgImvn/w3sk8Zo7RflVf2HUz06ruoNOqFGzn
 c6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QgmGpiw00RUbPn0dElJPKuqibpwqFCkOpmWT1FnzDzI=;
 b=qs5hsjdZz9TyJG/KHNs4QNuQwahU1y5PNNvw6yyqyrRhGvCa8u4Gi9TczYANrsNrRL
 EOO3tSnrsuhIitzX9hliEt2biEARoGr03L7Lx8RnfCUFBtUlkqVpN0Fyk9pu2BswxK3R
 jp3IIVByOSBr+Qg32yVSmp6zGxwIrniD+FW+Ewd9eYHhNEsWUxccR0g/KEFweimEDDlN
 iLL86BUTlbIVkK5beOi5FbLT4vnGhywliTv8dA5TV+KJbr5NtzbPHqaiKOprQ0AEMVfd
 iRhaWWrKz+t5eRRNe93mPG6NYh+7oBlRry/sLJrvwBXZzkRcrXu7bj8u0KpdrZ0pKjZw
 wcgw==
X-Gm-Message-State: AOAM532ObCzhfTymO2dPbBOIrqyuuTRJl2Er+y3DH9RUo0trryXM9rSQ
 sg2uKtCcjz6F1Pim76v5ZfA=
X-Google-Smtp-Source: ABdhPJz7XarUh553UGUacOtBN5Tyk1+YhQXnamxQscG2gqubATjncfulr8Q1xNAWI1dKmMRSZZxq+Q==
X-Received: by 2002:a9d:6c03:: with SMTP id f3mr467685otq.291.1592267242901;
 Mon, 15 Jun 2020 17:27:22 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id f11sm3769430oib.43.2020.06.15.17.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 17:27:22 -0700 (PDT)
Date: Mon, 15 Jun 2020 17:27:20 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
Message-ID: <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
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
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 04:55:52PM +0000, Christophe Leroy wrote:
> From: Michal Simek <michal.simek@xilinx.com>
> 
> The latest Xilinx design tools called ISE and EDK has been released in
> October 2013. New tool doesn't support any PPC405/PPC440 new designs.
> These platforms are no longer supported and tested.
> 
> PowerPC 405/440 port is orphan from 2013 by
> commit cdeb89943bfc ("MAINTAINERS: Fix incorrect status tag") and
> commit 19624236cce1 ("MAINTAINERS: Update Grant's email address and maintainership")
> that's why it is time to remove the support fot these platforms.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

This patch causes qemu-system-ppc to fail to load ppc44x_defconfig:

$ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc-linux- O=out/ppc distclean ppc44x_defconfig zImage

$ timeout --foreground 30s unbuffer \
qemu-system-ppc \
-machine bamboo \
-no-reboot \
-append "console=ttyS0" \
-display none \
-initrd ../../cbl/github/boot-utils/images/ppc32/rootfs.cpio \
-kernel out/ppc/arch/powerpc/boot/zImage \
-m 128m \
-nodefaults \
-serial mon:stdio
qemu-system-ppc: could not load kernel 'out/ppc/arch/powerpc/boot/zImage'

$ ls out/ppc/arch/powerpc/boot/zImage
out/ppc/arch/powerpc/boot/zImage

Is this expected? Is there some other config or machine that we should
be testing instead?

Cheers,
Nathan
