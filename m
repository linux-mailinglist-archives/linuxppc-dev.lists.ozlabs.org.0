Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01304381B85
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjL9r0B5vz309T
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjL8T5F7fz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:45 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8R6WcQz9sf8; Sun, 16 May 2021 08:45:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <332773775cf24a422105dee2d383fb8f04589045.1620302182.git.christophe.leroy@csgroup.eu>
References: <332773775cf24a422105dee2d383fb8f04589045.1620302182.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/syscall: Calling kuap_save_and_lock() is wrong
Message-Id: <162111863271.1890426.12479008048900584669.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:52 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 May 2021 11:56:31 +0000 (UTC), Christophe Leroy wrote:
> kuap_save_and_lock() is only for interrupts inside kernel.
> 
> system call are only from user, calling kuap_save_and_lock()
> is wrong.

Applied to powerpc/fixes.

[1/1] powerpc/syscall: Calling kuap_save_and_lock() is wrong
      https://git.kernel.org/powerpc/c/5d510ed78bcfcbbd3b3891cbe79cd7543bce1d05

cheers
