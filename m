Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15A1CEA67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 04:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Lgx23KX6zDqnT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 12:00:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LgsZ1zwZzDqpB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 11:57:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=q+DNTToN; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49LgsX5r2jz9sSW; Tue, 12 May 2020 11:57:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49LgsX2JJwz9sRY;
 Tue, 12 May 2020 11:57:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589248624;
 bh=ORN8HryrSgbZGLzC/893lA1G+tC/DDpQ79ckFy+UR8U=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=q+DNTToN2la2jNK0pgNsZojp3s48IJwSpy2TCSElAE69Hs6AjhWRNjrg2ymZDBDYy
 pa5RMvt68LJH5H9xXfLRZnLzn+hOvQnpsJV8XVdyzL1oEsJYstHQYbmqv4oEOp87PL
 Yob52vAylrLPLbnTiBsIXANNcPd41QaOULtfXcqtGlP2EXJUPH8S+D085eLUBc2XTt
 ovoLX64PGPkQTDAXxeO48RlX19IeASb2tb/3WFprjAprMcSPeF6reAtqUjTu8/5Uk2
 7/vNCjX/vk0/9Z5thUl4ycSd2VKUNSUMlMzU9m/WGny2l6UAbuQ6j6Cb8RJ69yDlLI
 Zatli5+67v1/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@ozlabs.org,
 Benjamin Herrenschmidt <benh@ozlabs.org>, Michael Neuling <mikey@neuling.org>,
 Anton Blanchard <anton@ozlabs.org>
Subject: Re: [PATCH RFC 3/4] powerpc/microwatt: Add early debug UART support
 for Microwatt
In-Reply-To: <20200509050340.GD1464954@thinks.paulus.ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050340.GD1464954@thinks.paulus.ozlabs.org>
Date: Tue, 12 May 2020 11:57:24 +1000
Message-ID: <87pnb9c3uj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Paul Mackerras <paulus@ozlabs.org> writes:
> Currently microwatt-based SoCs come with a "potato" UART.  This
> adds udbg support for the potato UART, giving us both an early
> debug console, and a runtime console using the hvc-udbg support.

Can y'all get a real UART?

There's more code here than in the platform itself.

cheers
