Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E13AC25B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mFy0kPdz3gRf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:31:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4S2gV9z3c62
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:04 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4R16CSz9t0T; Fri, 18 Jun 2021 14:23:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, arnd@arndb.de,
 mpe@ellerman.id.au, benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 Baokun Li <libaokun1@huawei.com>
In-Reply-To: <20210601085319.140461-1-libaokun1@huawei.com>
References: <20210601085319.140461-1-libaokun1@huawei.com>
Subject: Re: [PATCH -next] powerpc/spider-pci: Remove set but not used
 variable 'val'
Message-Id: <162398828887.1363949.15561402899101847554.b4-ty@ellerman.id.au>
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

On Tue, 1 Jun 2021 16:53:19 +0800, Baokun Li wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> arch/powerpc/platforms/cell/spider-pci.c: In function 'spiderpci_io_flush':
> arch/powerpc/platforms/cell/spider-pci.c:28:6: warning:
> variable ‘val’ set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction.

Applied to powerpc/next.

[1/1] powerpc/spider-pci: Remove set but not used variable 'val'
      https://git.kernel.org/powerpc/c/f377f7da26d2af87e2ddc39190546f62ecdb2bd8

cheers
