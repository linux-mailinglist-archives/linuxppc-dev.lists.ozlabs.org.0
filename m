Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C680785781
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4gf0NDmz3dvC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cc1mrXz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cb6hVJz4wy7;
	Wed, 23 Aug 2023 22:03:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <2cb498f637e082a4af8032311fad3cae84d6aa5d.1692199324.git.christophe.leroy@csgroup.eu>
References: <2cb498f637e082a4af8032311fad3cae84d6aa5d.1692199324.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/83xx: Fix style problems in usb.c and remove unneccessary includes from mpc83xx.h
Message-Id: <169279175569.797584.3444196924144422566.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Aug 2023 17:22:16 +0200, Christophe Leroy wrote:
> Replace printk(KERN_WARN with pr_warn(
> 
> Remove a couple of blank lines
> 
> Re-align multi-line code.
> 
> Replace asm/io.h by linux/io.h
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/83xx: Fix style problems in usb.c and remove unneccessary includes from mpc83xx.h
      https://git.kernel.org/powerpc/c/d25f01fba71dbaa117021aed3ea85cc5476c1a5a
[2/2] powerpc/83xx: Split usb.c
      https://git.kernel.org/powerpc/c/5951b62ba4635881f1eb6c30e35d476871ff5d12

cheers
