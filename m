Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 362359295D6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmT30M9Kz3fV8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ36Wh8z2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:12:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ3421Jz4xPd;
	Sun,  7 Jul 2024 09:12:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240509-mac_hid-md-v1-1-4091f1e4e4e0@quicinc.com>
References: <20240509-mac_hid-md-v1-1-4091f1e4e4e0@quicinc.com>
Subject: Re: [PATCH] macintosh/mac_hid: add MODULE_DESCRIPTION()
Message-Id: <172030740423.964765.11410477570460429115.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 09 May 2024 18:23:37 -0700, Jeff Johnson wrote:
> Fix the make W=1 warning:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/macintosh/mac_hid.o
> 
> 

Applied to powerpc/next.

[1/1] macintosh/mac_hid: add MODULE_DESCRIPTION()
      https://git.kernel.org/powerpc/c/50b5fed94e21c0992c79fafdd041c9863c1fd2d2

cheers
