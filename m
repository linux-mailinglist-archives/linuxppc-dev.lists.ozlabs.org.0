Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E623F3AC255
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mD04vvpz3cYw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4P2JZKz2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:01 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4N1Fn8z9sSs; Fri, 18 Jun 2021 14:22:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210614120907.1952321-1-dja@axtens.net>
References: <20210614120907.1952321-1-dja@axtens.net>
Subject: Re: [PATCH v2] powerpc: make stack walking KASAN-safe
Message-Id: <162398829800.1363949.16670881806917843786.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:38 +1000
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Jun 2021 22:09:07 +1000, Daniel Axtens wrote:
> Make our stack-walking code KASAN-safe by using __no_sanitize_address.
> Generic code, arm64, s390 and x86 all make accesses unchecked for similar
> sorts of reasons: when unwinding a stack, we might touch memory that KASAN
> has marked as being out-of-bounds. In ppc64 KASAN development, I hit this
> sometimes when checking for an exception frame - because we're checking
> an arbitrary offset into the stack frame.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: make stack walking KASAN-safe
      https://git.kernel.org/powerpc/c/b112fb913b5b5705db22efa90ec60f42518934af

cheers
