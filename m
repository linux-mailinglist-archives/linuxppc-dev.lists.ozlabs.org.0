Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D753B4E31
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:42:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr6m6QTbz3f4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:42:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2W67qyz3c1v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2V5L0qz9srZ; Sat, 26 Jun 2021 20:38:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20210504025329.1713878-1-nathanl@linux.ibm.com>
References: <20210504025329.1713878-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/dlpar: use rtas_get_sensor()
Message-Id: <162470384622.3589875.13154206433427700200.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:26 +1000
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 3 May 2021 21:53:29 -0500, Nathan Lynch wrote:
> Instead of making bare calls to get-sensor-state, use
> rtas_get_sensor(), which correctly handles busy and extended delay
> statuses.

Applied to powerpc/next.

[1/1] powerpc/pseries/dlpar: use rtas_get_sensor()
      https://git.kernel.org/powerpc/c/bfb0c9fcf5870036e54081b28cae2af5f9ee7088

cheers
