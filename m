Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F48BAAF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6tF3kBmz3wQq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:46:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nk4GMQz3cbH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6ng6xftz4xPM;
	Fri,  3 May 2024 20:42:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: yangyingliang@huawei.com, mpe@ellerman.id.au, sundar <prosunofficial@gmail.com>
In-Reply-To: <20240424150718.5006-1-prosunofficial@gmail.com>
References: <20240424150718.5006-1-prosunofficial@gmail.com>
Subject: Re: [PATCH linux-next] macintosh/macio-adb: replace of_node_put() with __free
Message-Id: <171473286295.451432.11707762913723680358.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:41:02 +1000
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
Cc: javier.carrasco.cruz@gmail.com, Julia Lawall <julia.lawall@inria.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Apr 2024 20:37:18 +0530, sundar wrote:
> use the new cleanup magic to replace of_node_put() with
> __free(device_node) marking to auto release when they get out of scope.
> 
> 

Applied to powerpc/next.

[1/1] macintosh/macio-adb: replace of_node_put() with __free
      https://git.kernel.org/powerpc/c/84030aacf127d000180fa3cb4b589d8ab1b0d46b

cheers
