Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3558E1EC2FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 21:43:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c2Wx3Z5rzDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 05:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c2VC2tKrzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 05:41:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49c2VC1kLDz8tRl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 05:41:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49c2VC1Bvnz9sSc; Wed,  3 Jun 2020 05:41:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by ozlabs.org (Postfix) with ESMTP id 49c2VB1vbQz9sSF
 for <linuxppc-dev@ozlabs.org>; Wed,  3 Jun 2020 05:41:36 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 052JfYfB007295;
 Tue, 2 Jun 2020 14:41:34 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 052JfX01007294;
 Tue, 2 Jun 2020 14:41:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 2 Jun 2020 14:41:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH 1/4] powerpc: Add a ppc_inst_as_str() helper
Message-ID: <20200602194133.GT31009@gate.crashing.org>
References: <20200602052728.18227-1-jniethe5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602052728.18227-1-jniethe5@gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@ozlabs.org, alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 02, 2020 at 03:27:25PM +1000, Jordan Niethe wrote:
> There are quite a few places where instructions are printed, this is
> done using a '%x' format specifier. With the introduction of prefixed
> instructions, this does not work well. Currently in these places,
> ppc_inst_val() is used for the value for %x so only the first word of
> prefixed instructions are printed.
> 
> When the instructions are word instructions, only a single word should
> be printed. For prefixed instructions both the prefix and suffix should
> be printed. To accommodate both of these situations, instead of a '%x'
> specifier use '%s' and introduce a helper, __ppc_inst_as_str() which
> returns a char *. The char * __ppc_inst_as_str() returns is buffer that
> is passed to it by the caller.
> 
> It is cumbersome to require every caller of __ppc_inst_as_str() to now
> declare a buffer. To make it more convenient to use __ppc_inst_as_str(),
> wrap it in a macro that uses a compound statement to allocate a buffer
> on the caller's stack before calling it.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

> +#define PPC_INST_STR_LEN sizeof("0x00000000 0x00000000")

sizeof is not a function or anything function-like; it's just an
operator, like (unary) "+" or "-" or dereference "*".  The parentheses
are completely redundant here.  And it kind of matters, as written a
reader might think that a string object is actually constructed here.

But, so very many people do this, I'm not going to fight this fight ;-)


Segher
