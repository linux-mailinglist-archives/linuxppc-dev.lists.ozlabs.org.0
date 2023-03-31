Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD46D1B2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 11:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnvSr2QWpz3chB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 20:02:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ma9CGEid;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ma9CGEid;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnvS115TBz3cMb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 20:02:06 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id k17so26603109ybm.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680253322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWm2jI2yHpPi79Yy1CI28Qxt6CEyohh41n1LA0fGLDM=;
        b=ma9CGEidowfFcQ/RWwH9jcS3JpkuGTgIsGbkrjxNbpyIzTV0VWElAtIXD1pJ7GvLWW
         o7VY5XN4Af8jnZZ9O6VFKig0/95cqzaeDCJiUPwYZQl8VR+1dmIghX/+s6g86bp9ODnN
         MAzwUVCiMu/TmuzqPKTEsI7qk7BcH62AgPt5/bQM0gksa4J2iBNXg4d+1aT8ueqsMtsu
         j/o9cEOqf4x14P3d54vkcr4sulvwLKD3DWlzGUaFgwLRmbPD3v1X3PVwEGdEFSAXSvdX
         cX0K9wRov1LZHYLnnywTrm7QrejvefZ111ofD9/89zCLVipeznKpthRrdFZIrBFoD4rz
         Cj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWm2jI2yHpPi79Yy1CI28Qxt6CEyohh41n1LA0fGLDM=;
        b=SAmMZqvMPOcgtx1s/+CdchGn3G3IMGsn+FHcDcSt03LWPUEPZrJ+Y19DhZC3EgVjuh
         VlsadkAW02E/7ChFdao2xS2XTOZRC//jEp8qu/wiP1H7o16UB6s+nCpbGvww3BHHPBml
         arU4KS4OYmmw2xMfp2U6nJ1lZV4QNgEMYlejxVNPwr1+fh4FfQMizcn0WtXahqJGkG/z
         l7sQ8aqIjpoVyAtliXppCDza8dThMfXKbYey60b5TTl+Qxvu59bxGEcRtJyoduuk/oOP
         vYR9kELZ4lpoIFYSFKqkPkFWjjmMgFNomLRVzufDcwuvtntnrcAtDrb+jCpCZ61S2dXi
         zIiA==
X-Gm-Message-State: AAQBX9dieqkZnWMbGtWUbXEffZdRj57nqOYQcRMir4Gr2aQdJpTLcha9
	qjXW4cViRCLqSYTseA624g836IntgmImbLet76TDMQ==
X-Google-Smtp-Source: AKy350YI8e95DFYP40XLqEj+u/39+STuziGTnuEb3AUKVWMQr59PuRxxs6tiZPNOPKYnKLtLdYTZJpdc8TKai7hc3Ak=
X-Received: by 2002:a05:6902:1006:b0:b78:4b00:775f with SMTP id
 w6-20020a056902100600b00b784b00775fmr12714571ybt.4.1680253322494; Fri, 31 Mar
 2023 02:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-16-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-16-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 11:01:51 +0200
Message-ID: <CACRpkdbMry_UUYN1MuXTUpRXV+Tj9RSDvN-iBdvR8hDfkTaX4w@mail.gmail.com>
Subject: Re: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@mons
 tr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 2:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Most ARM CPUs can have write-back caches and that require
> cache management to be done in the dma_sync_*_for_device()
> operation. This is typically done in both writeback and
> writethrough mode.
>
> The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
> (arm920t, arm940t) implementations are the exception here,
> and only do the cache management after the DMA is complete,
> in the dma_sync_*_for_cpu() operation.
>
> Change this for consistency with the other platforms. This
> should have no user visible effect.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
