Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB784E9B36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 12:57:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4736QZ5qL9zF4B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 22:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736MX5nz8zF49M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 22:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Q3bsOd5p"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4736MX2lz9z9sPw; Wed, 30 Oct 2019 22:55:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4736MW6WP6z9sPd;
 Wed, 30 Oct 2019 22:55:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572436504;
 bh=SLT7y8UdRpUyT909kJw913q4F0LcCtwq2prDk7artXs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Q3bsOd5pD7yCyf7FI4mpg4KnbIw1FQrRMoGbANaESDmNsyIi54cg6fIwlhZUwf3/E
 aUWjrOJpiGfz8Qr6bh7qbusiCajuFl9kibwmX6CCxSyHS7kcpz3zNeoufxZOJEJVZZ
 4AqOaI5PhT9lIJlyzkChyLurFicTHFZxfuXocQaaQ4IgRWxMZUMgw50uMCIrVQsT8a
 POn+4pS8uVLLnlYSi9FWVESugbkaKjFSiTSkJDbZF2JAoogwfeMbaGZHl8FoJ+Swt0
 KWoPwn3yg7juQNMXEJ0sQ8XRCcc8SHLXgutsZhQI1T5Af2tu86w8G7lRaELVygsJGn
 96FSflb0lQDAQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/tools: Don't quote $objdump in scripts
In-Reply-To: <20191024172857.GS28442@gate.crashing.org>
References: <20191024004730.32135-1-mpe@ellerman.id.au>
 <20191024172857.GS28442@gate.crashing.org>
Date: Wed, 30 Oct 2019 22:55:03 +1100
Message-ID: <87sgnabg88.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Thu, Oct 24, 2019 at 11:47:30AM +1100, Michael Ellerman wrote:
>> Some of our scripts are passed $objdump and then call it as
>> "$objdump". This doesn't work if it contains spaces because we're
>> using ccache, for example you get errors such as:
>> 
>>   ./arch/powerpc/tools/relocs_check.sh: line 48: ccache ppc64le-objdump: No such file or directory
>>   ./arch/powerpc/tools/unrel_branch_check.sh: line 26: ccache ppc64le-objdump: No such file or directory
>> 
>> Fix it by not quoting the string when we expand it, allowing the shell
>> to do the right thing for us.
>
> This breaks things for people with spaces in their paths.

Spaces in their what? Who does that? :)

Also we don't support it:

  $ pwd
  $ /home/michael/foo bar
  $ make clean
  Makefile:147: *** source directory cannot contain spaces or colons.  Stop.

cheers
