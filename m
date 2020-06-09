Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 227411F33E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:01:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzyW1b31zDqK3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzF34jsWzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzF05V9sz9sTG; Tue,  9 Jun 2020 15:28:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20191002214854.GA114387@dtor-ws>
References: <20191002214854.GA114387@dtor-ws>
Subject: Re: [PATCH] macintosh/ams-input: switch to using input device polling
 mode
Message-Id: <159168032756.1381411.13851424138846895037.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:52 +1000 (AEST)
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
Cc: Jean Delvare <jdelvare@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Oct 2019 14:48:54 -0700, Dmitry Torokhov wrote:
> Now that instances of input_dev support polling mode natively,
> we no longer need to create input_polled_dev instance.

Applied to powerpc/next.

[1/1] macintosh/ams-input: switch to using input device polling mode
      https://git.kernel.org/powerpc/c/0c444d98efad89e2a189d1a5a188e0385edac647

cheers
