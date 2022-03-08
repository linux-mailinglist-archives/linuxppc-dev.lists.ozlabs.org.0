Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E9B4D171A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:18:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ9K6kQyz3bbG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ8z1F5Sz30G0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:17:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ8z4PxKz4xcl;
 Tue,  8 Mar 2022 23:17:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220228142434.576226-1-jakobkoschel@gmail.com>
References: <20220228142434.576226-1-jakobkoschel@gmail.com>
Subject: Re: [PATCH] powerpc/sysdev: fix incorrect use to determine if list is
 empty
Message-Id: <164674126479.3322453.5888213344645127953.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:07:44 +1100
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Feb 2022 15:24:33 +0100, Jakob Koschel wrote:
> 'gtm' will *always* be set by list_for_each_entry().
> It is incorrect to assume that the iterator value will be NULL if the
> list is empty.
> 
> Instead of checking the pointer it should be checked if
> the list is empty.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/sysdev: fix incorrect use to determine if list is empty
      https://git.kernel.org/powerpc/c/fa1321b11bd01752f5be2415e74a0e1a7c378262

cheers
