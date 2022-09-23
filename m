Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26B5E7929
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:13:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYqJV6Nybz3dtX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 21:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYqHh1Nx5z3c6J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 21:12:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYqHg6wS6z4xFv;
	Fri, 23 Sep 2022 21:12:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220907220111.223267-1-nathanl@linux.ibm.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
Message-Id: <166393062290.495724.18151018785697456266.b4-ty@ellerman.id.au>
Date: Fri, 23 Sep 2022 20:57:02 +1000
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, haren@linux.ibm.com, leobras.c@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Sep 2022 17:01:11 -0500, Nathan Lynch wrote:
> At the time this was submitted by Leonardo, I confirmed -- or thought
> I had confirmed -- with PowerVM partition firmware development that
> the following RTAS functions:
> 
> - ibm,get-xive
> - ibm,int-off
> - ibm,int-on
> - ibm,set-xive
> 
> [...]

Applied to powerpc/next.

[1/1] Revert "powerpc/rtas: Implement reentrant rtas call"
      https://git.kernel.org/powerpc/c/f88aabad33ea22be2ce1c60d8901942e4e2a9edb

cheers
