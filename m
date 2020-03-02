Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789B175648
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 09:49:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WDMg0JSCzDqYL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 19:49:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WDKn51bwzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 19:47:25 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1j8gjL-0001os-3D; Mon, 02 Mar 2020 02:47:15 -0600
Message-ID: <7f608c18250c509ff091990d4bb460846fae11a0.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Jason Yan <yanaijie@huawei.com>, Daniel Axtens <dja@axtens.net>, 
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, 
 christophe.leroy@c-s.fr, benh@kernel.crashing.org, paulus@samba.org, 
 npiggin@gmail.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com,  me@tobin.cc
Date: Mon, 02 Mar 2020 02:47:13 -0600
In-Reply-To: <17658c2b-9eb8-cee9-e9a2-93d316a401b1@huawei.com>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <87tv3drf79.fsf@dja-thinkpad.axtens.net>
 <8171d326-5138-4f5c-cff6-ad3ee606f0c2@huawei.com>
 <e8cd8f287934954cfa07dcf76ac73492e2d49a5b.camel@buserror.net>
 <dd8db870-b607-3f74-d3bc-a8d9f33f9852@huawei.com>
 <4c0e7fec63dbc7b91fa6c24692c73c256c131f51.camel@buserror.net>
 <188971ed-f1c4-39b3-c07e-89cc593d88d7@huawei.com>
 <530c49dfd97c811dc53ffc78c594d7133f7eb1e9.camel@buserror.net>
 <35e6c660-3896-bdb8-45f3-c1504aa2171f@huawei.com>
 <31b5966ba579ef246176a7d8ad18c2c02788dd27.camel@buserror.net>
 <17658c2b-9eb8-cee9-e9a2-93d316a401b1@huawei.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: yanaijie@huawei.com, dja@axtens.net, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, christophe.leroy@c-s.fr,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com, me@tobin.cc,
 linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v3 0/6] implement KASLR for powerpc/fsl_booke/64
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-02 at 15:12 +0800, Jason Yan wrote:
> 
> 在 2020/3/2 11:24, Scott Wood 写道:
> > On Mon, 2020-03-02 at 10:17 +0800, Jason Yan wrote:
> > > 
> > > 在 2020/3/1 6:54, Scott Wood 写道:
> > > > On Sat, 2020-02-29 at 15:27 +0800, Jason Yan wrote:
> > > > > 
> > > > > Turnning to %p may not be a good idea in this situation. So
> > > > > for the REG logs printed when dumping stack, we can disable it when
> > > > > KASLR is open. For the REG logs in other places like show_regs(),
> > > > > only
> > > > > privileged can trigger it, and they are not combind with a symbol,
> > > > > so
> > > > > I think it's ok to keep them.
> > > > > 
> > > > > diff --git a/arch/powerpc/kernel/process.c
> > > > > b/arch/powerpc/kernel/process.c
> > > > > index fad50db9dcf2..659c51f0739a 100644
> > > > > --- a/arch/powerpc/kernel/process.c
> > > > > +++ b/arch/powerpc/kernel/process.c
> > > > > @@ -2068,7 +2068,10 @@ void show_stack(struct task_struct *tsk,
> > > > > unsigned
> > > > > long *stack)
> > > > >                    newsp = stack[0];
> > > > >                    ip = stack[STACK_FRAME_LR_SAVE];
> > > > >                    if (!firstframe || ip != lr) {
> > > > > -                       printk("["REG"] ["REG"] %pS", sp, ip, (void
> > > > > *)ip);
> > > > > +                       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
> > > > > +                               printk("%pS", (void *)ip);
> > > > > +                       else
> > > > > +                               printk("["REG"] ["REG"] %pS", sp,
> > > > > ip,
> > > > > (void *)ip);
> > > > 
> > > > This doesn't deal with "nokaslr" on the kernel command line.  It also
> > > > doesn't
> > > > seem like something that every callsite should have to opencode,
> > > > versus
> > > > having
> > > > an appropriate format specifier behaves as I described above (and I
> > > > still
> > > > don't see why that format specifier should not be "%p").
> > > > 
> > > 
> > > Actually I still do not understand why we should print the raw value
> > > here. When KALLSYMS is enabled we have symbol name  and  offset like
> > > put_cred_rcu+0x108/0x110, and when KALLSYMS is disabled we have the raw
> > > address.
> > 
> > I'm more concerned about the stack address for wading through a raw stack
> > dump
> > (to find function call arguments, etc).  The return address does help
> > confirm
> > that I'm on the right stack frame though, and also makes looking up a line
> > number slightly easier than having to look up a symbol address and then
> > add
> > the offset (at least for non-module addresses).
> > 
> > As a random aside, the mismatch between Linux printing a hex offset and
> > GDB
> > using decimal in disassembly is annoying...
> > 
> 
> OK, I will send a RFC patch to add a new format specifier such as "%pk" 
> or change the exsiting "%pK" to print raw value of addresses when KASLR 
> is disabled and print hash value of addresses when KASLR is enabled. 
> Let's see what the printk guys would say :)

I'm not sure that a new format specifier is needed versus changing the
behavior of "%p", and "%pK" definitely doesn't seem suitable given that it's
intended to be more restricted than "%p" (see commit ef0010a30935de4).  The
question is whether there is a legitimate reason to hash in the absence of
kaslr.

-Scott


