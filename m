Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223A3AC260
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mHf5mwNz3dZw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:32:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4W1QHxz3c7m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:07 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4T6qPmz9t18; Fri, 18 Jun 2021 14:23:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Shaokun Zhang <zhangshaokun@hisilicon.com>
In-Reply-To: <1622529385-5938-1-git-send-email-zhangshaokun@hisilicon.com>
References: <1622529385-5938-1-git-send-email-zhangshaokun@hisilicon.com>
Subject: Re: [PATCH] selftests/powerpc: Remove the repeated declaration
Message-Id: <162398828902.1363949.4984436760853941116.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:29 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Jun 2021 14:36:25 +0800, Shaokun Zhang wrote:
> Function 'event_ebb_init' and 'event_leader_ebb_init' are declared
> twice in the header file, so remove the repeated declaration.

Applied to powerpc/next.

[1/1] selftests/powerpc: Remove the repeated declaration
      https://git.kernel.org/powerpc/c/8f6a54bcaf62a791a7bceccc093497f7f53e2e26

cheers
