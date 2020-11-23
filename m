Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FC2C14EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 21:01:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfyhh6ZCbzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:01:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cfyfb5TrYzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 06:59:33 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0ANJuNs0017906;
 Mon, 23 Nov 2020 13:56:23 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0ANJuMUw017905;
 Mon, 23 Nov 2020 13:56:22 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 23 Nov 2020 13:56:22 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
Message-ID: <20201123195622.GI2672@gate.crashing.org>
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com>
 <87d0041vaf.fsf@mpe.ellerman.id.au> <20201123063432.GG2672@gate.crashing.org>
 <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Please don't top-post.)

> On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > "true" (as a result of a comparison) in as is -1, not 1.

On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill Wendling wrote:
> What Segher said. :-) Also, if you reverse the comparison, you'll get
> a build error.

But that means your patch is the wrong way around?

-	.ifgt (label##4b- label##3b)-(label##2b- label##1b);	\
-	.error "Feature section else case larger than body";	\
-	.endif;							\
+	.org . - ((label##4b-label##3b) > (label##2b-label##1b)); \

It should be a + in that last line, not a -.  Was this tested?


Segher
