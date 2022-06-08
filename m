Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9B543AA5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 19:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJDwy1V52z3cBh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:38:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJDwY5slRz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 03:38:36 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 258HaR2c024563;
	Wed, 8 Jun 2022 12:36:27 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 258HaR86024562;
	Wed, 8 Jun 2022 12:36:27 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 8 Jun 2022 12:36:27 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: ppc64le bzImage and Build_id elf note
Message-ID: <20220608173627.GO25951@gate.crashing.org>
References: <CAK18DXZKs2PNmLndeGYqkPxmrrBR=6ca3bhyYCj=GhyA7dHfAQ@mail.gmail.com> <874k0vgyo6.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874k0vgyo6.fsf@mpe.ellerman.id.au>
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
Cc: Donald Zickus <dzickus@redhat.com>, Justin Forbes <jforbes@redhat.com>, Bruno Goncalves <bgoncalv@redhat.com>, Daniel Horak <dhorak@redhat.com>, Veronika Kabatova <vkabatov@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 09:52:25PM +1000, Michael Ellerman wrote:
> What's the motivation for using the zImage?

You cannot boot a vmlinux from OF directly, with most PowerPC OF
implementations.  You *can* boot a zImage directly (with some
trickery sometimes).  That is one reason to use zImage, probably not
a very important reason for most people though.


Segher
