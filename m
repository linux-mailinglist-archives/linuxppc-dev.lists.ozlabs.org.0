Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5C550A6A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 13:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQrq42X2Cz3cFj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 21:56:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQrpj3L2Zz3059
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 21:56:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LQrph6qrqz4xXF;
	Sun, 19 Jun 2022 21:56:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
In-Reply-To: <20220614134952.156010-1-ajd@linux.ibm.com>
References: <20220614134952.156010-1-ajd@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address
Message-Id: <165563974889.2516477.9308896620875536366.b4-ty@ellerman.id.au>
Date: Sun, 19 Jun 2022 21:55:48 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, stable@vger.kernel.org, Sathvika Vasireddy <sathvika@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jun 2022 23:49:52 +1000, Andrew Donnellan wrote:
> Add a special case to block_rtas_call() to allow the ibm,platform-dump RTAS
> call through the RTAS filter if the buffer address is 0.
> 
> According to PAPR, ibm,platform-dump is called with a null buffer address
> to notify the platform firmware that processing of a particular dump is
> finished.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address
      https://git.kernel.org/powerpc/c/7bc08056a6dabc3a1442216daf527edf61ac24b6

cheers
