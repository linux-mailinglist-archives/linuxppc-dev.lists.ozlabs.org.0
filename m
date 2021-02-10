Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF53168B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:09:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbM7b4VLwzDvWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYH5XNhzDrfy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYF4CkBz9sWk; Wed, 10 Feb 2021 23:57:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20210107025900.410369-1-nathanl@linux.ibm.com>
References: <20210107025900.410369-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/dlpar: handle ibm,
 configure-connector delay status
Message-Id: <161296172280.3178259.1163375689266539848.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:36 +1100 (AEDT)
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Jan 2021 20:59:00 -0600, Nathan Lynch wrote:
> dlpar_configure_connector() has two problems in its handling of
> ibm,configure-connector's return status:
> 
> 1. When the status is -2 (busy, call again), we call
>    ibm,configure-connector again immediately without checking whether
>    to schedule, which can result in monopolizing the CPU.
> 2. Extended delay status (9900..9905) goes completely unhandled,
>    causing the configuration to unnecessarily terminate.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/dlpar: handle ibm, configure-connector delay status
      https://git.kernel.org/powerpc/c/768d70e19ba525debd571b36e6d0ab19956c63d7

cheers
