Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 368485850D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSr90nsHz3hNr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:23:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk84hk5z3fCy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSk566zjz4xG7;
	Fri, 29 Jul 2022 23:17:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, Ning Qiang <sohu0106@126.com>
In-Reply-To: <20220713153734.2248-1-sohu0106@126.com>
References: <20220713153734.2248-1-sohu0106@126.com>
Subject: Re: [PATCH] macintosh:fix oob read in do_adb_query function
Message-Id: <165909971980.253830.1618039188917103373.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:01:59 +1000
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
Cc: greg@kroah.com, security@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jul 2022 23:37:34 +0800, Ning Qiang wrote:
> In do_adb_query function of drivers/macintosh/adb.c, req->data is copy
> form userland. the  parameter "req->data[2]" is Missing check, the
> array size of adb_handler[] is 16, so "adb_handler[
> req->data[2]].original_address" and "adb_handler[
> req->data[2]].handler_id" will lead to oob read.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh:fix oob read in do_adb_query function
      https://git.kernel.org/powerpc/c/fd97e4ad6d3b0c9fce3bca8ea8e6969d9ce7423b

cheers
