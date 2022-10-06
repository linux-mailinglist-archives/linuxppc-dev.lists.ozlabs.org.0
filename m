Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7005F6FF4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 23:09:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk3wG5BK1z3dwJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 08:09:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk3vk27gKz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 08:08:49 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 296L4PHf020257;
	Thu, 6 Oct 2022 16:04:25 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 296L4OZK020256;
	Thu, 6 Oct 2022 16:04:24 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 6 Oct 2022 16:04:23 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static calls
Message-ID: <20221006210423.GV25951@gate.crashing.org>
References: <20221005053234.29312-1-bgray@linux.ibm.com> <20221005053234.29312-6-bgray@linux.ibm.com> <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu> <878rltpyy1.fsf@mpe.ellerman.id.au> <20221006182254.GR25951@gate.crashing.org> <2bb8accb-30c0-67e6-7ad5-36c02d46a2cd@csgroup.eu> <20221006204533.GU25951@gate.crashing.org> <0c92ba89-4cad-524a-4c02-8064d451b7b6@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c92ba89-4cad-524a-4c02-8064d451b7b6@csgroup.eu>
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

On Thu, Oct 06, 2022 at 08:50:31PM +0000, Christophe Leroy wrote:
> Le 06/10/2022 à 22:45, Segher Boessenkool a écrit :
> > I meant just an indicative code size number...  100 bytes, 100kB, 100MB,
> > or something like that :-)  And, on 64 bit, which is what the question
> > was about!
> 
> Ah, does the size really matters here ? I was thinking more in terms of 
> performance when I made the comment.

Other than some unused code there should not be much performance impact
at all from enabling modules when not needed, on 64 bit.  Security (in
depth) is a very different kettle of fish of course ;-)


Segher
