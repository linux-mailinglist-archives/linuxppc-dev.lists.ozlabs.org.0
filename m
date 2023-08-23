Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B567857BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4sZ5JLtz3c3r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:14:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cx18zlz3c12
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cw6t87z4x2b;
	Wed, 23 Aug 2023 22:04:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20230609071404.425529-1-hbathini@linux.ibm.com>
References: <20230609071404.425529-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/fadump: invoke ibm,os-term with rtas_call_unlocked()
Message-Id: <169279175576.797584.334285969180052100.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 09 Jun 2023 12:44:04 +0530, Hari Bathini wrote:
> Invoke ibm,os-term call with rtas_call_unlocked(), without using the
> RTAS spinlock, to avoid deadlock in the unlikely event of a machine
> crash while making an RTAS call.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/fadump: invoke ibm,os-term with rtas_call_unlocked()
      https://git.kernel.org/powerpc/c/b949ee6801f4a47ae0e02845242c99af351c4d26

cheers
