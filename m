Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C8647028
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:56:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ0968sRz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrx2Rcxz3c69
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrx1Jxpz4xN1;
	Thu,  8 Dec 2022 23:49:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: christophe.leroy@csgroup.eu, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20221125173204.15329-1-ldufour@linux.ibm.com>
References: <20221125173204.15329-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH] pseries/mobility: reset the RCU watchdogs after a LPM
Message-Id: <167050321981.1457988.18096782970217396456.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:19 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 25 Nov 2022 18:32:04 +0100, Laurent Dufour wrote:
> The RCU watchdog timer should be reset when restarting the CPU after a Live
> Partition Mobility operation.
> 
> 

Applied to powerpc/next.

[1/1] pseries/mobility: reset the RCU watchdogs after a LPM
      https://git.kernel.org/powerpc/c/9b574cfab7d4e68c67c4ee4fcde912ef54a25b88

cheers
