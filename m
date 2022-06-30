Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E4561FDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 18:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYjl75x7hz3dsX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 02:02:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYjkh3vWMz3blX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 02:01:47 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25UFwEc4007186;
	Thu, 30 Jun 2022 10:58:14 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25UFwBWR007180;
	Thu, 30 Jun 2022 10:58:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 30 Jun 2022 10:58:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Message-ID: <20220630155811.GK25951@gate.crashing.org>
References: <20220624183238.388144-1-sv@linux.ibm.com> <20220624183238.388144-12-sv@linux.ibm.com> <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu> <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com> <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu> <1656572413.pbaqjnrrcl.naveen@linux.ibm.com> <da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu> <1656583960.0nqsj977sr.naveen@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656583960.0nqsj977sr.naveen@linux.ibm.com>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen Zhongjin <chenzhongjin@huawei.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 04:07:47PM +0530, Naveen N. Rao wrote:
> Objtool classifies 'ud2' as INSN_BUG, and 'int3' as INSN_TRAP. In x86 
> BUG(), there is no need for an annotation since objtool assumes that 
> 'ud2' terminates control flow. But, for __WARN_FLAGS(), since 'ud2' is 
> used, an explicit annotate_reachable() is needed. That's _reachable_, to 
> indicate that the control flow can continue with the next instruction.
> 
> On powerpc, we should (eventually) classify all trap variants as 
> INSN_TRAP. Even in the absence of that classification today, objtool 
> assumes that control flow continues with the next instruction. With your 
> work to utilize asm goto for __WARN_FLAGS(), with no extra instructions 
> being generated, I think it is appropriate to just use 
> __builtin_unreachable() and to not use the annotation.
> 
> In any case, we are only hitting this since gcc is generating a 'bl' due 
> to that annotation. We are not yet enabling full objtool validation on 
> powerpc, so I think we can revisit this at that point.

See also <https://gcc.gnu.org/PR99299> that asks for a __builtin_trap()
variant that does not terminate control flow ("that is recoverable").


Segher
