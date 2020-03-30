Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE14197650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:19:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rQNG3pmyzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:19:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=bp@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rQKv0YsXzDqjk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:17:07 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C576DAEA1;
 Mon, 30 Mar 2020 08:17:00 +0000 (UTC)
Date: Mon, 30 Mar 2020 10:16:52 +0200
From: Borislav Petkov <bp@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200330081652.GB14624@zn.tnic>
References: <20200330143529.4dafeb34@canb.auug.org.au>
 <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
 <20200330150819.7f0199a2@canb.auug.org.au>
 <20200330074823.GA14624@zn.tnic>
 <87wo72uv3z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wo72uv3z.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 "H.J. Lu" <hjl.tools@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 30, 2020 at 07:04:16PM +1100, Michael Ellerman wrote:
> Or just squash the hunk Stephen posted into the commit, which is what I
> thought would happen to begin with.
> 
> You can have my ack for it:
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks but considering how this is not really urgent stuff and it can
take its time and get some wider testing before getting upstream, I'd
prefer to delay it.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
