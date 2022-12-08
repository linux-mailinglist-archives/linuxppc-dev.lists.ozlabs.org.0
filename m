Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1C647021
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:54:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYyS3d3Mz3fdM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrv5w1fz3cB4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrv36sgz4xvS;
	Thu,  8 Dec 2022 23:49:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Zhang Jiaming <jiaming@nfschina.com>, benh@kernel.crashing.org, mpe@ellerman.id.au, paulus@samba.org
In-Reply-To: <20220623102031.15359-1-jiaming@nfschina.com>
References: <20220623102031.15359-1-jiaming@nfschina.com>
Subject: Re: [PATCH] KVM: Fix spelling mistake
Message-Id: <167050315544.1457988.12211386518984944248.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:15 +1100
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
Cc: liqiong@nfschina.com, linuxppc-dev@lists.ozlabs.org, renyu@nfschina.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Jun 2022 18:20:31 +0800, Zhang Jiaming wrote:
> Change 'subsquent' to 'subsequent'.
> Change 'accross' to 'across'.
> 
> 

Applied to powerpc/next.

[1/1] KVM: Fix spelling mistake
      https://git.kernel.org/powerpc/c/392a58f1eaab0c90b80d7ba4a03dbf6eaaeabe60

cheers
