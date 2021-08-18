Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C03F0531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTkY4VVyz3dk7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgq1GPlz3cR9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:57 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgj1JYkz9sWw; Wed, 18 Aug 2021 23:45:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anton Blanchard <anton@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20210805112005.3cb1f412@kryten.localdomain>
References: <20210805112005.3cb1f412@kryten.localdomain>
Subject: Re: [PATCH] powerpc/configs: Disable legacy ptys on microwatt
 defconfig
Message-Id: <162929392477.3619265.8829552508891310353.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:44 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Aug 2021 11:20:05 +1000, Anton Blanchard wrote:
> We shouldn't need legacy ptys, and disabling the option improves boot
> time by about 0.5 seconds.

Applied to powerpc/next.

[1/1] powerpc/configs: Disable legacy ptys on microwatt defconfig
      https://git.kernel.org/powerpc/c/9b49f979b3d560cb75ea9f1a596baf432d566798

cheers
