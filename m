Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33715549C28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 20:51:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMLHv1TYNz3cgq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 04:51:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMLHR30vzz3bl5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 04:50:42 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25DImV3Z010741;
	Mon, 13 Jun 2022 13:48:31 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25DImVsl010740;
	Mon, 13 Jun 2022 13:48:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 13 Jun 2022 13:48:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Message-ID: <20220613184830.GW25951@gate.crashing.org>
References: <20220601054850.250287-1-rmclure@linux.ibm.com> <20220601160023.GV25951@gate.crashing.org> <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com> <d79992ce-d49b-314a-cb64-8804f43f6c03@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d79992ce-d49b-314a-cb64-8804f43f6c03@csgroup.eu>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 11, 2022 at 08:42:27AM +0000, Christophe Leroy wrote:
> Le 10/06/2022 à 05:32, Rohan McLure a écrit :
> > .macro ZERO_REGS start, end
> > 	.Lreg=\start
> > 	.rept (\end - \start + 1)
> > 	li	.Lreg, 0
> > 	.Lreg=.Lreg+1
> > 	.endr
> > .endm
> 
> I'd have a preference for using a verb, for instance ZEROISE_REGS or 
> CLEAR_REGS

"Zero" is a verb as well (as well as a noun and an adjective) :-)


Segher
