Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB364700D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:51:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYtt05J1z3fHJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:51:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrg3yyyz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:39 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrc40Kjz4xTx;
	Thu,  8 Dec 2022 23:49:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, XueBing Chen <chenxuebing@jari.cn>, mpe@ellerman.id.au, seanjc@google.com, aik@ozlabs.ru, clg@kaod.org, paulus@samba.org
In-Reply-To: <13b2c857.beb.181725bad35.Coremail.chenxuebing@jari.cn>
References: <13b2c857.beb.181725bad35.Coremail.chenxuebing@jari.cn>
Subject: Re: [PATCH] KVM: PPC: use __func__ to get funcion's name in an output message
Message-Id: <167050315478.1457988.6983450516071083505.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:14 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Jun 2022 23:50:19 +0800 (GMT+08:00), XueBing Chen wrote:
> Prefer using '"%s...", __func__' to get current function's name in
> an output message.
> 
> 

Applied to powerpc/next.

[1/1] KVM: PPC: use __func__ to get funcion's name in an output message
      https://git.kernel.org/powerpc/c/61119786de40f61b8843aa57217b678361763d67

cheers
