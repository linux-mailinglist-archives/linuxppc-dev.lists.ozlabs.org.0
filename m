Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D383F9A1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0vW0ptjz3fkK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kq2tvkz3c6n
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kp4HDfz9tjx;
 Fri, 27 Aug 2021 23:22:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Neuling <mikey@neuling.org>, kvm-ppc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v2 0/2] Kconfig symbol fixes on powerpc
Message-Id: <163007014161.52768.9837791663447874626.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:41 +1000
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
Cc: kernel-janitors@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Aug 2021 13:39:52 +0200, Lukas Bulwahn wrote:
> The script ./scripts/checkkconfigsymbols.py warns on invalid references to
> Kconfig symbols (often, minor typos, name confusions or outdated references).
> 
> This patch series addresses all issues reported by
> ./scripts/checkkconfigsymbols.py in ./drivers/usb/ for Kconfig and Makefile
> files. Issues in the Kconfig and Makefile files indicate some shortcomings in
> the overall build definitions, and often are true actionable issues to address.
> 
> [...]

Patch 1 applied to powerpc/next.

[1/2] powerpc: kvm: remove obsolete and unneeded select
      https://git.kernel.org/powerpc/c/c26d4c5d4f0df7207da3975458261927f9305465

cheers
