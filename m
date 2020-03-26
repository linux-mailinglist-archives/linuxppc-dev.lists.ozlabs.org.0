Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFA193F3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:51:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4bw27TqzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cr0GVWzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cp1sr7z9sSb; Thu, 26 Mar 2020 23:06:49 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9475af081ec1fb6cc794a17ae90f2c01aa8a7993
In-Reply-To: <20200312140412.32373-1-chenzhou10@huawei.com>
To: Chen Zhou <chenzhou10@huawei.com>, <paulus@samba.org>,
 <tyreld@linux.ibm.com>, <bhelgaas@google.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH -next] PCI: rpaphp: remove set but not used variable
 'value'
Message-Id: <48p3cp1sr7z9sSb@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:49 +1100 (AEDT)
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
Cc: chenzhou10@huawei.com, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-03-12 at 14:04:12 UTC, Chen Zhou wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/pci/hotplug/rpaphp_core.c: In function is_php_type:
> drivers/pci/hotplug/rpaphp_core.c:291:16: warning:
> 	variable value set but not used [-Wunused-but-set-variable]
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9475af081ec1fb6cc794a17ae90f2c01aa8a7993

cheers
