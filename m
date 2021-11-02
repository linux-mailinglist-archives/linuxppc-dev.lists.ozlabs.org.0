Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE8C442D20
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Vd3wDnz30CK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:49:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7G15273z3bhg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7G148Xjz4xdc;
 Tue,  2 Nov 2021 22:38:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211004145749.1331331-1-npiggin@gmail.com>
References: <20211004145749.1331331-1-npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: H_ENTER filter out reserved HPTE[B]
 value
Message-Id: <163584789016.1845480.2757100550456404160.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:30 +1100
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

On Tue, 5 Oct 2021 00:57:49 +1000, Nicholas Piggin wrote:
> The HPTE B field is a 2-bit field with values 0b10 and 0b11 reserved.
> This field is also taken from the HPTE and used when KVM executes
> TLBIEs to set the B field of those instructions.
> 
> Disallow the guest setting B to a reserved value with H_ENTER by
> rejecting it. This is the same approach already taken for rejecting
> reserved (unsupported) LLP values. This prevents the guest from being
> able to induce the host to execute TLBIE with reserved values, which
> is not known to be a problem with current processors but in theory it
> could prevent the TLBIE from working correctly in a future processor.
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S HV: H_ENTER filter out reserved HPTE[B] value
      https://git.kernel.org/powerpc/c/322fda0405fecaaa540b0fa90393830aaadaf420

cheers
