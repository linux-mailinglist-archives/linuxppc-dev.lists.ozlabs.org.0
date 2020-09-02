Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F077E25A4BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:53:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhBQY5ZCJzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhBNX1yHFzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 14:51:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=DTR+woOO; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BhBNW4Sxsz9sV8; Wed,  2 Sep 2020 14:51:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1599022283; bh=WOfp9otDnweaCa9QqM2OIoG8iDSDoTlcwj+EuEhBVJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTR+woOO6qeYDsljobUQVGIbaihDCn3rXPf03LnF7I6kLqQhgbaMpLTeQ07etO+c5
 xwZ67OX3DnhiFTAEQwIUQdLGKkFbf9xj4HGPbZl6RdlOrL7gpXntDESOju2lESBUdC
 aGv0ZsYaPG3y1E3dKV47QPQe79W26HvGEhs977pmdWQOfcRXS1yyg0yIQ/qFjATM7d
 TkXtzQyKya6L3YWtB1VOLoOFaGD8KOED50c1V1ps4UETTC8BooW5uZYnI3wHZrlJ8M
 QO5+R5GfyNTFzk7NRVkMM94NZdgZoSHl6M0lf8GZ4tJMBtRK4qCPXEI7WtewThoGTz
 NdJMOilWIYc2A==
Date: Wed, 2 Sep 2020 14:51:18 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] powerpc: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200902045118.GD272502@thinks.paulus.ozlabs.org>
References: <20200716090712.14375-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716090712.14375-1-miaoqinglang@huawei.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 16, 2020 at 05:07:12PM +0800, Qinglang Miao wrote:
> From: Chen Huang <chenhuang5@huawei.com>
> 
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Chen Huang <chenhuang5@huawei.com>

For the arch/powerpc/kvm part:

Acked-by: Paul Mackerras <paulus@ozlabs.org>

I expect Michael Ellerman will take the patch through his tree.

Paul.
