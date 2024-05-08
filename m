Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CB8BFF2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGcs6Kclz3gG0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:45:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXP0PxNz3cXM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXN6xshz4xF3;
	Wed,  8 May 2024 23:41:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>
In-Reply-To: <161531347060.252863.10490063933688958044.stgit@bahia.lan>
References: <161531347060.252863.10490063933688958044.stgit@bahia.lan>
Subject: Re: [PATCH] powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"
Message-Id: <171517558559.165093.4801076658434326149.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
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
Cc: Cédric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 09 Mar 2021 19:11:10 +0100, Greg Kurz wrote:
> All these commands end up peeking into the PACA using the user originated
> cpu id as an index. Check the cpu id is valid in order to prevent xmon to
> crash. Instead of printing an error, this follows the same behavior as the
> "lp s #" command : ignore the buggy cpu id parameter and fall back to the
> #-less version of the command.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"
      https://git.kernel.org/powerpc/c/8873aab8646194a4446117bb617cc71bddda2dee

cheers
