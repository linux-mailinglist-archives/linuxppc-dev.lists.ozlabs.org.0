Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA653B3CA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 08:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB6Sw5cc9z3cNV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:25:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB6RV2m0gz2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 16:24:38 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB6RT2JYfz9sXb; Fri, 25 Jun 2021 16:24:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210621064938.2021419-1-mpe@ellerman.id.au>
References: <20210621064938.2021419-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/prom_init: Convert prom_strcpy() into
 prom_strscpy_pad()
Message-Id: <162460208744.3247425.11901434488919269002.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 16:21:27 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 16:49:37 +1000, Michael Ellerman wrote:
> In a subsequent patch we'd like to have something like a strscpy_pad()
> implementation usable in prom_init.c.
> 
> Currently we have a strcpy() implementation with only one caller, so
> convert it into strscpy_pad() and update the caller.

Applied to powerpc/next.

[1/2] powerpc/prom_init: Convert prom_strcpy() into prom_strscpy_pad()
      https://git.kernel.org/powerpc/c/f47d5a4fc254e62ea5af5cbb2fc3e68901def434
[2/2] powerpc/prom_init: Pass linux_banner to firmware via option vector 7
      https://git.kernel.org/powerpc/c/ffaacd97fd37b9f4e825d8107f5cba5470458f0e

cheers
