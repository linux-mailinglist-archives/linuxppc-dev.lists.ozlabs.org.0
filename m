Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 162173AC25C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:31:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mGH5Xkpz3gXL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4S58Nsz3c1x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:04 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4R526yz9svs; Fri, 18 Jun 2021 14:23:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, jk@ozlabs.org, paulus@samba.org,
 arnd@arndb.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 linux-kernel@vger.kernel.org, Baokun Li <libaokun1@huawei.com>
In-Reply-To: <20210601085127.139598-1-libaokun1@huawei.com>
References: <20210601085127.139598-1-libaokun1@huawei.com>
Subject: Re: [PATCH -next] powerpc/spufs: disp: Remove set but not used
 variable 'dummy'
Message-Id: <162398828869.1363949.8342892140049622633.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:28 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: yangjihong1@huawei.com, yuehaibing@huawei.com, weiyongjun1@huawei.com,
 yukuai3@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Jun 2021 16:51:27 +0800, Baokun Li wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> arch/powerpc/platforms/cell/spufs/switch.c: In function 'check_ppu_mb_stat':
> arch/powerpc/platforms/cell/spufs/switch.c:1660:6: warning:
> variable ‘dummy’ set but not used [-Wunused-but-set-variable]
> 
> arch/powerpc/platforms/cell/spufs/switch.c: In function 'check_ppuint_mb_stat':
> arch/powerpc/platforms/cell/spufs/switch.c:1675:6: warning:
> variable ‘dummy’ set but not used [-Wunused-but-set-variable]
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/spufs: disp: Remove set but not used variable 'dummy'
      https://git.kernel.org/powerpc/c/911bacda4658129bee039dc90fc0c3f193ee2695

cheers
