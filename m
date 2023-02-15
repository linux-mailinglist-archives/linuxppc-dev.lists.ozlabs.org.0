Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35741697C1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyVZ0RNZz3fhQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRJ0wk8z3cNb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRH6t8fz4x82;
	Wed, 15 Feb 2023 23:43:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20230201095933.129482-1-ganeshgr@linux.ibm.com>
References: <20230201095933.129482-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/mce: log the error for all unrecoverable errors
Message-Id: <167646483338.1421441.8680794318898293422.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:33 +1100
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Feb 2023 15:29:33 +0530, Ganesh Goudar wrote:
> For all unrecoverable errors we are missing to log the
> error, Since machine_check_log_err() is not getting called
> for unrecoverable errors. machine_check_log_err() is called
> from deferred handler, To run deferred handlers we have to do
> irq work raise from the exception handler.
> 
> For recoverable errors exception vector code takes care of
> running deferred handlers.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mce: log the error for all unrecoverable errors
      https://git.kernel.org/powerpc/c/2115732e548304e52ca1bbdb714f45f4a2461653

cheers
