Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013A532854
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6rjJ2nLwz3f7m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6rfc6t0Bz3bq7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 20:54:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6rfb6pcwz4ySl;
 Tue, 24 May 2022 20:53:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, paulus@samba.org, benh@kernel.crashing.org,
 Bo Liu <liubo03@inspur.com>
In-Reply-To: <20220401065252.36472-1-liubo03@inspur.com>
References: <20220401065252.36472-1-liubo03@inspur.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: fix the return value of
 kvm_age_rmapp()
Message-Id: <165338950884.1711920.1652922231071058504.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 20:51:48 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 Apr 2022 02:52:52 -0400, Bo Liu wrote:
> The return value type defined in the function kvm_age_rmapp() is
> "bool", but the return value type defined in the implementation of the
> function kvm_age_rmapp() is "int".
> 
> Change the return value type to "bool".
> 
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: fix the return value of kvm_age_rmapp()
      https://git.kernel.org/powerpc/c/15eb1b6afc3c73bcd44b5d265d43db666950b5af

cheers
