Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3D5F6FBD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 22:50:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk3VV55hDz3dsq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 07:50:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk3Tz1njxz3c5G
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 07:49:58 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 296KjZtM019623;
	Thu, 6 Oct 2022 15:45:35 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 296KjX6j019622;
	Thu, 6 Oct 2022 15:45:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 6 Oct 2022 15:45:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static calls
Message-ID: <20221006204533.GU25951@gate.crashing.org>
References: <20221005053234.29312-1-bgray@linux.ibm.com> <20221005053234.29312-6-bgray@linux.ibm.com> <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu> <878rltpyy1.fsf@mpe.ellerman.id.au> <20221006182254.GR25951@gate.crashing.org> <2bb8accb-30c0-67e6-7ad5-36c02d46a2cd@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bb8accb-30c0-67e6-7ad5-36c02d46a2cd@csgroup.eu>
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 06:38:00PM +0000, Christophe Leroy wrote:
> Le 06/10/2022 à 20:22, Segher Boessenkool a écrit :
> > Long ago I built kernels that fit together with the boot firmware and a
> > root fs (busybox+dropbear essentially) in 4MB, but I doubt we can get
> > close to that at all these days :-)
> 
> 4MB, not easy. But 8M still achievable. Well our smaller board has 32M, 
> we have thousands of it spread all over Europe and have to keep it up to 
> date ....

The smallest of these systems had 256MB RAM.  This 4MB is flash ROM :-)

> > What is the overhead if you enable modules but do not use them, these
> > days?
> 
> On the 8xx it is mainly the instruction TLB miss handler:

I meant just an indicative code size number...  100 bytes, 100kB, 100MB,
or something like that :-)  And, on 64 bit, which is what the question
was about!


Segher
