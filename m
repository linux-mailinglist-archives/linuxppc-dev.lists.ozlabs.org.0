Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A15ADA64
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 22:46:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM0tb6jwkz3c3m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 06:46:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM0tC3ZR8z2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 06:46:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 285Kh2e6003034;
	Mon, 5 Sep 2022 15:43:03 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 285Kh1Aa003033;
	Mon, 5 Sep 2022 15:43:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 5 Sep 2022 15:43:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 16/16] objtool/powerpc: Add --mcount specific implementation
Message-ID: <20220905204300.GC25951@gate.crashing.org>
References: <20220829055223.24767-1-sv@linux.ibm.com> <20220829055223.24767-17-sv@linux.ibm.com> <5da86617-53f1-d899-336a-53fe691e76ae@csgroup.eu> <20220831175100.GS25951@gate.crashing.org> <1662374555.7eoowv9twf.naveen@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662374555.7eoowv9twf.naveen@linux.ibm.com>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Sep 05, 2022 at 04:15:07PM +0530, Naveen N. Rao wrote:
> Segher Boessenkool wrote:
> >>> +		if ((insn & 3) == 1) {
> >>> +			*type = INSN_CALL;
> >>> +			*immediate = insn & 0x3fffffc;
> >>> +			if (*immediate & 0x2000000)
> >>> +				*immediate -= 0x4000000;
> >>> +		}
> >>> +		break;
> >>> +	}
> >
> >Does this handle AA=1 correctly at all?  That is valid both with and
> >without relocations, just like AA=0.  Same for AA=1 LK=0 btw.
> >
> >If you only handle AA=0, the code should explicitly test for that.
> 
> The code does test for AA=0 LK=1 with the if statement there?

Yes, but that is not what I said :-)

It may be fine to not *handle* AA=1 at all, but the code should at least
scream bloody murder when it encounters it anyway :-)


Segher
